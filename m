Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 951318B3B55
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:26:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14393F53;
	Fri, 26 Apr 2024 17:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14393F53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145191;
	bh=cQQ3/xSHxAwFaRMgLs/efEz09xsEo6FvKpnrVRkCnkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hY7qBs77DZZUSFaRd2vEFiO7MupEsZVnNM2mGtYzWNtECMceZFWSv99gSku4Tg7UM
	 9rIhYyD4e2fQ2SWsq5E1YvMjtRe1kaj0ZgR6LlwVPqKLtSnipnmDXrA8FzaTSf9B0D
	 TwAlEFetnvBRGCaEhpc5Y3CxdWm722aQmfQxqdU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04C9DF805D6; Fri, 26 Apr 2024 17:25:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41752F805E5;
	Fri, 26 Apr 2024 17:25:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 978F2F80588; Fri, 26 Apr 2024 17:25:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05A31F800B5
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05A31F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kulRFqOy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145143; x=1745681143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cQQ3/xSHxAwFaRMgLs/efEz09xsEo6FvKpnrVRkCnkE=;
  b=kulRFqOyZLMg0LoppgbKzYByFZM2chhQMYvm0FRM8enRKp205uXB3nWr
   bvQGlpUMtzG1m3qCcijDiiALLoKriSfQK7g17keUtgXb3JCE4Zft+FG5s
   FVEOodaP5HGp8xvH/bubW0Q/rZ1qnkcsOOE+OkwPUsUSqNqXCBHDFOUFj
   J4jQJDbYzBbRtfvFB3ydSbqdmEWFMzexPoMfTWYutF/YWm4q/RtsRjrcx
   e1YKwVaCMMXfj8Yz9NRvJyv0H8BZCpLwhK5tqCps/eLs74VS0/cMC/hCf
   1bDJBMWxQC75TC9zCay8uA5hHj/plQ7UBJ/BF72KSjfK4ijUEi87g3xPs
   w==;
X-CSE-ConnectionGUID: rCT+hjbNRbaMPVb5BDxfXw==
X-CSE-MsgGUID: RIAuH0scR3qEP4+CMQfJJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291270"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291270"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:39 -0700
X-CSE-ConnectionGUID: jRxkH/CPS52wQyl+2iAS6A==
X-CSE-MsgGUID: 2ykL97DBT8qj6c7Dr9Wc7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259531"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 01/23] ASoC: Intel: nau8825/rt5682: move speaker widget to
 common modules
Date: Fri, 26 Apr 2024 10:25:07 -0500
Message-Id: <20240426152529.38345-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JRAATIA5QCXMTPKWFAZSR7YXSSTJQD23
X-Message-ID-Hash: JRAATIA5QCXMTPKWFAZSR7YXSSTJQD23
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JRAATIA5QCXMTPKWFAZSR7YXSSTJQD23/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Two machine drivers sof_rt5682 and sof_nau8825 always register two
speaker widgets 'Left Spk' and 'Right Spk' regardless the actual
number of speakers. Move the widget registration to speaker common
modules to avoid useless speaker widgets for 1 or 4 speaker boards.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c   | 66 ++++++++++++++-
 sound/soc/intel/boards/sof_nau8825.c        |  4 -
 sound/soc/intel/boards/sof_realtek_common.c | 93 ++++++++++++++++++++-
 sound/soc/intel/boards/sof_rt5682.c         | 32 +++++--
 4 files changed, 180 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index cf2974718271..53c7392bf3dd 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -12,6 +12,20 @@
 #include <uapi/sound/asound.h>
 #include "sof_maxim_common.h"
 
+/*
+ * Common structures and functions
+ */
+static const struct snd_kcontrol_new maxim_2spk_kcontrols[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+
+};
+
+static const struct snd_soc_dapm_widget maxim_2spk_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+};
+
 /* helper function to get the number of specific codec */
 static unsigned int get_num_codecs(const char *hid)
 {
@@ -135,12 +149,40 @@ EXPORT_SYMBOL_NS(max_98373_ops, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	unsigned int num_codecs = get_num_codecs(MAX_98373_ACPI_HID);
 	int ret;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, max_98373_dapm_routes,
-				      ARRAY_SIZE(max_98373_dapm_routes));
-	if (ret)
-		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
+	switch (num_codecs) {
+	case 2:
+		ret = snd_soc_dapm_new_controls(&card->dapm, maxim_2spk_widgets,
+						ARRAY_SIZE(maxim_2spk_widgets));
+		if (ret) {
+			dev_err(rtd->dev, "fail to add max98373 widgets, ret %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = snd_soc_add_card_controls(card, maxim_2spk_kcontrols,
+						ARRAY_SIZE(maxim_2spk_kcontrols));
+		if (ret) {
+			dev_err(rtd->dev, "fail to add max98373 kcontrols, ret %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = snd_soc_dapm_add_routes(&card->dapm, max_98373_dapm_routes,
+					      ARRAY_SIZE(max_98373_dapm_routes));
+		if (ret) {
+			dev_err(rtd->dev, "fail to add max98373 routes, ret %d\n",
+				ret);
+			return ret;
+		}
+		break;
+	default:
+		dev_err(rtd->dev, "max98373: invalid num_codecs %d\n", num_codecs);
+		return -EINVAL;
+	}
+
 	return ret;
 }
 EXPORT_SYMBOL_NS(max_98373_spk_codec_init, SND_SOC_INTEL_SOF_MAXIM_COMMON);
@@ -287,6 +329,22 @@ static int max_98390_init(struct snd_soc_pcm_runtime *rtd)
 		fallthrough;
 	case 2:
 		/* add regular speakers dapm route */
+		ret = snd_soc_dapm_new_controls(&card->dapm, maxim_2spk_widgets,
+						ARRAY_SIZE(maxim_2spk_widgets));
+		if (ret) {
+			dev_err(rtd->dev, "fail to add max98390 woofer widgets, ret %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = snd_soc_add_card_controls(card, maxim_2spk_kcontrols,
+						ARRAY_SIZE(maxim_2spk_kcontrols));
+		if (ret) {
+			dev_err(rtd->dev, "fail to add max98390 woofer kcontrols, ret %d\n",
+				ret);
+			return ret;
+		}
+
 		ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_dapm_routes,
 					      ARRAY_SIZE(max_98390_dapm_routes));
 		if (ret) {
diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index fe5f9e8dd652..dd4dc4ec4255 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -140,15 +140,11 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 static const struct snd_kcontrol_new sof_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("Left Spk"),
-	SOC_DAPM_PIN_SWITCH("Right Spk"),
 };
 
 static const struct snd_soc_dapm_widget sof_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_SPK("Left Spk", NULL),
-	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
 static const struct snd_soc_dapm_route sof_map[] = {
diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index 20d094c52d28..cb1c21d822f6 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -21,6 +21,17 @@
 /*
  * Common structures and functions
  */
+static const struct snd_kcontrol_new realtek_2spk_kcontrols[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+
+};
+
+static const struct snd_soc_dapm_widget realtek_2spk_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+};
+
 static const struct snd_kcontrol_new realtek_4spk_kcontrols[] = {
 	SOC_DAPM_PIN_SWITCH("WL Ext Spk"),
 	SOC_DAPM_PIN_SWITCH("WR Ext Spk"),
@@ -181,6 +192,22 @@ static int rt1011_init(struct snd_soc_pcm_runtime *rtd)
 	switch (num_codecs) {
 	case 2:
 		if (!soc_intel_is_cml()) {
+			ret = snd_soc_dapm_new_controls(&card->dapm, realtek_2spk_widgets,
+							ARRAY_SIZE(realtek_2spk_widgets));
+			if (ret) {
+				dev_err(rtd->dev, "fail to add rt1011 widgets, ret %d\n",
+					ret);
+				return ret;
+			}
+
+			ret = snd_soc_add_card_controls(card, realtek_2spk_kcontrols,
+							ARRAY_SIZE(realtek_2spk_kcontrols));
+			if (ret) {
+				dev_err(rtd->dev, "fail to add rt1011 kcontrols, ret %d\n",
+					ret);
+				return ret;
+			}
+
 			ret = snd_soc_dapm_add_routes(&card->dapm, speaker_map_lr,
 						      ARRAY_SIZE(speaker_map_lr));
 			if (ret) {
@@ -357,6 +384,20 @@ static int rt1015p_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card = rtd->card;
 	int ret;
 
+	ret = snd_soc_dapm_new_controls(&card->dapm, realtek_2spk_widgets,
+					ARRAY_SIZE(realtek_2spk_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "fail to add rt1015p widgets, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, realtek_2spk_kcontrols,
+					ARRAY_SIZE(realtek_2spk_kcontrols));
+	if (ret) {
+		dev_err(rtd->dev, "fail to add rt1015p kcontrols, ret %d\n", ret);
+		return ret;
+	}
+
 	if (rt1015p_get_num_codecs() == 1)
 		ret = snd_soc_dapm_add_routes(&card->dapm, rt1015p_1dev_dapm_routes,
 					      ARRAY_SIZE(rt1015p_1dev_dapm_routes));
@@ -486,8 +527,42 @@ static struct snd_soc_dai_link_component rt1015_components[] = {
 
 static int speaker_codec_init_lr(struct snd_soc_pcm_runtime *rtd)
 {
-	return snd_soc_dapm_add_routes(&rtd->card->dapm, speaker_map_lr,
-					ARRAY_SIZE(speaker_map_lr));
+	struct snd_soc_card *card = rtd->card;
+	unsigned int num_codecs = get_num_codecs(RT1015_ACPI_HID);
+	int ret;
+
+	switch (num_codecs) {
+	case 2:
+		ret = snd_soc_dapm_new_controls(&card->dapm, realtek_2spk_widgets,
+						ARRAY_SIZE(realtek_2spk_widgets));
+		if (ret) {
+			dev_err(rtd->dev, "fail to add rt1015 widgets, ret %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = snd_soc_add_card_controls(card, realtek_2spk_kcontrols,
+						ARRAY_SIZE(realtek_2spk_kcontrols));
+		if (ret) {
+			dev_err(rtd->dev, "fail to add rt1015 kcontrols, ret %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = snd_soc_dapm_add_routes(&rtd->card->dapm, speaker_map_lr,
+					      ARRAY_SIZE(speaker_map_lr));
+		if (ret) {
+			dev_err(rtd->dev, "fail to add rt1015 routes, ret %d\n",
+				ret);
+			return ret;
+		}
+		break;
+	default:
+		dev_err(rtd->dev, "rt1015: invalid num_codecs %d\n", num_codecs);
+		return -EINVAL;
+	}
+
+	return ret;
 }
 
 void sof_rt1015_codec_conf(struct snd_soc_card *card)
@@ -624,6 +699,20 @@ static int rt1019p_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card = rtd->card;
 	int ret;
 
+	ret = snd_soc_dapm_new_controls(&card->dapm, realtek_2spk_widgets,
+					ARRAY_SIZE(realtek_2spk_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "fail to add rt1019p widgets, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, realtek_2spk_kcontrols,
+					ARRAY_SIZE(realtek_2spk_kcontrols));
+	if (ret) {
+		dev_err(rtd->dev, "fail to add rt1019p kcontrols, ret %d\n", ret);
+		return ret;
+	}
+
 	ret = snd_soc_dapm_add_routes(&card->dapm, rt1019p_dapm_routes,
 				      ARRAY_SIZE(rt1019p_dapm_routes));
 	if (ret) {
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 062012de3de2..1e70ce469650 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -431,16 +431,11 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 static const struct snd_kcontrol_new sof_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("Left Spk"),
-	SOC_DAPM_PIN_SWITCH("Right Spk"),
-
 };
 
 static const struct snd_soc_dapm_widget sof_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_SPK("Left Spk", NULL),
-	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
 static const struct snd_soc_dapm_route sof_map[] = {
@@ -452,6 +447,17 @@ static const struct snd_soc_dapm_route sof_map[] = {
 	{ "IN1P", NULL, "Headset Mic" },
 };
 
+static const struct snd_kcontrol_new rt5650_spk_kcontrols[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+
+};
+
+static const struct snd_soc_dapm_widget rt5650_spk_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+};
+
 static const struct snd_soc_dapm_route rt5650_spk_dapm_routes[] = {
 	/* speaker */
 	{ "Left Spk", NULL, "SPOL" },
@@ -463,6 +469,22 @@ static int rt5650_spk_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card = rtd->card;
 	int ret;
 
+	ret = snd_soc_dapm_new_controls(&card->dapm, rt5650_spk_widgets,
+					ARRAY_SIZE(rt5650_spk_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "fail to add rt5650 spk widgets, ret %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, rt5650_spk_kcontrols,
+					ARRAY_SIZE(rt5650_spk_kcontrols));
+	if (ret) {
+		dev_err(rtd->dev, "fail to add rt5650 spk kcontrols, ret %d\n",
+			ret);
+		return ret;
+	}
+
 	ret = snd_soc_dapm_add_routes(&card->dapm, rt5650_spk_dapm_routes,
 				      ARRAY_SIZE(rt5650_spk_dapm_routes));
 	if (ret)
-- 
2.40.1

