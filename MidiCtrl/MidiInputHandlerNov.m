//
//  MidiInputHandler.m
//  MidiTest
//
//  Created by David Davis on 1/16/23.
//

#import "MidiInputHandlerNov.h"

@implementation MidiInputHandlerNov

-(id)init {
    if (self = [super init]) {
        midi = [[MIDIWrapper alloc] initWithClientName:@"Launchpad Client" inPort:@"Input Port" outPort:@"Output Port"];
        //NSLog(@"%@", [midi getDeviceList]);
        launchpadX = [midi getDevice:@"Launchpad X" ];
        //NSLog(@"%@", [midi getInformationAboutDevice: launchpadX]);
        [midi connectDevice: launchpadX deviceIndex:1];
        [midi setReceiver: self];
    }
    return self;
}

- (void)receiveMIDIInput: (NSArray *)packet {
    NSLog(@"%@", packet);
    
    NSArray *command = [NSArray arrayWithObjects:[NSNumber numberWithUnsignedInt:0x90], packet[1], [NSNumber numberWithUnsignedInt:0x05],nil];
    [midi sendData: command withDevice: launchpadX deviceIndex:1];
}

@end
