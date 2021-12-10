Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1B146FB04
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 07:59:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B24E9170A;
	Fri, 10 Dec 2021 07:58:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B24E9170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639119563;
	bh=3aDH0qIozabq3xwoeaOdGfIoY5fUGWsvCNViv0SDHOA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=inekI/V5WzHg5DaXu+HXywKlkAUL610GwhoRH9jtz9qO8ZmAS4+wKPcwVadZsfJ8d
	 MqfDUUlray6vFQUDcuBbZmS9gd//R9eACpBluYdjr0aFxAXFXzp0GrWe+GWgN8MudL
	 sJ6YLatDRkJQOzQeAfMdwVWTy/qagGGHsM9tHHxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAD50F8028D;
	Fri, 10 Dec 2021 07:58:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D19EF804E5; Fri, 10 Dec 2021 07:58:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 55F98F8028D
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 07:57:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55F98F8028D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639119476102976084-webhooks-bot@alsa-project.org>
References: <1639119476102976084-webhooks-bot@alsa-project.org>
Subject: PA reports possible bug in 'snd_usb_audio'
Message-Id: <20211210065807.5D19EF804E5@alsa1.perex.cz>
Date: Fri, 10 Dec 2021 07:58:07 +0100 (CET)
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

alsa-project/alsa-lib issue #201 was opened from riveravaldez:

Hi, I'm having some hangs with an until-yesterday perfectly-working setup.
Only way to fix it seems to be restarting JACK.

Looking at system messages I found:

```
$ sudo journalctl -b -exp3
- Journal begins at Mon 2020-09-07 22:43:48 -03, ends at Thu 2021-12-09 17:38:30 -03. --
dic 02 20:05:13 debian pulseaudio[73378]: Failed to load module "module-alsa-card" (argument: "device_id="1" name="usb-Burr-Brown_from_TI_USB_Audio_CODEC-00" card_name=">
dic 03 14:31:49 debian pulseaudio[92221]: Failed to find a working profile.
dic 03 14:31:49 debian pulseaudio[92221]: Failed to load module "module-alsa-card" (argument: "device_id="2" name="usb-Evolution_Electronics_Ltd._USB_Keystation_61es-00">
dic 03 16:54:00 debian kernel: usb 1-1.2: urb status -32
dic 03 16:54:00 debian kernel: usb 1-1.2: urb status -32
(...)
dic 03 16:54:02 debian kernel: usb 1-1.2: urb status -32
dic 03 16:54:02 debian kernel: usb 1-1.2: urb status -32
dic 03 16:56:37 debian pulseaudio[92221]: Failed to load module "module-alsa-card" (argument: "device_id="1" name="usb-Burr-Brown_from_TI_USB_Audio_CODEC-00" card_name=">
dic 04 13:04:55 debian pulseaudio[95017]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
dic 04 13:04:55 debian pulseaudio[95017]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
dic 04 13:04:55 debian pulseaudio[95017]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
dic 08 10:47:20 debian pulseaudio[174863]: Failed to find a working profile.
dic 08 10:47:20 debian pulseaudio[174863]: Failed to load module "module-alsa-card" (argument: "device_id="2" name="usb-Evolution_Electronics_Ltd._USB_Keystation_61es-00>
dic 08 18:16:06 debian kernel: usb 1-1.2: urb status -32
dic 08 18:16:07 debian kernel: usb 1-1.2: urb status -32
(...)
dic 08 18:16:08 debian kernel: usb 1-1.2: urb status -32
dic 08 18:16:08 debian kernel: usb 1-1.2: urb status -32
dic 08 18:17:50 debian pulseaudio[174863]: Failed to load module "module-alsa-card" (argument: "device_id="1" name="usb-Burr-Brown_from_TI_USB_Audio_CODEC-00" card_name=>
dic 09 13:10:40 debian pulseaudio[202715]: Failed to find a working profile.
dic 09 13:10:40 debian pulseaudio[202715]: Failed to load module "module-alsa-card" (argument: "device_id="2" name="usb-Evolution_Electronics_Ltd._USB_Keystation_61es-00>
dic 09 13:59:46 debian pulseaudio[202715]: Failed to load module "module-alsa-card" (argument: "device_id="1" name="usb-Burr-Brown_from_TI_USB_Audio_CODEC-00" card_name=>
dic 09 14:13:31 debian pulseaudio[204356]: Failed to find a working profile.
dic 09 14:13:31 debian pulseaudio[204356]: Failed to load module "module-alsa-card" (argument: "device_id="2" name="usb-Evolution_Electronics_Ltd._USB_Keystation_61es-00>
dic 09 14:13:52 debian pulseaudio[204395]: Failed to find a working profile.
dic 09 14:13:52 debian pulseaudio[204395]: Failed to load module "module-alsa-card" (argument: "device_id="2" name="usb-Evolution_Electronics_Ltd._USB_Keystation_61es-00>
dic 09 14:31:20 debian pulseaudio[204395]: Failed to load module "module-alsa-card" (argument: "device_id="1" name="usb-Burr-Brown_from_TI_USB_Audio_CODEC-00" card_name=>
dic 09 14:38:26 debian pulseaudio[205228]: Failed to find a working profile.
dic 09 14:38:26 debian pulseaudio[205228]: Failed to load module "module-alsa-card" (argument: "device_id="2" name="usb-Evolution_Electronics_Ltd._USB_Keystation_61es-00>
dic 09 15:05:37 debian pulseaudio[205228]: Failed to load module "module-alsa-card" (argument: "device_id="1" name="usb-Burr-Brown_from_TI_USB_Audio_CODEC-00" card_name=>
dic 09 17:25:21 debian pulseaudio[205228]: jack_client_open() failed.
dic 09 17:25:21 debian pulseaudio[205228]: Failed to load module "module-jack-sink" (argument: ""): initialization failed.
```

This is a ThinkPad X220T with updated Debian 11 (Stable) with the internal audio-interface turned-off through PA and an external Behringer U-PHORIA UMC22 handling all the audio.

```
$ uname -a
Linux debian 5.10.0-9-amd64 #1 SMP Debian 5.10.70-1 (2021-09-30) x86_64 GNU/Linux
$ lspci 
00:00.0 Host bridge: Intel Corporation 2nd Generation Core Processor Family DRAM Controller (rev 09)
00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core Processor Family Integrated Graphics Controller (rev 09)
00:16.0 Communication controller: Intel Corporation 6 Series/C200 Series Chipset Family MEI Controller #1 (rev 04)
00:16.3 Serial controller: Intel Corporation 6 Series/C200 Series Chipset Family KT Controller (rev 04)
00:19.0 Ethernet controller: Intel Corporation 82579LM Gigabit Network Connection (Lewisville) (rev 04)
00:1a.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #2 (rev 04)
00:1b.0 Audio device: Intel Corporation 6 Series/C200 Series Chipset Family High Definition Audio Controller (rev 04)
00:1c.0 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 1 (rev b4)
00:1c.1 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 2 (rev b4)
00:1c.3 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 4 (rev b4)
00:1c.4 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 5 (rev b4)
00:1d.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Controller #1 (rev 04)
00:1f.0 ISA bridge: Intel Corporation QM67 Express Chipset LPC Controller (rev 04)
00:1f.2 SATA controller: Intel Corporation 6 Series/C200 Series Chipset Family 6 port Mobile SATA AHCI Controller (rev 04)
00:1f.3 SMBus: Intel Corporation 6 Series/C200 Series Chipset Family SMBus Controller (rev 04)
03:00.0 Network controller: Intel Corporation Centrino Advanced-N 6205 [Taylor Peak] (rev 34)
0d:00.0 System peripheral: Ricoh Co Ltd PCIe SDXC/MMC Host Controller (rev 07)
$ lsusb 
Bus 002 Device 004: ID 056a:00e6 Wacom Co., Ltd TPCE6
Bus 002 Device 024: ID 0000:3825   USB OPTICAL MOUSE
Bus 002 Device 028: ID 08bb:2902 Texas Instruments PCM2902 Audio Codec
Bus 002 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 003: ID 04f2:b217 Chicony Electronics Co., Ltd Lenovo Integrated Camera (0.3MP)
Bus 001 Device 034: ID 0a4d:0091 Evolution Electronics, Ltd Keystation 61es Driver
Bus 001 Device 002: ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

Sorry if this is useless or out of place. I'm reporting just in case (considering the PA message about a possible ALSA driver bug).

Thanks a lot in advance. Any recommendation would be most welcome.

Kind regards.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/201
Repository URL: https://github.com/alsa-project/alsa-lib
