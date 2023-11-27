Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 333507FA4DF
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:38:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAC13AE9;
	Mon, 27 Nov 2023 16:38:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAC13AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099494;
	bh=WHhqRCSfZknG+c8UuUKN6dsdF8Pg6hNrzndoyN4KBys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gwWUK7udyv5yUxGFHFwFs2tZGIzdpXAooY4+OkvF19+tN+fe5BMuTFIu2o9nMoIn5
	 kzv+MQQ6RLdJLs1LlErJ6I5yGuLnoNiiknK7jfNKYa/3zEfIb7naES/OAXLUAYQY9E
	 J1ZsquvqH6tI0hLX1Pr1u8vhpGmnWGmd4bOfgA9k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1256FF806E5; Mon, 27 Nov 2023 16:35:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B546FF806EF;
	Mon, 27 Nov 2023 16:35:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABA53F80640; Mon, 27 Nov 2023 16:35:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CB41F805C4
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CB41F805C4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kJRcOhrZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099331; x=1732635331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WHhqRCSfZknG+c8UuUKN6dsdF8Pg6hNrzndoyN4KBys=;
  b=kJRcOhrZDum6qE4PZIUz+eyPGPjPEKKHqpxqeBZvcg52wZW1aIwXoOEU
   h5OBQlnzN0DItF8sn3iYGDsGdz8VT3XANcMRQ2clcYTJJubZG7W9wGOix
   foU22XIo9tTW9wZ+zXreQ9uvhJ+NvbPOaB5eD53jf0WDoNcXq8bpGC94s
   1xVW9k8REs4OtSzeYeZ1OeQvjg6NC2k9a8aK4oP0f3f1BJrYHGp0dwgl4
   Suv9kgbl/kHgaIPRBZlixxuv7cBlOifmHS9hzWVnK0pHxPrm27n3CncE5
   lD+rN7W/T2x4yVQtjq5hbWfyNAkhoo1oJTMgCDkUTYwRB9TojMONQ0l5p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894508"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894508"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956728"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956728"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:55 -0800
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
Subject: [PATCH 13/27] ASoC: Intel: sof_rt5682: use common module for amp link
Date: Mon, 27 Nov 2023 17:26:40 +0200
Message-ID: <20231127152654.28204-14-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AQJ6YSTKPLWY22ZQADQEGNXP36CLSUII
X-Message-ID-Hash: AQJ6YSTKPLWY22ZQADQEGNXP36CLSUII
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AQJ6YSTKPLWY22ZQADQEGNXP36CLSUII/>
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
 sound/soc/intel/boards/sof_rt5682.c | 43 +++++++----------------------
 1 file changed, 10 insertions(+), 33 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 8adc82892e2c..777d1db5c6ad 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -666,13 +666,12 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 
 	/* speaker amp */
 	if (amp_type != CODEC_NONE) {
-		links[id].name = devm_kasprintf(dev, GFP_KERNEL,
-						"SSP%d-Codec", ssp_amp);
-		if (!links[id].name)
-			goto devm_err;
-
-		links[id].id = id;
+		ret = sof_intel_board_set_ssp_amp_link(dev, &links[id], id,
+						       amp_type, ssp_amp);
+		if (ret)
+			return NULL;
 
+		/* codec-specific fields */
 		switch (amp_type) {
 		case CODEC_MAX98357A:
 			max_98357a_dai_link(&links[id]);
@@ -713,29 +712,6 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 			return NULL;
 		}
 
-		links[id].platforms = platform_component;
-		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].dpcm_playback = 1;
-		/* feedback stream or firmware-generated echo reference */
-		links[id].dpcm_capture = 1;
-
-		links[id].no_pcm = 1;
-		links[id].cpus = &cpus[id];
-		links[id].num_cpus = 1;
-		if (is_legacy_cpu) {
-			links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-								  "ssp%d-port",
-								  ssp_amp);
-			if (!links[id].cpus->dai_name)
-				goto devm_err;
-
-		} else {
-			links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-								  "SSP%d Pin",
-								  ssp_amp);
-			if (!links[id].cpus->dai_name)
-				goto devm_err;
-		}
 		id++;
 	}
 
@@ -801,7 +777,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int ret, ssp_amp;
+	int ret;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -867,7 +843,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "sof_rt5682_quirk = %lx\n", sof_rt5682_quirk);
 
-	ssp_amp = (sof_rt5682_quirk & SOF_RT5682_SSP_AMP_MASK) >>
+	ctx->ssp_amp = (sof_rt5682_quirk & SOF_RT5682_SSP_AMP_MASK) >>
 			SOF_RT5682_SSP_AMP_SHIFT;
 
 	ctx->ssp_codec = sof_rt5682_quirk & SOF_RT5682_SSP_CODEC_MASK;
@@ -887,8 +863,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 					SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT);
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->codec_type,
-					      ctx->amp_type, ctx->ssp_codec, ssp_amp,
-					      ctx->dmic_be_num, ctx->hdmi_num,
+					      ctx->amp_type, ctx->ssp_codec,
+					      ctx->ssp_amp, ctx->dmic_be_num,
+					      ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec,
 					      ctx->rt5682.is_legacy_cpu);
 	if (!dai_links)
-- 
2.43.0

