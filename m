Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C91469257
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 10:26:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85FD31FB6;
	Mon,  6 Dec 2021 10:25:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85FD31FB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638782770;
	bh=Ih7nPm89xI67fDsehn5BpEHBOY7A2alRul8P5rqqqXk=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sTIJRmLmL+xRwDho8pzLeCnw7FRm3SxOGcqRvy/o9THvrFGXggJDsrRQ0ZvfokUFM
	 BT4Vy/ArCKP2AxhCYZfJVxqPwHzFbk4aWzsk03ywcO7E3VubKU8EfZkg6VO0/vpXQw
	 UMsh20MKO8f1ZqRGdQNpvL/i5Bnze3euc240fc24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF5CEF80108;
	Mon,  6 Dec 2021 10:24:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E0BEF8023B; Sat,  4 Dec 2021 15:24:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hz.preining.info (hz.preining.info [IPv6:2a01:4f9:2a:1a08::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB9B9F80134
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:24:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB9B9F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=preining.info header.i=@preining.info
 header.b="VEcMEWBq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=preining.info; s=201909; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LcTjqQ5lU1tw54aU1ni4rh5kHwlLAqgOytQ3ycnjEZQ=; b=VEcMEWBqszUaTAeBcXjGCsTtGV
 G0AyQbwJV8FCDTbqqbOsOT+vIfW1tYpxdOaTg6GrUZAzuimQm4VAQpIZLfpJeIKbDhT+pkP9hAKNs
 WcDFtcSOBIB4XGl9O2WncAd6IeIuFJxki3TUpkUoeyRYnfFIQtGCs+XuiZjFNEYKYq7Oe6kAPXZGb
 lfq9VGKiZf0e3Xo0QtoqYE0rz01+e37Y1W301kKqIG+/J7LNODn2TWuSvDqH7Z1wWb2ngoTR8imus
 o7HXMZ14y59WxuKOQL3iylUbmuWEnlw8mbhcI5FRWmKGQYdjQ1dEFDYuuw9O+D+fEQJO9QNzuLCWQ
 BrEKaIEg==;
Received: from kd210155031020.ec-userreverse.dion.ne.jp ([210.155.31.20]
 helo=sakefilet.preining.info)
 by hz.preining.info with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <norbert@preining.info>)
 id 1mtVxe-00013z-J8
 for alsa-devel@alsa-project.org; Sat, 04 Dec 2021 14:24:23 +0000
Received: by sakefilet.preining.info (Postfix, from userid 1000)
 id BACCE172D6B1; Sat,  4 Dec 2021 23:23:37 +0900 (JST)
Date: Sat, 4 Dec 2021 23:23:37 +0900
From: Norbert Preining <norbert@preining.info>
To: alsa-devel@alsa-project.org
Subject: Support for 8086:ae20 Intel Smart Sound Technology on Fujitsu Lifebook
Message-ID: <Yat56SpjuUAxm2Gc@sakefilet.preining.info>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="y5Y3lKiRceMHHVdy"
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 06 Dec 2021 10:24:03 +0100
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


--y5Y3lKiRceMHHVdy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Dear all,

(please Cc)

today I realized that the built-in microphone (next to the webcam) 
of my Fujitsu Lifebook U-series is not detected. (I usully use a
headset, but due to travelling was forced to use the internal).

I tried hard to get this device working, but neither with my
self-compiled kernel (5.15.6) nor the Debian kernel distribution kernel
5.15 the microphone seems to be detected.

I booted into Windows and tried to find out what the device might be. My
**guess** is what is mentioned as
	Intel Smart Sound Technology
with
	Vendor ID	8086
	Device ID	ae20
I git grepped the kernel sources for this, and snd-hda-intel contains
quite some mentioning about Vendor ID 8086, but ae20 is not appearing.

Now the interesting thing is that booting into linux and using lspci and
lsusb, I cannot see a single device with the above specifications:

lspci:
root@sakefilet /usr/src/git/linux/Documentation # lspci
00:00.0 Host bridge: Intel Corporation Comet Lake-U v1 4c Host Bridge/DRAM Controller (rev 0c)
00:02.0 VGA compatible controller: Intel Corporation CometLake-U GT2 [UHD Graphics] (rev 02)
00:04.0 Signal processing controller: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem (rev 0c)
00:12.0 Signal processing controller: Intel Corporation Comet Lake Thermal Subsytem
00:14.0 USB controller: Intel Corporation Comet Lake PCH-LP USB 3.1 xHCI Host Controller
00:14.2 RAM memory: Intel Corporation Comet Lake PCH-LP Shared SRAM
00:14.3 Network controller: Intel Corporation Comet Lake PCH-LP CNVi WiFi
00:15.0 Serial bus controller [0c80]: Intel Corporation Serial IO I2C Host Controller
00:15.1 Serial bus controller [0c80]: Intel Corporation Comet Lake Serial IO I2C Host Controller
00:15.3 Serial bus controller [0c80]: Intel Corporation Device 02eb
00:16.0 Communication controller: Intel Corporation Comet Lake Management Engine Interface
00:16.3 Serial controller: Intel Corporation Device 02e3
00:1c.0 PCI bridge: Intel Corporation Comet Lake PCI Express Root Port #1 (rev f0)
00:1c.4 PCI bridge: Intel Corporation Comet Lake PCI Express Root Port #5 (rev f0)
00:1d.0 PCI bridge: Intel Corporation Comet Lake PCI Express Root Port #9 (rev f0)
00:1d.4 PCI bridge: Intel Corporation Comet Lake PCI Express Root Port #13 (rev f0)
00:1e.0 Communication controller: Intel Corporation Device 02a8
00:1e.1 Communication controller: Intel Corporation Device 02a9
00:1f.0 ISA bridge: Intel Corporation Comet Lake PCH-LP LPC Premium Controller/eSPI Controller
00:1f.3 Multimedia audio controller: Intel Corporation Comet Lake PCH-LP cAVS
00:1f.4 SMBus: Intel Corporation Comet Lake PCH-LP SMBus Host Controller
00:1f.5 Serial bus controller [0c80]: Intel Corporation Comet Lake SPI (flash) Controller
00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (10) I219-LM
06:00.0 PCI bridge: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] (rev 06)
07:00.0 PCI bridge: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] (rev 06)
07:01.0 PCI bridge: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] (rev 06)
07:02.0 PCI bridge: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] (rev 06)
07:04.0 PCI bridge: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] (rev 06)
08:00.0 System peripheral: Intel Corporation JHL7540 Thunderbolt 3 NHI [Titan Ridge 4C 2018] (rev 06)
3d:00.0 USB controller: Intel Corporation JHL7540 Thunderbolt 3 USB Controller [Titan Ridge 4C 2018] (rev 06)
72:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller SM981/PM981/PM983
77:00.0 SD Host controller: O2 Micro, Inc. SD/MMC Card Reader Controller (rev 01)


lsusb:
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 004: ID 04f2:b6e1 Chicony Electronics Co., Ltd FJ Camera
Bus 001 Device 003: ID 298d:2033 Next Biometrics NB-2033-U
Bus 001 Device 002: ID 058f:9540 Alcor Micro Corp. AU9540 Smartcard Reader
Bus 001 Device 005: ID 8087:0026 Intel Corp. AX201 Bluetooth
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub


I attach the output of alsa-info for completeness. 
The kernel version is 5.15.6 with some patches from xannmod, but I could
reproduce the same behaviour with standard Debian kernel 5.15.

Am I missing some config option, or is the vendorid/devid not supported
by now?

Thanks for every suggestion,

(Please CC!)

Al the best

Norbert

--
PREINING Norbert                              https://www.preining.info
Fujitsu Research  +  IFMGA Guide  +  TU Wien  +  TeX Live  + Debian Dev
GPG: 0x860CDC13   fp: F7D8 A928 26E3 16A1 9FA0 ACF0 6CAC A448 860C DC13

--y5Y3lKiRceMHHVdy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="alsa-info.txt.YKYzO3AnM8"

upload=true&script=true&cardinfo=
!!################################
!!ALSA Information Script v 0.5.0
!!################################

!!Script ran on: Sat Dec  4 14:20:27 UTC 2021


!!Linux Distribution
!!------------------

Debian GNU/Linux bookworm/sid \n \l PRETTY_NAME="Debian GNU/Linux bookworm/sid" NAME="Debian GNU/Linux" ID=debian HOME_URL="https://www.debian.org/" SUPPORT_URL="https://www.debian.org/support" BUG_REPORT_URL="https://bugs.debian.org/"


!!DMI Information
!!---------------

Manufacturer:      FUJITSU CLIENT COMPUTING LIMITED
Product Name:      FMVU32012
Product Version:   
Firmware Version:  Version 2.13
System SKU:        SK00
Board Vendor:      FUJITSU CLIENT COMPUTING LIMITED
Board Name:        FJNB2D9


!!ACPI Device Status Information
!!---------------

/sys/bus/acpi/devices/ACPI0003:00/status 	 15
/sys/bus/acpi/devices/ACPI000C:00/status 	 15
/sys/bus/acpi/devices/ACPI000E:00/status 	 15
/sys/bus/acpi/devices/FUJ02E3:00/status 	 15
/sys/bus/acpi/devices/FUJ0309:00/status 	 15
/sys/bus/acpi/devices/FUJ0435:00/status 	 15
/sys/bus/acpi/devices/IFX0785:00/status 	 15
/sys/bus/acpi/devices/INT33A1:00/status 	 15
/sys/bus/acpi/devices/INT3400:00/status 	 15
/sys/bus/acpi/devices/INT3403:00/status 	 15
/sys/bus/acpi/devices/INT340E:00/status 	 15
/sys/bus/acpi/devices/INT34BB:00/status 	 15
/sys/bus/acpi/devices/INT3F0D:00/status 	 15
/sys/bus/acpi/devices/LNXPOWER:00/status 	 1
/sys/bus/acpi/devices/LNXPOWER:01/status 	 15
/sys/bus/acpi/devices/LNXPOWER:02/status 	 1
/sys/bus/acpi/devices/LNXPOWER:03/status 	 1
/sys/bus/acpi/devices/LNXPOWER:04/status 	 1
/sys/bus/acpi/devices/LNXPOWER:05/status 	 1
/sys/bus/acpi/devices/LNXPOWER:06/status 	 1
/sys/bus/acpi/devices/PNP0103:00/status 	 15
/sys/bus/acpi/devices/PNP0800:00/status 	 15
/sys/bus/acpi/devices/PNP0C02:00/status 	 3
/sys/bus/acpi/devices/PNP0C02:01/status 	 3
/sys/bus/acpi/devices/PNP0C02:04/status 	 3
/sys/bus/acpi/devices/PNP0C0A:00/status 	 31
/sys/bus/acpi/devices/PNP0C0C:00/status 	 15
/sys/bus/acpi/devices/PRP00001:00/status 	 11
/sys/bus/acpi/devices/SAPS2101:00/status 	 15
/sys/bus/acpi/devices/USBC000:00/status 	 15
/sys/bus/acpi/devices/device:17/status 	 15


!!Kernel Information
!!------------------

Kernel release:    5.15.6+futex+zstd+intel+wine+
Operating System:  GNU/Linux
Architecture:      x86_64
Processor:         unknown
SMP Enabled:       Yes


!!ALSA Version
!!------------

Driver version:     k5.15.6+futex+zstd+intel+wine+
Library version:    1.2.5.1
Utilities version:  1.2.5.1


!!Loaded ALSA modules
!!-------------------

snd_hda_intel (card 0)


!!Sound Servers on this system
!!----------------------------

PipeWire:
      Installed - Yes (/usr/bin/pipewire)
      Running - Yes

Pulseaudio:
      Installed - Yes (/usr/bin/pulseaudio)
      Running - No

Jack:
      Installed - Yes (/usr/bin/jackd)
      Running - No


!!Soundcards recognised by ALSA
!!-----------------------------

 0 [PCH            ]: HDA-Intel - HDA Intel PCH
                      HDA Intel PCH at 0xa2130000 irq 172


!!PCI Soundcards installed in the system
!!--------------------------------------

00:1f.3 Multimedia audio controller [0401]: Intel Corporation Comet Lake PCH-LP cAVS [8086:02c8]
	Subsystem: Fujitsu Client Computing Limited Comet Lake PCH-LP cAVS [1e26:0040]


!!Modprobe options (Sound related)
!!--------------------------------

snd_pcsp: index=-2
snd_usb_audio: index=-2
snd_atiixp_modem: index=-2
snd_intel8x0m: index=-2
snd_via82xx_modem: index=-2
snd_intel_dspcfg: dsp_driver=1


!!Loaded sound module options
!!---------------------------

!!Module: snd_hda_intel
	align_buffer_size : -1
	bdl_pos_adj : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	beep_mode : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
	dmic_detect : Y
	enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
	enable_msi : -1
	id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	index : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	jackpoll_ms : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	model : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	patch : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	pm_blacklist : Y
	position_fix : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	power_save : 1
	power_save_controller : Y
	probe_mask : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	probe_only : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	single_cmd : -1
	snoop : -1


!!Sysfs card info
!!---------------

!!Card: /sys/class/sound/card0
Driver: /sys/bus/pci/drivers/snd_hda_intel
Tree:
	/sys/class/sound/card0
	|-- controlC0
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- power
	|   |-- subsystem -> ../../../../../../class/sound
	|   `-- uevent
	|-- device -> ../../../0000:00:1f.3
	|-- hwC0D0
	|   |-- afg
	|   |-- chip_name
	|   |-- clear
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- driver_pin_configs
	|   |-- hints
	|   |-- init_pin_configs
	|   |-- init_verbs
	|   |-- mfg
	|   |-- modelname
	|   |-- power
	|   |-- power_off_acct
	|   |-- power_on_acct
	|   |-- reconfig
	|   |-- revision_id
	|   |-- subsystem -> ../../../../../../class/sound
	|   |-- subsystem_id
	|   |-- uevent
	|   |-- user_pin_configs
	|   |-- vendor_id
	|   `-- vendor_name
	|-- hwC0D2
	|   |-- afg
	|   |-- chip_name
	|   |-- clear
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- driver_pin_configs
	|   |-- hints
	|   |-- init_pin_configs
	|   |-- init_verbs
	|   |-- mfg
	|   |-- modelname
	|   |-- power
	|   |-- power_off_acct
	|   |-- power_on_acct
	|   |-- reconfig
	|   |-- revision_id
	|   |-- subsystem -> ../../../../../../class/sound
	|   |-- subsystem_id
	|   |-- uevent
	|   |-- user_pin_configs
	|   |-- vendor_id
	|   `-- vendor_name
	|-- id
	|-- input10
	|   |-- capabilities
	|   |-- device -> ../../card0
	|   |-- event10
	|   |-- id
	|   |-- inhibited
	|   |-- modalias
	|   |-- name
	|   |-- phys
	|   |-- power
	|   |-- properties
	|   |-- subsystem -> ../../../../../../class/input
	|   |-- uevent
	|   `-- uniq
	|-- input11
	|   |-- capabilities
	|   |-- device -> ../../card0
	|   |-- event11
	|   |-- id
	|   |-- inhibited
	|   |-- modalias
	|   |-- name
	|   |-- phys
	|   |-- power
	|   |-- properties
	|   |-- subsystem -> ../../../../../../class/input
	|   |-- uevent
	|   `-- uniq
	|-- input12
	|   |-- capabilities
	|   |-- device -> ../../card0
	|   |-- event12
	|   |-- id
	|   |-- inhibited
	|   |-- modalias
	|   |-- name
	|   |-- phys
	|   |-- power
	|   |-- properties
	|   |-- subsystem -> ../../../../../../class/input
	|   |-- uevent
	|   `-- uniq
	|-- input6
	|   |-- capabilities
	|   |-- device -> ../../card0
	|   |-- event6
	|   |-- id
	|   |-- inhibited
	|   |-- modalias
	|   |-- name
	|   |-- phys
	|   |-- power
	|   |-- properties
	|   |-- subsystem -> ../../../../../../class/input
	|   |-- uevent
	|   `-- uniq
	|-- input7
	|   |-- capabilities
	|   |-- device -> ../../card0
	|   |-- event7
	|   |-- id
	|   |-- inhibited
	|   |-- modalias
	|   |-- name
	|   |-- phys
	|   |-- power
	|   |-- properties
	|   |-- subsystem -> ../../../../../../class/input
	|   |-- uevent
	|   `-- uniq
	|-- input8
	|   |-- capabilities
	|   |-- device -> ../../card0
	|   |-- event8
	|   |-- id
	|   |-- inhibited
	|   |-- modalias
	|   |-- name
	|   |-- phys
	|   |-- power
	|   |-- properties
	|   |-- subsystem -> ../../../../../../class/input
	|   |-- uevent
	|   `-- uniq
	|-- input9
	|   |-- capabilities
	|   |-- device -> ../../card0
	|   |-- event9
	|   |-- id
	|   |-- inhibited
	|   |-- modalias
	|   |-- name
	|   |-- phys
	|   |-- power
	|   |-- properties
	|   |-- subsystem -> ../../../../../../class/input
	|   |-- uevent
	|   `-- uniq
	|-- number
	|-- pcmC0D0c
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../class/sound
	|   `-- uevent
	|-- pcmC0D0p
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../class/sound
	|   `-- uevent
	|-- pcmC0D10p
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../class/sound
	|   `-- uevent
	|-- pcmC0D2c
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../class/sound
	|   `-- uevent
	|-- pcmC0D3p
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../class/sound
	|   `-- uevent
	|-- pcmC0D7p
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../class/sound
	|   `-- uevent
	|-- pcmC0D8p
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../class/sound
	|   `-- uevent
	|-- pcmC0D9p
	|   |-- dev
	|   |-- device -> ../../card0
	|   |-- pcm_class
	|   |-- power
	|   |-- subsystem -> ../../../../../../class/sound
	|   `-- uevent
	|-- power
	|   |-- async
	|   |-- autosuspend_delay_ms
	|   |-- control
	|   |-- runtime_active_kids
	|   |-- runtime_active_time
	|   |-- runtime_enabled
	|   |-- runtime_status
	|   |-- runtime_suspended_time
	|   `-- runtime_usage
	|-- subsystem -> ../../../../../class/sound
	`-- uevent


!!HDA-Intel Codec information
!!---------------------------
--startcollapse--

Codec: Realtek ALC255
Address: 0
AFG Function Id: 0x1 (unsol 1)
Vendor Id: 0x10ec0255
Subsystem Id: 0x1e267504
Revision Id: 0x100002
No Modem Function Group found
Default PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
Default Amp-In caps: N/A
Default Amp-Out caps: N/A
State of AFG node 0x01:
  Power states:  D0 D1 D2 D3 D3cold CLKSTOP EPSS
  Power: setting=D0, actual=D0
GPIO: io=3, o=0, i=0, unsolicited=1, wake=0
  IO[0]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
  IO[1]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
  IO[2]: enable=0, dir=0, wake=0, sticky=0, data=0, unsol=0
Node 0x02 [Audio Output] wcaps 0x41d: Stereo Amp-Out
  Control: name="Speaker Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
  Amp-Out vals:  [0x38 0x38]
  Converter: stream=0, channel=0
  PCM:
    rates [0x60]: 44100 48000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x03 [Audio Output] wcaps 0x41d: Stereo Amp-Out
  Control: name="Headphone Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Device: name="ALC255 Analog", type="Audio", device=0
  Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
  Amp-Out vals:  [0x00 0x00]
  Converter: stream=0, channel=0
  PCM:
    rates [0x60]: 44100 48000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x04 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x05 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x06 [Audio Output] wcaps 0x611: Stereo Digital
  Converter: stream=0, channel=0
  Digital:
  Digital category: 0x0
  IEC Coding Type: 0x0
  PCM:
    rates [0x5e0]: 44100 48000 88200 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x07 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x08 [Audio Input] wcaps 0x10051b: Stereo Amp-In
  Device: name="ALC255 Analog", type="Audio", device=0
  Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
  Amp-In vals:  [0x97 0x97]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x23
Node 0x09 [Audio Input] wcaps 0x10051b: Stereo Amp-In
  Device: name="ALC255 Alt Analog", type="Audio", device=2
  Amp-In caps: ofs=0x17, nsteps=0x3f, stepsize=0x02, mute=1
  Amp-In vals:  [0x97 0x97]
  Converter: stream=0, channel=0
  SDI-Select: 0
  PCM:
    rates [0x560]: 44100 48000 96000 192000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x22
Node 0x0a [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0b [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Control: name="Beep Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=4, ofs=0
  Control: name="Beep Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=In, idx=4, ofs=0
  Amp-In caps: ofs=0x17, nsteps=0x1f, stepsize=0x05, mute=1
  Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
  Connection: 5
     0x18 0x19 0x1a 0x1b 0x1d
Node 0x0c [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x00 0x00] [0x80 0x80]
  Connection: 2
     0x02 0x0b
Node 0x0d [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x00 0x00] [0x80 0x80]
  Connection: 2
     0x03 0x0b
Node 0x0e [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x0f [Audio Mixer] wcaps 0x20010a: Mono Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x00 0x00]
  Connection: 1
     0x0d
Node 0x10 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x11 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x12 [Pin Complex] wcaps 0x40040b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00000020: IN
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00:
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x13 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x14 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
  Control: name="Speaker Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x00 0x00]
  Pincap 0x00010014: OUT EAPD Detect
  EAPD 0x2: EAPD
  Pin Default 0x90170110: [Fixed] Speaker at Int N/A
    Conn = Analog, Color = Unknown
    DefAssociation = 0x1, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x0c
Node 0x15 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x16 [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x17 [Pin Complex] wcaps 0x40050c: Mono Amp-Out
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80]
  Pincap 0x00000010: OUT
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00:
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x0f
Node 0x18 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00003724: IN Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x19 [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00003724: IN Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x1a [Pin Complex] wcaps 0x40048b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Pincap 0x00003724: IN Detect
    Vref caps: HIZ 50 GRD 80 100
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x00: VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x1b [Pin Complex] wcaps 0x40058f: Stereo Amp-In Amp-Out
  Amp-In caps: ofs=0x00, nsteps=0x03, stepsize=0x27, mute=0
  Amp-In vals:  [0x00 0x00]
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x0001373c: IN OUT HP EAPD Detect
    Vref caps: HIZ 50 GRD 80 100
  EAPD 0x2: EAPD
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN VREF_HIZ
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 2
     0x0c* 0x0d
Node 0x1c [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x1d [Pin Complex] wcaps 0x400400: Mono
  Pincap 0x00000020: IN
  Pin Default 0x909701f0: [Fixed] Aux at Int N/A
    Conn = Analog, Color = Unknown
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x20: IN
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x1e [Pin Complex] wcaps 0x400781: Stereo Digital
  Pincap 0x00000014: OUT Detect
  Pin Default 0x411111f0: [N/A] Speaker at Ext Rear
    Conn = 1/8, Color = Black
    DefAssociation = 0xf, Sequence = 0x0
    Misc = NO_PRESENCE
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 1
     0x06
Node 0x1f [Vendor Defined Widget] wcaps 0xf00000: Mono
Node 0x20 [Vendor Defined Widget] wcaps 0xf00040: Mono
  Processing caps: benign=0, ncoeff=76
Node 0x21 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
  Control: name="Headphone Playback Switch", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-Out vals:  [0x80 0x80]
  Pincap 0x0001001c: OUT HP EAPD Detect
  EAPD 0x2: EAPD
  Pin Default 0x03211020: [Jack] HP Out at Ext Left
    Conn = 1/8, Color = Black
    DefAssociation = 0x2, Sequence = 0x0
  Pin-ctls: 0xc0: OUT HP
  Unsolicited: tag=01, enabled=1
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
  Connection: 2
     0x0c 0x0d*
Node 0x22 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
  Connection: 6
     0x18 0x19 0x1a 0x1b 0x1d 0x0b
Node 0x23 [Audio Mixer] wcaps 0x20010b: Stereo Amp-In
  Amp-In caps: ofs=0x00, nsteps=0x00, stepsize=0x00, mute=1
  Amp-In vals:  [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80] [0x80 0x80]
  Connection: 7
     0x18 0x19 0x1a 0x1b 0x1d 0x0b 0x12
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
  Pin-ctls: 0x00:
  Unsolicited: tag=00, enabled=0
  Power states:  D0 D3 EPSS
  Power: setting=D0, actual=D0
  Devices: 0
  Connection: 0
Node 0x08 [Vendor Defined Widget] wcaps 0xf00000: Mono
--endcollapse--


!!ALSA Device nodes
!!-----------------

crw-rw----+ 1 root audio 116, 12 Dec  4 23:06 /dev/snd/controlC0
crw-rw----+ 1 root audio 116, 10 Dec  4 23:06 /dev/snd/hwC0D0
crw-rw----+ 1 root audio 116, 11 Dec  4 23:06 /dev/snd/hwC0D2
crw-rw----+ 1 root audio 116,  3 Dec  4 23:06 /dev/snd/pcmC0D0c
crw-rw----+ 1 root audio 116,  2 Dec  4 23:19 /dev/snd/pcmC0D0p
crw-rw----+ 1 root audio 116,  9 Dec  4 23:06 /dev/snd/pcmC0D10p
crw-rw----+ 1 root audio 116,  4 Dec  4 23:06 /dev/snd/pcmC0D2c
crw-rw----+ 1 root audio 116,  5 Dec  4 23:06 /dev/snd/pcmC0D3p
crw-rw----+ 1 root audio 116,  6 Dec  4 23:06 /dev/snd/pcmC0D7p
crw-rw----+ 1 root audio 116,  7 Dec  4 23:06 /dev/snd/pcmC0D8p
crw-rw----+ 1 root audio 116,  8 Dec  4 23:06 /dev/snd/pcmC0D9p
crw-rw----+ 1 root audio 116,  1 Dec  4 23:06 /dev/snd/seq
crw-rw----+ 1 root audio 116, 33 Dec  4 23:06 /dev/snd/timer

/dev/snd/by-path:
total 0
drwxr-xr-x 2 root root  60 Dec  4 23:06 .
drwxr-xr-x 3 root root 320 Dec  4 23:06 ..
lrwxrwxrwx 1 root root  12 Dec  4 23:06 pci-0000:00:1f.3 -> ../controlC0


!!Aplay/Arecord output
!!--------------------

APLAY

XDG_RUNTIME_DIR (/run/user/1000) is not owned by us (uid 0), but by uid 1000! (This could e.g. happen if you try to connect to a non-root PulseAudio as a root user, over the native protocol. Don't do that.)
**** List of PLAYBACK Hardware Devices ****
card 0: PCH [HDA Intel PCH], device 0: ALC255 Analog [ALC255 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 3: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 7: HDMI 1 [HDMI 1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 8: HDMI 2 [HDMI 2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 9: HDMI 3 [HDMI 3]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 10: HDMI 4 [HDMI 4]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

ARECORD

XDG_RUNTIME_DIR (/run/user/1000) is not owned by us (uid 0), but by uid 1000! (This could e.g. happen if you try to connect to a non-root PulseAudio as a root user, over the native protocol. Don't do that.)
**** List of CAPTURE Hardware Devices ****
card 0: PCH [HDA Intel PCH], device 0: ALC255 Analog [ALC255 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 2: ALC255 Alt Analog [ALC255 Alt Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

!!Amixer output
!!-------------

!!-------Mixer controls for card PCH

XDG_RUNTIME_DIR (/run/user/1000) is not owned by us (uid 0), but by uid 1000! (This could e.g. happen if you try to connect to a non-root PulseAudio as a root user, over the native protocol. Don't do that.)
Card sysdefault:0 'PCH'/'HDA Intel PCH at 0xa2130000 irq 172'
  Mixer name	: 'Realtek ALC255'
  Components	: 'HDA:10ec0255,1e267504,00100002 HDA:8086280b,80860101,00100000'
  Controls      : 52
  Simple ctrls  : 13
XDG_RUNTIME_DIR (/run/user/1000) is not owned by us (uid 0), but by uid 1000! (This could e.g. happen if you try to connect to a non-root PulseAudio as a root user, over the native protocol. Don't do that.)
Simple mixer control 'Master',0
  Capabilities: pvolume pvolume-joined pswitch pswitch-joined
  Playback channels: Mono
  Limits: Playback 0 - 87
  Mono: Playback 56 [64%] [-23.25dB] [on]
Simple mixer control 'Headphone',0
  Capabilities: pvolume pswitch
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 87
  Mono:
  Front Left: Playback 0 [0%] [-65.25dB] [off]
  Front Right: Playback 0 [0%] [-65.25dB] [off]
Simple mixer control 'Speaker',0
  Capabilities: pvolume pswitch
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 87
  Mono:
  Front Left: Playback 87 [100%] [0.00dB] [on]
  Front Right: Playback 87 [100%] [0.00dB] [on]
Simple mixer control 'PCM',0
  Capabilities: pvolume
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 255
  Mono:
  Front Left: Playback 252 [99%] [-0.60dB]
  Front Right: Playback 252 [99%] [-0.60dB]
Simple mixer control 'IEC958',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [off]
Simple mixer control 'IEC958',1
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'IEC958',2
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'IEC958',3
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'IEC958',4
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'Beep',0
  Capabilities: pvolume pswitch
  Playback channels: Front Left - Front Right
  Limits: Playback 0 - 31
  Mono:
  Front Left: Playback 0 [0%] [-34.50dB] [off]
  Front Right: Playback 0 [0%] [-34.50dB] [off]
Simple mixer control 'Auto-Mute Mode',0
  Capabilities: enum
  Items: 'Disabled' 'Enabled'
  Item0: 'Disabled'
Simple mixer control 'Digital',0
  Capabilities: cvolume
  Capture channels: Front Left - Front Right
  Limits: Capture 0 - 120
  Front Left: Capture 60 [50%] [0.00dB]
  Front Right: Capture 60 [50%] [0.00dB]
Simple mixer control 'Loopback Mixing',0
  Capabilities: enum
  Items: 'Disabled' 'Enabled'
  Item0: 'Disabled'


!!Alsactl output
!!--------------

--startcollapse--
state.PCH {
	control.1 {
		iface MIXER
		name 'Headphone Playback Volume'
		value.0 0
		value.1 0
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 87'
			dbmin -6525
			dbmax 0
			dbvalue.0 -6525
			dbvalue.1 -6525
		}
	}
	control.2 {
		iface MIXER
		name 'Headphone Playback Switch'
		value.0 false
		value.1 false
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.3 {
		iface MIXER
		name 'Speaker Playback Volume'
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
	control.4 {
		iface MIXER
		name 'Speaker Playback Switch'
		value.0 true
		value.1 true
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.5 {
		iface MIXER
		name 'Loopback Mixing'
		value Disabled
		comment {
			access 'read write'
			type ENUMERATED
			count 1
			item.0 Disabled
			item.1 Enabled
		}
	}
	control.6 {
		iface MIXER
		name 'Auto-Mute Mode'
		value Disabled
		comment {
			access 'read write'
			type ENUMERATED
			count 1
			item.0 Disabled
			item.1 Enabled
		}
	}
	control.7 {
		iface MIXER
		name 'Beep Playback Volume'
		value.0 0
		value.1 0
		comment {
			access 'read write'
			type INTEGER
			count 2
			range '0 - 31'
			dbmin -3450
			dbmax 1200
			dbvalue.0 -3450
			dbvalue.1 -3450
		}
	}
	control.8 {
		iface MIXER
		name 'Beep Playback Switch'
		value.0 false
		value.1 false
		comment {
			access 'read write'
			type BOOLEAN
			count 2
		}
	}
	control.9 {
		iface MIXER
		name 'Master Playback Volume'
		value 56
		comment {
			access 'read write'
			type INTEGER
			count 1
			range '0 - 87'
			dbmin -6525
			dbmax 0
			dbvalue.0 -2325
		}
	}
	control.10 {
		iface MIXER
		name 'Master Playback Switch'
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.11 {
		iface CARD
		name 'Headphone Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.12 {
		iface CARD
		name 'Speaker Phantom Jack'
		value true
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.13 {
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
	control.14 {
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
	control.15 {
		iface PCM
		device 2
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
	control.16 {
		iface CARD
		name 'HDMI/DP,pcm=3 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.17 {
		iface MIXER
		name 'IEC958 Playback Con Mask'
		value '0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.18 {
		iface MIXER
		name 'IEC958 Playback Pro Mask'
		value '0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.19 {
		iface MIXER
		name 'IEC958 Playback Default'
		value '0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access 'read write'
			type IEC958
			count 1
		}
	}
	control.20 {
		iface MIXER
		name 'IEC958 Playback Switch'
		value false
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.21 {
		iface PCM
		device 3
		name ELD
		value ''
		comment {
			access 'read volatile'
			type BYTES
			count 0
		}
	}
	control.22 {
		iface CARD
		name 'HDMI/DP,pcm=7 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.23 {
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
	control.24 {
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
	control.25 {
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
	control.26 {
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
	control.27 {
		iface PCM
		device 7
		name ELD
		value ''
		comment {
			access 'read volatile'
			type BYTES
			count 0
		}
	}
	control.28 {
		iface CARD
		name 'HDMI/DP,pcm=8 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.29 {
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
	control.30 {
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
	control.31 {
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
	control.32 {
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
	control.33 {
		iface PCM
		device 8
		name ELD
		value ''
		comment {
			access 'read volatile'
			type BYTES
			count 0
		}
	}
	control.34 {
		iface CARD
		name 'HDMI/DP,pcm=9 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.35 {
		iface MIXER
		name 'IEC958 Playback Con Mask'
		index 3
		value '0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.36 {
		iface MIXER
		name 'IEC958 Playback Pro Mask'
		index 3
		value '0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.37 {
		iface MIXER
		name 'IEC958 Playback Default'
		index 3
		value '0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access 'read write'
			type IEC958
			count 1
		}
	}
	control.38 {
		iface MIXER
		name 'IEC958 Playback Switch'
		index 3
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.39 {
		iface PCM
		device 9
		name ELD
		value ''
		comment {
			access 'read volatile'
			type BYTES
			count 0
		}
	}
	control.40 {
		iface CARD
		name 'HDMI/DP,pcm=10 Jack'
		value false
		comment {
			access read
			type BOOLEAN
			count 1
		}
	}
	control.41 {
		iface MIXER
		name 'IEC958 Playback Con Mask'
		index 4
		value '0fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.42 {
		iface MIXER
		name 'IEC958 Playback Pro Mask'
		index 4
		value '0f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access read
			type IEC958
			count 1
		}
	}
	control.43 {
		iface MIXER
		name 'IEC958 Playback Default'
		index 4
		value '0400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000'
		comment {
			access 'read write'
			type IEC958
			count 1
		}
	}
	control.44 {
		iface MIXER
		name 'IEC958 Playback Switch'
		index 4
		value true
		comment {
			access 'read write'
			type BOOLEAN
			count 1
		}
	}
	control.45 {
		iface PCM
		device 10
		name ELD
		value ''
		comment {
			access 'read volatile'
			type BYTES
			count 0
		}
	}
	control.46 {
		iface PCM
		device 3
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
	control.47 {
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
	control.48 {
		iface PCM
		device 8
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
	control.49 {
		iface PCM
		device 9
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
	control.50 {
		iface PCM
		device 10
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
		iface MIXER
		name 'PCM Playback Volume'
		value.0 252
		value.1 252
		comment {
			access 'read write user'
			type INTEGER
			count 2
			range '0 - 255'
			tlv '0000000100000008ffffec1400000014'
			dbmin -5100
			dbmax 0
			dbvalue.0 -60
			dbvalue.1 -60
		}
	}
	control.52 {
		iface MIXER
		name 'Digital Capture Volume'
		value.0 60
		value.1 60
		comment {
			access 'read write user'
			type INTEGER
			count 2
			range '0 - 120'
			tlv '0000000100000008fffff44800000032'
			dbmin -3000
			dbmax 3000
			dbvalue.0 0
			dbvalue.1 0
		}
	}
}
--endcollapse--


!!All Loaded Modules
!!------------------

acpi_pad
acpi_tad
acpi_thermal_rel
auth_rpcgss
binfmt_misc
bluetooth
bnep
br_netfilter
bridge
btbcm
btintel
btrtl
btusb
cfg80211
coretemp
cpufreq_conservative
cpufreq_ondemand
cpufreq_powersave
cpufreq_userspace
cqhci
crc32_pclmul
crct10dif_pclmul
dns_resolver
e1000e
fscache
ghash_clmulni_intel
grace
hid
hid_generic
hid_multitouch
i2c_hid
i2c_hid_acpi
i2c_i801
i2c_smbus
iTCO_vendor_support
iTCO_wdt
idma64
int3400_thermal
int3403_thermal
int340x_thermal_zone
intel_cstate
intel_lpss
intel_lpss_pci
intel_pch_thermal
intel_pmc_bxt
intel_pmc_core
intel_powerclamp
intel_soc_dts_iosf
intel_tcc_cooling
intel_uncore
intel_wmi_thunderbolt
ip_tables
ipt_REJECT
iwlmvm
iwlwifi
joydev
ledtrig_audio
libarc4
llc
lockd
mac80211
mei_wdt
mmc_core
netfs
nf_conntrack
nf_conntrack_netlink
nf_defrag_ipv4
nf_defrag_ipv6
nf_nat
nf_reject_ipv4
nf_tables
nfnetlink
nfs
nfsv4
nft_chain_nat
nft_compat
nft_counter
nls_ascii
nls_cp437
overlay
pcspkr
pps_core
processor_thermal_device
processor_thermal_device_pci_legacy
processor_thermal_mbox
processor_thermal_rapl
processor_thermal_rfim
ptp
rfcomm
rfkill
rng_core
roles
rpcsec_gss_krb5
sdhci
sdhci_pci
serio_raw
snd
snd_compress
snd_hda_codec
snd_hda_codec_generic
snd_hda_codec_hdmi
snd_hda_codec_realtek
snd_hda_core
snd_hda_ext_core
snd_hda_intel
snd_hrtimer
snd_hwdep
snd_intel_dspcfg
snd_intel_sdw_acpi
snd_pcm
snd_seq
snd_seq_device
snd_seq_dummy
snd_soc_acpi
snd_soc_acpi_intel_match
snd_soc_core
snd_soc_hdac_hda
snd_soc_skl
snd_soc_sst_dsp
snd_soc_sst_ipc
snd_sof
snd_sof_intel_hda
snd_sof_intel_hda_common
snd_sof_pci
snd_sof_pci_intel_cnl
snd_sof_xtensa_dsp
snd_timer
soundcore
soundwire_bus
soundwire_cadence
soundwire_generic_allocation
soundwire_intel
stp
sunrpc
thunderbolt
tpm
tpm_crb
tpm_tis
tpm_tis_core
typec
typec_ucsi
ucsi_acpi
uinput
uvcvideo
videobuf2_common
videobuf2_memops
videobuf2_v4l2
videobuf2_vmalloc
watchdog
wmi
wmi_bmof
x86_pkg_temp_thermal
x_tables
xt_CHECKSUM
xt_MASQUERADE
xt_addrtype
xt_conntrack
xt_tcpudp


!!Sysfs Files
!!-----------

/sys/class/sound/hwC0D0/init_pin_configs:
0x12 0x411111f0
0x14 0x90170110
0x17 0x411111f0
0x18 0x411111f0
0x19 0x411111f0
0x1a 0x411111f0
0x1b 0x411111f0
0x1d 0x909701f0
0x1e 0x411111f0
0x21 0x03211020

/sys/class/sound/hwC0D0/driver_pin_configs:

/sys/class/sound/hwC0D0/user_pin_configs:

/sys/class/sound/hwC0D0/init_verbs:

/sys/class/sound/hwC0D0/hints:

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

[    0.988950] ACPI: Added _OSI(Linux-Dell-Video)
[    0.988953] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.988955] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
--
[    9.849962] sdhci-pci 0000:77:00.0: SDHCI controller found [1217:8520] (rev 1)
[    9.863014] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
[    9.863938] iwlwifi 0000:00:14.3: Detected RF HR B3, rfid=0x10a100
[    9.864047] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops)
[    9.874843] mmc0: SDHCI controller on PCI [0000:77:00.0] using ADMA
--
[   10.015224] Error: Driver 'pcspkr' is already registered, aborting...
[   10.017948] snd_hda_codec_realtek hdaudioC0D0: ALC255: SKU not ready 0x909701f0
[   10.018070] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC255: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[   10.018073] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   10.018075] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[   10.018259] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[   10.018261] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[   10.026038] e1000e: Intel(R) PRO/1000 Network Driver
--
[   10.042522] i2c i2c-10: 2/2 memory slots populated (from DMI)
[   10.076272] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:1f.3/sound/card0/input6
[   10.076317] input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input7
[   10.076356] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input8
[   10.076627] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input9
[   10.076659] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input10
[   10.076691] input: HDA Intel PCH HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input11
[   10.076726] input: HDA Intel PCH HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input12
[   10.081066] audit: type=1400 audit(1638626786.061:2): apparmor="STATUS" operation="profile_load" profile="unconfined" name="lsb_release" pid=658 comm="apparmor_parser"


!!Packages installed
!!--------------------

ii  alsa-topology-conf                                          1.2.5.1-2                                 all          ALSA topology configuration files
ii  alsa-ucm-conf                                               1.2.5.1-1                                 all          ALSA Use Case Manager configuration files
ii  alsa-utils                                                  1.2.5.1-1                                 amd64        Utilities for configuring and using ALSA


--y5Y3lKiRceMHHVdy--
