Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4E33B5008
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Jun 2021 22:02:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E335169D;
	Sat, 26 Jun 2021 22:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E335169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624737745;
	bh=FxldujZRKq4kXSJK/99OvQwzAk6hOAHaC6INN1qA+Ig=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V5e0Ps697J0Nkbi2P0riTE5Lb63T2rZEKhsjZsfZ5NU6ijXyT/FulDW3dFtK3rcC5
	 P5z39Setp+Dwr8jQDyaE1mCvhquMy3x08wODkK+R7ApLzSyxYY3oPJiaSOW2RSokz3
	 va4QWvRCx2hmxSWZdRv09jg82yCQsMIAq11PI7mU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ADB3F801F7;
	Sat, 26 Jun 2021 22:00:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5036F8025F; Sat, 26 Jun 2021 22:00:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 984C4F800E1
 for <alsa-devel@alsa-project.org>; Sat, 26 Jun 2021 22:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 984C4F800E1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1624737641882462025-webhooks-bot@alsa-project.org>
References: <1624737641882462025-webhooks-bot@alsa-project.org>
Subject: Segmentation fault when using alsamixer to display a sof-soundwire
 card
Message-Id: <20210626200052.B5036F8025F@alsa1.perex.cz>
Date: Sat, 26 Jun 2021 22:00:52 +0200 (CEST)
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

alsa-project/alsa-utils issue #100 was opened from Aetf:

The builtin soundcard on my XPS 9700 recently stopped working. I tried to use alsamixer to see what's going on, and it gives me a segmentation fault.

The program works segfaults as soon as I choose `sof-soundwire` as the sound card by pressing F6. But as long as I don't choose that, it works fine with other cards.

There's the backtrace:
```
(gdb) bt
#0  0x00007ffff7c32a12 in __strcmp_avx2 () from /usr/lib/libc.so.6
#1  0x00007ffff7e534c6 in snd_mixer_get_hctl (mixer=0x555555569410, name=0x55555556c770 "sysdefault:0", hctl=hctl@entry=0x7fffffffdee0) at mixer.c:302
#2  0x000055555555c925 in display_card_info () at mixer_display.c:162
#3  0x000055555555edab in select_card_by_name (device_name=<optimized out>) at mixer_widget.c:182
#4  0x0000555555558875 in on_key_enter () at card_select.c:55
#5  on_handle_key (key=<optimized out>) at card_select.c:67
#6  0x000055555555a8d3 in mainloop () at mainloop.c:126
#7  0x00005555555582c6 in main (argc=1, argv=0x7fffffffe0d8) at cli.c:166
(gdb) f 1
#1  0x00007ffff7e534c6 in snd_mixer_get_hctl (mixer=0x555555569410, name=0x55555556c770 "sysdefault:0", hctl=hctl@entry=0x7fffffffdee0) at mixer.c:302
302                     if (strcmp(name, snd_hctl_name(s->hctl)) == 0) {
(gdb) p s->hctl->ctl->name
$8 = 0x0
(gdb)
```

<details>
<summary>My hardware info</summary>

```
upload=true&script=true&cardinfo=
!!################################
!!ALSA Information Script v 0.5.0
!!################################

!!Script ran on: Sat Jun 26 19:22:28 UTC 2021


!!Linux Distribution
!!------------------

Arch Linux \r (\l) DISTRIB_ID=Arch DISTRIB_DESCRIPTION="Arch Linux" NAME="Arch Linux" PRETTY_NAME="Arch Linux" ID=arch HOME_URL="https://archlinux.org/" DOCUMENTATION_URL="https://wiki.archlinux.org/" SUPPORT_URL="https://bbs.archlinux.org/" BUG_REPORT_URL="https://bugs.archlinux.org/" LOGO=archlinux


!!DMI Information
!!---------------

Manufacturer:      Dell Inc.
Product Name:      XPS 17 9700
Product Version:   
Firmware Version:  1.8.2
System SKU:        098F
Board Vendor:      Dell Inc.
Board Name:        05JJ5P


!!ACPI Device Status Information
!!---------------

/sys/bus/acpi/devices/ACPI0003:00/status 	 15
/sys/bus/acpi/devices/ACPI000C:00/status 	 15
/sys/bus/acpi/devices/ACPI000E:00/status 	 15
/sys/bus/acpi/devices/DELL098F:00/status 	 15
/sys/bus/acpi/devices/DLLK098F:00/status 	 15
/sys/bus/acpi/devices/ELAN2097:00/status 	 15
/sys/bus/acpi/devices/ELAN2097:01/status 	 15
/sys/bus/acpi/devices/INT33A1:00/status 	 15
/sys/bus/acpi/devices/INT33D5:00/status 	 15
/sys/bus/acpi/devices/INT3400:00/status 	 15
/sys/bus/acpi/devices/INT3403:00/status 	 15
/sys/bus/acpi/devices/INT3403:01/status 	 15
/sys/bus/acpi/devices/INT3403:02/status 	 15
/sys/bus/acpi/devices/INT3403:03/status 	 15
/sys/bus/acpi/devices/INT3403:04/status 	 15
/sys/bus/acpi/devices/INT3403:05/status 	 15
/sys/bus/acpi/devices/INT340E:00/status 	 15
/sys/bus/acpi/devices/INT3450:00/status 	 15
/sys/bus/acpi/devices/INT3F0D:00/status 	 15
/sys/bus/acpi/devices/LNXPOWER:00/status 	 1
/sys/bus/acpi/devices/LNXPOWER:01/status 	 15
/sys/bus/acpi/devices/LNXPOWER:02/status 	 1
/sys/bus/acpi/devices/LNXPOWER:03/status 	 1
/sys/bus/acpi/devices/LNXPOWER:04/status 	 1
/sys/bus/acpi/devices/LNXPOWER:05/status 	 1
/sys/bus/acpi/devices/LNXPOWER:06/status 	 1
/sys/bus/acpi/devices/LNXPOWER:07/status 	 1
/sys/bus/acpi/devices/LNXVIDEO:00/status 	 15
/sys/bus/acpi/devices/PNP0103:00/status 	 15
/sys/bus/acpi/devices/PNP0C02:00/status 	 3
/sys/bus/acpi/devices/PNP0C02:04/status 	 3
/sys/bus/acpi/devices/PNP0C04:00/status 	 31
/sys/bus/acpi/devices/PNP0C09:00/status 	 15
/sys/bus/acpi/devices/PNP0C0A:00/status 	 31
/sys/bus/acpi/devices/PRP00001:00/status 	 11
/sys/bus/acpi/devices/STM0125:00/status 	 15
/sys/bus/acpi/devices/USBC000:00/status 	 15
/sys/bus/acpi/devices/device:16/status 	 15
/sys/bus/acpi/devices/device:84/status 	 15


!!Kernel Information
!!------------------

Kernel release:    5.12.12-arch1-1
Operating System:  GNU/Linux
Architecture:      x86_64
Processor:         unknown
SMP Enabled:       Yes


!!ALSA Version
!!------------

Driver version:     k5.12.12-arch1-1
Library version:    1.2.5.1
Utilities version:  1.2.5.1


!!Loaded ALSA modules
!!-------------------

snd_soc_sof_sdw (card 0)
snd_usb_audio (card 1)
snd_usb_audio (card 2)


!!Sound Servers on this system
!!----------------------------

PipeWire:
      Installed - Yes (/usr/bin/pipewire)
      Running - Yes

Jack:
      Installed - Yes (/usr/bin/jackd)
      Running - No

Jack2:
      Installed - Yes (/usr/bin/jackdbus)
      Running - No


!!Soundcards recognised by ALSA
!!-----------------------------

 0 [sofsoundwire   ]: sof-soundwire - sof-soundwire
                      Intel Soundwire SOF
 1 [USB            ]: USB-Audio - Razer Kraken X USB
                      Razer Razer Kraken X USB at usb-0000:3d:00.0-1.1, full speed
 2 [Dock           ]: USB-Audio - WD19 Dock
                      Dell-WD15-Dock


!!PCI Soundcards installed in the system
!!--------------------------------------

00:1f.3 Multimedia audio controller [0401]: Intel Corporation Comet Lake PCH cAVS [8086:06c8]
	Subsystem: Dell Device [1028:098f]


!!Loaded sound module options
!!---------------------------

!!Module: snd_soc_sof_sdw
	quirk : -1

!!Module: snd_usb_audio
	autoclock : Y
	delayed_register : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	device_setup : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
	id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	ignore_ctl_error : N
	implicit_fb : N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N
	index : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	pid : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	quirk_alias : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	skip_validation : N
	use_vmalloc : Y
	vid : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1

!!Module: snd_usb_audio
	autoclock : Y
	delayed_register : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	device_setup : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
	id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	ignore_ctl_error : N
	implicit_fb : N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N,N
	index : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	pid : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	quirk_alias : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	skip_validation : N
	use_vmalloc : Y
	vid : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1


!!Sysfs card info
!!---------------

!!Card: /sys/class/sound/card0
Driver: /sys/bus/platform/drivers/sof_sdw
Tree:

!!Card: /sys/class/sound/card1
Driver: /sys/bus/usb/drivers/snd-usb-audio
Tree:

!!Card: /sys/class/sound/card2
Driver: /sys/bus/usb/drivers/snd-usb-audio
Tree:


!!HDA-Intel Codec information
!!---------------------------
--startcollapse--

Codec: Intel Kabylake HDMI
Address: 2
AFG Function Id: 0x1 (unsol 0)
Vendor Id: 0x8086280b
Subsystem Id: 0x80860101
Revision Id: 0x100000
No Modem Function Group found
Default PCM:
    rates [0x0]:
    bits [0x0]:
    formats [0x0]:
Default Amp-In caps: N/A
Default Amp-Out caps: N/A
State of AFG node 0x01:
  Power states:  D0 D3 CLKSTOP EPSS
  Power: setting=D0, actual=D0, Clock-stop-OK
GPIO: io=0, o=0, i=0, unsolicited=0, wake=0
Node 0x02 [Audio Output] wcaps 0x6611: 8-Channels Digital
  Converter: stream=1, channel=0
  Digital: Enabled KAE
  Digital category: 0x0
  IEC Coding Type: 0x0
  PCM:
    rates [0x7f0]: 32000 44100 48000 88200 96000 176400 192000
    bits [0x1a]: 16 24 32
    formats [0x5]: PCM AC3
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x03 [Audio Output] wcaps 0x6611: 8-Channels Digital
  Converter: stream=0, channel=0
  Digital: Enabled KAE
  Digital category: 0x0
  IEC Coding Type: 0x0
  PCM:
    rates [0x7f0]: 32000 44100 48000 88200 96000 176400 192000
    bits [0x1a]: 16 24 32
    formats [0x5]: PCM AC3
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x04 [Audio Output] wcaps 0x6611: 8-Channels Digital
  Converter: stream=0, channel=0
  Digital: Enabled KAE
  Digital category: 0x0
  IEC Coding Type: 0x0
  PCM:
    rates [0x7f0]: 32000 44100 48000 88200 96000 176400 192000
    bits [0x1a]: 16 24 32
    formats [0x5]: PCM AC3
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x05 [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x0b000094: OUT Detect HBR HDMI DP
  Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 0
Node 0x06 [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x0b000094: OUT Detect HBR HDMI DP
  Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 0
Node 0x07 [Pin Complex] wcaps 0x40778d: 8-Channels Digital Amp-Out CP
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x0b000094: OUT Detect HBR HDMI DP
  Pin Default 0x18560010: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 3
     Dev 00: PD = 0, ELDV = 0, IA = 0, Connections [ 0x02* 0x03 0x04 ]
    *Dev 01: PD = 1, ELDV = 1, IA = 0, Connections [ 0x02* 0x03 0x04 ]
     Dev 02: PD = 0, ELDV = 0, IA = 0, Connections [ 0x02* 0x03 0x04 ]
  Connection: 3
     0x02* 0x03 0x04
Node 0x08 [Vendor Defined Widget] wcaps 0xf00000: Mono
--endcollapse--


!!USB Descriptors
!!---------------
--startcollapse--

Bus 005 Device 004: ID 1532:0526 Razer USA, Ltd Razer Kraken X USB
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x1532 Razer USA, Ltd
  idProduct          0x0526 
  bcdDevice            0.34
  iManufacturer           1 Razer
  iProduct                2 Razer Kraken X USB
  iSerial                 3 00000000
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00fa
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0 
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
        wTotalLength       0x004f
        bInCollection           2
        baInterfaceNr(0)        1
        baInterfaceNr(1)        2
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0 
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                10
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 2
        bSourceID               1
        bControlSize            1
        bmaControls(0)       0x42
          Volume Control
          Automatic Gain Control
        bmaControls(1)       0x00
        bmaControls(2)       0x00
        iFeature                0 
      AudioControl Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      5 (SELECTOR_UNIT)
        bUnitID                15
        bNrInPins               1
        baSourceID(0)           2
        iSelector               0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID              15
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0 
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                10
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 5
        bSourceID               4
        bControlSize            1
        bmaControls(0)       0x01
          Mute Control
        bmaControls(1)       0x02
          Volume Control
        bmaControls(2)       0x02
          Volume Control
        iFeature                0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             6
        wTerminalType      0x0301 Speaker
        bAssocTerminal          0
        bSourceID               5
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
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                20
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            4 Discrete
        tSamFreq[ 0]        24000
        tSamFreq[ 1]        32000
        tSamFreq[ 2]        44100
        tSamFreq[ 3]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
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
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
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
        bTerminalLink           4
        bDelay                  3 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                26
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            6 Discrete
        tSamFreq[ 0]         8000
        tSamFreq[ 1]        16000
        tSamFreq[ 2]        24000
        tSamFreq[ 3]        32000
        tSamFreq[ 4]        44100
        tSamFreq[ 5]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            9
          Transfer Type            Isochronous
          Synch Type               Adaptive
          Usage Type               Data
        wMaxPacketSize     0x00c0  1x 192 bytes
        bInterval               1
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         1 Milliseconds
          wLockDelay         0x0004
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength     109
         Report Descriptors: 
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0025  1x 37 bytes
        bInterval               1

Bus 005 Device 008: ID 0bda:402e Realtek Semiconductor Corp. USB Audio
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0        64
  idVendor           0x0bda Realtek Semiconductor Corp.
  idProduct          0x402e 
  bcdDevice            0.01
  iManufacturer           3 Generic
  iProduct                1 USB Audio
  iSerial                 2 200901010001
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0137
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          4 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0 
      iInterface              6 
      AudioControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0080
        bInCollection           3
        baInterfaceNr(0)        1
        baInterfaceNr(1)        2
        baInterfaceNr(2)        3
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Microphone
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
        bUnitID                 3
        bSourceID               1
        bControlSize            2
        bmaControls(0)     0x0201
          Mute Control
          Loudness Control
        bmaControls(1)     0x0002
          Volume Control
        bmaControls(2)     0x0002
          Volume Control
        iFeature                0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             2
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          1
        bSourceID               4
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                15
        bDescriptorType        36
        bDescriptorSubtype      8 (EXTENSION_UNIT)
        bUnitID                 4
        wExtensionCode     0x0bda
        bNrInPins               1
        baSourceID(0)           3
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0 
        bControlSize            1
        bmControls(0)        0x01
        iExtension              0 
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID            14
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0 
        iTerminal              18 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID            15
        wTerminalType      0x0302 Headphones
        bAssocTerminal         14
        bSourceID              16
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                16
        bSourceID              14
        bControlSize            2
        bmaControls(0)     0x0001
          Mute Control
        bmaControls(1)     0x0002
          Volume Control
        bmaControls(2)     0x0002
          Volume Control
        iFeature                0 
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID            17
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0 
        iTerminal              19 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID            18
        wTerminalType      0x0603 Line Connector
        bAssocTerminal         17
        bSourceID              19
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                19
        bSourceID              17
        bControlSize            2
        bmaControls(0)     0x0001
          Mute Control
        bmaControls(1)     0x0002
          Volume Control
        bmaControls(2)     0x0002
          Volume Control
        iFeature                0 
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               8
        bRefresh                0
        bSynchAddress           0
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
        bTerminalLink           2
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           3
        bBitResolution         24
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0150  1x 336 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
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
        bTerminalLink          14
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           3
        bBitResolution         24
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x07  EP 7 OUT
        bmAttributes            9
          Transfer Type            Isochronous
          Synch Type               Adaptive
          Usage Type               Data
        wMaxPacketSize     0x0150  1x 336 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      2 Streaming
      bInterfaceProtocol      0 
      iInterface              0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
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
        bTerminalLink          17
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           3
        bBitResolution         24
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x08  EP 8 OUT
        bmAttributes            9
          Transfer Type            Isochronous
          Synch Type               Adaptive
          Usage Type               Data
        wMaxPacketSize     0x0150  1x 336 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
--endcollapse--


!!USB Stream information
!!----------------------
--startcollapse--

Razer Razer Kraken X USB at usb-0000:3d:00.0-1.1, full speed : USB Audio

Playback:
  Status: Running
    Interface = 2
    Altset = 1
    Packet Size = 192
    Momentary freq = 48000 Hz (0x30.0000)
  Interface 2
    Altset 1
    Format: S16_LE
    Channels: 2
    Endpoint: 0x01 (1 OUT) (ADAPTIVE)
    Rates: 8000, 16000, 24000, 32000, 44100, 48000
    Bits: 16
    Channel map: FL FR

Capture:
  Status: Running
    Interface = 1
    Altset = 1
    Packet Size = 200
    Momentary freq = 48000 Hz (0x30.0000)
  Interface 1
    Altset 1
    Format: S16_LE
    Channels: 2
    Endpoint: 0x81 (1 IN) (ASYNC)
    Rates: 24000, 32000, 44100, 48000
    Bits: 16
    Channel map: FL FR
Dell-WD15-Dock : USB Audio

Playback:
  Status: Stop
  Interface 2
    Altset 1
    Format: S24_3LE
    Channels: 2
    Endpoint: 0x07 (7 OUT) (ADAPTIVE)
    Rates: 48000
    Data packet interval: 1000 us
    Bits: 24
    Channel map: FL FR

Capture:
  Status: Stop
  Interface 1
    Altset 1
    Format: S24_3LE
    Channels: 2
    Endpoint: 0x81 (1 IN) (ASYNC)
    Rates: 48000
    Data packet interval: 1000 us
    Bits: 24
    Channel map: FL FR
Dell-WD15-Dock : USB Audio #1

Playback:
  Status: Stop
  Interface 3
    Altset 1
    Format: S24_3LE
    Channels: 2
    Endpoint: 0x08 (8 OUT) (ADAPTIVE)
    Rates: 48000
    Data packet interval: 1000 us
    Bits: 24
    Channel map: FL FR
--endcollapse--


!!USB Mixer information
!!---------------------
--startcollapse--

USB Mixer: usb_id=0x15320526, ctrlif=0, ctlerr=0
Card: Razer Razer Kraken X USB at usb-0000:3d:00.0-1.1, full speed
  Unit: 2
    Control: name="Auto Gain Control", index=0
    Info: id=2, control=7, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 2
    Control: name="Mic Capture Volume", index=0
    Info: id=2, control=2, cmask=0x0, channels=1, type="S16"
    Volume: min=-7680, max=1280, dBmin=-3000, dBmax=500
  Unit: 5
    Control: name="PCM Playback Volume", index=0
    Info: id=5, control=2, cmask=0x3, channels=2, type="S16"
    Volume: min=-16384, max=0, dBmin=-6400, dBmax=0
  Unit: 5
    Control: name="PCM Playback Switch", index=0
    Info: id=5, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
USB Mixer: usb_id=0x0bda402e, ctrlif=0, ctlerr=0
Card: Dell-WD15-Dock
  Unit: 3
    Control: name="Loudness", index=0
    Info: id=3, control=10, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 3
    Control: name="Mic Capture Volume", index=0
    Info: id=3, control=2, cmask=0x3, channels=2, type="S16"
    Volume: min=-8576, max=7680, dBmin=-3350, dBmax=3000
  Unit: 3
    Control: name="Mic Capture Switch", index=0
    Info: id=3, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 4
    Control: name="Extension Unit Switch", index=0
    Info: id=4, control=1, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 16
    Control: name="Headphone Playback Volume", index=0
    Info: id=16, control=2, cmask=0x3, channels=2, type="S16"
    Volume: min=-16256, max=0, dBmin=-6350, dBmax=0
  Unit: 16
    Control: name="Headphone Playback Switch", index=0
    Info: id=16, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 19
    Control: name="Line Playback Volume", index=0
    Info: id=19, control=2, cmask=0x3, channels=2, type="S16"
    Volume: min=-16256, max=0, dBmin=-6350, dBmax=0
  Unit: 19
    Control: name="Line Playback Switch", index=0
    Info: id=19, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
--endcollapse--


!!ALSA Device nodes
!!-----------------

crw-rw----+ 1 root audio 116, 10 Jun 25 18:25 /dev/snd/controlC0
crw-rw----+ 1 root audio 116, 13 Jun 25 18:25 /dev/snd/controlC1
crw-rw----+ 1 root audio 116, 17 Jun 25 18:25 /dev/snd/controlC2
crw-rw----+ 1 root audio 116,  9 Jun 25 18:25 /dev/snd/hwC0D2
crw-rw----+ 1 root audio 116,  2 Jun 25 18:25 /dev/snd/pcmC0D0p
crw-rw----+ 1 root audio 116,  3 Jun 25 18:25 /dev/snd/pcmC0D1c
crw-rw----+ 1 root audio 116,  4 Jun 25 18:25 /dev/snd/pcmC0D2p
crw-rw----+ 1 root audio 116,  5 Jun 25 18:25 /dev/snd/pcmC0D4c
crw-rw----+ 1 root audio 116,  6 Jun 25 18:25 /dev/snd/pcmC0D5p
crw-rw----+ 1 root audio 116,  7 Jun 25 18:25 /dev/snd/pcmC0D6p
crw-rw----+ 1 root audio 116,  8 Jun 26 14:59 /dev/snd/pcmC0D7p
crw-rw----+ 1 root audio 116, 12 Jun 25 18:25 /dev/snd/pcmC1D0c
crw-rw----+ 1 root audio 116, 11 Jun 25 18:25 /dev/snd/pcmC1D0p
crw-rw----+ 1 root audio 116, 15 Jun 26 14:59 /dev/snd/pcmC2D0c
crw-rw----+ 1 root audio 116, 14 Jun 26 14:59 /dev/snd/pcmC2D0p
crw-rw----+ 1 root audio 116, 16 Jun 26 14:59 /dev/snd/pcmC2D1p
crw-rw----+ 1 root audio 116,  1 Jun 25 18:25 /dev/snd/seq
crw-rw----+ 1 root audio 116, 33 Jun 25 18:24 /dev/snd/timer

/dev/snd/by-id:
total 0
drwxr-xr-x 2 root root  80 Jun 25 18:25 .
drwxr-xr-x 4 root root 440 Jun 25 18:25 ..
lrwxrwxrwx 1 root root  12 Jun 25 18:25 usb-Generic_USB_Audio_200901010001-00 -> ../controlC2
lrwxrwxrwx 1 root root  12 Jun 25 18:25 usb-Razer_Razer_Kraken_X_USB_00000000-00 -> ../controlC1

/dev/snd/by-path:
total 0
drwxr-xr-x 2 root root 100 Jun 25 18:25 .
drwxr-xr-x 4 root root 440 Jun 25 18:25 ..
lrwxrwxrwx 1 root root  12 Jun 25 18:25 pci-0000:00:1f.3-platform-sof_sdw -> ../controlC0
lrwxrwxrwx 1 root root  12 Jun 25 18:25 pci-0000:3d:00.0-usb-0:1.1:1.0 -> ../controlC1
lrwxrwxrwx 1 root root  12 Jun 25 18:25 pci-0000:3d:00.0-usb-0:2.3.4:1.0 -> ../controlC2


!!Aplay/Arecord output
!!--------------------

APLAY

**** List of PLAYBACK Hardware Devices ****
card 0: sofsoundwire [sof-soundwire], device 0: Jack Out (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofsoundwire [sof-soundwire], device 2: Speaker (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofsoundwire [sof-soundwire], device 5: HDMI 1 (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofsoundwire [sof-soundwire], device 6: HDMI 2 (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofsoundwire [sof-soundwire], device 7: HDMI 3 (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: USB [Razer Kraken X USB], device 0: USB Audio [USB Audio]
  Subdevices: 0/1
  Subdevice #0: subdevice #0
card 2: Dock [WD19 Dock], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: Dock [WD19 Dock], device 1: USB Audio [USB Audio #1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

ARECORD

**** List of CAPTURE Hardware Devices ****
card 0: sofsoundwire [sof-soundwire], device 1: Jack In (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: sofsoundwire [sof-soundwire], device 4: Microphone (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: USB [Razer Kraken X USB], device 0: USB Audio [USB Audio]
  Subdevices: 0/1
  Subdevice #0: subdevice #0
card 2: Dock [WD19 Dock], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

!!Amixer output
!!-------------

!!-------Mixer controls for card sofsoundwire

Card sysdefault:0 'sofsoundwire'/'Intel Soundwire SOF'
  Mixer name	: 'Intel Kabylake HDMI'
  Components	: 'HDA:8086280b,80860101,00100000 cfg-spk:4 cfg-amp:2 hs:rt711 spk:rt1308 mic:rt715'
  Controls      : 73
  Simple ctrls  : 43
Simple mixer control 'Headphone',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [off]
Simple mixer control 'Speaker',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'IEC958',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'IEC958',1
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'IEC958',2
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'Headset Mic',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [off]
Simple mixer control 'PGA1.0 1 Master',0
  Capabilities: pvolume
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 32
  Mono:
  Front Left: Playback 32 [100%] [0.00dB]
  Front Right: Playback 32 [100%] [0.00dB]
Simple mixer control 'PGA2.0 2 Master',0
  Capabilities: cvolume cswitch
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 80
  Front Left: Capture 50 [62%] [0.00dB] [on]
  Front Right: Capture 50 [62%] [0.00dB] [on]
Simple mixer control 'PGA3.1 3 Master',0
  Capabilities: pvolume
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 32
  Mono:
  Front Left: Playback 32 [100%] [0.00dB]
  Front Right: Playback 32 [100%] [0.00dB]
Simple mixer control 'PGA5.0 5 Master',0
  Capabilities: cvolume cswitch
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 80
  Front Left: Capture 50 [62%] [0.00dB] [on]
  Front Right: Capture 50 [62%] [0.00dB] [on]
Simple mixer control 'PGA6.0 6 Master',0
  Capabilities: pvolume
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 32
  Mono:
  Front Left: Playback 32 [100%] [0.00dB]
  Front Right: Playback 32 [100%] [0.00dB]
Simple mixer control 'PGA7.0 7 Master',0
  Capabilities: pvolume
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 32
  Mono:
  Front Left: Playback 32 [100%] [0.00dB]
  Front Right: Playback 32 [100%] [0.00dB]
Simple mixer control 'PGA8.0 8 Master',0
  Capabilities: pvolume
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 32
  Mono:
  Front Left: Playback 32 [100%] [0.00dB]
  Front Right: Playback 32 [100%] [0.00dB]
Simple mixer control 'rt1308-1 DAC L',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'rt1308-1 DAC R',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'rt1308-1 RX Channel Select',0
  Capabilities: enum
  Items: 'LR' 'LL' 'RL' 'RR'
  Item0: 'LL'
Simple mixer control 'rt1308-2 DAC L',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'rt1308-2 DAC R',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'rt1308-2 RX Channel Select',0
  Capabilities: enum
  Items: 'LR' 'LL' 'RL' 'RR'
  Item0: 'RR'
Simple mixer control 'rt711 ADC 08',0
  Capabilities: cvolume cswitch
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 63
  Front Left: Capture 63 [100%] [30.00dB] [on]
  Front Right: Capture 63 [100%] [30.00dB] [on]
Simple mixer control 'rt711 ADC 09',0
  Capabilities: cvolume cswitch
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 63
  Front Left: Capture 23 [37%] [0.00dB] [off]
  Front Right: Capture 23 [37%] [0.00dB] [off]
Simple mixer control 'rt711 ADC 22 Mux',0
  Capabilities: enum
  Items: 'MIC2' 'LINE1' 'LINE2' 'DMIC'
  Item0: 'MIC2'
Simple mixer control 'rt711 ADC 23 Mux',0
  Capabilities: enum
  Items: 'MIC2' 'LINE1' 'LINE2' 'DMIC'
  Item0: 'MIC2'
Simple mixer control 'rt711 AMIC',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 1 [33%] [10.00dB]
  Front Right: 1 [33%] [10.00dB]
Simple mixer control 'rt711 DAC Surr',0
  Capabilities: pvolume
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 87
  Mono:
  Front Left: Playback 87 [100%] [0.00dB]
  Front Right: Playback 87 [100%] [0.00dB]
Simple mixer control 'rt711 DMIC1',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%] [0.00dB]
  Front Right: 0 [0%] [0.00dB]
Simple mixer control 'rt711 DMIC2',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%] [0.00dB]
  Front Right: 0 [0%] [0.00dB]
Simple mixer control 'rt715 ADC 07',0
  Capabilities: cvolume cswitch
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 63
  Front Left: Capture 0 [0%] [-17.25dB] [on]
  Front Right: Capture 23 [37%] [0.00dB] [on]
Simple mixer control 'rt715 ADC 08',0
  Capabilities: cvolume cswitch
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 63
  Front Left: Capture 0 [0%] [-17.25dB] [off]
  Front Right: Capture 23 [37%] [0.00dB] [off]
Simple mixer control 'rt715 ADC 09',0
  Capabilities: cvolume cswitch
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 63
  Front Left: Capture 0 [0%] [-17.25dB] [off]
  Front Right: Capture 23 [37%] [0.00dB] [off]
Simple mixer control 'rt715 ADC 22 Mux',0
  Capabilities: enum
  Items: 'MIC1' 'MIC2' 'LINE1' 'LINE2' 'DMIC1' 'DMIC2' 'DMIC3' 'DMIC4'
  Item0: 'LINE1'
Simple mixer control 'rt715 ADC 23 Mux',0
  Capabilities: enum
  Items: 'MIC1' 'MIC2' 'LINE1' 'LINE2' 'DMIC1' 'DMIC2' 'DMIC3' 'DMIC4'
  Item0: 'LINE2'
Simple mixer control 'rt715 ADC 24 Mux',0
  Capabilities: enum
  Items: 'MIC2' 'DMIC1' 'DMIC2' 'DMIC3' 'DMIC4'
  Item0: 'DMIC3'
Simple mixer control 'rt715 ADC 25 Mux',0
  Capabilities: enum
  Items: 'MIC1' 'DMIC1' 'DMIC2' 'DMIC3' 'DMIC4'
  Item0: 'DMIC4'
Simple mixer control 'rt715 ADC 27',0
  Capabilities: cvolume cswitch
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 63
  Front Left: Capture 0 [0%] [-17.25dB] [on]
  Front Right: Capture 23 [37%] [0.00dB] [on]
Simple mixer control 'rt715 DMIC1 Boost',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%]
  Front Right: 0 [0%]
Simple mixer control 'rt715 DMIC2 Boost',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%]
  Front Right: 0 [0%]
Simple mixer control 'rt715 DMIC3 Boost',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 2 [67%]
  Front Right: 2 [67%]
Simple mixer control 'rt715 DMIC4 Boost',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 2 [67%]
  Front Right: 2 [67%]
Simple mixer control 'rt715 LINE1 Boost',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%]
  Front Right: 0 [0%]
Simple mixer control 'rt715 LINE2 Boost',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%]
  Front Right: 0 [0%]
Simple mixer control 'rt715 MIC1 Boost',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%]
  Front Right: 0 [0%]
Simple mixer control 'rt715 MIC2 Boost',0
  Capabilities: volume
  Playback channels: Front Left - Front Right
  Capture channels: Front Left - Front Right
  Limits: 0 - 3
  Front Left: 0 [0%]
  Front Right: 0 [0%]

!!-------Mixer controls for card USB

Card sysdefault:1 'USB'/'Razer Razer Kraken X USB at usb-0000:3d:00.0-1.1, full speed'
  Mixer name	: 'USB Mixer'
  Components	: 'USB1532:0526'
  Controls      : 6
  Simple ctrls  : 3
Simple mixer control 'PCM',0
  Capabilities: pvolume pswitch pswitch-joined
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 64
  Mono:
  Front Left: Playback 64 [100%] [0.00dB] [on]
  Front Right: Playback 64 [100%] [0.00dB] [on]
Simple mixer control 'Mic',0
  Capabilities: cvolume cvolume-joined
  Capture channels: Mono
  Limits: Capture 0 - 35
  Mono: Capture 30 [86%] [0.00dB]
Simple mixer control 'Auto Gain Control',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [off]

!!-------Mixer controls for card Dock

Card sysdefault:2 'Dock'/'Dell-WD15-Dock'
  Mixer name	: 'USB Mixer'
  Components	: 'USB0bda:402e'
  Controls      : 11
  Simple ctrls  : 5
Simple mixer control 'Headphone',0
  Capabilities: pvolume pswitch pswitch-joined
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 127
  Mono:
  Front Left: Playback 127 [100%] [0.00dB] [on]
  Front Right: Playback 127 [100%] [0.00dB] [on]
Simple mixer control 'Line',0
  Capabilities: pvolume pswitch pswitch-joined
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 127
  Mono:
  Front Left: Playback 127 [100%] [0.00dB] [on]
  Front Right: Playback 127 [100%] [0.00dB] [on]
Simple mixer control 'Mic',0
  Capabilities: cvolume cswitch cswitch-joined
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 127
  Front Left: Capture 67 [53%] [0.00dB] [on]
  Front Right: Capture 67 [53%] [0.00dB] [on]
Simple mixer control 'Extension Unit',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [off]
Simple mixer control 'Loudness',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]


!!Alsactl output
!!--------------

--startcollapse--
state.sofsoundwire {
	control.1 {
		iface MIXER
		name 'rt711 DAC Surr Playback Volume'
		value.0 87
		value.1 87
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 87'
			dbmin -6525
			dbmax 0
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.2 {
		iface MIXER
		name 'rt711 ADC 08 Capture Switch'
		value.0 true
		value.1 true
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.3 {
		iface MIXER
		name 'rt711 ADC 09 Capture Switch'
		value.0 false
		value.1 false
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.4 {
		iface MIXER
		name 'rt711 ADC 08 Capture Volume'
		value.0 63
		value.1 63
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 63'
			dbmin -1725
			dbmax 3000
			dbvalue.0 3000
			dbvalue.1 3000
		}
	}
	control.5 {
		iface MIXER
		name 'rt711 ADC 09 Capture Volume'
		value.0 23
		value.1 23
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 63'
			dbmin -1725
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.6 {
		iface MIXER
		name 'rt711 AMIC Volume'
		value.0 1
		value.1 1
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 1000
			dbvalue.1 1000
		}
	}
	control.7 {
		iface MIXER
		name 'rt711 DMIC1 Volume'
		value.0 0
		value.1 0
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.8 {
		iface MIXER
		name 'rt711 DMIC2 Volume'
		value.0 0
		value.1 0
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.9 {
		iface MIXER
		name 'rt1308-1 RX Channel Select'
		value LL
		comment {
			access 'read write'
			type ENUMERATED
			count 1
			item.0 LR
			item.1 LL
			item.2 RL
			item.3 RR
		}
	}
	control.10 {
		iface MIXER
		name 'rt1308-2 RX Channel Select'
		value RR
		comment {
			access 'read write'
			type ENUMERATED
			count 1
			item.0 LR
			item.1 LL
			item.2 RL
			item.3 RR
		}
	}
	control.11 {
		iface MIXER
		name 'rt715 ADC 07 Capture Switch'
		value.0 true
		value.1 true
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.12 {
		iface MIXER
		name 'rt715 ADC 08 Capture Switch'
		value.0 false
		value.1 false
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.13 {
		iface MIXER
		name 'rt715 ADC 09 Capture Switch'
		value.0 false
		value.1 false
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.14 {
		iface MIXER
		name 'rt715 ADC 27 Capture Switch'
		value.0 true
		value.1 true
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.15 {
		iface MIXER
		name 'rt715 ADC 07 Capture Volume'
		value.0 0
		value.1 23
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 63'
			dbmin -1725
			dbmax 3000
			dbvalue.0 -1725
			dbvalue.1 0
		}
	}
	control.16 {
		iface MIXER
		name 'rt715 ADC 08 Capture Volume'
		value.0 0
		value.1 23
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 63'
			dbmin -1725
			dbmax 3000
			dbvalue.0 -1725
			dbvalue.1 0
		}
	}
	control.17 {
		iface MIXER
		name 'rt715 ADC 09 Capture Volume'
		value.0 0
		value.1 23
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 63'
			dbmin -1725
			dbmax 3000
			dbvalue.0 -1725
			dbvalue.1 0
		}
	}
	control.18 {
		iface MIXER
		name 'rt715 ADC 27 Capture Volume'
		value.0 0
		value.1 23
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 63'
			dbmin -1725
			dbmax 3000
			dbvalue.0 -1725
			dbvalue.1 0
		}
	}
	control.19 {
		iface MIXER
		name 'rt715 DMIC1 Boost'
		value.0 0
		value.1 0
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.20 {
		iface MIXER
		name 'rt715 DMIC2 Boost'
		value.0 0
		value.1 0
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.21 {
		iface MIXER
		name 'rt715 DMIC3 Boost'
		value.0 2
		value.1 2
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 2000
			dbvalue.1 2000
		}
	}
	control.22 {
		iface MIXER
		name 'rt715 DMIC4 Boost'
		value.0 2
		value.1 2
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 2000
			dbvalue.1 2000
		}
	}
	control.23 {
		iface MIXER
		name 'rt715 MIC1 Boost'
		value.0 0
		value.1 0
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.24 {
		iface MIXER
		name 'rt715 MIC2 Boost'
		value.0 0
		value.1 0
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.25 {
		iface MIXER
		name 'rt715 LINE1 Boost'
		value.0 0
		value.1 0
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.26 {
		iface MIXER
		name 'rt715 LINE2 Boost'
		value.0 0
		value.1 0
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 3'
			dbmin 0
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.27 {
		iface MIXER
		name 'Headphone Switch'
		value false
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.28 {
		iface MIXER
		name 'Headset Mic Switch'
		value false
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.29 {
		iface CARD
		name 'Headphone Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.30 {
		iface CARD
		name 'Headset Mic Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.31 {
		iface MIXER
		name 'Speaker Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.32 {
		iface CARD
		name 'HDMI/DP,pcm=5 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.33 {
		iface MIXER
		name 'IEC958 Playback Con Mask'
		value '0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.34 {
		iface MIXER
		name 'IEC958 Playback Pro Mask'
		value '0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.35 {
		iface MIXER
		name 'IEC958 Playback Default'
		value '0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access 'read write'
			type IEC958
			count 1
		}
	}
	control.36 {
		iface MIXER
		name 'IEC958 Playback Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.37 {
		iface PCM
		device 5
		name ELD
		value ''
		comment {
			access 'read volatile'
			type BYTES
			count 0
		}
	}
	control.38 {
		iface CARD
		name 'HDMI/DP,pcm=6 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.39 {
		iface MIXER
		name 'IEC958 Playback Con Mask'
		index 1
		value '0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.40 {
		iface MIXER
		name 'IEC958 Playback Pro Mask'
		index 1
		value '0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.41 {
		iface MIXER
		name 'IEC958 Playback Default'
		index 1
		value '0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access 'read write'
			type IEC958
			count 1
		}
	}
	control.42 {
		iface MIXER
		name 'IEC958 Playback Switch'
		index 1
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.43 {
		iface PCM
		device 6
		name ELD
		value ''
		comment {
			access 'read volatile'
			type BYTES
			count 0
		}
	}
	control.44 {
		iface CARD
		name 'HDMI/DP,pcm=7 Jack'
		value true
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.45 {
		iface MIXER
		name 'IEC958 Playback Con Mask'
		index 2
		value '0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.46 {
		iface MIXER
		name 'IEC958 Playback Pro Mask'
		index 2
		value '0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.47 {
		iface MIXER
		name 'IEC958 Playback Default'
		index 2
		value '0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access 'read write'
			type IEC958
			count 1
		}
	}
	control.48 {
		iface MIXER
		name 'IEC958 Playback Switch'
		index 2
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.49 {
		iface PCM
		device 7
		name ELD
		value '100007006714000100000000000000004c2d4d0c553238453539300907070000'
		comment {
			access 'read volatile'
			type BYTES
			count 32
		}
	}
	control.50 {
		iface PCM
		device 5
		name 'Playback Channel Map'
		value.0 0
		value.1 0
		value.2 0
		value.3 0
		value.4 0
		value.5 0
		value.6 0
		value.7 0
		comment {
			access 'read write'
			type INTEGER
			count 8
			range '0 - 36'
		}
	}
	control.51 {
		iface PCM
		device 6
		name 'Playback Channel Map'
		value.0 0
		value.1 0
		value.2 0
		value.3 0
		value.4 0
		value.5 0
		value.6 0
		value.7 0
		comment {
			access 'read write'
			type INTEGER
			count 8
			range '0 - 36'
		}
	}
	control.52 {
		iface PCM
		device 7
		name 'Playback Channel Map'
		value.0 0
		value.1 0
		value.2 0
		value.3 0
		value.4 0
		value.5 0
		value.6 0
		value.7 0
		comment {
			access 'read write'
			type INTEGER
			count 8
			range '0 - 36'
		}
	}
	control.53 {
		iface MIXER
		name 'rt711 ADC 22 Mux'
		value MIC2
		comment {
			access 'read write'
			type ENUMERATED
			count 1
			item.0 MIC2
			item.1 LINE1
			item.2 LINE2
			item.3 DMIC
		}
	}
	control.54 {
		iface MIXER
		name 'rt711 ADC 23 Mux'
		value MIC2
		comment {
			access 'read write'
			type ENUMERATED
			count 1
			item.0 MIC2
			item.1 LINE1
			item.2 LINE2
			item.3 DMIC
		}
	}
	control.55 {
		iface MIXER
		name 'PGA1.0 1 Master Playback Volume'
		value.0 32
		value.1 32
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 32'
			dbmin -9999999
			dbmax 0
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.56 {
		iface MIXER
		name 'PGA2.0 2 Master Capture Volume'
		value.0 50
		value.1 50
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 80'
			dbmin -9999999
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.57 {
		iface MIXER
		name 'PGA2.0 2 Master Capture Switch'
		value.0 true
		value.1 true
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.58 {
		iface MIXER
		name 'PGA3.1 3 Master Playback Volume'
		value.0 32
		value.1 32
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 32'
			dbmin -9999999
			dbmax 0
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.60 {
		iface MIXER
		name 'PGA5.0 5 Master Capture Volume'
		value.0 50
		value.1 50
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 80'
			dbmin -9999999
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.61 {
		iface MIXER
		name 'PGA5.0 5 Master Capture Switch'
		value.0 true
		value.1 true
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.63 {
		iface MIXER
		name 'PGA6.0 6 Master Playback Volume'
		value.0 32
		value.1 32
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 32'
			dbmin -9999999
			dbmax 0
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.64 {
		iface MIXER
		name 'PGA7.0 7 Master Playback Volume'
		value.0 32
		value.1 32
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 32'
			dbmin -9999999
			dbmax 0
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.65 {
		iface MIXER
		name 'PGA8.0 8 Master Playback Volume'
		value.0 32
		value.1 32
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 32'
			dbmin -9999999
			dbmax 0
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.66 {
		iface MIXER
		name 'rt1308-1 DAC L Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.67 {
		iface MIXER
		name 'rt1308-1 DAC R Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.68 {
		iface MIXER
		name 'rt1308-2 DAC L Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.69 {
		iface MIXER
		name 'rt1308-2 DAC R Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.70 {
		iface MIXER
		name 'rt715 ADC 22 Mux'
		value LINE1
		comment {
			access 'read write'
			type ENUMERATED
			count 1
			item.0 MIC1
			item.1 MIC2
			item.2 LINE1
			item.3 LINE2
			item.4 DMIC1
			item.5 DMIC2
			item.6 DMIC3
			item.7 DMIC4
		}
	}
	control.71 {
		iface MIXER
		name 'rt715 ADC 23 Mux'
		value LINE2
		comment {
			access 'read write'
			type ENUMERATED
			count 1
			item.0 MIC1
			item.1 MIC2
			item.2 LINE1
			item.3 LINE2
			item.4 DMIC1
			item.5 DMIC2
			item.6 DMIC3
			item.7 DMIC4
		}
	}
	control.72 {
		iface MIXER
		name 'rt715 ADC 24 Mux'
		value DMIC3
		comment {
			access 'read write'
			type ENUMERATED
			count 1
			item.0 MIC2
			item.1 DMIC1
			item.2 DMIC2
			item.3 DMIC3
			item.4 DMIC4
		}
	}
	control.73 {
		iface MIXER
		name 'rt715 ADC 25 Mux'
		value DMIC4
		comment {
			access 'read write'
			type ENUMERATED
			count 1
			item.0 MIC1
			item.1 DMIC1
			item.2 DMIC2
			item.3 DMIC3
			item.4 DMIC4
		}
	}
}
state.USB {
	control.1 {
		iface PCM
		name 'Capture Channel Map'
		value.0 3
		value.1 4
		comment {
			access read
			type INTEGER
			count 2
			range '0 - 36'
		}
	}
	control.2 {
		iface PCM
		name 'Playback Channel Map'
		value.0 3
		value.1 4
		comment {
			access read
			type INTEGER
			count 2
			range '0 - 36'
		}
	}
	control.3 {
		iface MIXER
		name 'Mic Capture Volume'
		value 30
		comment {
			access 'read write'
			type INTEGER
			count 1
			range '0 - 35'
			dbmin -3000
			dbmax 500
			dbvalue.0 0
		}
	}
	control.4 {
		iface MIXER
		name 'Auto Gain Control'
		value false
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.5 {
		iface MIXER
		name 'PCM Playback Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.6 {
		iface MIXER
		name 'PCM Playback Volume'
		value.0 64
		value.1 64
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 64'
			dbmin -6400
			dbmax 0
			dbvalue.0 0
			dbvalue.1 0
		}
	}
}
state.Dock {
	control.1 {
		iface PCM
		name 'Capture Channel Map'
		value.0 0
		value.1 0
		comment {
			access read
			type INTEGER
			count 2
			range '0 - 36'
		}
	}
	control.2 {
		iface PCM
		name 'Playback Channel Map'
		value.0 0
		value.1 0
		comment {
			access read
			type INTEGER
			count 2
			range '0 - 36'
		}
	}
	control.3 {
		iface PCM
		device 1
		name 'Playback Channel Map'
		value.0 0
		value.1 0
		comment {
			access read
			type INTEGER
			count 2
			range '0 - 36'
		}
	}
	control.4 {
		iface MIXER
		name 'Mic Capture Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.5 {
		iface MIXER
		name 'Mic Capture Volume'
		value.0 67
		value.1 67
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 127'
			dbmin -3350
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.6 {
		iface MIXER
		name Loudness
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.7 {
		iface MIXER
		name 'Extension Unit Switch'
		value false
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.8 {
		iface MIXER
		name 'Headphone Playback Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.9 {
		iface MIXER
		name 'Headphone Playback Volume'
		value.0 127
		value.1 127
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 127'
			dbmin -6350
			dbmax 0
			dbvalue.0 0
			dbvalue.1 0
		}
	}
	control.10 {
		iface MIXER
		name 'Line Playback Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.11 {
		iface MIXER
		name 'Line Playback Volume'
		value.0 127
		value.1 127
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 127'
			dbmin -6350
			dbmax 0
			dbvalue.0 0
			dbvalue.1 0
		}
	}
}
--endcollapse--


!!All Loaded Modules
!!------------------

ac97_bus
acpi_pad
acpi_tad
acpi_thermal_rel
aesni_intel
af_alg
agpgart
algif_hash
algif_skcipher
atkbd
blake2b_generic
bluetooth
bnep
br_netfilter
bridge
btbcm
btintel
btrfs
btrtl
btusb
cbc
cdc_ether
cec
cfg80211
cmac
coretemp
crc16
crc32_pclmul
crc32c_generic
crc32c_intel
crct10dif_pclmul
cros_ec
cros_ec_ishtp
cryptd
crypto_simd
crypto_user
dcdbas
dell_laptop
dell_smbios
dell_smm_hwmon
dell_wmi
dell_wmi_descriptor
dell_wmi_sysman
dm_crypt
dm_log
dm_mirror
dm_mod
dm_region_hash
drm
drm_kms_helper
ecc
ecdh_generic
ee1004
encrypted_keys
fb_sys_fops
fuse
ghash_clmulni_intel
hid_logitech_hidpp
hid_multitouch
hid_sensor_als
hid_sensor_custom
hid_sensor_hub
hid_sensor_iio_common
hid_sensor_trigger
i2c_algo_bit
i2c_hid
i2c_hid_acpi
i2c_i801
i2c_smbus
i8042
i915
iTCO_vendor_support
iTCO_wdt
idma64
industrialio
industrialio_triggered_buffer
int3400_thermal
int3403_thermal
int340x_thermal_zone
intel_cstate
intel_gtt
intel_hid
intel_ish_ipc
intel_ishtp
intel_ishtp_hid
intel_ishtp_loader
intel_lpss
intel_lpss_pci
intel_pch_thermal
intel_pmc_bxt
intel_powerclamp
intel_rapl_common
intel_rapl_msr
intel_soc_dts_iosf
intel_uncore
intel_wmi_thunderbolt
ip6_tables
ip6table_filter
ip6table_mangle
ip6table_nat
ip_tables
ipt_REJECT
iptable_filter
iptable_mangle
iptable_nat
irqbypass
iwlmvm
iwlwifi
joydev
kfifo_buf
kvm
kvm_intel
ledtrig_audio
libarc4
libcrc32c
libps2
llc
mac80211
mac_hid
mc
mei
mei_hdcp
mei_me
mei_wdt
mii
mmc_core
mousedev
nf_conntrack
nf_conntrack_netlink
nf_defrag_ipv4
nf_defrag_ipv6
nf_nat
nf_reject_ipv4
nfnetlink
nvidia
nvidia_drm
nvidia_modeset
pcspkr
processor_thermal_device
processor_thermal_mbox
processor_thermal_rapl
processor_thermal_rfim
psmouse
r8152
r8153_ecm
raid6_pq
rapl
regmap_sdw
rfcomm
rfkill
rng_core
roles
rtsx_pci
rtsx_pci_sdmmc
serio
serio_raw
snd
snd_compress
snd_hda_codec
snd_hda_codec_hdmi
snd_hda_core
snd_hda_ext_core
snd_hda_intel
snd_hrtimer
snd_hwdep
snd_intel_dspcfg
snd_intel_sdw_acpi
snd_pcm
snd_pcm_dmaengine
snd_rawmidi
snd_seq
snd_seq_device
snd_seq_dummy
snd_soc_acpi
snd_soc_acpi_intel_match
snd_soc_core
snd_soc_dmic
snd_soc_hdac_hda
snd_soc_hdac_hdmi
snd_soc_rt1308_sdw
snd_soc_rt711
snd_soc_rt715
snd_soc_skl
snd_soc_sof_sdw
snd_soc_sst_dsp
snd_soc_sst_ipc
snd_sof
snd_sof_intel_hda
snd_sof_intel_hda_common
snd_sof_pci
snd_sof_pci_intel_cnl
snd_sof_xtensa_dsp
snd_timer
snd_usb_audio
snd_usbmidi_lib
soundcore
soundwire_bus
soundwire_cadence
soundwire_generic_allocation
soundwire_intel
sparse_keymap
stp
syscopyarea
sysfillrect
sysimgblt
thunderbolt
tpm
tpm_crb
tpm_tis
tpm_tis_core
trusted
tun
typec
typec_ucsi
ucsi_acpi
usbhid
usbnet
uvcvideo
v4l2loopback
video
videobuf2_common
videobuf2_memops
videobuf2_v4l2
videobuf2_vmalloc
videodev
wmi
wmi_bmof
x86_pkg_temp_thermal
x_tables
xhci_pci
xhci_pci_renesas
xor
xt_CHECKSUM
xt_MASQUERADE
xt_addrtype
xt_conntrack
xt_tcpudp


!!Sysfs Files
!!-----------

/sys/class/sound/hwC0D2/init_pin_configs:
0x05 0x18560010
0x06 0x18560010
0x07 0x18560010

/sys/class/sound/hwC0D2/driver_pin_configs:

/sys/class/sound/hwC0D2/user_pin_configs:

/sys/class/sound/hwC0D2/init_verbs:

/sys/class/sound/hwC0D2/hints:


!!ALSA/HDA dmesg
!!--------------
```
</details>

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/100
Repository URL: https://github.com/alsa-project/alsa-utils
