Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1511873570B
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 14:42:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48E6983B;
	Mon, 19 Jun 2023 14:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48E6983B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687178543;
	bh=4XKIywEw2z0D0M6azL6wAZG0VOblflb/uBtI0U1GLCA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=veSMLYaV+jDvO8w8j6PvArNQpNHqTnnC8thTfHsf33ryy25YmmStDBr1JvAtbOAgP
	 YEgOB86tXRARoAoHr8BAnS4SQMQPXCN2JUvawqn6Gu1kpjqS+46bNR9OWhBB9UdGbZ
	 vbANWNcD6j1bA22ocxDUC3ZjV+ZdTphEZhFcnajE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FD74F80301; Mon, 19 Jun 2023 14:41:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1A7FF80132;
	Mon, 19 Jun 2023 14:41:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E573F80217; Mon, 19 Jun 2023 14:41:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D244F80130
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 14:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D244F80130
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1687178454984940767-webhooks-bot@alsa-project.org>
References: <1687178454984940767-webhooks-bot@alsa-project.org>
Subject: v1.2.7: Regression detecting builtin microphone on Lenovo T14G1
 (Intel Comet Lake)
Message-Id: <20230619124102.3E573F80217@alsa1.perex.cz>
Date: Mon, 19 Jun 2023 14:41:02 +0200 (CEST)
Message-ID-Hash: N2IGBIUAAMYUZ3OU6XYFJMBQVTCHAW5H
X-Message-ID-Hash: N2IGBIUAAMYUZ3OU6XYFJMBQVTCHAW5H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N2IGBIUAAMYUZ3OU6XYFJMBQVTCHAW5H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #325 was opened from myrkr:

I'm currently testing an update of alsa-ucm-conf from version v1.2.5.1 to version v1.2.9 and noticed a regression.

Kernel: v6.1.34
alsa-lib: v1.2.6.1
pulseaudio: 14.2

I use a Lenovo T14G1 with an HDMI monitor connected via USB-C (but the monitor is not in use by Xorg). I want to use the built-in speaker and microphone of the device. 

Before the update I got the following output from "pactl list":
[pactl-before.log](https://github.com/alsa-project/alsa-ucm-conf/files/11788116/pactl-before.log)

```
Card #0
	Name: alsa_card.pci-0000_00_1f.3-platform-skl_hda_dsp_generic
	Driver: module-alsa-card.c
	Owner Module: 1
	Properties:
		alsa.card = "0"
		alsa.card_name = "sof-hda-dsp"
		alsa.long_card_name = "LENOVO-20S1S19N00-ThinkPadT14Gen1"
		device.bus_path = "pci-0000:00:1f.3-platform-skl_hda_dsp_generic"
		sysfs.path = "/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0"
		device.bus = "pci"
		device.vendor.id = "8086"
		device.vendor.name = "Intel Corporation"
		device.product.id = "02c8"
		device.product.name = "Comet Lake PCH-LP cAVS"
		device.string = "0"
		device.description = "Comet Lake PCH-LP cAVS"
		module-udev-detect.discovered = "1"
		device.icon_name = "audio-card-pci"
	Profiles:
		HiFi: Play HiFi quality Music (sinks: 4, sources: 2, priority: 8000, available: yes)
		off: Off (sinks: 0, sources: 0, priority: 0, available: yes)
	Active Profile: HiFi
	Ports:
		[Out] HDMI3: HDMI / DisplayPort 3 Output (type: HDMI, priority: 700, latency offset: 0 usec, not available)
			Part of profile(s): HiFi
		[Out] HDMI2: HDMI / DisplayPort 2 Output (type: HDMI, priority: 600, latency offset: 0 usec, not available)
			Part of profile(s): HiFi
		[Out] HDMI1: HDMI / DisplayPort 1 Output (type: HDMI, priority: 500, latency offset: 0 usec, not available)
			Part of profile(s): HiFi
		[Out] Speaker: Speaker (type: Speaker, priority: 100, latency offset: 0 usec, availability unknown)
			Part of profile(s): HiFi
		[Out] Headphones: Headphones (type: Headphones, priority: 200, latency offset: 0 usec, not available)
			Part of profile(s): HiFi
		[In] Mic2: Headphones Stereo Microphone (type: Mic, priority: 200, latency offset: 0 usec, not available)
			Part of profile(s): HiFi
		[In] Mic1: Digital Microphone (type: Mic, priority: 100, latency offset: 0 usec, availability unknown)
			Part of profile(s): HiFi
```

On this cards the ports `Speaker` and `Mic1` are currently selected and usable.

After the update to version v1.2.9 the output shows:

[pactl-after.log](https://github.com/alsa-project/alsa-ucm-conf/files/11788117/pactl-after.log)

```
Card #0
	Name: alsa_card.pci-0000_00_1f.3-platform-skl_hda_dsp_generic
	Driver: module-alsa-card.c
	Owner Module: 1
	Properties:
		alsa.card = "0"
		alsa.card_name = "sof-hda-dsp"
		alsa.long_card_name = "LENOVO-20S1S19N00-ThinkPadT14Gen1"
		device.bus_path = "pci-0000:00:1f.3-platform-skl_hda_dsp_generic"
		sysfs.path = "/devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0"
		device.bus = "pci"
		device.vendor.id = "8086"
		device.vendor.name = "Intel Corporation"
		device.product.id = "02c8"
		device.product.name = "Comet Lake PCH-LP cAVS"
		device.string = "0"
		device.description = "Comet Lake PCH-LP cAVS"
		module-udev-detect.discovered = "1"
		device.icon_name = "audio-card-pci"
	Profiles:
		input:stereo-fallback: Stereo Input (sinks: 0, sources: 1, priority: 51, available: no)
		input:multichannel-input: Multichannel Input (sinks: 0, sources: 1, priority: 1, available: yes)
		output:stereo-fallback: Stereo Output (sinks: 1, sources: 0, priority: 5100, available: yes)
		output:stereo-fallback+input:stereo-fallback: Stereo Output + Stereo Input (sinks: 1, sources: 1, priority: 5151, available: no)
		output:stereo-fallback+input:multichannel-input: Stereo Output + Multichannel Input (sinks: 1, sources: 1, priority: 5101, available: yes)
		output:multichannel-output: Multichannel Output (sinks: 1, sources: 0, priority: 100, available: yes)
		output:multichannel-output+input:stereo-fallback: Multichannel Output + Stereo Input (sinks: 1, sources: 1, priority: 151, available: no)
		output:multichannel-output+input:multichannel-input: Multichannel Duplex (sinks: 1, sources: 1, priority: 101, available: yes)
		off: Off (sinks: 0, sources: 0, priority: 0, available: yes)
	Active Profile: output:stereo-fallback+input:multichannel-input
	Ports:
		analog-input-mic: Microphone (type: Mic, priority: 8700, latency offset: 0 usec, not available)
			Part of profile(s): input:stereo-fallback, output:stereo-fallback+input:stereo-fallback, output:multichannel-output+input:stereo-fallback
		analog-output-speaker: Speakers (type: Speaker, priority: 10000, latency offset: 0 usec, availability unknown)
			Properties:
				device.icon_name = "audio-speakers"
			Part of profile(s): output:stereo-fallback, output:stereo-fallback+input:stereo-fallback, output:stereo-fallback+input:multichannel-input
		analog-output-headphones: Headphones (type: Headphones, priority: 9900, latency offset: 0 usec, not available)
			Properties:
				device.icon_name = "audio-headphones"
			Part of profile(s): output:stereo-fallback, output:stereo-fallback+input:stereo-fallback, output:stereo-fallback+input:multichannel-input
```

The `Speakers` are selected for output but there is no port I can select for input.

I did a `git bisect` and found out that reverting the following commit from v1.2.7 solves the problem:

```
commit e2cfda5b53f4718f1128fb4df75ec8fb7274d36b
Author: Jaroslav Kysela <perex@perex.cz>
Date:   Mon May 23 13:33:24 2022 +0200

    HDMI - use new Macro syntax
    
    Signed-off-by: Jaroslav Kysela <perex@perex.cz>
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/325
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
