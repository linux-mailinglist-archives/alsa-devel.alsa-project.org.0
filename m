Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A66B720A3E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:26:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E38A174C;
	Fri,  2 Jun 2023 22:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E38A174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737581;
	bh=rLBaTK1ThLvdxyVW7645uaA3ylt+OS60oO9FYBgE9wA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P4SqB6WDwGGf7S3MTLqZRy9dOBClW1groafqNn2N1n+YdQrqmj0J9Xpl/KJZ3nyRY
	 GKKHNx7c9GHjKD3PC2IvgE0SJHlqmhGKHzfyndmKYwtYrirk7rjEhu8ghZpPhCZUx6
	 VDvWgYRipvbL7F0KsOjrhk8uLGsBqkrruXcIVWKE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 000EDF805D8; Fri,  2 Jun 2023 22:23:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9242DF805D8;
	Fri,  2 Jun 2023 22:23:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EBEDF805E3; Fri,  2 Jun 2023 22:23:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0917F80544
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0917F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W5WNFwGM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737390; x=1717273390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rLBaTK1ThLvdxyVW7645uaA3ylt+OS60oO9FYBgE9wA=;
  b=W5WNFwGMYqUuM3kWvULFoOUoYqCwgE5obMQjJzZhTyy19LcUUHlpPkYq
   uB2I131J4l5mG0s2FvdWj8VxOywDjeqSSx2rZBRNoJffZN/1ex5saLZrr
   IOI/qgUp9VIYu9i0tXn86/CfK36lv/cuk0zgoK+KWwGHzGLa70JMCzQkQ
   eqgZ05PYbnywB+2KuF4BZc8d+sEL2o2uCDmFcpB2m7CIjzyaQ2N7oJM2e
   RoZ7XVUOIkdDz+bzN5nKG8c+h45ite2r7cH9sg8NegriK8opby283TQzr
   gCcUL++NIaWwAdP49VLjOGMFjlqXXRKy34c74MZmLK/2v7zeHgqXo8NNj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811235"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811235"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020015"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020015"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/28] ASoC: Intel: sof_sdw: make rt711_sdca be generic
Date: Fri,  2 Jun 2023 15:22:06 -0500
Message-Id: <20230602202225.249209-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GRF33WD2YQQOSU3BCABSA3TJ3VPHHWV5
X-Message-ID-Hash: GRF33WD2YQQOSU3BCABSA3TJ3VPHHWV5
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GRF33WD2YQQOSU3BCABSA3TJ3VPHHWV5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Let rename rt711_sdca to rt_sdca_jack and let it be used for all
Realtek sdca jacks.
The commit uses component->name_prefix to construct card->components,
and determine which codec it is. So, we have to set name_prefix
properly.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Makefile               |  2 +-
 sound/soc/intel/boards/sof_sdw.c              |  4 +-
 sound/soc/intel/boards/sof_sdw_common.h       | 12 ++--
 ...1_sdca.c => sof_sdw_rt_sdca_jack_common.c} | 57 ++++++++++---------
 4 files changed, 40 insertions(+), 35 deletions(-)
 rename sound/soc/intel/boards/{sof_sdw_rt711_sdca.c => sof_sdw_rt_sdca_jack_common.c} (68%)

diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index d1fd7a2b32db..7fa45569cfb1 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -39,7 +39,7 @@ snd-soc-sof-ssp-amp-objs := sof_ssp_amp.o
 snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_max98373.o sof_sdw_rt_amp.o	\
 			sof_sdw_rt5682.o sof_sdw_rt700.o	\
-			sof_sdw_rt711.o sof_sdw_rt711_sdca.o 	\
+			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
 			sof_sdw_rt715.o	sof_sdw_rt715_sdca.o 	\
 			sof_sdw_dmic.o sof_sdw_hdmi.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d925e3005394..8310fb094d15 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -583,8 +583,8 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt711-sdca-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
-				.init = sof_sdw_rt711_sdca_init,
-				.exit = sof_sdw_rt711_sdca_exit,
+				.init = sof_sdw_rt_sdca_jack_init,
+				.exit = sof_sdw_rt_sdca_jack_exit,
 			},
 		},
 		.dai_num = 1,
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 9640fd6dbd12..bc9dfa626c32 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -123,12 +123,12 @@ int sof_sdw_rt711_init(struct snd_soc_card *card,
 int sof_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
 /* RT711-SDCA support */
-int sof_sdw_rt711_sdca_init(struct snd_soc_card *card,
-			    const struct snd_soc_acpi_link_adr *link,
-			    struct snd_soc_dai_link *dai_links,
-			    struct sof_sdw_codec_info *info,
-			    bool playback);
-int sof_sdw_rt711_sdca_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
+			      const struct snd_soc_acpi_link_adr *link,
+			      struct snd_soc_dai_link *dai_links,
+			      struct sof_sdw_codec_info *info,
+			      bool playback);
+int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
 /* RT700 support */
 int sof_sdw_rt700_init(struct snd_soc_card *card,
diff --git a/sound/soc/intel/boards/sof_sdw_rt711_sdca.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
similarity index 68%
rename from sound/soc/intel/boards/sof_sdw_rt711_sdca.c
rename to sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index a9ae0aa5ce0a..399f28a79110 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -21,7 +21,7 @@
  * Note this MUST be called before snd_soc_register_card(), so that the props
  * are in place before the codec component driver's probe function parses them.
  */
-static int rt711_sdca_add_codec_device_props(struct device *sdw_dev)
+static int rt_sdca_jack_add_codec_device_props(struct device *sdw_dev)
 {
 	struct property_entry props[MAX_NO_PROPS] = {};
 	struct fwnode_handle *fwnode;
@@ -43,7 +43,7 @@ static int rt711_sdca_add_codec_device_props(struct device *sdw_dev)
 	return ret;
 }
 
-static const struct snd_soc_dapm_widget rt711_sdca_widgets[] = {
+static const struct snd_soc_dapm_widget rt_sdca_jack_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
@@ -54,12 +54,12 @@ static const struct snd_soc_dapm_route rt711_sdca_map[] = {
 	{ "rt711 MIC2", NULL, "Headset Mic" },
 };
 
-static const struct snd_kcontrol_new rt711_sdca_controls[] = {
+static const struct snd_kcontrol_new rt_sdca_jack_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
 
-static struct snd_soc_jack_pin rt711_sdca_jack_pins[] = {
+static struct snd_soc_jack_pin rt_sdca_jack_pins[] = {
 	{
 		.pin    = "Headphone",
 		.mask   = SND_JACK_HEADPHONE,
@@ -70,7 +70,7 @@ static struct snd_soc_jack_pin rt711_sdca_jack_pins[] = {
 	},
 };
 
-static int rt711_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd)
+static int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -80,30 +80,35 @@ static int rt711_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	int ret;
 
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s hs:rt711-sdca",
-					  card->components);
+					  "%s hs:%s-sdca",
+					  card->components, component->name_prefix);
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, rt711_sdca_controls,
-					ARRAY_SIZE(rt711_sdca_controls));
+	ret = snd_soc_add_card_controls(card, rt_sdca_jack_controls,
+					ARRAY_SIZE(rt_sdca_jack_controls));
 	if (ret) {
-		dev_err(card->dev, "rt711-sdca controls addition failed: %d\n", ret);
+		dev_err(card->dev, "rt sdca jack controls addition failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt711_sdca_widgets,
-					ARRAY_SIZE(rt711_sdca_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, rt_sdca_jack_widgets,
+					ARRAY_SIZE(rt_sdca_jack_widgets));
 	if (ret) {
-		dev_err(card->dev, "rt711-sdca widgets addition failed: %d\n", ret);
+		dev_err(card->dev, "rt sdca jack widgets addition failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, rt711_sdca_map,
-				      ARRAY_SIZE(rt711_sdca_map));
+	if (strstr(component->name_prefix, "rt711")) {
+		ret = snd_soc_dapm_add_routes(&card->dapm, rt711_sdca_map,
+					      ARRAY_SIZE(rt711_sdca_map));
+	} else {
+		dev_err(card->dev, "%s is not supported\n", component->name_prefix);
+		return -EINVAL;
+	}
 
 	if (ret) {
-		dev_err(card->dev, "rt711-sdca map addition failed: %d\n", ret);
+		dev_err(card->dev, "rt sdca jack map addition failed: %d\n", ret);
 		return ret;
 	}
 
@@ -112,8 +117,8 @@ static int rt711_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd)
 					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
 					 SND_JACK_BTN_3,
 					 &ctx->sdw_headset,
-					 rt711_sdca_jack_pins,
-					 ARRAY_SIZE(rt711_sdca_jack_pins));
+					 rt_sdca_jack_pins,
+					 ARRAY_SIZE(rt_sdca_jack_pins));
 	if (ret) {
 		dev_err(rtd->card->dev, "Headset Jack creation failed: %d\n",
 			ret);
@@ -136,7 +141,7 @@ static int rt711_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-int sof_sdw_rt711_sdca_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
+int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 
@@ -152,11 +157,11 @@ int sof_sdw_rt711_sdca_exit(struct snd_soc_card *card, struct snd_soc_dai_link *
 	return 0;
 }
 
-int sof_sdw_rt711_sdca_init(struct snd_soc_card *card,
-			    const struct snd_soc_acpi_link_adr *link,
-			    struct snd_soc_dai_link *dai_links,
-			    struct sof_sdw_codec_info *info,
-			    bool playback)
+int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
+			      const struct snd_soc_acpi_link_adr *link,
+			      struct snd_soc_dai_link *dai_links,
+			      struct sof_sdw_codec_info *info,
+			      bool playback)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *sdw_dev;
@@ -173,14 +178,14 @@ int sof_sdw_rt711_sdca_init(struct snd_soc_card *card,
 	if (!sdw_dev)
 		return -EPROBE_DEFER;
 
-	ret = rt711_sdca_add_codec_device_props(sdw_dev);
+	ret = rt_sdca_jack_add_codec_device_props(sdw_dev);
 	if (ret < 0) {
 		put_device(sdw_dev);
 		return ret;
 	}
 	ctx->headset_codec_dev = sdw_dev;
 
-	dai_links->init = rt711_sdca_rtd_init;
+	dai_links->init = rt_sdca_jack_rtd_init;
 
 	return 0;
 }
-- 
2.37.2

