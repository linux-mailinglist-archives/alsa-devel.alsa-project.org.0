Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7F08A21C3
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 00:33:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D00AF2BF1;
	Fri, 12 Apr 2024 00:33:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D00AF2BF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712874821;
	bh=wBjDQokRYtq31R2Ea4yafBKooKGT/vw7/VmQBBy8a+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SUEzlV13g4a7yi9kMdSZlfcdVu2OfowIwPCUQi1OW4tI1A/bJEkilmojsaiHJii4b
	 1YJ9rLninQASsyKDTDaMVlYGh3uP2ANQoA7H4uaaLfdg28B37Y2loT0J/cCK5e/J8F
	 ff2uPjEV4NAcJ0mPkwvo/CC1QsWvMlpmH3vUNnnU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E247DF8068D; Fri, 12 Apr 2024 00:32:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B2D3F80685;
	Fri, 12 Apr 2024 00:32:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D567F80238; Fri, 12 Apr 2024 00:16:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96CD6F80570
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 00:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96CD6F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LlXT5lXu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873069; x=1744409069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wBjDQokRYtq31R2Ea4yafBKooKGT/vw7/VmQBBy8a+4=;
  b=LlXT5lXujGluigUrULDNszx9Z2WzsYquy6ho2j8XwHvUuZCXaPkZQGqM
   B+RPadawkRBIewLTyvHMlIBVvmKYdVR13KgrJH42iJVJ8y8YoEvFj/nkY
   jzGJTK8dQYzOM2W2obrnGJv5BK5ugUHsM/TgWgQXt+vwgDIqyHF8Sj4QN
   DKsNDu5IMghargFmRQZpDVNrtNNOFLgO9eJ4QGGUCaSSx1Swy7+b72Lgz
   VZsfgKhEoPA+Ns3S4gHSlcOshqiTBYhIugAyTP0Om/AgEd1LnxoAjV5Wc
   04SvamvJ7NN1oI+3NzAeQ0oTMLxFw0EA5njuo6I3jugmUji2H8HFqGA8H
   g==;
X-CSE-ConnectionGUID: pMwSHsKXQFGJeyzbsCMMkg==
X-CSE-MsgGUID: 0O51oSxMSSKfJE/0fjeItA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708377"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="19708377"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:18 -0700
X-CSE-ConnectionGUID: VTGykaW1Qj2E315oyOi9Xw==
X-CSE-MsgGUID: XskPlUCcQ326x8vZdb6RLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="21628760"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/12] ASoC: Intel: sof_realtek_common: support 4xALC1011
 amplifier
Date: Thu, 11 Apr 2024 17:03:44 -0500
Message-Id: <20240411220347.131267-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N3L5CHAPXNW4K7UKRPNKN3Z6EFPS5HTC
X-Message-ID-Hash: N3L5CHAPXNW4K7UKRPNKN3Z6EFPS5HTC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N3L5CHAPXNW4K7UKRPNKN3Z6EFPS5HTC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add support for boards with four ALC1011 amplifiers. Configuration is
copied from cml_rt1011_rt5682 machine driver for backward
compatibility with existing cml devices.

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_realtek_common.c | 178 +++++++++++++++++---
 sound/soc/intel/boards/sof_realtek_common.h |   4 +-
 sound/soc/intel/boards/sof_rt5682.c         |   4 +-
 3 files changed, 162 insertions(+), 24 deletions(-)

diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index 80c8687cd1da..20d094c52d28 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -15,10 +15,40 @@
 #include "../../codecs/rt1011.h"
 #include "../../codecs/rt1015.h"
 #include "../../codecs/rt1308.h"
+#include "../common/soc-intel-quirks.h"
 #include "sof_realtek_common.h"
 
 /*
- * Current only 2-amp configuration is supported for rt1011
+ * Common structures and functions
+ */
+static const struct snd_kcontrol_new realtek_4spk_kcontrols[] = {
+	SOC_DAPM_PIN_SWITCH("WL Ext Spk"),
+	SOC_DAPM_PIN_SWITCH("WR Ext Spk"),
+	SOC_DAPM_PIN_SWITCH("TL Ext Spk"),
+	SOC_DAPM_PIN_SWITCH("TR Ext Spk"),
+};
+
+static const struct snd_soc_dapm_widget realtek_4spk_widgets[] = {
+	SND_SOC_DAPM_SPK("WL Ext Spk", NULL),
+	SND_SOC_DAPM_SPK("WR Ext Spk", NULL),
+	SND_SOC_DAPM_SPK("TL Ext Spk", NULL),
+	SND_SOC_DAPM_SPK("TR Ext Spk", NULL),
+};
+
+/* helper function to get the number of specific codec */
+static unsigned int get_num_codecs(const char *hid)
+{
+	struct acpi_device *adev;
+	unsigned int dev_num = 0;
+
+	for_each_acpi_dev_match(adev, hid, NULL, -1)
+		dev_num++;
+
+	return dev_num;
+}
+
+/*
+ * Realtek ALC1011
  */
 static const struct snd_soc_dapm_route speaker_map_lr[] = {
 	/* speaker */
@@ -26,16 +56,14 @@ static const struct snd_soc_dapm_route speaker_map_lr[] = {
 	{ "Right Spk", NULL, "Right SPO" },
 };
 
-/*
- * Make sure device's Unique ID follows this configuration:
- *
- * Two speakers:
- *         0: left, 1: right
- * Four speakers:
- *         0: Woofer left, 1: Woofer right
- *         2: Tweeter left, 3: Tweeter right
- */
-static struct snd_soc_codec_conf rt1011_codec_confs[] = {
+static const struct snd_soc_dapm_route rt1011_4spk_routes[] = {
+	{"WL Ext Spk", NULL, "WL SPO" },
+	{"WR Ext Spk", NULL, "WR SPO" },
+	{"TL Ext Spk", NULL, "TL SPO" },
+	{"TR Ext Spk", NULL, "TR SPO" },
+};
+
+static struct snd_soc_codec_conf rt1011_2spk_codec_confs[] = {
 	{
 		.dlc = COMP_CODEC_CONF(RT1011_DEV0_NAME),
 		.name_prefix = "Left",
@@ -46,6 +74,25 @@ static struct snd_soc_codec_conf rt1011_codec_confs[] = {
 	},
 };
 
+static struct snd_soc_codec_conf rt1011_4spk_codec_confs[] = {
+	{
+		.dlc = COMP_CODEC_CONF(RT1011_DEV0_NAME),
+		.name_prefix = "WL",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(RT1011_DEV1_NAME),
+		.name_prefix = "WR",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(RT1011_DEV2_NAME),
+		.name_prefix = "TL",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(RT1011_DEV3_NAME),
+		.name_prefix = "TR",
+	},
+};
+
 static struct snd_soc_dai_link_component rt1011_dai_link_components[] = {
 	{
 		.name = RT1011_DEV0_NAME,
@@ -55,6 +102,14 @@ static struct snd_soc_dai_link_component rt1011_dai_link_components[] = {
 		.name = RT1011_DEV1_NAME,
 		.dai_name = RT1011_CODEC_DAI,
 	},
+	{
+		.name = RT1011_DEV2_NAME,
+		.dai_name = RT1011_CODEC_DAI,
+	},
+	{
+		.name = RT1011_DEV3_NAME,
+		.dai_name = RT1011_CODEC_DAI,
+	},
 };
 
 static const struct {
@@ -63,6 +118,8 @@ static const struct {
 } rt1011_tdm_mask[] = {
 	{.tx = 0x4, .rx = 0x1},
 	{.tx = 0x8, .rx = 0x2},
+	{.tx = 0x1, .rx = 0x1},
+	{.tx = 0x2, .rx = 0x2},
 };
 
 static int rt1011_hw_params(struct snd_pcm_substream *substream,
@@ -118,28 +175,109 @@ static const struct snd_soc_ops rt1011_ops = {
 static int rt1011_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	unsigned int num_codecs = get_num_codecs(RT1011_ACPI_HID);
 	int ret;
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, speaker_map_lr,
-				      ARRAY_SIZE(speaker_map_lr));
-	if (ret)
-		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
+	switch (num_codecs) {
+	case 2:
+		if (!soc_intel_is_cml()) {
+			ret = snd_soc_dapm_add_routes(&card->dapm, speaker_map_lr,
+						      ARRAY_SIZE(speaker_map_lr));
+			if (ret) {
+				dev_err(rtd->dev, "fail to add rt1011 routes, ret %d\n",
+					ret);
+				return ret;
+			}
+
+			break;
+		}
+
+		/*
+		 * register speaker widgets "WL Ext Spk" and "WR Ext Spk" to
+		 * keep backward compatible with cml devices
+		 */
+		fallthrough;
+	case 4:
+		ret = snd_soc_dapm_new_controls(&card->dapm, realtek_4spk_widgets,
+						num_codecs);
+		if (ret) {
+			dev_err(rtd->dev, "fail to add rt1011 widgets, ret %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = snd_soc_add_card_controls(card, realtek_4spk_kcontrols,
+						num_codecs);
+		if (ret) {
+			dev_err(rtd->dev, "fail to add rt1011 controls, ret %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = snd_soc_dapm_add_routes(&card->dapm, rt1011_4spk_routes,
+					      num_codecs);
+		if (ret) {
+			dev_err(rtd->dev, "fail to add rt1011 routes, ret %d\n",
+				ret);
+			return ret;
+		}
+		break;
+	default:
+		dev_err(rtd->dev, "rt1011: invalid num_codecs %d\n", num_codecs);
+		return -EINVAL;
+	}
+
 	return ret;
 }
 
-void sof_rt1011_dai_link(struct snd_soc_dai_link *link)
+void sof_rt1011_dai_link(struct device *dev, struct snd_soc_dai_link *link)
 {
+	unsigned int num_codecs = get_num_codecs(RT1011_ACPI_HID);
+
 	link->codecs = rt1011_dai_link_components;
-	link->num_codecs = ARRAY_SIZE(rt1011_dai_link_components);
+
+	switch (num_codecs) {
+	case 2:
+	case 4:
+		link->num_codecs = num_codecs;
+		break;
+	default:
+		dev_err(dev, "rt1011: invalid num_codecs %d\n", num_codecs);
+		break;
+	}
+
 	link->init = rt1011_init;
 	link->ops = &rt1011_ops;
 }
 EXPORT_SYMBOL_NS(sof_rt1011_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
-void sof_rt1011_codec_conf(struct snd_soc_card *card)
+void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card *card)
 {
-	card->codec_conf = rt1011_codec_confs;
-	card->num_configs = ARRAY_SIZE(rt1011_codec_confs);
+	unsigned int num_codecs = get_num_codecs(RT1011_ACPI_HID);
+
+	switch (num_codecs) {
+	case 2:
+		if (soc_intel_is_cml()) {
+			/*
+			 * use name prefix 'WL' and 'WR' for speaker widgets to
+			 * keep backward compatible with cml devices
+			 */
+			card->codec_conf = rt1011_4spk_codec_confs;
+		} else {
+			card->codec_conf = rt1011_2spk_codec_confs;
+		}
+
+		card->num_configs = num_codecs;
+		break;
+	case 4:
+		card->codec_conf = rt1011_4spk_codec_confs;
+		card->num_configs = ARRAY_SIZE(rt1011_4spk_codec_confs);
+		break;
+	default:
+		dev_err(dev, "rt1011: invalid num_codecs %d\n", num_codecs);
+		break;
+	}
+
 }
 EXPORT_SYMBOL_NS(sof_rt1011_codec_conf, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
index 289e85b61660..d0e331530b39 100644
--- a/sound/soc/intel/boards/sof_realtek_common.h
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -23,8 +23,8 @@
 #define RT1011_DEV2_NAME	"i2c-" RT1011_ACPI_HID ":02"
 #define RT1011_DEV3_NAME	"i2c-" RT1011_ACPI_HID ":03"
 
-void sof_rt1011_dai_link(struct snd_soc_dai_link *link);
-void sof_rt1011_codec_conf(struct snd_soc_card *card);
+void sof_rt1011_dai_link(struct device *dev, struct snd_soc_dai_link *link);
+void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card *card);
 
 /*
  * Realtek ALC1015 (AUTO)
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 966bcd3e8bdc..326d23dd79de 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -576,7 +576,7 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 		max_98390_dai_link(dev, ctx->amp_link);
 		break;
 	case CODEC_RT1011:
-		sof_rt1011_dai_link(ctx->amp_link);
+		sof_rt1011_dai_link(dev, ctx->amp_link);
 		break;
 	case CODEC_RT1015:
 		sof_rt1015_dai_link(ctx->amp_link);
@@ -683,7 +683,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 		max_98390_set_codec_conf(&pdev->dev, &sof_audio_card_rt5682);
 		break;
 	case CODEC_RT1011:
-		sof_rt1011_codec_conf(&sof_audio_card_rt5682);
+		sof_rt1011_codec_conf(&pdev->dev, &sof_audio_card_rt5682);
 		break;
 	case CODEC_RT1015:
 		sof_rt1015_codec_conf(&sof_audio_card_rt5682);
-- 
2.40.1

