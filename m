Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 419CF309291
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Jan 2021 09:32:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFB85166D;
	Sat, 30 Jan 2021 09:31:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFB85166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611995563;
	bh=oOiHfWwpnv4H6lQTqH/tednJznXCFIgGOZ90qWnPNjc=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uoOT0W01sxWPGgYCKbr8NoW8NmAx4C5GbyyrMM2UU7hsshvcDqCZ+RxmSVwEElDwB
	 zx9gp4sBD63nPNMy8dz20K2IJv/fO5n9UJQlAgd0QcEfb125KNid/pl1cUw4xWhs1T
	 O5JwKlWl3XDmqUxJsqp5MFSm+7tIMl2suJUV2Z58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C7E7F801D8;
	Sat, 30 Jan 2021 09:31:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42C7BF8015B; Sat, 30 Jan 2021 09:31:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_14,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6287FF800E9
 for <alsa-devel@alsa-project.org>; Sat, 30 Jan 2021 09:31:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6287FF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ql0JqO5D"
Received: by mail-ed1-x52d.google.com with SMTP id f1so13203281edr.12
 for <alsa-devel@alsa-project.org>; Sat, 30 Jan 2021 00:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=cJDyMS7R70TwIKhrVxK5UOJL+eV2MSKTef+tNRSvd74=;
 b=ql0JqO5DU1C6mnABDERF5C9N28izXCF271lW7qhel8FYZKKNbNrW3/5+Fmu45V67GP
 6L1mfbScYJ1eDCvruGx9sa5VEY13t4Z5iJk0HTc8iYUGzLXvEUxFDe9gus78Kwp/K6oG
 quc6iF7VWbWuP6zv4awMk2gDnvMfyjYksRPkNjh0w6bVKgHoCL+Z7JrIpQ3oqYH9gonG
 ESDHaGNbd4Q9GvZkxrd4A+a6o+PlR0jL8EIzGLAvqscBCanbBQMhkPiewbcOuhI8P7F/
 kGtACp9LdlI7Iwp5Eh1tQSBBQBjrz0AebJsrf/CnbfmpFDBdttKy32pYEOWZvFrkXKIq
 PoOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=cJDyMS7R70TwIKhrVxK5UOJL+eV2MSKTef+tNRSvd74=;
 b=bcd2nl+ab6TckYDF7+mLvOx0PZFNXnafBLEOo/xD3kZRe2ImMyUYYMqTkb4bT9yOFo
 U3P5xzSpLI0lM49ymBcGvKlzU57gSwffPAIPiraJ9xUScOZcovYCWLU5t8wjA0ATJK77
 8F0fcXFUlrCc3vS/tw8F//eCURPaSET86SH8ZnScvlPleArR+CMqSA65zjsJpi3QMSnn
 H7Bnfip5/ChdZDa88Z0LR65nbxSwBezcXsxpNlLGQFqLOm6hK9KMEUrwjFNc/S5Ms2yg
 O1LBS87EEY9iUDV8XurAkRTCh0Wkjx8JJBEER86OkryjzTqLvFWNlbFHBBwfIe50FM5Z
 MlAA==
X-Gm-Message-State: AOAM53336H74RODvV2BxRUjH7x58FRDu923Vv5j5UDS1rlIW6xIm2GBI
 rdM2jxaJQjp/XNonbWN70DidbcpHXs5a0hfYilSl4Q6MATA=
X-Google-Smtp-Source: ABdhPJyu10jmbvnzMhfwTG11LO39mh3OPM+LNYUrsJYgKjI6LjNPoi75px7KNAyi7B81eFsMBEi5YbqVFMfFiNQl7E8=
X-Received: by 2002:a50:b246:: with SMTP id o64mr8780117edd.132.1611995460817; 
 Sat, 30 Jan 2021 00:31:00 -0800 (PST)
MIME-Version: 1.0
From: Peter Allen <peter.allenm@gmail.com>
Date: Sat, 30 Jan 2021 08:30:50 +0000
Message-ID: <CAHa6N62-YS++jM3O8E1dSY9eCcg6P0uW-X9xOusX96_DGVhS-A@mail.gmail.com>
Subject: Nux Mighty Plug USB - no clock source
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

I have a NUX Mighty Plug guitar effects which has a USB Audio interface.
Unfortunately it doesn't work in Linux, and I'd love to fix it.
It gets registered with Alsa, except it ends up without any valid sample
rates (by the look of it due to a buggy clock source descriptor).

This is on Ubuntu-Studio 20.04 LTS _Focal Fossa with kernel
5.4.0-62-lowlatency
on a HP Omen 15 with i5-7300HQ

I don't know what I'm doing (but did a little module development rather a
long time ago in the 2.2 days :-)) Help is  greatly appreciated.

When plugged in I get:
[12476.413792] usb 1-1: New USB device found, idVendor=1fc9,
idProduct=8260, bcdDevice= 1.00
[12476.413797] usb 1-1: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[12476.413800] usb 1-1: Product: MIGHTY PLUG USB
[12476.413804] usb 1-1: Manufacturer: NUX
[12476.413807] usb 1-1: SerialNumber: 2007151403
[12476.444988] usb 1-1: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[12476.444992] usb 1-1: parse_audio_format_rates_v2v3(): unable to find
clock source (clock -22)
[12476.445413] usb 1-1: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[12476.445479] usb 1-1: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[12476.447095] usb 1-1: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[12476.447098] usb 1-1: parse_audio_format_rates_v2v3(): unable to find
clock source (clock -22)
[12476.447459] usb 1-1: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[12476.447684] usb 1-1: __uac_clock_find_source(): selector reported
illegal value, id 40, ret 0
[12476.450397] usbcore: registered new interface driver snd-usb-audio


===== /proc/asound/cards give ======
 0 [PCH            ]: HDA-Intel - HDA Intel PCH
                      HDA Intel PCH at 0xb4428000 irq 134
 1 [NVidia         ]: HDA-Intel - HDA NVidia
                      HDA NVidia at 0xb4000000 irq 17
 2 [USB            ]: USB-Audio - MIGHTY PLUG USB
                      NUX MIGHTY PLUG USB at usb-0000:00:14.0-1, high speed

==== /proc/asound/stream========
NUX MIGHTY PLUG USB at usb-0000:00:14.0-1, high speed : USB Audio

Playback:
  Status: Stop
  Interface 1
    Altset 1
    Format: S32_LE
    Channels: 2
    Endpoint: 1 OUT (ASYNC)
    Rates:
    Data packet interval: 1000 us
    Bits: 24

Capture:
  Status: Stop
  Interface 2
    Altset 1
    Format: S32_LE
    Channels: 2
    Endpoint: 2 IN (ASYNC)
    Rates:
    Data packet interval: 1000 us
    Bits: 24


======== arecord ===========
arecord -D "hw:2" -c 2 -f s24 -r 44100 -d 2 -v test.wav
Recording WAVE 'xxxc' : Signed 24 bit Little Endian, Rate 44100 Hz, Stereo
arecord: set_params:1314: Broken configuration for this PCM: no
configuration available

========lsusb -v ==========
  iSerial                 2 200901010001
  bNumConfigurations      1

Bus 001 Device 005: ID 1fc9:8260 NXP Semiconductors MIGHTY PLUG USB
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
  iManufacturer           1 NUX
  iProduct                2 MIGHTY PLUG USB
  iSerial                 3 2007151403
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
        wMaxPacketSize     0x0400  1x 1024 bytes
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
        wMaxPacketSize     0x0400  1x 1024 bytes
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
      iInterface              4 MIGHTY PLUG USB MIDI
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
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  bNumConfigurations      1
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0001
  Self Powered

Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            9 Hub
  bDeviceSubClass         0
  bDeviceProtocol         1 Single TT
  bMaxPacketSize0        64
  idVendor           0x1d6b Linux Foundation
  idProduct          0x0002 2.0 root hub
  bcdDevice            5.04
  iManufacturer           3 Linux 5.4.0-58-lowlatency xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:00:14.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0019
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 Hub
      bInterfaceSubClass      0
      bInterfaceProtocol      0 Full speed (or root) hub
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
Hub Descriptor:
  bLength              13
  bDescriptorType      41
  nNbrPorts            16
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
    TT think time 8 FS bits
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  DeviceRemovable    0x90 0x01 0x00
  PortPwrCtrlMask    0xff 0xff 0xff
 Hub Port Status:
   Port 1: 0000.0503 highspeed power enable connect
   Port 2: 0000.0100 power
   Port 3: 0000.0100 power
   Port 4: 0000.0503 highspeed power enable connect
   Port 5: 0000.0100 power
   Port 6: 0000.0100 power
   Port 7: 0000.0103 power enable connect
   Port 8: 0000.0100 power
   Port 9: 0000.0100 power
   Port 10: 0000.0100 power
   Port 11: 0000.0100 power
   Port 12: 0000.0100 power
   Port 13: 0000.0100 power
   Port 14: 0000.0100 power
   Port 15: 0000.0100 power
   Port 16: 0000.0100 power
can't get device qualifier: Resource temporarily unavailable
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0001
  Self Powered
