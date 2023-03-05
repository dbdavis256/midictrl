//
//  main.m
//  MidiCtrl
//
//  Created by David Davis on 3/5/23.
//

#import <Foundation/Foundation.h>
#import "MIDIWrapper.h"
#import "MidiInputHandler.h"
#import "MidiInputHandlerNov.h"

int main(int argc, const char * argv[]) {
    NSRunLoop *runLoop;
    
    @autoreleasepool {
        // Connect a novation launchpad X to a MidiInputHandlerNov object for light displays
        MidiInputHandlerNov *novInputHandler = [[MidiInputHandlerNov alloc] init];
        
        // Connect a Boss RC-500 with a Uno MIDI interface to a MidiInputHandler object for mouse clicks
        MidiInputHandler *inputHandler = [[MidiInputHandler alloc] init];
        
        runLoop = [NSRunLoop currentRunLoop];
        while((([runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:2]])));
    }
    return 0;
}
