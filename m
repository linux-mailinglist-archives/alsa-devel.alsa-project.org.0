Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 055712139E9
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 14:21:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69B8F16CA;
	Fri,  3 Jul 2020 14:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69B8F16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593778861;
	bh=0Binas3fxfYRk9aga/yJZijfvY3/87FkjjIsq9BlkYM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M5N4nvtjkGAnDJx4hyURLzuW703nMUZDP6qFoUtdHsqPUQWDK0tVQANByajZOiZSN
	 MaxlX7lFxptqAok2f+XeokfeS2gqIPF+mXfvfrrT0jAdUfYrUKUOrTz/7Gg1UXrOBY
	 I3tGJyYiKqcAmyQswPvBeFAKug5nGqVVWBQpHx9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 596F6F8020C;
	Fri,  3 Jul 2020 14:19:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CABB2F80217; Fri,  3 Jul 2020 14:19:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76327F800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 14:19:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76327F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="ECVVeUrr"
Received: by mail-lj1-x241.google.com with SMTP id b25so33114243ljp.6
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 05:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7O931kmm3paf7okPRfcKKYZ7fUbwC/bGh4mFYNw9eQ8=;
 b=ECVVeUrrWasxx/3Ykp6gkyHcWv2GUyDXt5iEYlGHpeSH5HbfcBxkaYeKGCcrJUyh4R
 kyMheSPII9/JJ8ZPGF498CvHID3yiVwFx55SjH4KzQ+Qq6bejphs+97AA1YU/6EjiV8E
 i3eNm8C4Emrm6PWFERTDGdtCyMR6g8xQQiQk9ffkVJjCQWHg3PmT9XA9rCQ561KJrx5f
 vWjQDFAQOsEmKZWAeaUyTHMohaQp9lf61Sqxy/r9cgBl09uOCL4zmGg08+x8FnY0itMK
 AzJEuWfWMmUm+3IiyafOvlclS4+lqr0B5zmJBuYRSxmv3/LjpTwpT+CHD4DBoXS2pRNL
 XT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7O931kmm3paf7okPRfcKKYZ7fUbwC/bGh4mFYNw9eQ8=;
 b=PwCXGL1d6Y8KO2EVoN7hRkMo7S/B5sA/6iIQ7eQ9AX8mrKZd7kLWJv2gSZUz6tLVfX
 FQNPGfszhJJg3SL2JGeRX47C9Lp9lsWvDF6+rTKTrbIEHRPHHGeFP1jdpob4F5Fyxh0d
 VRloAKju+TlVHTJA1xxluKFhDkUjfzJdFyvMGMX6Dlu8m5xvhUiUvBuJqy95sOT9svaw
 GamT85J68n0PVwlbikLgEWoVqZyR1FAw+vGsMGN1p1lADsCODjF+9Kbgh3HXrVGVF+JP
 AGFkRGv3gac2bwbtvcCVLazW81W12rtL58DMC5qQGmIwFE4y90bNn9FQltGZTw44cuww
 74uA==
X-Gm-Message-State: AOAM531yWfjnQ9Aq+kQMqcLnHhc+HzWkk2CuTmFfrWcoDg5EQPzZOszH
 +jM+bSxTI0CWE7t0XKiqqkHgTw==
X-Google-Smtp-Source: ABdhPJwSIHi03yCU9SVIOEt6wVTbis+8NLv6w1BKDSwYmE0UiIPJQLuDa9E+M4ZR9r+95gX78Sxq1w==
X-Received: by 2002:a2e:9050:: with SMTP id n16mr18850187ljg.376.1593778748176; 
 Fri, 03 Jul 2020 05:19:08 -0700 (PDT)
Received: from localhost.localdomain (89-70-221-122.dynamic.chello.pl.
 [89.70.221.122])
 by smtp.gmail.com with ESMTPSA id v20sm4589784lfe.46.2020.07.03.05.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 05:19:07 -0700 (PDT)
From: Lukasz Majczak <lma@semihalf.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Harsha Priya <harshapriya.n@intel.com>
Subject: [PATCH v4] ASoC: Intel: kbl_rt5663_rt5514_max98927: Fix
 kabylake_ssp_fixup function
Date: Fri,  3 Jul 2020 14:16:50 +0200
Message-Id: <20200703121650.547944-1-lma@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200521162518.1809995-1-lma@semihalf.com>
References: <20200521162518.1809995-1-lma@semihalf.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Radoslaw Biernacki <rad@semihalf.com>,
 Ross Zwisler <zwisler@google.com>, linux-kernel@vger.kernel.org,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Bob Brandt <brndt@google.com>,
 Marcin Wojtas <mw@semihalf.com>, Alex Levin <levinale@chromium.org>,
 Gopal Vamshi Krishna <vamshi.krishna.gopal@intel.com>
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

Fix kabylake_ssp_fixup function to distinguish codecs DAIs by names,
as current approach, leads to crash while trying to get snd_soc_dpcm with
container_of() macro in kabylake_ssp_fixup().
The crash call path looks as below:
soc_pcm_hw_params()
snd_soc_dai_hw_params(codec_dai, substream, &codec_params);
rtd->dai_link->be_hw_params_fixup(rtd, params)
kabylake_ssp_fixup()
In this case, codec_params is just a copy of an internal structure and is
not embedded into struct snd_soc_dpcm thus we cannot use
container_of() on it.

v1 -> v2:
- Extract dmic from SSP0 as every BE should have own fixup function.
v2 -> v3:
- Restore naming in the dapm route table to not confuse with other
drivers
- Fixed indentations
v3 -> v4:
- Updated code and commit description according to
solution proposed by Harsha

Signed-off-by: Lukasz Majczak <lma@semihalf.com>
Signed-off-by: Harsha Priya <harshapriya.n@intel.com>
---
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 28 ++++++++-----------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index b34cf6cf11395..df454de40739a 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -333,36 +333,32 @@ static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_interval *rate = hw_param_interval(params,
 			SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_interval *chan = hw_param_interval(params,
+	struct snd_interval *channels = hw_param_interval(params,
 			SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
-	struct snd_soc_dpcm *dpcm = container_of(
-			params, struct snd_soc_dpcm, hw_params);
-	struct snd_soc_dai_link *fe_dai_link = dpcm->fe->dai_link;
-	struct snd_soc_dai_link *be_dai_link = dpcm->be->dai_link;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	/*
 	 * The ADSP will convert the FE rate to 48k, stereo, 24 bit
 	 */
-	if (!strcmp(fe_dai_link->name, "Kbl Audio Port") ||
-	    !strcmp(fe_dai_link->name, "Kbl Audio Headset Playback") ||
-	    !strcmp(fe_dai_link->name, "Kbl Audio Capture Port")) {
+
+	if (!strcmp(codec_dai->name, KBL_REALTEK_DMIC_CODEC_DAI)) {
+		if (params_channels(params) == 2 ||
+			DMIC_CH(dmic_constraints) == 2)
+			channels->min = channels->max = 2;
+		else
+			channels->min = channels->max = 4;
+	} else {
 		rate->min = rate->max = 48000;
-		chan->min = chan->max = 2;
+		channels->min = channels->max = 2;
 		snd_mask_none(fmt);
 		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
-	} else if (!strcmp(fe_dai_link->name, "Kbl Audio DMIC cap")) {
-		if (params_channels(params) == 2 ||
-				DMIC_CH(dmic_constraints) == 2)
-			chan->min = chan->max = 2;
-		else
-			chan->min = chan->max = 4;
 	}
 	/*
 	 * The speaker on the SSP0 supports S16_LE and not S24_LE.
 	 * thus changing the mask here
 	 */
-	if (!strcmp(be_dai_link->name, "SSP0-Codec"))
+	if (!strcmp(codec_dai->name, KBL_MAXIM_CODEC_DAI))
 		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
 
 	return 0;
-- 
2.25.1

