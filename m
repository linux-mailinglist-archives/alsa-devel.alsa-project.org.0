Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D50687FA4E4
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:38:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FB82DF0;
	Mon, 27 Nov 2023 16:38:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FB82DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099528;
	bh=cUCdwnqvq+rKGvZnTNh7cotebEBqefzwJ9UySshL8ZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HiVztAxYtOi1gG6DsyR7o2c8HPpTmXIZZ2dHM1Y8hWR9CnjStOBrv/wknl/vWpfy1
	 z7QaOpBopFkHIiMrS+5jWn7nO7GfgtQABfAWYrnKLSx7oxt7hrJ46QjmHG0th6Qqi1
	 1spOQ4WDuoDseY0mhQt/r+hx8pnmDybc2+/doRYY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F8A8F80752; Mon, 27 Nov 2023 16:35:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2894AF8075B;
	Mon, 27 Nov 2023 16:35:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2B30F80690; Mon, 27 Nov 2023 16:35:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60506F8057A
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60506F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ibFQ5VMy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099331; x=1732635331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cUCdwnqvq+rKGvZnTNh7cotebEBqefzwJ9UySshL8ZQ=;
  b=ibFQ5VMyaPkGk8CtlO0GuWwj78hL/3f1peu1yj8FN7iuqNzj2QvynJoy
   yQmZlpSut6dPuboZ91ucVPsbx22o1wZJOKSsIoZS5F/ZJiOESa8kPhnBr
   IJB23kXKqS+C1cR0dB0/rI+rA9LBo58f4LqecOr4Nz1IJeYdOIwHvHQy5
   kPDn+TDifO+oSghhh6s+yWpMxohXeErJUBnLFkQ3yHbu5ewotRT94IVhM
   kYHxfCfEvNO9Prv4PPNQJ49Odg5QgBK1c5WOIbLGcgwrTV7EW+yVIxF8w
   n6CHPX1wwvDx64Is2DEmad7KzkfsMZeCekCFRhvE9uQxLqSQjWmFOhfUs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894489"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894489"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956652"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956652"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:50 -0800
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
Subject: [PATCH 11/27] ASoC: Intel: sof_cs42l42: use common module for amp
 link
Date: Mon, 27 Nov 2023 17:26:38 +0200
Message-ID: <20231127152654.28204-12-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IP42EIVI2NFAQ5KICKA7I5SSCJANK3GX
X-Message-ID-Hash: IP42EIVI2NFAQ5KICKA7I5SSCJANK3GX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IP42EIVI2NFAQ5KICKA7I5SSCJANK3GX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use intel_board module for speaker amplifier DAI link initialization.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c | 98 +++++++++-------------------
 1 file changed, 32 insertions(+), 66 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 30e78c20ce6e..a8252079d696 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -189,62 +189,6 @@ static struct snd_soc_dai_link_component cs42l42_component[] = {
 	}
 };
 
-static int create_spk_amp_dai_links(struct device *dev,
-				    struct snd_soc_dai_link *links,
-				    struct snd_soc_dai_link_component *cpus,
-				    int *id, enum sof_ssp_codec amp_type,
-				    int ssp_amp)
-{
-	int ret = 0;
-
-	/* speaker amp */
-	if (amp_type == CODEC_NONE)
-		return 0;
-
-	links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec",
-					 ssp_amp);
-	if (!links[*id].name) {
-		ret = -ENOMEM;
-		goto devm_err;
-	}
-
-	links[*id].id = *id;
-
-	switch (amp_type) {
-	case CODEC_MAX98357A:
-		max_98357a_dai_link(&links[*id]);
-		break;
-	case CODEC_MAX98360A:
-		max_98360a_dai_link(&links[*id]);
-		break;
-	default:
-		dev_err(dev, "invalid amp type %d\n", amp_type);
-		return -EINVAL;
-	}
-
-	links[*id].platforms = platform_component;
-	links[*id].num_platforms = ARRAY_SIZE(platform_component);
-	links[*id].dpcm_playback = 1;
-	/* firmware-generated echo reference */
-	links[*id].dpcm_capture = 1;
-
-	links[*id].no_pcm = 1;
-	links[*id].cpus = &cpus[*id];
-	links[*id].num_cpus = 1;
-
-	links[*id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-						   "SSP%d Pin", ssp_amp);
-	if (!links[*id].cpus->dai_name) {
-		ret = -ENOMEM;
-		goto devm_err;
-	}
-
-	(*id)++;
-
-devm_err:
-	return ret;
-}
-
 static int create_bt_offload_dai_links(struct device *dev,
 				       struct snd_soc_dai_link *links,
 				       struct snd_soc_dai_link_component *cpus,
@@ -330,12 +274,33 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			id++;
 			break;
 		case LINK_SPK:
-			ret = create_spk_amp_dai_links(dev, links, cpus, &id,
-						       amp_type, ssp_amp);
-			if (ret < 0) {
-				dev_err(dev, "fail to create spk amp dai links, ret %d\n",
-					ret);
-				goto devm_err;
+			if (amp_type != CODEC_NONE) {
+				ret = sof_intel_board_set_ssp_amp_link(dev,
+								       &links[id],
+								       id,
+								       amp_type,
+								       ssp_amp);
+				if (ret) {
+					dev_err(dev, "fail to create spk amp dai links, ret %d\n",
+						ret);
+					goto devm_err;
+				}
+
+				/* codec-specific fields */
+				switch (amp_type) {
+				case CODEC_MAX98357A:
+					max_98357a_dai_link(&links[id]);
+					break;
+				case CODEC_MAX98360A:
+					max_98360a_dai_link(&links[id]);
+					break;
+				default:
+					dev_err(dev, "invalid amp type %d\n",
+						amp_type);
+					goto devm_err;
+				}
+
+				id++;
 			}
 			break;
 		case LINK_DMIC:
@@ -412,7 +377,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int ret, ssp_bt, ssp_amp;
+	int ret, ssp_bt;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -444,7 +409,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	ssp_bt = (sof_cs42l42_quirk & SOF_CS42L42_SSP_BT_MASK) >>
 			SOF_CS42L42_SSP_BT_SHIFT;
 
-	ssp_amp = (sof_cs42l42_quirk & SOF_CS42L42_SSP_AMP_MASK) >>
+	ctx->ssp_amp = (sof_cs42l42_quirk & SOF_CS42L42_SSP_AMP_MASK) >>
 			SOF_CS42L42_SSP_AMP_SHIFT;
 
 	ctx->ssp_codec = sof_cs42l42_quirk & SOF_CS42L42_SSP_CODEC_MASK;
@@ -458,8 +423,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 		sof_audio_card_cs42l42.num_links++;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
-					      ctx->ssp_codec, ssp_amp, ssp_bt,
-					      ctx->dmic_be_num, ctx->hdmi_num,
+					      ctx->ssp_codec, ctx->ssp_amp,
+					      ssp_bt, ctx->dmic_be_num,
+					      ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
 		return -ENOMEM;
-- 
2.43.0

