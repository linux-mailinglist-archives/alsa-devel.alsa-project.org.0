Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7685D4240E0
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 17:08:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21DD7167E;
	Wed,  6 Oct 2021 17:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21DD7167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633532929;
	bh=TvBRxcscdJkOdoVaMwnkndHz0npwNlMpcou0CkoPx9U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TM5+WrTvx+1/Muazg1R5kjBGeJp/nkQY+6iuSWSWOleSOUUSBiqgzFYaxuUgZm6Nv
	 4EsJWOzlGQQOWFtpmxDDyWAmaRlJNF1vdIIhW8qPsqvs4y1MheGhFe3JIeCX9TSx/m
	 Hq9f5YWv9AfbFLanL19RlSrUAGUqUot/+XfkLJLs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 684F6F80249;
	Wed,  6 Oct 2021 17:06:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BCC0F80249; Wed,  6 Oct 2021 17:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AFB2F8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 17:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AFB2F8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="206133736"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="206133736"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 08:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="545297465"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 06 Oct 2021 08:04:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 629771C8; Wed,  6 Oct 2021 18:04:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/4] ASoC: Intel: bytcr_rt5651: use devm_clk_get_optional()
 for mclk
Date: Wed,  6 Oct 2021 18:04:50 +0300
Message-Id: <20211006150451.16561-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006150451.16561-1-andriy.shevchenko@linux.intel.com>
References: <20211006150451.16561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
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
 sound/soc/intel/boards/bytcr_rt5651.c | 69 ++++++++++++---------------
 1 file changed, 30 insertions(+), 39 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 36f63516f0cb..28c561302e69 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -188,13 +188,10 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	}
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
-		if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN) {
-			ret = clk_prepare_enable(priv->mclk);
-			if (ret < 0) {
-				dev_err(card->dev,
-					"could not configure MCLK state");
-				return ret;
-			}
+		ret = clk_prepare_enable(priv->mclk);
+		if (ret < 0) {
+			dev_err(card->dev, "could not configure MCLK state");
+			return ret;
 		}
 		ret = byt_rt5651_prepare_and_enable_pll1(codec_dai, 48000, 50);
 	} else {
@@ -207,8 +204,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 					     48000 * 512,
 					     SND_SOC_CLOCK_IN);
 		if (!ret)
-			if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN)
-				clk_disable_unprepare(priv->mclk);
+			clk_disable_unprepare(priv->mclk);
 	}
 
 	if (ret < 0) {
@@ -629,29 +625,25 @@ static int byt_rt5651_init(struct snd_soc_pcm_runtime *runtime)
 		return ret;
 	}
 
-	if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN) {
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
 
-		if (byt_rt5651_quirk & BYT_RT5651_MCLK_25MHZ)
-			ret = clk_set_rate(priv->mclk, 25000000);
-		else
-			ret = clk_set_rate(priv->mclk, 19200000);
+	if (byt_rt5651_quirk & BYT_RT5651_MCLK_25MHZ)
+		ret = clk_set_rate(priv->mclk, 25000000);
+	else
+		ret = clk_set_rate(priv->mclk, 19200000);
 
-		if (ret)
-			dev_err(card->dev, "unable to set MCLK rate\n");
-	}
+	if (ret)
+		dev_err(card->dev, "unable to set MCLK rate\n");
 
 	report = 0;
 	if (BYT_RT5651_JDSRC(byt_rt5651_quirk))
@@ -1064,21 +1056,20 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		byt_rt5651_dais[dai_index].cpus->dai_name = "ssp0-port";
 
 	if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN) {
-		priv->mclk = devm_clk_get(dev, "pmc_plt_clk_3");
+		priv->mclk = devm_clk_get_optional(dev, "pmc_plt_clk_3");
 		if (IS_ERR(priv->mclk)) {
 			ret_val = PTR_ERR(priv->mclk);
 			dev_err(dev,
 				"Failed to get MCLK from pmc_plt_clk_3: %d\n",
 				ret_val);
-			/*
-			 * Fall back to bit clock usage for -ENOENT (clock not
-			 * available likely due to missing dependencies), bail
-			 * for all other errors, including -EPROBE_DEFER
-			 */
-			if (ret_val != -ENOENT)
-				goto err;
-			byt_rt5651_quirk &= ~BYT_RT5651_MCLK_EN;
+			goto err;
 		}
+		/*
+		 * Fall back to bit clock usage when clock is not
+		 * available likely due to missing dependencies.
+		 */
+		if (!priv->mclk)
+			byt_rt5651_quirk &= ~BYT_RT5651_MCLK_EN;
 	}
 
 	snprintf(byt_rt5651_components, sizeof(byt_rt5651_components),
-- 
2.33.0

