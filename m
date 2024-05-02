Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 223A78B9999
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2024 13:03:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E8F0E76;
	Thu,  2 May 2024 13:02:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E8F0E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714647787;
	bh=dUiuGdCUk+0Kfej+fzWhIQeKDYYMFEYcQl8+yNW0wso=;
	h=Date:To:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=acGLJCfPDR9aXVfZllcql6l49e6t4qleA/upDrhGUXWh9p3vxTbbqzcB7n9t0XNW0
	 vK/76ByMME3iptcwaRruozXu979+4CHfLlkiIg79BHDux+/x+F59zcEFjYxrgqTBJ9
	 rdR6fXvCh2GB0JKuQcDYpjtv+Y+DqDDo5Gx4bu0U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AB88F805B0; Thu,  2 May 2024 13:02:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBD85F8057C;
	Thu,  2 May 2024 13:02:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6C3BF80266; Thu,  2 May 2024 13:02:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB076F8003A
	for <alsa-devel@alsa-project.org>; Thu,  2 May 2024 13:02:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB076F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=mista.tapas@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=M8Cy4rs8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1714647724; x=1715252524; i=mista.tapas@gmx.net;
	bh=tMQHhoCdflf8w7xEi2PValycPNN25Y2MGonpMD3IQeE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=M8Cy4rs81PB3bb1QHfp4oZgVpHswWBPXdM19SiKUcJP8QZrOxhb3OZKZOjBewsal
	 eGsIVST0w6ELwv10SOdCQkwTJRvE3Nk7CIZ3dlPOLMfKBK66CUfEKtFhNQZZJCo2J
	 0sH8lGQUVyA6G21O820HRzbu/JdFgsNBVRJ89F3C1zHXUEgJhdeG2ZxRfH/wHwLni
	 3W1hSM07hTkzBXRWUHIViWdwL4CYK+BCaXhXZvjq0grHkjvna8RL1jWZl4owRZnnE
	 VXjURsOexBs4+fdSLgsiTVdr4YBWAS1I0/QthuYbVGChTG+ek62KH/FnL/XUUsVgJ
	 gTX5bWIJfeiEQyuuEA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [129.70.76.171] ([129.70.76.171]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrhUE-1sPfrj40O4-00nefz for
 <alsa-devel@alsa-project.org>; Thu, 02 May 2024 13:02:04 +0200
Message-ID: <c7c85918-e8e9-4029-bc75-42c46cb6cc2c@gmx.net>
Date: Thu, 2 May 2024 13:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: alsa-devel@alsa-project.org
From: Florian Paul Schmidt <mista.tapas@gmx.net>
Subject: ASRock N100DC-ITX snd_usb_audio problems
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8Bd0UEuim4h5jBv/h+T2nR7g40eEYZr7WQO7coZpOrRVF6xtw4A
 NgclB8daatPER4WKLwmeFtVkIZQSbcJenIgOKuFC82naY2YnJ8kQ4MiSihvBipHoscldszR
 IZmbfkJhKsAHQHIxrmb7vu/qkJhXormOvhDMjdrqku/gOUCERmofAqNQQTG3ru71kOKUUzp
 3tkcdYJwqyLaAqmGAqlnA==
UI-OutboundReport: notjunk:1;M01:P0:91M3ZDGr1W0=;MlBTEPnp61N7ILDEAA2P/ZXOADg
 4IANpF1rmw5X8mo5y330qVPBxa0jSPyAEPxg5jE+HOdgFcBSSCPiQWcSlUT+nuCILfKFsee0k
 KYSc8VEofcG7tFw73E0vSDTMsnuH6Gg2JzSbnjGk0DQh13BxZcZ50P7FhhxLpGIpvjPm4mZxi
 gPgRWGyS+3T0FJZciLZNyXcBPUp0CIN5mqHn966TYDX8ODmqfbFt1Nrefct+cTNMF8rMw+QrO
 UK5Tp0Ly1LDEiXe6O+UVx2Al3BUfg/WFZr+2QxR1CEQvAmhmt0AsoNgsxqcU27rTTtMhDeDaG
 gWyIqRYAmoGclHLDQipwbcTAGVIIzKGBD8Ub0io4D7Wq5lzyiHuIpVfKorSdptUTZMiWTOcbP
 RMlIn5UiJikscZzXnLozadULnG2OZAwbFFH7mjEmVIBSxG42GhpaIa/Nr47RHuoPUnk+Yewpj
 1meUaNhHCBHzRE8nyids+f2UzJFwxvRTR1tvGDkc3xF25N1rpG7DQylmf7i6lLWXegR2zZx/I
 ZVG8yraGuO+FtWKWfGv9j457FURZpAiRhsFrzJ0/w3RGAk50l+I6YehCihzrknbTfVvnBK0IF
 7o0eKAFMFM3EX43Y53zbcWqGttDptoTpnVKkJncACeqjfyGk/sCpYiWwrGtnE9aTuc+nW5Jsi
 pHWLrNwAyPXo65emZfg4j4/OoPYgp/Xb1rMdlsCLG1RwXuouEFKuTh4U3dPLBSTjr4omEjN1B
 Uaaqv3u+XZimo7yqBc5jaK4NoaR3pE25Au1Gvpp2xUvG6CSNoRXh/F26nWMGmDT6AKYjnkr3B
 Me/Jap3X5Tuez5Ot/xYy/cYzqBU5uDWkaSWRnt8yAkLRk=
Message-ID-Hash: QOQNQN4WL2I2PP2U7FFNRJAS5H6HDHGN
X-Message-ID-Hash: QOQNQN4WL2I2PP2U7FFNRJAS5H6HDHGN
X-MailFrom: mista.tapas@gmx.net
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QOQNQN4WL2I2PP2U7FFNRJAS5H6HDHGN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi!

I recently acquired a ASRock N100DC-ITX mainboard with the goal to run
some audio processing on it. After some tuning I got the board to behave
nicely with e.g. cyclictest giving worst case latencies around 10 us
with a recent -rt kernel. So the system shoudl be well equipped to run
small period sizes.

I have two USB audio class 2.0 audio interfaces here.

1. Focusrite 2i2 2nd gen
2. Tascam iXR

Both these interfaces work fine on other systems, so I guess they are
not the problem. And I used at least the Tascam with period sizes of
e.g. 64 and 32 frames and 2 periods without problems (the 0.125 ms
microframe resolution is good enough when it comes to the resulting jitter=
).

But on this new system I cannot get either of the two interfaces to run
with even 64 frames, 2 periods reliably. I tried jackd1, jack2, and the
alsa_loopback program from Fons' libzita-alsa-pcmi. The system is well
tuned with xhci IRQs at prio 90, jackd/alsa_loopback at prio 80 and all
other kernel irq threads at prio 50.

For 64 frames 2 periods 48000 samplerate

$ LD_LIBRARY_PATH=3D../source/ ./alsa_loopback hw:USB hw:USB 48000 64 2

I get:

May 02 12:37:35 ogfx100 kernel: retire_capture_urb: 1090 callbacks
suppressed

in the kernel log (every 5 seconds with the number of callbacks in the
same ballpark) and alsa_loopback complaining:

Error: pcm_wait returned 0.

For 48 frames 2 periods 48000 samplerate (which should actually work
better since the period boundaries should fall onto usb frame boundaries.)

LD_LIBRARY_PATH=3D../source/ ./alsa_loopback hw:USB hw:USB 48000 48 2

I get:

May 02 12:39:58 ogfx100 kernel: xhci_hcd 0000:00:14.0: WARN Event TRB
for slot 4 ep 1 with no TDs queued?

over and over in the kernel log and alsa_loopback again complaining as
above.

On the other hand 48 frames, 3 periods works great! I measure jitter
with jack_wakeup in an otherwise empty jack-graph:

[fps@ogfx100:~]$ ./src/jack_wakeup/jack_wakeup
min: 0.92522 ms; mean: 0.999884ms;  max: 1.07727 ms

64 frames, 3 periods works ok-ish:

[fps@ogfx100:~]$ ./src/jack_wakeup/jack_wakeup
min: 0.938189 ms; mean: 1.33265ms;  max: 1.59372 ms

with 3 to 4 times the jitter I would expect giving the 0.125 ms
microframe length of USB 2. Here I would expect output more like

min: 1.25... ms; mean: 1.33265ms;  max: 1.5... ms

or

min: 1.25... ms; mean: 1.33265ms;  max: 1.375... ms

I suspect that this is not a problem of the snd_usb_audio driver from
ALSA but rather a problem with the XHCI in this board, since the
combination of cards and snd_usb_audio driver work well on other
systems. But maybe you have some insight or suggestions for me to try
before reporting to LKML..

Looking forward to your replies and

kind regards,
FPS

P.S.: [fps@ogfx100:~]$ uname -a
Linux ogfx100 6.6.25-rt29 #1-NixOS SMP PREEMPT_RT Thu Apr  4 18:23:07
UTC 2024 x86_64 GNU/Linux

I have tried with many other kernels though -rt and non-rt. That did not
change much IIRC. I am

P.P.S.: Find below the output of lspci -v, lspci -t, lsusb -v, cat
/proc/cpuinfo

[fps@ogfx100:~]$ lspci -v
00:00.0 Host bridge: Intel Corporation Device 461c
         Subsystem: ASRock Incorporation Device 461c
         Flags: bus master, fast devsel, latency 0
         Capabilities: <access denied>

00:02.0 VGA compatible controller: Intel Corporation Alder Lake-N [UHD
Graphics] (prog-if 00 [VGA controller])
         Subsystem: ASRock Incorporation Device 46d1
         Flags: bus master, fast devsel, latency 0, IRQ 134
         Memory at 6000000000 (64-bit, non-prefetchable) [size=3D16M]
         Memory at 4000000000 (64-bit, prefetchable) [size=3D256M]
         I/O ports at 4000 [size=3D64]
         Expansion ROM at 000c0000 [virtual] [disabled] [size=3D128K]
         Capabilities: <access denied>
         Kernel driver in use: i915
         Kernel modules: i915

00:0d.0 USB controller: Intel Corporation Device 464e (prog-if 30 [XHCI])
         Flags: medium devsel, IRQ 129
         Memory at 6001110000 (64-bit, non-prefetchable) [size=3D64K]
         Capabilities: <access denied>
         Kernel driver in use: xhci_hcd
         Kernel modules: xhci_pci

00:14.0 USB controller: Intel Corporation Device 54ed (prog-if 30 [XHCI])
         Subsystem: ASRock Incorporation Device 54ed
         Flags: bus master, medium devsel, latency 0, IRQ 131
         Memory at 6001100000 (64-bit, non-prefetchable) [size=3D64K]
         Capabilities: <access denied>
         Kernel driver in use: xhci_hcd
         Kernel modules: xhci_pci

00:14.2 RAM memory: Intel Corporation Device 54ef
         Flags: fast devsel
         Memory at 6001124000 (64-bit, non-prefetchable) [disabled]
[size=3D16K]
         Memory at 600112a000 (64-bit, non-prefetchable) [disabled]
[size=3D4K]
         Capabilities: <access denied>

00:16.0 Communication controller: Intel Corporation Device 54e0
         Subsystem: ASRock Incorporation Device 54e0
         Flags: bus master, fast devsel, latency 0, IRQ 132
         Memory at 6001129000 (64-bit, non-prefetchable) [size=3D4K]
         Capabilities: <access denied>
         Kernel driver in use: mei_me
         Kernel modules: mei_me

00:17.0 SATA controller: Intel Corporation Device 54d3 (prog-if 01 [AHCI
1.0])
         Subsystem: ASRock Incorporation Device 54d3
         Flags: bus master, 66MHz, medium devsel, latency 0, IRQ 130
         Memory at 80a00000 (32-bit, non-prefetchable) [size=3D8K]
         Memory at 80a03000 (32-bit, non-prefetchable) [size=3D256]
         I/O ports at 4090 [size=3D8]
         I/O ports at 4080 [size=3D4]
         I/O ports at 4060 [size=3D32]
         Memory at 80a02000 (32-bit, non-prefetchable) [size=3D2K]
         Capabilities: <access denied>
         Kernel driver in use: ahci
         Kernel modules: ahci

00:1c.0 PCI bridge: Intel Corporation Device 54be (prog-if 00 [Normal
decode])
         Subsystem: ASRock Incorporation Device 54be
         Flags: bus master, fast devsel, latency 0, IRQ 122
         Bus: primary=3D00, secondary=3D01, subordinate=3D01, sec-latency=
=3D0
         I/O behind bridge: 3000-3fff [size=3D4K] [16-bit]
         Memory behind bridge: 80900000-809fffff [size=3D1M] [32-bit]
         Prefetchable memory behind bridge: [disabled] [64-bit]
         Capabilities: <access denied>
         Kernel driver in use: pcieport

00:1d.0 PCI bridge: Intel Corporation Device 54b0 (prog-if 00 [Normal
decode])
         Subsystem: ASRock Incorporation Device 54b0
         Flags: bus master, fast devsel, latency 0, IRQ 123
         Bus: primary=3D00, secondary=3D02, subordinate=3D02, sec-latency=
=3D0
         I/O behind bridge: [disabled] [16-bit]
         Memory behind bridge: 80800000-808fffff [size=3D1M] [32-bit]
         Prefetchable memory behind bridge: [disabled] [64-bit]
         Capabilities: <access denied>
         Kernel driver in use: pcieport

00:1f.0 ISA bridge: Intel Corporation Device 5481
         Subsystem: ASRock Incorporation Device 5481
         Flags: bus master, fast devsel, latency 0

00:1f.3 Audio device: Intel Corporation Device 54c8
         Subsystem: ASRock Incorporation Device 3897
         Flags: bus master, fast devsel, latency 32, IRQ 135
         Memory at 6001120000 (64-bit, non-prefetchable) [size=3D16K]
         Memory at 6001000000 (64-bit, non-prefetchable) [size=3D1M]
         Capabilities: <access denied>
         Kernel driver in use: snd_hda_intel
         Kernel modules: snd_hda_intel, snd_sof_pci_intel_tgl

00:1f.4 SMBus: Intel Corporation Device 54a3
         Subsystem: ASRock Incorporation Device 54a3
         Flags: medium devsel, IRQ 16
         Memory at 6001128000 (64-bit, non-prefetchable) [size=3D256]
         I/O ports at efa0 [size=3D32]
         Kernel driver in use: i801_smbus
         Kernel modules: i2c_i801

00:1f.5 Serial bus controller: Intel Corporation Device 54a4
         Subsystem: ASRock Incorporation Device 54a4
         Flags: fast devsel
         Memory at 80a04000 (32-bit, non-prefetchable) [size=3D4K]
         Kernel driver in use: intel-spi
         Kernel modules: spi_intel_pci

01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 15)
         Subsystem: ASRock Incorporation Motherboard (one of many)
         Flags: bus master, fast devsel, latency 0, IRQ 18
         I/O ports at 3000 [size=3D256]
         Memory at 80904000 (64-bit, non-prefetchable) [size=3D4K]
         Memory at 80900000 (64-bit, non-prefetchable) [size=3D16K]
         Capabilities: <access denied>
         Kernel driver in use: r8169
         Kernel modules: r8169

02:00.0 Non-Volatile memory controller: Kingston Technology Company,
Inc. Device 5017 (rev 03) (prog-if 02 [NVM Express])
         Subsystem: Kingston Technology Company, Inc. Device 5017
         Flags: bus master, fast devsel, latency 0, IRQ 16
         Memory at 80800000 (64-bit, non-prefetchable) [size=3D16K]
         Capabilities: <access denied>
         Kernel driver in use: nvme
         Kernel modules: nvme

[fps@ogfx100:~]$ lspci -t
-[0000:00]-+-00.0
            +-02.0
            +-0d.0
            +-14.0
            +-14.2
            +-16.0
            +-17.0
            +-1c.0-[01]----00.0
            +-1d.0-[02]----00.0
            +-1f.0
            +-1f.3
            +-1f.4
            \-1f.5

[fps@ogfx100:~]$ sudo lsusb -v

Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         1 Single TT
   bMaxPacketSize0        64
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0002 2.0 root hub
   bcdDevice            6.06
   iManufacturer           3 Linux 6.6.25-rt29 xhci-hcd
   iProduct                2 xHCI Host Controller
   iSerial                 1 0000:00:0d.0
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
       bInterfaceSubClass      0 [unknown]
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
   bLength               9
   bDescriptorType      41
   nNbrPorts             1
   wHubCharacteristic 0x000a
     No power switching (usb 1.0)
     Per-port overcurrent protection
     TT think time 8 FS bits
   bPwrOn2PwrGood       10 * 2 milli seconds
   bHubContrCurrent      0 milli Ampere
   DeviceRemovable    0x00
   PortPwrCtrlMask    0xff
  Hub Port Status:
    Port 1: 0000.0100 power
Device Status:     0x0001
   Self Powered

Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.10
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         3
   bMaxPacketSize0         9
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0003 3.0 root hub
   bcdDevice            6.06
   iManufacturer           3 Linux 6.6.25-rt29 xhci-hcd
   iProduct                2 xHCI Host Controller
   iSerial                 1 0000:00:0d.0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x001f
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
       bInterfaceSubClass      0 [unknown]
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
         bMaxBurst               0
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x003b
   bNumDeviceCaps          2
   SuperSpeed USB Device Capability:
     bLength                10
     bDescriptorType        16
     bDevCapabilityType      3
     bmAttributes         0x02
       Latency Tolerance Messages (LTM) Supported
     wSpeedsSupported   0x0008
       Device can operate at SuperSpeed (5Gbps)
     bFunctionalitySupport   1
       Lowest fully-functional device speed is Full Speed (12Mbps)
     bU1DevExitLat           0 micro seconds
     bU2DevExitLat         400 micro seconds
   SuperSpeedPlus USB Device Capability:
     bLength                44
     bDescriptorType        16
     bDevCapabilityType     10
     bmAttributes         0x00000067
       Sublink Speed Attribute count 8
       Sublink Speed ID count 4
     wFunctionalitySupport   0x1104
       Min functional Speed Attribute ID: 4
       Min functional RX lanes: 1
       Min functional TX lanes: 1
     bmSublinkSpeedAttr[0]   0x00050034
       Speed Attribute ID: 4 5Gb/s Symmetric RX SuperSpeed
     bmSublinkSpeedAttr[1]   0x000500b4
       Speed Attribute ID: 4 5Gb/s Symmetric TX SuperSpeed
     bmSublinkSpeedAttr[2]   0x000a4035
       Speed Attribute ID: 5 10Gb/s Symmetric RX SuperSpeedPlus
     bmSublinkSpeedAttr[3]   0x000a40b5
       Speed Attribute ID: 5 10Gb/s Symmetric TX SuperSpeedPlus
     bmSublinkSpeedAttr[4]   0x00054036
       Speed Attribute ID: 6 5Gb/s Symmetric RX SuperSpeedPlus
     bmSublinkSpeedAttr[5]   0x000540b6
       Speed Attribute ID: 6 5Gb/s Symmetric TX SuperSpeedPlus
     bmSublinkSpeedAttr[6]   0x000a4037
       Speed Attribute ID: 7 10Gb/s Symmetric RX SuperSpeedPlus
     bmSublinkSpeedAttr[7]   0x000a40b7
       Speed Attribute ID: 7 10Gb/s Symmetric TX SuperSpeedPlus
Hub Descriptor:
   bLength              12
   bDescriptorType      42
   nNbrPorts             2
   wHubCharacteristic 0x000a
     No power switching (usb 1.0)
     Per-port overcurrent protection
   bPwrOn2PwrGood       50 * 2 milli seconds
   bHubContrCurrent      0 milli Ampere
   bHubDecLat          0.0 micro seconds
   wHubDelay             0 nano seconds
   DeviceRemovable    0x00
  Hub Port Status:
    Port 1: 0000.02a0 5Gbps power Rx.Detect
    Port 2: 0000.02a0 5Gbps power Rx.Detect
Device Status:     0x0001
   Self Powered

Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         1 Single TT
   bMaxPacketSize0        64
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0002 2.0 root hub
   bcdDevice            6.06
   iManufacturer           3 Linux 6.6.25-rt29 xhci-hcd
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
       bInterfaceSubClass      0 [unknown]
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
   bLength              11
   bDescriptorType      41
   nNbrPorts            12
   wHubCharacteristic 0x000a
     No power switching (usb 1.0)
     Per-port overcurrent protection
     TT think time 8 FS bits
   bPwrOn2PwrGood       10 * 2 milli seconds
   bHubContrCurrent      0 milli Ampere
   DeviceRemovable    0xa0 0x00
   PortPwrCtrlMask    0xff 0xff
  Hub Port Status:
    Port 1: 0000.0100 power
    Port 2: 0000.0303 lowspeed power enable connect
    Port 3: 0000.0100 power
    Port 4: 0000.0100 power
    Port 5: 0000.0503 highspeed power enable connect
    Port 6: 0000.0503 highspeed power enable connect
    Port 7: 0000.0507 highspeed power suspend enable connect
    Port 8: 0000.0100 power
    Port 9: 0000.0100 power
    Port 10: 0000.0100 power
    Port 11: 0000.0100 power
    Port 12: 0000.0100 power
Device Status:     0x0001
   Self Powered

Bus 003 Device 002: ID 046d:c31c Logitech, Inc. Keyboard K120
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               1.10
   bDeviceClass            0 [unknown]
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         0
   bMaxPacketSize0         8
   idVendor           0x046d Logitech, Inc.
   idProduct          0xc31c Keyboard K120
   bcdDevice           64.00
   iManufacturer           1 Logitech
   iProduct                2 USB Keyboard
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x003b
     bNumInterfaces          2
     bConfigurationValue     1
     iConfiguration          3 U64.00_B0001
     bmAttributes         0xa0
       (Bus Powered)
       Remote Wakeup
     MaxPower               90mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         3 Human Interface Device
       bInterfaceSubClass      1 Boot Interface Subclass
       bInterfaceProtocol      1 Keyboard
       iInterface              2 USB Keyboard
         HID Device Descriptor:
           bLength                 9
           bDescriptorType        33
           bcdHID               1.10
           bCountryCode            0 Not supported
           bNumDescriptors         1
           bDescriptorType        34 Report
           wDescriptorLength      65
           Report Descriptors:
             ** UNAVAILABLE **
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0008  1x 8 bytes
         bInterval              10
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         3 Human Interface Device
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0
       iInterface              2 USB Keyboard
         HID Device Descriptor:
           bLength                 9
           bDescriptorType        33
           bcdHID               1.10
           bCountryCode            0 Not supported
           bNumDescriptors         1
           bDescriptorType        34 Report
           wDescriptorLength     159
           Report Descriptors:
             ** UNAVAILABLE **
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x82  EP 2 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval             255
Device Status:     0x0000
   (Bus Powered)

Bus 003 Device 003: ID 174c:2074 ASMedia Technology Inc. ASM1074
High-Speed hub
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.10
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         2 TT per port
   bMaxPacketSize0        64
   idVendor           0x174c ASMedia Technology Inc.
   idProduct          0x2074 ASM1074 High-Speed hub
   bcdDevice            2.00
   iManufacturer           2 Asmedia
   iProduct                3 ASM107x
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0029
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower              100mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      1 Single TT
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0001  1x 1 bytes
         bInterval              12
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      2 TT per port
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0001  1x 1 bytes
         bInterval              12
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x002a
   bNumDeviceCaps          3
   USB 2.0 Extension Device Capability:
     bLength                 7
     bDescriptorType        16
     bDevCapabilityType      2
     bmAttributes   0x00000000
       (Missing must-be-set LPM bit!)
   SuperSpeed USB Device Capability:
     bLength                10
     bDescriptorType        16
     bDevCapabilityType      3
     bmAttributes         0x00
     wSpeedsSupported   0x000e
       Device can operate at Full Speed (12Mbps)
       Device can operate at High Speed (480Mbps)
       Device can operate at SuperSpeed (5Gbps)
     bFunctionalitySupport   1
       Lowest fully-functional device speed is Full Speed (12Mbps)
     bU1DevExitLat          10 micro seconds
     bU2DevExitLat        2047 micro seconds
   Container ID Device Capability:
     bLength                20
     bDescriptorType        16
     bDevCapabilityType      4
     bReserved               0
     ContainerID             {cfe2b8a8-57df-4db7-9881-214005c7fbe5}
Hub Descriptor:
   bLength               9
   bDescriptorType      41
   nNbrPorts             4
   wHubCharacteristic 0x00a9
     Per-port power switching
     Per-port overcurrent protection
     TT think time 16 FS bits
     Port indicators
   bPwrOn2PwrGood        1 * 2 milli seconds
   bHubContrCurrent    100 milli Ampere
   DeviceRemovable    0x00
   PortPwrCtrlMask    0xff
  Hub Port Status:
    Port 1: 0000.0100 power
    Port 2: 0000.0503 highspeed power enable connect
    Port 3: 0000.0100 power
    Port 4: 0000.0100 power
Device Status:     0x0001
   Self Powered

Bus 003 Device 004: ID 1235:8202 Focusrite-Novation Focusrite Scarlett
2i2 2nd Gen
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2 [unknown]
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x1235 Focusrite-Novation
   idProduct          0x8202 Focusrite Scarlett 2i2 2nd Gen
   bcdDevice            4.1b
   iManufacturer           1 Focusrite
   iProduct                3 Scarlett 2i2 USB
   iSerial                 0
   bNumConfigurations      2
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0116
     bNumInterfaces          4
     bConfigurationValue     1
     iConfiguration          9 Internal
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              500mA
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         0
       bInterfaceCount         3
       bFunctionClass          1 Audio
       bFunctionSubClass       0 [unknown]
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
       iInterface              3 Scarlett 2i2 USB
       AudioControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdADC               2.00
         bCategory               8
         wTotalLength       0x0077
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
         iClockSource           10 USB Internal
       AudioControl Interface Descriptor:
         bLength                 8
         bDescriptorType        36
         bDescriptorSubtype     11 (CLOCK_SELECTOR)
         bClockID               40
         bNrInPins               1
         baCSourceID(0)         41
         bmControls           0x03
           Clock Selector Control (read/write)
         iClockSelector          8 Clock Source
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
         iChannelNames          12 Output 1
         bmControls         0x0000
         iTerminal               6 Scarlett 2i2 USB
       AudioControl Interface Descriptor:
         bLength                18
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                10
         bSourceID               2
         bmaControls(0)     0x00000000
         bmaControls(1)     0x00000000
         bmaControls(2)     0x00000000
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
         iChannelNames          14 Input 1
         bmControls         0x0000
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                18
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                11
         bSourceID               1
         bmaControls(0)     0x00000000
         bmaControls(1)     0x00000000
         bmaControls(2)     0x00000000
         iFeature                0
       AudioControl Interface Descriptor:
         bLength                12
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID            22
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID              11
         bCSourceID             40
         bmControls         0x0000
         iTerminal               7 Scarlett 2i2 USB
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              4 Scarlett 2i2 USB
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           2
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              4 Scarlett 2i2 USB
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
         iChannelNames          12 Output 1
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
         bmAttributes           13
           Transfer Type            Isochronous
           Synch Type               Synchronous
           Usage Type               Data
         wMaxPacketSize     0x00c8  1x 200 bytes
         bInterval               1
         AudioStreaming Endpoint Descriptor:
           bLength                 8
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x00
           bmControls           0x00
           bLockDelayUnits         2 Decoded PCM samples
           wLockDelay         0x0008
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
       iInterface              5 Scarlett 2i2 USB
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              5 Scarlett 2i2 USB
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
         iChannelNames          14 Input 1
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
         bmAttributes           37
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Implicit feedback Data
         wMaxPacketSize     0x00c8  1x 200 bytes
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
       bNumEndpoints           1
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass      1 [unknown]
       bInterfaceProtocol     16
       iInterface             11 Focusrite Control
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               8
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0116
     bNumInterfaces          4
     bConfigurationValue     1
     iConfiguration          9 Internal
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              500mA
     Interface Association:
       bLength                 8
       bDescriptorType        11
       bFirstInterface         0
       bInterfaceCount         3
       bFunctionClass          1 Audio
       bFunctionSubClass       0 [unknown]
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
       iInterface              3 Scarlett 2i2 USB
       AudioControl Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdADC               2.00
         bCategory               8
         wTotalLength       0x0077
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
         iClockSource           10 USB Internal
       AudioControl Interface Descriptor:
         bLength                 8
         bDescriptorType        36
         bDescriptorSubtype     11 (CLOCK_SELECTOR)
         bClockID               40
         bNrInPins               1
         baCSourceID(0)         41
         bmControls           0x03
           Clock Selector Control (read/write)
         iClockSelector          8 Clock Source
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
         iChannelNames          12 Output 1
         bmControls         0x0000
         iTerminal               6 Scarlett 2i2 USB
       AudioControl Interface Descriptor:
         bLength                18
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                10
         bSourceID               2
         bmaControls(0)     0x00000000
         bmaControls(1)     0x00000000
         bmaControls(2)     0x00000000
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
         iChannelNames          14 Input 1
         bmControls         0x0000
         iTerminal               0
       AudioControl Interface Descriptor:
         bLength                18
         bDescriptorType        36
         bDescriptorSubtype      6 (FEATURE_UNIT)
         bUnitID                11
         bSourceID               1
         bmaControls(0)     0x00000000
         bmaControls(1)     0x00000000
         bmaControls(2)     0x00000000
         iFeature                0
       AudioControl Interface Descriptor:
         bLength                12
         bDescriptorType        36
         bDescriptorSubtype      3 (OUTPUT_TERMINAL)
         bTerminalID            22
         wTerminalType      0x0101 USB Streaming
         bAssocTerminal          0
         bSourceID              11
         bCSourceID             40
         bmControls         0x0000
         iTerminal               7 Scarlett 2i2 USB
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       0
       bNumEndpoints           0
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              4 Scarlett 2i2 USB
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        1
       bAlternateSetting       1
       bNumEndpoints           2
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              4 Scarlett 2i2 USB
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
         iChannelNames          12 Output 1
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
         bmAttributes           13
           Transfer Type            Isochronous
           Synch Type               Synchronous
           Usage Type               Data
         wMaxPacketSize     0x00c8  1x 200 bytes
         bInterval               1
         AudioStreaming Endpoint Descriptor:
           bLength                 8
           bDescriptorType        37
           bDescriptorSubtype      1 (EP_GENERAL)
           bmAttributes         0x00
           bmControls           0x00
           bLockDelayUnits         2 Decoded PCM samples
           wLockDelay         0x0008
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
       iInterface              5 Scarlett 2i2 USB
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        2
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass         1 Audio
       bInterfaceSubClass      2 Streaming
       bInterfaceProtocol     32
       iInterface              5 Scarlett 2i2 USB
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
         iChannelNames          14 Input 1
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
         bmAttributes           37
           Transfer Type            Isochronous
           Synch Type               Asynchronous
           Usage Type               Implicit feedback Data
         wMaxPacketSize     0x00c8  1x 200 bytes
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
       bNumEndpoints           1
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass      1 [unknown]
       bInterfaceProtocol     16
       iInterface             11 Focusrite Control
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x83  EP 3 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0040  1x 64 bytes
         bInterval               8
Device Qualifier (for other device speed):
   bLength                10
   bDescriptorType         6
   bcdUSB               2.00
   bDeviceClass            0 [unknown]
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         0
   bMaxPacketSize0        64
   bNumConfigurations      1
Device Status:     0x0000
   (Bus Powered)

Bus 003 Device 005: ID 148f:2070 Ralink Technology, Corp. RT2070
Wireless Adapter
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            0 [unknown]
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         0
   bMaxPacketSize0        64
   idVendor           0x148f Ralink Technology, Corp.
   idProduct          0x2070 RT2070 Wireless Adapter
   bcdDevice            1.01
   iManufacturer           1 Ralink
   iProduct                2 802.11 g WLAN
   iSerial                 3 1.0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0043
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x80
       (Bus Powered)
     MaxPower              450mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           7
       bInterfaceClass       255 Vendor Specific Class
       bInterfaceSubClass    255 Vendor Specific Subclass
       bInterfaceProtocol    255 Vendor Specific Protocol
       iInterface              5 1.0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x02  EP 2 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x03  EP 3 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x04  EP 4 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x05  EP 5 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x06  EP 6 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0200  1x 512 bytes
         bInterval               0
Device Qualifier (for other device speed):
   bLength                10
   bDescriptorType         6
   bcdUSB               2.00
   bDeviceClass            0 [unknown]
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         0
   bMaxPacketSize0        64
   bNumConfigurations      1
Device Status:     0x0000
   (Bus Powered)

Bus 003 Device 006: ID 05e3:0610 Genesys Logic, Inc. Hub
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         2 TT per port
   bMaxPacketSize0        64
   idVendor           0x05e3 Genesys Logic, Inc.
   idProduct          0x0610 Hub
   bcdDevice           60.52
   iManufacturer           0
   iProduct                1 USB2.0 Hub
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0029
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower              100mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      1 Single TT
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0001  1x 1 bytes
         bInterval              12
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       1
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      2 TT per port
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            3
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0001  1x 1 bytes
         bInterval              12
Hub Descriptor:
   bLength               9
   bDescriptorType      41
   nNbrPorts             4
   wHubCharacteristic 0x00e9
     Per-port power switching
     Per-port overcurrent protection
     TT think time 32 FS bits
     Port indicators
   bPwrOn2PwrGood       50 * 2 milli seconds
   bHubContrCurrent    100 milli Ampere
   DeviceRemovable    0x00
   PortPwrCtrlMask    0xff
  Hub Port Status:
    Port 1: 0000.0100 power
    Port 2: 0000.0100 power
    Port 3: 0000.0100 power
    Port 4: 0000.0100 power
Device Qualifier (for other device speed):
   bLength                10
   bDescriptorType         6
   bcdUSB               2.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         0 Full speed (or root) hub
   bMaxPacketSize0        64
   bNumConfigurations      1
Device Status:     0x0001
   Self Powered

Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.10
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         3
   bMaxPacketSize0         9
   idVendor           0x1d6b Linux Foundation
   idProduct          0x0003 3.0 root hub
   bcdDevice            6.06
   iManufacturer           3 Linux 6.6.25-rt29 xhci-hcd
   iProduct                2 xHCI Host Controller
   iSerial                 1 0000:00:14.0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x001f
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
       bInterfaceSubClass      0 [unknown]
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
         bMaxBurst               0
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x005b
   bNumDeviceCaps          2
   SuperSpeed USB Device Capability:
     bLength                10
     bDescriptorType        16
     bDevCapabilityType      3
     bmAttributes         0x02
       Latency Tolerance Messages (LTM) Supported
     wSpeedsSupported   0x0008
       Device can operate at SuperSpeed (5Gbps)
     bFunctionalitySupport   1
       Lowest fully-functional device speed is Full Speed (12Mbps)
     bU1DevExitLat          10 micro seconds
     bU2DevExitLat         160 micro seconds
   SuperSpeedPlus USB Device Capability:
     bLength                76
     bDescriptorType        16
     bDevCapabilityType     10
     bmAttributes         0x000000ef
       Sublink Speed Attribute count 16
       Sublink Speed ID count 8
     wFunctionalitySupport   0x1106
       Min functional Speed Attribute ID: 6
       Min functional RX lanes: 1
       Min functional TX lanes: 1
     bmSublinkSpeedAttr[0]   0x00050034
       Speed Attribute ID: 4 5Gb/s Symmetric RX SuperSpeed
     bmSublinkSpeedAttr[1]   0x000500b4
       Speed Attribute ID: 4 5Gb/s Symmetric TX SuperSpeed
     bmSublinkSpeedAttr[2]   0x000a4035
       Speed Attribute ID: 5 10Gb/s Symmetric RX SuperSpeedPlus
     bmSublinkSpeedAttr[3]   0x000a40b5
       Speed Attribute ID: 5 10Gb/s Symmetric TX SuperSpeedPlus
     bmSublinkSpeedAttr[4]   0x00e00026
       Speed Attribute ID: 6 224Mb/s Symmetric RX SuperSpeed
     bmSublinkSpeedAttr[5]   0x00e000a6
       Speed Attribute ID: 6 224Mb/s Symmetric TX SuperSpeed
     bmSublinkSpeedAttr[6]   0x00c00027
       Speed Attribute ID: 7 192Mb/s Symmetric RX SuperSpeed
     bmSublinkSpeedAttr[7]   0x00c000a7
       Speed Attribute ID: 7 192Mb/s Symmetric TX SuperSpeed
     bmSublinkSpeedAttr[8]   0x00800028
       Speed Attribute ID: 8 128Mb/s Symmetric RX SuperSpeed
     bmSublinkSpeedAttr[9]   0x008000a8
       Speed Attribute ID: 8 128Mb/s Symmetric TX SuperSpeed
     bmSublinkSpeedAttr[10]   0x00b10029
       Speed Attribute ID: 9 177Mb/s Symmetric RX SuperSpeed
     bmSublinkSpeedAttr[11]   0x00b100a9
       Speed Attribute ID: 9 177Mb/s Symmetric TX SuperSpeed
     bmSublinkSpeedAttr[12]   0x0063002a
       Speed Attribute ID: 10 99Mb/s Symmetric RX SuperSpeed
     bmSublinkSpeedAttr[13]   0x006300aa
       Speed Attribute ID: 10 99Mb/s Symmetric TX SuperSpeed
     bmSublinkSpeedAttr[14]   0x00c6002b
       Speed Attribute ID: 11 198Mb/s Symmetric RX SuperSpeed
     bmSublinkSpeedAttr[15]   0x00c600ab
       Speed Attribute ID: 11 198Mb/s Symmetric TX SuperSpeed
Hub Descriptor:
   bLength              12
   bDescriptorType      42
   nNbrPorts             4
   wHubCharacteristic 0x000a
     No power switching (usb 1.0)
     Per-port overcurrent protection
   bPwrOn2PwrGood       50 * 2 milli seconds
   bHubContrCurrent      0 milli Ampere
   bHubDecLat          0.0 micro seconds
   wHubDelay             0 nano seconds
   DeviceRemovable    0x02
  Hub Port Status:
    Port 1: 0000.0263 5Gbps power suspend enable connect
      Ext Status: 0000.0044
        RX Speed Attribute ID: 4 Lanes: 1
        TX Speed Attribute ID: 4 Lanes: 1
    Port 2: 0000.02a0 5Gbps power Rx.Detect
    Port 3: 0000.02a0 5Gbps power Rx.Detect
    Port 4: 0000.02a0 5Gbps power Rx.Detect
Device Status:     0x0001
   Self Powered

Bus 004 Device 002: ID 174c:3074 ASMedia Technology Inc. ASM1074
SuperSpeed hub
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               3.00
   bDeviceClass            9 Hub
   bDeviceSubClass         0 [unknown]
   bDeviceProtocol         3
   bMaxPacketSize0         9
   idVendor           0x174c ASMedia Technology Inc.
   idProduct          0x3074 ASM1074 SuperSpeed hub
   bcdDevice            2.00
   iManufacturer           2 Asmedia
   iProduct                3 ASM107x
   iSerial                 0
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x001f
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0xe0
       Self Powered
       Remote Wakeup
     MaxPower                8mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass         9 Hub
       bInterfaceSubClass      0 [unknown]
       bInterfaceProtocol      0 Full speed (or root) hub
       iInterface              0
       Endpoint Descriptor:
         bLength                 7
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes           19
           Transfer Type            Interrupt
           Synch Type               None
           Usage Type               Feedback
         wMaxPacketSize     0x0002  1x 2 bytes
         bInterval               8
         bMaxBurst               0
Binary Object Store Descriptor:
   bLength                 5
   bDescriptorType        15
   wTotalLength       0x002a
   bNumDeviceCaps          3
   USB 2.0 Extension Device Capability:
     bLength                 7
     bDescriptorType        16
     bDevCapabilityType      2
     bmAttributes   0x00000000
       (Missing must-be-set LPM bit!)
   SuperSpeed USB Device Capability:
     bLength                10
     bDescriptorType        16
     bDevCapabilityType      3
     bmAttributes         0x00
     wSpeedsSupported   0x000e
       Device can operate at Full Speed (12Mbps)
       Device can operate at High Speed (480Mbps)
       Device can operate at SuperSpeed (5Gbps)
     bFunctionalitySupport   1
       Lowest fully-functional device speed is Full Speed (12Mbps)
     bU1DevExitLat          10 micro seconds
     bU2DevExitLat        2047 micro seconds
   Container ID Device Capability:
     bLength                20
     bDescriptorType        16
     bDevCapabilityType      4
     bReserved               0
     ContainerID             {cfe2b8a8-57df-4db7-9881-214005c7fbe5}
Hub Descriptor:
   bLength              12
   bDescriptorType      42
   nNbrPorts             4
   wHubCharacteristic 0x0009
     Per-port power switching
     Per-port overcurrent protection
   bPwrOn2PwrGood       60 * 2 milli seconds
   bHubContrCurrent    400 milli Ampere
   bHubDecLat          0.4 micro seconds
   wHubDelay          3492 nano seconds
   DeviceRemovable    0x00
  Hub Port Status:
    Port 1: 0000.02a0 5Gbps power Rx.Detect
    Port 2: 0000.02a0 5Gbps power Rx.Detect
    Port 3: 0000.02a0 5Gbps power Rx.Detect
    Port 4: 0000.02a0 5Gbps power Rx.Detect
Device Status:     0x000d
   Self Powered
   U1 Enabled
   U2 Enabled

[fps@ogfx100:~]$ sudo lsusb -t
/:  Bus 001.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/1p, 480=
M
/:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/2p, 200=
00M/x2
/:  Bus 003.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/12p, 48=
0M
     |__ Port 002: Dev 002, If 0, Class=3DHuman Interface Device,
Driver=3Dusbhid, 1.5M
     |__ Port 002: Dev 002, If 1, Class=3DHuman Interface Device,
Driver=3Dusbhid, 1.5M
     |__ Port 005: Dev 003, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
         |__ Port 002: Dev 005, If 0, Class=3DVendor Specific Class,
Driver=3Drt2800usb, 480M
     |__ Port 006: Dev 004, If 0, Class=3DAudio, Driver=3Dsnd-usb-audio, 4=
80M
     |__ Port 006: Dev 004, If 1, Class=3DAudio, Driver=3Dsnd-usb-audio, 4=
80M
     |__ Port 006: Dev 004, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 4=
80M
     |__ Port 006: Dev 004, If 3, Class=3DVendor Specific Class,
Driver=3D[none], 480M
     |__ Port 007: Dev 006, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
/:  Bus 004.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 100=
00M
     |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/4p, 5000M


[fps@ogfx100:~]$ cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 190
model name      : Intel(R) N100
stepping        : 0
microcode       : 0x15
cpu MHz         : 700.000
cache size      : 6144 KB
physical id     : 0
siblings        : 4
core id         : 0
cpu cores       : 4
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 32
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni
pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr
pdcm sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx
f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb cat_l2 cdp_l2 ssbd
ibrs ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad
fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdt_a rdseed adx
smap clflushopt clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves
split_lock_detect user_shstk avx_vnni dtherm ida arat pln pts hwp
hwp_notify hwp_act_window hwp_epp hwp_pkg_req vnmi umip pku ospke
waitpkg gfni vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear
serialize arch_lbr ibt flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer posted_intr invvpid ept_x_only
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_mode_based_exec
tsc_scaling usr_wait_pause
bugs            : spectre_v1 spectre_v2 spec_store_bypass swapgs rfds
bogomips        : 1612.80
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

processor       : 1
vendor_id       : GenuineIntel
cpu family      : 6
model           : 190
model name      : Intel(R) N100
stepping        : 0
microcode       : 0x15
cpu MHz         : 3052.591
cache size      : 6144 KB
physical id     : 0
siblings        : 4
core id         : 1
cpu cores       : 4
apicid          : 2
initial apicid  : 2
fpu             : yes
fpu_exception   : yes
cpuid level     : 32
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni
pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr
pdcm sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx
f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb cat_l2 cdp_l2 ssbd
ibrs ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad
fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdt_a rdseed adx
smap clflushopt clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves
split_lock_detect user_shstk avx_vnni dtherm ida arat pln pts hwp
hwp_notify hwp_act_window hwp_epp hwp_pkg_req vnmi umip pku ospke
waitpkg gfni vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear
serialize arch_lbr ibt flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer posted_intr invvpid ept_x_only
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_mode_based_exec
tsc_scaling usr_wait_pause
bugs            : spectre_v1 spectre_v2 spec_store_bypass swapgs rfds
bogomips        : 1612.80
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

processor       : 2
vendor_id       : GenuineIntel
cpu family      : 6
model           : 190
model name      : Intel(R) N100
stepping        : 0
microcode       : 0x15
cpu MHz         : 3148.532
cache size      : 6144 KB
physical id     : 0
siblings        : 4
core id         : 2
cpu cores       : 4
apicid          : 4
initial apicid  : 4
fpu             : yes
fpu_exception   : yes
cpuid level     : 32
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni
pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr
pdcm sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx
f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb cat_l2 cdp_l2 ssbd
ibrs ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad
fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdt_a rdseed adx
smap clflushopt clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves
split_lock_detect user_shstk avx_vnni dtherm ida arat pln pts hwp
hwp_notify hwp_act_window hwp_epp hwp_pkg_req vnmi umip pku ospke
waitpkg gfni vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear
serialize arch_lbr ibt flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer posted_intr invvpid ept_x_only
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_mode_based_exec
tsc_scaling usr_wait_pause
bugs            : spectre_v1 spectre_v2 spec_store_bypass swapgs rfds
bogomips        : 1612.80
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:

processor       : 3
vendor_id       : GenuineIntel
cpu family      : 6
model           : 190
model name      : Intel(R) N100
stepping        : 0
microcode       : 0x15
cpu MHz         : 3125.526
cache size      : 6144 KB
physical id     : 0
siblings        : 4
core id         : 3
cpu cores       : 4
apicid          : 6
initial apicid  : 6
fpu             : yes
fpu_exception   : yes
cpuid level     : 32
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe
syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts
rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni
pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr
pdcm sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx
f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb cat_l2 cdp_l2 ssbd
ibrs ibpb stibp ibrs_enhanced tpr_shadow flexpriority ept vpid ept_ad
fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid rdt_a rdseed adx
smap clflushopt clwb intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves
split_lock_detect user_shstk avx_vnni dtherm ida arat pln pts hwp
hwp_notify hwp_act_window hwp_epp hwp_pkg_req vnmi umip pku ospke
waitpkg gfni vaes vpclmulqdq rdpid movdiri movdir64b fsrm md_clear
serialize arch_lbr ibt flush_l1d arch_capabilities
vmx flags       : vnmi preemption_timer posted_intr invvpid ept_x_only
ept_ad ept_1gb flexpriority apicv tsc_offset vtpr mtf vapic ept vpid
unrestricted_guest vapic_reg vid ple shadow_vmcs ept_mode_based_exec
tsc_scaling usr_wait_pause
bugs            : spectre_v1 spectre_v2 spec_store_bypass swapgs rfds
bogomips        : 1612.80
clflush size    : 64
cache_alignment : 64
address sizes   : 39 bits physical, 48 bits virtual
power management:



=2D-
https://dfdx.eu
