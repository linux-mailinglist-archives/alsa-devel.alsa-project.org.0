Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A3F4240D1
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 17:07:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7B4D112;
	Wed,  6 Oct 2021 17:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7B4D112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633532831;
	bh=fniqwfqVDkfGa+QX1AQZc/34R+OEDeL6Ky33hbOsDrg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M1prSBmwINQ8QBKi7p60YRmlT/jAPsCpIZ7Ici0ED3uEmjtpNGlUHBzJdQhvu2rDR
	 trEvx7G+WCqMoAxFA7Ojhr0uB1iJXpyvPs2yTblgl577frnwhdagPdYBCj4cgJj3Ps
	 dE9a70ih7vVK+akz9MTNUIK54l3H+1Dsiel+naT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41808F804EC;
	Wed,  6 Oct 2021 17:04:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67A51F802D2; Wed,  6 Oct 2021 17:04:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 069BBF802D2
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 17:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 069BBF802D2
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="225961144"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="225961144"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 08:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="478146134"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 06 Oct 2021 08:04:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id C3FC31C8; Wed,  6 Oct 2021 18:04:45 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] ASoC: Intel: bytcr_rt5640: use devm_clk_get_optional()
 for mclk
Date: Wed,  6 Oct 2021 18:04:41 +0300
Message-Id: <20211006150442.16503-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006150442.16503-1-andriy.shevchenko@linux.intel.com>
References: <20211006150442.16503-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

The devm_clk_get_optional() helper returns NULL when devm_clk_get()
returns -ENOENT. This makes things slightly cleaner. The added benefit
is mostly cosmetic.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 75 ++++++++++++---------------
 1 file changed, 32 insertions(+), 43 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 0f609a0b3527..2e7d45f0f05d 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -269,13 +269,10 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 		return -EIO;
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
-		if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN) {
-			ret = clk_prepare_enable(priv->mclk);
-			if (ret < 0) {
-				dev_err(card->dev,
-					"could not configure MCLK state\n");
-				return ret;
-			}
+		ret = clk_prepare_enable(priv->mclk);
+		if (ret < 0) {
+			dev_err(card->dev, "could not configure MCLK state\n");
+			return ret;
 		}
 		ret = byt_rt5640_prepare_and_enable_pll1(codec_dai, 48000);
 	} else {
@@ -287,10 +284,8 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 		ret = snd_soc_dai_set_sysclk(codec_dai, RT5640_SCLK_S_RCCLK,
 					     48000 * 512,
 					     SND_SOC_CLOCK_IN);
-		if (!ret) {
-			if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN)
-				clk_disable_unprepare(priv->mclk);
-		}
+		if (!ret)
+			clk_disable_unprepare(priv->mclk);
 	}
 
 	if (ret < 0) {
@@ -1217,30 +1212,25 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 			return ret;
 	}
 
-	if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN) {
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
-		ret = clk_prepare_enable(priv->mclk);
-		if (!ret)
-			clk_disable_unprepare(priv->mclk);
-
-		if (byt_rt5640_quirk & BYT_RT5640_MCLK_25MHZ)
-			ret = clk_set_rate(priv->mclk, 25000000);
-		else
-			ret = clk_set_rate(priv->mclk, 19200000);
+	/*
+	 * The firmware might enable the clock at boot (this information
+	 * may or may not be reflected in the enable clock register).
+	 * To change the rate we must disable the clock first to cover
+	 * these cases. Due to common clock framework restrictions that
+	 * do not allow to disable a clock that has not been enabled,
+	 * we need to enable the clock first.
+	 */
+	ret = clk_prepare_enable(priv->mclk);
+	if (!ret)
+		clk_disable_unprepare(priv->mclk);
 
-		if (ret) {
-			dev_err(card->dev, "unable to set MCLK rate\n");
-			return ret;
-		}
+	if (byt_rt5640_quirk & BYT_RT5640_MCLK_25MHZ)
+		ret = clk_set_rate(priv->mclk, 25000000);
+	else
+		ret = clk_set_rate(priv->mclk, 19200000);
+	if (ret) {
+		dev_err(card->dev, "unable to set MCLK rate\n");
+		return ret;
 	}
 
 	if (BYT_RT5640_JDSRC(byt_rt5640_quirk)) {
@@ -1653,7 +1643,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		byt_rt5640_dais[dai_index].cpus->dai_name = "ssp0-port";
 
 	if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN) {
-		priv->mclk = devm_clk_get(dev, "pmc_plt_clk_3");
+		priv->mclk = devm_clk_get_optional(dev, "pmc_plt_clk_3");
 		if (IS_ERR(priv->mclk)) {
 			ret_val = PTR_ERR(priv->mclk);
 
@@ -1661,15 +1651,14 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 				"Failed to get MCLK from pmc_plt_clk_3: %d\n",
 				ret_val);
 
-			/*
-			 * Fall back to bit clock usage for -ENOENT (clock not
-			 * available likely due to missing dependencies), bail
-			 * for all other errors, including -EPROBE_DEFER
-			 */
-			if (ret_val != -ENOENT)
-				goto err;
-			byt_rt5640_quirk &= ~BYT_RT5640_MCLK_EN;
+			goto err;
 		}
+		/*
+		 * Fall back to bit clock usage when clock is not
+		 * available likely due to missing dependencies.
+		 */
+		if (!priv->mclk)
+			byt_rt5640_quirk &= ~BYT_RT5640_MCLK_EN;
 	}
 
 	if (byt_rt5640_quirk & BYT_RT5640_NO_SPEAKERS) {
-- 
2.33.0

