Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E08F88C8C8
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:15:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 485F014DD;
	Tue, 26 Mar 2024 17:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 485F014DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469731;
	bh=un6JUsVkZ+4aDf8r/KdzFVrt0MBjo+jMm6gVJfWVgjU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZUc5DoZyAViWp3/5uQb7qvW2UEXzqW3FSYDPee6d51ko+nVi42PCyLRSX4Dr6iL+Y
	 FnKJOg8Bu1PXkDQ5z3FSFPVh2gX56kNeBAqz2u3bPVaWN2xum0O/JaWBeQS2DzUkDc
	 Wht6ZmyurfXszGHHUYffgxe+Z/GHI5VK2+QS78GE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE805F89853; Tue, 26 Mar 2024 17:07:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 729CFF89848;
	Tue, 26 Mar 2024 17:07:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C84E0F80C81; Tue, 26 Mar 2024 17:06:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2857FF80610
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:06:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2857FF80610
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LO6Pc0z/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469162; x=1743005162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=un6JUsVkZ+4aDf8r/KdzFVrt0MBjo+jMm6gVJfWVgjU=;
  b=LO6Pc0z/2uf00MZ26netkZW7bnLqTs9KSE4Yqv0U4WDCNNqOVXeZiYtT
   HMhWqRggDx57g8UJTeERJwiPn8by2fXP5I7WIZ5yXbTBG/pwXIeu08dA8
   SYUpfO7Dfvp3PUgeu+iGFX4j6DuTqFnkhzvof8ppQjwcDuT4FKL+V/I5C
   ZCppS0O2uUcULSlYnHZaHB2wXg0L5Iq8Cd8Yly48tukM+K8Dl2VeVB9nd
   8ailOEhREbMO8t6pH26esk9fIFwaSp2grd6ZXOEXZvwgJTZTTrKeGD8jk
   EnGnurzEn6VKsJRqZfYTZ2fk6CA3WVTDSMWqb8Oy89CenBOaq1ln57zDK
   Q==;
X-CSE-ConnectionGUID: W4MkAYE3RE2yNauAIMUGPg==
X-CSE-MsgGUID: dI2d2ERcSReRjs2ZwgHyfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260588"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260588"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482520"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 34/34] ASoC: Intel: sof_sdw: Add support for cs42l43 optional
 speaker output
Date: Tue, 26 Mar 2024 11:04:29 -0500
Message-Id: <20240326160429.13560-35-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PRHKSOKHSMR5CU746A5MKJ6BBY3HPYPS
X-Message-ID-Hash: PRHKSOKHSMR5CU746A5MKJ6BBY3HPYPS
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PRHKSOKHSMR5CU746A5MKJ6BBY3HPYPS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Add support for the optional speaker output on the cs42l43, this uses
the new SOF_CODEC_SPKR quirk to conditional include the speaker DAI
link. It is worth noting that currently no systems are included that
utilise this feature, but the feature is added as several systems are on
the horizon. As part of this SOF_SDW_MAX_DAI_NUM must be increased, it
is currently 3 but cs42l43 will now have 4 DAI links. This value is
increased to 8 to give some head room for future devices.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c              | 11 +++-
 sound/soc/intel/boards/sof_sdw_common.h       |  9 +++-
 sound/soc/intel/boards/sof_sdw_cs42l43.c      | 50 +++++++++++++++++++
 .../intel/common/soc-acpi-intel-mtl-match.c   |  6 +++
 .../intel/common/soc-acpi-intel-tgl-match.c   |  6 +++
 5 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 4fc15f597e28..b94835448b1b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1016,8 +1016,17 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_JACK_IN_DAI_ID},
 			},
+			{
+				.direction = {true, false},
+				.dai_name = "cs42l43-dp6",
+				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.init = sof_sdw_cs42l43_spk_init,
+				.rtd_init = cs42l43_spk_rtd_init,
+				.quirk = SOF_CODEC_SPKR,
+			},
 		},
-		.dai_num = 3,
+		.dai_num = 4,
 	},
 	{
 		.part_id = 0xaaaa, /* generic codec mockup */
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 81181627b406..8468487a6bd6 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -66,7 +66,7 @@ enum {
 #define SOF_SDW_DAI_TYPE_AMP		1
 #define SOF_SDW_DAI_TYPE_MIC		2
 
-#define SOF_SDW_MAX_DAI_NUM		3
+#define SOF_SDW_MAX_DAI_NUM		8
 
 struct sof_sdw_codec_info;
 
@@ -162,6 +162,12 @@ int sof_sdw_maxim_init(struct snd_soc_card *card,
 		       struct sof_sdw_codec_info *info,
 		       bool playback);
 
+/* CS42L43 support */
+int sof_sdw_cs42l43_spk_init(struct snd_soc_card *card,
+			     struct snd_soc_dai_link *dai_links,
+			     struct sof_sdw_codec_info *info,
+			     bool playback);
+
 /* CS AMP support */
 int sof_sdw_cs_amp_init(struct snd_soc_card *card,
 			struct snd_soc_dai_link *dai_links,
@@ -172,6 +178,7 @@ int sof_sdw_cs_amp_init(struct snd_soc_card *card,
 
 int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index a9b6edac2ecd..5361249f0f53 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -30,6 +30,17 @@ static const struct snd_soc_dapm_route cs42l43_hs_map[] = {
 	{ "cs42l43 ADC1_IN1_N", NULL, "Headset Mic" },
 };
 
+static const struct snd_soc_dapm_widget cs42l43_spk_widgets[] = {
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+static const struct snd_soc_dapm_route cs42l43_spk_map[] = {
+	{ "Speaker", NULL, "cs42l43 AMP1_OUT_P", },
+	{ "Speaker", NULL, "cs42l43 AMP1_OUT_N", },
+	{ "Speaker", NULL, "cs42l43 AMP2_OUT_P", },
+	{ "Speaker", NULL, "cs42l43 AMP2_OUT_N", },
+};
+
 static const struct snd_soc_dapm_widget cs42l43_dmic_widgets[] = {
 	SND_SOC_DAPM_MIC("DMIC", NULL),
 };
@@ -108,6 +119,45 @@ int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
+int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s spk:cs42l43-spk",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, cs42l43_spk_widgets,
+					ARRAY_SIZE(cs42l43_spk_widgets));
+	if (ret) {
+		dev_err(card->dev, "cs42l43 speaker widgets addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l43_spk_map,
+				      ARRAY_SIZE(cs42l43_spk_map));
+	if (ret)
+		dev_err(card->dev, "cs42l43 speaker map addition failed: %d\n", ret);
+
+	return ret;
+}
+
+int sof_sdw_cs42l43_spk_init(struct snd_soc_card *card,
+			     struct snd_soc_dai_link *dai_links,
+			     struct sof_sdw_codec_info *info,
+			     bool playback)
+{
+	/* Do init on playback link only. */
+	if (!playback)
+		return 0;
+
+	info->amp_num++;
+
+	return 0;
+}
+
 int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 7e53266d831d..27d1313e6686 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -357,6 +357,12 @@ static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
 		.group_position = 0,
 		.group_id = 0,
 	},
+	{ /* Speaker Playback Endpoint */
+		.num = 3,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
 };
 
 static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 0cef3d788a5b..77226d1eb1cf 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -433,6 +433,12 @@ static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
 		.group_position = 0,
 		.group_id = 0,
 	},
+	{ /* Speaker Playback Endpoint */
+		.num = 3,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
 };
 
 static const struct snd_soc_acpi_adr_device cs42l43_3_adr[] = {
-- 
2.40.1

