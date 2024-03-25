Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C80E588B3AB
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:13:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4712419E7;
	Mon, 25 Mar 2024 23:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4712419E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404823;
	bh=JhJlq0hTJM8sHxXoAiEk2EiNfc5u8V9ZaK06FNN/WZ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IHhOpo1rBsN0c7t7/xFy68AYqN88anlEogK/sg7V4DJ8RcQbYHU5lJuRv1s4jmcbZ
	 qc5QlyvZ6kdUnG0e9GNo7kMSlgaYSHT3wps9zr6Gjra4nTOLUpU+mhkfKSGGK0l+OF
	 Tb9vlYCaML2saNZ99vyXKAnfarzOJd93iqosIFCo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0C27F806AE; Mon, 25 Mar 2024 23:11:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6525BF806A2;
	Mon, 25 Mar 2024 23:11:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D768F80074; Mon, 25 Mar 2024 23:11:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4586EF80074
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4586EF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ivwLHBCd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404682; x=1742940682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JhJlq0hTJM8sHxXoAiEk2EiNfc5u8V9ZaK06FNN/WZ4=;
  b=ivwLHBCdoENSpwdB6xOp3kS5sal1zyMLDFQqbw7NTMojI129C0R2TozU
   48Kadtt0qF1XtZgIC6UUWqIt4+KKxUYdX9zoSwgEnISFXi710zhStIJTI
   OcZB/nhQ21TDKbL+MH+3sk6vXSzZCftY5pzFJ0kneN0cHJfOhx44JSIyO
   T5OUbckL7W4ctzgzx70qYun3Eiqv67ruz2G6qwv52T9W5Afcfs8p1o1uw
   EH/RAQkbdHRwYGMpkgxDypbVnFXeyW0Qe/14wF/LBhylvQb+78RM1qoUq
   Qf1u2brY823oTbMITVA2/iuqlHvn3FwaiKg5Qkx12rWzvf385pUO3Ysf0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643602"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643602"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722084"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 01/21] ASoC: Intel: board_helpers: support DAI link ID
 customization
Date: Mon, 25 Mar 2024 17:10:39 -0500
Message-Id: <20240325221059.206042-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZTIFJ3UB44GWLMZQO4UPWXOHM65DUQD5
X-Message-ID-Hash: ZTIFJ3UB44GWLMZQO4UPWXOHM65DUQD5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZTIFJ3UB44GWLMZQO4UPWXOHM65DUQD5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add an new field link_id_overwrite to sof_card_private structure to
support machine drivers which DAI link ID is fixed number or
discontinue (i.e. no-codec boards). If this field is zero, DAI array
index will be used as link ID. Otherwise the value extracted from
link_id_overwrite will be used.

The field link_id_overwrite is supposed to be initialized by
SOF_LINK_IDS macro like following example.

ctx->link_id_overwrite = SOF_LINK_IDS(HEADPHONE_BE_ID,  \
				      DMIC01_BE_ID,     \
				      DMIC16K_BE_ID,    \
				      IDISP_HDMI_BE_ID, \
				      SPK_BE_ID,        \
				      BT_OFFLOAD_BE_ID, \
				      HDMI_IN_BE_ID)

An exception is that, if you use link_order_overwrite to overwrite
DAI link order, then you need to use the same order to build
link_id_overwrite variable as well.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 36 ++++++++++++++++------
 sound/soc/intel/boards/sof_board_helpers.h | 18 +++++++++++
 2 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 088894ff4165..e853dc851c42 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -427,6 +427,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 	int ret;
 	int ssp_hdmi_in = 0;
 	unsigned long link_order, link;
+	unsigned long link_ids, be_id;
 
 	num_links = calculate_num_links(ctx);
 
@@ -440,12 +441,26 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 	else
 		link_order = DEFAULT_LINK_ORDER;
 
-	dev_dbg(dev, "create dai links, link_order 0x%lx\n", link_order);
+	if (ctx->link_id_overwrite)
+		link_ids = ctx->link_id_overwrite;
+	else
+		link_ids = 0;
+
+	dev_dbg(dev, "create dai links, link_order 0x%lx, id_overwrite 0x%lx\n",
+		link_order, link_ids);
 
 	while (link_order) {
 		link = link_order & SOF_LINK_ORDER_MASK;
 		link_order >>= SOF_LINK_ORDER_SHIFT;
 
+		if (ctx->link_id_overwrite) {
+			be_id = link_ids & SOF_LINK_IDS_MASK;
+			link_ids >>= SOF_LINK_IDS_SHIFT;
+		} else {
+			/* use array index as link id */
+			be_id = idx;
+		}
+
 		switch (link) {
 		case SOF_LINK_CODEC:
 			/* headphone codec */
@@ -453,7 +468,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 				continue;
 
 			ret = sof_intel_board_set_codec_link(dev, &links[idx],
-							     idx,
+							     be_id,
 							     ctx->codec_type,
 							     ctx->ssp_codec);
 			if (ret) {
@@ -472,7 +487,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 
 			/* at least we have dmic01 */
 			ret = sof_intel_board_set_dmic_link(dev, &links[idx],
-							    idx, SOF_DMIC_01);
+							    be_id, SOF_DMIC_01);
 			if (ret) {
 				dev_err(dev, "fail to set dmic01 link, ret %d\n",
 					ret);
@@ -488,7 +503,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 
 			/* set up 2 BE links at most */
 			ret = sof_intel_board_set_dmic_link(dev, &links[idx],
-							    idx, SOF_DMIC_16K);
+							    be_id, SOF_DMIC_16K);
 			if (ret) {
 				dev_err(dev, "fail to set dmic16k link, ret %d\n",
 					ret);
@@ -502,7 +517,8 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 			for (i = 1; i <= ctx->hdmi_num; i++) {
 				ret = sof_intel_board_set_intel_hdmi_link(dev,
 									  &links[idx],
-									  idx, i,
+									  be_id,
+									  i,
 									  ctx->hdmi.idisp_codec);
 				if (ret) {
 					dev_err(dev, "fail to set hdmi link, ret %d\n",
@@ -511,6 +527,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 				}
 
 				idx++;
+				be_id++;
 			}
 			break;
 		case SOF_LINK_AMP:
@@ -519,7 +536,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 				continue;
 
 			ret = sof_intel_board_set_ssp_amp_link(dev, &links[idx],
-							       idx,
+							       be_id,
 							       ctx->amp_type,
 							       ctx->ssp_amp);
 			if (ret) {
@@ -536,8 +553,8 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 			if (!ctx->bt_offload_present)
 				continue;
 
-			ret = sof_intel_board_set_bt_link(dev, &links[idx], idx,
-							  ctx->ssp_bt);
+			ret = sof_intel_board_set_bt_link(dev, &links[idx],
+							  be_id, ctx->ssp_bt);
 			if (ret) {
 				dev_err(dev, "fail to set bt link, ret %d\n",
 					ret);
@@ -551,7 +568,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 			for_each_set_bit(ssp_hdmi_in, &ctx->ssp_mask_hdmi_in, 32) {
 				ret = sof_intel_board_set_hdmi_in_link(dev,
 								       &links[idx],
-								       idx,
+								       be_id,
 								       ssp_hdmi_in);
 				if (ret) {
 					dev_err(dev, "fail to set hdmi-in link, ret %d\n",
@@ -560,6 +577,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 				}
 
 				idx++;
+				be_id++;
 			}
 			break;
 		case SOF_LINK_NONE:
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index f42d5d640321..162a5f4841da 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -33,6 +33,18 @@ enum {
 	 (((k6) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 5)) | \
 	 (((k7) & SOF_LINK_ORDER_MASK) << (SOF_LINK_ORDER_SHIFT * 6)))
 
+#define SOF_LINK_IDS_MASK	(0xF)
+#define SOF_LINK_IDS_SHIFT	(4)
+
+#define SOF_LINK_IDS(k1, k2, k3, k4, k5, k6, k7) \
+	((((k1) & SOF_LINK_IDS_MASK) << (SOF_LINK_IDS_SHIFT * 0)) | \
+	 (((k2) & SOF_LINK_IDS_MASK) << (SOF_LINK_IDS_SHIFT * 1)) | \
+	 (((k3) & SOF_LINK_IDS_MASK) << (SOF_LINK_IDS_SHIFT * 2)) | \
+	 (((k4) & SOF_LINK_IDS_MASK) << (SOF_LINK_IDS_SHIFT * 3)) | \
+	 (((k5) & SOF_LINK_IDS_MASK) << (SOF_LINK_IDS_SHIFT * 4)) | \
+	 (((k6) & SOF_LINK_IDS_MASK) << (SOF_LINK_IDS_SHIFT * 5)) | \
+	 (((k7) & SOF_LINK_IDS_MASK) << (SOF_LINK_IDS_SHIFT * 6)))
+
 /*
  * sof_rt5682_private: private data for rt5682 machine driver
  *
@@ -61,6 +73,7 @@ struct sof_rt5682_private {
  * @codec_link: pointer to headset codec dai link
  * @amp_link: pointer to speaker amplifier dai link
  * @link_order_overwrite: custom DAI link order
+ * @link_id_overwrite: custom DAI link ID
  * @rt5682: private data for rt5682 machine driver
  */
 struct sof_card_private {
@@ -84,6 +97,11 @@ struct sof_card_private {
 	struct snd_soc_dai_link *amp_link;
 
 	unsigned long link_order_overwrite;
+	/*
+	 * A variable stores id for all BE DAI links, use SOF_LINK_IDS macro to
+	 * build the value; use DAI link array index as id if zero.
+	 */
+	unsigned long link_id_overwrite;
 
 	union {
 		struct sof_rt5682_private rt5682;
-- 
2.40.1

