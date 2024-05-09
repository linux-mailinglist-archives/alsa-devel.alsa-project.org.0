Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 306768C1320
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:39:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D015DE0D;
	Thu,  9 May 2024 18:38:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D015DE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272740;
	bh=xA3IIT0DKbU7wHLGDknT1Vogy+5Y/12tE8e6UKY6e5o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=if23lGmofBfSwz3nnz7LLPTJdL2XElLBzHy0lduA1gCozq/lb5rjw1vkJN2m+7/rj
	 wCdQhe/Qz8v9C17//T1CHNVt7tqUNo1kxCV7q8Y5+t4imKiYarmtd8Wbfw6Qgdwy4k
	 2Qr9T3EKeHsk7hVjnhcJA3dYNwQiG1KOXWEl293Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61C50F808C2; Thu,  9 May 2024 18:35:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E75DF8087A;
	Thu,  9 May 2024 18:35:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92516F8070D; Thu,  9 May 2024 18:35:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 363ADF8057A
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 363ADF8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=n6JMlXax
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272484; x=1746808484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xA3IIT0DKbU7wHLGDknT1Vogy+5Y/12tE8e6UKY6e5o=;
  b=n6JMlXaxEJmiDAchGz5srTLoOE+UQZrL87EQQ+6t5cwSG0b6765+Tw5f
   e9/bk2Thc+gKJPY2K3z+X48Ps1qy+NOI7tzWqdvD8tAPd4r4txJj/2t7U
   YBAjZV7Z7dTRVMGQ4GKfaRKMiVB9AtVggrd+WNzmyVtBzcSAvaOMIj6jq
   xUnwyPUydqyDWp8wqH9gvL7624q+CyE50ZsHK128nVARXtd4zjeRkTQqV
   beJmbDj3YjT4U+zgp8BvErr8NUy8t1otmBhNaeHe8NrT9OeIG0vepyIGq
   vc7b/a91ykjB3hi7JJk4gEvCVaLBxpp/cYFGfc4Lp+M2ipxsOfCWM+2to
   A==;
X-CSE-ConnectionGUID: ZPUQ8uW7Q9G5qTYqed7NNw==
X-CSE-MsgGUID: DD2ye1lsS6uX2N5cgUfQQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017624"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="15017624"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:34 -0700
X-CSE-ConnectionGUID: wSvCgW4lQOyhUO1tzBnH2A==
X-CSE-MsgGUID: Hz1Ow3G5RwyndLhP/Tr8Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="33761048"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 17/18] ASoC: Intel: sof_sdw: add dai parameter to rtd_init
 callback
Date: Thu,  9 May 2024 11:34:17 -0500
Message-Id: <20240509163418.67746-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3RKUJBHYXALE5CQZFCTN7DX3SB6IEZXC
X-Message-ID-Hash: 3RKUJBHYXALE5CQZFCTN7DX3SB6IEZXC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3RKUJBHYXALE5CQZFCTN7DX3SB6IEZXC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

A generic .rtd_init() callback could be used by different dais. It is
useful to pass dai parameter to the callback. The dai parameter will be
used in the follow up commit. No functional change here.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c              |  2 +-
 sound/soc/intel/boards/sof_sdw_common.h       | 30 +++++++++----------
 sound/soc/intel/boards/sof_sdw_cs42l42.c      |  2 +-
 sound/soc/intel/boards/sof_sdw_cs42l43.c      |  6 ++--
 sound/soc/intel/boards/sof_sdw_cs_amp.c       |  2 +-
 sound/soc/intel/boards/sof_sdw_maxim.c        |  2 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c       |  2 +-
 sound/soc/intel/boards/sof_sdw_rt700.c        |  2 +-
 sound/soc/intel/boards/sof_sdw_rt711.c        |  2 +-
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c   |  2 +-
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c   |  2 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c       | 10 +++----
 sound/soc/intel/boards/sof_sdw_rt_dmic.c      |  2 +-
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  2 +-
 14 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 8c1497bab2ef..e41b0d95e0ff 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1411,7 +1411,7 @@ static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 skip_add_controls_widgets:
 		if (codec_info->dais[dai_index].rtd_init) {
-			ret = codec_info->dais[dai_index].rtd_init(rtd);
+			ret = codec_info->dais[dai_index].rtd_init(rtd, dai);
 			if (ret)
 				return ret;
 		}
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index a8ba39bd5fd8..3dfba6f6b95d 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -95,7 +95,7 @@ struct sof_sdw_dai_info {
 		     struct sof_sdw_codec_info *info,
 		     bool playback);
 	int (*exit)(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
-	int (*rtd_init)(struct snd_soc_pcm_runtime *rtd);
+	int (*rtd_init)(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 	bool rtd_init_done; /* Indicate that the rtd_init callback is done */
 	unsigned long quirk;
 };
@@ -208,19 +208,19 @@ int sof_sdw_cs_amp_init(struct snd_soc_card *card,
 
 /* dai_link init callbacks */
 
-int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
-int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
+int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai);
 
 #endif
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index 9783d5fb2d91..fdb75fc71c26 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -40,7 +40,7 @@ static const char * const jack_codecs[] = {
 	"cs42l42"
 };
 
-int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index 2dd0f085fe60..b7e2750c1074 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -48,7 +48,7 @@ static struct snd_soc_jack_pin sof_jack_pins[] = {
 	},
 };
 
-int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
@@ -99,7 +99,7 @@ int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
@@ -135,7 +135,7 @@ int sof_sdw_cs42l43_spk_init(struct snd_soc_card *card,
 	return bridge_cs35l56_spk_init(card, dai_links, info, playback);
 }
 
-int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_cs_amp.c b/sound/soc/intel/boards/sof_sdw_cs_amp.c
index 663c0e1d2c56..10e08207619a 100644
--- a/sound/soc/intel/boards/sof_sdw_cs_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_cs_amp.c
@@ -14,7 +14,7 @@
 
 #define CODEC_NAME_SIZE	8
 
-int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	const char *dai_name = rtd->dai_link->codecs->dai_name;
 	struct snd_soc_card *card = rtd->card;
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index a7a8db624818..b7f73177867f 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -21,7 +21,7 @@ static const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
 	{ "Right Spk", NULL, "Right BE_OUT" },
 };
 
-int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index 1741226fe052..96f193798540 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -39,7 +39,7 @@ static const char * const jack_codecs[] = {
 	"rt5682"
 };
 
-int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index 58677a8968ab..f9575db9d99c 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -37,7 +37,7 @@ static const char * const jack_codecs[] = {
 	"rt700"
 };
 
-int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 4cff48a37e3c..d49e5aa786c3 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -63,7 +63,7 @@ static const char * const jack_codecs[] = {
 	"rt711"
 };
 
-int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
index ee2c57a50f0d..788796461885 100644
--- a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
@@ -26,7 +26,7 @@ static const struct snd_soc_dapm_route rt712_spk_map[] = {
 	{ "Speaker", NULL, "rt712 SPOR" },
 };
 
-int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
index 02ee8e33a99a..083d281bd052 100644
--- a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
@@ -19,7 +19,7 @@ static const struct snd_soc_dapm_route rt722_spk_map[] = {
 	{ "Speaker", NULL, "rt722 SPK" },
 };
 
-int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	int ret;
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index 218f6c4efe38..df03441ab364 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -177,12 +177,12 @@ static const struct snd_soc_dapm_route *get_codec_name_and_route(struct snd_soc_
 		return rt1318_map;
 }
 
-int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	const struct snd_soc_dapm_route *rt_amp_map;
 	char codec_name[CODEC_NAME_SIZE];
-	struct snd_soc_dai *dai;
+	struct snd_soc_dai *codec_dai;
 	int ret;
 	int i;
 
@@ -194,10 +194,10 @@ int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (!card->components)
 		return -ENOMEM;
 
-	for_each_rtd_codec_dais(rtd, i, dai) {
-		if (strstr(dai->component->name_prefix, "-1"))
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (strstr(codec_dai->component->name_prefix, "-1"))
 			ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map, 2);
-		else if (strstr(dai->component->name_prefix, "-2"))
+		else if (strstr(codec_dai->component->name_prefix, "-2"))
 			ret = snd_soc_dapm_add_routes(&card->dapm, rt_amp_map + 2, 2);
 	}
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt_dmic.c b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
index 2f7ed9b31e79..b8b493d5c6ec 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_dmic.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
@@ -19,7 +19,7 @@ static const char * const dmics[] = {
 	"rt722-sdca",
 };
 
-int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_component *component;
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index c24a5707fb6c..701b0372f59e 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -87,7 +87,7 @@ static const char * const need_sdca_suffix[] = {
 	"rt711", "rt713"
 };
 
-int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
+int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-- 
2.40.1

