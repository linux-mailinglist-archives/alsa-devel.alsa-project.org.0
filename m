Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E29649F8B
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 14:12:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D03C02A17;
	Mon, 12 Dec 2022 14:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D03C02A17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670850729;
	bh=bslg/447s4CvuvWyjtCJZnYd7qg99VqMxwy62j2qIto=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ozu4Q3Q1/GFEiF1SHiGXmKVTP2wdc2cAOhOi5WQFjBp1Lm83rj43hXFR1k1uqBcEI
	 /PxPmNEaL0cuwPv4FfbBVTeH9FAVkZb+3puy5mA2s1bgcwaCLmhHDPQ2LDDBGmVn6A
	 BJStv4Ju/RP3y7CP/mw26HDyo9oFi+TtRvXoAjzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C1D8F80533;
	Mon, 12 Dec 2022 14:10:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53248F8051A; Mon, 12 Dec 2022 14:10:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4BD7F800F8
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 14:10:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4BD7F800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=Dv6yZaRF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1670850627; x=1702386627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bslg/447s4CvuvWyjtCJZnYd7qg99VqMxwy62j2qIto=;
 b=Dv6yZaRFh7svoOPQsKLWtPc3sud7sPGxVbglL8p9rQj38NNCqVWTS1cz
 0t4006QVb5mPXOAzVCZdG7suyvcQZEXBIq08aaXDXwotRE6SlqlwA0X0J
 OYToluV5+pcAFJAo50RpmerE7xe3/2fpnQzHwidR1O+X2aaC2XfqexmEy
 4p6HeJLuFVqvfKjozwhaQn6OJd8um1PqRAqrdXH2hkYL53dTumXwo7Ib+
 ryf0+W6wDJCNPLWtS68t/CKN9quGM8UYk21Wm2msEjGWA8fATc1pUM2me
 L2vlFtazd92wJyeTp1RcPaTKkInaPb9//8lGwG0kPq7wjz9e+Ii8WesGs w==;
X-IronPort-AV: E=Sophos;i="5.96,238,1665471600"; d="scan'208";a="192689974"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Dec 2022 06:10:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 12 Dec 2022 06:10:21 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Mon, 12 Dec 2022 06:10:18 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/4] ASoC: mchp-pdmc: use runtime pm for clock power saving
Date: Mon, 12 Dec 2022 15:15:33 +0200
Message-ID: <20221212131535.76111-3-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20221212131535.76111-1-claudiu.beznea@microchip.com>
References: <20221212131535.76111-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Implement clock power saving by taking advantage of runtime PM
infrastructure. This simplifies the code and allow using the same
infrastructure for suspend to RAM functionalities.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 sound/soc/atmel/mchp-pdmc.c | 126 ++++++++++++++++++++++++------------
 1 file changed, 84 insertions(+), 42 deletions(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 44aefbd5b62c..f184404e74e5 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <sound/core.h>
@@ -115,7 +116,6 @@ struct mchp_pdmc {
 	int mic_no;
 	int sinc_order;
 	bool audio_filter_en;
-	u8 gclk_enabled:1;
 };
 
 static const char *const mchp_pdmc_sinc_filter_order_text[] = {
@@ -454,13 +454,6 @@ static int mchp_pdmc_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
 	struct mchp_pdmc *dd = snd_soc_dai_get_drvdata(dai);
-	int ret;
-
-	ret = clk_prepare_enable(dd->pclk);
-	if (ret) {
-		dev_err(dd->dev, "failed to enable the peripheral clock: %d\n", ret);
-		return ret;
-	}
 
 	regmap_write(dd->regmap, MCHP_PDMC_CR, MCHP_PDMC_CR_SWRST);
 
@@ -470,14 +463,6 @@ static int mchp_pdmc_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static void mchp_pdmc_shutdown(struct snd_pcm_substream *substream,
-			       struct snd_soc_dai *dai)
-{
-	struct mchp_pdmc *dd = snd_soc_dai_get_drvdata(dai);
-
-	clk_disable_unprepare(dd->pclk);
-}
-
 static int mchp_pdmc_dai_probe(struct snd_soc_dai *dai)
 {
 	struct mchp_pdmc *dd = snd_soc_dai_get_drvdata(dai);
@@ -594,11 +579,6 @@ static int mchp_pdmc_hw_params(struct snd_pcm_substream *substream,
 			cfgr_val |= MCHP_PDMC_CFGR_BSSEL(i);
 	}
 
-	if (dd->gclk_enabled) {
-		clk_disable_unprepare(dd->gclk);
-		dd->gclk_enabled = 0;
-	}
-
 	for (osr_start = dd->audio_filter_en ? 64 : 8;
 	     osr_start <= 256 && best_diff_rate; osr_start *= 2) {
 		long round_rate;
@@ -620,8 +600,12 @@ static int mchp_pdmc_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	/* CLK is enabled by runtime PM. */
+	clk_disable_unprepare(dd->gclk);
+
 	/* set the rate */
 	ret = clk_set_rate(dd->gclk, gclk_rate);
+	clk_prepare_enable(dd->gclk);
 	if (ret) {
 		dev_err(comp->dev, "unable to set rate %lu to GCLK: %d\n",
 			gclk_rate, ret);
@@ -636,9 +620,6 @@ static int mchp_pdmc_hw_params(struct snd_pcm_substream *substream,
 	mr_val |= MCHP_PDMC_MR_CHUNK(dd->addr.maxburst);
 	dev_dbg(comp->dev, "maxburst set to %d\n", dd->addr.maxburst);
 
-	clk_prepare_enable(dd->gclk);
-	dd->gclk_enabled = 1;
-
 	snd_soc_component_update_bits(comp, MCHP_PDMC_MR,
 				      MCHP_PDMC_MR_OSR_MASK |
 				      MCHP_PDMC_MR_SINCORDER_MASK |
@@ -650,19 +631,6 @@ static int mchp_pdmc_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int mchp_pdmc_hw_free(struct snd_pcm_substream *substream,
-			     struct snd_soc_dai *dai)
-{
-	struct mchp_pdmc *dd = snd_soc_dai_get_drvdata(dai);
-
-	if (dd->gclk_enabled) {
-		clk_disable_unprepare(dd->gclk);
-		dd->gclk_enabled = 0;
-	}
-
-	return 0;
-}
-
 static int mchp_pdmc_trigger(struct snd_pcm_substream *substream,
 			     int cmd, struct snd_soc_dai *dai)
 {
@@ -711,9 +679,7 @@ static int mchp_pdmc_trigger(struct snd_pcm_substream *substream,
 static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
 	.set_fmt	= mchp_pdmc_set_fmt,
 	.startup	= mchp_pdmc_startup,
-	.shutdown	= mchp_pdmc_shutdown,
 	.hw_params	= mchp_pdmc_hw_params,
-	.hw_free	= mchp_pdmc_hw_free,
 	.trigger	= mchp_pdmc_trigger,
 };
 
@@ -864,6 +830,7 @@ static const struct regmap_config mchp_pdmc_regmap_config = {
 	.readable_reg	= mchp_pdmc_readable_reg,
 	.writeable_reg	= mchp_pdmc_writeable_reg,
 	.precious_reg	= mchp_pdmc_precious_reg,
+	.cache_type	= REGCACHE_FLAT,
 };
 
 static int mchp_pdmc_dt_init(struct mchp_pdmc *dd)
@@ -970,6 +937,49 @@ static struct snd_dmaengine_pcm_config mchp_pdmc_config = {
 	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
 };
 
+static int mchp_pdmc_runtime_suspend(struct device *dev)
+{
+	struct mchp_pdmc *dd = dev_get_drvdata(dev);
+
+	regcache_cache_only(dd->regmap, true);
+
+	clk_disable_unprepare(dd->gclk);
+	clk_disable_unprepare(dd->pclk);
+
+	return 0;
+}
+
+static int mchp_pdmc_runtime_resume(struct device *dev)
+{
+	struct mchp_pdmc *dd = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_prepare_enable(dd->pclk);
+	if (ret) {
+		dev_err(dd->dev,
+			"failed to enable the peripheral clock: %d\n", ret);
+		return ret;
+	}
+	ret = clk_prepare_enable(dd->gclk);
+	if (ret) {
+		dev_err(dd->dev,
+			"failed to enable generic clock: %d\n", ret);
+		goto disable_pclk;
+	}
+
+	regcache_cache_only(dd->regmap, false);
+	regcache_mark_dirty(dd->regmap);
+	ret = regcache_sync(dd->regmap);
+	if (ret) {
+		regcache_cache_only(dd->regmap, true);
+		clk_disable_unprepare(dd->gclk);
+disable_pclk:
+		clk_disable_unprepare(dd->pclk);
+	}
+
+	return ret;
+}
+
 static int mchp_pdmc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1039,18 +1049,25 @@ static int mchp_pdmc_probe(struct platform_device *pdev)
 	dd->addr.addr = (dma_addr_t)res->start + MCHP_PDMC_RHR;
 	platform_set_drvdata(pdev, dd);
 
+	pm_runtime_enable(dd->dev);
+	if (!pm_runtime_enabled(dd->dev)) {
+		ret = mchp_pdmc_runtime_resume(dd->dev);
+		if (ret)
+			return ret;
+	}
+
 	/* register platform */
 	ret = devm_snd_dmaengine_pcm_register(dev, &mchp_pdmc_config, 0);
 	if (ret) {
 		dev_err(dev, "could not register platform: %d\n", ret);
-		return ret;
+		goto pm_runtime_suspend;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &mchp_pdmc_dai_component,
 					      &mchp_pdmc_dai, 1);
 	if (ret) {
 		dev_err(dev, "could not register CPU DAI: %d\n", ret);
-		return ret;
+		goto pm_runtime_suspend;
 	}
 
 	/* print IP version */
@@ -1059,6 +1076,25 @@ static int mchp_pdmc_probe(struct platform_device *pdev)
 		 version & MCHP_PDMC_VER_VERSION);
 
 	return 0;
+
+pm_runtime_suspend:
+	if (!pm_runtime_status_suspended(dd->dev))
+		mchp_pdmc_runtime_suspend(dd->dev);
+	pm_runtime_disable(dd->dev);
+
+	return ret;
+}
+
+static int mchp_pdmc_remove(struct platform_device *pdev)
+{
+	struct mchp_pdmc *dd = platform_get_drvdata(pdev);
+
+	if (!pm_runtime_status_suspended(dd->dev))
+		mchp_pdmc_runtime_suspend(dd->dev);
+
+	pm_runtime_disable(dd->dev);
+
+	return 0;
 }
 
 static const struct of_device_id mchp_pdmc_of_match[] = {
@@ -1070,13 +1106,19 @@ static const struct of_device_id mchp_pdmc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mchp_pdmc_of_match);
 
+static const struct dev_pm_ops mchp_pdmc_pm_ops = {
+	RUNTIME_PM_OPS(mchp_pdmc_runtime_suspend, mchp_pdmc_runtime_resume,
+		       NULL)
+};
+
 static struct platform_driver mchp_pdmc_driver = {
 	.driver	= {
 		.name		= "mchp-pdmc",
 		.of_match_table	= of_match_ptr(mchp_pdmc_of_match),
-		.pm		= &snd_soc_pm_ops,
+		.pm		= pm_ptr(&mchp_pdmc_pm_ops),
 	},
 	.probe	= mchp_pdmc_probe,
+	.remove = mchp_pdmc_remove,
 };
 module_platform_driver(mchp_pdmc_driver);
 
-- 
2.34.1

