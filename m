Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C38D768A1A
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 04:41:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4154843;
	Mon, 31 Jul 2023 04:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4154843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690771296;
	bh=ZPWYgcQc4dgi/nu6ZU+MetmWHlSNtN8g+j8duyEaKgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HYXVyLWVjcRwVXQWuih6PozmyVQMFPru3GVPvWZh4NuqUc+j9MJdTLpfsUUwcjVsv
	 eiP69g4SXG8HsogRkJWvCDk+MWLWcw8J0eR77PAEs/k3lQrsaQqDvX+pN7o9r4xUYF
	 wkiO/OYsrWo0S62BQZrD1Dd2Awz4HZSdCqFLDZV8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED0DFF80558; Mon, 31 Jul 2023 04:40:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44A0CF8025A;
	Mon, 31 Jul 2023 04:40:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C55FF80551; Mon, 31 Jul 2023 04:40:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7A14F8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 04:40:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7A14F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EL9v/5Yg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690771235; x=1722307235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZPWYgcQc4dgi/nu6ZU+MetmWHlSNtN8g+j8duyEaKgM=;
  b=EL9v/5Yg7rhRdoHF8NE+68oNnQMuOIq1YrB41HvyhxQShbgBofJLL/Z4
   mpc6JLdUZvMaf/oQgSeZLuA4GOKPBjkVQu6kIfo8AA8mGjLIykkWZvldN
   CtrWG65ZxM9IExXWlHvQdhWLhs96jpIG+kVNeDIkaWMdd5SjPzRDCs9qL
   RqyBDi74zjsiSWoBK+5c0Po/VXN7w8DgVyYsXB89glFI9CUiY7zC4Y22y
   85m+jImSOELDY+mu0Ha0bpgk+aGuIWMrgQ8Zgx8gPwYiE/zOF16wXncuq
   eIPFkfwy5Oy/uy60yDksVarL7OLIUbLYck+VcEDqH5+D2AppJ2CeqamCk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="349206003"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200";
   d="scan'208";a="349206003"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2023 19:40:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="678158309"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200";
   d="scan'208";a="678158309"
Received: from brentlu-desktop.itwn.intel.com ([10.5.252.92])
  by orsmga003.jf.intel.com with ESMTP; 30 Jul 2023 19:40:28 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Brent Lu <brent.lu@intel.com>,
	linux-kernel@vger.kernel.org,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Terry Cheong <htcheong@chromium.org>,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Mac Chiang <mac.chiang@intel.com>,
	"Dharageswari . R" <dharageswari.r@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 1/1] ASoC: Intel: maxim-common: get codec number from ACPI
 table
Date: Mon, 31 Jul 2023 18:34:19 +0800
Message-Id: <20230731103419.2536036-2-brent.lu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731103419.2536036-1-brent.lu@intel.com>
References: <20230731103419.2536036-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CP5GD3QUPEXUY7TOWWJT7JIBQELH3F5B
X-Message-ID-Hash: CP5GD3QUPEXUY7TOWWJT7JIBQELH3F5B
X-MailFrom: brent.lu@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CP5GD3QUPEXUY7TOWWJT7JIBQELH3F5B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We implement a helper function to get number of codecs from ACPI
subsystem instead of using quirk flag in machine driver. Also refactor
module interface by adding max_98390_dai_link() function.

On the sof_rt5682 machine driver side, we remove the quirk flag
SOF_MAX98390_TWEETER_SPEAKER_PRESENT and use the new interface of
max98390 to setup dai link.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 170 +++++++++++++---------
 sound/soc/intel/boards/sof_maxim_common.h |  21 ++-
 sound/soc/intel/boards/sof_rt5682.c       |  37 +----
 3 files changed, 111 insertions(+), 117 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 112e89951da0..628b6d5d3ee4 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -4,6 +4,7 @@
 #include <linux/module.h>
 #include <linux/string.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-dai.h>
@@ -11,6 +12,18 @@
 #include <uapi/sound/asound.h>
 #include "sof_maxim_common.h"
 
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
 #define MAX_98373_PIN_NAME 16
 
 const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
@@ -168,17 +181,6 @@ static struct snd_soc_codec_conf max_98390_codec_conf[] = {
 		.dlc = COMP_CODEC_CONF(MAX_98390_DEV1_NAME),
 		.name_prefix = "Left",
 	},
-};
-
-static struct snd_soc_codec_conf max_98390_4spk_codec_conf[] = {
-	{
-		.dlc = COMP_CODEC_CONF(MAX_98390_DEV0_NAME),
-		.name_prefix = "Right",
-	},
-	{
-		.dlc = COMP_CODEC_CONF(MAX_98390_DEV1_NAME),
-		.name_prefix = "Left",
-	},
 	{
 		.dlc = COMP_CODEC_CONF(MAX_98390_DEV2_NAME),
 		.name_prefix = "Tweeter Right",
@@ -189,19 +191,7 @@ static struct snd_soc_codec_conf max_98390_4spk_codec_conf[] = {
 	},
 };
 
-struct snd_soc_dai_link_component max_98390_components[] = {
-	{
-		.name = MAX_98390_DEV0_NAME,
-		.dai_name = MAX_98390_CODEC_DAI,
-	},
-	{
-		.name = MAX_98390_DEV1_NAME,
-		.dai_name = MAX_98390_CODEC_DAI,
-	},
-};
-EXPORT_SYMBOL_NS(max_98390_components, SND_SOC_INTEL_SOF_MAXIM_COMMON);
-
-struct snd_soc_dai_link_component max_98390_4spk_components[] = {
+static struct snd_soc_dai_link_component max_98390_components[] = {
 	{
 		.name = MAX_98390_DEV0_NAME,
 		.dai_name = MAX_98390_CODEC_DAI,
@@ -219,62 +209,56 @@ struct snd_soc_dai_link_component max_98390_4spk_components[] = {
 		.dai_name = MAX_98390_CODEC_DAI,
 	},
 };
-EXPORT_SYMBOL_NS(max_98390_4spk_components, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+
+static const struct {
+	unsigned int tx;
+	unsigned int rx;
+} max_98390_tdm_mask[] = {
+	{.tx = 0x01, .rx = 0x3},
+	{.tx = 0x02, .rx = 0x3},
+	{.tx = 0x04, .rx = 0x3},
+	{.tx = 0x08, .rx = 0x3},
+};
 
 static int max_98390_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
-	int i;
+	int i, ret;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		if (i >= ARRAY_SIZE(max_98390_4spk_components)) {
+		if (i >= ARRAY_SIZE(max_98390_tdm_mask)) {
 			dev_err(codec_dai->dev, "invalid codec index %d\n", i);
 			return -ENODEV;
 		}
 
-		if (!strcmp(codec_dai->component->name, MAX_98390_DEV0_NAME)) {
-			/* DEV0 tdm slot configuration Right */
-			snd_soc_dai_set_tdm_slot(codec_dai, 0x01, 3, 4, 32);
-		}
-		if (!strcmp(codec_dai->component->name, MAX_98390_DEV1_NAME)) {
-			/* DEV1 tdm slot configuration Left */
-			snd_soc_dai_set_tdm_slot(codec_dai, 0x02, 3, 4, 32);
-		}
-
-		if (!strcmp(codec_dai->component->name, MAX_98390_DEV2_NAME)) {
-			/* DEVi2 tdm slot configuration Tweeter Right */
-			snd_soc_dai_set_tdm_slot(codec_dai, 0x04, 3, 4, 32);
-		}
-		if (!strcmp(codec_dai->component->name, MAX_98390_DEV3_NAME)) {
-			/* DEV3 tdm slot configuration Tweeter Left */
-			snd_soc_dai_set_tdm_slot(codec_dai, 0x08, 3, 4, 32);
+		ret = snd_soc_dai_set_tdm_slot(codec_dai, max_98390_tdm_mask[i].tx,
+					       max_98390_tdm_mask[i].rx, 4,
+					       params_width(params));
+		if (ret < 0) {
+			dev_err(codec_dai->dev, "fail to set tdm slot, ret %d\n",
+				ret);
+			return ret;
 		}
 	}
 	return 0;
 }
 
-int max_98390_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
+static int max_98390_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	unsigned int num_codecs = get_num_codecs(MAX_98390_ACPI_HID);
 	int ret;
 
-	/* add regular speakers dapm route */
-	ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_dapm_routes,
-				      ARRAY_SIZE(max_98390_dapm_routes));
-	if (ret) {
-		dev_err(rtd->dev, "unable to add Left/Right Speaker dapm, ret %d\n", ret);
-		return ret;
-	}
-
-	/* add widgets/controls/dapm for tweeter speakers */
-	if (acpi_dev_present("MX98390", "3", -1)) {
+	switch (num_codecs) {
+	case 4:
+		/* add widgets/controls/dapm for tweeter speakers */
 		ret = snd_soc_dapm_new_controls(&card->dapm, max_98390_tt_dapm_widgets,
 						ARRAY_SIZE(max_98390_tt_dapm_widgets));
-
 		if (ret) {
-			dev_err(rtd->dev, "unable to add tweeter dapm controls, ret %d\n", ret);
+			dev_err(rtd->dev, "unable to add tweeter dapm widgets, ret %d\n",
+				ret);
 			/* Don't need to add routes if widget addition failed */
 			return ret;
 		}
@@ -282,33 +266,79 @@ int max_98390_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
 		ret = snd_soc_add_card_controls(card, max_98390_tt_kcontrols,
 						ARRAY_SIZE(max_98390_tt_kcontrols));
 		if (ret) {
-			dev_err(rtd->dev, "unable to add tweeter card controls, ret %d\n", ret);
+			dev_err(rtd->dev, "unable to add tweeter controls, ret %d\n",
+				ret);
 			return ret;
 		}
 
 		ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_tt_dapm_routes,
 					      ARRAY_SIZE(max_98390_tt_dapm_routes));
-		if (ret)
-			dev_err(rtd->dev,
-				"unable to add Tweeter Left/Right Speaker dapm, ret %d\n", ret);
+		if (ret) {
+			dev_err(rtd->dev, "unable to add tweeter dapm routes, ret %d\n",
+				ret);
+			return ret;
+		}
+
+		fallthrough;
+	case 2:
+		/* add regular speakers dapm route */
+		ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_dapm_routes,
+					      ARRAY_SIZE(max_98390_dapm_routes));
+		if (ret) {
+			dev_err(rtd->dev, "unable to add dapm routes, ret %d\n",
+				ret);
+			return ret;
+		}
+		break;
+	default:
+		dev_err(rtd->dev, "invalid codec number %d\n", num_codecs);
+		return -EINVAL;
 	}
+
 	return ret;
 }
-EXPORT_SYMBOL_NS(max_98390_spk_codec_init, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
-const struct snd_soc_ops max_98390_ops = {
+static const struct snd_soc_ops max_98390_ops = {
 	.hw_params = max_98390_hw_params,
 };
-EXPORT_SYMBOL_NS(max_98390_ops, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
-void max_98390_set_codec_conf(struct snd_soc_card *card, int ch)
+void max_98390_dai_link(struct device *dev, struct snd_soc_dai_link *link)
+{
+	unsigned int num_codecs = get_num_codecs(MAX_98390_ACPI_HID);
+
+	link->codecs = max_98390_components;
+
+	switch (num_codecs) {
+	case 2:
+	case 4:
+		link->num_codecs = num_codecs;
+		break;
+	default:
+		dev_err(dev, "invalid codec number %d for %s\n", num_codecs,
+			MAX_98390_ACPI_HID);
+		break;
+	}
+
+	link->init = max_98390_init;
+	link->ops = &max_98390_ops;
+}
+EXPORT_SYMBOL_NS(max_98390_dai_link, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+
+void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card *card)
 {
-	if (ch == ARRAY_SIZE(max_98390_4spk_codec_conf)) {
-		card->codec_conf = max_98390_4spk_codec_conf;
-		card->num_configs = ARRAY_SIZE(max_98390_4spk_codec_conf);
-	} else {
-		card->codec_conf = max_98390_codec_conf;
-		card->num_configs = ARRAY_SIZE(max_98390_codec_conf);
+	unsigned int num_codecs = get_num_codecs(MAX_98390_ACPI_HID);
+
+	card->codec_conf = max_98390_codec_conf;
+
+	switch (num_codecs) {
+	case 2:
+	case 4:
+		card->num_configs = num_codecs;
+		break;
+	default:
+		dev_err(dev, "invalid codec number %d for %s\n", num_codecs,
+			MAX_98390_ACPI_HID);
+		break;
 	}
 }
 EXPORT_SYMBOL_NS(max_98390_set_codec_conf, SND_SOC_INTEL_SOF_MAXIM_COMMON);
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index 7a8c53049e4d..a095b47b856b 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -27,18 +27,15 @@ int max_98373_trigger(struct snd_pcm_substream *substream, int cmd);
 /*
  * Maxim MAX98390
  */
-#define MAX_98390_CODEC_DAI     "max98390-aif1"
-#define MAX_98390_DEV0_NAME     "i2c-MX98390:00"
-#define MAX_98390_DEV1_NAME     "i2c-MX98390:01"
-#define MAX_98390_DEV2_NAME     "i2c-MX98390:02"
-#define MAX_98390_DEV3_NAME     "i2c-MX98390:03"
-
-extern struct snd_soc_dai_link_component max_98390_components[2];
-extern struct snd_soc_dai_link_component max_98390_4spk_components[4];
-extern const struct snd_soc_ops max_98390_ops;
-
-void max_98390_set_codec_conf(struct snd_soc_card *card, int ch);
-int max_98390_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
+#define MAX_98390_ACPI_HID	"MX98390"
+#define MAX_98390_CODEC_DAI	"max98390-aif1"
+#define MAX_98390_DEV0_NAME	"i2c-" MAX_98390_ACPI_HID ":00"
+#define MAX_98390_DEV1_NAME	"i2c-" MAX_98390_ACPI_HID ":01"
+#define MAX_98390_DEV2_NAME	"i2c-" MAX_98390_ACPI_HID ":02"
+#define MAX_98390_DEV3_NAME	"i2c-" MAX_98390_ACPI_HID ":03"
+
+void max_98390_dai_link(struct device *dev, struct snd_soc_dai_link *link);
+void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card *card);
 
 /*
  * Maxim MAX98357A/MAX98360A
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index b4f07bdcf8b4..0af1e0c3a9db 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -59,7 +59,6 @@
 #define SOF_SSP_BT_OFFLOAD_PRESENT		BIT(22)
 #define SOF_RT5682S_HEADPHONE_CODEC_PRESENT	BIT(23)
 #define SOF_MAX98390_SPEAKER_AMP_PRESENT	BIT(24)
-#define SOF_MAX98390_TWEETER_SPEAKER_PRESENT	BIT(25)
 #define SOF_RT1019_SPEAKER_AMP_PRESENT	BIT(26)
 #define SOF_RT5650_HEADPHONE_CODEC_PRESENT	BIT(27)
 
@@ -195,23 +194,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_RT5682_SSP_AMP(2) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
-	{
-		.callback = sof_rt5682_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Brya"),
-			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98390_ALC5682I_I2S_4SPK"),
-		},
-		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_SPEAKER_AMP_PRESENT |
-					SOF_MAX98390_SPEAKER_AMP_PRESENT |
-					SOF_MAX98390_TWEETER_SPEAKER_PRESENT |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-
-	},
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
@@ -850,17 +832,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			sof_rt1011_dai_link(&links[id]);
 		} else if (sof_rt5682_quirk &
 				SOF_MAX98390_SPEAKER_AMP_PRESENT) {
-			if (sof_rt5682_quirk &
-				SOF_MAX98390_TWEETER_SPEAKER_PRESENT) {
-				links[id].codecs = max_98390_4spk_components;
-				links[id].num_codecs = ARRAY_SIZE(max_98390_4spk_components);
-			} else {
-				links[id].codecs = max_98390_components;
-				links[id].num_codecs = ARRAY_SIZE(max_98390_components);
-			}
-			links[id].init = max_98390_spk_codec_init;
-			links[id].ops = &max_98390_ops;
-
+			max_98390_dai_link(dev, &links[id]);
 		} else if (sof_rt5682_quirk & SOF_RT5650_HEADPHONE_CODEC_PRESENT) {
 			links[id].codecs = &rt5650_components[1];
 			links[id].num_codecs = 1;
@@ -1019,12 +991,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT)
 		sof_rt1015p_codec_conf(&sof_audio_card_rt5682);
 	else if (sof_rt5682_quirk & SOF_MAX98390_SPEAKER_AMP_PRESENT) {
-		if (sof_rt5682_quirk & SOF_MAX98390_TWEETER_SPEAKER_PRESENT)
-			max_98390_set_codec_conf(&sof_audio_card_rt5682,
-						 ARRAY_SIZE(max_98390_4spk_components));
-		else
-			max_98390_set_codec_conf(&sof_audio_card_rt5682,
-						 ARRAY_SIZE(max_98390_components));
+		max_98390_set_codec_conf(&pdev->dev, &sof_audio_card_rt5682);
 	}
 
 	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
-- 
2.34.1

