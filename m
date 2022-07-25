Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3DA5804CB
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 21:51:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C05C5843;
	Mon, 25 Jul 2022 21:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C05C5843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658778698;
	bh=zSSTbbZgm2NQv4cE4IlDN8APXp/Gd+HBQz+gdxVXkS4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I4Kk02QubX0wPYLZVhzybCw416PWbPDoZx7za9gmvHf42FuX7D4G/UmDiukFwYLE3
	 +2arxY5hQ4OHOFi7qxUh/YHaqTmZuFs01GPu7LPv5G9WSBDtchxCahyAdKG0rDng03
	 +g+4/Z7HxkYmobFblsce1oENl3ZvRWhlkw5quBbo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8377BF804FD;
	Mon, 25 Jul 2022 21:49:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9093F8053C; Mon, 25 Jul 2022 21:49:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84C59F80088
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 21:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84C59F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WzupICUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658778573; x=1690314573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zSSTbbZgm2NQv4cE4IlDN8APXp/Gd+HBQz+gdxVXkS4=;
 b=WzupICUolIj519SzcG8OWJIx+r/PSNFLXHZNeXk+54CMlvocKuhkYbau
 0ww+7PZoRFROK8oBHwtj8/l6W2I7MBjdXc+IVVMmgk5zVx8aNr9/LX1zN
 GMvdkG9BUjO4zXWKPBn7f0ZjxC7QLVe212pcytPC9KbXUiol7iBFWvYbC
 ZDcyZ+NAeQusWTxrFIyh9mXlng6CpJMagC1wQJf1xaA0ZGjS3Yxbns5do
 gMhR4E0f9GEgXaDa7/tPxmvqELZMjXkhq4kALu9iypuwomB1KLQdKbtaM
 1xXqUboGjj3BhfdZxb7xJ7uxTcnzbjYoxEkUYTd9nXsutrWEGsN74t2om A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="267553911"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="267553911"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:49:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="632479461"
Received: from mbianco-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.71.159])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:49:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/10] ASoC: Intel: sof_es8336: add support for HDMI_In capture
Date: Mon, 25 Jul 2022 14:49:04 -0500
Message-Id: <20220725194909.145418-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
References: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 broonie@kernel.org, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Muralidhar Reddy <muralidhar.reddy@intel.com>

Adding support for 2 streams of HDMI-In capture via I2S in CBP_CFP
configuration (codec provides bit clock and frame sync).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Muralidhar Reddy <muralidhar.reddy@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_es8336.c           | 126 +++++++++++++++---
 .../intel/common/soc-acpi-intel-adl-match.c   |  12 ++
 2 files changed, 118 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index d70d8255b8c7..f6a003d2da29 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -28,6 +28,24 @@
 #define SOF_ES8336_SSP_CODEC_MASK		(GENMASK(3, 0))
 
 #define SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK	BIT(4)
+
+/* HDMI capture*/
+#define SOF_SSP_HDMI_CAPTURE_PRESENT		BIT(14)
+#define SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT		15
+#define SOF_NO_OF_HDMI_CAPTURE_SSP_MASK		(GENMASK(16, 15))
+#define SOF_NO_OF_HDMI_CAPTURE_SSP(quirk)	\
+	(((quirk) << SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT) & SOF_NO_OF_HDMI_CAPTURE_SSP_MASK)
+
+#define SOF_HDMI_CAPTURE_1_SSP_SHIFT		7
+#define SOF_HDMI_CAPTURE_1_SSP_MASK		(GENMASK(9, 7))
+#define SOF_HDMI_CAPTURE_1_SSP(quirk)	\
+	(((quirk) << SOF_HDMI_CAPTURE_1_SSP_SHIFT) & SOF_HDMI_CAPTURE_1_SSP_MASK)
+
+#define SOF_HDMI_CAPTURE_2_SSP_SHIFT		10
+#define SOF_HDMI_CAPTURE_2_SSP_MASK		(GENMASK(12, 10))
+#define SOF_HDMI_CAPTURE_2_SSP(quirk)	\
+	(((quirk) << SOF_HDMI_CAPTURE_2_SSP_SHIFT) & SOF_HDMI_CAPTURE_2_SSP_MASK)
+
 #define SOF_ES8336_ENABLE_DMIC			BIT(5)
 #define SOF_ES8336_JD_INVERTED			BIT(6)
 #define SOF_ES8336_HEADPHONE_GPIO		BIT(7)
@@ -345,6 +363,13 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
+static struct snd_soc_dai_link_component dummy_component[] = {
+	{
+		.name = "snd-soc-dummy",
+		.dai_name = "snd-soc-dummy-dai",
+	}
+};
+
 static int sof_es8336_late_probe(struct snd_soc_card *card)
 {
 	struct sof_es8336_private *priv = snd_soc_card_get_drvdata(card);
@@ -496,6 +521,37 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		id++;
 	}
 
+	/* HDMI-In SSP */
+	if (quirk & SOF_SSP_HDMI_CAPTURE_PRESENT) {
+		int num_of_hdmi_ssp = (quirk & SOF_NO_OF_HDMI_CAPTURE_SSP_MASK) >>
+				SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT;
+
+		for (i = 1; i <= num_of_hdmi_ssp; i++) {
+			int port = (i == 1 ? (quirk & SOF_HDMI_CAPTURE_1_SSP_MASK) >>
+						SOF_HDMI_CAPTURE_1_SSP_SHIFT :
+						(quirk & SOF_HDMI_CAPTURE_2_SSP_MASK) >>
+						SOF_HDMI_CAPTURE_2_SSP_SHIFT);
+
+			links[id].cpus = &cpus[id];
+			links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+								  "SSP%d Pin", port);
+			if (!links[id].cpus->dai_name)
+				return NULL;
+			links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-HDMI", port);
+			if (!links[id].name)
+				return NULL;
+			links[id].id = id + hdmi_id_offset;
+			links[id].codecs = dummy_component;
+			links[id].num_codecs = ARRAY_SIZE(dummy_component);
+			links[id].platforms = platform_component;
+			links[id].num_platforms = ARRAY_SIZE(platform_component);
+			links[id].dpcm_capture = 1;
+			links[id].no_pcm = 1;
+			links[id].num_cpus = 1;
+			id++;
+		}
+	}
+
 	return links;
 
 devm_err:
@@ -531,29 +587,38 @@ static int sof_es8336_probe(struct platform_device *pdev)
 	card = &sof_es8336_card;
 	card->dev = dev;
 
+	if (pdev->id_entry && pdev->id_entry->driver_data)
+		quirk = (unsigned long)pdev->id_entry->driver_data;
+
 	/* check GPIO DMI quirks */
 	dmi_check_system(sof_es8336_quirk_table);
 
-	if (!mach->mach_params.i2s_link_mask) {
-		dev_warn(dev, "No I2S link information provided, using SSP0. This may need to be modified with the quirk module parameter\n");
-	} else {
-		/*
-		 * Set configuration based on platform NHLT.
-		 * In this machine driver, we can only support one SSP for the
-		 * ES8336 link, the else-if below are intentional.
-		 * In some cases multiple SSPs can be reported by NHLT, starting MSB-first
-		 * seems to pick the right connection.
-		 */
-		unsigned long ssp = 0;
-
-		if (mach->mach_params.i2s_link_mask & BIT(2))
-			ssp = SOF_ES8336_SSP_CODEC(2);
-		else if (mach->mach_params.i2s_link_mask & BIT(1))
-			ssp = SOF_ES8336_SSP_CODEC(1);
-		else  if (mach->mach_params.i2s_link_mask & BIT(0))
-			ssp = SOF_ES8336_SSP_CODEC(0);
-
-		quirk |= ssp;
+	/* Use NHLT configuration only for Non-HDMI capture use case.
+	 * Because more than one SSP will be enabled for HDMI capture hence wrong codec
+	 * SSP will be set.
+	 */
+	if (mach->tplg_quirk_mask & SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER) {
+		if (!mach->mach_params.i2s_link_mask) {
+			dev_warn(dev, "No I2S link information provided, using SSP0. This may need to be modified with the quirk module parameter\n");
+		} else {
+			/*
+			 * Set configuration based on platform NHLT.
+			 * In this machine driver, we can only support one SSP for the
+			 * ES8336 link, the else-if below are intentional.
+			 * In some cases multiple SSPs can be reported by NHLT, starting MSB-first
+			 * seems to pick the right connection.
+			 */
+			unsigned long ssp = 0;
+
+			if (mach->mach_params.i2s_link_mask & BIT(2))
+				ssp = SOF_ES8336_SSP_CODEC(2);
+			else if (mach->mach_params.i2s_link_mask & BIT(1))
+				ssp = SOF_ES8336_SSP_CODEC(1);
+			else  if (mach->mach_params.i2s_link_mask & BIT(0))
+				ssp = SOF_ES8336_SSP_CODEC(0);
+
+			quirk |= ssp;
+		}
 	}
 
 	if (mach->mach_params.dmic_num)
@@ -570,6 +635,11 @@ static int sof_es8336_probe(struct platform_device *pdev)
 		dmic_be_num = 2;
 
 	sof_es8336_card.num_links += dmic_be_num + hdmi_num;
+
+	if (quirk & SOF_SSP_HDMI_CAPTURE_PRESENT)
+		sof_es8336_card.num_links += (quirk & SOF_NO_OF_HDMI_CAPTURE_SSP_MASK) >>
+				SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT;
+
 	dai_links = sof_card_dai_links_create(dev,
 					      SOF_ES8336_SSP_CODEC(quirk),
 					      dmic_be_num, hdmi_num);
@@ -691,6 +761,21 @@ static int sof_es8336_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct platform_device_id board_ids[] = {
+	{
+		.name = "adl_es83x6_c1_h02",
+		.driver_data = (kernel_ulong_t)(SOF_ES8336_SSP_CODEC(1) |
+					SOF_NO_OF_HDMI_CAPTURE_SSP(2) |
+					SOF_HDMI_CAPTURE_1_SSP(0) |
+					SOF_HDMI_CAPTURE_2_SSP(2) |
+					SOF_SSP_HDMI_CAPTURE_PRESENT |
+					SOF_ES8336_SPEAKERS_EN_GPIO1_QUIRK |
+					SOF_ES8336_JD_INVERTED),
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, board_ids);
+
 static struct platform_driver sof_es8336_driver = {
 	.driver = {
 		.name = "sof-essx8336",
@@ -698,6 +783,7 @@ static struct platform_driver sof_es8336_driver = {
 	},
 	.probe = sof_es8336_probe,
 	.remove = sof_es8336_remove,
+	.id_table = board_ids,
 };
 module_platform_driver(sof_es8336_driver);
 
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 8fccd22b5953..9990d5502d26 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -440,6 +440,11 @@ static const struct snd_soc_acpi_codecs adl_max98390_amp = {
 	.codecs = {"MX98390"}
 };
 
+static const struct snd_soc_acpi_codecs adl_lt6911_hdmi = {
+	.num_codecs = 1,
+	.codecs = {"INTC10B0"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	{
 		.comp_ids = &adl_rt5682_rt5682s_hp,
@@ -520,6 +525,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.drv_name = "adl_cs35l41",
 		.sof_tplg_filename = "sof-adl-cs35l41.tplg",
 	},
+	{
+		.comp_ids = &essx_83x6,
+		.drv_name = "adl_es83x6_c1_h02",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_lt6911_hdmi,
+		.sof_tplg_filename = "sof-adl-es83x6-ssp1-hdmi-ssp02.tplg",
+	},
 	{
 		.comp_ids = &essx_83x6,
 		.drv_name = "sof-essx8336",
-- 
2.34.1

