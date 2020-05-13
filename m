Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABA21D2914
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 09:52:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6298166A;
	Thu, 14 May 2020 09:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6298166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589442753;
	bh=oWkUzHcNQoCoHmwDTd4fBtldr842hT+e9By26IO9BWE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RwSIARAwzEyAyvli72T/G9c4u1rYnNIKALc/LhAmZkVbV9zE2R8LBLTLwD7lr9DHB
	 0MGCDAOiBeuVJWNqqC8XMLqD0OWPZIZLdz1/dUpekuZ5mlbWyYcnxvz1qPAIzRFDUT
	 o+RNjy0zCQYsL6F5rpNtDhUn5nQzKEGcwcBlAAvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E29A6F800BD;
	Thu, 14 May 2020 09:50:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72D18F80247; Wed, 13 May 2020 21:20:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21E0EF800BD
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 21:20:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21E0EF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="sgR1zSAR"
Received: by mail-lj1-x242.google.com with SMTP id u6so841005ljl.6
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 12:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xJ0/kVLgd2XGmGl/2Yf51DVqklc7Fd5xTLD8Gz5eOGs=;
 b=sgR1zSARIfNb5fmO42UIoCiOlBOwG/mW+CjWTciqdhRmacNax0zJx/8WqkW3M4LtvL
 iioqJ6NsaRunXfeiPr9NG/jArKqHdg2jNzHvOdJnqI813AK8ktGknxDkeDjYtqMTzrgt
 X6jAUwDbQURSF0gCNRt8YlUykbf+MxlnauLPHqUNMjWvBCckfwH5ISARtErxudxCwQRX
 St1fXVglOdzssSF2uGH8Od6/8Yx3aOJltIPPheBeqCGNhxaas/QirBJomNKVosyHPjnT
 zAgS2gRk3/Vo9xToor1UCNa9aXQ0V7msn3kiMNgSeUpZOUxNngUAX42VW9SJzjF3WhY0
 PYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xJ0/kVLgd2XGmGl/2Yf51DVqklc7Fd5xTLD8Gz5eOGs=;
 b=LH12p5wsghwpYlnXJEdzUD+o4KIcIvc+9WxM7c+6BL332RnH7god6EAQc1SykbEl1t
 UE4w570tSMop4Pbr3g+B+FkvTiNGcIvhDaeBd397jMLP/0Hy04gvUf2cfGo/FaAfhTWm
 hcFK6LUPqGbO+2k070Wyq9IH8mnqg0TtNxaNLHZ1VKcFFYj2EvkOw0IP8r3bd+ja6Ig2
 JL5s43+8wYDlIl+kAVwU323B5UiKnbcuOUlSTHC5bAlee7bGpbh6r39q/1x4Gvg8h3Ks
 m73EHAo63S0pGY7a8hO8TNqadushVRjb1N8MFMmRHbc5KQnhnu4TT/8zv3M4aiqjpHjO
 Tcpw==
X-Gm-Message-State: AOAM533jc2MMS6kJcr0qMHcRLLIRfzsUep5e0Fv/Bi3YXeosmmaBpu1s
 PCOCKD7BK3iTk63JScwl5OLfgA==
X-Google-Smtp-Source: ABdhPJwW/lpo7amvDkWje0tqgAbIdqAjf3MAmxRXMtrXK4vDjdOhT9zw+Cb1MxqnGbgyJxozl1DWrg==
X-Received: by 2002:a05:651c:490:: with SMTP id
 s16mr374721ljc.152.1589397626676; 
 Wed, 13 May 2020 12:20:26 -0700 (PDT)
Received: from deadpool.semihalf.local (89-70-221-122.dynamic.chello.pl.
 [89.70.221.122])
 by smtp.gmail.com with ESMTPSA id w24sm288397lfk.47.2020.05.13.12.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 12:20:26 -0700 (PDT)
From: Lukasz Majczak <lma@semihalf.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>
Subject: [PATCH] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
Date: Wed, 13 May 2020 21:20:20 +0200
Message-Id: <20200513192020.544928-1-lma@semihalf.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 14 May 2020 09:50:50 +0200
Cc: alsa-devel@alsa-project.org, Radoslaw Biernacki <rad@semihalf.com>,
 Ross Zwisler <zwisler@google.com>, linux-kernel@vger.kernel.org,
 Bob Brandt <brndt@google.com>, Marcin Wojtas <mw@semihalf.com>,
 Alex Levin <levinale@chromium.org>, Lukasz Majczak <lma@semihalf.com>
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

Split be_hw_params_fixup function for different codecs as current common
function, leads to crash while trying to get snd_soc_dpcm with
container_of() macro in kabylake_ssp_fixup().
The crash call path looks as below:
soc_pcm_hw_params()
snd_soc_dai_hw_params(codec_dai, substream, &codec_params);
rtd->dai_link->be_hw_params_fixup(rtd, params)
kabylake_ssp_fixup()
In this case, codec_params is just a copy of an internal structure and is
not embedded into struct snd_soc_dpcm thus we cannot use
container_of() on it.

Signed-off-by: Lukasz Majczak <lma@semihalf.com>
---
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 68 +++++++++++--------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 1b1f8d7a4ea3..2e0ae724122c 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -328,46 +328,55 @@ static const struct snd_soc_ops kabylake_rt5663_fe_ops = {
 	.startup = kbl_fe_startup,
 };
 
-static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
-					struct snd_pcm_hw_params *params)
+static void kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
+	struct snd_pcm_hw_params *params, snd_pcm_format_t pcm_fmt)
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
 
 	/*
 	 * The ADSP will convert the FE rate to 48k, stereo, 24 bit
 	 */
-	if (!strcmp(fe_dai_link->name, "Kbl Audio Port") ||
-	    !strcmp(fe_dai_link->name, "Kbl Audio Headset Playback") ||
-	    !strcmp(fe_dai_link->name, "Kbl Audio Capture Port")) {
-		rate->min = rate->max = 48000;
-		chan->min = chan->max = 2;
-		snd_mask_none(fmt);
-		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
-	} else if (!strcmp(fe_dai_link->name, "Kbl Audio DMIC cap")) {
-		if (params_channels(params) == 2 ||
-				DMIC_CH(dmic_constraints) == 2)
-			chan->min = chan->max = 2;
-		else
-			chan->min = chan->max = 4;
-	}
-	/*
-	 * The speaker on the SSP0 supports S16_LE and not S24_LE.
-	 * thus changing the mask here
-	 */
-	if (!strcmp(be_dai_link->name, "SSP0-Codec"))
-		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
 
+	rate->min = rate->max = 48000;
+	channels->min = channels->max = 2;
+
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, pcm_fmt);
+}
+
+static int kabylake_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
+	struct snd_pcm_hw_params *params)
+{
+	kabylake_ssp_fixup(rtd, params, SNDRV_PCM_FORMAT_S16_LE);
 	return 0;
 }
 
+static int kabylake_ssp1_fixup(struct snd_soc_pcm_runtime *rtd,
+	struct snd_pcm_hw_params *params)
+{
+
+	kabylake_ssp_fixup(rtd, params, SNDRV_PCM_FORMAT_S24_LE);
+	return 0;
+}
+
+static int kabylake_dmic_cap_fixup(struct snd_soc_pcm_runtime *rtd,
+	struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *channels = hw_param_interval(params,
+			SNDRV_PCM_HW_PARAM_CHANNELS);
+
+	if (params_channels(params) == 2 ||
+			DMIC_CH(dmic_constraints) == 2)
+		channels->min = channels->max = 2;
+	else
+		channels->min = channels->max = 4;
+
+	return 0;
+}
 static int kabylake_rt5663_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
@@ -582,6 +591,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.dpcm_capture = 1,
 		.nonatomic = 1,
 		.dynamic = 1,
+		.be_hw_params_fixup = kabylake_dmic_cap_fixup,
 		.ops = &kabylake_dmic_ops,
 		SND_SOC_DAILINK_REG(dmic, dummy, platform),
 	},
@@ -618,7 +628,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
 		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = kabylake_ssp_fixup,
+		.be_hw_params_fixup = kabylake_ssp0_fixup,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ops = &kabylake_ssp0_ops,
@@ -632,7 +642,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
 		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = kabylake_ssp_fixup,
+		.be_hw_params_fixup = kabylake_ssp1_fixup,
 		.ops = &kabylake_rt5663_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
-- 
2.25.1

