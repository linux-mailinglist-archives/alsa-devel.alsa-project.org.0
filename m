Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A9937354B
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 09:02:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE76116A0;
	Wed,  5 May 2021 09:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE76116A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620198156;
	bh=P4WNXfqucp5A1o5OrjeO1zpYcXWdkGojmXm/r//pDgQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tJ7ezxvDpuLhtoyPNcCKJc9yiJr07rIQqdQbR6uRdyB4Z2GcvbtppylCO6Yb1H6Ny
	 akCEIzCgfc/52uMxmX0eunlmmctweYcOxTFx8K0hUvabF37RGXJqqtciMbjbTh297K
	 Ovu+o7bkMe/Q66iZ7WQz2G0GIO4WyMTqA9CegGh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F3E9F8025F;
	Wed,  5 May 2021 09:01:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37255F8025F; Wed,  5 May 2021 09:01:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 085FEF80108
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 09:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 085FEF80108
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1620198054870762110-webhooks-bot@alsa-project.org>
References: <1620198054870762110-webhooks-bot@alsa-project.org>
Subject: [a52] Strange behavior with 5.1 surround on ALC1220
Message-Id: <20210505070107.37255F8025F@alsa1.perex.cz>
Date: Wed,  5 May 2021 09:01:07 +0200 (CEST)
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

alsa-project/alsa-plugins issue #21 was edited from davidebeatrici:

I originally encountered the issue ~1 year ago, when I started using a motherboard with an ALC1120 on it.

The out-of-box experience was flawless: I simply connected the optical SPDIF cable to my amplifier/receiver and stereo sound immediately worked.

Once I switched to 5.1 surround, audio output became extremely fast; even videos were affected by it, to the point that they were being reproduced in seconds instead of minutes.

After a few days of research and experiments I managed to workaround the issue by replacing the content of `60-a52-encoder.conf` with:
```
pcm.a52 {
	@args [CARD]
	@args.CARD {
		type string
        }
	type rate
	slave {
		pcm {   
			type a52
			card $CARD
		}
		rate 48000
	}
}
pcm.pulse {
	type pulse
}
ctl.pulse {
	type pulse
}
pcm.!default {
	type pulse
}
ctl.!default {
	type pulse
}
```

Based on https://help.ubuntu.com/community/DigitalAC-3Pulseaudio#Configuring_asound.conf.

After that, I wanted to investigate the cause and report my findings to either ALSA or PulseAudio (depending on the results).

Unfortunately that never happened and I kinda forgot about it, as [libasound2-plugins](https://packages.debian.org/bullseye/libasound2-plugins) was updated a single time in the past year and thus I only had to replace the file's content once more.

Fast-forward to today: I switch from PulseAudio to PipeWire and while troubleshooting https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/1143 I decided to try to restore the original file.

Interestingly, the behavior is different compared to PulseAudio: audio, instead of being fast, is crackling. It's basically as if a frame every two is being skipped.

Unfortunately PipeWire reports no errors whatsoever.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/21
Repository URL: https://github.com/alsa-project/alsa-plugins
