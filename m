Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D87AF6130BA
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 07:49:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67EB11661;
	Mon, 31 Oct 2022 07:48:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67EB11661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667198973;
	bh=N89MQFDLIL03usdxnlb/BiCbTY50GOFUdXXeg4KDC6w=;
	h=Date:To:From:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CPkG69/EqTB6KnboKJu/6wmhqGjFzH8/yBRrtfMpyEmlUq20LGOH1cs/bhco9F+0H
	 Bj/63RQLc9vLCtbuXCSF9S+w4NrSBpy4J8jz7lCZF31f5Hezy91o2baPf3mFrXI58K
	 eW5od8NhvFHIoltQ7AcRfjXtW0yhPdCW9oJ3Udpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89639F805AC;
	Mon, 31 Oct 2022 07:45:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74C49F80217; Sun, 30 Oct 2022 23:50:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F03CF800E1
 for <alsa-devel@alsa-project.org>; Sun, 30 Oct 2022 23:50:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F03CF800E1
Received: (Authenticated sender: ash@heyquark.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1FA9AFF802;
 Sun, 30 Oct 2022 22:50:07 +0000 (UTC)
Message-ID: <7ecd4417-d860-4773-c1c1-b07433342390@heyquark.com>
Date: Mon, 31 Oct 2022 09:50:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-AU
To: alsa-devel@alsa-project.org, perex@perex.cz, tiwai@suse.com
From: Ash Logan <ash@heyquark.com>
Subject: Missing USB IDs for M-Audio Micro
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 31 Oct 2022 07:45:35 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello!

I have an M-Audio Micro USB soundcard, which works great, though I have 
to manually add the USB IDs to snd-usb-audio when I want to use it.

echo 0763 201a > /sys/module/snd_usb_audio/drivers/usb\:snd-usb-audio/new_id

I was hoping you could add the IDs somewhere in the driver to enable it 
by default, since the output, input and even bass boost "feature" seem 
to work just fine.

Below is the lsusb information for this device.

Thanks!
Ash

Bus 003 Device 004: ID 0763:201a M-Audio M-Audio Micro
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               1.10
   bDeviceClass          255 Vendor Specific Class
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         8
   idVendor           0x0763 M-Audio
   idProduct          0x201a M-Audio Micro
   bcdDevice            0.08
   iManufacturer           1 M-Audio
   iProduct                2 M-Audio Micro
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0186
     bNumInterfaces          3
     bConfigurationValue     1
     iConfiguration          3 G7 2006/06/08 16:08
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              100mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      1 Control Device
       bInterfaceProtocol      0
       iInterface              0
       AudioControl Interface Descriptor:
         bLength                10
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdADC               1.00
         wTotalLength       0x007c
         bInCollection           2
         baInterfaceNr(0)        1
         baInterfaceNr(1)        2
       AudioControl Interface Descriptor:
         bLength                12
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID            10
         wTerminalType      0x0201 Microphone
         bAssocTerminal          0
         bNrChannels             2
         wChannelConfig     0x0003
           Left Front (L)
           Right Front (R)
         iChannelNames           0
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                12
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID            11
         wTerminalType      0x0603 Line Connector
         bAssocTerminal          0
         bNrChannels             2
         wChannelConfig     0x0003
           Left Front (L)
           Right Front (R)
         iChannelNames           0
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                12
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID            12
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bNrChannels             2
         wChannelConfig     0x0003
           Left Front (L)
           Right Front (R)
         iChannelNames           0
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                13
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                 2
         bSourceID              10
         bControlSize            2
         bmaControls(0)     0x0002
           Volume Control
         bmaControls(1)     0x0000
         bmaControls(2)     0x0000
         iFeature                0
       AudioControl Interface Descriptor:
         bLength                13
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                 3
         bSourceID              11
         bControlSize            2
         bmaControls(0)     0x0002
           Volume Control
         bmaControls(1)     0x0000
         bmaControls(2)     0x0000
         iFeature                0
       AudioControl Interface Descriptor:
         bLength                 8
         bDescriptorType        36
         bDescriptorSubtype      5 (SELECTOR_UNIT)
         bUnitID                 7
         bNrInPins               2
         baSourceID(0)           2
         baSourceID(1)           3
         iSelector               0
       AudioControl Interface Descriptor:
         bLength                13
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                 1
         bSourceID              12
         bControlSize            2
         bmaControls(0)     0x0155
           Mute Control
           Bass Control
           Treble Control
           Automatic Gain Control
           Bass Boost Control
         bmaControls(1)     0x0002
           Volume Control
         bmaControls(2)     0x0002
           Volume Control
         iFeature                0
       AudioControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID            20
         wTerminalType      0x0301 Speaker
         bAssocTerminal          0
         bSourceID               1
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                13
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                 6
         bSourceID               7
         bControlSize            2
         bmaControls(0)     0x0003
           Mute Control
           Volume Control
         bmaControls(1)     0x0000
         bmaControls(2)     0x0000
         iFeature                0
       AudioControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID            13
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID               6
         iTerminal               0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol      0
       iInterface              0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol      0
       iInterface              0
       AudioStreaming Interface Descriptor:
         bLength                 7
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink          12
         bDelay                  0 frames
         wFormatTag         0x0001 PCM
       AudioStreaming Interface Descriptor:
         bLength                14
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bNrChannels             1
         bSubframeSize           2
         bBitResolution         16
         bSamFreqType            0 Continuous
         tLowerSamFreq        6400
         tUpperSamFreq       48000
       Endpoint Descriptor:
         bLength                 9
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            9
           Transfer Type            Isochronous
           Synch Type               Adaptive
           Usage Type               Data
         wMaxPacketSize     0x0064  1x 100 bytes
         bInterval               1
         bRefresh                0
         bSynchAddress           0
         AudioStreaming Endpoint Descriptor:
           bLength                 7
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x01
             Sampling Frequency
           bLockDelayUnits         2 Decoded PCM samples
           wLockDelay         0x0001
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       2
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol      0
       iInterface              0
       AudioStreaming Interface Descriptor:
         bLength                 7
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink          12
         bDelay                  0 frames
         wFormatTag         0x0001 PCM
       AudioStreaming Interface Descriptor:
         bLength                14
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bNrChannels             2
         bSubframeSize           2
         bBitResolution         16
         bSamFreqType            0 Continuous
         tLowerSamFreq        6400
         tUpperSamFreq       48000
       Endpoint Descriptor:
         bLength                 9
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            9
           Transfer Type            Isochronous
           Synch Type               Adaptive
           Usage Type               Data
         wMaxPacketSize     0x00c8  1x 200 bytes
         bInterval               1
         bRefresh                0
         bSynchAddress           0
         AudioStreaming Endpoint Descriptor:
           bLength                 7
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x01
             Sampling Frequency
           bLockDelayUnits         2 Decoded PCM samples
           wLockDelay         0x0001
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol      0
       iInterface              0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol      0
       iInterface              0
       AudioStreaming Interface Descriptor:
         bLength                 7
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink          13
         bDelay                  0 frames
         wFormatTag         0x0001 PCM
       AudioStreaming Interface Descriptor:
         bLength                14
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bNrChannels             1
         bSubframeSize           1
         bBitResolution          8
         bSamFreqType            0 Continuous
         tLowerSamFreq        6400
         tUpperSamFreq       48000
       Endpoint Descriptor:
         bLength                 9
         bDescriptorType         5
         bEndpointAddress     0x84  EP 4 IN
         bmAttributes            9
           Transfer Type            Isochronous
           Synch Type               Adaptive
           Usage Type               Data
         wMaxPacketSize     0x0032  1x 50 bytes
         bInterval               1
         bRefresh                0
         bSynchAddress           0
         AudioStreaming Endpoint Descriptor:
           bLength                 7
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x01
             Sampling Frequency
           bLockDelayUnits         2 Decoded PCM samples
           wLockDelay         0x0001
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       2
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol      0
       iInterface              0
       AudioStreaming Interface Descriptor:
         bLength                 7
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink          13
         bDelay                  0 frames
         wFormatTag         0x0001 PCM
       AudioStreaming Interface Descriptor:
         bLength                14
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bNrChannels             1
         bSubframeSize           2
         bBitResolution         16
         bSamFreqType            0 Continuous
         tLowerSamFreq        6400
         tUpperSamFreq       48000
       Endpoint Descriptor:
         bLength                 9
         bDescriptorType         5
         bEndpointAddress     0x84  EP 4 IN
         bmAttributes            9
           Transfer Type            Isochronous
           Synch Type               Adaptive
           Usage Type               Data
         wMaxPacketSize     0x0064  1x 100 bytes
         bInterval               1
         bRefresh                0
         bSynchAddress           0
         AudioStreaming Endpoint Descriptor:
           bLength                 7
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x01
             Sampling Frequency
           bLockDelayUnits         2 Decoded PCM samples
           wLockDelay         0x0001
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       3
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol      0
       iInterface              0
       AudioStreaming Interface Descriptor:
         bLength                 7
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink          13
         bDelay                  0 frames
         wFormatTag         0x0001 PCM
       AudioStreaming Interface Descriptor:
         bLength                14
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bNrChannels             2
         bSubframeSize           2
         bBitResolution         16
         bSamFreqType            0 Continuous
         tLowerSamFreq        6400
         tUpperSamFreq       48000
       Endpoint Descriptor:
         bLength                 9
         bDescriptorType         5
         bEndpointAddress     0x84  EP 4 IN
         bmAttributes            9
           Transfer Type            Isochronous
           Synch Type               Adaptive
           Usage Type               Data
         wMaxPacketSize     0x00c8  1x 200 bytes
         bInterval               1
         bRefresh                0
         bSynchAddress           0
         AudioStreaming Endpoint Descriptor:
           bLength                 7
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x01
             Sampling Frequency
           bLockDelayUnits         2 Decoded PCM samples
           wLockDelay         0x0001
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0000
   (Bus Powered)
