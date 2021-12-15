Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB30475107
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 03:40:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87A721FC4;
	Wed, 15 Dec 2021 03:39:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87A721FC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639536003;
	bh=KoGGgDXuhMCIMBH7OPTMIm4S3789a6/DspS153Yref4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MjRkxHDpOiEJthOWVVHc3hdFXnViFp60JDmORF/svC+3J2qvWheYNq/LcyLI9Hl3u
	 jv5oZ3QPRehc+KNo+SJxIU139vv3ZXGVQQYRnaVJyQFL6r0IY89otnZYMxBRL96hTI
	 F6sf1Un2fkE0fo4PVFk8CEFuX14fWWoQxIH2eUfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE936F8025F;
	Wed, 15 Dec 2021 03:38:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6789F8025D; Wed, 15 Dec 2021 03:38:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BF8BEF801DB
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 03:38:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF8BEF801DB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639535930120713949-webhooks-bot@alsa-project.org>
References: <1639535930120713949-webhooks-bot@alsa-project.org>
Subject: Cant't open mixer and no sound , helem (MIXER,
 'Front Mic Boots Valume', 0, 1, 0) appears twice or more
Message-Id: <20211215023854.B6789F8025D@alsa1.perex.cz>
Date: Wed, 15 Dec 2021 03:38:54 +0100 (CET)
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

alsa-project/alsa-lib issue #205 was opened from WolsYang:

**I had  try the way in this issue, but not work for me : (**

**helem (MIXER,'Master Playback Volume',0,1,0) appears twice or more cannot load mixer controls: Invalid argument**#47

**In default I only can play sound with Back port**

**Here is my computer audio port look like.**
|codec       | ALC888-VD | ALC888-VD |
|:-------------|:----------------:|:----------------:|
|position    |      Back       |     Front        |
|Function   | 0:Line Out, 1:MIC | 0:Line Out, 1:MIC|
|Port Num  |          2         |          2             |
|HW:dev|0:0|0:2|
|/sys/class/cound|hwC0D0|hwC0D1|

**OS:Ubuntu 20.04.2LTS**
**$ uname -r**
```
5.13.0-051300-generic
```

**$ amixer** 
```
ALSA lib simple_none.c:1544:(simple_add1) helem (MIXER,'Front Mic Boots Valume',0,1,0) appears twice or more
amixer: Mixer default load error: Invalid aggument
``` 
 
**$ aplay -l**
```
**** List of PLAYBACK Hardware Devices ****
card 0: PCH [HDA Intel PCH], device 0: ALC888-VD Analog [ALC888-VD Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: PCH [HDA Intel PCH], device 2: ALC888-VD Analog [ALC888-VD Analog]
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
```

**$ pactl list modules**
```
Card #0
	Name: alsa_card.pci-0000_00_1b.0
	Driver: module-alsa-card.c
	Owner Module: 7
	Properties:
		alsa.card = "0"
		alsa.card_name = "HDA Intel PCH"
		alsa.long_card_name = "HDA Intel PCH at 0x81410000 irq 132"
		alsa.driver_name = "snd_hda_intel"
		device.bus_path = "pci-0000:00:1b.0"
		sysfs.path = "/devices/pci0000:00/0000:00:1b.0/sound/card0"
		device.bus = "pci"
		device.vendor.id = "8086"
		device.vendor.name = "Intel Corporation"
		device.product.id = "2284"
		device.product.name = "Atom/Celeron/Pentium Processor x5-E8000/J3xxx/N3xxx Series High Definition Audio Controller"
		device.form_factor = "internal"
		device.string = "0"
		device.description = "Built-in Audio"
		module-udev-detect.discovered = "1"
		device.icon_name = "audio-card-pci"
	Profiles:
		input:analog-stereo: Analog Stereo Input (sinks: 0, sources: 1, priority: 65, available: yes)
		output:analog-stereo: Analog Stereo Output (sinks: 1, sources: 0, priority: 6500, available: yes)
		output:analog-stereo+input:analog-stereo: Analog Stereo Duplex (sinks: 1, sources: 1, priority: 6565, available: yes)
		output:analog-surround-40: Analog Surround 4.0 Output (sinks: 1, sources: 0, priority: 1200, available: yes)
		output:analog-surround-40+input:analog-stereo: Analog Surround 4.0 Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 1265, available: yes)
		output:hdmi-stereo: Digital Stereo (HDMI) Output (sinks: 1, sources: 0, priority: 5900, available: yes)
		output:hdmi-stereo+input:analog-stereo: Digital Stereo (HDMI) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 5965, available: yes)
		output:hdmi-surround: Digital Surround 5.1 (HDMI) Output (sinks: 1, sources: 0, priority: 800, available: yes)
		output:hdmi-surround+input:analog-stereo: Digital Surround 5.1 (HDMI) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 865, available: yes)
		output:hdmi-surround71: Digital Surround 7.1 (HDMI) Output (sinks: 1, sources: 0, priority: 800, available: yes)
		output:hdmi-surround71+input:analog-stereo: Digital Surround 7.1 (HDMI) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 865, available: yes)
		output:hdmi-stereo-extra1: Digital Stereo (HDMI 2) Output (sinks: 1, sources: 0, priority: 5700, available: yes)
		output:hdmi-stereo-extra1+input:analog-stereo: Digital Stereo (HDMI 2) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 5765, available: yes)
		output:hdmi-surround-extra1: Digital Surround 5.1 (HDMI 2) Output (sinks: 1, sources: 0, priority: 600, available: yes)
		output:hdmi-surround-extra1+input:analog-stereo: Digital Surround 5.1 (HDMI 2) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 665, available: yes)
		output:hdmi-surround71-extra1: Digital Surround 7.1 (HDMI 2) Output (sinks: 1, sources: 0, priority: 600, available: yes)
		output:hdmi-surround71-extra1+input:analog-stereo: Digital Surround 7.1 (HDMI 2) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 665, available: yes)
		output:hdmi-stereo-extra2: Digital Stereo (HDMI 3) Output (sinks: 1, sources: 0, priority: 5700, available: yes)
		output:hdmi-stereo-extra2+input:analog-stereo: Digital Stereo (HDMI 3) Output + Analog Stereo Input (sinks: 1, sources: 1, priority: 5765, available: yes)
		off: Off (sinks: 0, sources: 0, priority: 0, available: yes)
	Active Profile: output:analog-stereo
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/205
Repository URL: https://github.com/alsa-project/alsa-lib
