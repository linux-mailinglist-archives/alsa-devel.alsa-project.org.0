Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 846CC88B396
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:12:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F10C2110;
	Mon, 25 Mar 2024 23:12:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F10C2110
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404740;
	bh=C6iqP+SUqKOGYlTuczVziDcc3fuv3N3E/oj7Kxnbnxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=atWS1FHHA/bHwlE3XBxMHR1TtQ1dJPYsWQTbQXdPwSpPQQNF7qx1AbeZosVmRYRiR
	 hEzENqcIPcoMaSJXj/nVZ2TmoRXU2vd0VKxete+IoiJ52zfvyYVfPs00haxnvF0pWk
	 KlFIiNt0PHJ7GuFxdACjXZ93QDnK5AfCPv1OcIZo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3961F805DA; Mon, 25 Mar 2024 23:11:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C76F9F805DA;
	Mon, 25 Mar 2024 23:11:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 567E1F805BF; Mon, 25 Mar 2024 23:11:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88D91F8025F
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88D91F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=i/LpUQMd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404682; x=1742940682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C6iqP+SUqKOGYlTuczVziDcc3fuv3N3E/oj7Kxnbnxg=;
  b=i/LpUQMdtgHKc9hJLyxj0mrxMrr0jWIjXMe1ML970AaL9F3D/Ybx4zd8
   FE8halTOL7U/b9937R2ihv/CTfbpUsseARZCkjtwdMGMP0rSmSd+2xfZT
   UscTb7yTi510WKovpzopxmKvk+19b5ZMO4qmZP3HqPLStj6d3IarrGKgm
   lxdQY/wwK9uNBHtD5Svqt3rVwlnqAFGyTK/wnltcnVzUfUxCiIn01MiyE
   IUnUi3GZ7oWdBhn8NAKpEYb1DALI4Naluc6UUAlJoJlLQOg/bpbH+UFmQ
   bDGCgs0vSO30HzjqhicH95mm0qTAoXfCbWGQvvnZU9Y44RoQzJJYsINp5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643606"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643606"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722089"
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
Subject: [PATCH 02/21] ASoC: Intel: sof_ssp_amp: use common module for DAI
 link generation
Date: Mon, 25 Mar 2024 17:10:40 -0500
Message-Id: <20240325221059.206042-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z36AKVKEOZQHLRRW5LDEQ2WT3MX4NNSY
X-Message-ID-Hash: Z36AKVKEOZQHLRRW5LDEQ2WT3MX4NNSY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z36AKVKEOZQHLRRW5LDEQ2WT3MX4NNSY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use intel_board module to generate DAI link array and update num_links
field in snd_soc_card structure.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 178 ++++++++-------------------
 1 file changed, 53 insertions(+), 125 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index ee2e813bf4c0..0b8adab76755 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -75,126 +75,64 @@ static struct snd_soc_card sof_ssp_amp_card = {
 #define HDMI_IN_BE_ID		0
 #define SPK_BE_ID		2
 #define DMIC01_BE_ID		3
-#define DMIC16K_BE_ID		4
 #define INTEL_HDMI_BE_ID	5
+/* extra BE links to support no-hdmi-in boards */
+#define DMIC16K_BE_ID		4
+#define BT_OFFLOAD_BE_ID	8
 
-static struct snd_soc_dai_link *
-sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
-			  int ssp_amp, int dmic_be_num, int hdmi_num,
-			  bool idisp_codec)
+#define SSP_AMP_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_HDMI_IN, \
+					SOF_LINK_AMP,            \
+					SOF_LINK_DMIC01,         \
+					SOF_LINK_DMIC16K,        \
+					SOF_LINK_IDISP_HDMI,     \
+					SOF_LINK_BT_OFFLOAD,     \
+					SOF_LINK_NONE)
+
+#define SSP_AMP_LINK_IDS	SOF_LINK_ORDER(HDMI_IN_BE_ID, \
+					SPK_BE_ID,            \
+					DMIC01_BE_ID,         \
+					DMIC16K_BE_ID,        \
+					INTEL_HDMI_BE_ID,     \
+					BT_OFFLOAD_BE_ID,     \
+					0)
+
+static int
+sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
+			  struct sof_card_private *ctx)
 {
-	struct snd_soc_dai_link *links;
-	int i;
-	int id = 0;
 	int ret;
-	bool fixed_be = false;
-	int be_id;
-	unsigned long ssp_mask_hdmi_in;
 
-	links = devm_kcalloc(dev, sof_ssp_amp_card.num_links,
-					sizeof(struct snd_soc_dai_link), GFP_KERNEL);
-	if (!links)
-		return NULL;
+	ret = sof_intel_board_set_dai_link(dev, card, ctx);
+	if (ret)
+		return ret;
 
-	/* HDMI-In SSP */
-	ssp_mask_hdmi_in = (sof_ssp_amp_quirk & SOF_HDMI_CAPTURE_SSP_MASK_MASK) >>
-				SOF_HDMI_CAPTURE_SSP_MASK_SHIFT;
+	if (ctx->amp_type == CODEC_NONE)
+		return 0;
 
-	if (ssp_mask_hdmi_in) {
-		int port = 0;
-
-		/* the topology supports HDMI-IN uses fixed BE ID for DAI links */
-		fixed_be = true;
-
-		be_id = HDMI_IN_BE_ID;
-		for_each_set_bit(port, &ssp_mask_hdmi_in, 32) {
-			ret = sof_intel_board_set_hdmi_in_link(dev, &links[id],
-							       be_id, port);
-			if (ret)
-				return NULL;
-
-			id++;
-			be_id++;
-		}
-	}
-
-	/* codec SSP */
-	if (amp_type != CODEC_NONE) {
-		be_id = fixed_be ? SPK_BE_ID : id;
-		ret = sof_intel_board_set_ssp_amp_link(dev, &links[id], be_id,
-						       amp_type, ssp_amp);
-		if (ret)
-			return NULL;
-
-		/* codec-specific fields */
-		switch (amp_type) {
-		case CODEC_CS35L41:
-			cs35l41_set_dai_link(&links[id]);
-			break;
-		case CODEC_RT1308:
-			sof_rt1308_dai_link(&links[id]);
-			break;
-		default:
-			dev_err(dev, "invalid amp type %d\n", amp_type);
-			return NULL;
-		}
-
-		id++;
-	}
-
-	/* dmic */
-	if (dmic_be_num > 0) {
-		/* at least we have dmic01 */
-		be_id = fixed_be ? DMIC01_BE_ID : id;
-		ret = sof_intel_board_set_dmic_link(dev, &links[id], be_id,
-						    SOF_DMIC_01);
-		if (ret)
-			return NULL;
-
-		id++;
+	if (!ctx->amp_link) {
+		dev_err(dev, "amp link not available");
+		return -EINVAL;
 	}
 
-	if (dmic_be_num > 1) {
-		/* set up 2 BE links at most */
-		be_id = fixed_be ? DMIC16K_BE_ID : id;
-		ret = sof_intel_board_set_dmic_link(dev, &links[id], be_id,
-						    SOF_DMIC_16K);
-		if (ret)
-			return NULL;
-
-		id++;
-	}
-
-	/* HDMI playback */
-	for (i = 1; i <= hdmi_num; i++) {
-		be_id = fixed_be ? (INTEL_HDMI_BE_ID + i - 1) : id;
-		ret = sof_intel_board_set_intel_hdmi_link(dev, &links[id], be_id,
-							  i, idisp_codec);
-		if (ret)
-			return NULL;
-
-		id++;
-	}
-
-	/* BT audio offload */
-	if (sof_ssp_amp_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
-		int port = (sof_ssp_amp_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
-				SOF_BT_OFFLOAD_SSP_SHIFT;
-
-		ret = sof_intel_board_set_bt_link(dev, &links[id], id, port);
-		if (ret)
-			return NULL;
-
-		id++;
+	/* codec-specific fields for speaker amplifier */
+	switch (ctx->amp_type) {
+	case CODEC_CS35L41:
+		cs35l41_set_dai_link(ctx->amp_link);
+		break;
+	case CODEC_RT1308:
+		sof_rt1308_dai_link(ctx->amp_link);
+		break;
+	default:
+		dev_err(dev, "invalid amp type %d\n", ctx->amp_type);
+		return -EINVAL;
 	}
 
-	return links;
+	return 0;
 }
 
 static int sof_ssp_amp_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
-	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
 	int ret;
 
@@ -221,15 +159,6 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 
 	ctx->ssp_amp = sof_ssp_amp_quirk & SOF_AMPLIFIER_SSP_MASK;
 
-	/* set number of dai links */
-	sof_ssp_amp_card.num_links = ctx->dmic_be_num;
-
-	if (ctx->amp_type != CODEC_NONE)
-		sof_ssp_amp_card.num_links++;
-
-	if (ctx->ssp_mask_hdmi_in)
-		sof_ssp_amp_card.num_links += hweight32(ctx->ssp_mask_hdmi_in);
-
 	if (sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT) {
 		ctx->hdmi_num = (sof_ssp_amp_quirk & SOF_NO_OF_HDMI_PLAYBACK_MASK) >>
 				SOF_NO_OF_HDMI_PLAYBACK_SHIFT;
@@ -239,25 +168,24 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 
 		if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 			ctx->hdmi.idisp_codec = true;
-
-		sof_ssp_amp_card.num_links += ctx->hdmi_num;
 	} else {
 		ctx->hdmi_num = 0;
 	}
 
-	if (sof_ssp_amp_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
+	if (sof_ssp_amp_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		ctx->bt_offload_present = true;
-		sof_ssp_amp_card.num_links++;
+
+	ctx->link_order_overwrite = SSP_AMP_LINK_ORDER;
+
+	if (ctx->ssp_mask_hdmi_in) {
+		/* the topology supports HDMI-IN uses fixed BE ID for DAI links */
+		ctx->link_id_overwrite = SSP_AMP_LINK_IDS;
 	}
 
-	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
-					      ctx->ssp_amp, ctx->dmic_be_num,
-					      ctx->hdmi_num,
-					      ctx->hdmi.idisp_codec);
-	if (!dai_links)
-		return -ENOMEM;
-
-	sof_ssp_amp_card.dai_link = dai_links;
+	/* update dai_link */
+	ret = sof_card_dai_links_create(&pdev->dev, &sof_ssp_amp_card, ctx);
+	if (ret)
+		return ret;
 
 	/* update codec_conf */
 	switch (ctx->amp_type) {
-- 
2.40.1

