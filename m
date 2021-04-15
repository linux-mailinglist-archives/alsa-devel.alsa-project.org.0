Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 915683609B6
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 14:46:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 267731673;
	Thu, 15 Apr 2021 14:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 267731673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618490784;
	bh=TZj4++rCjs4uhM5mljlXC7x6NnCMD0l5sNX6A3bUa9o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SfvY1hst7ewzoA4LzRBhCzh/s6Po/RMsPwmpH7xVOcfdXMV4ge9axarg4zSqQARaH
	 e/4U4XtknbP9tgKxftXj6kXjTl6kmFOmr395r+GsfbAmuWE76HEt+lSrCtJhrjIdjU
	 Gj60q6klVOmX/w63HQ6bRiJ7Mnso946upOPkdfII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80F55F8022D;
	Thu, 15 Apr 2021 14:44:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE869F8022B; Thu, 15 Apr 2021 14:44:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B06DBF800FF
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 14:44:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B06DBF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="KBMvfITJ"
Received: by mail-lf1-x12a.google.com with SMTP id 12so38845120lfq.13
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QTZuOLyTeSPqIxpmQtTpEHkmOSrRy44Y0KTmGLHsQTA=;
 b=KBMvfITJ6P1GJl3X+OkppIQD4G7uFHtheljIHTq0mOPMl/1ji4DLUkXc5yDJp0wy3/
 0w/SUUMyyxBFbPW/XYzjkinIvEXA/usUJSZuAKalmXOWKJD0c43ztneuZToJ+KVByU7t
 lr0TTWpnZbIwRpXA7U6/ELvRgiYAcbm+nezEqjjCwDyPPveS9APdAE67+CqWFA/F+cc1
 cLqPICHZlo4+GJXjzewKHWtwuTkCe1t9xCaVoBTMy4hiBFfYSmll7QW0mnBF3zg+FHEl
 UnoyygocULl7tMQvPwSvHqBrcFTXKY4/V9HoOgcfRRCN6CRc6T99OOsp5P6hQa6WQaJ3
 bFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QTZuOLyTeSPqIxpmQtTpEHkmOSrRy44Y0KTmGLHsQTA=;
 b=s9xZxuLpZUojJfakioNo4Dnqa42QpFnZJJA831L6sOqSndUC1Z7x2MB38gD153NiSr
 FI8uHiGrKWdcNMdAnBc/P3XRNk7oorrEvnmgs8yy+uNscX1MrQRkeYBJPp/TjZG/+4T5
 klnxvLZVDOBcUOzE7tTQd/yaUHfeCvZyZ1YsW7428oegtKIaJ6s6FrDznZbYCvsXXevg
 kzZsUFF253X64Gbarph7QpHYTWUZxnhFGM8p6JQRZx+wpMAUirZcKmMot88/FLOhk7kY
 Fs9e/1026f2dy/UNavK3znXLf8RAHbNjdnsToT92SoDtmDvjL0e4cPNhoLV392fqpt3j
 mASg==
X-Gm-Message-State: AOAM531JaP7AWNCoL4GRmppmmfENNtUUx8mkM4SIo90bgeB6lv/RuEL8
 lCNVYEzUPtyikeXAiz+3Egud6g==
X-Google-Smtp-Source: ABdhPJx/JsoSsokvTGNO9NBxDRpe6VnMzzOOJdkz0CEWSlLS/dpp0SisW5W3I7anbKMDuXCfS726lg==
X-Received: by 2002:a05:6512:c02:: with SMTP id
 z2mr2522381lfu.595.1618490680625; 
 Thu, 15 Apr 2021 05:44:40 -0700 (PDT)
Received: from localhost.localdomain (89-70-221-122.dynamic.chello.pl.
 [89.70.221.122])
 by smtp.gmail.com with ESMTPSA id j2sm667820lfm.210.2021.04.15.05.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:44:40 -0700 (PDT)
From: Lukasz Majczak <lma@semihalf.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Harsha Priya <harshapriya.n@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
Subject: [PATCH v1] ASoC: Intel: kbl_da7219_max98927: Fix kabylake_ssp_fixup
 function
Date: Thu, 15 Apr 2021 14:43:47 +0200
Message-Id: <20210415124347.475432-1-lma@semihalf.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

kabylake_ssp_fixup function uses snd_soc_dpcm to identify the
codecs DAIs. The HW parameters are changed based on the codec DAI of the
stream. The earlier approach to get snd_soc_dpcm was using container_of()
macro on snd_pcm_hw_params.

The structures have been modified over time and snd_soc_dpcm does not have
snd_pcm_hw_params as a reference but as a copy. This causes the current
driver to crash when used.

This patch changes the way snd_soc_dpcm is extracted. snd_soc_pcm_runtime
holds 2 dpcm instances (one for playback and one for capture). 2 codecs
on the SSP are dmic (capture) and speakers (playback). Based on the
stream direction, snd_soc_dpcm is extracted from snd_soc_pcm_runtime.

Tested for all use cases of the driver.
Based on similar fix in kbl_rt5663_rt5514_max98927.c
from Harsha Priya <harshapriya.n@intel.com> and
Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>

Cc: <stable@vger.kernel.org> # 5.4+
Signed-off-by: Lukasz Majczak <lma@semihalf.com>
---
Hi,
This is basically a cherry-pick of this change:
https://patchwork.kernel.org/project/alsa-devel/patch/1595432147-11166-1-git-send-email-harshapriya.n@intel.com/
just applied to the kbl_da7219_max98927.
Best regards,
Lukasz

 sound/soc/intel/boards/kbl_da7219_max98927.c | 38 +++++++++++++++-----
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index 9dfe5bd9180d..4b7b4a044f81 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -284,11 +284,33 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 	struct snd_interval *chan = hw_param_interval(params,
 			SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
-	struct snd_soc_dpcm *dpcm = container_of(
-			params, struct snd_soc_dpcm, hw_params);
-	struct snd_soc_dai_link *fe_dai_link = dpcm->fe->dai_link;
-	struct snd_soc_dai_link *be_dai_link = dpcm->be->dai_link;
+	struct snd_soc_dpcm *dpcm, *rtd_dpcm = NULL;
 
+	/*
+	 * The following loop will be called only for playback stream
+	 * In this platform, there is only one playback device on every SSP
+	 */
+	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_PLAYBACK, dpcm) {
+		rtd_dpcm = dpcm;
+		break;
+	}
+
+	/*
+	 * This following loop will be called only for capture stream
+	 * In this platform, there is only one capture device on every SSP
+	 */
+	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_CAPTURE, dpcm) {
+		rtd_dpcm = dpcm;
+		break;
+	}
+
+	if (!rtd_dpcm)
+		return -EINVAL;
+
+	/*
+	 * The above 2 loops are mutually exclusive based on the stream direction,
+	 * thus rtd_dpcm variable will never be overwritten
+	 */
 	/*
 	 * Topology for kblda7219m98373 & kblmax98373 supports only S24_LE,
 	 * where as kblda7219m98927 & kblmax98927 supports S16_LE by default.
@@ -311,9 +333,9 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 	/*
 	 * The ADSP will convert the FE rate to 48k, stereo, 24 bit
 	 */
-	if (!strcmp(fe_dai_link->name, "Kbl Audio Port") ||
-	    !strcmp(fe_dai_link->name, "Kbl Audio Headset Playback") ||
-	    !strcmp(fe_dai_link->name, "Kbl Audio Capture Port")) {
+	if (!strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio Port") ||
+	    !strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio Headset Playback") ||
+	    !strcmp(rtd_dpcm->fe->dai_link->name, "Kbl Audio Capture Port")) {
 		rate->min = rate->max = 48000;
 		chan->min = chan->max = 2;
 		snd_mask_none(fmt);
@@ -324,7 +346,7 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 	 * The speaker on the SSP0 supports S16_LE and not S24_LE.
 	 * thus changing the mask here
 	 */
-	if (!strcmp(be_dai_link->name, "SSP0-Codec"))
+	if (!strcmp(rtd_dpcm->be->dai_link->name, "SSP0-Codec"))
 		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
 
 	return 0;
-- 
2.25.1

