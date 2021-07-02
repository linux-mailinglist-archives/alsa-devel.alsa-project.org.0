Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADBB3BA13B
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jul 2021 15:29:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E825C1673;
	Fri,  2 Jul 2021 15:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E825C1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625232562;
	bh=7m8arki/AuuLuK9qsP8mBq8GH7qZY52xeKe2eLlR7SU=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kb2Ql7LCzqXA/SPcIgmU4qeAaWrcg4MRn26jz0NFOYa9/XeMFDPXbASunnqKlqCOQ
	 3m3jRqc0jqgnlT9t0Z6bHoSXgFLWnMUJhMx44c1XX5+6EgHjnPZvusbiolRFB249cD
	 Mdo59Mfcw3/Ao+VwVJzuI+s2mJ7hEqjYU1vqT5wY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A77CDF80240;
	Fri,  2 Jul 2021 15:27:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FBC0F80229; Fri,  2 Jul 2021 15:27:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E1D9F800BA
 for <alsa-devel@alsa-project.org>; Fri,  2 Jul 2021 15:27:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E1D9F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pWRhe2Er"
Received: by mail-lf1-x129.google.com with SMTP id a15so18064553lfr.6
 for <alsa-devel@alsa-project.org>; Fri, 02 Jul 2021 06:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=NM0KvYIOY/Hco+VWmcBKO/MflbNhSxs4EmezeyX5IfM=;
 b=pWRhe2ErhGvHrlyvj4PhKPeCUcc2r+SR9tpWyShGLnCacsJuevak0Il9dBpHq1odOI
 FIQvzSXvyRi4R3p6Bzji9V2FuoVexbvykKZj+cA8EsIfHU8+GAL6kBCxm9dDBoSo6yep
 38aoNmdB9fOLndljR4laEAPfiuZ/rUErDc5eq25CF6oqk1CBcboiACCUgSCsyTQ1IYCV
 Rfg1BUVDFMm/hD27NJj5nw4AcqcHSCHn2sdbxiZXgsv72el4jPq8dTArX+MPVJODovXs
 WdGmhopF4C/KyGXrAzrY6G+uoxlDttOjhQVAQYQD6QztppI8j2S56HBo66lloT4IepeO
 COmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=NM0KvYIOY/Hco+VWmcBKO/MflbNhSxs4EmezeyX5IfM=;
 b=htQckZ+Nf9firPUlcSX8pfEqk07EsBkLJdKRJX2R+pr80b1fOxxZBprbT8Ho5UN+g4
 4yfNr0DSwsyCC76kOyf8y5vnR+gDftG1Bnjlk9sYwO9rR2e8EiTC6VKeYGAzJo/jSN47
 2xqTVn6pAfkeFeRnQAkzRzQbhzrnheUnVP5o/QA+ab2UOBNxaiE0LfvsLHI1WdDayJtw
 wJbpapJW5dTmunQwS2CB1rvd254iZUJ7PoOU+wGIvGGjzJhlAgWXGNY8cJfTbezH7mYs
 Nh3wMjvPrvH7f4y6Uwr7aVAnKXbdYo/TfukbOD6YROBVCx1zierKHFg4fTH+OhsG3OaO
 50BQ==
X-Gm-Message-State: AOAM5321Jd0+Ls4xb9E+erOEOlavR3su3BrMuQxnyRf4kLhqMpA+B0WT
 T+LlpWh0Due9VkOUYNoddtjJK08HbTI2wDWwE/w+yd/WeSM=
X-Google-Smtp-Source: ABdhPJxQFwVb8u7syuFTom1MmLzedyv1TcG/JpXvWC/Qd2D/+eukCZ34VsmPSNrhHuOnqmHOWxFhn8QvlWw8z7rVm9U=
X-Received: by 2002:a05:6512:3b6:: with SMTP id
 v22mr3909946lfp.585.1625232461595; 
 Fri, 02 Jul 2021 06:27:41 -0700 (PDT)
MIME-Version: 1.0
From: Damjan Georgievski <gdamjan@gmail.com>
Date: Fri, 2 Jul 2021 15:27:30 +0200
Message-ID: <CAEk1YH4Jd0a8vfZxORVu7qg+Zsc-K+pR187ezNq8QhJBPW4gpw@mail.gmail.com>
Subject: Audio out on DisplayPort but not HDMI, on AMD Ryzen APU/Vega
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

I have a desktop computer with an AMD Ryzen 5 4650G PRO APU (CPU + on-die G=
PU).
The motherboard (MSI Mortar B550m wifi / bios 1.6). has one
displayport and one HDMI outputs.
The displayport is connected to my Lenovo P27 monitor, and the HDMI to
my Samsung TV.

When I choose the GPU as an audio out, I only get audio on the 3.5"
headphones jack of the Lenovo monitor, while I would like to get the
audio on the Samsung TV over HDMI.
I can't find a way to switch the different outputs (neither over
pipewire or just using native alsa).

pavucontrol configuration https://i.imgur.com/9nbVtNz.png
alsamixer -c0 only has only one option to mute s/pdif, which mutes the
output on the displayport -> Lenovo -> 3.5" jack.


$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 1: Generic [HD-Audio Generic], device 3: HDMI 0 [HDMI 0]
 Subdevices: 1/1
 Subdevice #0: subdevice #0
card 2: Generic_1 [HD-Audio Generic], device 0: ALCS1200A Analog
[ALCS1200A Analog]
 Subdevices: 1/1
 Subdevice #0: subdevice #0
card 2: Generic_1 [HD-Audio Generic], device 1: ALCS1200A Digital
[ALCS1200A Digital]
 Subdevices: 1/1
 Subdevice #0: subdevice #0

Am I correct that card 1 here ^ should have at least two devices?


distro is Archlinux
kernel is 5.12.13-arch1-2
alsa-* 1.2.5.1-3
pipewire 1:0.3.30-2
plasma 5.22.2.1-1
xorg-server 1.20.11-1
amdgpu vanilla driver


$ aplay -L
null
   Discard all samples (playback) or generate zero samples (capture)
sysdefault
   Default Audio Device
samplerate
   Rate Converter Plugin Using Samplerate Library
speexrate
   Rate Converter Plugin Using Speex Resampler
jack
   JACK Audio Connection Kit
oss
   Open Sound System
pulse
   PulseAudio Sound Server
speex
   Plugin using Speex DSP (resample, agc, denoise, echo, dereverb)
upmix
   Plugin for channel upmix (4,6,8)
vdownmix
   Plugin for channel downmix (stereo) with a simple spacialization
default
   Default ALSA Output (currently PulseAudio Sound Server)
usbstream:CARD=3DC93
   =E7=BD=97=E6=8A=80=E9=AB=98=E6=B8=85=E7=BD=91=E7=BB=9C=E6=91=84=E5=83=8F=
=E6=9C=BA C93
   USB Stream Output
hdmi:CARD=3DGeneric,DEV=3D0
   HD-Audio Generic, HDMI 0
   HDMI Audio Output
usbstream:CARD=3DGeneric
   HD-Audio Generic
   USB Stream Output
sysdefault:CARD=3DGeneric_1
   HD-Audio Generic, ALCS1200A Analog
   Default Audio Device
front:CARD=3DGeneric_1,DEV=3D0
   HD-Audio Generic, ALCS1200A Analog
   Front output / input
surround21:CARD=3DGeneric_1,DEV=3D0
   HD-Audio Generic, ALCS1200A Analog
   2.1 Surround output to Front and Subwoofer speakers
surround40:CARD=3DGeneric_1,DEV=3D0
   HD-Audio Generic, ALCS1200A Analog
   4.0 Surround output to Front and Rear speakers
surround41:CARD=3DGeneric_1,DEV=3D0
   HD-Audio Generic, ALCS1200A Analog
   4.1 Surround output to Front, Rear and Subwoofer speakers
surround50:CARD=3DGeneric_1,DEV=3D0
   HD-Audio Generic, ALCS1200A Analog
   5.0 Surround output to Front, Center and Rear speakers
surround51:CARD=3DGeneric_1,DEV=3D0
   HD-Audio Generic, ALCS1200A Analog
   5.1 Surround output to Front, Center, Rear and Subwoofer speakers
surround71:CARD=3DGeneric_1,DEV=3D0
   HD-Audio Generic, ALCS1200A Analog
   7.1 Surround output to Front, Center, Side, Rear and Woofer speakers
iec958:CARD=3DGeneric_1,DEV=3D0
   HD-Audio Generic, ALCS1200A Digital
   IEC958 (S/PDIF) Digital Audio Output
usbstream:CARD=3DGeneric_1
   HD-Audio Generic
   USB Stream Output

$ lspci
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Root Complex
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Renoir IOMMU
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe
Dummy Host Bridge
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe
Dummy Host Bridge
00:02.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Brid=
ge
00:02.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP Brid=
ge
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe
Dummy Host Bridge
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir Internal
PCIe GPP Bridge to Bus
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev=
 51)
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev =
51)
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device
24: Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device
24: Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device
24: Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device
24: Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device
24: Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device
24: Function 5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device
24: Function 6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir Device
24: Function 7
16:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] Device 43ee
16:00.1 SATA controller: Advanced Micro Devices, Inc. [AMD] Device 43eb
16:00.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 43e9
20:08.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 43ea
20:09.0 PCI bridge: Advanced Micro Devices, Inc. [AMD] Device 43ea
29:00.0 Network controller: Intel Corporation Wi-Fi 6 AX200 (rev 1a)
2a:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8125
2.5GbE Controller (rev 04)
2b:00.0 Non-Volatile memory controller: ADATA Technology Co., Ltd. XPG
SX8200 Pro PCIe Gen3x4 M.2 2280 Solid State Drive (rev 03)
30:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
[AMD/ATI] Renoir (rev d9)
30:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Device 1637
30:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD]
Family 17h (Models 10h-1fh) Platform Security Processor
30:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir USB 3.1
30:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir USB 3.1
30:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h
(Models 10h-1fh) HD Audio Controller

$ cat /proc/asound/devices
 1:        : sequencer
 2: [ 1- 3]: digital audio playback
 3: [ 1- 0]: hardware dependent
 4: [ 1]   : control
 5: [ 0- 0]: digital audio capture
 6: [ 0]   : control
 7: [ 2- 0]: digital audio playback
 8: [ 2- 0]: digital audio capture
 9: [ 2- 1]: digital audio playback
10: [ 2- 2]: digital audio capture
11: [ 2- 0]: hardware dependent
12: [ 2]   : control
33:        : timer

$ cat /proc/asound/cards
0 [C93            ]: USB-Audio - =E7=BD=97=E6=8A=80=E9=AB=98=E6=B8=85=E7=BD=
=91=E7=BB=9C=E6=91=84=E5=83=8F=E6=9C=BA C93
                     =E7=BD=97=E6=8A=80=E9=AB=98=E6=B8=85=E7=BD=91=E7=BB=9C=
=E6=91=84=E5=83=8F=E6=9C=BA C93 at usb-0000:30:00.3-1, high speed
1 [Generic        ]: HDA-Intel - HD-Audio Generic
                     HD-Audio Generic at 0xfcb88000 irq 95
2 [Generic_1      ]: HDA-Intel - HD-Audio Generic
                     HD-Audio Generic at 0xfcb80000 irq 96

$ cat /proc/asound/card
card0/ card1/ card2/ cards


--=20
damjan
