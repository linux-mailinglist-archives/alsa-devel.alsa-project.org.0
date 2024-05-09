Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C3B8C131F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:38:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52215DEE;
	Thu,  9 May 2024 18:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52215DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272722;
	bh=HFIS8DSM4gtpwh5ikvDkDU0pysFv6IRju/aU5bRKTQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pFfzT8hp9G9YR/11P3oylnZ3FJ6rPGcVelOYZJVndS/rQWyFwlVs6oXTdeB2SiOIg
	 B6mFGmvCYTUnmgkrzK4Cp8KN68EJ0n6QEUC5b6XJdefyn+6sMHNPs8KwIP5mLbZP1M
	 e61+Ufh09JjhwMXDPmd8Ts+dGWWf5facrr4cKOy4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C90FCF80806; Thu,  9 May 2024 18:35:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7350BF80807;
	Thu,  9 May 2024 18:35:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0F5CF80655; Thu,  9 May 2024 18:35:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15ED5F80423
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15ED5F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=l/whc89b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272482; x=1746808482;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HFIS8DSM4gtpwh5ikvDkDU0pysFv6IRju/aU5bRKTQQ=;
  b=l/whc89byJ5CmDix6bUsTqxlXrpK+guzmMFJwUB5n/IdVTbnkQfeYMzT
   D99+PN3hL0+83cWmzhsxFJNx31B5Cb1+llHRujhkC0xGOW0dGm7t2muUD
   /OSZmYunz0KGueAVn+llsmUTLcNKSqwGQWYuIDL4Hsxij4VMQoM9x88/8
   M02idu4cjdODwNnXUXOKxGqtI+BQ1l07UKYabK2eRzL6iBv4rHACKHO3+
   29soIi9FS7KpnJHScUeXgmlQfc/O6CcxZOUKwwLHFXlvVl01R1dlJzMk/
   AiVS22nmsR7iwWbH1S37eQemYTDAU8usYApyKW2aZ15f8IpeayEzh6FeC
   w==;
X-CSE-ConnectionGUID: ZF2Q5KdoSSGdQKY0Pij2HQ==
X-CSE-MsgGUID: r/vNrDZ5TdKOP2GofNfpnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017605"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="15017605"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:33 -0700
X-CSE-ConnectionGUID: zImrGnULSY2xMlqGC2x2ug==
X-CSE-MsgGUID: DLgolRc3RY+oU0lI0mma4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="33761040"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 14/18] ASoC: Intel: sof_sdw: use generic name for
 controls/widgets
Date: Thu,  9 May 2024 11:34:14 -0500
Message-Id: <20240509163418.67746-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J6T62J73AQNE4ZQMHBP5IIQXHLQO4SHB
X-Message-ID-Hash: J6T62J73AQNE4ZQMHBP5IIQXHLQO4SHB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J6T62J73AQNE4ZQMHBP5IIQXHLQO4SHB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Some controls and widgets have exactly the same items. Rename them to be
generic. This is a preparation for further cleanup. No function change.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_cs42l42.c       | 12 ++++++------
 sound/soc/intel/boards/sof_sdw_cs42l43.c       | 18 +++++++++---------
 sound/soc/intel/boards/sof_sdw_cs_amp.c        |  6 +++---
 sound/soc/intel/boards/sof_sdw_rt5682.c        | 12 ++++++------
 sound/soc/intel/boards/sof_sdw_rt711.c         | 12 ++++++------
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c    | 12 ++++++------
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c    | 12 ++++++------
 sound/soc/intel/boards/sof_sdw_rt_amp.c        | 18 +++++++++---------
 .../intel/boards/sof_sdw_rt_sdca_jack_common.c | 12 ++++++------
 9 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index b999f4e7901a..82555c53a9c9 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -17,7 +17,7 @@
 #include <sound/jack.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget cs42l42_widgets[] = {
+static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
@@ -30,7 +30,7 @@ static const struct snd_soc_dapm_route cs42l42_map[] = {
 	{"cs42l42 HS", NULL, "Headset Mic"},
 };
 
-static const struct snd_kcontrol_new cs42l42_controls[] = {
+static const struct snd_kcontrol_new generic_jack_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
@@ -70,15 +70,15 @@ int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, cs42l42_controls,
-					ARRAY_SIZE(cs42l42_controls));
+	ret = snd_soc_add_card_controls(card, generic_jack_controls,
+					ARRAY_SIZE(generic_jack_controls));
 	if (ret) {
 		dev_err(card->dev, "cs42l42 control addition failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, cs42l42_widgets,
-					ARRAY_SIZE(cs42l42_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_jack_widgets,
+					ARRAY_SIZE(generic_jack_widgets));
 	if (ret) {
 		dev_err(card->dev, "cs42l42 widgets addition failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index 0fd5e099bb1a..f76a16795fda 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -18,7 +18,7 @@
 #include <sound/soc-dapm.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget cs42l43_hs_widgets[] = {
+static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
@@ -30,7 +30,7 @@ static const struct snd_soc_dapm_route cs42l43_hs_map[] = {
 	{ "cs42l43 ADC1_IN1_N", NULL, "Headset Mic" },
 };
 
-static const struct snd_soc_dapm_widget cs42l43_spk_widgets[] = {
+static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
@@ -41,7 +41,7 @@ static const struct snd_soc_dapm_route cs42l43_spk_map[] = {
 	{ "Speaker", NULL, "cs42l43 AMP2_OUT_N", },
 };
 
-static const struct snd_soc_dapm_widget cs42l43_dmic_widgets[] = {
+static const struct snd_soc_dapm_widget generic_dmic_widgets[] = {
 	SND_SOC_DAPM_MIC("DMIC", NULL),
 };
 
@@ -74,8 +74,8 @@ int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, cs42l43_hs_widgets,
-					ARRAY_SIZE(cs42l43_hs_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_jack_widgets,
+					ARRAY_SIZE(generic_jack_widgets));
 	if (ret) {
 		dev_err(card->dev, "cs42l43 hs widgets addition failed: %d\n", ret);
 		return ret;
@@ -133,8 +133,8 @@ int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 			return -ENOMEM;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, cs42l43_spk_widgets,
-					ARRAY_SIZE(cs42l43_spk_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_spk_widgets,
+					ARRAY_SIZE(generic_spk_widgets));
 	if (ret) {
 		dev_err(card->dev, "cs42l43 speaker widgets addition failed: %d\n", ret);
 		return ret;
@@ -172,8 +172,8 @@ int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, cs42l43_dmic_widgets,
-					ARRAY_SIZE(cs42l43_dmic_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_dmic_widgets,
+					ARRAY_SIZE(generic_dmic_widgets));
 	if (ret) {
 		dev_err(card->dev, "cs42l43 dmic widgets addition failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_cs_amp.c b/sound/soc/intel/boards/sof_sdw_cs_amp.c
index 3538d3c752b7..e15a4753f103 100644
--- a/sound/soc/intel/boards/sof_sdw_cs_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_cs_amp.c
@@ -14,7 +14,7 @@
 
 #define CODEC_NAME_SIZE	8
 
-static const struct snd_soc_dapm_widget sof_widgets[] = {
+static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
@@ -35,8 +35,8 @@ int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, sof_widgets,
-					ARRAY_SIZE(sof_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_spk_widgets,
+					ARRAY_SIZE(generic_spk_widgets));
 	if (ret) {
 		dev_err(card->dev, "widgets addition failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index f812aea64322..9fbe36322a83 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -17,7 +17,7 @@
 #include <sound/jack.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget rt5682_widgets[] = {
+static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
@@ -29,7 +29,7 @@ static const struct snd_soc_dapm_route rt5682_map[] = {
 	{ "rt5682 IN1P", NULL, "Headset Mic" },
 };
 
-static const struct snd_kcontrol_new rt5682_controls[] = {
+static const struct snd_kcontrol_new generic_jack_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
@@ -69,15 +69,15 @@ int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, rt5682_controls,
-					ARRAY_SIZE(rt5682_controls));
+	ret = snd_soc_add_card_controls(card, generic_jack_controls,
+					ARRAY_SIZE(generic_jack_controls));
 	if (ret) {
 		dev_err(card->dev, "rt5682 control addition failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt5682_widgets,
-					ARRAY_SIZE(rt5682_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_jack_widgets,
+					ARRAY_SIZE(generic_jack_widgets));
 	if (ret) {
 		dev_err(card->dev, "rt5682 widgets addition failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 7e54fc5cbe09..1a0f6692034a 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -42,7 +42,7 @@ static int rt711_add_codec_device_props(struct device *sdw_dev)
 	return ret;
 }
 
-static const struct snd_soc_dapm_widget rt711_widgets[] = {
+static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
@@ -53,7 +53,7 @@ static const struct snd_soc_dapm_route rt711_map[] = {
 	{ "rt711 MIC2", NULL, "Headset Mic" },
 };
 
-static const struct snd_kcontrol_new rt711_controls[] = {
+static const struct snd_kcontrol_new generic_jack_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
@@ -93,15 +93,15 @@ int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, rt711_controls,
-					ARRAY_SIZE(rt711_controls));
+	ret = snd_soc_add_card_controls(card, generic_jack_controls,
+					ARRAY_SIZE(generic_jack_controls));
 	if (ret) {
 		dev_err(card->dev, "rt711 controls addition failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt711_widgets,
-					ARRAY_SIZE(rt711_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_jack_widgets,
+					ARRAY_SIZE(generic_jack_widgets));
 	if (ret) {
 		dev_err(card->dev, "rt711 widgets addition failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
index 0c4cd4cdbd45..42308228c634 100644
--- a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
@@ -15,7 +15,7 @@
 #include <sound/soc-dapm.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget rt712_spk_widgets[] = {
+static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
@@ -30,7 +30,7 @@ static const struct snd_soc_dapm_route rt712_spk_map[] = {
 	{ "Speaker", NULL, "rt712 SPOR" },
 };
 
-static const struct snd_kcontrol_new rt712_spk_controls[] = {
+static const struct snd_kcontrol_new generic_spk_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
@@ -45,15 +45,15 @@ int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, rt712_spk_controls,
-					ARRAY_SIZE(rt712_spk_controls));
+	ret = snd_soc_add_card_controls(card, generic_spk_controls,
+					ARRAY_SIZE(generic_spk_controls));
 	if (ret) {
 		dev_err(card->dev, "rt712 spk controls addition failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt712_spk_widgets,
-					ARRAY_SIZE(rt712_spk_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_spk_widgets,
+					ARRAY_SIZE(generic_spk_widgets));
 	if (ret) {
 		dev_err(card->dev, "rt712 spk widgets addition failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
index e5c2a36e400b..1653e45a0f7d 100644
--- a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
@@ -15,7 +15,7 @@
 #include <sound/soc-dapm.h>
 #include "sof_sdw_common.h"
 
-static const struct snd_soc_dapm_widget rt722_spk_widgets[] = {
+static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
@@ -23,7 +23,7 @@ static const struct snd_soc_dapm_route rt722_spk_map[] = {
 	{ "Speaker", NULL, "rt722 SPK" },
 };
 
-static const struct snd_kcontrol_new rt722_spk_controls[] = {
+static const struct snd_kcontrol_new generic_spk_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
@@ -38,15 +38,15 @@ int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, rt722_spk_controls,
-					ARRAY_SIZE(rt722_spk_controls));
+	ret = snd_soc_add_card_controls(card, generic_spk_controls,
+					ARRAY_SIZE(generic_spk_controls));
 	if (ret) {
 		dev_err(card->dev, "failed to add rt722 spk controls: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt722_spk_widgets,
-					ARRAY_SIZE(rt722_spk_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_spk_widgets,
+					ARRAY_SIZE(generic_spk_widgets));
 	if (ret) {
 		dev_err(card->dev, "failed to add rt722 spk widgets: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index 1b415708500e..03e0978e6a88 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -131,14 +131,14 @@ static int rt_amp_add_device_props(struct device *sdw_dev)
 	return ret;
 }
 
-static const struct snd_kcontrol_new rt_amp_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Speaker"),
-};
-
-static const struct snd_soc_dapm_widget rt_amp_widgets[] = {
+static const struct snd_soc_dapm_widget generic_spk_widgets[] = {
 	SND_SOC_DAPM_SPK("Speaker", NULL),
 };
 
+static const struct snd_kcontrol_new generic_spk_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
 /*
  * dapm routes for rt1308/rt1316/rt1318 will be registered dynamically
  * according to the number of rt1308/rt1316/rt1318 used. The first two
@@ -202,15 +202,15 @@ int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	ret = snd_soc_add_card_controls(card, rt_amp_controls,
-					ARRAY_SIZE(rt_amp_controls));
+	ret = snd_soc_add_card_controls(card, generic_spk_controls,
+					ARRAY_SIZE(generic_spk_controls));
 	if (ret) {
 		dev_err(card->dev, "%s controls addition failed: %d\n", codec_name, ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt_amp_widgets,
-					ARRAY_SIZE(rt_amp_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_spk_widgets,
+					ARRAY_SIZE(generic_spk_widgets));
 	if (ret) {
 		dev_err(card->dev, "%s widgets addition failed: %d\n", codec_name, ret);
 		return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 69161ea5b290..932fba8ccf9a 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -43,7 +43,7 @@ static int rt_sdca_jack_add_codec_device_props(struct device *sdw_dev)
 	return ret;
 }
 
-static const struct snd_soc_dapm_widget rt_sdca_jack_widgets[] = {
+static const struct snd_soc_dapm_widget generic_jack_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
@@ -68,7 +68,7 @@ static const struct snd_soc_dapm_route rt722_sdca_map[] = {
 	{ "rt722 MIC2", NULL, "Headset Mic" },
 };
 
-static const struct snd_kcontrol_new rt_sdca_jack_controls[] = {
+static const struct snd_kcontrol_new generic_jack_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
@@ -129,15 +129,15 @@ int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 		}
 	}
 
-	ret = snd_soc_add_card_controls(card, rt_sdca_jack_controls,
-					ARRAY_SIZE(rt_sdca_jack_controls));
+	ret = snd_soc_add_card_controls(card, generic_jack_controls,
+					ARRAY_SIZE(generic_jack_controls));
 	if (ret) {
 		dev_err(card->dev, "rt sdca jack controls addition failed: %d\n", ret);
 		return ret;
 	}
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, rt_sdca_jack_widgets,
-					ARRAY_SIZE(rt_sdca_jack_widgets));
+	ret = snd_soc_dapm_new_controls(&card->dapm, generic_jack_widgets,
+					ARRAY_SIZE(generic_jack_widgets));
 	if (ret) {
 		dev_err(card->dev, "rt sdca jack widgets addition failed: %d\n", ret);
 		return ret;
-- 
2.40.1

