Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C978C1319
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:37:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F693E80;
	Thu,  9 May 2024 18:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F693E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272676;
	bh=/M2W1EKbKVeI74NfZtWa2d59GLcFZspImbuv/O3J74U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zq0in4JQ5AjRumyHdNPIPBvMbLcZHv6LvPqof4hbt9kPfSlxdtLPs6GMts9qjsxwp
	 wjBK8ctigejSU5qht1nU42gn4VQr17XI8mk1kpxnf282077R2lAttk0nLaK/pf1hKR
	 /CGDcqMUm8SRP0jO7W/YLc3rQPWP+lYXx5+BFLIE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1374DF806E2; Thu,  9 May 2024 18:35:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35387F80727;
	Thu,  9 May 2024 18:35:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B67B9F805C7; Thu,  9 May 2024 18:34:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA974F80571
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA974F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=H+rry87T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272481; x=1746808481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/M2W1EKbKVeI74NfZtWa2d59GLcFZspImbuv/O3J74U=;
  b=H+rry87TYyEBvou3E7fpP4kTB892k1aAeO+TnqpDqTMswdqI0ezyeK1n
   ezkcztoYHNj9o3rgsdlrpCbJ9QPvlmieuDouDV4nXlU3H+9WWbAfSVbX3
   uQq82ChhMGucYjo2aBdQ4aG+AaMZ28fQ6wnbfvJJCzICU4toRmu8v8iIg
   SJ0ZZ/OfYHt9U66KppocTTV1ocp3dPH27++2D77VmsZ49A2bkB6kIDT/y
   HO1AZ5zobRSLTfx4fOuPc0BiGop2l/y9+nXZPKDVBHCr/Q+d/eTK6Q41M
   N7sPWSLfBnvNyAGXNoozNLnkJ1m8ldReEGbDhI4EdmehNd72AGK5R4W2D
   A==;
X-CSE-ConnectionGUID: f7oxznNtT8mCmNwrx62kyQ==
X-CSE-MsgGUID: 8+/L+3vmQ3WzvD4SZzQagg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017589"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="15017589"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:32 -0700
X-CSE-ConnectionGUID: ndmaRf11STioyZmS7UxTow==
X-CSE-MsgGUID: rnAMvkvvQuifLR2qxG8BOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="33761037"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 12/18] ASoC: Intel: maxim-common: change max98373 data to
 static
Date: Thu,  9 May 2024 11:34:12 -0500
Message-Id: <20240509163418.67746-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RC6365DETD3PFQGCNASQDFCUK4FVHT2D
X-Message-ID-Hash: RC6365DETD3PFQGCNASQDFCUK4FVHT2D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RC6365DETD3PFQGCNASQDFCUK4FVHT2D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Since there is dai link helper max_98373_dai_link, we could change all
functions and data of max98373 to static.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 18 ++++++++----------
 sound/soc/intel/boards/sof_maxim_common.h |  6 ------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index c38c5598d87f..6c40ecc04723 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -39,14 +39,16 @@ static unsigned int get_num_codecs(const char *hid)
 	return dev_num;
 }
 
+/*
+ * Maxim MAX98373
+ */
 #define MAX_98373_PIN_NAME 16
 
-const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
+static const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
 	/* speaker */
 	{ "Left Spk", NULL, "Left BE_OUT" },
 	{ "Right Spk", NULL, "Right BE_OUT" },
 };
-EXPORT_SYMBOL_NS(max_98373_dapm_routes, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
 static struct snd_soc_codec_conf max_98373_codec_conf[] = {
 	{
@@ -59,7 +61,7 @@ static struct snd_soc_codec_conf max_98373_codec_conf[] = {
 	},
 };
 
-struct snd_soc_dai_link_component max_98373_components[] = {
+static struct snd_soc_dai_link_component max_98373_components[] = {
 	{  /* For Right */
 		.name = MAX_98373_DEV0_NAME,
 		.dai_name = MAX_98373_CODEC_DAI,
@@ -69,7 +71,6 @@ struct snd_soc_dai_link_component max_98373_components[] = {
 		.dai_name = MAX_98373_CODEC_DAI,
 	},
 };
-EXPORT_SYMBOL_NS(max_98373_components, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
 static int max_98373_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
@@ -96,7 +97,7 @@ static int max_98373_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-int max_98373_trigger(struct snd_pcm_substream *substream, int cmd)
+static int max_98373_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
@@ -139,15 +140,13 @@ int max_98373_trigger(struct snd_pcm_substream *substream, int cmd)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(max_98373_trigger, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
-struct snd_soc_ops max_98373_ops = {
+static const struct snd_soc_ops max_98373_ops = {
 	.hw_params = max_98373_hw_params,
 	.trigger = max_98373_trigger,
 };
-EXPORT_SYMBOL_NS(max_98373_ops, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
-int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
+static int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	unsigned int num_codecs = get_num_codecs(MAX_98373_ACPI_HID);
@@ -186,7 +185,6 @@ int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(max_98373_spk_codec_init, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
 void max_98373_dai_link(struct device *dev, struct snd_soc_dai_link *link)
 {
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index 2d8257cc5229..3d34c7dae6f5 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -20,14 +20,8 @@
 #define MAX_98373_DEV0_NAME	"i2c-" MAX_98373_ACPI_HID ":00"
 #define MAX_98373_DEV1_NAME	"i2c-" MAX_98373_ACPI_HID ":01"
 
-extern struct snd_soc_dai_link_component max_98373_components[2];
-extern struct snd_soc_ops max_98373_ops;
-extern const struct snd_soc_dapm_route max_98373_dapm_routes[];
-
-int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
 void max_98373_dai_link(struct device *dev, struct snd_soc_dai_link *link);
 void max_98373_set_codec_conf(struct snd_soc_card *card);
-int max_98373_trigger(struct snd_pcm_substream *substream, int cmd);
 
 /*
  * Maxim MAX98390
-- 
2.40.1

