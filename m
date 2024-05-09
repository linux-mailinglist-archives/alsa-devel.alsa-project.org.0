Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DD18C1322
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:39:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EDE1DEE;
	Thu,  9 May 2024 18:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EDE1DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272767;
	bh=clsIYEjpDv7Q9E4dTjqDz9d4o40JW8eF/vIeE6dyqPk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qMII893DHQTax/tuzH7votGx+9m+i+JerPluRBvdVzb17omAUknTVLePtZS9Dg5D6
	 ByXrMnjgMHckK5KJyi+pA7J+T2lEhL5vvDvIfXZx9WewW30SBn0A6KtIbP+Uj+y6Zc
	 Ph6mOYnR+hqERJqWDZ6zjtKIupqVuEgTcUis5SAk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 969C2F80C6E; Thu,  9 May 2024 18:35:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B88BAF808CA;
	Thu,  9 May 2024 18:35:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1C88F80727; Thu,  9 May 2024 18:35:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C003F8057C
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C003F8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=I/zsTfaj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272483; x=1746808483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=clsIYEjpDv7Q9E4dTjqDz9d4o40JW8eF/vIeE6dyqPk=;
  b=I/zsTfajLATw0ocorP7S5XYfLZB5J2OfNlV/NGF/rSQKWbGrr2X4ftE5
   0a9lL5GU0So8G9ghYPjeu/tjhqSHOCLYh32P5cEQBoSQ3dQ+KE0P1rZNb
   Ma0XbMNw8/k3DCDNtHOgSQ1jhIwp6WXjPTsa+pFng9sIWBN/xDeqerOG6
   1LdJ1QaysVPVR8ewPPtKaOK2LTiG2QFdLtwPu/uM4S3uGWviw2tiJSZs8
   mvzsC9LRrTj3kZFEFqmbDsYhPXmx6w3FJwypO6+cI+TQoYcLy8y2Lcfw3
   LpRCZRXgD14zyB65c6iEx5tcMLAyLUc76civmVGludUzH9iN1JV73TKmL
   w==;
X-CSE-ConnectionGUID: Id57LdW5S5KPj4wutttV1A==
X-CSE-MsgGUID: CZoiCOGqSeGxBV+PXFsMYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017616"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="15017616"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:34 -0700
X-CSE-ConnectionGUID: ZKVSi5JsR3i3wHH0e55yrA==
X-CSE-MsgGUID: fSAeROrIQ7+rlP56/xdx1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="33761045"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 16/18] ASoC: Intel: sof_sdw: use .controls/.widgets to add
 controls/widgets
Date: Thu,  9 May 2024 11:34:16 -0500
Message-Id: <20240509163418.67746-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EC2F64V2YFCMW4HUBUAMN5HUAYUHVWQZ
X-Message-ID-Hash: EC2F64V2YFCMW4HUBUAMN5HUAYUHVWQZ
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

sof_sdw_rtd_init() will add the controls and widgets if we set them in
the codec_info. Move the additions from .rtd_init callback to
sof_sdw_rtd_init().

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c              | 112 ++++++++++++++++++
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |  24 ----
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  34 ------
 sound/soc/intel/boards/sof_sdw_cs_amp.c       |  11 --
 sound/soc/intel/boards/sof_sdw_maxim.c        |  24 ----
 sound/soc/intel/boards/sof_sdw_rt5682.c       |  24 ----
 sound/soc/intel/boards/sof_sdw_rt700.c        |  26 ----
 sound/soc/intel/boards/sof_sdw_rt711.c        |  24 ----
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c   |  22 ----
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c   |  22 ----
 sound/soc/intel/boards/sof_sdw_rt_amp.c       |  22 ----
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  24 ----
 12 files changed, 112 insertions(+), 257 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 3acc2db61b35..8c1497bab2ef 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -515,6 +515,50 @@ static struct snd_soc_dai_link_component platform_component[] = {
 	}
 };
 
+static const struct snd_soc_dapm_widget generic_dmic_widgets[] = {
+	SND_SOC_DAPM_MIC("DMIC", NULL),
+};
+
+static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static const struct snd_kcontrol_new generic_jack_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+static const struct snd_kcontrol_new generic_spk_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
+static const struct snd_soc_dapm_widget maxim_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+};
+
+static const struct snd_kcontrol_new maxim_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+};
+
+static const struct snd_soc_dapm_widget rt700_widgets[] = {
+	SND_SOC_DAPM_HP("Headphones", NULL),
+	SND_SOC_DAPM_MIC("AMIC", NULL),
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+static const struct snd_kcontrol_new rt700_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphones"),
+	SOC_DAPM_PIN_SWITCH("AMIC"),
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
 struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
 					  const char * const dai_name[],
 					  int num_dais)
@@ -681,6 +725,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.rtd_init = rt700_rtd_init,
+				.controls = rt700_controls,
+				.num_controls = ARRAY_SIZE(rt700_controls),
+				.widgets = rt700_widgets,
+				.num_widgets = ARRAY_SIZE(rt700_widgets),
 			},
 		},
 		.dai_num = 1,
@@ -697,6 +745,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.init = sof_sdw_rt_sdca_jack_init,
 				.exit = sof_sdw_rt_sdca_jack_exit,
 				.rtd_init = rt_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
 			},
 		},
 		.dai_num = 1,
@@ -713,6 +765,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.init = sof_sdw_rt711_init,
 				.exit = sof_sdw_rt711_exit,
 				.rtd_init = rt711_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
 			},
 		},
 		.dai_num = 1,
@@ -729,6 +785,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.init = sof_sdw_rt_sdca_jack_init,
 				.exit = sof_sdw_rt_sdca_jack_exit,
 				.rtd_init = rt_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
 			},
 			{
 				.direction = {true, false},
@@ -738,6 +798,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
 				.rtd_init = rt712_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
 			},
 		},
 		.dai_num = 2,
@@ -768,6 +832,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.init = sof_sdw_rt_sdca_jack_init,
 				.exit = sof_sdw_rt_sdca_jack_exit,
 				.rtd_init = rt_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
 			},
 		},
 		.dai_num = 1,
@@ -798,6 +866,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
 				.rtd_init = rt_amp_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
 			},
 		},
 		.dai_num = 1,
@@ -814,6 +886,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
 				.rtd_init = rt_amp_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
 			},
 		},
 		.dai_num = 1,
@@ -829,6 +905,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
 				.rtd_init = rt_amp_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
 			},
 		},
 		.dai_num = 1,
@@ -905,6 +985,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.init = sof_sdw_rt_sdca_jack_init,
 				.exit = sof_sdw_rt_sdca_jack_exit,
 				.rtd_init = rt_sdca_jack_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
 			},
 			{
 				.direction = {true, false},
@@ -915,6 +999,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.init = sof_sdw_rt_amp_init,
 				.exit = sof_sdw_rt_amp_exit,
 				.rtd_init = rt722_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
 			},
 			{
 				.direction = {false, true},
@@ -936,6 +1024,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
 				.init = sof_sdw_maxim_init,
 				.rtd_init = maxim_spk_rtd_init,
+				.controls = maxim_controls,
+				.num_controls = ARRAY_SIZE(maxim_controls),
+				.widgets = maxim_widgets,
+				.num_widgets = ARRAY_SIZE(maxim_widgets),
 			},
 		},
 		.dai_num = 1,
@@ -950,6 +1042,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
 				.init = sof_sdw_maxim_init,
 				.rtd_init = maxim_spk_rtd_init,
+				.controls = maxim_controls,
+				.num_controls = ARRAY_SIZE(maxim_controls),
+				.widgets = maxim_widgets,
+				.num_widgets = ARRAY_SIZE(maxim_widgets),
 			},
 		},
 		.dai_num = 1,
@@ -963,6 +1059,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.rtd_init = rt5682_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
 			},
 		},
 		.dai_num = 1,
@@ -977,6 +1077,8 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
 				.init = sof_sdw_cs_amp_init,
 				.rtd_init = cs_spk_rtd_init,
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
 			},
 		},
 		.dai_num = 1,
@@ -990,6 +1092,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
 				.rtd_init = cs42l42_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
 			},
 		},
 		.dai_num = 1,
@@ -1006,6 +1112,8 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
 				.rtd_init = cs42l43_hs_rtd_init,
+				.widgets = generic_jack_widgets,
+				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
 			},
 			{
 				.direction = {false, true},
@@ -1013,6 +1121,8 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.rtd_init = cs42l43_dmic_rtd_init,
+				.widgets = generic_dmic_widgets,
+				.num_widgets = ARRAY_SIZE(generic_dmic_widgets),
 			},
 			{
 				.direction = {false, true},
@@ -1027,6 +1137,8 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
 				.init = sof_sdw_cs42l43_spk_init,
 				.rtd_init = cs42l43_spk_rtd_init,
+				.widgets = generic_spk_widgets,
+				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
 				.quirk = SOF_CODEC_SPKR | SOF_SIDECAR_AMPS,
 			},
 		},
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index 82555c53a9c9..9783d5fb2d91 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -17,11 +17,6 @@
 #include <sound/jack.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-};
-
 static const struct snd_soc_dapm_route cs42l42_map[] = {
 	/* HP jack connectors - unknown if we have jack detection */
 	{"Headphone", NULL, "cs42l42 HP"},
@@ -30,11 +25,6 @@ static const struct snd_soc_dapm_route cs42l42_map[] = {
 	{"cs42l42 HS", NULL, "Headset Mic"},
 };
 
-static const struct snd_kcontrol_new generic_jack_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-};
-
 static struct snd_soc_jack_pin cs42l42_jack_pins[] = {
 	{
 		.pin    = "Headphone",
@@ -70,20 +60,6 @@ int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, generic_jack_controls,
-					ARRAY_SIZE(generic_jack_controls));
-	if (ret) {
-		dev_err(card->dev, "cs42l42 control addition failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_new_controls(&card->dapm, generic_jack_widgets,
-					ARRAY_SIZE(generic_jack_widgets));
-	if (ret) {
-		dev_err(card->dev, "cs42l42 widgets addition failed: %d\n", ret);
-		return ret;
-	}
-
 	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l42_map,
 				      ARRAY_SIZE(cs42l42_map));
 
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index f76a16795fda..2dd0f085fe60 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -18,11 +18,6 @@
 #include <sound/soc-dapm.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-};
-
 static const struct snd_soc_dapm_route cs42l43_hs_map[] = {
 	{ "Headphone", NULL, "cs42l43 AMP3_OUT" },
 	{ "Headphone", NULL, "cs42l43 AMP4_OUT" },
@@ -30,10 +25,6 @@ static const struct snd_soc_dapm_route cs42l43_hs_map[] = {
 	{ "cs42l43 ADC1_IN1_N", NULL, "Headset Mic" },
 };
 
-static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-};
-
 static const struct snd_soc_dapm_route cs42l43_spk_map[] = {
 	{ "Speaker", NULL, "cs42l43 AMP1_OUT_P", },
 	{ "Speaker", NULL, "cs42l43 AMP1_OUT_N", },
@@ -41,10 +32,6 @@ static const struct snd_soc_dapm_route cs42l43_spk_map[] = {
 	{ "Speaker", NULL, "cs42l43 AMP2_OUT_N", },
 };
 
-static const struct snd_soc_dapm_widget generic_dmic_widgets[] = {
-	SND_SOC_DAPM_MIC("DMIC", NULL),
-};
-
 static const struct snd_soc_dapm_route cs42l43_dmic_map[] = {
 	{ "cs42l43 PDM1_DIN", NULL, "DMIC" },
 	{ "cs42l43 PDM2_DIN", NULL, "DMIC" },
@@ -74,13 +61,6 @@ int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, generic_jack_widgets,
-					ARRAY_SIZE(generic_jack_widgets));
-	if (ret) {
-		dev_err(card->dev, "cs42l43 hs widgets addition failed: %d\n", ret);
-		return ret;
-	}
-
 	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l43_hs_map,
 				      ARRAY_SIZE(cs42l43_hs_map));
 	if (ret) {
@@ -133,13 +113,6 @@ int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 			return -ENOMEM;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, generic_spk_widgets,
-					ARRAY_SIZE(generic_spk_widgets));
-	if (ret) {
-		dev_err(card->dev, "cs42l43 speaker widgets addition failed: %d\n", ret);
-		return ret;
-	}
-
 	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l43_spk_map,
 				      ARRAY_SIZE(cs42l43_spk_map));
 	if (ret)
@@ -172,13 +145,6 @@ int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, generic_dmic_widgets,
-					ARRAY_SIZE(generic_dmic_widgets));
-	if (ret) {
-		dev_err(card->dev, "cs42l43 dmic widgets addition failed: %d\n", ret);
-		return ret;
-	}
-
 	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l43_dmic_map,
 				      ARRAY_SIZE(cs42l43_dmic_map));
 	if (ret)
diff --git a/sound/soc/intel/boards/sof_sdw_cs_amp.c b/sound/soc/intel/boards/sof_sdw_cs_amp.c
index e15a4753f103..663c0e1d2c56 100644
--- a/sound/soc/intel/boards/sof_sdw_cs_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_cs_amp.c
@@ -14,10 +14,6 @@
 
 #define CODEC_NAME_SIZE	8
 
-static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-};
-
 int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	const char *dai_name = rtd->dai_link->codecs->dai_name;
@@ -35,13 +31,6 @@ int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, generic_spk_widgets,
-					ARRAY_SIZE(generic_spk_widgets));
-	if (ret) {
-		dev_err(card->dev, "widgets addition failed: %d\n", ret);
-		return ret;
-	}
-
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		if (!strstr(codec_dai->name, "cs35l56"))
 			continue;
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index 57c1a5fb17a9..a7a8db624818 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -16,16 +16,6 @@ static int maxim_part_id;
 #define SOF_SDW_PART_ID_MAX98363 0x8363
 #define SOF_SDW_PART_ID_MAX98373 0x8373
 
-static const struct snd_soc_dapm_widget maxim_widgets[] = {
-	SND_SOC_DAPM_SPK("Left Spk", NULL),
-	SND_SOC_DAPM_SPK("Right Spk", NULL),
-};
-
-static const struct snd_kcontrol_new maxim_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Left Spk"),
-	SOC_DAPM_PIN_SWITCH("Right Spk"),
-};
-
 static const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
 	{ "Left Spk", NULL, "Left BE_OUT" },
 	{ "Right Spk", NULL, "Right BE_OUT" },
@@ -45,20 +35,6 @@ int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	dev_dbg(card->dev, "soundwire maxim card components assigned : %s\n",
 		card->components);
 
-	ret = snd_soc_add_card_controls(card, maxim_controls,
-					ARRAY_SIZE(maxim_controls));
-	if (ret) {
-		dev_err(card->dev, "mx%04x ctrls addition failed: %d\n", maxim_part_id, ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_new_controls(&card->dapm, maxim_widgets,
-					ARRAY_SIZE(maxim_widgets));
-	if (ret) {
-		dev_err(card->dev, "mx%04x widgets addition failed: %d\n", maxim_part_id, ret);
-		return ret;
-	}
-
 	ret = snd_soc_dapm_add_routes(&card->dapm, max_98373_dapm_routes, 2);
 	if (ret)
 		dev_err(rtd->dev, "failed to add first SPK map: %d\n", ret);
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index 9fbe36322a83..1741226fe052 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -17,11 +17,6 @@
 #include <sound/jack.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-};
-
 static const struct snd_soc_dapm_route rt5682_map[] = {
 	/*Headphones*/
 	{ "Headphone", NULL, "rt5682 HPOL" },
@@ -29,11 +24,6 @@ static const struct snd_soc_dapm_route rt5682_map[] = {
 	{ "rt5682 IN1P", NULL, "Headset Mic" },
 };
 
-static const struct snd_kcontrol_new generic_jack_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-};
-
 static struct snd_soc_jack_pin rt5682_jack_pins[] = {
 	{
 		.pin    = "Headphone",
@@ -69,20 +59,6 @@ int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, generic_jack_controls,
-					ARRAY_SIZE(generic_jack_controls));
-	if (ret) {
-		dev_err(card->dev, "rt5682 control addition failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_new_controls(&card->dapm, generic_jack_widgets,
-					ARRAY_SIZE(generic_jack_widgets));
-	if (ret) {
-		dev_err(card->dev, "rt5682 widgets addition failed: %d\n", ret);
-		return ret;
-	}
-
 	ret = snd_soc_dapm_add_routes(&card->dapm, rt5682_map,
 				      ARRAY_SIZE(rt5682_map));
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index a2648c900e74..58677a8968ab 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -15,12 +15,6 @@
 #include <sound/jack.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget rt700_widgets[] = {
-	SND_SOC_DAPM_HP("Headphones", NULL),
-	SND_SOC_DAPM_MIC("AMIC", NULL),
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-};
-
 static const struct snd_soc_dapm_route rt700_map[] = {
 	/* Headphones */
 	{ "Headphones", NULL, "rt700 HP" },
@@ -28,12 +22,6 @@ static const struct snd_soc_dapm_route rt700_map[] = {
 	{ "rt700 MIC2", NULL, "AMIC" },
 };
 
-static const struct snd_kcontrol_new rt700_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphones"),
-	SOC_DAPM_PIN_SWITCH("AMIC"),
-	SOC_DAPM_PIN_SWITCH("Speaker"),
-};
-
 static struct snd_soc_jack_pin rt700_jack_pins[] = {
 	{
 		.pin    = "Headphones",
@@ -69,20 +57,6 @@ int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, rt700_controls,
-					ARRAY_SIZE(rt700_controls));
-	if (ret) {
-		dev_err(card->dev, "rt700 controls addition failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt700_widgets,
-					ARRAY_SIZE(rt700_widgets));
-	if (ret) {
-		dev_err(card->dev, "rt700 widgets addition failed: %d\n", ret);
-		return ret;
-	}
-
 	ret = snd_soc_dapm_add_routes(&card->dapm, rt700_map,
 				      ARRAY_SIZE(rt700_map));
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 1a0f6692034a..4cff48a37e3c 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -42,22 +42,12 @@ static int rt711_add_codec_device_props(struct device *sdw_dev)
 	return ret;
 }
 
-static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-};
-
 static const struct snd_soc_dapm_route rt711_map[] = {
 	/* Headphones */
 	{ "Headphone", NULL, "rt711 HP" },
 	{ "rt711 MIC2", NULL, "Headset Mic" },
 };
 
-static const struct snd_kcontrol_new generic_jack_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-};
-
 static struct snd_soc_jack_pin rt711_jack_pins[] = {
 	{
 		.pin    = "Headphone",
@@ -93,20 +83,6 @@ int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, generic_jack_controls,
-					ARRAY_SIZE(generic_jack_controls));
-	if (ret) {
-		dev_err(card->dev, "rt711 controls addition failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_new_controls(&card->dapm, generic_jack_widgets,
-					ARRAY_SIZE(generic_jack_widgets));
-	if (ret) {
-		dev_err(card->dev, "rt711 widgets addition failed: %d\n", ret);
-		return ret;
-	}
-
 	ret = snd_soc_dapm_add_routes(&card->dapm, rt711_map,
 				      ARRAY_SIZE(rt711_map));
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
index 42308228c634..ee2c57a50f0d 100644
--- a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
@@ -15,10 +15,6 @@
 #include <sound/soc-dapm.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-};
-
 /*
  * dapm routes for rt712 spk will be registered dynamically according
  * to the number of rt712 spk used. The first two entries will be registered
@@ -30,10 +26,6 @@ static const struct snd_soc_dapm_route rt712_spk_map[] = {
 	{ "Speaker", NULL, "rt712 SPOR" },
 };
 
-static const struct snd_kcontrol_new generic_spk_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speaker"),
-};
-
 int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -45,20 +37,6 @@ int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, generic_spk_controls,
-					ARRAY_SIZE(generic_spk_controls));
-	if (ret) {
-		dev_err(card->dev, "rt712 spk controls addition failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_new_controls(&card->dapm, generic_spk_widgets,
-					ARRAY_SIZE(generic_spk_widgets));
-	if (ret) {
-		dev_err(card->dev, "rt712 spk widgets addition failed: %d\n", ret);
-		return ret;
-	}
-
 	ret = snd_soc_dapm_add_routes(&card->dapm, rt712_spk_map, ARRAY_SIZE(rt712_spk_map));
 	if (ret)
 		dev_err(rtd->dev, "failed to add SPK map: %d\n", ret);
diff --git a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
index 1653e45a0f7d..02ee8e33a99a 100644
--- a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
@@ -15,18 +15,10 @@
 #include <sound/soc-dapm.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-};
-
 static const struct snd_soc_dapm_route rt722_spk_map[] = {
 	{ "Speaker", NULL, "rt722 SPK" },
 };
 
-static const struct snd_kcontrol_new generic_spk_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speaker"),
-};
-
 int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -38,20 +30,6 @@ int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, generic_spk_controls,
-					ARRAY_SIZE(generic_spk_controls));
-	if (ret) {
-		dev_err(card->dev, "failed to add rt722 spk controls: %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_new_controls(&card->dapm, generic_spk_widgets,
-					ARRAY_SIZE(generic_spk_widgets));
-	if (ret) {
-		dev_err(card->dev, "failed to add rt722 spk widgets: %d\n", ret);
-		return ret;
-	}
-
 	ret = snd_soc_dapm_add_routes(&card->dapm, rt722_spk_map, ARRAY_SIZE(rt722_spk_map));
 	if (ret)
 		dev_err(rtd->dev, "failed to add rt722 spk map: %d\n", ret);
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index 03e0978e6a88..218f6c4efe38 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -131,14 +131,6 @@ static int rt_amp_add_device_props(struct device *sdw_dev)
 	return ret;
 }
 
-static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-};
-
-static const struct snd_kcontrol_new generic_spk_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speaker"),
-};
-
 /*
  * dapm routes for rt1308/rt1316/rt1318 will be registered dynamically
  * according to the number of rt1308/rt1316/rt1318 used. The first two
@@ -202,20 +194,6 @@ int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, generic_spk_controls,
-					ARRAY_SIZE(generic_spk_controls));
-	if (ret) {
-		dev_err(card->dev, "%s controls addition failed: %d\n", codec_name, ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_new_controls(&card->dapm, generic_spk_widgets,
-					ARRAY_SIZE(generic_spk_widgets));
-	if (ret) {
-		dev_err(card->dev, "%s widgets addition failed: %d\n", codec_name, ret);
-		return ret;
-	}
-
 	for_each_rtd_codec_dais(rtd, i, dai) {
 		if (strstr(dai->component->name_prefix, "-1"))
 			ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map, 2);
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 932fba8ccf9a..c24a5707fb6c 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -43,11 +43,6 @@ static int rt_sdca_jack_add_codec_device_props(struct device *sdw_dev)
 	return ret;
 }
 
-static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
-	SND_SOC_DAPM_HP("Headphone", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-};
-
 static const struct snd_soc_dapm_route rt711_sdca_map[] = {
 	{ "Headphone", NULL, "rt711 HP" },
 	{ "rt711 MIC2", NULL, "Headset Mic" },
@@ -68,11 +63,6 @@ static const struct snd_soc_dapm_route rt722_sdca_map[] = {
 	{ "rt722 MIC2", NULL, "Headset Mic" },
 };
 
-static const struct snd_kcontrol_new generic_jack_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphone"),
-	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-};
-
 static struct snd_soc_jack_pin rt_sdca_jack_pins[] = {
 	{
 		.pin    = "Headphone",
@@ -129,20 +119,6 @@ int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 		}
 	}
 
-	ret = snd_soc_add_card_controls(card, generic_jack_controls,
-					ARRAY_SIZE(generic_jack_controls));
-	if (ret) {
-		dev_err(card->dev, "rt sdca jack controls addition failed: %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_new_controls(&card->dapm, generic_jack_widgets,
-					ARRAY_SIZE(generic_jack_widgets));
-	if (ret) {
-		dev_err(card->dev, "rt sdca jack widgets addition failed: %d\n", ret);
-		return ret;
-	}
-
 	if (strstr(component->name_prefix, "rt711")) {
 		ret = snd_soc_dapm_add_routes(&card->dapm, rt711_sdca_map,
 					      ARRAY_SIZE(rt711_sdca_map));
-- 
2.40.1

