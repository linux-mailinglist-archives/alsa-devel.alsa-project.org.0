Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D707FA4F9
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:42:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6C1EEAD;
	Mon, 27 Nov 2023 16:42:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6C1EEAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099746;
	bh=zegIsVQYo8lRy4tyIDuxIqEMpUBADp8ZFAUtflUd+fQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K/Aply21xfOP7Qgj/Oo/SG371NzR7SVBYoW5c3yUApHlX7qr/7flhQpn9bVxDwliv
	 Qa+J2GpTsQKmUgLZpVk877J9wrn8un8tEYernQsvkBgwtqzYjlMcpkZ2ArMEHrnP+j
	 bGqrxTtGK8uCjgGoCIlq8HvgiKg6NVx5RpjwbFAg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C00FBF89761; Mon, 27 Nov 2023 16:36:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77DF5F89755;
	Mon, 27 Nov 2023 16:36:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC564F8962F; Mon, 27 Nov 2023 16:36:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C299F8076D
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C299F8076D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Tsfqkg3v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099359; x=1732635359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zegIsVQYo8lRy4tyIDuxIqEMpUBADp8ZFAUtflUd+fQ=;
  b=Tsfqkg3ve4Z8Zln7ddypbWTc2T8NriJ/b/o7YgHK3j7+f0SpPsRGu0nG
   Xd0Jn/lAHUQRep7YorjQEdHmqUWqbAyLKiVmWoZzknx9mauYo+R7zZLu8
   xshkyqYjrb98ygYSz7hFISdFLv6VyTdimzObnsDHbK6DcdN2qyBysICcn
   9dlT4Uj/2ophRadQht7s6qjqre7LGUIFCWXX5/N3/79HiIAN3a3p1z7hd
   gUAqvLi9cnTM9vYjltQL3QvBE29e2tocoKfyynyNViZX+ixu/rWVQeCcu
   RX7nM+tHdJCF0ihW0pDKeT7rVGAjQ8VB7NOsXrzrkm+xVtSW+A1xa6D/L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894683"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894683"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771957194"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771957194"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:31 -0800
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
Subject: [PATCH 26/27] ASoC: Intel: sof_nau8825: use common module for DAI
 link generation
Date: Mon, 27 Nov 2023 17:26:53 +0200
Message-ID: <20231127152654.28204-27-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W7DEGP6MT4PRWTXG37THF6KH2OEVV5Z6
X-Message-ID-Hash: W7DEGP6MT4PRWTXG37THF6KH2OEVV5Z6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7DEGP6MT4PRWTXG37THF6KH2OEVV5Z6/>
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

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_nau8825.c | 164 ++++++++-------------------
 1 file changed, 48 insertions(+), 116 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 32a43d1b5846..15ea6732ff94 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -200,123 +200,67 @@ static struct snd_soc_dai_link_component nau8825_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link *
-sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
-			  int ssp_codec, int ssp_amp, int dmic_be_num,
-			  int hdmi_num, bool idisp_codec)
+static int
+sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
+			  struct sof_card_private *ctx)
 {
-	struct snd_soc_dai_link *links;
-	int i;
-	int id = 0;
 	int ret;
 
-	links = devm_kcalloc(dev, sof_audio_card_nau8825.num_links,
-			    sizeof(struct snd_soc_dai_link), GFP_KERNEL);
-	if (!links)
-		goto devm_err;
-
-	/* codec SSP */
-	ret = sof_intel_board_set_codec_link(dev, &links[id], id, CODEC_NAU8825,
-					     ssp_codec);
+	ret = sof_intel_board_set_dai_link(dev, card, ctx);
 	if (ret)
-		return NULL;
-
-	/* codec-specific fields */
-	links[id].codecs = nau8825_component;
-	links[id].num_codecs = ARRAY_SIZE(nau8825_component);
-	links[id].init = sof_nau8825_codec_init;
-	links[id].exit = sof_nau8825_codec_exit;
-	links[id].ops = &sof_nau8825_ops;
-
-	id++;
-
-	/* dmic */
-	if (dmic_be_num > 0) {
-		/* at least we have dmic01 */
-		ret = sof_intel_board_set_dmic_link(dev, &links[id], id,
-						    SOF_DMIC_01);
-		if (ret)
-			return NULL;
-
-		id++;
-	}
-
-	if (dmic_be_num > 1) {
-		/* set up 2 BE links at most */
-		ret = sof_intel_board_set_dmic_link(dev, &links[id], id,
-						    SOF_DMIC_16K);
-		if (ret)
-			return NULL;
+		return ret;
 
-		id++;
+	if (!ctx->codec_link) {
+		dev_err(dev, "codec link not available");
+		return -EINVAL;
 	}
 
-	/* HDMI */
-	for (i = 1; i <= hdmi_num; i++) {
-		ret = sof_intel_board_set_intel_hdmi_link(dev, &links[id], id,
-							  i, idisp_codec);
-		if (ret)
-			return NULL;
+	/* codec-specific fields for headphone codec */
+	ctx->codec_link->codecs = nau8825_component;
+	ctx->codec_link->num_codecs = ARRAY_SIZE(nau8825_component);
+	ctx->codec_link->init = sof_nau8825_codec_init;
+	ctx->codec_link->exit = sof_nau8825_codec_exit;
+	ctx->codec_link->ops = &sof_nau8825_ops;
 
-		id++;
-	}
+	if (ctx->amp_type == CODEC_NONE)
+		return 0;
 
-	/* speaker amp */
-	if (amp_type != CODEC_NONE) {
-		ret = sof_intel_board_set_ssp_amp_link(dev, &links[id], id,
-						       amp_type, ssp_amp);
-		if (ret)
-			return NULL;
-
-		/* codec-specific fields */
-		switch (amp_type) {
-		case CODEC_MAX98360A:
-			max_98360a_dai_link(&links[id]);
-			break;
-		case CODEC_MAX98373:
-			links[id].codecs = max_98373_components;
-			links[id].num_codecs = ARRAY_SIZE(max_98373_components);
-			links[id].init = max_98373_spk_codec_init;
-			links[id].ops = &max_98373_ops;
-			break;
-		case CODEC_NAU8318:
-			nau8318_set_dai_link(&links[id]);
-			break;
-		case CODEC_RT1015P:
-			sof_rt1015p_dai_link(&links[id]);
-			break;
-		case CODEC_RT1019P:
-			sof_rt1019p_dai_link(&links[id]);
-			break;
-		default:
-			dev_err(dev, "invalid amp type %d\n", amp_type);
-			return NULL;
-		}
-
-		id++;
+	if (!ctx->amp_link) {
+		dev_err(dev, "amp link not available");
+		return -EINVAL;
 	}
 
-	/* BT audio offload */
-	if (sof_nau8825_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
-		int port = (sof_nau8825_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
-				SOF_BT_OFFLOAD_SSP_SHIFT;
-
-		ret = sof_intel_board_set_bt_link(dev, &links[id], id, port);
-		if (ret)
-			return NULL;
-
-		id++;
+	/* codec-specific fields for speaker amplifier */
+	switch (ctx->amp_type) {
+	case CODEC_MAX98360A:
+		max_98360a_dai_link(ctx->amp_link);
+		break;
+	case CODEC_MAX98373:
+		ctx->amp_link->codecs = max_98373_components;
+		ctx->amp_link->num_codecs = ARRAY_SIZE(max_98373_components);
+		ctx->amp_link->init = max_98373_spk_codec_init;
+		ctx->amp_link->ops = &max_98373_ops;
+		break;
+	case CODEC_NAU8318:
+		nau8318_set_dai_link(ctx->amp_link);
+		break;
+	case CODEC_RT1015P:
+		sof_rt1015p_dai_link(ctx->amp_link);
+		break;
+	case CODEC_RT1019P:
+		sof_rt1019p_dai_link(ctx->amp_link);
+		break;
+	default:
+		dev_err(dev, "invalid amp type %d\n", ctx->amp_type);
+		return -EINVAL;
 	}
 
-	return links;
-devm_err:
-	return NULL;
+	return 0;
 }
 
 static int sof_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
-	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
 	int ret;
 
@@ -352,25 +296,13 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	ctx->ssp_codec = sof_nau8825_quirk & SOF_NAU8825_SSP_CODEC_MASK;
 
-	/* compute number of dai links */
-	sof_audio_card_nau8825.num_links = 1 + ctx->dmic_be_num + ctx->hdmi_num;
-
-	if (ctx->amp_type != CODEC_NONE)
-		sof_audio_card_nau8825.num_links++;
-
-	if (sof_nau8825_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
+	if (sof_nau8825_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		ctx->bt_offload_present = true;
-		sof_audio_card_nau8825.num_links++;
-	}
 
-	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
-					      ctx->ssp_codec, ctx->ssp_amp,
-					      ctx->dmic_be_num, ctx->hdmi_num,
-					      ctx->hdmi.idisp_codec);
-	if (!dai_links)
-		return -ENOMEM;
-
-	sof_audio_card_nau8825.dai_link = dai_links;
+	/* update dai_link */
+	ret = sof_card_dai_links_create(&pdev->dev, &sof_audio_card_nau8825, ctx);
+	if (ret)
+		return ret;
 
 	/* update codec_conf */
 	switch (ctx->amp_type) {
-- 
2.43.0

