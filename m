Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6637FA4F7
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:41:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20703E9D;
	Mon, 27 Nov 2023 16:41:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20703E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099719;
	bh=+6kFTSk/TZ8TGSZPxiLO/yzJuaFOHiAqjGzEPtnnZr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q+cpPAoO9TS8uS8vxSdV3ymBZd+obOc0HQBEnqMcLfgadnxDl12sILT+jycQlzsuR
	 Ty0iYjac7C9UiMZJFg3O4R0tV2V0lTeT9XZIKSm4rcgLWa3L3OYZlbU/UrFZhRuGay
	 DPPm4D74qORR/MOPm2HEpYb/kni7T81L58urbApk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EF4AF8971D; Mon, 27 Nov 2023 16:36:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEDA8F89722;
	Mon, 27 Nov 2023 16:36:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C142F80C8B; Mon, 27 Nov 2023 16:36:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1B6CF80730
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B6CF80730
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O1mkz4su
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099357; x=1732635357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+6kFTSk/TZ8TGSZPxiLO/yzJuaFOHiAqjGzEPtnnZr0=;
  b=O1mkz4su2UPpMDFkSnpyH76zY+rGSqmemEN5g4bmh+AyLBN2B2TFXmit
   gCs7fDX39t5LdKxEeugPW3TLNTZcfwsYxLa8KcIgFp0sNuwikdFQ9+SiZ
   pqOGFKKWqFzwFRnGNzfjTdCXWLJ7v96DDVsc+nOG0FgGtXI691QHPxkLU
   xg0E3NN4lUmfC00daYwd6BC3rnFLNWsyRdv+8gUgGb6BEugJ3iWxkrDCH
   8b7OW+PvlNfl9vxAJ5tkaakcXGbatrapzU6VA7ltF01T5L9fAndSeTEdQ
   3Sb24TICO/MX3E9L2ZmTwBuJ2KLqZWwtdro3p5nmqdaN4s/LTVBG+6IqL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894664"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894664"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771957142"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771957142"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:26 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 24/27] ASoC: Intel: sof_ssp_amp: use common module for HDMI-In
 link
Date: Mon, 27 Nov 2023 17:26:51 +0200
Message-ID: <20231127152654.28204-25-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2AOFBVMTCCKAN6HCW4HBCEPPTXXJHIAN
X-Message-ID-Hash: 2AOFBVMTCCKAN6HCW4HBCEPPTXXJHIAN
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2AOFBVMTCCKAN6HCW4HBCEPPTXXJHIAN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use intel_board module for HDMI-In DAI link initialization.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 38 ++++++----------------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index eddefa69355d..ee2e813bf4c0 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -71,13 +71,6 @@ static struct snd_soc_card sof_ssp_amp_card = {
 	.late_probe = sof_card_late_probe,
 };
 
-static struct snd_soc_dai_link_component platform_component[] = {
-	{
-		/* name might be overridden during probe */
-		.name = "0000:00:1f.3"
-	}
-};
-
 /* BE ID defined in sof-tgl-rt1308-hdmi-ssp.m4 */
 #define HDMI_IN_BE_ID		0
 #define SPK_BE_ID		2
@@ -90,7 +83,6 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			  int ssp_amp, int dmic_be_num, int hdmi_num,
 			  bool idisp_codec)
 {
-	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_dai_link *links;
 	int i;
 	int id = 0;
@@ -101,9 +93,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 
 	links = devm_kcalloc(dev, sof_ssp_amp_card.num_links,
 					sizeof(struct snd_soc_dai_link), GFP_KERNEL);
-	cpus = devm_kcalloc(dev, sof_ssp_amp_card.num_links,
-					sizeof(struct snd_soc_dai_link_component), GFP_KERNEL);
-	if (!links || !cpus)
+	if (!links)
 		return NULL;
 
 	/* HDMI-In SSP */
@@ -118,22 +108,11 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 
 		be_id = HDMI_IN_BE_ID;
 		for_each_set_bit(port, &ssp_mask_hdmi_in, 32) {
-			links[id].cpus = &cpus[id];
-			links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-								  "SSP%d Pin", port);
-			if (!links[id].cpus->dai_name)
+			ret = sof_intel_board_set_hdmi_in_link(dev, &links[id],
+							       be_id, port);
+			if (ret)
 				return NULL;
-			links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-HDMI", port);
-			if (!links[id].name)
-				return NULL;
-			links[id].id = be_id;
-			links[id].codecs = &snd_soc_dummy_dlc;
-			links[id].num_codecs = 1;
-			links[id].platforms = platform_component;
-			links[id].num_platforms = ARRAY_SIZE(platform_component);
-			links[id].dpcm_capture = 1;
-			links[id].no_pcm = 1;
-			links[id].num_cpus = 1;
+
 			id++;
 			be_id++;
 		}
@@ -218,7 +197,6 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
 	int ret;
-	unsigned long ssp_mask_hdmi_in;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -235,7 +213,7 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 		ctx->dmic_be_num = 0;
 
 	/* port number/mask of peripherals attached to ssp interface */
-	ssp_mask_hdmi_in = (sof_ssp_amp_quirk & SOF_HDMI_CAPTURE_SSP_MASK_MASK) >>
+	ctx->ssp_mask_hdmi_in = (sof_ssp_amp_quirk & SOF_HDMI_CAPTURE_SSP_MASK_MASK) >>
 			SOF_HDMI_CAPTURE_SSP_MASK_SHIFT;
 
 	ctx->ssp_bt = (sof_ssp_amp_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
@@ -249,8 +227,8 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	if (ctx->amp_type != CODEC_NONE)
 		sof_ssp_amp_card.num_links++;
 
-	if (ssp_mask_hdmi_in)
-		sof_ssp_amp_card.num_links += hweight32(ssp_mask_hdmi_in);
+	if (ctx->ssp_mask_hdmi_in)
+		sof_ssp_amp_card.num_links += hweight32(ctx->ssp_mask_hdmi_in);
 
 	if (sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT) {
 		ctx->hdmi_num = (sof_ssp_amp_quirk & SOF_NO_OF_HDMI_PLAYBACK_MASK) >>
-- 
2.43.0

