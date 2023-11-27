Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F3C7FA4DE
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:38:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 526A3DF3;
	Mon, 27 Nov 2023 16:37:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 526A3DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099482;
	bh=3rR6n5ZNQYPIBtRxO9jzEWLu3tZf1nJtXrYJQ6Dzpp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vmqHI0384Ct8lzpCpKU+0AAa70OhJo833XRRgcmiGLPnqwzdfomui/4DGIuTUqyCp
	 8O5CQpcIRDF61D22NcWvbyBW3tzy/XAIfNx4GQgxJYTE+ni+WpOHUUAFrQsYCVf9B6
	 JWHcIjZ6P9TImSeUasI7yQeGAhpUlBDXESjCJ7gA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7026DF806D4; Mon, 27 Nov 2023 16:35:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5C2FF806AD;
	Mon, 27 Nov 2023 16:35:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AA01F8061D; Mon, 27 Nov 2023 16:35:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0667F8016E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0667F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IzCYSZGZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099327; x=1732635327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3rR6n5ZNQYPIBtRxO9jzEWLu3tZf1nJtXrYJQ6Dzpp8=;
  b=IzCYSZGZF2yL8qnUlDJc5L7+c52s2IFXwDaJ0wJV098C6bXDqTattLhD
   yMRAZw74wRJbXCEbcVucyFDXcDxOTUhEzoVHlSPukD894k76t4q2/NyE4
   cFFeyQIBYXH1CR6x+Xz1tFM0Dt39sUFSU1lCPYhY/ojaMgXWGkggIp5eg
   hx1+F9jjV5nTOyookcAWE4a+6ykY3DOdAivJRfc2p7/bdHMEu/ZJvCmBx
   bNZyi2aY8hGo/AgFiFk7gS2hZ9OdHtAS57tjX2xUwFeo0rO/Ob0M14bt3
   EQ9Rc0ndpUBxV5HHc6fANoTVfnMVmChCj4RZ4FtFhjgQ9lRws7WKHD2+S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894437"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894437"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956455"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956455"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:38 -0800
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
Subject: [PATCH 07/27] ASoC: Intel: sof_cs42l42: use common module for codec
 link
Date: Mon, 27 Nov 2023 17:26:34 +0200
Message-ID: <20231127152654.28204-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QD42MYHXMVZLVFAGVJRERTF4GLXIQRPY
X-Message-ID-Hash: QD42MYHXMVZLVFAGVJRERTF4GLXIQRPY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QD42MYHXMVZLVFAGVJRERTF4GLXIQRPY/>
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
 sound/soc/intel/boards/sof_cs42l42.c | 60 ++++++++--------------------
 1 file changed, 16 insertions(+), 44 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 1f760fc4cab2..30e78c20ce6e 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -245,45 +245,6 @@ static int create_spk_amp_dai_links(struct device *dev,
 	return ret;
 }
 
-static int create_hp_codec_dai_links(struct device *dev,
-				     struct snd_soc_dai_link *links,
-				     struct snd_soc_dai_link_component *cpus,
-				     int *id, int ssp_codec)
-{
-	/* codec SSP */
-	links[*id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec",
-					 ssp_codec);
-	if (!links[*id].name)
-		goto devm_err;
-
-	links[*id].id = *id;
-	links[*id].codecs = cs42l42_component;
-	links[*id].num_codecs = ARRAY_SIZE(cs42l42_component);
-	links[*id].platforms = platform_component;
-	links[*id].num_platforms = ARRAY_SIZE(platform_component);
-	links[*id].init = sof_cs42l42_init;
-	links[*id].exit = sof_cs42l42_exit;
-	links[*id].ops = &sof_cs42l42_ops;
-	links[*id].dpcm_playback = 1;
-	links[*id].dpcm_capture = 1;
-	links[*id].no_pcm = 1;
-	links[*id].cpus = &cpus[*id];
-	links[*id].num_cpus = 1;
-
-	links[*id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-						   "SSP%d Pin",
-						   ssp_codec);
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
 static int create_bt_offload_dai_links(struct device *dev,
 				       struct snd_soc_dai_link *links,
 				       struct snd_soc_dai_link_component *cpus,
@@ -350,12 +311,23 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 
 		switch (link_type) {
 		case LINK_HP:
-			ret = create_hp_codec_dai_links(dev, links, cpus, &id, ssp_codec);
-			if (ret < 0) {
+			ret = sof_intel_board_set_codec_link(dev, &links[id], id,
+							     CODEC_CS42L42,
+							     ssp_codec);
+			if (ret) {
 				dev_err(dev, "fail to create hp codec dai links, ret %d\n",
 					ret);
 				goto devm_err;
 			}
+
+			/* codec-specific fields */
+			links[id].codecs = cs42l42_component;
+			links[id].num_codecs = ARRAY_SIZE(cs42l42_component);
+			links[id].init = sof_cs42l42_init;
+			links[id].exit = sof_cs42l42_exit;
+			links[id].ops = &sof_cs42l42_ops;
+
+			id++;
 			break;
 		case LINK_SPK:
 			ret = create_spk_amp_dai_links(dev, links, cpus, &id,
@@ -440,7 +412,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int ret, ssp_bt, ssp_amp, ssp_codec;
+	int ret, ssp_bt, ssp_amp;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -475,7 +447,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	ssp_amp = (sof_cs42l42_quirk & SOF_CS42L42_SSP_AMP_MASK) >>
 			SOF_CS42L42_SSP_AMP_SHIFT;
 
-	ssp_codec = sof_cs42l42_quirk & SOF_CS42L42_SSP_CODEC_MASK;
+	ctx->ssp_codec = sof_cs42l42_quirk & SOF_CS42L42_SSP_CODEC_MASK;
 
 	/* compute number of dai links */
 	sof_audio_card_cs42l42.num_links = 1 + ctx->dmic_be_num + ctx->hdmi_num;
@@ -486,7 +458,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 		sof_audio_card_cs42l42.num_links++;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
-					      ssp_codec, ssp_amp, ssp_bt,
+					      ctx->ssp_codec, ssp_amp, ssp_bt,
 					      ctx->dmic_be_num, ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
-- 
2.43.0

