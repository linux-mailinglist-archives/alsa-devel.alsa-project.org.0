Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 877771BE6F0
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 21:07:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25D60168E;
	Wed, 29 Apr 2020 21:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25D60168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588187250;
	bh=q2iCvJeaf003knFuLHaPiGpUk/0GHSTl1ugTA6XvIcA=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kc1AXB+WaQFJTPXHtWwXJbdDBg3XxyAcIWuYTlnHT+szjl5ZWoKu12M14NdKB6UDq
	 778BH/KolWM+JcO5WBNtlF6GjAIO51jLaCxLOHOW5gjzrOLLF4V3ej9WzgDOmNKPFO
	 Z6Z5WCe2/dTvha3XRrciaf0Oe+sXnycAD0l+l4jI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36BDBF80217;
	Wed, 29 Apr 2020 21:05:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA019F8022B; Wed, 29 Apr 2020 21:05:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,PRX_BODY_13,SPF_HELO_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97F42F800D2
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 21:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97F42F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vNiK28b7"
Received: by mail-wr1-x443.google.com with SMTP id d15so3897589wrx.3
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 12:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language;
 bh=Qj5gRq++dkXRpXYPyP8tthEnkxWTXacaUNBJlz5iv2E=;
 b=vNiK28b70sQglWcQOtqKcHzGWZXkPYKBnn4W3kJLly8r7nkc0GVwMV94btr4tXKjKA
 knq+Q6EsXyMz3OEaIiurTdL3Lk5vHL3bOlTET4DEsOwjhyKtywQl+K8wJSCBJ7/9/vIV
 +YdWeoPkyKTLsYPDb2SQeSm1zl1Uqx/pf9gwKl8Hsz7lRzg9lUGxXtmPvYPhFE5eOUAv
 CH2grMVZ5yQOMMDOasipl5PLg3UFHBjL4GEUPO6Q0YTuQQjTexKJhrxw7ahn/PSFNkBz
 06TvL1ridAjJqdwHnFgPdSvTFiEGIh5hr05d5aCeWOFF37Zu3W69Agzkd1HrRk/GKkxd
 uwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=Qj5gRq++dkXRpXYPyP8tthEnkxWTXacaUNBJlz5iv2E=;
 b=nXMguPuFtydtydywp4Y7fZdTdTacuKDjZZ880JepzV+1P7ggthkC9VPstYB54fjPAE
 bLIG0tgf+UKTphet1EHWR8jfmhQAFl5xCalR2CXunHx1nwGhmh6tTXndBa7PVrqhhxPN
 gKXUmKR6AN9ub2x8R/qNbBM4T/tpmYHD3h/ILKg0bKEOa2F0bN5KOQqksxccntfeDiEX
 FZ/ByHOmUHvhwjY5m3XyPSsAzkAOP2PEM7Lst6TTpHXyvY0s6jQij8y82jNlOus6Oz8J
 Vk8+FYNg8lVGK+ngpOkA4u1RzEED2nmv4xwYcOsC5izzzYWnW9pDJD1+53jzrPyP/VG+
 FUDg==
X-Gm-Message-State: AGi0PuYth+8vDoQ2qdTp4HM9O6h/yd53RCAVbjjx+z85qZlGjrJAwVeS
 NduFlH7VqjINZAeod/Mtb+hvZwH0
X-Google-Smtp-Source: APiQypIRpqZZfQbC5Ph+eGk16sy6+lK9v4jESVkonR7hRD6humBMkEIjMiWgxm+0oBW+aLXN1P8t6g==
X-Received: by 2002:a05:6000:1203:: with SMTP id
 e3mr44369327wrx.229.1588187125725; 
 Wed, 29 Apr 2020 12:05:25 -0700 (PDT)
Received: from [192.168.0.192] (125-37-190-109.dsl.ovh.fr. [109.190.37.125])
 by smtp.gmail.com with ESMTPSA id 36sm280274wrc.35.2020.04.29.12.05.24
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2020 12:05:24 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: =?UTF-8?Q?Val=c3=a8re_Photos?= <valere.alibert.photos@gmail.com>
Subject: Issue with Asus UX534FTC / Realtek ALC294 (Intel HDA Audio) : no
 sound on speaker/headphone
Message-ID: <a2e3f9cd-a189-93b0-dc82-551998be07b2@gmail.com>
Date: Wed, 29 Apr 2020 21:05:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

*Issue : Asus UX534FTC / Realtek ALC294 (Intel HDA Audio) : no sound on 
speaker/headphone*

*alsa-info.sh* result : 
http://alsa-project.org/db/?f=60e024dac6825780881069f6d2b2e28992645c6c

Hi,

I'm Valere a French electronic engineer (hardware & software 
development) and I'm moving back from Mac to a full Linux machine using 
Archlinux. I've managed to configure almost everything on the hardware 
plan except for the sound system.

I've searched a lot, but I keep findings options such as :
- changing the "model=" option for "intel hda audio" kernel module, 
which I tried with various options such as 'laptop', 'asus-zenbook', 
'auto', ... (option is taken by driver module verified in /sys/module/...).
- building part of the kernel with a so called "realtek patch" which as 
far as I can tell doesn't include yet my machine (by the way I'm not 
sure how to do that)
- I also have 'hdajackretask' but I can't manage to understand exactly 
what I'm supposed to do with it and even made it working properly
- I've also tried to modify the realteck_patch file and rebuild the 
kernel module for hda_audio_intel, but it's not yet successful

/I'm would appreciate some help, I'm okay to work on coding/testing 
myself the patch and submit it for the mainstream kernel, but I'm gonna 
need help to understand what to do. I don't know how to find what 
routing option or GPIO must be controlled to activate output on 
Speaker/Headphone./

I don't understand the Linux audio system but I'm a C/C++/Python 
programmer both on micro controllers and embedded linux 
(Beaglebone/Raspberry Pi), so I can try to be relatively proactive in 
testing the various solutions.

If a solution is found (I hope so), I'll also document it on Archlinux 
(I created a page for UX534FT).

I added to this mail (under) as much information as I could regardin my 
audio system and computer.

Best regards

Valère
-------

*Intel HD Audio Issue *:
- no sound neither on Speaker nor on Headphones
- integrated microphone working properly
- Bluetooth Audio and USB Audio external keys are ok (so global sound 
management seems ok)

*Alsa Mixer :* HDA Intel PCH with Realtek ALC294 (Pulse Audio Installed, 
PCM Mix Channel activated)

*Vendor : *Asus
*Model : *UX524FT
*Cpu : I*ntel(R) Core(TM) i7-10510U CPU @ 1.80GHz
*Ram : *16 Go
*SSD :* NVME Crucial P1 1To
*GPU :* Optimus/Bumbleed GTX1650 Max-Q

*[@MaxPlanck ~]$ uname -a*
Linux MaxPlanck 5.6.3-arch1-1 #1 SMP PREEMPT Wed, 08 Apr 2020 07:47:16 
+0000 x86_64 GNU/Linux

*[@MaxPlanck ~]$ cat /sys/module/snd_hda_intel/parameters/moel *
auto,(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)

*[@MaxPlanck ~]$ cat /proc/asound/pcm *
00-00: USB Audio : USB Audio : playback 1 : capture 1
01-00: ALC294 Analog : ALC294 Analog : playback 1 : capture 1
01-03: HDMI 0 : HDMI 0 : playback 1
01-07: HDMI 1 : HDMI 1 : playback 1
01-08: HDMI 2 : HDMI 2 : playback 1
01-09: HDMI 3 : HDMI 3 : playback 1
01-10: HDMI 4 : HDMI 4 : playback 1

*[@MaxPlanck ~]$ hwinfo --sound*
18: PCI 1f.3: 0403 Audio device
   [Created at pci.386]
   Unique ID: nS1_.9G5mT1GK4nF
   SysFS ID: /devices/pci0000:00/0000:00:1f.3
   SysFS BusID: 0000:00:1f.3
   Hardware Class: sound
   Model: "Intel Audio device"
   Vendor: pci 0x8086 "Intel Corporation"
   Device: pci 0x02c8
   SubVendor: pci 0x1043 "ASUSTeK Computer Inc."
   SubDevice: pci 0x1a61
   Driver: "snd_hda_intel"
   Driver Modules: "snd_hda_intel"
   Memory Range: 0xc4318000-0xc431bfff (rw,non-prefetchable)
   Memory Range: 0xc4100000-0xc41fffff (rw,non-prefetchable)
   IRQ: 148 (833 events)
   Module Alias: "pci:v00008086d000002C8sv00001043sd00001A61bc04sc03i80"
   Driver Info #0:
     Driver Status: snd_hda_intel is active
     Driver Activation Cmd: "modprobe snd_hda_intel"
   Driver Info #1:
     Driver Status: snd_soc_skl is active
     Driver Activation Cmd: "modprobe snd_soc_skl"
   Driver Info #2:
     Driver Status: snd_sof_pci is active
     Driver Activation Cmd: "modprobe snd_sof_pci"
   Config Status: cfg=new, avail=yes, need=no, active=unknown

*[@MaxPlanck ~]$ dmesg | grep "HDA"*
[    3.158314] input: HDA Intel PCH Headset Mic as 
/devices/pci0000:00/0000:00:1f.3/sound/card1/input21
[    3.158356] input: HDA Intel PCH Headphone as 
/devices/pci0000:00/0000:00:1f.3/sound/card1/input22
[    3.158397] input: HDA Intel PCH HDMI/DP,pcm=3 as 
/devices/pci0000:00/0000:00:1f.3/sound/card1/input23
[    3.158431] input: HDA Intel PCH HDMI/DP,pcm=7 as 
/devices/pci0000:00/0000:00:1f.3/sound/card1/input24
[    3.158497] input: HDA Intel PCH HDMI/DP,pcm=8 as 
/devices/pci0000:00/0000:00:1f.3/sound/card1/input25
[    3.158549] input: HDA Intel PCH HDMI/DP,pcm=9 as 
/devices/pci0000:00/0000:00:1f.3/sound/card1/input26
[    3.158588] input: HDA Intel PCH HDMI/DP,pcm=10 as 
/devices/pci0000:00/0000:00:1f.3/sound/card1/input27

*[@MaxPlanck ~]$ lspci | grep [Aa]udio*
00:1f.3 Audio device: Intel Corporation Device 02c8


*# dmidecode 3.2*

# dmidecode 3.2
Getting SMBIOS data from sysfs.
SMBIOS 3.2.0 present.
Table at 0x99F53000.

Handle 0x0000, DMI type 0, 26 bytes
BIOS Information
	Vendor: American Megatrends Inc.
	Version: UX534FTC.304
	Release Date: 12/16/2019
	Address: 0xF0000
	Runtime Size: 64 kB
	ROM Size: 16 MB
	Characteristics:
		PCI is supported
		BIOS is upgradeable
		BIOS shadowing is allowed
		Boot from CD is supported
		Selectable boot is supported
		BIOS ROM is socketed
		EDD is supported
		5.25"/1.2 MB floppy services are supported (int 13h)
		3.5"/720 kB floppy services are supported (int 13h)
		3.5"/2.88 MB floppy services are supported (int 13h)
		Print screen service is supported (int 5h)
		8042 keyboard services are supported (int 9h)
		Serial services are supported (int 14h)
		Printer services are supported (int 17h)
		ACPI is supported
		USB legacy is supported
		Smart battery is supported
		BIOS boot specification is supported
		Targeted content distribution is supported
		UEFI is supported
	BIOS Revision: 5.15

Handle 0x0001, DMI type 1, 27 bytes
System Information
	Manufacturer: ASUSTeK COMPUTER INC.
	Product Name: ZenBook UX534FTC_UX534FT
	Version: 1.0
	Serial Number: ------------------
	UUID: -------------------
	Wake-up Type: Power Switch
	SKU Number:
	Family: ZenBook

Handle 0x0002, DMI type 2, 15 bytes
Base Board Information
	Manufacturer: ASUSTeK COMPUTER INC.
	Product Name: UX534FTC
	Version: 1.0
	Serial Number: ---------------
	Asset Tag: -------------
	Features:
		Board is a hosting board
		Board is replaceable
	Location In Chassis: MIDDLE
	Chassis Handle: 0x0003
	Type: Motherboard
	Contained Object Handles: 0

Handle 0x0003, DMI type 3, 22 bytes
Chassis Information
	Manufacturer: ASUSTeK COMPUTER INC.
	Type: Notebook
	Lock: Not Present
	Version: 1.0
	Serial Number: -------------
	Asset Tag: No Asset Tag
	Boot-up State: Safe
	Power Supply State: Safe
	Thermal State: Safe
	Security Status: None
	OEM Information: 0x00000000
	Height: Unspecified
	Number Of Power Cords: 1
	Contained Elements: 0
	SKU Number: NA

Handle 0x0007, DMI type 32, 20 bytes
System Boot Information
	Status: No errors detected

Handle 0x0008, DMI type 43, 31 bytes
TPM Device
	Vendor ID: CTNI
	Specification Version: 2.0	Firmware Revision: 500.14
	Description: INTEL	Characteristics:
		Family configurable via platform software support
	OEM-specific Information: 0x00000000

Handle 0x0009, DMI type 16, 23 bytes
Physical Memory Array
	Location: System Board Or Motherboard
	Use: System Memory
	Error Correction Type: None
	Maximum Capacity: 16 GB
	Error Information Handle: Not Provided
	Number Of Devices: 2

Handle 0x000A, DMI type 17, 84 bytes
Memory Device
	Array Handle: 0x0009
	Error Information Handle: Not Provided
	Total Width: 64 bits
	Data Width: 64 bits
	Size: 8192 MB
	Form Factor: Row Of Chips
	Set: None
	Locator: ChannelA-DIMM0
	Bank Locator: BANK 0
	Type: LPDDR3
	Type Detail: Synchronous
	Speed: 2133 MT/s
	Manufacturer: Samsung
	Serial Number: 00000000
	Asset Tag: 9876543210
	Part Number: K4EBE3 4ED-EGCG
	Rank: 2
	Configured Memory Speed: 2133 MT/s
	Minimum Voltage: 1.2 V
	Maximum Voltage: 1.2 V
	Configured Voltage: 1.2 V
	Memory Technology: DRAM
	Memory Operating Mode Capability: Volatile memory
	Firmware Version: Not Specified
	Module Manufacturer ID: Bank 1, Hex 0xCE
	Module Product ID: Unknown
	Memory Subsystem Controller Manufacturer ID: Unknown
	Memory Subsystem Controller Product ID: Unknown
	Non-Volatile Size: None
	Volatile Size: 8 GB
	Cache Size: None
	Logical Size: None

Handle 0x000B, DMI type 17, 84 bytes
Memory Device
	Array Handle: 0x0009
	Error Information Handle: Not Provided
	Total Width: 64 bits
	Data Width: 64 bits
	Size: 8192 MB
	Form Factor: Row Of Chips
	Set: None
	Locator: ChannelB-DIMM0
	Bank Locator: BANK 2
	Type: LPDDR3
	Type Detail: Synchronous
	Speed: 2133 MT/s
	Manufacturer: Samsung
	Serial Number: 00000000
	Asset Tag: 9876543210
	Part Number: K4EBE3 4ED-EGCG
	Rank: 2
	Configured Memory Speed: 2133 MT/s
	Minimum Voltage: 1.2 V
	Maximum Voltage: 1.2 V
	Configured Voltage: 1.2 V
	Memory Technology: DRAM
	Memory Operating Mode Capability: Volatile memory
	Firmware Version: Not Specified
	Module Manufacturer ID: Bank 1, Hex 0xCE
	Module Product ID: Unknown
	Memory Subsystem Controller Manufacturer ID: Unknown
	Memory Subsystem Controller Product ID: Unknown
	Non-Volatile Size: None
	Volatile Size: 8 GB
	Cache Size: None
	Logical Size: None

Handle 0x000C, DMI type 19, 31 bytes
Memory Array Mapped Address
	Starting Address: 0x00000000000
	Ending Address: 0x003FFFFFFFF
	Range Size: 16 GB
	Physical Array Handle: 0x0009
	Partition Width: 2

Handle 0x001F, DMI type 10, 26 bytes
On Board Device 1 Information
	Type: Video
	Status: Enabled
	Description: VGA
On Board Device 2 Information
	Type: Ethernet
	Status: Enabled
	Description: GLAN
On Board Device 3 Information
	Type: Ethernet
	Status: Enabled
	Description: WLAN
On Board Device 4 Information
	Type: Sound
	Status: Enabled
	Description: Audio CODEC
On Board Device 5 Information
	Type: SATA Controller
	Status: Enabled
	Description: SATA Controller
On Board Device 6 Information
	Type: Other
	Status: Enabled
	Description: USB 2.0 Controller
On Board Device 7 Information
	Type: Other
	Status: Enabled
	Description: USB 3.0 Controller
On Board Device 8 Information
	Type: Other
	Status: Enabled
	Description: SMBus Controller
On Board Device 9 Information
	Type: Other
	Status: Enabled
	Description: Card Reader
On Board Device 10 Information
	Type: Other
	Status: Enabled
	Description: Cmos Camera
On Board Device 11 Information
	Type: Other
	Status: Enabled
	Description: Bluetooth

Handle 0x0020, DMI type 11, 5 bytes
OEM Strings
	String 1: (ask if needed)
	String 2: (ask if needed)
	String 3: (ask if needed)
	String 4:
	String 5: (ask if needed)

Handle 0x0021, DMI type 12, 5 bytes
System Configuration Options
	Option 1: SMI:00B26C
	Option 2: DSN:
	Option 3: DSN:
	Option 4: DSN:

Handle 0x0022, DMI type 20, 35 bytes
Memory Device Mapped Address
	Starting Address: 0x00000000000
	Ending Address: 0x001FFFFFFFF
	Range Size: 8 GB
	Physical Device Handle: 0x000A
	Memory Array Mapped Address Handle: 0x000C
	Partition Row Position: Unknown
	Interleave Position: 1
	Interleaved Data Depth: 1

Handle 0x0023, DMI type 20, 35 bytes
Memory Device Mapped Address
	Starting Address: 0x00200000000
	Ending Address: 0x003FFFFFFFF
	Range Size: 8 GB
	Physical Device Handle: 0x000B
	Memory Array Mapped Address Handle: 0x000C
	Partition Row Position: Unknown
	Interleave Position: 2
	Interleaved Data Depth: 1

Handle 0x0024, DMI type 221, 12 bytes
OEM-specific Type
	Header and Data:
		DD 0C 24 00 01 01 00 02 00 00 A4 11
	Strings:
		BIOS Guard

Handle 0x0025, DMI type 221, 26 bytes
OEM-specific Type
	Header and Data:
		DD 1A 25 00 03 01 00 09 00 0F 40 00 02 00 00 00
		00 BE 00 03 00 01 05 00 00 00
	Strings:
		Reference Code - CPU
		uCode Version
		TXT ACM version

Handle 0x0026, DMI type 221, 26 bytes
OEM-specific Type
	Header and Data:
		DD 1A 26 00 03 01 00 09 00 0F 40 00 02 00 00 00
		00 00 00 03 04 0E 00 00 25 04
	Strings:
		Reference Code - ME
		MEBx version
		ME Firmware Version
		Consumer SKU

Handle 0x0027, DMI type 221, 54 bytes
OEM-specific Type
	Header and Data:
		DD 36 27 00 07 01 00 09 00 0F 40 00 02 03 FF FF
		FF FF FF 04 00 FF FF FF 00 00 05 00 FF FF FF 00
		00 06 00 FF FF FF FF FF 07 00 15 FF FF FF FF 08
		00 00 FF FF FF FF
	Strings:
		Reference Code - CML PCH
		PCH-CRID Status
		Disabled
		PCH-CRID Original Value
		PCH-CRID New Value
		OPROM - RST - RAID
		ChipsetInit Base Version
		ChipsetInit Oem Version

Handle 0x0028, DMI type 221, 54 bytes
OEM-specific Type
	Header and Data:
		DD 36 28 00 07 01 00 09 00 0F 40 00 02 00 00 07
		01 65 00 03 00 09 00 0F 40 00 04 05 FF FF FF FF
		FF 06 00 00 00 00 0C 00 07 00 00 00 00 0C 00 08
		00 FF FF FF FF FF
	Strings:
		Reference Code - SA - System Agent
		Reference Code - MRC
		SA - PCIe Version
		SA-CRID Status
		Disabled
		SA-CRID Original Value
		SA-CRID New Value
		OPROM - VBIOS

Handle 0x0029, DMI type 221, 12 bytes
OEM-specific Type
	Header and Data:
		DD 0C 29 00 01 01 00 04 00 00 00 00
	Strings:
		FSP Binary Version

Handle 0x002A, DMI type 7, 27 bytes
Cache Information
	Socket Designation: L1 Cache
	Configuration: Enabled, Not Socketed, Level 1
	Operational Mode: Write Back
	Location: Internal
	Installed Size: 256 kB
	Maximum Size: 256 kB
	Supported SRAM Types:
		Synchronous
	Installed SRAM Type: Synchronous
	Speed: Unknown
	Error Correction Type: Parity
	System Type: Unified
	Associativity: 8-way Set-associative

Handle 0x002B, DMI type 7, 27 bytes
Cache Information
	Socket Designation: L2 Cache
	Configuration: Enabled, Not Socketed, Level 2
	Operational Mode: Write Back
	Location: Internal
	Installed Size: 1024 kB
	Maximum Size: 1024 kB
	Supported SRAM Types:
		Synchronous
	Installed SRAM Type: Synchronous
	Speed: Unknown
	Error Correction Type: Single-bit ECC
	System Type: Unified
	Associativity: 4-way Set-associative

Handle 0x002C, DMI type 7, 27 bytes
Cache Information
	Socket Designation: L3 Cache
	Configuration: Enabled, Not Socketed, Level 3
	Operational Mode: Write Back
	Location: Internal
	Installed Size: 8192 kB
	Maximum Size: 8192 kB
	Supported SRAM Types:
		Synchronous
	Installed SRAM Type: Synchronous
	Speed: Unknown
	Error Correction Type: Multi-bit ECC
	System Type: Unified
	Associativity: 16-way Set-associative

Handle 0x002D, DMI type 4, 48 bytes
Processor Information
	Socket Designation: U3E1
	Type: Central Processor
	Family: Core i7
	Manufacturer: Intel(R) Corporation
	ID: EC 06 08 00 FF FB EB BF
	Signature: Type 0, Family 6, Model 142, Stepping 12
	Flags:
		FPU (Floating-point unit on-chip)
		VME (Virtual mode extension)
		DE (Debugging extension)
		PSE (Page size extension)
		TSC (Time stamp counter)
		MSR (Model specific registers)
		PAE (Physical address extension)
		MCE (Machine check exception)
		CX8 (CMPXCHG8 instruction supported)
		APIC (On-chip APIC hardware supported)
		SEP (Fast system call)
		MTRR (Memory type range registers)
		PGE (Page global enable)
		MCA (Machine check architecture)
		CMOV (Conditional move instruction supported)
		PAT (Page attribute table)
		PSE-36 (36-bit page size extension)
		CLFSH (CLFLUSH instruction supported)
		DS (Debug store)
		ACPI (ACPI supported)
		MMX (MMX technology supported)
		FXSR (FXSAVE and FXSTOR instructions supported)
		SSE (Streaming SIMD extensions)
		SSE2 (Streaming SIMD extensions 2)
		SS (Self-snoop)
		HTT (Multi-threading)
		TM (Thermal monitor supported)
		PBE (Pending break enabled)
	Version: Intel(R) Core(TM) i7-10510U CPU @ 1.80GHz
	Voltage: 0.8 V
	External Clock: 100 MHz
	Max Speed: 8300 MHz
	Current Speed: 2673 MHz
	Status: Populated, Enabled
	Upgrade: Socket BGA1528
	L1 Cache Handle: 0x002A
	L2 Cache Handle: 0x002B
	L3 Cache Handle: 0x002C
	Serial Number: To Be Filled By O.E.M.
	Asset Tag: To Be Filled By O.E.M.
	Part Number: To Be Filled By O.E.M.
	Core Count: 4
	Core Enabled: 4
	Thread Count: 8
	Characteristics:
		64-bit capable
		Multi-Core
		Hardware Thread
		Execute Protection
		Enhanced Virtualization
		Power/Performance Control

Handle 0x002E, DMI type 131, 64 bytes
OEM-specific Type
	Header and Data:
		83 40 2E 00 31 00 00 00 00 00 00 00 00 00 00 00
		F8 00 84 02 00 00 00 00 01 00 00 00 00 00 0E 00
		25 04 00 00 00 00 00 00 FE 00 FF FF 00 00 00 00
		00 00 00 00 22 00 00 00 76 50 72 6F 00 00 00 00

Handle 0x002F, DMI type 13, 22 bytes
BIOS Language Information
	Language Description Format: Long
	Installable Languages: 1
		en|US|iso8859-1
	Currently Installed Language: en|US|iso8859-1

Handle 0x0030, DMI type 41, 11 bytes
Onboard Device
	Reference Designation: VGA
	Type: Video
	Status: Enabled
	Type Instance: 1
	Bus Address: 0000:00:02.0

Handle 0x0031, DMI type 41, 11 bytes
Onboard Device
	Reference Designation: Second VGA
	Type: Video
	Status: Enabled
	Type Instance: 2
	Bus Address: 0000:02:00.0

Handle 0x0032, DMI type 41, 11 bytes
Onboard Device
	Reference Designation: WLAN
	Type: Ethernet
	Status: Enabled
	Type Instance: 1
	Bus Address: 0000:00:14.3

Handle 0x0033, DMI type 41, 11 bytes
Onboard Device
	Reference Designation: Card Reader
	Type: Other
	Status: Disabled
	Type Instance: 1

Handle 0x0034, DMI type 221, 89 bytes
OEM-specific Type
	Header and Data:
		DD 59 34 00 0C 01 00 FF FF FF FF FF 02 00 FF FF
		FF FF FF 03 04 FF FF FF FF FF 05 06 FF FF FF FF
		FF 07 08 FF FF FF FF FF 09 00 00 00 00 00 00 0A
		00 FF FF FF FF FF 0B 00 FF FF 00 00 00 0C 00 00
		09 00 92 10 0D 0E 01 05 02 00 00 0F 00 00 07 00
		00 00 10 00 00 02 00 0F 00
	Strings:
		Lan Phy Version
		Sensor Firmware Version
		Debug Mode Status
		Disabled
		Performance Mode Status
		Disabled
		Debug Use USB(Disabled:Serial)
		Disabled
		ICC Overclocking Version
		UNDI Version
		EC FW Version
		GOP Version
		Royal Park Version
		BP1520_Formal_P01_RP01
		Platform Version
		Client Silicon Version

Handle 0x0035, DMI type 136, 6 bytes
OEM-specific Type
	Header and Data:
		88 06 35 00 00 00

Handle 0x0036, DMI type 14, 26 bytes
Group Associations
	Name: Firmware Version Info
	Items: 7
		0x0024 (OEM-specific)
		0x0025 (OEM-specific)
		0x0026 (OEM-specific)
		0x0027 (OEM-specific)
		0x0028 (OEM-specific)
		0x0029 (OEM-specific)
		0x0034 (OEM-specific)

Handle 0x0037, DMI type 14, 8 bytes
Group Associations
	Name: $MEI
	Items: 1
		0x0000 (OEM-specific)

Handle 0x0038, DMI type 219, 106 bytes
OEM-specific Type
	Header and Data:
		DB 6A 38 00 01 04 01 45 02 00 90 06 01 10 80 20
		00 00 00 00 40 00 00 01 1F 00 00 C9 03 40 44 02
		FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
		FF FF FF FF FF FF FF FF 03 00 00 00 80 00 00 00
		00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
		00 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00
		00 00 00 00 00 00 00 00 00 00
	Strings:
		MEI1
		MEI2
		MEI3
		MEI4

Handle 0x0039, DMI type 127, 4 bytes
End Of Table

-- 
--
Valère Alibert - Photographe

Ingénieur R&D Electronique (Ingénieur EII INSA Rennes)

Web  : http://photos.valerea.fr
Mail : valere.alibert.photos@gmail.com

