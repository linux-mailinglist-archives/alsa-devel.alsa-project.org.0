Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C27F684E5B0
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 17:58:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E44C9E97;
	Thu,  8 Feb 2024 17:57:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E44C9E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411489;
	bh=xdfWejQVbul49etFkgjB6iDos3edVlsKpJlTGBqcd30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eHdkr9kCNI4sf1wBRI7NYrhUOagC1gfj2bj1JBZ9iT0alv5H8M+KWnjDJdfDPwf8K
	 cA6/a196ziTgyk+2Tema/x9z7PkLHv4tdht9GZEVwampDYlBTA/hHeBgb4VA7PSfoQ
	 hvxvn5WrRVmABQKQOtyRFh6VEOe/kQnj+jnNgyEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BDE5F80680; Thu,  8 Feb 2024 17:56:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BC38F8067A;
	Thu,  8 Feb 2024 17:56:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C486EF805E5; Thu,  8 Feb 2024 17:56:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0FAAF80567
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0FAAF80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ACvREZ5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411367; x=1738947367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xdfWejQVbul49etFkgjB6iDos3edVlsKpJlTGBqcd30=;
  b=ACvREZ5Dn46IZHB1wmrtWYRvD1ihBkolSasyvTveB6mP9MORw937jpae
   +VuPmQOKvxOeVozlJr879minP23AdwZ/+tz3ivj1/OB4SPXax9rcWKy27
   lrTyfHI9m4TPxIHCfb9/Zz7ym2MpkgClxroXYUFx5fQfsoF27a3MifVC3
   S0ZvuYPqlC0K9aFNZEYkFMrvT4fs6DnU34Krjz06GScVbKLW2YJb4Nco5
   9Iq4ih9eIPwcFzCKZRNrUyHIymf4rZU7YCrJH6zZ+UQCHWn+zfZpmkEnY
   xkODhElw2u7DdMM1m/gxz8IQaJK9Y2ym3u/OT3IfaScHRk5RnGRpeXIWW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675338"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675338"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:55:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690175"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:55:58 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/24] ASoC: Intel: board_helpers: support DAI link order
 customization
Date: Thu,  8 Feb 2024 10:55:28 -0600
Message-Id: <20240208165545.93811-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XWD6MKXKGMMWCJF4TU4ZJBWPV4GI4VQT
X-Message-ID-Hash: XWD6MKXKGMMWCJF4TU4ZJBWPV4GI4VQT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XWD6MKXKGMMWCJF4TU4ZJBWPV4GI4VQT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add an new field link_order_overwrite to sof_card_private structure to
support machine drivers which DAI link order is different from the
order used in sof_rt5682 (i.e. GLK boards or no-codec boards).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 207 +++++++++++++--------
 sound/soc/intel/boards/sof_board_helpers.h |  26 +++
 2 files changed, 158 insertions(+), 75 deletions(-)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 4f2cb8e52971..25f9ff12618c 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -73,6 +73,16 @@ static int dmic_init(struct snd_soc_pcm_runtime *rtd)
 /*
  * DAI Link Helpers
  */
+
+/* DEFAULT_LINK_ORDER: the order used in sof_rt5682 */
+#define DEFAULT_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_CODEC, \
+					SOF_LINK_DMIC01,       \
+					SOF_LINK_DMIC16K,      \
+					SOF_LINK_IDISP_HDMI,   \
+					SOF_LINK_AMP,          \
+					SOF_LINK_BT_OFFLOAD,   \
+					SOF_LINK_HDMI_IN)
+
 static struct snd_soc_dai_link_component dmic_component[] = {
 	{
 		.name = "dmic-codec",
@@ -416,6 +426,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 	int idx = 0;
 	int ret;
 	int ssp_hdmi_in = 0;
+	unsigned long link_order, link;
 
 	num_links = calculate_num_links(ctx);
 
@@ -424,94 +435,140 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 	if (!links)
 		return -ENOMEM;
 
-	/* headphone codec */
-	if (ctx->codec_type != CODEC_NONE) {
-		ret = sof_intel_board_set_codec_link(dev, &links[idx], idx,
-						     ctx->codec_type,
-						     ctx->ssp_codec);
-		if (ret) {
-			dev_err(dev, "fail to set codec link, ret %d\n", ret);
-			return ret;
-		}
+	if (ctx->link_order_overwrite)
+		link_order = ctx->link_order_overwrite;
+	else
+		link_order = DEFAULT_LINK_ORDER;
 
-		ctx->codec_link = &links[idx];
-		idx++;
-	}
+	dev_dbg(dev, "create dai links, link_order 0x%lx\n", link_order);
 
-	/* dmic01 and dmic16k */
-	if (ctx->dmic_be_num > 0) {
-		/* at least we have dmic01 */
-		ret = sof_intel_board_set_dmic_link(dev, &links[idx], idx,
-						    SOF_DMIC_01);
-		if (ret) {
-			dev_err(dev, "fail to set dmic01 link, ret %d\n", ret);
-			return ret;
-		}
+	while (link_order) {
+		link = link_order & SOF_LINK_ORDER_MASK;
+		link_order >>= SOF_LINK_ORDER_SHIFT;
 
-		idx++;
-	}
+		switch (link) {
+		case SOF_LINK_CODEC:
+			/* headphone codec */
+			if (ctx->codec_type == CODEC_NONE)
+				continue;
 
-	if (ctx->dmic_be_num > 1) {
-		/* set up 2 BE links at most */
-		ret = sof_intel_board_set_dmic_link(dev, &links[idx], idx,
-						    SOF_DMIC_16K);
-		if (ret) {
-			dev_err(dev, "fail to set dmic16k link, ret %d\n", ret);
-			return ret;
-		}
+			ret = sof_intel_board_set_codec_link(dev, &links[idx],
+							     idx,
+							     ctx->codec_type,
+							     ctx->ssp_codec);
+			if (ret) {
+				dev_err(dev, "fail to set codec link, ret %d\n",
+					ret);
+				return ret;
+			}
 
-		idx++;
-	}
+			ctx->codec_link = &links[idx];
+			idx++;
+			break;
+		case SOF_LINK_DMIC01:
+			/* dmic01 */
+			if (ctx->dmic_be_num == 0)
+				continue;
 
-	/* idisp HDMI */
-	for (i = 1; i <= ctx->hdmi_num; i++) {
-		ret = sof_intel_board_set_intel_hdmi_link(dev, &links[idx], idx,
-							  i,
-							  ctx->hdmi.idisp_codec);
-		if (ret) {
-			dev_err(dev, "fail to set hdmi link, ret %d\n", ret);
-			return ret;
-		}
+			/* at least we have dmic01 */
+			ret = sof_intel_board_set_dmic_link(dev, &links[idx],
+							    idx, SOF_DMIC_01);
+			if (ret) {
+				dev_err(dev, "fail to set dmic01 link, ret %d\n",
+					ret);
+				return ret;
+			}
 
-		idx++;
-	}
+			idx++;
+			break;
+		case SOF_LINK_DMIC16K:
+			/* dmic16k */
+			if (ctx->dmic_be_num <= 1)
+				continue;
 
-	/* speaker amp */
-	if (ctx->amp_type != CODEC_NONE) {
-		ret = sof_intel_board_set_ssp_amp_link(dev, &links[idx], idx,
-						       ctx->amp_type,
-						       ctx->ssp_amp);
-		if (ret) {
-			dev_err(dev, "fail to set amp link, ret %d\n", ret);
-			return ret;
-		}
+			/* set up 2 BE links at most */
+			ret = sof_intel_board_set_dmic_link(dev, &links[idx],
+							    idx, SOF_DMIC_16K);
+			if (ret) {
+				dev_err(dev, "fail to set dmic16k link, ret %d\n",
+					ret);
+				return ret;
+			}
 
-		ctx->amp_link = &links[idx];
-		idx++;
-	}
+			idx++;
+			break;
+		case SOF_LINK_IDISP_HDMI:
+			/* idisp HDMI */
+			for (i = 1; i <= ctx->hdmi_num; i++) {
+				ret = sof_intel_board_set_intel_hdmi_link(dev,
+									  &links[idx],
+									  idx, i,
+									  ctx->hdmi.idisp_codec);
+				if (ret) {
+					dev_err(dev, "fail to set hdmi link, ret %d\n",
+						ret);
+					return ret;
+				}
 
-	/* BT audio offload */
-	if (ctx->bt_offload_present) {
-		ret = sof_intel_board_set_bt_link(dev, &links[idx], idx,
-						  ctx->ssp_bt);
-		if (ret) {
-			dev_err(dev, "fail to set bt link, ret %d\n", ret);
-			return ret;
-		}
+				idx++;
+			}
+			break;
+		case SOF_LINK_AMP:
+			/* speaker amp */
+			if (ctx->amp_type == CODEC_NONE)
+				continue;
 
-		idx++;
-	}
+			ret = sof_intel_board_set_ssp_amp_link(dev, &links[idx],
+							       idx,
+							       ctx->amp_type,
+							       ctx->ssp_amp);
+			if (ret) {
+				dev_err(dev, "fail to set amp link, ret %d\n",
+					ret);
+				return ret;
+			}
 
-	/* HDMI-In */
-	for_each_set_bit(ssp_hdmi_in, &ctx->ssp_mask_hdmi_in, 32) {
-		ret = sof_intel_board_set_hdmi_in_link(dev, &links[idx], idx,
-						       ssp_hdmi_in);
-		if (ret) {
-			dev_err(dev, "fail to set hdmi-in link, ret %d\n", ret);
-			return ret;
-		}
+			ctx->amp_link = &links[idx];
+			idx++;
+			break;
+		case SOF_LINK_BT_OFFLOAD:
+			/* BT audio offload */
+			if (!ctx->bt_offload_present)
+				continue;
+
+			ret = sof_intel_board_set_bt_link(dev, &links[idx], idx,
+							  ctx->ssp_bt);
+			if (ret) {
+				dev_err(dev, "fail to set bt link, ret %d\n",
+					ret);
+				return ret;
+			}
 
-		idx++;
+			idx++;
+			break;
+		case SOF_LINK_HDMI_IN:
+			/* HDMI-In */
+			for_each_set_bit(ssp_hdmi_in, &ctx->ssp_mask_hdmi_in, 32) {
+				ret = sof_intel_board_set_hdmi_in_link(dev,
+								       &links[idx],
+								       idx,
+								       ssp_hdmi_in);
+				if (ret) {
+					dev_err(dev, "fail to set hdmi-in link, ret %d\n",
+						ret);
+					return ret;
+				}
+
+				idx++;
+			}
+			break;
+		case SOF_LINK_NONE:
+			/* caught here if it's not used as terminator in macro */
+			fallthrough;
+		default:
+			dev_err(dev, "invalid link type %ld\n", link);
+			return -EINVAL;
+		}
 	}
 
 	if (idx != num_links) {
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 3b36058118ca..c5d6e7bec5d4 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -10,6 +10,29 @@
 #include "sof_hdmi_common.h"
 #include "sof_ssp_common.h"
 
+enum {
+	SOF_LINK_NONE = 0,
+	SOF_LINK_CODEC,
+	SOF_LINK_DMIC01,
+	SOF_LINK_DMIC16K,
+	SOF_LINK_IDISP_HDMI,
+	SOF_LINK_AMP,
+	SOF_LINK_BT_OFFLOAD,
+	SOF_LINK_HDMI_IN,
+};
+
+#define SOF_LINK_ORDER_MASK	(0xF)
+#define SOF_LINK_ORDER_SHIFT	(4)
+
+#define SOF_LINK_ORDER(k1, k2, k3, k4, k5, k6, k7) \
+	((((k1) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 0)) | \
+	 (((k2) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 1)) | \
+	 (((k3) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 2)) | \
+	 (((k4) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 3)) | \
+	 (((k5) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 4)) | \
+	 (((k6) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 5)) | \
+	 (((k7) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 6)))
+
 /*
  * sof_rt5682_private: private data for rt5682 machine driver
  *
@@ -37,6 +60,7 @@ struct sof_rt5682_private {
  * @bt_offload_present: true to create BT offload BE link
  * @codec_link: pointer to headset codec dai link
  * @amp_link: pointer to speaker amplifier dai link
+ * @link_order_overwrite: custom DAI link order
  * @rt5682: private data for rt5682 machine driver
  */
 struct sof_card_private {
@@ -59,6 +83,8 @@ struct sof_card_private {
 	struct snd_soc_dai_link *codec_link;
 	struct snd_soc_dai_link *amp_link;
 
+	unsigned long link_order_overwrite;
+
 	union {
 		struct sof_rt5682_private rt5682;
 	};
-- 
2.40.1

