Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E477FA4ED
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:40:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09B5AE9B;
	Mon, 27 Nov 2023 16:39:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09B5AE9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099600;
	bh=x9AM+WgyoYgtP2zjlWzEH6ser07NVYV1gIcDXcrtdII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kcYSONWz4WorqHdKhA6B5CKM9Bu9C3+D2VWmPJohgOzeDYbxwD7tIokyvkS3KduPO
	 S92ZcxeJK9+nJ1kLBJ5mL5kselNI4DmYJ98uhs5IDRW/B5XxTeDLYxOqGnJ003wAjU
	 ZUCtMXxmgamu8c+W8FZZkhbyk3abxrB7c22BOpBo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B025F80C32; Mon, 27 Nov 2023 16:36:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CFF15F80C1B;
	Mon, 27 Nov 2023 16:36:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B45FF806F1; Mon, 27 Nov 2023 16:35:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54205F805EF
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54205F805EF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JQlODy7a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099339; x=1732635339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x9AM+WgyoYgtP2zjlWzEH6ser07NVYV1gIcDXcrtdII=;
  b=JQlODy7a39KeA/Vkysdg8hecOBeNtTx73MEUj3ppK/Ji+UT2I65vmlr6
   b3hdUHhLR4Qii+jJJ9WfE+GGEmXTSjpChb6VuL4OXRBhlWoVXakBromRl
   92GJWoTRTwEZ880EepEz6971HGsRCde3iIzqNOyGL5/rG36EDQxo5I9Sn
   21Lwl9CzCUbIqQT2r4oXbxWoVK2Cu/aaA+dkUwKwSXPKNCuhHyFLpQ0LF
   TlrA+P9RRTuNMyFhxbE9L9BTo0irmaC2MfcMya5gcTe4vCYFnQNQvGX8x
   WH5qwYBSLh3JM4AdOisOj8FzkeGsgo+uBVvN1B0lr404M0Vv3UzOjkHRl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894579"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894579"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956870"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956870"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:06 -0800
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
Subject: [PATCH 17/27] ASoC: Intel: sof_cs42l42: use common module for BT
 offload link
Date: Mon, 27 Nov 2023 17:26:44 +0200
Message-ID: <20231127152654.28204-18-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RVYPSL34LBBCUBDH3WFKKEWYMSHYB2GA
X-Message-ID-Hash: RVYPSL34LBBCUBDH3WFKKEWYMSHYB2GA
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use intel_board module for BT offload DAI link initialization.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c | 79 +++++++---------------------
 1 file changed, 19 insertions(+), 60 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index a8252079d696..c2442bf8ced0 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -138,13 +138,6 @@ static const struct snd_soc_ops sof_cs42l42_ops = {
 	.hw_params = sof_cs42l42_hw_params,
 };
 
-static struct snd_soc_dai_link_component platform_component[] = {
-	{
-		/* name might be overridden during probe */
-		.name = "0000:00:1f.3"
-	}
-};
-
 static int sof_card_late_probe(struct snd_soc_card *card)
 {
 	return sof_intel_board_card_late_probe(card);
@@ -189,52 +182,11 @@ static struct snd_soc_dai_link_component cs42l42_component[] = {
 	}
 };
 
-static int create_bt_offload_dai_links(struct device *dev,
-				       struct snd_soc_dai_link *links,
-				       struct snd_soc_dai_link_component *cpus,
-				       int *id, int ssp_bt)
-{
-	/* bt offload */
-	if (!(sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT))
-		return 0;
-
-	links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT",
-					 ssp_bt);
-	if (!links[*id].name)
-		goto devm_err;
-
-	links[*id].id = *id;
-	links[*id].codecs = &snd_soc_dummy_dlc;
-	links[*id].num_codecs = 1;
-	links[*id].platforms = platform_component;
-	links[*id].num_platforms = ARRAY_SIZE(platform_component);
-
-	links[*id].dpcm_playback = 1;
-	links[*id].dpcm_capture = 1;
-	links[*id].no_pcm = 1;
-	links[*id].cpus = &cpus[*id];
-	links[*id].num_cpus = 1;
-
-	links[*id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-						   "SSP%d Pin",
-						   ssp_bt);
-	if (!links[*id].cpus->dai_name)
-		goto devm_err;
-
-	(*id)++;
-
-	return 0;
-
-devm_err:
-	return -ENOMEM;
-}
-
 static struct snd_soc_dai_link *
 sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			  int ssp_codec, int ssp_amp, int ssp_bt,
 			  int dmic_be_num, int hdmi_num, bool idisp_codec)
 {
-	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_dai_link *links;
 	int ret;
 	int id = 0;
@@ -243,9 +195,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 
 	links = devm_kcalloc(dev, sof_audio_card_cs42l42.num_links,
 			    sizeof(struct snd_soc_dai_link), GFP_KERNEL);
-	cpus = devm_kcalloc(dev, sof_audio_card_cs42l42.num_links,
-			    sizeof(struct snd_soc_dai_link_component), GFP_KERNEL);
-	if (!links || !cpus)
+	if (!links)
 		goto devm_err;
 
 	link_seq = (sof_cs42l42_quirk & SOF_CS42L42_DAILINK_MASK) >> SOF_CS42L42_DAILINK_SHIFT;
@@ -350,11 +300,17 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			}
 			break;
 		case LINK_BT:
-			ret = create_bt_offload_dai_links(dev, links, cpus, &id, ssp_bt);
-			if (ret < 0) {
-				dev_err(dev, "fail to create bt offload dai links, ret %d\n",
-					ret);
-				goto devm_err;
+			if (sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT) {
+				ret = sof_intel_board_set_bt_link(dev,
+								  &links[id], id,
+								  ssp_bt);
+				if (ret) {
+					dev_err(dev, "fail to create bt offload dai links, ret %d\n",
+						ret);
+					goto devm_err;
+				}
+
+				id++;
 			}
 			break;
 		case LINK_NONE:
@@ -377,7 +333,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int ret, ssp_bt;
+	int ret;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -406,7 +362,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "sof_cs42l42_quirk = %lx\n", sof_cs42l42_quirk);
 
-	ssp_bt = (sof_cs42l42_quirk & SOF_CS42L42_SSP_BT_MASK) >>
+	/* port number of peripherals attached to ssp interface */
+	ctx->ssp_bt = (sof_cs42l42_quirk & SOF_CS42L42_SSP_BT_MASK) >>
 			SOF_CS42L42_SSP_BT_SHIFT;
 
 	ctx->ssp_amp = (sof_cs42l42_quirk & SOF_CS42L42_SSP_AMP_MASK) >>
@@ -419,12 +376,14 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	if (ctx->amp_type != CODEC_NONE)
 		sof_audio_card_cs42l42.num_links++;
-	if (sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT)
+	if (sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT) {
+		ctx->bt_offload_present = true;
 		sof_audio_card_cs42l42.num_links++;
+	}
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
 					      ctx->ssp_codec, ctx->ssp_amp,
-					      ssp_bt, ctx->dmic_be_num,
+					      ctx->ssp_bt, ctx->dmic_be_num,
 					      ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
-- 
2.43.0

