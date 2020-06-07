//
//  FSEventUnofficialWrapperStreamEventID.swift
//  EonilFSEventStreamWrapper
//
//  Created by Hoon H. on 2016/10/02.
//
//

import Foundation

public struct FSEventUnofficialWrapperStreamEventID: Hashable {
    internal let rawValue: FSEventStreamEventId
    public init(rawValue: FSEventStreamEventId) {
        self.rawValue = rawValue
    }
    fileprivate init(rawValue: UInt) {
        self.rawValue = FSEventStreamEventId(UInt32(truncatingIfNeeded: rawValue))
    }
}
public func == (a: FSEventUnofficialWrapperStreamEventID, b: FSEventUnofficialWrapperStreamEventID) -> Bool {
    return a.rawValue == b.rawValue
}

public extension FSEventUnofficialWrapperStreamEventID {
    static var now: FSEventUnofficialWrapperStreamEventID {
        return FSEventUnofficialWrapperStreamEventID(rawValue: kFSEventStreamEventIdSinceNow)
    }
    /*
     *  FSEventsGetCurrentEventId()
     *
     *  Discussion:
     *    Fetches the most recently generated event ID, system-wide (not
     *    just for one stream). By thetime it is returned to your
     *    application even newer events may have already been generated.
     *
     *  Result:
     *    The event ID of the most recent event generated by the system.
     *
     *  Availability:
     *    Mac OS X:         in version 10.5 and later in CoreServices.framework
     *    CarbonLib:        not available
     *    Non-Carbon CFM:   not available
     */
    @available(macOS, introduced: 10.5)
    @available(iOS, introduced: 6.0)
    static func getCurrentEventId() -> FSEventUnofficialWrapperStreamEventID {
        let eventId = FSEventsGetCurrentEventId()
        return FSEventUnofficialWrapperStreamEventID(rawValue: eventId)
    }
}
