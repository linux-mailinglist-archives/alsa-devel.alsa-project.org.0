Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C03987A1EF9
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:43:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57BED820;
	Fri, 15 Sep 2023 14:43:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57BED820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781834;
	bh=bVfCil5ufddbmfhQlDsTmctnStrzCN6TLD6moA5QBb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bqt9P3Lgnn0ji0Dzj7qgaLkwtY6jYx3q+ldW1sy1cVKTRqGj0k+UE9o5l04Eblxwz
	 Ny/+5RzTUs2LWGVCb3zYDIWti8scf0bvjU3tihmi05kqZM8tumStyggLan3G2Ar0TW
	 7KbLIXsTeVLoOyJJCLQbcQpfQ4T8r6HtteVS4FNI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FBCAF805E8; Fri, 15 Sep 2023 14:40:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D9D8F805E5;
	Fri, 15 Sep 2023 14:40:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61F72F805AD; Fri, 15 Sep 2023 14:40:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C61ECF80141
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C61ECF80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CLbkp2h+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781623; x=1726317623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bVfCil5ufddbmfhQlDsTmctnStrzCN6TLD6moA5QBb8=;
  b=CLbkp2h+6FMdUm4JroV8yxzAR39jKNe4lbSiXxlLMIxgKfeb3i1Bz5pr
   mbYPPodraxT5llTZzuxhA2b/YSlDFddGi2YgGHgyxwOXNP9MIlcl6+xNM
   X6KYOUAWVzux/e8a43NzARe16ewP5fQjnpTYbhBzVPBQHOKYxLF6KPjML
   jNXLAKBisgEvEdDv6/XcJMTGRIPjPbmIL92l9RvDyamxGuJF5BB6UVqWy
   At6GR+CNMyBysj5wHVXfiiswHZdoNu1y2hFB4U384g6BEEGaesBeUSDgT
   QFZpjlNAq1yLLQXGrqTJ6vcJXczHRTk99BRvrKjFQNSUlBcdihANElEkp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653145"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653145"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304558"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304558"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:18 -0700
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
Subject: [PATCH 05/19] ASoC: Intel: sof_cs42l42: use ssp-common module to
 detect codec
Date: Fri, 15 Sep 2023 20:48:38 +0800
Message-Id: <20230915124852.1696857-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GBOHG5ZY4SIMNJKKK72OKVWR5VP57YK4
X-Message-ID-Hash: GBOHG5ZY4SIMNJKKK72OKVWR5VP57YK4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GBOHG5ZY4SIMNJKKK72OKVWR5VP57YK4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use ssp-common module to detect codec and amplifier type in driver
probe function and remove all quirks about codec and amplifier type.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig       |  1 +
 sound/soc/intel/boards/sof_cs42l42.c | 55 ++++++++++++++--------------
 2 files changed, 29 insertions(+), 27 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index f41343bb5c4f..1bc47f7c502a 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -514,6 +514,7 @@ config SND_SOC_INTEL_SOF_CS42L42_MACH
 	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
+	select SND_SOC_INTEL_SOF_SSP_COMMON
 	help
 	   This adds support for ASoC machine driver for SOF platforms
 	   with cs42l42 codec.
diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index e6695e77d594..70d3002afb52 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -23,12 +23,12 @@
 #include "../common/soc-intel-quirks.h"
 #include "hda_dsp_common.h"
 #include "sof_maxim_common.h"
+#include "sof_ssp_common.h"
 
 #define NAME_SIZE 32
 
 #define SOF_CS42L42_SSP_CODEC(quirk)		((quirk) & GENMASK(2, 0))
 #define SOF_CS42L42_SSP_CODEC_MASK		(GENMASK(2, 0))
-#define SOF_SPEAKER_AMP_PRESENT			BIT(3)
 #define SOF_CS42L42_SSP_AMP_SHIFT		4
 #define SOF_CS42L42_SSP_AMP_MASK		(GENMASK(6, 4))
 #define SOF_CS42L42_SSP_AMP(quirk)	\
@@ -46,8 +46,6 @@
 #define SOF_CS42L42_SSP_BT_MASK			(GENMASK(28, 26))
 #define SOF_CS42L42_SSP_BT(quirk)	\
 	(((quirk) << SOF_CS42L42_SSP_BT_SHIFT) & SOF_CS42L42_SSP_BT_MASK)
-#define SOF_MAX98357A_SPEAKER_AMP_PRESENT	BIT(29)
-#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(30)
 
 enum {
 	LINK_NONE = 0,
@@ -83,6 +81,8 @@ struct sof_card_private {
 	struct snd_soc_jack headset_jack;
 	struct list_head hdmi_pcm_list;
 	bool common_hdmi_codec_drv;
+	enum sof_ssp_codec codec_type;
+	enum sof_ssp_codec amp_type;
 };
 
 static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
@@ -299,12 +299,13 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 static int create_spk_amp_dai_links(struct device *dev,
 				    struct snd_soc_dai_link *links,
 				    struct snd_soc_dai_link_component *cpus,
-				    int *id, int ssp_amp)
+				    int *id, enum sof_ssp_codec amp_type,
+				    int ssp_amp)
 {
 	int ret = 0;
 
 	/* speaker amp */
-	if (!(sof_cs42l42_quirk & SOF_SPEAKER_AMP_PRESENT))
+	if (amp_type == CODEC_NONE)
 		return 0;
 
 	links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec",
@@ -316,14 +317,16 @@ static int create_spk_amp_dai_links(struct device *dev,
 
 	links[*id].id = *id;
 
-	if (sof_cs42l42_quirk & SOF_MAX98357A_SPEAKER_AMP_PRESENT) {
+	switch (amp_type) {
+	case CODEC_MAX98357A:
 		max_98357a_dai_link(&links[*id]);
-	} else if (sof_cs42l42_quirk & SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
+		break;
+	case CODEC_MAX98360A:
 		max_98360a_dai_link(&links[*id]);
-	} else {
-		dev_err(dev, "no amp defined\n");
-		ret = -EINVAL;
-		goto devm_err;
+		break;
+	default:
+		dev_err(dev, "invalid amp type %d\n", amp_type);
+		return -EINVAL;
 	}
 
 	links[*id].platforms = platform_component;
@@ -528,12 +531,10 @@ static int create_bt_offload_dai_links(struct device *dev,
 	return -ENOMEM;
 }
 
-static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
-							  int ssp_codec,
-							  int ssp_amp,
-							  int ssp_bt,
-							  int dmic_be_num,
-							  int hdmi_num)
+static struct snd_soc_dai_link *
+sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
+			  int ssp_codec, int ssp_amp, int ssp_bt,
+			  int dmic_be_num, int hdmi_num)
 {
 	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_dai_link *links;
@@ -561,7 +562,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			}
 			break;
 		case LINK_SPK:
-			ret = create_spk_amp_dai_links(dev, links, cpus, &id, ssp_amp);
+			ret = create_spk_amp_dai_links(dev, links, cpus, &id,
+						       amp_type, ssp_amp);
 			if (ret < 0) {
 				dev_err(dev, "fail to create spk amp dai links, ret %d\n",
 					ret);
@@ -624,6 +626,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	mach = pdev->dev.platform_data;
 
+	ctx->codec_type = sof_ssp_detect_codec_type(&pdev->dev);
+	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
+
 	if (soc_intel_is_glk()) {
 		dmic_be_num = 1;
 		hdmi_num = 3;
@@ -649,13 +654,14 @@ static int sof_audio_probe(struct platform_device *pdev)
 	/* compute number of dai links */
 	sof_audio_card_cs42l42.num_links = 1 + dmic_be_num + hdmi_num;
 
-	if (sof_cs42l42_quirk & SOF_SPEAKER_AMP_PRESENT)
+	if (ctx->amp_type != CODEC_NONE)
 		sof_audio_card_cs42l42.num_links++;
 	if (sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT)
 		sof_audio_card_cs42l42.num_links++;
 
-	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, ssp_amp,
-					      ssp_bt, dmic_be_num, hdmi_num);
+	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
+					      ssp_codec, ssp_amp, ssp_bt,
+					      dmic_be_num, hdmi_num);
 	if (!dai_links)
 		return -ENOMEM;
 
@@ -683,24 +689,18 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "glk_cs4242_mx98357a",
 		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(2) |
-					SOF_SPEAKER_AMP_PRESENT |
-					SOF_MAX98357A_SPEAKER_AMP_PRESENT |
 					SOF_CS42L42_SSP_AMP(1)) |
 					SOF_CS42L42_DAILINK(LINK_SPK, LINK_HP, LINK_DMIC, LINK_HDMI, LINK_NONE),
 	},
 	{
 		.name = "jsl_cs4242_mx98360a",
 		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(0) |
-					SOF_SPEAKER_AMP_PRESENT |
-					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
 					SOF_CS42L42_SSP_AMP(1)) |
 					SOF_CS42L42_DAILINK(LINK_HP, LINK_DMIC, LINK_HDMI, LINK_SPK, LINK_NONE),
 	},
 	{
 		.name = "adl_mx98360a_cs4242",
 		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(0) |
-				SOF_SPEAKER_AMP_PRESENT |
-				SOF_MAX98360A_SPEAKER_AMP_PRESENT |
 				SOF_CS42L42_SSP_AMP(1) |
 				SOF_CS42L42_NUM_HDMIDEV(4) |
 				SOF_BT_OFFLOAD_PRESENT |
@@ -727,3 +727,4 @@ MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
-- 
2.25.1

