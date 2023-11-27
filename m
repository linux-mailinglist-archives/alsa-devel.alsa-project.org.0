Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8247FA4DC
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:37:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53669DFA;
	Mon, 27 Nov 2023 16:37:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53669DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099449;
	bh=F6gSzd2J6qy3sSmOASe8nGnCre5wS91ThSgi8oMSfWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e/fjy4pyZXABs0INKz3kj8atgJYPy/+RDaaey0UDiIP3FliEqKJFslzraDZ8EkZ3w
	 ahczq5oVgUS0swnWwsMpMmHBP9StfUqiLkxE6Os2Lub1Yp8fiX6DmFGVkeqd+9dO0E
	 jNDL7BDp8LP7frwJu0JeCwoJZgga0wJWig+sSjZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 615F1F805A0; Mon, 27 Nov 2023 16:35:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54B39F80682;
	Mon, 27 Nov 2023 16:35:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D368EF805E6; Mon, 27 Nov 2023 16:35:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14995F8055A
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14995F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MVpAlB+K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099329; x=1732635329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F6gSzd2J6qy3sSmOASe8nGnCre5wS91ThSgi8oMSfWU=;
  b=MVpAlB+KVfNj8JOpyb6CNpjzaQBMdLzSeO5LLzXtHg8uQtrWbc+6FLjZ
   FaciD9/JVjr5eLu3GR6DnDPZW/hFQPueXrliF5L/VaQq47l47KZ+cuEeZ
   P/Irv8mC3rajZgWb2xHu4I33Kksp8gKbn7L1QN4NEwTq6ixrRD1wr9v5B
   1DSp6ijR7jEm0EeacA1d2uNkF21OovpERiC17SXqRC+5ZedMP7CupPqfH
   miFZRyp9db37iYB0Pp6dLC7zrFXcncmh8C+CkMgci383972kd+zEbBWci
   cWg/H+yUNcJKAThVjFcJ9ftsU4Djn3p7Yk+emPXyPxAG3W424zDjWenL4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894467"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894467"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956550"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956550"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:44 -0800
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
Subject: [PATCH 09/27] ASoC: Intel: sof_rt5682: use common module for codec
 link
Date: Mon, 27 Nov 2023 17:26:36 +0200
Message-ID: <20231127152654.28204-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6XQSZAYCDYURKNGRJUX4ZJUJTJWBCXCP
X-Message-ID-Hash: 6XQSZAYCDYURKNGRJUX4ZJUJTJWBCXCP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6XQSZAYCDYURKNGRJUX4ZJUJTJWBCXCP/>
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
 sound/soc/intel/boards/sof_rt5682.c | 38 ++++++++---------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 9723479f43da..8adc82892e2c 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -591,13 +591,12 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 		goto devm_err;
 
 	/* codec SSP */
-	links[id].name = devm_kasprintf(dev, GFP_KERNEL,
-					"SSP%d-Codec", ssp_codec);
-	if (!links[id].name)
-		goto devm_err;
-
-	links[id].id = id;
+	ret = sof_intel_board_set_codec_link(dev, &links[id], id, codec_type,
+					     ssp_codec);
+	if (ret)
+		return NULL;
 
+	/* codec-specific fields */
 	switch (codec_type) {
 	case CODEC_RT5650:
 		links[id].codecs = &rt5650_components[0];
@@ -616,23 +615,11 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 		return NULL;
 	}
 
-	links[id].platforms = platform_component;
-	links[id].num_platforms = ARRAY_SIZE(platform_component);
 	links[id].init = sof_rt5682_codec_init;
 	links[id].exit = sof_rt5682_codec_exit;
 	links[id].ops = &sof_rt5682_ops;
-	links[id].dpcm_playback = 1;
-	links[id].dpcm_capture = 1;
-	links[id].no_pcm = 1;
-	links[id].cpus = &cpus[id];
-	links[id].num_cpus = 1;
-	if (is_legacy_cpu) {
-		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							  "ssp%d-port",
-							  ssp_codec);
-		if (!links[id].cpus->dai_name)
-			goto devm_err;
-	} else {
+
+	if (!is_legacy_cpu) {
 		/*
 		 * Currently, On SKL+ platforms MCLK will be turned off in sof
 		 * runtime suspended, and it will go into runtime suspended
@@ -643,11 +630,6 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 		 * It can be removed once we can control MCLK by driver.
 		 */
 		links[id].ignore_pmdown_time = 1;
-		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							  "SSP%d Pin",
-							  ssp_codec);
-		if (!links[id].cpus->dai_name)
-			goto devm_err;
 	}
 	id++;
 
@@ -819,7 +801,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int ret, ssp_amp, ssp_codec;
+	int ret, ssp_amp;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -888,7 +870,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	ssp_amp = (sof_rt5682_quirk & SOF_RT5682_SSP_AMP_MASK) >>
 			SOF_RT5682_SSP_AMP_SHIFT;
 
-	ssp_codec = sof_rt5682_quirk & SOF_RT5682_SSP_CODEC_MASK;
+	ctx->ssp_codec = sof_rt5682_quirk & SOF_RT5682_SSP_CODEC_MASK;
 
 	/* compute number of dai links */
 	sof_audio_card_rt5682.num_links = 1 + ctx->dmic_be_num + ctx->hdmi_num;
@@ -905,7 +887,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 					SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT);
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->codec_type,
-					      ctx->amp_type, ssp_codec, ssp_amp,
+					      ctx->amp_type, ctx->ssp_codec, ssp_amp,
 					      ctx->dmic_be_num, ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec,
 					      ctx->rt5682.is_legacy_cpu);
-- 
2.43.0

