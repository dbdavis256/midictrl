//
//  MidiInputHandler.m
//  MidiTest
//
//  Created by David Davis on 1/16/23.
//

#import "MidiInputHandler.h"

@implementation MidiInputHandler

CGPoint getMouseLoc() {
    CGPoint mouseLoc = [NSEvent mouseLocation];
    NSRect frame = [[NSScreen mainScreen] frame];
    mouseLoc.y = frame.size.height - mouseLoc.y;
    return mouseLoc;
}

-(id)init {
    if (self = [super init]) {
        midi = [[MIDIWrapper alloc] initWithClientName:@"Boss Client" inPort:@"Input Port2" outPort:@"Output Port2"];
        pedal = [midi getDevice:@"USB Uno MIDI Interface" ];
        //NSLog(@"%@", [midi2 getInformationAboutDevice: pedal]);
        [midi connectDevice: pedal deviceIndex:0];
        [midi setReceiver: self];
        
        mouseForwardLoc = CGPointMake(0,0);
        mouseBackLoc = CGPointMake(0,0);
    }
    return self;
}

- (void)receiveMIDIInput: (NSArray *)packet {
    if ([packet[0] intValue] != 176) return;
    
    NSLog(@"%@", packet);
    
    CGPoint mouseLoc;
    
    if ([packet[1] intValue] == 1) {
        if (mouseForwardLoc.x == 0 && mouseForwardLoc.y == 0) {
            mouseForwardLoc = getMouseLoc();
            return;
        } else {
            mouseLoc = mouseForwardLoc;
        }
    } else if ([packet[1] intValue] == 2) {
        if (mouseBackLoc.x == 0 && mouseBackLoc.y == 0) {
            mouseBackLoc = getMouseLoc();
            return;
        } else {
            mouseLoc = mouseBackLoc;
        }
    } else {
        mouseForwardLoc = CGPointMake(0,0);
        mouseBackLoc = CGPointMake(0,0);
        return;
    }

    // Create MouseDown event
    CGEventRef click1_down = CGEventCreateMouseEvent(
            NULL, kCGEventLeftMouseDown,
            mouseLoc,
            kCGMouseButtonLeft
            );

    // Create MouseUp event
    CGEventRef click1_up = CGEventCreateMouseEvent(
            NULL, kCGEventLeftMouseUp,
            mouseLoc,
            kCGMouseButtonLeft
            );
    
    //CGEventSetType(click1_down, kCGEventLeftMouseDown);
    CGEventPost(kCGHIDEventTap, click1_down);
    
    //CGEventSetType(click1_up, kCGEventLeftMouseUp);
    CGEventPost(kCGHIDEventTap, click1_up);
    
    CFRelease(click1_down);
    CFRelease(click1_up);
}

@end
