Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 882BF2E25EA
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Dec 2020 11:21:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2200C1801;
	Thu, 24 Dec 2020 11:20:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2200C1801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608805274;
	bh=8B935isYO6O2+Y+yPgm9Xuethj9ImaQJt5yZMks6ywM=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FGmZ/4nGVqUcjEiOa9rSZAuRihDzZdeMe6LojMbCuWNlduuHd+y4XUImb0QkFNsJ8
	 TTSZ7T7gYmufXL1mkN0wcQeHIv5mn+b55w9Cc2cwFXqwvDaSJbBYnUvxDOvjDLO8Kk
	 JAVCK5LXSxCC9nR0scLkpwEzVQMmnsR1HwJfzj1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82CA2F80232;
	Thu, 24 Dec 2020 11:19:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6938F80224; Thu, 24 Dec 2020 11:19:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F17EF800AB
 for <alsa-devel@alsa-project.org>; Thu, 24 Dec 2020 11:19:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F17EF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="L9Abo8Dz"
Received: by mail-qt1-x849.google.com with SMTP id f7so1010457qtj.7
 for <alsa-devel@alsa-project.org>; Thu, 24 Dec 2020 02:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=H5W3vK4Nl5LbPT4WOHTUkbKsfYAlfjD3n4xde2tMLms=;
 b=L9Abo8DzLScZtNCCGMWOu0GZoIYJDLCsJtAkILLCHEXiSUfm8hESOAJ9+CZj8jfwlY
 +M7dKzqyulLuj0rtwj+xCS1JeVICaVx35h9Wb6anvdOxkQWIR3fzjUeas4EI+zEsqKuY
 lS2OkRMMbiUKpAXgwtO0w8Y930IRvUL2w+bPV3p8f5FjAEBZ/np7YWgyRU3XWrLKobu5
 Z3wJZHaxMkVwbIRJcP8bsIIejUfxZ34RaCPR43Jzk5OsORxXJHd96WqiNdkGsXu+00Tv
 axSLNzCkziD6OMIa0aw2kGAVkE1iLX5VVDr70DA14vhgDPAXLfynzBsx7q383XERa076
 qdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=H5W3vK4Nl5LbPT4WOHTUkbKsfYAlfjD3n4xde2tMLms=;
 b=TI7JFUJYHa7T29yyK5/nm2Nx2zJm/n/er3mATdp22IXXVxm1mWE95irxvHrsRVRySc
 rgaNnJAOhFTOXVpgfgXHRVNR4g093gyYU3GjFCThCavLTHIOfSB8LrOk8yzxNmQgKRcb
 RtD6K0DcrmqM7ilP/tLJ1Sg/zN8qS5fk58emMGj6V53Fpw3LUwKDKSqWm5IfZRcbSSVG
 0mQYthqNnqQPt+PuMx4t96CDyRgI8aWIIM7idPM9aQ/xjxJELi0n7AVy55vBhoy2OsVJ
 NczoOhAmKDo1VuBvEJ3vfv4RrR+TcEV7Q57E9FnxISrbnqinaOvvr8coRUsO6XEq4W9V
 hOIw==
X-Gm-Message-State: AOAM53395A9I4oSwD2vum7Gl4uh7xtiUo8uCJ56KopMp76K616Th9Ccv
 6Ih2XsxgNllgTuleL0Z4I2Lo43HoKB1f
X-Google-Smtp-Source: ABdhPJwBLiDaP5j587CbwQSfXkTI8HfNDLCF1JCF2zS7cpUCyAJV0LPqunlBGZnS2gHKF70lPcNOw+/zNjRo
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:e74a:: with SMTP id
 g10mr6239952qvn.3.1608805167207; Thu, 24 Dec 2020 02:19:27 -0800 (PST)
Date: Thu, 24 Dec 2020 18:18:54 +0800
Message-Id: <20201224101854.3024823-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [RFC PATCH] ASoC: rt1015: remove bclk_ratio
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, akshu.agrawal@amd.com,
 tzungbi@google.com, Vishnuvardhanrao.Ravulapati@amd.com
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

bclk_ratio is unused.  Removes bclk_ratio and .set_bclk_ratio callback.

Removes snd_soc_dai_set_bclk_ratio() in a few machine drivers which are
obviously using rt1015.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
The patch applies after the series:
https://mailman.alsa-project.org/pipermail/alsa-devel/2020-December/178608.html
and
https://mailman.alsa-project.org/pipermail/alsa-devel/2020-December/178614.html

 sound/soc/amd/acp3x-rt5682-max9836.c          |  4 +--
 sound/soc/codecs/rt1015.c                     | 28 -------------------
 sound/soc/codecs/rt1015.h                     |  1 -
 sound/soc/intel/boards/sof_rt5682.c           |  7 -----
 .../mediatek/mt8183/mt8183-da7219-max98357.c  |  6 ----
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |  6 ----
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |  6 ----
 7 files changed, 1 insertion(+), 57 deletions(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 1a4e8ca0f99c..cea320ad0e1c 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -140,9 +140,7 @@ static int acp3x_1015_hw_params(struct snd_pcm_substream *substream,
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		if (strcmp(codec_dai->name, "rt1015-aif"))
 			continue;
-		ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
-		if (ret < 0)
-			return ret;
+
 		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
 						64 * srate, 256 * srate);
 		if (ret < 0)
diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 2dcb7b0fba60..dcb1261bbffa 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -884,14 +884,6 @@ static int rt1015_set_component_pll(struct snd_soc_component *component,
 		freq_out == rt1015->pll_out)
 		return 0;
 
-	if (source == RT1015_PLL_S_BCLK) {
-		if (rt1015->bclk_ratio == 0) {
-			dev_err(component->dev,
-				"Can not support bclk ratio as 0.\n");
-			return -EINVAL;
-		}
-	}
-
 	switch (source) {
 	case RT1015_PLL_S_MCLK:
 		snd_soc_component_update_bits(component, RT1015_CLK2,
@@ -931,23 +923,6 @@ static int rt1015_set_component_pll(struct snd_soc_component *component,
 	return 0;
 }
 
-static int rt1015_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
-{
-	struct snd_soc_component *component = dai->component;
-	struct rt1015_priv *rt1015 = snd_soc_component_get_drvdata(component);
-
-	dev_dbg(component->dev, "%s ratio=%d\n", __func__, ratio);
-
-	rt1015->bclk_ratio = ratio;
-
-	if (ratio == 50) {
-		dev_dbg(component->dev, "Unsupport bclk ratio\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int rt1015_set_tdm_slot(struct snd_soc_dai *dai,
 	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width)
 {
@@ -1054,8 +1029,6 @@ static int rt1015_probe(struct snd_soc_component *component)
 		snd_soc_component_get_drvdata(component);
 
 	rt1015->component = component;
-	rt1015->bclk_ratio = 0;
-
 	INIT_DELAYED_WORK(&rt1015->flush_work, rt1015_flush_work);
 
 	return 0;
@@ -1076,7 +1049,6 @@ static void rt1015_remove(struct snd_soc_component *component)
 static struct snd_soc_dai_ops rt1015_aif_dai_ops = {
 	.hw_params = rt1015_hw_params,
 	.set_fmt = rt1015_set_dai_fmt,
-	.set_bclk_ratio = rt1015_set_bclk_ratio,
 	.set_tdm_slot = rt1015_set_tdm_slot,
 };
 
diff --git a/sound/soc/codecs/rt1015.h b/sound/soc/codecs/rt1015.h
index e9b498a754e0..2aeaf65ba793 100644
--- a/sound/soc/codecs/rt1015.h
+++ b/sound/soc/codecs/rt1015.h
@@ -427,7 +427,6 @@ struct rt1015_priv {
 	struct regmap *regmap;
 	int sysclk;
 	int sysclk_src;
-	int bclk_ratio;
 	int pll_src;
 	int pll_in;
 	int pll_out;
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 8b1ca2da9bb9..55505e207bc0 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -323,13 +323,6 @@ static int sof_rt1015_hw_params(struct snd_pcm_substream *substream,
 		fs = 64;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		/* Set tdm/i2s1 master bclk ratio */
-		ret = snd_soc_dai_set_bclk_ratio(codec_dai, fs);
-		if (ret < 0) {
-			dev_err(card->dev, "failed to set bclk ratio\n");
-			return ret;
-		}
-
 		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
 					  params_rate(params) * fs,
 					  params_rate(params) * 256);
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 078e58f1ad0b..870cdfd17fff 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -125,12 +125,6 @@ mt8183_da7219_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		if (!strcmp(codec_dai->component->name, RT1015_DEV0_NAME) ||
 		    !strcmp(codec_dai->component->name, RT1015_DEV1_NAME)) {
-			ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
-			if (ret) {
-				dev_err(rtd->dev, "failed to set bclk ratio\n");
-				return ret;
-			}
-
 			ret = snd_soc_dai_set_pll(codec_dai, 0,
 						  RT1015_PLL_S_BCLK,
 						  rate * 64, rate * 256);
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 8c8340854859..0e4892245035 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -68,12 +68,6 @@ mt8183_mt6358_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 	int ret, i;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
-		if (ret < 0) {
-			dev_err(card->dev, "failed to set bclk ratio\n");
-			return ret;
-		}
-
 		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
 				rate * 64, rate * 256);
 		if (ret < 0) {
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 716fbb4126b5..a988ce1e58de 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -46,12 +46,6 @@ static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 	int ret, i;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
-		if (ret) {
-			dev_err(card->dev, "failed to set bclk ratio\n");
-			return ret;
-		}
-
 		ret = snd_soc_dai_set_pll(codec_dai, 0,
 					  RT1015_PLL_S_BCLK,
 					  params_rate(params) * 64,
-- 
2.29.2.729.g45daf8777d-goog

