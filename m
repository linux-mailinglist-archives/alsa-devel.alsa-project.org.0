Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C078088B39E
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:13:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34BEE218F;
	Mon, 25 Mar 2024 23:13:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34BEE218F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404804;
	bh=9MzgSaL4b2SEm9kQyW13sQcHVrXyc+A1wSFX0z0Qljo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=POVSmQCSXvlCWE8kY9GzpT1XdOST8h+koI9F2vqmTkHYf5Q1LtOWkC65NXeX2zapR
	 YShUWEnGcT7WehZ/URMHWBz/eB8OkOrFEFKRJoNa1p4OrPwWhNDcv+9T5csXCyZvYi
	 nFU+pcogImc0gT5Ni7JHfTogm15UjKa59v8jQ8ww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF8F5F80690; Mon, 25 Mar 2024 23:11:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7242BF80688;
	Mon, 25 Mar 2024 23:11:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E7E4F805EB; Mon, 25 Mar 2024 23:11:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80FCDF802DB
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80FCDF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=n+l87ptU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404683; x=1742940683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9MzgSaL4b2SEm9kQyW13sQcHVrXyc+A1wSFX0z0Qljo=;
  b=n+l87ptUFQN9fwwA2Vrie8CG0Bc62WwHtCtPfLJWcj2WnHSZGOvbLxd0
   c49u70M8tgClmsTgzGFvpeE7m5989V6Wx+ZwoDdD+Dxkoiooj+5kHf0Iv
   cJMKyeXsewiIRlH/Voqt+KmuZyL4Jqetw2XTVOt6Hf475BZeQLD21PGM2
   YN2dwu6uN2cU6SG9Opa8wxGGDWlgipZ9022Qw5G3+uHBnQtUDANXust5W
   kdqbhQYurEhyr3SQJz2yozN3q5IImlUwShPiL0JPrLEWKZG4vxIAextgd
   61GsZ7AMzGBgL0Ge2XSP1ANki1kZp+Fsc1uq5FCA3bieGGKh8l72rmopM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643611"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643611"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722098"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/21] ASoC: Intel: board_helpers: change dai link helpers to
 static function
Date: Mon, 25 Mar 2024 17:10:41 -0500
Message-Id: <20240325221059.206042-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WLXOAM3MKYURBF5EGQBJT2GHKNLEGQY7
X-Message-ID-Hash: WLXOAM3MKYURBF5EGQBJT2GHKNLEGQY7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WLXOAM3MKYURBF5EGQBJT2GHKNLEGQY7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Since there is a helper function to generate entire DAI link array, we
switch individual dai link helpers to static function. No functional
change in this commit.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 85 +++++++++-------------
 sound/soc/intel/boards/sof_board_helpers.h | 24 ------
 2 files changed, 35 insertions(+), 74 deletions(-)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index e853dc851c42..feba1a522527 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -74,6 +74,11 @@ static int dmic_init(struct snd_soc_pcm_runtime *rtd)
  * DAI Link Helpers
  */
 
+enum sof_dmic_be_type {
+	SOF_DMIC_01,
+	SOF_DMIC_16K,
+};
+
 /* DEFAULT_LINK_ORDER: the order used in sof_rt5682 */
 #define DEFAULT_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_CODEC, \
 					SOF_LINK_DMIC01,       \
@@ -97,13 +102,13 @@ static struct snd_soc_dai_link_component platform_component[] = {
 	}
 };
 
-int sof_intel_board_set_codec_link(struct device *dev,
-				   struct snd_soc_dai_link *link, int be_id,
-				   enum sof_ssp_codec codec_type, int ssp_codec)
+static int set_ssp_codec_link(struct device *dev, struct snd_soc_dai_link *link,
+			      int be_id, enum sof_ssp_codec codec_type,
+			      int ssp_codec)
 {
 	struct snd_soc_dai_link_component *cpus;
 
-	dev_dbg(dev, "link %d: codec %s, ssp %d\n", be_id,
+	dev_dbg(dev, "link %d: ssp codec %s, ssp %d\n", be_id,
 		sof_ssp_get_codec_name(codec_type), ssp_codec);
 
 	/* link name */
@@ -144,11 +149,9 @@ int sof_intel_board_set_codec_link(struct device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(sof_intel_board_set_codec_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
-int sof_intel_board_set_dmic_link(struct device *dev,
-				  struct snd_soc_dai_link *link, int be_id,
-				  enum sof_dmic_be_type be_type)
+static int set_dmic_link(struct device *dev, struct snd_soc_dai_link *link,
+			 int be_id, enum sof_dmic_be_type be_type)
 {
 	struct snd_soc_dai_link_component *cpus;
 
@@ -196,16 +199,14 @@ int sof_intel_board_set_dmic_link(struct device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(sof_intel_board_set_dmic_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
-int sof_intel_board_set_intel_hdmi_link(struct device *dev,
-					struct snd_soc_dai_link *link, int be_id,
-					int hdmi_id, bool idisp_codec)
+static int set_idisp_hdmi_link(struct device *dev, struct snd_soc_dai_link *link,
+			       int be_id, int hdmi_id, bool idisp_codec)
 {
 	struct snd_soc_dai_link_component *cpus, *codecs;
 
-	dev_dbg(dev, "link %d: intel hdmi, hdmi id %d, idisp codec %d\n",
-		be_id, hdmi_id, idisp_codec);
+	dev_dbg(dev, "link %d: idisp hdmi %d, idisp codec %d\n", be_id, hdmi_id,
+		idisp_codec);
 
 	/* link name */
 	link->name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d", hdmi_id);
@@ -256,11 +257,9 @@ int sof_intel_board_set_intel_hdmi_link(struct device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(sof_intel_board_set_intel_hdmi_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
-int sof_intel_board_set_ssp_amp_link(struct device *dev,
-				     struct snd_soc_dai_link *link, int be_id,
-				     enum sof_ssp_codec amp_type, int ssp_amp)
+static int set_ssp_amp_link(struct device *dev, struct snd_soc_dai_link *link,
+			    int be_id, enum sof_ssp_codec amp_type, int ssp_amp)
 {
 	struct snd_soc_dai_link_component *cpus;
 
@@ -298,11 +297,9 @@ int sof_intel_board_set_ssp_amp_link(struct device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(sof_intel_board_set_ssp_amp_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
-int sof_intel_board_set_bt_link(struct device *dev,
-				struct snd_soc_dai_link *link, int be_id,
-				int ssp_bt)
+static int set_bt_offload_link(struct device *dev, struct snd_soc_dai_link *link,
+			       int be_id, int ssp_bt)
 {
 	struct snd_soc_dai_link_component *cpus;
 
@@ -341,11 +338,9 @@ int sof_intel_board_set_bt_link(struct device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(sof_intel_board_set_bt_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
-int sof_intel_board_set_hdmi_in_link(struct device *dev,
-				     struct snd_soc_dai_link *link, int be_id,
-				     int ssp_hdmi)
+static int set_hdmi_in_link(struct device *dev, struct snd_soc_dai_link *link,
+			    int be_id, int ssp_hdmi)
 {
 	struct snd_soc_dai_link_component *cpus;
 
@@ -383,7 +378,6 @@ int sof_intel_board_set_hdmi_in_link(struct device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(sof_intel_board_set_hdmi_in_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
 static int calculate_num_links(struct sof_card_private *ctx)
 {
@@ -467,10 +461,8 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 			if (ctx->codec_type == CODEC_NONE)
 				continue;
 
-			ret = sof_intel_board_set_codec_link(dev, &links[idx],
-							     be_id,
-							     ctx->codec_type,
-							     ctx->ssp_codec);
+			ret = set_ssp_codec_link(dev, &links[idx], be_id,
+						 ctx->codec_type, ctx->ssp_codec);
 			if (ret) {
 				dev_err(dev, "fail to set codec link, ret %d\n",
 					ret);
@@ -486,8 +478,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 				continue;
 
 			/* at least we have dmic01 */
-			ret = sof_intel_board_set_dmic_link(dev, &links[idx],
-							    be_id, SOF_DMIC_01);
+			ret = set_dmic_link(dev, &links[idx], be_id, SOF_DMIC_01);
 			if (ret) {
 				dev_err(dev, "fail to set dmic01 link, ret %d\n",
 					ret);
@@ -502,8 +493,8 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 				continue;
 
 			/* set up 2 BE links at most */
-			ret = sof_intel_board_set_dmic_link(dev, &links[idx],
-							    be_id, SOF_DMIC_16K);
+			ret = set_dmic_link(dev, &links[idx], be_id,
+					    SOF_DMIC_16K);
 			if (ret) {
 				dev_err(dev, "fail to set dmic16k link, ret %d\n",
 					ret);
@@ -515,11 +506,9 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 		case SOF_LINK_IDISP_HDMI:
 			/* idisp HDMI */
 			for (i = 1; i <= ctx->hdmi_num; i++) {
-				ret = sof_intel_board_set_intel_hdmi_link(dev,
-									  &links[idx],
-									  be_id,
-									  i,
-									  ctx->hdmi.idisp_codec);
+				ret = set_idisp_hdmi_link(dev, &links[idx],
+							  be_id, i,
+							  ctx->hdmi.idisp_codec);
 				if (ret) {
 					dev_err(dev, "fail to set hdmi link, ret %d\n",
 						ret);
@@ -535,10 +524,8 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 			if (ctx->amp_type == CODEC_NONE)
 				continue;
 
-			ret = sof_intel_board_set_ssp_amp_link(dev, &links[idx],
-							       be_id,
-							       ctx->amp_type,
-							       ctx->ssp_amp);
+			ret = set_ssp_amp_link(dev, &links[idx], be_id,
+					       ctx->amp_type, ctx->ssp_amp);
 			if (ret) {
 				dev_err(dev, "fail to set amp link, ret %d\n",
 					ret);
@@ -553,8 +540,8 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 			if (!ctx->bt_offload_present)
 				continue;
 
-			ret = sof_intel_board_set_bt_link(dev, &links[idx],
-							  be_id, ctx->ssp_bt);
+			ret = set_bt_offload_link(dev, &links[idx], be_id,
+						  ctx->ssp_bt);
 			if (ret) {
 				dev_err(dev, "fail to set bt link, ret %d\n",
 					ret);
@@ -566,10 +553,8 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 		case SOF_LINK_HDMI_IN:
 			/* HDMI-In */
 			for_each_set_bit(ssp_hdmi_in, &ctx->ssp_mask_hdmi_in, 32) {
-				ret = sof_intel_board_set_hdmi_in_link(dev,
-								       &links[idx],
-								       be_id,
-								       ssp_hdmi_in);
+				ret = set_hdmi_in_link(dev, &links[idx], be_id,
+						       ssp_hdmi_in);
 				if (ret) {
 					dev_err(dev, "fail to set hdmi-in link, ret %d\n",
 						ret);
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 162a5f4841da..38e459e6af9b 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -108,34 +108,10 @@ struct sof_card_private {
 	};
 };
 
-enum sof_dmic_be_type {
-	SOF_DMIC_01,
-	SOF_DMIC_16K,
-};
-
 int sof_intel_board_card_late_probe(struct snd_soc_card *card);
 int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 				 struct sof_card_private *ctx);
 
-int sof_intel_board_set_codec_link(struct device *dev,
-				   struct snd_soc_dai_link *link, int be_id,
-				   enum sof_ssp_codec codec_type, int ssp_codec);
-int sof_intel_board_set_dmic_link(struct device *dev,
-				  struct snd_soc_dai_link *link, int be_id,
-				  enum sof_dmic_be_type be_type);
-int sof_intel_board_set_intel_hdmi_link(struct device *dev,
-					struct snd_soc_dai_link *link, int be_id,
-					int hdmi_id, bool idisp_codec);
-int sof_intel_board_set_ssp_amp_link(struct device *dev,
-				     struct snd_soc_dai_link *link, int be_id,
-				     enum sof_ssp_codec amp_type, int ssp_amp);
-int sof_intel_board_set_bt_link(struct device *dev,
-				struct snd_soc_dai_link *link, int be_id,
-				int ssp_bt);
-int sof_intel_board_set_hdmi_in_link(struct device *dev,
-				     struct snd_soc_dai_link *link, int be_id,
-				     int ssp_hdmi);
-
 struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
 					  const char * const dai_name[], int num_dais);
 
-- 
2.40.1

