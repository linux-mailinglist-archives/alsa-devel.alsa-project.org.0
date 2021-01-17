Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB732F94C4
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jan 2021 19:58:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64E6A175A;
	Sun, 17 Jan 2021 19:57:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64E6A175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610909879;
	bh=vFBIe6ARyEsvH4LhUsdAY5GYM/lvr/ZMxtMBV8OU39U=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EwRlLCeEwM4SPiruf4gjB+VQCeqx7BgLuar9kVpuaqHD+UJ1jUlNwMAkxMUXXQ06F
	 X8zFqNIF5tlfEiQHqpN08hk6+4BjxmDgVPDhZjySXmL7iN65FduRNeo6/fi7tyFS/Q
	 qtajgJLf0AVPtqPlQUF4DeUvHdmD3GEXbs/eYaME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CEC4F8026A;
	Sun, 17 Jan 2021 19:56:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8CD5F80257; Sun, 17 Jan 2021 19:56:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE3EAF80115
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 19:56:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE3EAF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="tnzNICYX"
Received: by mail-yb1-xb33.google.com with SMTP id y4so10587875ybn.3
 for <alsa-devel@alsa-project.org>; Sun, 17 Jan 2021 10:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=5E0IBo0jkPodtOi834epOuiVtlSjSUx1hoso8CBNEf4=;
 b=tnzNICYX64+Yb5MKWPc36ZFogSoeRqL/sxWNuScz3LEv5fC0pHjUjTVy+Fx05aaIrK
 xdXpFmicKJGXFXIYnZpIAH3TogNsnsInz8YfPVMOqSfXdB2ebjfFdKCsgtAMiGaxF6YJ
 Knl3jq/uEudeGoh4Iwk9aG/GlFv6p3ro5pYpQgP6BcyIINK+QuaQkI92AJ3OObU8g2xz
 VWc0qj+vsEfzRjrHsaoGBedb5zPJUpByTnCRgBropV5ET4nO+smfJahCT/kPh1Jm3RkW
 hKReZNfVg7ipg84pqUSJV/T/XeAJhqwYWsLIHJXqVqdnlzua3ihwIIQ0/RX1RJrPwE/D
 I6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5E0IBo0jkPodtOi834epOuiVtlSjSUx1hoso8CBNEf4=;
 b=ToZ7+iiqZmVAdPL6Vqna/MBpsp49Gn4GWx5loZBcJbIHB4YnWelN5bbKHr9SaCNIGi
 Bv23o46gupLVZBKM3dKd6zCzr2c1ppiPKVeoKYtpWTVVGZrzldCVrMwRGy/CDxoDbGZS
 1mVpEXIZMKnFGrntonjzHdB6jsa7JZGYDFlZwjdj5IfKwAnLThog9+BrQqmzkI2+irnM
 xlSmaGe+VFiairzS24yBEFZAT6glLIvtbddiOdfh7k3ce7bc6RU4ySw+fgeWNwFzsp0i
 gw/9dMJg9bwfTJUe8kbv/0TVRUh7+M6SEio+AaoqCCu6vQPRrAFwfSXcS6A7OjhUfiZA
 eAVg==
X-Gm-Message-State: AOAM532++rx/oEAohqAujQWoV+lQz/6ri/PtuAs9YJAJ7pXXAU4paKuI
 ly8NbEkT+S1jxoeBCypK7AyPDdgf7FOqBFm4EaReSfsfEYrMwg==
X-Google-Smtp-Source: ABdhPJx2cD6o3ETqf8cwKnfg6ZcrPacZHICbMvSKkDa8Lsud3deqABrOS9Op5Os4IVKQpmaDbiItP+9nUd76/AhEnZI=
X-Received: by 2002:a25:f40e:: with SMTP id q14mr32856576ybd.230.1610909770376; 
 Sun, 17 Jan 2021 10:56:10 -0800 (PST)
MIME-Version: 1.0
From: Mike Oliphant <oliphant@nostatic.org>
Date: Sun, 17 Jan 2021 10:56:01 -0800
Message-ID: <CAHXb3bdk71ivJUp9HBRccDvd8SD2F1uFdsC_FxUjhh5zpcQobQ@mail.gmail.com>
Subject: Support for NUX MG-300 USB interface
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

I recently got a NUX MG-300 USB guitar fx interface with high hopes that it
would work in Linux. It is supposed to be class-compliant, and works in iOS
and macOS without a driver.

Unfortunately, while it is recognized as a USB audio device by Linux, it is
not working.

The core issue seems to be that "stream0" reports no playback rates. dmesg
also shows errors, including "__uac_clock_find_source(): selector reported
illegal value".

Any help identifying the issue would be much appreciated. I have some
experience troubleshooting the USB audio kernel code and am happy to try
doing so if I can get a nudge in the right direction.

Output from "stream0", dmesg, and lsusb follows.

Thanks!

Mike

"stream0"
---
NUX NUX MG-300 AUDIO at usb-0000:00:1a.7-1.3, high speed : USB Audio

Playback:
  Status: Stop
  Interface 1
    Altset 1
    Format: S32_LE
    Channels: 2
    Endpoint: 0x01 (1 OUT) (ASYNC)
    Rates:
    Data packet interval: 1000 us
    Bits: 24
    Channel map: FL FR
    Sync Endpoint: 0x81 (1 IN)
    Sync EP Interface: 1
    Sync EP Altset: 1
    Implicit Feedback Mode: No

Capture:
  Status: Stop
  Interface 2
    Altset 1
    Format: S32_LE
    Channels: 2
    Endpoint: 0x82 (2 IN) (ASYNC)
    Rates:
    Data packet interval: 1000 us
    Bits: 24
    Channel map: FL FR
---

dmesg log:
---
[  141.265806] usb 3-1.3: new high-speed USB device number 9 using ehci-pci
[  141.374351] usb 3-1.3: config 1 interface 3 altsetting 0 bulk endpoint
0x4 has invalid maxpacket 256
[  141.374370] usb 3-1.3: config 1 interface 3 altsetting 0 bulk endpoint
0x83 has invalid maxpacket 256
[  141.375373] usb 3-1.3: New USB device found, idVendor=1fc9,
idProduct=8260, bcdDevice= 1.00
[  141.375389] usb 3-1.3: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[  141.375396] usb 3-1.3: Product: NUX MG-300 AUDIO
[  141.375401] usb 3-1.3: Manufacturer: NUX
[  141.375405] usb 3-1.3: SerialNumber: 2008101346
[  141.468523] usb 3-1.3: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[  141.468531] usb 3-1.3: parse_audio_format_rates_v2v3(): unable to find
clock source (clock -22)
[  141.468771] usb 3-1.3: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[  141.468897] usb 3-1.3: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[  141.469274] usb 3-1.3: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[  141.469279] usb 3-1.3: parse_audio_format_rates_v2v3(): unable to find
clock source (clock -22)
[  141.469521] usb 3-1.3: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[  141.469646] usb 3-1.3: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[  141.472645] usbcore: registered new interface driver snd-usb-audio
---

lsusb output:
---
Bus 003 Device 009: ID 1fc9:8260 NXP Semiconductors
Couldn't open device, some information will be missing
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x1fc9 NXP Semiconductors
  idProduct          0x8260
  bcdDevice            1.00
  iManufacturer           1
  iProduct                2
  iSerial                 3
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x013e
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xc0
      Self Powered
    MaxPower                2mA
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
      iInterface              0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               2.00
        bCategory               8
        wTotalLength       0x0065
        bmControls           0x00
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype     10 (CLOCK_SOURCE)
        bClockID               41
        bmAttributes            3 Internal programmable clock
        bmControls           0x07
          Clock Frequency Control (read/write)
          Clock Validity Control (read-only)
        bAssocTerminal          0
        iClockSource            0
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype     11 (CLOCK_SELECTOR)
        bClockID               40
        bNrInPins               1
        baCSourceID(0)         41
        bmControls           0x03
          Clock Selector Control (read/write)
        iClockSelector          0
      AudioControl Interface Descriptor:
        bLength                17
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             2
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bCSourceID             40
        bNrChannels             2
        bmChannelConfig    0x00000000
        iChannelNames           0
        bmControls         0x0000
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                10
        bSourceID               2
        bmaControls(0)     0x0000000f
          Mute Control (read/write)
          Volume Control (read/write)
        bmaControls(1)     0x0000000f
          Mute Control (read/write)
          Volume Control (read/write)
        bmaControls(2)     0x0000000f
          Mute Control (read/write)
          Volume Control (read/write)
        iFeature                0
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID            20
        wTerminalType      0x0301 Speaker
        bAssocTerminal          0
        bSourceID              10
        bCSourceID             40
        bmControls         0x0000
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                17
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bCSourceID             40
        bNrChannels             2
        bmChannelConfig    0x00000000
        iChannelNames           0
        bmControls         0x0000
        iTerminal               0
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID            22
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               2
        bCSourceID             40
        bmControls         0x0000
        iTerminal               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32
      iInterface              0
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           2
        bmControls           0x00
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels             2
        bmChannelConfig    0x00000000
        iChannelNames           0
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            4
        bBitResolution         24
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0258  1x 600 bytes
        bInterval               4
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes           17
          Transfer Type            Isochronous
          Synch Type               None
          Usage Type               Feedback
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval               4
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol     32
      iInterface              0
      AudioStreaming Interface Descriptor:
        bLength                16
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink          22
        bmControls           0x00
        bFormatType             1
        bmFormats          0x00000001
          PCM
        bNrChannels             2
        bmChannelConfig    0x00000000
        iChannelNames           0
      AudioStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bSubslotSize            4
        bBitResolution         24
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0258  1x 600 bytes
        bInterval               4
        AudioStreaming Endpoint Descriptor:
          bLength                 8
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x00
          bmControls           0x00
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         1 Audio
      bInterfaceSubClass      3 MIDI Streaming
      bInterfaceProtocol      0
      iInterface              4
      MIDIStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0041
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
        bJackID                 2
        iJack                   0
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               1 Embedded
        bJackID                 3
        bNrInputPins            1
        baSourceID( 0)          2
        BaSourcePin( 0)         1
        iJack                   0
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               2 External
        bJackID                 4
        bNrInputPins            1
        baSourceID( 0)          1
        BaSourcePin( 0)         1
        iJack                   0
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0100  1x 256 bytes
        bInterval               0
        bRefresh                0
        bSynchAddress           0
        MIDIStreaming Endpoint Descriptor:
          bLength                 5
          bDescriptorType        37
          bDescriptorSubtype      1 (GENERAL)
          bNumEmbMIDIJack         1
          baAssocJackID( 0)       1
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0100  1x 256 bytes
        bInterval               0
        bRefresh                0
        bSynchAddress           0
        MIDIStreaming Endpoint Descriptor:
          bLength                 5
          bDescriptorType        37
          bDescriptorSubtype      1 (GENERAL)
          bNumEmbMIDIJack         1
          baAssocJackID( 0)       3
---
