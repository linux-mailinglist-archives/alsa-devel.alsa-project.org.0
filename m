Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 690BD7A1EE9
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:42:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEC5DDEE;
	Fri, 15 Sep 2023 14:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEC5DDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781734;
	bh=UAXLDE6WMKwXnDGkOr95bOXY75KS5faYVhSOFTxfxzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YYzW124xeWoqZ5NJ9KeSA0dZop1dTY74KoAxGa2r9wax83XKpLPUeb+KUQJRoovDc
	 ib7Suk9FkiDDfQ6SeFdYS/qs/OlZ0MeJanjboT7dp87dG//YwH/SKGmR6oaRiCEwhP
	 1OEAcBdTYqZlfFOfzoJtyhAUMHGj2g2EGelmindc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D04FBF8057B; Fri, 15 Sep 2023 14:40:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DEBAF8057A;
	Fri, 15 Sep 2023 14:40:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F0F6F8056F; Fri, 15 Sep 2023 14:40:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 437DBF8007C
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 437DBF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LKiX+k/r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781617; x=1726317617;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UAXLDE6WMKwXnDGkOr95bOXY75KS5faYVhSOFTxfxzI=;
  b=LKiX+k/rK1UAcqZUVauYWkseimpEM3JftAE4VNq1mne2nJ/CDQ1mCg7S
   7nL02BgEKRjckSCreqt4N9dUDFLHZ69KHVKxJcvRrjCh1PVDlvzjUyPi/
   dWDPmZ2FxlYXAzwrgk8gO7gfyflBsTix6RrfQN6/Y1/0rJ/PPrBuzEuYa
   EYgBMF/lsQ95gm6y4lmZqcpbWsheZfK2/Tk+kiEuvIB8ckzUhP7zUBGUg
   fdAHIBRaOODrM3QxCFgOYawlExOwZKmVMKSTTx/Ly+j1jhMB0wTjNlr2n
   AzHXobVkHfUDN4npe/I7mBj5tZPH2har+wBKb8x0LaQ2Uq+K+sNE7Bo8v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653104"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653104"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304520"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304520"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:07 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	brent.lu@intel.com,
	uday.m.bhat@intel.com,
	balamurugan.c@intel.com
Subject: [PATCH 01/19] ASoC: Intel: sof_rt5682: cleanup unnecessary quirk flag
Date: Fri, 15 Sep 2023 20:48:34 +0800
Message-Id: <20230915124852.1696857-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IAF4SE72XWHFS2HFW2KJH3C3JHA7P2MS
X-Message-ID-Hash: IAF4SE72XWHFS2HFW2KJH3C3JHA7P2MS
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IAF4SE72XWHFS2HFW2KJH3C3JHA7P2MS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Remove SOF_RT5682_MCLK_24MHZ flag from JSL and CML/WHL board configs
since the information could be retrieved from SOF API. The macro
itself is removed as well.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 122 ++++++++++++++--------------
 1 file changed, 59 insertions(+), 63 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index fae091b9b55c..b3e90794f4e6 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -34,7 +34,6 @@
 #define SOF_RT5682_SSP_CODEC(quirk)		((quirk) & GENMASK(2, 0))
 #define SOF_RT5682_SSP_CODEC_MASK			(GENMASK(2, 0))
 #define SOF_RT5682_MCLK_EN			BIT(3)
-#define SOF_RT5682_MCLK_24MHZ			BIT(4)
 #define SOF_SPEAKER_AMP_PRESENT		BIT(5)
 #define SOF_RT5682_SSP_AMP_SHIFT		6
 #define SOF_RT5682_SSP_AMP_MASK                 (GENMASK(8, 6))
@@ -119,7 +118,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "WhiskeyLake Client"),
 		},
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(1)),
 	},
 	{
@@ -133,7 +131,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Dooly"),
 		},
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_RT1015_SPEAKER_AMP_PRESENT |
@@ -145,7 +142,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Hatch"),
 		},
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_RT5682_SSP_AMP(1)),
@@ -295,51 +291,60 @@ static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_jack *jack;
 	int extra_jack_data;
-	int ret;
+	int ret, mclk_freq;
 
-	/* need to enable ASRC function for 24MHz mclk rate */
-	if ((sof_rt5682_quirk & SOF_RT5682_MCLK_EN) &&
-	    (sof_rt5682_quirk & SOF_RT5682_MCLK_24MHZ)) {
-		if (sof_rt5682_quirk & SOF_RT5682S_HEADPHONE_CODEC_PRESENT)
-			rt5682s_sel_asrc_clk_src(component,
-						 RT5682S_DA_STEREO1_FILTER |
-						 RT5682S_AD_STEREO1_FILTER,
-						 RT5682S_CLK_SEL_I2S1_ASRC);
-		else if (sof_rt5682_quirk & SOF_RT5650_HEADPHONE_CODEC_PRESENT) {
-			rt5645_sel_asrc_clk_src(component,
-						RT5645_DA_STEREO_FILTER |
-						RT5645_AD_STEREO_FILTER,
-						RT5645_CLK_SEL_I2S1_ASRC);
-			rt5645_sel_asrc_clk_src(component,
-						RT5645_DA_MONO_L_FILTER |
-						RT5645_DA_MONO_R_FILTER,
-						RT5645_CLK_SEL_I2S2_ASRC);
-		} else
-			rt5682_sel_asrc_clk_src(component,
-						RT5682_DA_STEREO1_FILTER |
-						RT5682_AD_STEREO1_FILTER,
-						RT5682_CLK_SEL_I2S1_ASRC);
-	}
+	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN) {
+		mclk_freq = sof_dai_get_mclk(rtd);
+		if (mclk_freq <= 0) {
+			dev_err(rtd->dev, "invalid mclk freq %d\n", mclk_freq);
+			return -EINVAL;
+		}
 
-	if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
-		/*
-		 * The firmware might enable the clock at
-		 * boot (this information may or may not
-		 * be reflected in the enable clock register).
-		 * To change the rate we must disable the clock
-		 * first to cover these cases. Due to common
-		 * clock framework restrictions that do not allow
-		 * to disable a clock that has not been enabled,
-		 * we need to enable the clock first.
-		 */
-		ret = clk_prepare_enable(ctx->mclk);
-		if (!ret)
-			clk_disable_unprepare(ctx->mclk);
+		/* need to enable ASRC function for 24MHz mclk rate */
+		if (mclk_freq == 24000000) {
+			dev_info(rtd->dev, "enable ASRC\n");
 
-		ret = clk_set_rate(ctx->mclk, 19200000);
+			if (sof_rt5682_quirk & SOF_RT5682S_HEADPHONE_CODEC_PRESENT)
+				rt5682s_sel_asrc_clk_src(component,
+							 RT5682S_DA_STEREO1_FILTER |
+							 RT5682S_AD_STEREO1_FILTER,
+							 RT5682S_CLK_SEL_I2S1_ASRC);
+			else if (sof_rt5682_quirk & SOF_RT5650_HEADPHONE_CODEC_PRESENT) {
+				rt5645_sel_asrc_clk_src(component,
+							RT5645_DA_STEREO_FILTER |
+							RT5645_AD_STEREO_FILTER,
+							RT5645_CLK_SEL_I2S1_ASRC);
+				rt5645_sel_asrc_clk_src(component,
+							RT5645_DA_MONO_L_FILTER |
+							RT5645_DA_MONO_R_FILTER,
+							RT5645_CLK_SEL_I2S2_ASRC);
+			} else
+				rt5682_sel_asrc_clk_src(component,
+							RT5682_DA_STEREO1_FILTER |
+							RT5682_AD_STEREO1_FILTER,
+							RT5682_CLK_SEL_I2S1_ASRC);
+		}
 
-		if (ret)
-			dev_err(rtd->dev, "unable to set MCLK rate\n");
+		if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
+			/*
+			 * The firmware might enable the clock at
+			 * boot (this information may or may not
+			 * be reflected in the enable clock register).
+			 * To change the rate we must disable the clock
+			 * first to cover these cases. Due to common
+			 * clock framework restrictions that do not allow
+			 * to disable a clock that has not been enabled,
+			 * we need to enable the clock first.
+			 */
+			ret = clk_prepare_enable(ctx->mclk);
+			if (!ret)
+				clk_disable_unprepare(ctx->mclk);
+
+			ret = clk_set_rate(ctx->mclk, 19200000);
+
+			if (ret)
+				dev_err(rtd->dev, "unable to set MCLK rate\n");
+		}
 	}
 
 	/*
@@ -413,17 +418,9 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 
 		/* get the tplg configured mclk. */
 		pll_in = sof_dai_get_mclk(rtd);
-
-		/* mclk from the quirk is the first choice */
-		if (sof_rt5682_quirk & SOF_RT5682_MCLK_24MHZ) {
-			if (pll_in != 24000000)
-				dev_warn(rtd->dev, "configure wrong mclk in tplg, please use 24MHz.\n");
-			pll_in = 24000000;
-		} else if (pll_in == 0) {
-			/* use default mclk if not specified correct in topology */
-			pll_in = 19200000;
-		} else if (pll_in < 0) {
-			return pll_in;
+		if (pll_in <= 0) {
+			dev_err(rtd->dev, "invalid mclk freq %d\n", pll_in);
+			return -EINVAL;
 		}
 	} else {
 		if (sof_rt5682_quirk & SOF_RT5682S_HEADPHONE_CODEC_PRESENT)
@@ -451,7 +448,12 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 
 	/* when MCLK is 512FS, no need to set PLL configuration additionally. */
 	if (pll_in == pll_out)
-		clk_id = RT5682S_SCLK_S_MCLK;
+		if (sof_rt5682_quirk & SOF_RT5682S_HEADPHONE_CODEC_PRESENT)
+			clk_id = RT5682S_SCLK_S_MCLK;
+		else if (sof_rt5682_quirk & SOF_RT5650_HEADPHONE_CODEC_PRESENT)
+			clk_id = RT5645_SCLK_S_MCLK;
+		else
+			clk_id = RT5682_SCLK_S_MCLK;
 	else {
 		/* Configure pll for codec */
 		ret = snd_soc_dai_set_pll(codec_dai, pll_id, pll_source, pll_in,
@@ -1071,7 +1073,6 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "cml_rt1015_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_RT1015_SPEAKER_AMP_PRESENT |
@@ -1080,7 +1081,6 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "jsl_rt5682_rt1015",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_RT1015_SPEAKER_AMP_PRESENT |
@@ -1089,7 +1089,6 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "jsl_rt5682_mx98360",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
@@ -1098,7 +1097,6 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "jsl_rt5682_rt1015p",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_RT1015P_SPEAKER_AMP_PRESENT |
@@ -1107,7 +1105,6 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "jsl_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(0)),
 	},
 	{
@@ -1271,7 +1268,6 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "jsl_rt5650",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_MCLK_24MHZ |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_RT5682_SSP_AMP(1)),
-- 
2.25.1

