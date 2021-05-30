Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C0D394EB4
	for <lists+alsa-devel@lfdr.de>; Sun, 30 May 2021 02:46:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F44D16A8;
	Sun, 30 May 2021 02:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F44D16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622335609;
	bh=bwlBHlvWMv/Z0LpGk13wILpgIyjZstZQLPf0wOdOUiQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tlILGP5CqUvu5Vj1cN+CWZV0WeVQLkoiWdGlCTlOnU+tDaEvMX48+paGGurUmhl6r
	 q+4d7TElx1/uStul8cHeLxVzXHaBudc1yDXad5csZHY/guvu9PlBZ3hX0hsZ6LwyxW
	 Mcv1VMfZKZImh4BHb5Ysx+vbh+I/seVpqXQCKtEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B502F8025C;
	Sun, 30 May 2021 02:45:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E44BDF80169; Sun, 30 May 2021 02:45:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B2991F8010A
 for <alsa-devel@alsa-project.org>; Sun, 30 May 2021 02:45:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2991F8010A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1622335513618031979-webhooks-bot@alsa-project.org>
References: <1622335513618031979-webhooks-bot@alsa-project.org>
Subject: alsa-ucm-conf 1.2.4 fails with platform-skl_hda_dsp_generic
Message-Id: <20210530004518.E44BDF80169@alsa1.perex.cz>
Date: Sun, 30 May 2021 02:45:18 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #93 was opened from bjacquin:

Hi,

I am experiencing the same issue as reported in issue #66, however I am still able to reproduce this with alsa-lib and alsa-utils 1.2.4 installed.

* 1.2.3

`alsa-info` output is attached in [alsa-info.1.2.3.txt](https://github.com/alsa-project/alsa-ucm-conf/files/6565495/alsa-info.1.2.3.txt).
`pulseaudio` standard logs show:
```
May 30 01:33:34 lady-voodoo.local pulseaudio[23962]: E: [pulseaudio] alsa-ucm.c: Failed to get the verb HiFi
May 30 01:33:34 lady-voodoo.local pulseaudio[23962]: E: [pulseaudio] alsa-ucm.c: No UCM verb is valid for sof-hda-dsp
```
`pactl list short cards` list the following cards as available:
```
0	alsa_card.usb-046d_HD_Pro_Webcam_C920_BD731F4F-02	module-alsa-card.c
1	alsa_card.usb-Sennheiser_Sennheiser_SP_30_A002340202303344-00	module-alsa-card.c
2	alsa_card.pci-0000_00_1f.3-platform-skl_hda_dsp_genericmodule-alsa-card.c
```
`pulseaudio -vvv` output is attached in [pulseaudio-1.2.3.log](https://github.com/alsa-project/alsa-ucm-conf/files/6565500/pulseaudio-1.2.3.log).
`pacmd ls` output is attached in [pacmd-ls-1.2.3.txt](https://github.com/alsa-project/alsa-ucm-conf/files/6565501/pacmd-ls-1.2.3.txt)

* 1.2.4

`alsa-info` output is attached in [alsa-info.1.2.4.txt](https://github.com/alsa-project/alsa-ucm-conf/files/6565483/alsa-info.1.2.4.txt).
`pulseaudio` standard logs show:
```
May 30 01:14:40 lady-voodoo.local /bin/bash[672]: HISTORY: PID=672 UID=1000 pulseaudio -k
May 30 01:14:40 lady-voodoo.local systemd[481]: pulseaudio.service: Succeeded.
May 30 01:14:40 lady-voodoo.local systemd[481]: pulseaudio.service: Consumed 7.644s CPU time.
May 30 01:14:41 lady-voodoo.local pulseaudio[18219]: W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device HDMI3, assuming stereo duplex.
May 30 01:14:41 lady-voodoo.local pulseaudio[18219]: W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device HDMI2, assuming stereo duplex.
May 30 01:14:41 lady-voodoo.local pulseaudio[18219]: W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device HDMI1, assuming stereo duplex.
May 30 01:14:41 lady-voodoo.local pulseaudio[18219]: W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device Mic2, assuming stereo duplex.
May 30 01:14:41 lady-voodoo.local pulseaudio[18219]: W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device Mic1, assuming stereo duplex.
May 30 01:14:41 lady-voodoo.local pulseaudio[18219]: W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device Speaker, assuming stereo duplex.
May 30 01:14:41 lady-voodoo.local pulseaudio[18219]: W: [pulseaudio] alsa-ucm.c: UCM file does not specify 'PlaybackChannels' or 'CaptureChannels'for device Headphones, assuming stereo duplex.
May 30 01:14:41 lady-voodoo.local pulseaudio[18219]: E: [pulseaudio] module-alsa-card.c: Failed to find a working profile.
May 30 01:14:41 lady-voodoo.local pulseaudio[18219]: E: [pulseaudio] module.c: Failed to load module "module-alsa-card" (argument: "device_id="0" name="pci-0000_00_1f.3-platform-skl_hda_dsp_generic" card_name="alsa_card.pci-0000_00_1f.3-platform-skl_hda_dsp_generic" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1""): initialization failed.
```
`pactl list short cards` list the following cards as available:
```
0	alsa_card.usb-046d_HD_Pro_Webcam_C920_BD731F4F-02	module-alsa-card.c
1	alsa_card.usb-Sennheiser_Sennheiser_SP_30_A002340202303344-00	module-alsa-card.c
```
`pulseaudio -vvv` output is attached in [pulseaudio-1.2.4.log](https://github.com/alsa-project/alsa-ucm-conf/files/6565508/pulseaudio-1.2.4.log).
`pacmd ls` output is attached in [pacmd-ls-1.2.4.txt](https://github.com/alsa-project/alsa-ucm-conf/files/6565505/pacmd-ls-1.2.4.txt).

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/93
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
