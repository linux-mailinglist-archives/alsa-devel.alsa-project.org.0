Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE982D41E6
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 13:18:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ACC616B4;
	Wed,  9 Dec 2020 13:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ACC616B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607516291;
	bh=MLouGsvTIVMjk/csBLVI0/VHDmXyaUw7sp8A7sa26Rc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lNga8AujwoCEoGB1Zs1/JMx524/J5n9dIzkJc839HZ0nSqcULzKYr8mGdsoFPbqlQ
	 1IHuXmngh0uCLZSYn6mZzq4XqQn4nkV/sOuh0P+TWpslrOAQc3J82Zet3W8Pl2+wCC
	 cdCoTFZ5Ut7pST2BdzXf3VbNR9rUyEFfWoKuSWtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85562F800E1;
	Wed,  9 Dec 2020 13:16:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17444F8020D; Wed,  9 Dec 2020 13:16:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=KHOP_HELO_FCRDNS, MISSING_MID, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from roobarb.jellybean.co.uk (roobarb.crazydogs.org [46.235.224.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59967F800E1
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 13:16:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59967F800E1
Received: from localhost ([127.0.0.1])
 by roobarb.jellybean.co.uk with esmtp (Exim 4.92)
 (envelope-from <bjb-alsa-devel@deus.net>)
 id 1kmyON-00081C-NA; Wed, 09 Dec 2020 12:16:23 +0000
Date: Wed, 9 Dec 2020 12:16:23 +0000
From: Ben Bell <bjb-alsa-devel@deus.net>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Behringer WING usb audio - cyclic xruns dependent on
 periods/buffers
References: <20201126180612.E3E0CF80166@alsa1.perex.cz>
 <s5hblfjjguc.wl-tiwai@suse.de>
 <20201128093612.48C0CF80166@alsa1.perex.cz>
 <20201203200633.CC66A2C16F@relay2.suse.de>
 <s5hblfa575t.wl-tiwai@suse.de>
 <20201205144406.854292C16C@relay2.suse.de>
 <s5hv9dcwhlx.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <s5hv9dcwhlx.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: bjb-alsa-devel@deus.net
X-SA-Exim-Scanned: No (on roobarb.jellybean.co.uk);
 SAEximRunCond expanded to false
Message-Id: <20201209121634.17444F8020D@alsa1.perex.cz>
Cc: alsa-devel@alsa-project.org
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


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[...]
> > and learning abobut it led me to conclude that the Wing needs an entry in
> > the quirks list in set_sync_ep_implicit_fb_quirk to properly enable it:
> > 
> > --- sound/usb/pcm.c.orig        2020-11-22 23:36:08.000000000 +0000
> > +++ sound/usb/pcm.c     2020-12-05 08:40:21.639600074 +0000
> > @@ -340,6 +345,7 @@
> >                 ep = 0x81;
> >                 ifnum = 3;
> >                 goto add_sync_ep_from_ifnum;
> > +       case USB_ID(0x1397, 0x050b): /* Behringer Wing */
> >         case USB_ID(0x0763, 0x2080): /* M-Audio FastTrack Ultra */
> >         case USB_ID(0x0763, 0x2081):
> > 
> > A week's worth of debugging and learning yielded a one line patch ;)
> 
> That's a interesting piece of information :)
> 
> Could you give lsusb -v output of the device?  With the latest patch
> set, the driver can set up the implicit feedback mode automatically in
> certain cases.  I'm not sure whether Behringer device follows that
> pattern.  If not, we'd need to add the quirk manually.

I did wonder whether it was possible to automate this, as all I did
was looked out the endpoint with the Implicit Feedback flag set.
Fingers crossed it'll work.

Output attached.

bjb



--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="behringer-wing-1397-050b-lsusb.txt"


Bus 009 Device 005: ID 1397:050b BEHRINGER International GmbH 
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x1397 BEHRINGER International GmbH
  idProduct          0x050b 
  bcdDevice            1.02
  iManufacturer           1 BEHRINGER
  iProduct                3 WING
  iSerial                 2 WING-PP-09110504
  bNumConfigurations      2
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0323
    bNumInterfaces          5
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xc0
      Self Powered
    MaxPower                0mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         3
      bFunctionClass          1 Audio
      bFunctionSubClass       0 
      bFunctionProtocol      32 
      iFunction               0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol     32 
      iInterface              3 WING
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               2.00
        bCategory               8
        wTotalLength       0x01df
        bmControls           0x00
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype     10 (CLOCK_SOURCE)
        bClockID               41
        bmAttributes            1 Internal fixed clock 
        bmControls           0x07
          Clock Frequency Control (read/write)
          Clock Validity Control (read-only)
        bAssocTerminal          0
        iClockSource            9 WING Internal Clock
      AudioControl Interface Descriptor:
        bLength                17
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             2
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bCSourceID             41
        bNrChannels            48
        bmChannelConfig    0x00000000
        iChannelNames          18 Out 1
        bmControls         0x0000
        iTerminal               6 WING Output
      AudioControl Interface Descriptor:
        bLength               202
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                10
        bSourceID               2
        bmaControls(0)    0x00000000
        bmaControls(1)    0x00000000
        bmaControls(2)    0x00000000
        bmaControls(3)    0x00000000
        bmaControls(4)    0x00000000
        bmaControls(5)    0x00000000
        bmaControls(6)    0x00000000
        bmaControls(7)    0x00000000
        bmaControls(8)    0x00000000
        bmaControls(9)    0x00000000
        bmaControls(10)    0x00000000
        bmaControls(11)    0x00000000
        bmaControls(12)    0x00000000
        bmaControls(13)    0x00000000
        bmaControls(14)    0x00000000
        bmaControls(15)    0x00000000
        bmaControls(16)    0x00000000
        bmaControls(17)    0x00000000
        bmaControls(18)    0x00000000
        bmaControls(19)    0x00000000
        bmaControls(20)    0x00000000
        bmaControls(21)    0x00000000
        bmaControls(22)    0x00000000
        bmaControls(23)    0x00000000
        bmaControls(24)    0x00000000
        bmaControls(25)    0x00000000
        bmaControls(26)    0x00000000
        bmaControls(27)    0x00000000
        bmaControls(28)    0x00000000
        bmaControls(29)    0x00000000
        bmaControls(30)    0x00000000
        bmaControls(31)    0x00000000
        bmaControls(32)    0x00000000
        bmaControls(33)    0x00000000
        bmaControls(34)    0x00000000
        bmaControls(35)    0x00000000
        bmaControls(36)    0x00000000
        bmaControls(37)    0x00000000
        bmaControls(38)    0x00000000
        bmaControls(39)    0x00000000
        bmaControls(40)    0x00000000
        bmaControls(41)    0x00000000
        bmaControls(42)    0x00000000
        bmaControls(43)    0x00000000
        bmaControls(44)    0x00000000
        bmaControls(45)    0x00000000
        bmaControls(46)    0x00000000
        bmaControls(47)    0x00000000
        bmaControls(48)    0x00000000
        iFeature                0 
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID            20
        wTerminalType      0x0301 Speaker
        bAssocTerminal          0
        bSourceID              10
        bCSourceID             41
        bmControls         0x0000
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                17
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bCSourceID             41
        bNrChannels            48
        bmChannelConfig    0x00000000
        iChannelNames          66 In 1
        bmControls         0x0000
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength               202
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                11
        bSourceID               1
        bmaControls(0)    0x00000000
        bmaControls(1)    0x00000000
        bmaControls(2)    0x00000000
        bmaControls(3)    0x00000000
        bmaControls(4)    0x00000000
        bmaControls(5)    0x00000000
        bmaControls(6)    0x00000000
        bmaControls(7)    0x00000000
        bmaControls(8)    0x00000000
        bmaControls(9)    0x00000000
        bmaControls(10)    0x00000000
        bmaControls(11)    0x00000000
        bmaControls(12)    0x00000000
        bmaControls(13)    0x00000000
        bmaControls(14)    0x00000000
        bmaControls(15)    0x00000000
        bmaControls(16)    0x00000000
        bmaControls(17)    0x00000000
        bmaControls(18)    0x00000000
        bmaControls(19)    0x00000000
        bmaControls(20)    0x00000000
        bmaControls(21)    0x00000000
        bmaControls(22)    0x00000000
        bmaControls(23)    0x00000000
        bmaControls(24)    0x00000000
        bmaControls(25)    0x00000000
        bmaControls(26)    0x00000000
        bmaControls(27)    0x00000000
        bmaControls(28)    0x00000000
        bmaControls(29)    0x00000000
        bmaControls(30)    0x00000000
        bmaControls(31)    0x00000000
        bmaControls(32)    0x00000000
        bmaControls(33)    0x00000000
        bmaControls(34)    0x00000000
        bmaControls(35)    0x00000000
        bmaControls(36)    0x00000000
        bmaControls(37)    0x00000000
        bmaControls(38)    0x00000000
        bmaControls(39)    0x00000000
        bmaControls(40)    0x00000000
        bmaControls(41)    0x00000000
        bmaControls(42)    0x00000000
        bmaControls(43)    0x00000000
        bmaControls(44)    0x00000000
        bmaControls(45)    0x00000000
        bmaControls(46)    0x00000000
        bmaControls(47)    0x00000000
        bmaControls(48)    0x00000000
        iFeature                0 
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID            22
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID              11
        bCSourceID             41
        bmControls         0x0000
        iTerminal               7 WING Input
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32 
      iInterface              4 WING Output Terminal
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32 
      iInterface              4 WING Output Terminal
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           2
        bmControls           0x00
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels            48
        bmChannelConfig    0x00000000
        iChannelNames          18 Out 1
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            3
        bBitResolution         24
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x03f0  1x 1008 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         2 Decoded PCM samples
          wLockDelay         0x0008
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32 
      iInterface              5 WING Input Terminal
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32 
      iInterface              5 WING Input Terminal
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink          22
        bmControls           0x00
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels            48
        bmChannelConfig    0x00000000
        iChannelNames          66 In 1
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            3
        bBitResolution         24
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes           37
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Implicit feedback Data
        wMaxPacketSize     0x03f0  1x 1008 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         2 Decoded PCM samples
          wLockDelay         0x0008
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0 
      iInterface              0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0009
        bInCollection           1
        baInterfaceNr(0)        1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         1 Audio
      bInterfaceSubClass      3 MIDI Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      MIDIStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x00a1
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               1 Embedded
        bJackID                 1
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               2 External
        bJackID                25
        iJack                  11 WING MIDI DAW 1
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               1 Embedded
        bJackID                 2
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               2 External
        bJackID                26
        iJack                  13 WING MIDI DAW 2
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               1 Embedded
        bJackID                 3
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               2 External
        bJackID                27
        iJack                  15 WING MIDI DAW 3
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               1 Embedded
        bJackID                 4
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               2 External
        bJackID                28
        iJack                  17 WING MIDI Control
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               1 Embedded
        bJackID                 9
        bNrInputPins            1
        baSourceID( 0)         25
        BaSourcePin( 0)         1
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               2 External
        bJackID                17
        bNrInputPins            1
        baSourceID( 0)          1
        BaSourcePin( 0)         1
        iJack                  10 WING MIDI DAW 1
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               1 Embedded
        bJackID                10
        bNrInputPins            1
        baSourceID( 0)         26
        BaSourcePin( 0)         1
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               2 External
        bJackID                18
        bNrInputPins            1
        baSourceID( 0)          2
        BaSourcePin( 0)         1
        iJack                  12 WING MIDI DAW 2
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               1 Embedded
        bJackID                11
        bNrInputPins            1
        baSourceID( 0)         27
        BaSourcePin( 0)         1
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               2 External
        bJackID                19
        bNrInputPins            1
        baSourceID( 0)          3
        BaSourcePin( 0)         1
        iJack                  14 WING MIDI DAW 3
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               1 Embedded
        bJackID                12
        bNrInputPins            1
        baSourceID( 0)         28
        BaSourcePin( 0)         1
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               2 External
        bJackID                20
        bNrInputPins            1
        baSourceID( 0)          4
        BaSourcePin( 0)         1
        iJack                  16 WING MIDI Control
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
        bRefresh                0
        bSynchAddress           0
        MIDIStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (GENERAL)
          bNumEmbMIDIJack         4
          baAssocJackID( 0)       1
          baAssocJackID( 1)       2
          baAssocJackID( 2)       3
          baAssocJackID( 3)       4
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
        bRefresh                0
        bSynchAddress           0
        MIDIStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (GENERAL)
          bNumEmbMIDIJack         4
          baAssocJackID( 0)       9
          baAssocJackID( 1)      10
          baAssocJackID( 2)      11
          baAssocJackID( 3)      12
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0323
    bNumInterfaces          5
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xc0
      Self Powered
    MaxPower                0mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         3
      bFunctionClass          1 Audio
      bFunctionSubClass       0 
      bFunctionProtocol      32 
      iFunction               0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol     32 
      iInterface              3 WING
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               2.00
        bCategory               8
        wTotalLength       0x01df
        bmControls           0x00
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype     10 (CLOCK_SOURCE)
        bClockID               41
        bmAttributes            1 Internal fixed clock 
        bmControls           0x07
          Clock Frequency Control (read/write)
          Clock Validity Control (read-only)
        bAssocTerminal          0
        iClockSource            9 WING Internal Clock
      AudioControl Interface Descriptor:
        bLength                17
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             2
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bCSourceID             41
        bNrChannels            48
        bmChannelConfig    0x00000000
        iChannelNames          18 Out 1
        bmControls         0x0000
        iTerminal               6 WING Output
      AudioControl Interface Descriptor:
        bLength               202
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                10
        bSourceID               2
        bmaControls(0)    0x00000000
        bmaControls(1)    0x00000000
        bmaControls(2)    0x00000000
        bmaControls(3)    0x00000000
        bmaControls(4)    0x00000000
        bmaControls(5)    0x00000000
        bmaControls(6)    0x00000000
        bmaControls(7)    0x00000000
        bmaControls(8)    0x00000000
        bmaControls(9)    0x00000000
        bmaControls(10)    0x00000000
        bmaControls(11)    0x00000000
        bmaControls(12)    0x00000000
        bmaControls(13)    0x00000000
        bmaControls(14)    0x00000000
        bmaControls(15)    0x00000000
        bmaControls(16)    0x00000000
        bmaControls(17)    0x00000000
        bmaControls(18)    0x00000000
        bmaControls(19)    0x00000000
        bmaControls(20)    0x00000000
        bmaControls(21)    0x00000000
        bmaControls(22)    0x00000000
        bmaControls(23)    0x00000000
        bmaControls(24)    0x00000000
        bmaControls(25)    0x00000000
        bmaControls(26)    0x00000000
        bmaControls(27)    0x00000000
        bmaControls(28)    0x00000000
        bmaControls(29)    0x00000000
        bmaControls(30)    0x00000000
        bmaControls(31)    0x00000000
        bmaControls(32)    0x00000000
        bmaControls(33)    0x00000000
        bmaControls(34)    0x00000000
        bmaControls(35)    0x00000000
        bmaControls(36)    0x00000000
        bmaControls(37)    0x00000000
        bmaControls(38)    0x00000000
        bmaControls(39)    0x00000000
        bmaControls(40)    0x00000000
        bmaControls(41)    0x00000000
        bmaControls(42)    0x00000000
        bmaControls(43)    0x00000000
        bmaControls(44)    0x00000000
        bmaControls(45)    0x00000000
        bmaControls(46)    0x00000000
        bmaControls(47)    0x00000000
        bmaControls(48)    0x00000000
        iFeature                0 
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID            20
        wTerminalType      0x0301 Speaker
        bAssocTerminal          0
        bSourceID              10
        bCSourceID             41
        bmControls         0x0000
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                17
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bCSourceID             41
        bNrChannels            48
        bmChannelConfig    0x00000000
        iChannelNames          66 In 1
        bmControls         0x0000
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength               202
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                11
        bSourceID               1
        bmaControls(0)    0x00000000
        bmaControls(1)    0x00000000
        bmaControls(2)    0x00000000
        bmaControls(3)    0x00000000
        bmaControls(4)    0x00000000
        bmaControls(5)    0x00000000
        bmaControls(6)    0x00000000
        bmaControls(7)    0x00000000
        bmaControls(8)    0x00000000
        bmaControls(9)    0x00000000
        bmaControls(10)    0x00000000
        bmaControls(11)    0x00000000
        bmaControls(12)    0x00000000
        bmaControls(13)    0x00000000
        bmaControls(14)    0x00000000
        bmaControls(15)    0x00000000
        bmaControls(16)    0x00000000
        bmaControls(17)    0x00000000
        bmaControls(18)    0x00000000
        bmaControls(19)    0x00000000
        bmaControls(20)    0x00000000
        bmaControls(21)    0x00000000
        bmaControls(22)    0x00000000
        bmaControls(23)    0x00000000
        bmaControls(24)    0x00000000
        bmaControls(25)    0x00000000
        bmaControls(26)    0x00000000
        bmaControls(27)    0x00000000
        bmaControls(28)    0x00000000
        bmaControls(29)    0x00000000
        bmaControls(30)    0x00000000
        bmaControls(31)    0x00000000
        bmaControls(32)    0x00000000
        bmaControls(33)    0x00000000
        bmaControls(34)    0x00000000
        bmaControls(35)    0x00000000
        bmaControls(36)    0x00000000
        bmaControls(37)    0x00000000
        bmaControls(38)    0x00000000
        bmaControls(39)    0x00000000
        bmaControls(40)    0x00000000
        bmaControls(41)    0x00000000
        bmaControls(42)    0x00000000
        bmaControls(43)    0x00000000
        bmaControls(44)    0x00000000
        bmaControls(45)    0x00000000
        bmaControls(46)    0x00000000
        bmaControls(47)    0x00000000
        bmaControls(48)    0x00000000
        iFeature                0 
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID            22
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID              11
        bCSourceID             41
        bmControls         0x0000
        iTerminal               7 WING Input
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32 
      iInterface              4 WING Output Terminal
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32 
      iInterface              4 WING Output Terminal
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           2
        bmControls           0x00
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels            48
        bmChannelConfig    0x00000000
        iChannelNames          18 Out 1
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            3
        bBitResolution         24
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x03f0  1x 1008 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         2 Decoded PCM samples
          wLockDelay         0x0008
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32 
      iInterface              5 WING Input Terminal
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32 
      iInterface              5 WING Input Terminal
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink          22
        bmControls           0x00
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels            48
        bmChannelConfig    0x00000000
        iChannelNames          66 In 1
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            3
        bBitResolution         24
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes           37
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Implicit feedback Data
        wMaxPacketSize     0x03f0  1x 1008 bytes
        bInterval               1
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         2 Decoded PCM samples
          wLockDelay         0x0008
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0 
      iInterface              0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0009
        bInCollection           1
        baInterfaceNr(0)        1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         1 Audio
      bInterfaceSubClass      3 MIDI Streaming
      bInterfaceProtocol      0 
      iInterface              0 
      MIDIStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x00a1
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               1 Embedded
        bJackID                 1
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               2 External
        bJackID                25
        iJack                  11 WING MIDI DAW 1
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               1 Embedded
        bJackID                 2
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               2 External
        bJackID                26
        iJack                  13 WING MIDI DAW 2
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               1 Embedded
        bJackID                 3
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               2 External
        bJackID                27
        iJack                  15 WING MIDI DAW 3
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               1 Embedded
        bJackID                 4
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               2 External
        bJackID                28
        iJack                  17 WING MIDI Control
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               1 Embedded
        bJackID                 9
        bNrInputPins            1
        baSourceID( 0)         25
        BaSourcePin( 0)         1
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               2 External
        bJackID                17
        bNrInputPins            1
        baSourceID( 0)          1
        BaSourcePin( 0)         1
        iJack                  10 WING MIDI DAW 1
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               1 Embedded
        bJackID                10
        bNrInputPins            1
        baSourceID( 0)         26
        BaSourcePin( 0)         1
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               2 External
        bJackID                18
        bNrInputPins            1
        baSourceID( 0)          2
        BaSourcePin( 0)         1
        iJack                  12 WING MIDI DAW 2
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               1 Embedded
        bJackID                11
        bNrInputPins            1
        baSourceID( 0)         27
        BaSourcePin( 0)         1
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               2 External
        bJackID                19
        bNrInputPins            1
        baSourceID( 0)          3
        BaSourcePin( 0)         1
        iJack                  14 WING MIDI DAW 3
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               1 Embedded
        bJackID                12
        bNrInputPins            1
        baSourceID( 0)         28
        BaSourcePin( 0)         1
        iJack                   0 
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               2 External
        bJackID                20
        bNrInputPins            1
        baSourceID( 0)          4
        BaSourcePin( 0)         1
        iJack                  16 WING MIDI Control
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
        bRefresh                0
        bSynchAddress           0
        MIDIStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (GENERAL)
          bNumEmbMIDIJack         4
          baAssocJackID( 0)       1
          baAssocJackID( 1)       2
          baAssocJackID( 2)       3
          baAssocJackID( 3)       4
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
        bRefresh                0
        bSynchAddress           0
        MIDIStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (GENERAL)
          bNumEmbMIDIJack         4
          baAssocJackID( 0)       9
          baAssocJackID( 1)      10
          baAssocJackID( 2)      11
          baAssocJackID( 3)      12
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  bNumConfigurations      1
Device Status:     0x0001
  Self Powered

--bp/iNruPH9dso1Pn--
