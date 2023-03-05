//
//  main.m
//  MidiCtrl
//
//  Created by David Davis on 3/5/23.
//

#import <Foundation/Foundation.h>
#import "MIDIWrapper.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MIDIWrapper *midi = [[MIDIWrapper alloc] initWithClientName:@"Client" inPort:@"Input Port" outPort:@"Output Port"];
        
        NSLog(@"%@", [midi getDeviceList]);
        
        MIDIDeviceRef launchpadX = [midi getDevice:@"Launchpad X" ];
        NSLog(@"%@", [midi getInformationAboutDevice: launchpadX]);
        
        NSArray *command = [NSArray arrayWithObjects:[NSNumber numberWithUnsignedInt:0x90], [NSNumber numberWithUnsignedInt:0x0B], [NSNumber numberWithUnsignedInt:0x05],nil];
        
        [midi sendData: command withDevice: launchpadX entityIndex:1];
    }
    return 0;
}
