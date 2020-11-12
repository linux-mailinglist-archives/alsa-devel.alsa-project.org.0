Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC2D2B11F6
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 23:43:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E186177B;
	Thu, 12 Nov 2020 23:42:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E186177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605220980;
	bh=hKiFJzZqUUahyCsg8MDqF0WwN+8/BvkngSMd6t0QuBc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J4WwO5XJECU+JH81hZ+QZiTrgC7cZoFsPjLIUC1bx9JWviwNFQ5FY+trwC5xPv/Dg
	 f1uE1xupHGER2ufQADDgnA3DHggMZm6l5YYWyIt2ITWnBPztvI8YZQWGmm+Q3zPhEz
	 Cgu6l8P3F6IB5Ay0O3NxO4fpOiLL5j5vTyDpcccw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5812DF804F3;
	Thu, 12 Nov 2020 23:39:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1142AF804E1; Thu, 12 Nov 2020 23:39:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26F95F80161
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 23:38:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26F95F80161
IronPort-SDR: HcZUPsQVjZAF3evdEL1EJpOyMcm73i4s/T7xkXDst3d1U7Gwtm1mcVYb2fST6eiTvjGEJZNdzN
 HJDh5xrFBn/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="166885002"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="166885002"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:38:54 -0800
IronPort-SDR: JHB0Tx1rIhNeUX6Z59ulGffrCYqCJGVtoHDY/2FT+N3DrFrCpXKXtFfYyhc43IgXmgS2fgh+VR
 0//t7l97pn5w==
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="323797469"
Received: from gjshield-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.180.118])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:38:53 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/14] ASoC: Intel: boards: byt/cht: set card and driver name
 at run time
Date: Thu, 12 Nov 2020 16:38:16 -0600
Message-Id: <20201112223825.39765-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, broonie@kernel.org,
 Rander Wang <rander.wang@linux.intel.com>
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

To avoid hard-coded variations between SOF and SST drivers, set the
card name and driver dynamically depending on the parent type. This is
the first pass required to let distributions select which drivers to
use with kernel parameters instead of build-time selection.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_cx2072x.c      | 20 +++++++++----
 sound/soc/intel/boards/bytcht_da7213.c       | 20 +++++++++----
 sound/soc/intel/boards/bytcht_es8316.c       | 22 +++++++++-----
 sound/soc/intel/boards/bytcr_rt5640.c        | 22 +++++++++-----
 sound/soc/intel/boards/bytcr_rt5651.c        | 20 +++++++++----
 sound/soc/intel/boards/cht_bsw_max98090_ti.c | 22 +++++++++-----
 sound/soc/intel/boards/cht_bsw_nau8824.c     | 22 +++++++++-----
 sound/soc/intel/boards/cht_bsw_rt5645.c      | 31 +++++++++++++-------
 sound/soc/intel/boards/cht_bsw_rt5672.c      | 22 +++++++++-----
 9 files changed, 141 insertions(+), 60 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 0b50b3646d55..762f09190f10 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -205,14 +205,12 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 	},
 };
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 /* use space before codec name to simplify card ID, and simplify driver name */
-#define CARD_NAME "bytcht cx2072x" /* card name will be 'sof-bytcht cx2072x' */
-#define DRIVER_NAME "SOF"
-#else
+#define SOF_CARD_NAME "bytcht cx2072x" /* card name will be 'sof-bytcht cx2072x' */
+#define SOF_DRIVER_NAME "SOF"
+
 #define CARD_NAME "bytcht-cx2072x"
 #define DRIVER_NAME NULL /* card name will be used for driver name */
-#endif
 
 /* SoC card */
 static struct snd_soc_card byt_cht_cx2072x_card = {
@@ -236,6 +234,7 @@ static int snd_byt_cht_cx2072x_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach;
 	struct acpi_device *adev;
 	int dai_index = 0;
+	bool sof_parent;
 	int i, ret;
 
 	byt_cht_cx2072x_card.dev = &pdev->dev;
@@ -265,6 +264,17 @@ static int snd_byt_cht_cx2072x_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
+
+	/* set card and driver name */
+	if (sof_parent) {
+		byt_cht_cx2072x_card.name = SOF_CARD_NAME;
+		byt_cht_cx2072x_card.driver_name = SOF_DRIVER_NAME;
+	} else {
+		byt_cht_cx2072x_card.name = CARD_NAME;
+		byt_cht_cx2072x_card.driver_name = DRIVER_NAME;
+	}
+
 	return devm_snd_soc_register_card(&pdev->dev, &byt_cht_cx2072x_card);
 }
 
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index e1e46b4bbac5..ef6682226a85 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -205,14 +205,12 @@ static struct snd_soc_dai_link dailink[] = {
 	},
 };
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 /* use space before codec name to simplify card ID, and simplify driver name */
-#define CARD_NAME "bytcht da7213" /* card name will be 'sof-bytcht da7213' */
-#define DRIVER_NAME "SOF"
-#else
+#define SOF_CARD_NAME "bytcht da7213" /* card name will be 'sof-bytcht da7213' */
+#define SOF_DRIVER_NAME "SOF"
+
 #define CARD_NAME "bytcht-da7213"
 #define DRIVER_NAME NULL /* card name will be used for driver name */
-#endif
 
 /* SoC card */
 static struct snd_soc_card bytcht_da7213_card = {
@@ -237,6 +235,7 @@ static int bytcht_da7213_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach;
 	const char *platform_name;
 	struct acpi_device *adev;
+	bool sof_parent;
 	int dai_index = 0;
 	int ret_val = 0;
 	int i;
@@ -269,6 +268,17 @@ static int bytcht_da7213_probe(struct platform_device *pdev)
 	if (ret_val)
 		return ret_val;
 
+	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
+
+	/* set card and driver name */
+	if (sof_parent) {
+		bytcht_da7213_card.name = SOF_CARD_NAME;
+		bytcht_da7213_card.driver_name = SOF_DRIVER_NAME;
+	} else {
+		bytcht_da7213_card.name = CARD_NAME;
+		bytcht_da7213_card.driver_name = DRIVER_NAME;
+	}
+
 	ret_val = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret_val) {
 		dev_err(&pdev->dev,
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 7ed869bf1a92..fbb62bab9dcc 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -406,18 +406,14 @@ static int byt_cht_es8316_resume(struct snd_soc_card *card)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 /* use space before codec name to simplify card ID, and simplify driver name */
-#define CARD_NAME "bytcht es8316" /* card name will be 'sof-bytcht es8316' */
-#define DRIVER_NAME "SOF"
-#else
+#define SOF_CARD_NAME "bytcht es8316" /* card name will be 'sof-bytcht es8316' */
+#define SOF_DRIVER_NAME "SOF"
+
 #define CARD_NAME "bytcht-es8316"
 #define DRIVER_NAME NULL /* card name will be used for driver name */
-#endif
 
 static struct snd_soc_card byt_cht_es8316_card = {
-	.name = CARD_NAME,
-	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = byt_cht_es8316_dais,
 	.num_links = ARRAY_SIZE(byt_cht_es8316_dais),
@@ -472,6 +468,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	const char *platform_name;
 	struct acpi_device *adev;
 	struct device *codec_dev;
+	bool sof_parent;
 	unsigned int cnt = 0;
 	int dai_index = 0;
 	int i;
@@ -590,6 +587,17 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	byt_cht_es8316_card.long_name = long_name;
 #endif
 
+	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
+
+	/* set card and driver name */
+	if (sof_parent) {
+		byt_cht_es8316_card.name = SOF_CARD_NAME;
+		byt_cht_es8316_card.driver_name = SOF_DRIVER_NAME;
+	} else {
+		byt_cht_es8316_card.name = CARD_NAME;
+		byt_cht_es8316_card.driver_name = DRIVER_NAME;
+	}
+
 	/* register the soc card */
 	snd_soc_card_set_drvdata(&byt_cht_es8316_card, priv);
 
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 9dadf6561444..574b489a3283 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1136,18 +1136,14 @@ static int byt_rt5640_resume(struct snd_soc_card *card)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 /* use space before codec name to simplify card ID, and simplify driver name */
-#define CARD_NAME "bytcht rt5640" /* card name will be 'sof-bytcht rt5640' */
-#define DRIVER_NAME "SOF"
-#else
+#define SOF_CARD_NAME "bytcht rt5640" /* card name will be 'sof-bytcht rt5640' */
+#define SOF_DRIVER_NAME "SOF"
+
 #define CARD_NAME "bytcr-rt5640"
 #define DRIVER_NAME NULL /* card name will be used for driver name */
-#endif
 
 static struct snd_soc_card byt_rt5640_card = {
-	.name = CARD_NAME,
-	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = byt_rt5640_dais,
 	.num_links = ARRAY_SIZE(byt_rt5640_dais),
@@ -1173,6 +1169,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach;
 	const char *platform_name;
 	struct acpi_device *adev;
+	bool sof_parent;
 	int ret_val = 0;
 	int dai_index = 0;
 	int i;
@@ -1336,6 +1333,17 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	if (ret_val)
 		return ret_val;
 
+	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
+
+	/* set card and driver name */
+	if (sof_parent) {
+		byt_rt5640_card.name = SOF_CARD_NAME;
+		byt_rt5640_card.driver_name = SOF_DRIVER_NAME;
+	} else {
+		byt_rt5640_card.name = CARD_NAME;
+		byt_rt5640_card.driver_name = DRIVER_NAME;
+	}
+
 	ret_val = devm_snd_soc_register_card(&pdev->dev, &byt_rt5640_card);
 
 	if (ret_val) {
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 64d3fc4a3225..69e1d84e4de3 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -827,14 +827,12 @@ static int byt_rt5651_resume(struct snd_soc_card *card)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 /* use space before codec name to simplify card ID, and simplify driver name */
-#define CARD_NAME "bytcht rt5651" /* card name will be 'sof-bytcht rt5651' */
-#define DRIVER_NAME "SOF"
-#else
+#define SOF_CARD_NAME "bytcht rt5651" /* card name will be 'sof-bytcht rt5651' */
+#define SOF_DRIVER_NAME "SOF"
+
 #define CARD_NAME "bytcr-rt5651"
 #define DRIVER_NAME NULL /* card name will be used for driver name */
-#endif
 
 static struct snd_soc_card byt_rt5651_card = {
 	.name = CARD_NAME,
@@ -876,6 +874,7 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	const char *platform_name;
 	struct acpi_device *adev;
 	struct device *codec_dev;
+	bool sof_parent;
 	bool is_bytcr = false;
 	int ret_val = 0;
 	int dai_index = 0;
@@ -1093,6 +1092,17 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	if (ret_val)
 		return ret_val;
 
+	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
+
+	/* set card and driver name */
+	if (sof_parent) {
+		byt_rt5651_card.name = SOF_CARD_NAME;
+		byt_rt5651_card.driver_name = SOF_DRIVER_NAME;
+	} else {
+		byt_rt5651_card.name = CARD_NAME;
+		byt_rt5651_card.driver_name = DRIVER_NAME;
+	}
+
 	ret_val = devm_snd_soc_register_card(&pdev->dev, &byt_rt5651_card);
 
 	if (ret_val) {
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index 835e9bd6b52d..a1d456d7a9c2 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -382,19 +382,15 @@ static struct snd_soc_dai_link cht_dailink[] = {
 	},
 };
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 /* use space before codec name to simplify card ID, and simplify driver name */
-#define CARD_NAME "bytcht max98090" /* card name will be 'sof-bytcht max98090 */
-#define DRIVER_NAME "SOF"
-#else
+#define SOF_CARD_NAME "bytcht max98090" /* card name will be 'sof-bytcht max98090 */
+#define SOF_DRIVER_NAME "SOF"
+
 #define CARD_NAME "chtmax98090"
 #define DRIVER_NAME NULL /* card name will be used for driver name */
-#endif
 
 /* SoC card */
 static struct snd_soc_card snd_soc_card_cht = {
-	.name = CARD_NAME,
-	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = cht_dailink,
 	.num_links = ARRAY_SIZE(cht_dailink),
@@ -540,6 +536,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	const char *mclk_name;
 	struct snd_soc_acpi_mach *mach;
 	const char *platform_name;
+	bool sof_parent;
 
 	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
 	if (!drv)
@@ -602,6 +599,17 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 		}
 	}
 
+	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
+
+	/* set card and driver name */
+	if (sof_parent) {
+		snd_soc_card_cht.name = SOF_CARD_NAME;
+		snd_soc_card_cht.driver_name = SOF_DRIVER_NAME;
+	} else {
+		snd_soc_card_cht.name = CARD_NAME;
+		snd_soc_card_cht.driver_name = DRIVER_NAME;
+	}
+
 	ret_val = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cht);
 	if (ret_val) {
 		dev_err(&pdev->dev,
diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index 3e12bff15fed..f173793d867b 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -231,19 +231,15 @@ static struct snd_soc_dai_link cht_dailink[] = {
 	},
 };
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 /* use space before codec name to simplify card ID, and simplify driver name */
-#define CARD_NAME "bytcht nau8824" /* card name will be 'sof-bytcht nau8824 */
-#define DRIVER_NAME "SOF"
-#else
+#define SOF_CARD_NAME "bytcht nau8824" /* card name will be 'sof-bytcht nau8824 */
+#define SOF_DRIVER_NAME "SOF"
+
 #define CARD_NAME "chtnau8824"
 #define DRIVER_NAME NULL /* card name will be used for driver name */
-#endif
 
 /* SoC card */
 static struct snd_soc_card snd_soc_card_cht = {
-	.name = CARD_NAME,
-	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = cht_dailink,
 	.num_links = ARRAY_SIZE(cht_dailink),
@@ -260,6 +256,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	struct cht_mc_private *drv;
 	struct snd_soc_acpi_mach *mach;
 	const char *platform_name;
+	bool sof_parent;
 	int ret_val;
 
 	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
@@ -277,6 +274,17 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	if (ret_val)
 		return ret_val;
 
+	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
+
+	/* set card and driver name */
+	if (sof_parent) {
+		snd_soc_card_cht.name = SOF_CARD_NAME;
+		snd_soc_card_cht.driver_name = SOF_DRIVER_NAME;
+	} else {
+		snd_soc_card_cht.name = CARD_NAME;
+		snd_soc_card_cht.driver_name = DRIVER_NAME;
+	}
+
 	/* register the soc card */
 	ret_val = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cht);
 	if (ret_val) {
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index b53c02481749..bdaf8d00fc6b 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -479,21 +479,17 @@ static struct snd_soc_dai_link cht_dailink[] = {
 	},
 };
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 /* use space before codec name to simplify card ID, and simplify driver name */
-#define CARD_RT5645_NAME "bytcht rt5645" /* card name 'sof-bytcht rt5645' */
-#define CARD_RT5650_NAME "bytcht rt5650" /* card name 'sof-bytcht rt5650' */
-#define DRIVER_NAME "SOF"
-#else
+#define SOF_CARD_RT5645_NAME "bytcht rt5645" /* card name 'sof-bytcht rt5645' */
+#define SOF_CARD_RT5650_NAME "bytcht rt5650" /* card name 'sof-bytcht rt5650' */
+#define SOF_DRIVER_NAME "SOF"
+
 #define CARD_RT5645_NAME "chtrt5645"
 #define CARD_RT5650_NAME "chtrt5650"
 #define DRIVER_NAME NULL /* card name will be used for driver name */
-#endif
 
 /* SoC card */
 static struct snd_soc_card snd_soc_card_chtrt5645 = {
-	.name = CARD_RT5645_NAME,
-	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = cht_dailink,
 	.num_links = ARRAY_SIZE(cht_dailink),
@@ -506,8 +502,6 @@ static struct snd_soc_card snd_soc_card_chtrt5645 = {
 };
 
 static struct snd_soc_card snd_soc_card_chtrt5650 = {
-	.name = CARD_RT5650_NAME,
-	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = cht_dailink,
 	.num_links = ARRAY_SIZE(cht_dailink),
@@ -541,6 +535,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	const char *platform_name;
 	struct cht_mc_private *drv;
 	struct acpi_device *adev;
+	bool sof_parent;
 	bool found = false;
 	bool is_bytcr = false;
 	int dai_index = 0;
@@ -680,6 +675,22 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	}
 
 	snd_soc_card_set_drvdata(card, drv);
+
+	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
+
+	/* set card and driver name */
+	if (sof_parent) {
+		snd_soc_card_chtrt5645.name = SOF_CARD_RT5645_NAME;
+		snd_soc_card_chtrt5645.driver_name = SOF_DRIVER_NAME;
+		snd_soc_card_chtrt5650.name = SOF_CARD_RT5650_NAME;
+		snd_soc_card_chtrt5650.driver_name = SOF_DRIVER_NAME;
+	} else {
+		snd_soc_card_chtrt5645.name = CARD_RT5645_NAME;
+		snd_soc_card_chtrt5645.driver_name = DRIVER_NAME;
+		snd_soc_card_chtrt5650.name = CARD_RT5650_NAME;
+		snd_soc_card_chtrt5650.driver_name = DRIVER_NAME;
+	}
+
 	ret_val = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret_val) {
 		dev_err(&pdev->dev,
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 8442be93eb1c..6c46bfc43b50 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -382,19 +382,15 @@ static int cht_resume_post(struct snd_soc_card *card)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
 /* use space before codec name to simplify card ID, and simplify driver name */
-#define CARD_NAME "bytcht rt5672" /* card name will be 'sof-bytcht rt5672' */
-#define DRIVER_NAME "SOF"
-#else
+#define SOF_CARD_NAME "bytcht rt5672" /* card name will be 'sof-bytcht rt5672' */
+#define SOF_DRIVER_NAME "SOF"
+
 #define CARD_NAME "cht-bsw-rt5672"
 #define DRIVER_NAME NULL /* card name will be used for driver name */
-#endif
 
 /* SoC card */
 static struct snd_soc_card snd_soc_card_cht = {
-	.name = CARD_NAME,
-	.driver_name = DRIVER_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = cht_dailink,
 	.num_links = ARRAY_SIZE(cht_dailink),
@@ -417,6 +413,7 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	const char *platform_name;
 	struct acpi_device *adev;
+	bool sof_parent;
 	int i;
 
 	drv = devm_kzalloc(&pdev->dev, sizeof(*drv), GFP_KERNEL);
@@ -458,6 +455,17 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 	}
 	snd_soc_card_set_drvdata(&snd_soc_card_cht, drv);
 
+	sof_parent = snd_soc_acpi_sof_parent(&pdev->dev);
+
+	/* set card and driver name */
+	if (sof_parent) {
+		snd_soc_card_cht.name = SOF_CARD_NAME;
+		snd_soc_card_cht.driver_name = SOF_DRIVER_NAME;
+	} else {
+		snd_soc_card_cht.name = CARD_NAME;
+		snd_soc_card_cht.driver_name = DRIVER_NAME;
+	}
+
 	/* register the soc card */
 	ret_val = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cht);
 	if (ret_val) {
-- 
2.25.1

