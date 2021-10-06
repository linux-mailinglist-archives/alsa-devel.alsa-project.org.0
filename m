Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C0E4240D9
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 17:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35AB01676;
	Wed,  6 Oct 2021 17:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35AB01676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633532873;
	bh=RFaj4ALBuwerGhhxrZJuj8ksu9ThX8DByBk9pqhnJKQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sfXculJWOr6bCPN2tEad1awjwQimvObJHOhZfmX3SGNsUexoV77Uz253NMrM26cG3
	 9hFwMbnQWOHvS7aJCnh+bUT+BA8tIQU3QdgnyW4veIylJZd9RFuL018H6LnGkEOO1U
	 giRIOCACnczp/WXjymIvU3kvWjG08DjNcZHzcg90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 653E1F8050F;
	Wed,  6 Oct 2021 17:05:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F756F80508; Wed,  6 Oct 2021 17:05:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9AE9F804FE
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 17:05:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9AE9F804FE
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="312221259"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="312221259"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 08:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="568170516"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 06 Oct 2021 08:04:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 54AEF170; Wed,  6 Oct 2021 18:04:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] ASoC: Intel: bytcr_rt5651: Use temporary variable for
 struct device
Date: Wed,  6 Oct 2021 18:04:49 +0300
Message-Id: <20211006150451.16561-2-andriy.shevchenko@linux.intel.com>
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/intel/boards/bytcr_rt5651.c | 42 ++++++++++++---------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 2335cca17cc8..36f63516f0cb 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -907,12 +907,12 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	int dai_index = 0;
 	int i;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	/* register the soc card */
-	byt_rt5651_card.dev = &pdev->dev;
+	byt_rt5651_card.dev = dev;
 	snd_soc_card_set_drvdata(&byt_rt5651_card, priv);
 
 	/* fix index of codec dai */
@@ -932,7 +932,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		put_device(&adev->dev);
 		byt_rt5651_dais[dai_index].codecs->name = byt_rt5651_codec_name;
 	} else {
-		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
+		dev_err(dev, "Error cannot find '%s' dev\n", mach->id);
 		return -ENXIO;
 	}
 
@@ -980,13 +980,13 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 							       &pkg_ctx);
 		if (pkg_found) {
 			if (chan_package.aif_value == 1) {
-				dev_info(&pdev->dev, "BIOS Routing: AIF1 connected\n");
+				dev_info(dev, "BIOS Routing: AIF1 connected\n");
 				byt_rt5651_quirk |= BYT_RT5651_SSP0_AIF1;
 			} else  if (chan_package.aif_value == 2) {
-				dev_info(&pdev->dev, "BIOS Routing: AIF2 connected\n");
+				dev_info(dev, "BIOS Routing: AIF2 connected\n");
 				byt_rt5651_quirk |= BYT_RT5651_SSP0_AIF2;
 			} else {
-				dev_info(&pdev->dev, "BIOS Routing isn't valid, ignored\n");
+				dev_info(dev, "BIOS Routing isn't valid, ignored\n");
 				pkg_found = false;
 			}
 		}
@@ -1001,7 +1001,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	dmi_check_system(byt_rt5651_quirk_table);
 
 	if (quirk_override != -1) {
-		dev_info(&pdev->dev, "Overriding quirk 0x%lx => 0x%x\n",
+		dev_info(dev, "Overriding quirk 0x%lx => 0x%x\n",
 			 byt_rt5651_quirk, quirk_override);
 		byt_rt5651_quirk = quirk_override;
 	}
@@ -1017,8 +1017,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 
 	if (byt_rt5651_gpios) {
 		devm_acpi_dev_add_driver_gpios(codec_dev, byt_rt5651_gpios);
-		priv->ext_amp_gpio = devm_fwnode_gpiod_get(&pdev->dev,
-							   codec_dev->fwnode,
+		priv->ext_amp_gpio = devm_fwnode_gpiod_get(dev, codec_dev->fwnode,
 							   "ext-amp-enable",
 							   GPIOD_OUT_LOW,
 							   "speaker-amp");
@@ -1029,15 +1028,13 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 				priv->ext_amp_gpio = NULL;
 				break;
 			default:
-				dev_err(&pdev->dev, "Failed to get ext-amp-enable GPIO: %d\n",
-					ret_val);
+				dev_err(dev, "Failed to get ext-amp-enable GPIO: %d\n", ret_val);
 				fallthrough;
 			case -EPROBE_DEFER:
 				goto err;
 			}
 		}
-		priv->hp_detect = devm_fwnode_gpiod_get(&pdev->dev,
-							codec_dev->fwnode,
+		priv->hp_detect = devm_fwnode_gpiod_get(dev, codec_dev->fwnode,
 							"hp-detect",
 							GPIOD_IN,
 							"hp-detect");
@@ -1048,8 +1045,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 				priv->hp_detect = NULL;
 				break;
 			default:
-				dev_err(&pdev->dev, "Failed to get hp-detect GPIO: %d\n",
-					ret_val);
+				dev_err(dev, "Failed to get hp-detect GPIO: %d\n", ret_val);
 				fallthrough;
 			case -EPROBE_DEFER:
 				goto err;
@@ -1057,7 +1053,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		}
 	}
 
-	log_quirks(&pdev->dev);
+	log_quirks(dev);
 
 	if ((byt_rt5651_quirk & BYT_RT5651_SSP2_AIF2) ||
 	    (byt_rt5651_quirk & BYT_RT5651_SSP0_AIF2))
@@ -1068,10 +1064,10 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		byt_rt5651_dais[dai_index].cpus->dai_name = "ssp0-port";
 
 	if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN) {
-		priv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
+		priv->mclk = devm_clk_get(dev, "pmc_plt_clk_3");
 		if (IS_ERR(priv->mclk)) {
 			ret_val = PTR_ERR(priv->mclk);
-			dev_err(&pdev->dev,
+			dev_err(dev,
 				"Failed to get MCLK from pmc_plt_clk_3: %d\n",
 				ret_val);
 			/*
@@ -1111,7 +1107,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	if (ret_val)
 		goto err;
 
-	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
+	sof_parent = snd_soc_acpi_sof_parent(dev);
 
 	/* set card and driver name */
 	if (sof_parent) {
@@ -1124,13 +1120,11 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 
 	/* set pm ops */
 	if (sof_parent)
-		pdev->dev.driver->pm = &snd_soc_pm_ops;
-
-	ret_val = devm_snd_soc_register_card(&pdev->dev, &byt_rt5651_card);
+		dev->driver->pm = &snd_soc_pm_ops;
 
+	ret_val = devm_snd_soc_register_card(dev, &byt_rt5651_card);
 	if (ret_val) {
-		dev_err(&pdev->dev, "devm_snd_soc_register_card failed %d\n",
-			ret_val);
+		dev_err(dev, "devm_snd_soc_register_card failed %d\n", ret_val);
 		goto err;
 	}
 	platform_set_drvdata(pdev, &byt_rt5651_card);
-- 
2.33.0

