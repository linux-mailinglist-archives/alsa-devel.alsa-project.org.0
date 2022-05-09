Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2C6520355
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 19:11:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22E1918F8;
	Mon,  9 May 2022 19:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22E1918F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652116276;
	bh=pMc64CwBnYTK9GQGniGRHQmgz7uvZzAjPpmPxgF0bqk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N5tslanh1Aq8wfd/hrqEEtFflgEM5U5pqNbnZuoQpuZzI8gkPA7WTGPw55lcJeQHh
	 ejcDiNfQT55p12rbVnmiRUteNkLHy+5S6XgZ21r+Z0zCwb5oZlIClKawXujqE5aHwr
	 P98bKvahvHqTIllNdn69xfNRwv6Om7cg7v7qnecQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 139B3F80269;
	Mon,  9 May 2022 19:09:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AD96F804A9; Mon,  9 May 2022 19:09:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B516AF8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 19:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B516AF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aCB+/1AY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652116190; x=1683652190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pMc64CwBnYTK9GQGniGRHQmgz7uvZzAjPpmPxgF0bqk=;
 b=aCB+/1AYcvquoeSuY7cvfVEuXIFq4IPehtEhVY/GYLRmBGh89QuhAjIC
 NdOPQH6voE5ZKDF9KU+2B0EoH3YlnLtymwWPw/Mv/AWXvB4T9Ig4x6flt
 g6X/1v335qVJnhPYfQBPG0yd1HQy0RYv0IJHAU+VCvZJig5NHc+rT/4Cy
 J4FwCFm3+zbX0/qCG6al9debiJ3GsXc8myTTDfPk+UfdZbNzKEOwK8cex
 3rZ3HnhZh4DF0f255uff4xHBuRlQbQ5AfoUNJCoOITzFwR6VYza6TwF3p
 m6MymoGr5GgoEnIGy9x3reiWfcAsARszTLH38ymU2jqnRMVJ6vFIxqf/S Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="266701900"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="266701900"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 10:09:31 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="592909285"
Received: from mkarkhan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.61.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 10:09:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: Intel: sof_rt5682: Add support for
 adl_rt1019_rt5682s
Date: Mon,  9 May 2022 12:09:20 -0500
Message-Id: <20220509170922.54868-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220509170922.54868-1-pierre-louis.bossart@linux.intel.com>
References: <20220509170922.54868-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Brent Lu <brent.lu@intel.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
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

From: Vamshi Krishna <vamshi.krishna.gopal@intel.com>

This patch adds the driver data for two rt1019 speaker amplifiers on
SSP1 and rt5682s on SSP0 for ADL platform

Reviewed-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Vamshi Krishna <vamshi.krishna.gopal@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_realtek_common.c   | 39 +++++++++++++++++++
 sound/soc/intel/boards/sof_realtek_common.h   |  5 +++
 sound/soc/intel/boards/sof_rt5682.c           | 13 +++++++
 .../intel/common/soc-acpi-intel-adl-match.c   |  7 ++++
 4 files changed, 64 insertions(+)

diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index a2bcbeee02162..2ab568c1d40ba 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -459,5 +459,44 @@ void sof_rt1308_dai_link(struct snd_soc_dai_link *link)
 }
 EXPORT_SYMBOL_NS(sof_rt1308_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
+/*
+ * 2-amp Configuration for RT1019
+ */
+
+static const struct snd_soc_dapm_route rt1019_dapm_routes[] = {
+	/* speaker */
+	{ "Left Spk", NULL, "Speaker" },
+	{ "Right Spk", NULL, "Speaker" },
+};
+
+static struct snd_soc_dai_link_component rt1019_components[] = {
+	{
+		.name = RT1019_DEV0_NAME,
+		.dai_name = RT1019_CODEC_DAI,
+	},
+};
+
+static int rt1019_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt1019_dapm_routes,
+				      ARRAY_SIZE(rt1019_dapm_routes));
+	if (ret) {
+		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
+		return ret;
+	}
+	return ret;
+}
+
+void sof_rt1019_dai_link(struct snd_soc_dai_link *link)
+{
+	link->codecs = rt1019_components;
+	link->num_codecs = ARRAY_SIZE(rt1019_components);
+	link->init = rt1019_init;
+}
+EXPORT_SYMBOL_NS(sof_rt1019_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Realtek helpers");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
index e0a5518e8dd25..ec3eea633e048 100644
--- a/sound/soc/intel/boards/sof_realtek_common.h
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -39,4 +39,9 @@ void sof_rt1015_codec_conf(struct snd_soc_card *card);
 #define RT1308_DEV0_NAME	"i2c-10EC1308:00"
 void sof_rt1308_dai_link(struct snd_soc_dai_link *link);
 
+#define RT1019_CODEC_DAI	"HiFi"
+#define RT1019_DEV0_NAME	"RTL1019:00"
+
+void sof_rt1019_dai_link(struct snd_soc_dai_link *link);
+
 #endif /* __SOF_REALTEK_COMMON_H */
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index e926d06b35292..5d67a2c87a1d4 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -60,6 +60,7 @@
 #define SOF_RT5682S_HEADPHONE_CODEC_PRESENT	BIT(23)
 #define SOF_MAX98390_SPEAKER_AMP_PRESENT	BIT(24)
 #define SOF_MAX98390_TWEETER_SPEAKER_PRESENT	BIT(25)
+#define SOF_RT1019_SPEAKER_AMP_PRESENT	BIT(26)
 
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
@@ -733,6 +734,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 					SOF_RT1015_SPEAKER_AMP_100FS) ? 100 : 64);
 		} else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT) {
 			sof_rt1015p_dai_link(&links[id]);
+		} else if (sof_rt5682_quirk & SOF_RT1019_SPEAKER_AMP_PRESENT) {
+			sof_rt1019_dai_link(&links[id]);
 		} else if (sof_rt5682_quirk &
 				SOF_MAX98373_SPEAKER_AMP_PRESENT) {
 			links[id].codecs = max_98373_components;
@@ -1070,6 +1073,16 @@ static const struct platform_device_id board_ids[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "adl_rt1019_rt5682s",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_RT5682S_HEADPHONE_CODEC_PRESENT |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT1019_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1) |
+					SOF_RT5682_NUM_HDMIDEV(4)),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 8bfe7070b84a1..e6e52c7b68033 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -455,6 +455,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_max98360a_amp,
 		.sof_tplg_filename = "sof-adl-mx98360a-nau8825.tplg",
 	},
+	{
+		.id = "RTL5682",
+		.drv_name = "adl_rt1019_rt5682s",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_rt1019p_amp,
+		.sof_tplg_filename = "sof-adl-rt1019-rt5682.tplg",
+	},
 	{
 		.id = "10508825",
 		.drv_name = "sof_nau8825",
-- 
2.30.2

