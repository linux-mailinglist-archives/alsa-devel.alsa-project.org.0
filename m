Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45791793C8A
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Sep 2023 14:23:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F408200;
	Wed,  6 Sep 2023 14:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F408200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694003012;
	bh=CuJV8leS3btIGd1QUJKE0Q9jqB9nolyhqizLRFXlt4k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JM6IBVaNfXJ5QrBnS3oaCd7modmlwNT/i9HWMCF4YYFWlsTDsieyWmG34y9xb/yz5
	 P3EDAZBhnV4sKMm1EIsEMgxJv9lJZyer5trI90VVcF/l7wVgzmPz1pmsG8L395o5OZ
	 pzvyTUWNC1zCxLZx+snrFcwVoWdfmPzsfUBL2tIA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF66BF80564; Wed,  6 Sep 2023 14:21:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F98EF80558;
	Wed,  6 Sep 2023 14:21:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AFC4F80494; Wed,  6 Sep 2023 14:21:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id C89BCF80236
	for <alsa-devel@alsa-project.org>; Wed,  6 Sep 2023 14:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C89BCF80236
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1694002902040477991-webhooks-bot@alsa-project.org>
References: <1694002902040477991-webhooks-bot@alsa-project.org>
Subject: ASUS RoG Strix Z790-F: No SPDIF Sound output
Message-Id: <20230906122144.6AFC4F80494@alsa1.perex.cz>
Date: Wed,  6 Sep 2023 14:21:44 +0200 (CEST)
Message-ID-Hash: VZANIOPCQNCLO6VYUIXERO2ELVFXZFMZ
X-Message-ID-Hash: VZANIOPCQNCLO6VYUIXERO2ELVFXZFMZ
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VZANIOPCQNCLO6VYUIXERO2ELVFXZFMZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #350 was opened from Nightwing0815:

Hey guys,

what Can I do to get my optical toslink output ( pcm signal undecoded ) working?
Here are an inxi report of my system:

```
System:
  Host: Ultron Kernel: 6.1.0-1013-oem x86_64 bits: 64 compiler: N/A
    parameters: BOOT_IMAGE=/vmlinuz-6.1.0-1013-oem
    root=UUID=aa125f57-ee1e-4fd4-93fc-a77a180ec451 ro quiet splash
  Desktop: Cinnamon 5.6.8 tk: GTK 3.24.33 wm: muffin vt: 7
    dm: LightDM 1.30.0 Distro: Linux Mint 21.1 Vera base: Ubuntu 22.04 jammy
Machine:
  Type: Desktop System: ASUS product: N/A v: N/A serial: <superuser required>
  Mobo: ASUSTeK model: ROG STRIX Z790-F GAMING WIFI v: Rev 1.xx
    serial: <superuser required> UEFI: American Megatrends v: 0904
    date: 03/29/2023
Battery:
  Message: No system battery data found. Is one present?
Memory:
  RAM: total: 62.57 GiB used: 2.13 GiB (3.4%)
  RAM Report:
    unknown-error: Unknown dmidecode error. Unable to generate data.
PCI Slots:
  Unknown-error: Unknown dmidecode error. Unable to generate data.
CPU:
  Info: model: 13th Gen Intel Core i7-13700K bits: 64 type: MST AMCP
    arch: N/A family: 6 model-id: 0xB7 (183) stepping: 1 microcode: 0x113
  Topology: cpus: 1x cores: 16 mt: 8 tpc: 2 st: 8 threads: 24 smt: enabled
    cache: L1: 1.4 MiB desc: d-8x32 KiB, 8x48 KiB; i-8x32 KiB, 8x64 KiB
    L2: 24 MiB desc: 8x2 MiB, 2x4 MiB L3: 30 MiB desc: 1x30 MiB
  Speed (MHz): avg: 3100 high: 3400 min/max: 800/5300:5400:4200 scaling:
    driver: intel_pstate governor: powersave cores: 1: 1100 2: 3400 3: 3400
    4: 3400 5: 3400 6: 3400 7: 3400 8: 3400 9: 3400 10: 3400 11: 3400
    12: 3400 13: 3400 14: 3400 15: 1100 16: 3400 17: 800 18: 3400 19: 3400
    20: 3400 21: 3400 22: 3400 23: 3400 24: 3400 bogomips: 164044
Graphics:
  Device-1: NVIDIA vendor: CardExpert driver: nvidia v: 530.41.03
    alternate: nvidiafb,nouveau,nvidia_drm ports: active: none
    off: DP-1,HDMI-A-1 empty: DP-2,DP-3 bus-ID: 0000:01:00.0
    chip-ID: 10de:2782 class-ID: 0300
  Display: x11 server: X.Org v: 1.21.1.4 driver: X: loaded: nvidia
    gpu: nvidia display-ID: :0 screens: 1
  Screen-1: 0 s-res: 1920x2160 s-dpi: 46 s-size: 1060x1167mm (41.7x45.9")
    s-diag: 1577mm (62.1")
  Monitor-1: DP-1 pos: primary,bottom res: 1920x1080 hz: 60 dpi: 102
    size: 477x268mm (18.8x10.6") diag: 547mm (21.5")
  Monitor-2: HDMI-0 pos: primary,top res: 1920x1080 hz: 60 dpi: 38
    size: 1280x720mm (50.4x28.3") diag: 1469mm (57.8")
  OpenGL: renderer: NVIDIA GeForce RTX 4070 Ti/PCIe/SSE2
    v: 4.6.0 NVIDIA 530.41.03 direct render: Yes
Audio:
  Device-1: Intel vendor: ASUSTeK driver: snd_hda_intel v: kernel
    alternate: snd_sof_pci_intel_tgl bus-ID: 0000:00:1f.3 chip-ID: 8086:7a50
    class-ID: 0403
  Device-2: NVIDIA vendor: CardExpert driver: snd_hda_intel v: kernel
    bus-ID: 0000:01:00.1 chip-ID: 10de:22bc class-ID: 0403
  Device-3: ASUSTek USB Audio type: USB
    driver: hid-generic,snd-usb-audio,usbhid bus-ID: 1-2:2 chip-ID: 0b05:1a52
    class-ID: 0300
  Sound Server-1: ALSA v: k6.1.0-1013-oem running: yes
  Sound Server-2: PulseAudio v: 15.99.1 running: no
  Sound Server-3: PipeWire v: 0.3.48 running: yes
Network:
  Device-1: Intel vendor: ASUSTeK driver: igc v: kernel port: N/A
    bus-ID: 0000:05:00.0 chip-ID: 8086:125c class-ID: 0200
  IF: eno2 state: up speed: 1000 Mbps duplex: full mac: c8:7f:54:6a:7e:55
  IP v4: 192.168.178.10/24 type: noprefixroute scope: global
    broadcast: 192.168.178.255
  IP v6: 2a02:8070:8a80:77c0:aac9:dade:e3e2:8611/64 type: temporary dynamic
    scope: global
  IP v6: 2a02:8070:8a80:77c0:64ef:c8d5:1d2b:3a7f/64
    type: dynamic mngtmpaddr noprefixroute scope: global
  IP v6: fe80::6d94:62d1:90b5:608b/64 type: noprefixroute scope: link
  IF-ID-1: virbr0 state: down mac: 52:54:00:e9:bf:38
  IP v4: 192.168.100.1/24 scope: global broadcast: 192.168.100.255
  WAN IP: 46.5.221.128
Bluetooth:
  Message: No bluetooth data found.
Logical:
  Message: No logical block device data found.
RAID:
  Hardware-1: Intel Device driver: vmd v: 0.6 port: N/A bus-ID: 0000:00:0e.0
    chip-ID: 8086:a77f rev: class-ID: 0104
Unmounted:
  Message: No unmounted partitions found.
USB:
  Hub-1: 1-0:1 info: Hi-speed hub with single TT ports: 16 rev: 2.0
    speed: 480 Mb/s chip-ID: 1d6b:0002 class-ID: 0900
  Device-1: 1-2:2 info: ASUSTek USB Audio type: Audio,HID
    driver: hid-generic,snd-usb-audio,usbhid interfaces: 8 rev: 2.0
    speed: 480 Mb/s power: 100mA chip-ID: 0b05:1a52 class-ID: 0300
  Device-2: 1-4:3 info: ASUSTek AURA LED Controller type: HID
    driver: hid-generic,usbhid interfaces: 2 rev: 2.0 speed: 12 Mb/s
    power: 16mA chip-ID: 0b05:19af class-ID: 0300 serial: 9876543210
  Hub-2: 1-10:4 info: ASMedia ASM1074 High-Speed hub ports: 4 rev: 2.1
    speed: 480 Mb/s power: 100mA chip-ID: 174c:2074 class-ID: 0900
  Device-1: 1-10.3:6 info: Fujitsu Siemens s KB955 USB Keyboard
    type: Keyboard,HID driver: hid-generic,usbhid interfaces: 2 rev: 1.1
    speed: 1.5 Mb/s power: 100mA chip-ID: 0bf8:102e class-ID: 0300
  Device-2: 1-10.4:8 info: Logitech G5 Laser Mouse type: Mouse,HID
    driver: hid-generic,usbhid interfaces: 2 rev: 2.0 speed: 12 Mb/s
    power: 98mA chip-ID: 046d:c049 class-ID: 0300
  Hub-3: 1-11:5 info: Genesys Logic Hub ports: 4 rev: 2.0 speed: 480 Mb/s
    power: 100mA chip-ID: 05e3:0608 class-ID: 0900
  Hub-4: 1-13:7 info: Genesys Logic Hub ports: 4 rev: 2.0 speed: 480 Mb/s
    power: 100mA chip-ID: 05e3:0608 class-ID: 0900
  Hub-5: 2-0:1 info: Super-speed hub ports: 8 rev: 3.1 speed: 20 Gb/s
    chip-ID: 1d6b:0003 class-ID: 0900
  Hub-6: 2-8:2 info: ASMedia ASM1074 SuperSpeed hub ports: 4 rev: 3.0
    speed: 5 Gb/s power: 8mA chip-ID: 174c:3074 class-ID: 0900
Sensors:
  System Temperatures: cpu: 32.5 C mobo: 30.0 C gpu: nvidia temp: 36 C
  Fan Speeds (RPM): fan-1: 0 fan-2: 808 fan-3: 0 fan-4: 0 fan-5: 447
    fan-6: 453 fan-7: 2288 gpu: nvidia fan: 0%
```

Thanks in advance,

ToM

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/350
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
