Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E237FA4DB
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:37:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5C56A4D;
	Mon, 27 Nov 2023 16:36:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5C56A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099429;
	bh=hu8qxAfbY0PdmsbL+wv4z49GlVEtJy5KeFdD3TpIvn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qzqwh++2xA66ZfkQw0yH6a3fzpDXKSwdSPsDFtTQ/peNcFCm/ahkRoutAuTcBhnbn
	 jbiK0Tu1I0nL4Kyb/QFtjKuEHAp7PJH1wLeV6t9lbE+OJnOpGEUrB4SF3qNYmcceJ9
	 Vaef9nQW40F4MOSjaMIt3hU5v/vUA/rFh1t4gvkI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3259F80649; Mon, 27 Nov 2023 16:35:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 234DEF80651;
	Mon, 27 Nov 2023 16:35:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2A65F805E6; Mon, 27 Nov 2023 16:35:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8E24F801D5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8E24F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Zlde7WsT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099328; x=1732635328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hu8qxAfbY0PdmsbL+wv4z49GlVEtJy5KeFdD3TpIvn8=;
  b=Zlde7WsTEU97n0DdH7R2+ZINd2MFYl/jl6wYwTYziZ9DYug3X5ul2Vs6
   Sy43P47DVwoGMxhuJRxHOjtU5Z3E9vgomRjlOEL15OYQ+TIvlj9pDENLy
   5t4bYAE7ohVvEfWOjJqhQlY2aeu7M4Vww3J5q+up82ZUL23r/3vdtjQSv
   n79jU5kKPcFGtU07K9KEC0WE+M8alHrqnc7TC3cdVJfZowzfvLNnal+hg
   odZ52UTUqUfKXhMozrV6dCJ6+ktM+72u/wPCutDBkxvUL0ssys8upyFBD
   6Y034KmBhPrZX8010EbWgb4mRG/2qAaZiGEcAxwJ6Hg+GLB4odKK/wx6A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894445"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894445"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956501"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956501"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:41 -0800
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
Subject: [PATCH 08/27] ASoC: Intel: sof_nau8825: use common module for codec
 link
Date: Mon, 27 Nov 2023 17:26:35 +0200
Message-ID: <20231127152654.28204-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FPGVXCABISFYI6KQ6NOJNSCE6UP5PG5K
X-Message-ID-Hash: FPGVXCABISFYI6KQ6NOJNSCE6UP5PG5K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPGVXCABISFYI6KQ6NOJNSCE6UP5PG5K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use intel_board module for headphone codec DAI link initialization.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_nau8825.c | 29 ++++++++--------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index dc2821a012d4..3aeed23c8d0d 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -226,30 +226,17 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 		goto devm_err;
 
 	/* codec SSP */
-	links[id].name = devm_kasprintf(dev, GFP_KERNEL,
-					"SSP%d-Codec", ssp_codec);
-	if (!links[id].name)
-		goto devm_err;
+	ret = sof_intel_board_set_codec_link(dev, &links[id], id, CODEC_NAU8825,
+					     ssp_codec);
+	if (ret)
+		return NULL;
 
-	links[id].id = id;
+	/* codec-specific fields */
 	links[id].codecs = nau8825_component;
 	links[id].num_codecs = ARRAY_SIZE(nau8825_component);
-	links[id].platforms = platform_component;
-	links[id].num_platforms = ARRAY_SIZE(platform_component);
 	links[id].init = sof_nau8825_codec_init;
 	links[id].exit = sof_nau8825_codec_exit;
 	links[id].ops = &sof_nau8825_ops;
-	links[id].dpcm_playback = 1;
-	links[id].dpcm_capture = 1;
-	links[id].no_pcm = 1;
-	links[id].cpus = &cpus[id];
-	links[id].num_cpus = 1;
-
-	links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-						  "SSP%d Pin",
-						  ssp_codec);
-	if (!links[id].cpus->dai_name)
-		goto devm_err;
 
 	id++;
 
@@ -368,7 +355,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int ret, ssp_amp, ssp_codec;
+	int ret, ssp_amp;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -396,7 +383,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	ssp_amp = (sof_nau8825_quirk & SOF_NAU8825_SSP_AMP_MASK) >>
 			SOF_NAU8825_SSP_AMP_SHIFT;
 
-	ssp_codec = sof_nau8825_quirk & SOF_NAU8825_SSP_CODEC_MASK;
+	ctx->ssp_codec = sof_nau8825_quirk & SOF_NAU8825_SSP_CODEC_MASK;
 
 	/* compute number of dai links */
 	sof_audio_card_nau8825.num_links = 1 + ctx->dmic_be_num + ctx->hdmi_num;
@@ -408,7 +395,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 		sof_audio_card_nau8825.num_links++;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
-					      ssp_codec, ssp_amp,
+					      ctx->ssp_codec, ssp_amp,
 					      ctx->dmic_be_num, ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
-- 
2.43.0

