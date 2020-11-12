Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4846A2B11EE
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 23:42:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA1E21865;
	Thu, 12 Nov 2020 23:41:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA1E21865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605220943;
	bh=Rgh3lNlldY0sdlSvMwDebqxE/ldEB4I9gZz8r7x5khg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cffo9D/RvuqFiJm75uPstXD2CIBNzt/F0TqCCZN/QDboYp3s7UoZi/Bzv8LVZkvbr
	 JLH3DjeDRFbiMTCyx8IClDDlkBKQE8dcqGA6dTRoxt4X6RxXYeCFk6LjcjgBzWXtd5
	 hZ+nHWgAAMsE84nIrVWmZmTwFeoKqKdX+SB9JwhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9213BF804ED;
	Thu, 12 Nov 2020 23:39:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 899EFF804D8; Thu, 12 Nov 2020 23:39:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 510B2F80212
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 23:38:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 510B2F80212
IronPort-SDR: TxdQXaax5qvWjgxmX6iuFqO14JfJUpJycEw6CFz7TzWAxwYJ8VwlcMp7Dm9mYu0I8LpRFGf7ff
 2Fvk9QlayknA==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="166885004"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="166885004"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:38:55 -0800
IronPort-SDR: fpL8ACXpAD7bpldLKEh87Fe2tIpf/G1Ejctmr+O5ew1lfANvVCRNpRlLbUQuOa/L6TGECgApPG
 0VqXteKshXJw==
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="323797486"
Received: from gjshield-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.180.118])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:38:54 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/14] ASoC: Intel: byt/cht: set pm ops dynamically
Date: Thu, 12 Nov 2020 16:38:17 -0600
Message-Id: <20201112223825.39765-7-pierre-louis.bossart@linux.intel.com>
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

The Atom/SST driver does not rely on ASoC power management, but the
SOF driver does. Rather than using a hard-coded build-time assignment,
we can set this pm_ops dynamically depending on what the parent
is. That will remove the last build-time dependency and allow for
coexistence of both SST and SOF drivers for Baytrail/Cherrytrail.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_cx2072x.c      | 7 ++++---
 sound/soc/intel/boards/bytcht_da7213.c       | 7 ++++---
 sound/soc/intel/boards/bytcht_es8316.c       | 7 ++++---
 sound/soc/intel/boards/bytcr_rt5640.c        | 8 +++++---
 sound/soc/intel/boards/bytcr_rt5651.c        | 7 ++++---
 sound/soc/intel/boards/cht_bsw_max98090_ti.c | 7 ++++---
 sound/soc/intel/boards/cht_bsw_nau8824.c     | 7 ++++---
 sound/soc/intel/boards/cht_bsw_rt5645.c      | 7 ++++---
 sound/soc/intel/boards/cht_bsw_rt5672.c      | 7 ++++---
 9 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 762f09190f10..2bfe3e4c696f 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -275,15 +275,16 @@ static int snd_byt_cht_cx2072x_probe(struct platform_device *pdev)
 		byt_cht_cx2072x_card.driver_name = DRIVER_NAME;
 	}
 
+	/* set pm ops */
+	if (sof_parent)
+		pdev->dev.driver->pm = &snd_soc_pm_ops;
+
 	return devm_snd_soc_register_card(&pdev->dev, &byt_cht_cx2072x_card);
 }
 
 static struct platform_driver snd_byt_cht_cx2072x_driver = {
 	.driver = {
 		.name = "bytcht_cx2072x",
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
-		.pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = snd_byt_cht_cx2072x_probe,
 };
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index ef6682226a85..cfeba27252ba 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -279,6 +279,10 @@ static int bytcht_da7213_probe(struct platform_device *pdev)
 		bytcht_da7213_card.driver_name = DRIVER_NAME;
 	}
 
+	/* set pm ops */
+	if (sof_parent)
+		pdev->dev.driver->pm = &snd_soc_pm_ops;
+
 	ret_val = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret_val) {
 		dev_err(&pdev->dev,
@@ -292,9 +296,6 @@ static int bytcht_da7213_probe(struct platform_device *pdev)
 static struct platform_driver bytcht_da7213_driver = {
 	.driver = {
 		.name = "bytcht_da7213",
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
-		.pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = bytcht_da7213_probe,
 };
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index fbb62bab9dcc..892cf684216e 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -598,6 +598,10 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 		byt_cht_es8316_card.driver_name = DRIVER_NAME;
 	}
 
+	/* set pm ops */
+	if (sof_parent)
+		dev->driver->pm = &snd_soc_pm_ops;
+
 	/* register the soc card */
 	snd_soc_card_set_drvdata(&byt_cht_es8316_card, priv);
 
@@ -623,9 +627,6 @@ static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
 static struct platform_driver snd_byt_cht_es8316_mc_driver = {
 	.driver = {
 		.name = "bytcht_es8316",
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
-		.pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = snd_byt_cht_es8316_mc_probe,
 	.remove = snd_byt_cht_es8316_mc_remove,
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 574b489a3283..18f668fbc64c 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1163,6 +1163,7 @@ struct acpi_chan_package {   /* ACPICA seems to require 64 bit integers */
 
 static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	static const char * const map_name[] = { "dmic1", "dmic2", "in1", "in3" };
 	const struct dmi_system_id *dmi_id;
 	struct byt_rt5640_private *priv;
@@ -1344,6 +1345,10 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 		byt_rt5640_card.driver_name = DRIVER_NAME;
 	}
 
+	/* set pm ops */
+	if (sof_parent)
+		dev->driver->pm = &snd_soc_pm_ops;
+
 	ret_val = devm_snd_soc_register_card(&pdev->dev, &byt_rt5640_card);
 
 	if (ret_val) {
@@ -1358,9 +1363,6 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 static struct platform_driver snd_byt_rt5640_mc_driver = {
 	.driver = {
 		.name = "bytcr_rt5640",
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
-		.pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = snd_byt_rt5640_mc_probe,
 };
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 69e1d84e4de3..f289ec8563a1 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -1103,6 +1103,10 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 		byt_rt5651_card.driver_name = DRIVER_NAME;
 	}
 
+	/* set pm ops */
+	if (sof_parent)
+		pdev->dev.driver->pm = &snd_soc_pm_ops;
+
 	ret_val = devm_snd_soc_register_card(&pdev->dev, &byt_rt5651_card);
 
 	if (ret_val) {
@@ -1117,9 +1121,6 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 static struct platform_driver snd_byt_rt5651_mc_driver = {
 	.driver = {
 		.name = "bytcr_rt5651",
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
-		.pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = snd_byt_rt5651_mc_probe,
 };
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index a1d456d7a9c2..131882378a59 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -610,6 +610,10 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 		snd_soc_card_cht.driver_name = DRIVER_NAME;
 	}
 
+	/* set pm ops */
+	if (sof_parent)
+		dev->driver->pm = &snd_soc_pm_ops;
+
 	ret_val = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cht);
 	if (ret_val) {
 		dev_err(&pdev->dev,
@@ -634,9 +638,6 @@ static int snd_cht_mc_remove(struct platform_device *pdev)
 static struct platform_driver snd_cht_mc_driver = {
 	.driver = {
 		.name = "cht-bsw-max98090",
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
-		.pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = snd_cht_mc_probe,
 	.remove = snd_cht_mc_remove,
diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index f173793d867b..8131af1730f7 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -285,6 +285,10 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 		snd_soc_card_cht.driver_name = DRIVER_NAME;
 	}
 
+	/* set pm ops */
+	if (sof_parent)
+		pdev->dev.driver->pm = &snd_soc_pm_ops;
+
 	/* register the soc card */
 	ret_val = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cht);
 	if (ret_val) {
@@ -300,9 +304,6 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 static struct platform_driver snd_cht_mc_driver = {
 	.driver = {
 		.name = "cht-bsw-nau8824",
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
-		.pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = snd_cht_mc_probe,
 };
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index bdaf8d00fc6b..6fea554cfed5 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -691,6 +691,10 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 		snd_soc_card_chtrt5650.driver_name = DRIVER_NAME;
 	}
 
+	/* set pm ops */
+	if (sof_parent)
+		pdev->dev.driver->pm = &snd_soc_pm_ops;
+
 	ret_val = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret_val) {
 		dev_err(&pdev->dev,
@@ -704,9 +708,6 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 static struct platform_driver snd_cht_mc_driver = {
 	.driver = {
 		.name = "cht-bsw-rt5645",
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
-		.pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = snd_cht_mc_probe,
 };
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 6c46bfc43b50..10c88ef2f85d 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -466,6 +466,10 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 		snd_soc_card_cht.driver_name = DRIVER_NAME;
 	}
 
+	/* set pm ops */
+	if (sof_parent)
+		pdev->dev.driver->pm = &snd_soc_pm_ops;
+
 	/* register the soc card */
 	ret_val = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_cht);
 	if (ret_val) {
@@ -480,9 +484,6 @@ static int snd_cht_mc_probe(struct platform_device *pdev)
 static struct platform_driver snd_cht_mc_driver = {
 	.driver = {
 		.name = "cht-bsw-rt5672",
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_BAYTRAIL)
-		.pm = &snd_soc_pm_ops,
-#endif
 	},
 	.probe = snd_cht_mc_probe,
 };
-- 
2.25.1

