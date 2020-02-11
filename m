Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3221589DC
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 06:59:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 505FF1697;
	Tue, 11 Feb 2020 06:58:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 505FF1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581400758;
	bh=/MAZO9tpPY2ob7L/C/mYC+PI12V/nyhlixQRAW4kIOo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d/b/LqH2cSIblqRy9xt/KHqsdLA+AQ267Swn+XQRe5CaFt6hSje1Rl044cpvGGeRx
	 gz5By75HMoEAISI7Kq7WyLY0T+tw6oPjbGlmRQUjPgXY2iqeeRHPHsGjCHBef628Wu
	 vPec/B0NT5FdqGamHVyqoam65f5drWN0rpC1wJq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D53F800E7;
	Tue, 11 Feb 2020 06:57:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 328D4F80146; Tue, 11 Feb 2020 06:57:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23E00F800E7
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 06:57:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E00F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uGIPMgze"
Received: by mail-pf1-x441.google.com with SMTP id 84so4930874pfy.6
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 21:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RtcACHY1GteKSUYIoiEzAwSY/JFxUKopsQ/nQ/UelxI=;
 b=uGIPMgze54HdLetRttejcgVMdUMlVlZkhEspiWqqqdkOH3lzSVGcJCK3qlMJp4oEoO
 +AQibt5qwbOn4CDt02cT4IXmHlE5WOz2XRHjXT/EyeOcfZuPiPlvmR+lw6FixpphVsmq
 yuXuVtzmNrDo8qXM/xuVARxvnjcJcQNYS77qsMazdQG3e10aiXkJ6ZHgKyxQbTVrRb0n
 ZDzXRMxWhE+WmLA2DjSVqB2DVkkOCzX2frTVlAHsYRVY3rKNCJTU9cMpOfuyW/4EnD9V
 OKpguDR32powtQmqXuS6zW4EEfT1FRxc14JeR3LcCkLZKu3AsSWGUrKOBxmHOwi38KcJ
 zm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RtcACHY1GteKSUYIoiEzAwSY/JFxUKopsQ/nQ/UelxI=;
 b=uIi4ixYE2UpW6nH5KqujXQLqj6a9Dvdm07uf23L4AeiquKZT+8tjr+px51SmcOC9xd
 U+nsA5NhngfID+pTetJvfEOh8KaDnI5MZbBrYFgHo6AUinLN+JI42a8RjpoxbVJz/CnS
 AjQXAvDnmyoNdlr8UoWeJAKEa602ZbcTVY3jtixzn+P6SdygDdfpZmJaKSKq0a0ONCBJ
 YGWD20whU5G2i8TkGuj+zrriE32vTteqvF+3NNiZH72F864HzhDPYbryfi3ul3LhW8Fv
 u4iTNdlbKAMF/E8QCLDZ4koxLW3fWCL6vz41/RJ48rRWrlCMiRxjdhi4bAAwPvT7oWIM
 GcTQ==
X-Gm-Message-State: APjAAAWjAb+U8p5qr7K12EDFYpx4064DKFpB7h//znZ1dB7pIfG8I5Xj
 +R+BFPnqGe4e8sBDxhGlMPw=
X-Google-Smtp-Source: APXvYqy7gDZtDUPcbSurzNtWPfxbcVBQ4CDX+IzdlO8ruSHzRLLXhc2oxOV/u5IcG5LFaVannNLK7A==
X-Received: by 2002:a63:6607:: with SMTP id a7mr5450503pgc.310.1581400669771; 
 Mon, 10 Feb 2020 21:57:49 -0800 (PST)
Received: from f3.synalogic.ca (ag119225.dynamic.ppp.asahi-net.or.jp.
 [157.107.119.225])
 by smtp.gmail.com with ESMTPSA id x6sm2355617pfi.83.2020.02.10.21.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 21:57:49 -0800 (PST)
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>
Date: Tue, 11 Feb 2020 14:56:51 +0900
Message-Id: <20200211055651.4405-2-benjamin.poirier@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200211055651.4405-1-benjamin.poirier@gmail.com>
References: <20200211055651.4405-1-benjamin.poirier@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 2/2] ALSA: hda/realtek - Fix Lenovo Thinkpad X1
	Carbon 7th quirk value
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

As a result of commit d2cd795c4ece ("ALSA: hda - fixup for the bass speaker
on Lenovo Carbon X1 7th gen"), the maximum sound output level on my
machine, an X1 Carbon, was reduced to ~60% of its previous level.

This laptop model has two sets of stereo speakers: Front and Bass (aka Rear
in some contexts).
Before commit d2cd795c4ece, volume control was commonly ineffective (using
the Master slider in alsa or pulseaudio apparently had little effect or
alternated between mute or max with nothing in between - more details
below)
commit d2cd795c4ece added quirk ALC285_FIXUP_SPEAKER2_TO_DAC1 which
resulted in assigning both sets of speakers to the same DAC, bringing
the two sets of speakers under one effective volume control but also
lowering the max output volume noticeably.

Fix this by changing the quirk so that each set of speakers can be
controlled individually and the max output volume is restored to what it
was before commit d2cd795c4ece.

Since there is no documentation about the audio codec, here is some
detailed information about the result of applying different quirks.
DAC connection (which is what's affected by the quirk) is reported as found
in /proc/asound/card0/codec#0, Node 0x17.
pavucontrol controls are reported with the device configured with the
"Analog Surround 4.0 Output" profile.

no quirk
	Loud max output volume
	DAC connection
	  Connection: 3
	     0x02 0x03 0x06*
	Controls in alsamixer
		Master controls front speakers only.
		Speaker controls front speakers only.
		Bass Speaker is a toggle that mutes everything.
		PCM controls all speakers.
		There is no "Front" mixer.
	Controls in pavucontrol
		"Front Left"/"Front Right" sliders work as expected.
		"Rear Left"/"Rear Right" sliders seem to operate in a
		non-linear fashion such that most values above 0% result in
		max volume output.
		-> Because the bass speakers (Rear) are more powerful, the
		net effect is that when the channels are linked into a
		single slider, it seems like it has just two modes: mute or
		max.
ALC285_FIXUP_SPEAKER2_TO_DAC1
	Weak (~60%) max output volume
	DAC connection
	  Connection: 3
	     0x02* 0x03 0x06
	  In-driver Connection: 1
	     0x02
	Controls in alsamixer
		Master controls all four speakers.
		Speaker controls all four speakers.
		Bass Speaker is a toggle that mutes everything.
		PCM controls all four speakers.
		There is no "Front" mixer.
	Controls in pavucontrol
		"Front Left"/"Front Right" sliders have no effect.
		"Rear Left"/"Rear Right" sliders control both front and
		bass speakers.
		-> Volume control is effective but it's not possible to
		control front and bass speakers individually.
ALC295_FIXUP_DISABLE_DAC3
	Loud max output volume
	DAC connection
	  Connection: 3
	     0x02 0x03* 0x06
	  In-driver Connection: 2
	     0x02 0x03
	Controls in alsamixer
		Master controls all speakers.
		Speaker is a toggle that mutes everything.
		Bass Speaker controls bass speakers only.
		PCM controls all speakers.
		Front controls front speakers only.
	Controls in pavucontrol
		"Front Left"/"Front Right" sliders control front speakers
		only.
		"Rear Left"/"Rear Right" sliders control bass speakers
		only.
		-> Volume control is effective and it's possible to control
		each of the four speakers individually.

In summary, Node 0x17 DAC connection 0x3 offers the loudest max volume and
the most detailed mixer controls. That connection is obtained with quirk
ALC295_FIXUP_DISABLE_DAC3. Therefore, change the ThinkPad X1 Carbon 7th to
use ALC295_FIXUP_DISABLE_DAC3.

Fixes: d2cd795c4ece ("ALSA: hda - fixup for the bass speaker on Lenovo Carbon X1 7th gen")
Link: https://lore.kernel.org/alsa-devel/20200210025249.GA2700@f3/
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Kailang Yang <kailang@realtek.com>
Signed-off-by: Benjamin Poirier <benjamin.poirier@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 05d44df2008e..3171da10123e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7268,7 +7268,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x224c, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
 	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_SPEAKER2_TO_DAC1),
+	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC295_FIXUP_DISABLE_DAC3),
 	SND_PCI_QUIRK(0x17aa, 0x30bb, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
 	SND_PCI_QUIRK(0x17aa, 0x30e2, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
 	SND_PCI_QUIRK(0x17aa, 0x310c, "ThinkCentre Station", ALC294_FIXUP_LENOVO_MIC_LOCATION),
-- 
2.25.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
