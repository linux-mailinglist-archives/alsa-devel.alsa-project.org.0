Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4674258A9
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 18:59:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E33F1669;
	Thu,  7 Oct 2021 18:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E33F1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633625944;
	bh=5pqXhaF/zE30NusfQgZ9Vk/BbUuSjBAVL8+69HYbdFE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vGOlzPdRgeVdVOckapTRm49QLIa8kCkWyNtXdNkaQW2FmSnDxERVAqd8jUADF6fPW
	 jEHTPPXnS2UEnefooncYlsD9r7Me8pz23ccHQxjdDUEnt02GssObT6uVnp/CS1+230
	 z6uWFqrwNZGjyz68E5O3JH3v63C88WKFvsUiM6WA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58F56F800FE;
	Thu,  7 Oct 2021 18:57:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABFEAF80259; Thu,  7 Oct 2021 18:57:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1977F80259
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 18:57:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1977F80259
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="249628006"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="249628006"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:57:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="484586167"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 07 Oct 2021 09:57:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B10FF1C8; Thu,  7 Oct 2021 19:57:19 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] ASoC: Intel: bytcr_rt5640: Use temporary variable for
 struct device
Date: Thu,  7 Oct 2021 19:57:13 +0300
Message-Id: <20211007165715.27463-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007165715.27463-1-andriy.shevchenko@linux.intel.com>
References: <20211007165715.27463-1-andriy.shevchenko@linux.intel.com>
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

Use temporary variable for struct device to make code neater.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 32 +++++++++++++--------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 43997048a825..0f609a0b3527 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1511,12 +1511,12 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	int aif;
 
 	is_bytcr = false;
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	/* register the soc card */
-	byt_rt5640_card.dev = &pdev->dev;
+	byt_rt5640_card.dev = dev;
 	snd_soc_card_set_drvdata(&byt_rt5640_card, priv);
 
 	/* fix index of codec dai */
@@ -1536,7 +1536,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		put_device(&adev->dev);
 		byt_rt5640_dais[dai_index].codecs->name = byt_rt5640_codec_name;
 	} else {
-		dev_err(&pdev->dev, "Error cannot find '%s' dev\n", mach->id);
+		dev_err(dev, "Error cannot find '%s' dev\n", mach->id);
 		return -ENXIO;
 	}
 
@@ -1579,13 +1579,13 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 							       &pkg_ctx);
 		if (pkg_found) {
 			if (chan_package.aif_value == 1) {
-				dev_info(&pdev->dev, "BIOS Routing: AIF1 connected\n");
+				dev_info(dev, "BIOS Routing: AIF1 connected\n");
 				byt_rt5640_quirk |= BYT_RT5640_SSP0_AIF1;
 			} else  if (chan_package.aif_value == 2) {
-				dev_info(&pdev->dev, "BIOS Routing: AIF2 connected\n");
+				dev_info(dev, "BIOS Routing: AIF2 connected\n");
 				byt_rt5640_quirk |= BYT_RT5640_SSP0_AIF2;
 			} else {
-				dev_info(&pdev->dev, "BIOS Routing isn't valid, ignored\n");
+				dev_info(dev, "BIOS Routing isn't valid, ignored\n");
 				pkg_found = false;
 			}
 		}
@@ -1609,7 +1609,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	if (dmi_id)
 		byt_rt5640_quirk = (unsigned long)dmi_id->driver_data;
 	if (quirk_override != -1) {
-		dev_info(&pdev->dev, "Overriding quirk 0x%lx => 0x%x\n",
+		dev_info(dev, "Overriding quirk 0x%lx => 0x%x\n",
 			 byt_rt5640_quirk, quirk_override);
 		byt_rt5640_quirk = quirk_override;
 	}
@@ -1623,12 +1623,12 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		acpi_dev_add_driver_gpios(ACPI_COMPANION(priv->codec_dev),
 					  byt_rt5640_hp_elitepad_1000g2_gpios);
 
-		priv->hsmic_detect = devm_fwnode_gpiod_get(&pdev->dev, codec_dev->fwnode,
+		priv->hsmic_detect = devm_fwnode_gpiod_get(dev, codec_dev->fwnode,
 							   "headset-mic-detect", GPIOD_IN,
 							   "headset-mic-detect");
 		if (IS_ERR(priv->hsmic_detect)) {
 			ret_val = PTR_ERR(priv->hsmic_detect);
-			dev_err_probe(&pdev->dev, ret_val, "getting hsmic-detect GPIO\n");
+			dev_err_probe(dev, ret_val, "getting hsmic-detect GPIO\n");
 			goto err_device;
 		}
 	}
@@ -1638,7 +1638,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	if (ret_val)
 		goto err_remove_gpios;
 
-	log_quirks(&pdev->dev);
+	log_quirks(dev);
 
 	if ((byt_rt5640_quirk & BYT_RT5640_SSP2_AIF2) ||
 	    (byt_rt5640_quirk & BYT_RT5640_SSP0_AIF2)) {
@@ -1653,11 +1653,11 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		byt_rt5640_dais[dai_index].cpus->dai_name = "ssp0-port";
 
 	if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN) {
-		priv->mclk = devm_clk_get(&pdev->dev, "pmc_plt_clk_3");
+		priv->mclk = devm_clk_get(dev, "pmc_plt_clk_3");
 		if (IS_ERR(priv->mclk)) {
 			ret_val = PTR_ERR(priv->mclk);
 
-			dev_err(&pdev->dev,
+			dev_err(dev,
 				"Failed to get MCLK from pmc_plt_clk_3: %d\n",
 				ret_val);
 
@@ -1713,7 +1713,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	if (ret_val)
 		goto err;
 
-	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
+	sof_parent = snd_soc_acpi_sof_parent(dev);
 
 	/* set card and driver name */
 	if (sof_parent) {
@@ -1728,11 +1728,9 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	if (sof_parent)
 		dev->driver->pm = &snd_soc_pm_ops;
 
-	ret_val = devm_snd_soc_register_card(&pdev->dev, &byt_rt5640_card);
-
+	ret_val = devm_snd_soc_register_card(dev, &byt_rt5640_card);
 	if (ret_val) {
-		dev_err(&pdev->dev, "devm_snd_soc_register_card failed %d\n",
-			ret_val);
+		dev_err(dev, "devm_snd_soc_register_card failed %d\n", ret_val);
 		goto err;
 	}
 	platform_set_drvdata(pdev, &byt_rt5640_card);
-- 
2.33.0

