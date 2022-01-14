Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6F948E290
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 03:35:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9592E1FC4;
	Fri, 14 Jan 2022 03:34:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9592E1FC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642127734;
	bh=kVNDqTIKtKv8P0J4+POJrtb6vg3SIU1HDO0lOpQs6uc=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k0G4PjSC5G2p9pWlZQ/FE26DJ6axRNWdYNAqHYdHpj+QtYehduqyofPFeKeiLeWIZ
	 BRxZ1QygHd4Xda5ZDAX7guhyMDoukS5n/rG5tcTOvDU9gnhgHrh/FVLTY+mZYyBYR2
	 KLTrQV13PGQS0zA90VJSi0BlTs8kY49ihBtSF5rk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BC3CF80310;
	Fri, 14 Jan 2022 03:34:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1173F800CE; Fri, 14 Jan 2022 03:34:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from server1.nandakumar.co.in (nandakumar.co.in [198.100.152.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 205C0F800CE
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 03:34:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 205C0F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nandakumar.co.in header.i=@nandakumar.co.in
 header.b="b4fxQtFt"
Received: from [192.168.100.185] (unknown [61.3.112.72])
 by server1.nandakumar.co.in (Postfix) with ESMTPSA id AD20AC816B;
 Fri, 14 Jan 2022 02:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nandakumar.co.in;
 s=mail; t=1642127654;
 bh=kVNDqTIKtKv8P0J4+POJrtb6vg3SIU1HDO0lOpQs6uc=;
 h=Date:To:References:Cc:From:Subject:In-Reply-To:From;
 b=b4fxQtFtrJe3BSHdJby9VyCmQ5P3ttqshoTdbbLqJZHZSpTI/eA3tq6BQ8oFKFR+b
 uIujJU42AE/CEhg0Ss6BLnXMWpo8Szy3LbBwoxDwJlnZlHd6f8ra2oTsNwjI6xeoEI
 fv/2ndB2SzLmFBJ9NytSfjwbDr0NBMSqj8Qo/ULs=
Message-ID: <e1a7d67d-9862-3085-4e01-091ca443d2df@nandakumar.co.in>
Date: Fri, 14 Jan 2022 08:04:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-GB
To: Geraldo Nascimento <geraldogabriel@gmail.com>
References: <d61a41eb-a820-b1ca-dcf6-f447f80494a8@nandakumar.co.in>
 <YeB2zEnPlwVEKbTI@geday>
From: Nandakumar Edamana <nandakumar@nandakumar.co.in>
Subject: Re: Behringer UMC202HD issues and a partial solution
In-Reply-To: <YeB2zEnPlwVEKbTI@geday>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Thank you very much for the kind reply.

> You made the dmesg warning go away, but that didn't necessarily solve
> the underlying issue. May I ask that you post the "lsusb -v -d
> 1397:0507" ?

Here it is, connected to a USB 2.0 port (xHCI still enabled).

$ lsusb -v -d 1397:0507 > lsusb_-v.txt
can't get debug descriptor: Resource temporarily unavailable


Bus 003 Device 011: ID 1397:0507 BEHRINGER International GmbH UMC202HD 192k
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x1397 BEHRINGER International GmbH
   idProduct          0x0507
   bcdDevice            1.00
   iManufacturer           1 BEHRINGER
   iProduct                2 UMC202HD 192k
   iSerial                 3 12345678
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x011d
     bNumInterfaces          4
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              500mA
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         0
       bInterfaceCount         3
       bFunctionClass          1 Audio
       bFunctionSubClass       0
       bFunctionProtocol      32
       iFunction               0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      1 Control Device
       bInterfaceProtocol     32
       iInterface              0
       AudioControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdADC               2.00
         bCategory               8
         wTotalLength       0x0077
         bmControls           0x01
           Latency control Control (read-only)
       AudioControl Interface Descriptor:
         bLength                 8
         bDescriptorType        36
         bDescriptorSubtype     10 (CLOCK_SOURCE)
         bClockID               41
         bmAttributes            3 Internal programmable clock
         bmControls           0x07
           Clock Frequency Control (read/write)
           Clock Validity Control (read-only)
         bAssocTerminal          0
         iClockSource           10 Internal
       AudioControl Interface Descriptor:
         bLength                 8
         bDescriptorType        36
         bDescriptorSubtype     11 (CLOCK_SELECTOR)
         bClockID               40
         bNrInPins               1
         baCSourceID(0)         41
         bmControls           0x03
           Clock Selector Control (read/write)
         iClockSelector          0
       AudioControl Interface Descriptor:
         bLength                17
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID             2
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bCSourceID             40
         bNrChannels             2
         bmChannelConfig    0x00000000
         iChannelNames         192 Out 1
         bmControls         0x0000
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                18
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                10
         bSourceID               2
         bmaControls(0)     0x0000000f
           Mute Control (read/write)
           Volume Control (read/write)
         bmaControls(1)     0x0000000f
           Mute Control (read/write)
           Volume Control (read/write)
         bmaControls(2)     0x0000000f
           Mute Control (read/write)
           Volume Control (read/write)
         iFeature                0
       AudioControl Interface Descriptor:
         bLength                12
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID            20
         wTerminalType      0x0301 Speaker
         bAssocTerminal          0
         bSourceID              10
         bCSourceID             40
         bmControls         0x0000
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                17
         bDescriptorType        36
         bDescriptorSubtype      2 (INPUT_TERMINAL)
         bTerminalID             1
         wTerminalType      0x0201 Microphone
         bAssocTerminal          0
         bCSourceID             40
         bNrChannels             2
         bmChannelConfig    0x00000000
         iChannelNames         128 In 1
         bmControls         0x0000
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                18
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                11
         bSourceID               1
         bmaControls(0)     0x0000000f
           Mute Control (read/write)
           Volume Control (read/write)
         bmaControls(1)     0x0000000f
           Mute Control (read/write)
           Volume Control (read/write)
         bmaControls(2)     0x0000000f
           Mute Control (read/write)
           Volume Control (read/write)
         iFeature                0
       AudioControl Interface Descriptor:
         bLength                12
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID            22
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID              11
         bCSourceID             40
         bmControls         0x0000
         iTerminal               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0006  1x 6 bytes
         bInterval               8
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           2
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              0
       AudioStreaming Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink           2
         bmControls           0x00
         bFormatType             1
         bmFormats          0x00000001
           PCM
         bNrChannels             2
         bmChannelConfig    0x00000000
         iChannelNames         192 Out 1
       AudioStreaming Interface Descriptor:
         bLength                 6
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bSubslotSize            4
         bBitResolution         24
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x08  EP 8 OUT
         bmAttributes            5
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Data
         wMaxPacketSize     0x0190  1x 400 bytes
         bInterval               1
         AudioStreaming Endpoint Descriptor:
           bLength                 8
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x00
           bmControls           0x00
           bLockDelayUnits         2 Decoded PCM samples
           wLockDelay         0x0008
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x84  EP 4 IN
         bmAttributes           17
           Transfer Type            Isochronous
           Synch Type               None
           Usage Type               Feedback
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval               4
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              0
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              0
       AudioStreaming Interface Descriptor:
         bLength                16
         bDescriptorType        36
         bDescriptorSubtype      1 (AS_GENERAL)
         bTerminalLink          22
         bmControls           0x00
         bFormatType             1
         bmFormats          0x00000001
           PCM
         bNrChannels             2
         bmChannelConfig    0x00000000
         iChannelNames         128 In 1
       AudioStreaming Interface Descriptor:
         bLength                 6
         bDescriptorType        36
         bDescriptorSubtype      2 (FORMAT_TYPE)
         bFormatType             1 (FORMAT_TYPE_I)
         bSubslotSize            4
         bBitResolution         24
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x88  EP 8 IN
         bmAttributes           37
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Implicit feedback Data
         wMaxPacketSize     0x0190  1x 400 bytes
         bInterval               1
         AudioStreaming Endpoint Descriptor:
           bLength                 8
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x00
           bmControls           0x00
           bLockDelayUnits         2 Decoded PCM samples
           wLockDelay         0x0008
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        5
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass      1
       bInterfaceProtocol     16
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x85  EP 5 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0008  1x 8 bytes
         bInterval               8
Device Qualifier (for other device speed):
   bLength                10
   bDescriptorType         6
   bcdUSB               2.00
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0         8
   bNumConfigurations      1
Device Status:     0x0000
   (Bus Powered)

> I may ask you to activate dyndbg for the snd-usb-audio module next.
I'll try soon.
> Seems to be a different revision indeed, but don't worry, most of the
> time these bugs are fixable.
Thank you. Happy to participate!

-- 
Nandakumar Edamana
https://nandakumar.org

GPG Key: https://nandakumar.org/contact/gpgkey.asc
GPG Key Fingerprint: BA6B 8FDE 644F F861 B638  3E2F 45D6 05FC 646A F75D

