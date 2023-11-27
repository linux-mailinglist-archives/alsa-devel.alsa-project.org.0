Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB4A7FA4E2
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:38:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD01D9F6;
	Mon, 27 Nov 2023 16:38:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD01D9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099515;
	bh=Dqkn7V49CrgFPmU3JyRNAS/8rJSeEqCXZL6k949YguE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ASHu04m0es5uPZDcdnbemRJl5O9s6LJGbxD1nCn6N2QZByh/7Xdp+iZaf4HVD3C0m
	 Pan20J5yNzcMvMrbt6E6UB0vLIhbL4X79QQ4uR8hLGxwFDu0hUCr+xf7WL1g8LcZVj
	 FGbI72fqfYCEOSJPdzW4xMZQdgS6OeHoy2sjDgUQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7007F805EF; Mon, 27 Nov 2023 16:35:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FAB0F80720;
	Mon, 27 Nov 2023 16:35:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2971BF8068C; Mon, 27 Nov 2023 16:35:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD7F0F805A0
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD7F0F805A0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=U4wKCvEu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099331; x=1732635331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dqkn7V49CrgFPmU3JyRNAS/8rJSeEqCXZL6k949YguE=;
  b=U4wKCvEuwDD3P30xlO8tK7O03hyLzXYz03Kld/kE1vlnIEQ85Cmw8nI7
   8dinF99v306ytnvsWnAn6hc3MqbO5UL0eKPnqdiVdFV3UPe+ynRK68b/a
   /5xpwdrrHrUauiWkpd4NZEH380OL4i4BZ6DxnZ6//gfNmIBdSEcLYMBg7
   tkZSrE2IfIPqnRuMDgP9mdlaL1wPIwHofg7OGJ23sVAi1U0qwMHaaEbYy
   She0FpLHXwzrt4/jWpWN5645WOHJ1d8H6pL0mz9K7DvsfquKMYHRUmoAv
   OeMlVTAd3bRhBh8nBMd7PMV3rhxt9sulXzeFI6EDLrE7ScIWpatZAdlij
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894499"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894499"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956692"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956692"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:52 -0800
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
Subject: [PATCH 12/27] ASoC: Intel: sof_nau8825: use common module for amp
 link
Date: Mon, 27 Nov 2023 17:26:39 +0200
Message-ID: <20231127152654.28204-13-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y72BE2JRFUNJH6ONO5LBP42JIKX264LC
X-Message-ID-Hash: Y72BE2JRFUNJH6ONO5LBP42JIKX264LC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y72BE2JRFUNJH6ONO5LBP42JIKX264LC/>
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
 sound/soc/intel/boards/sof_nau8825.c | 31 +++++++---------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 3aeed23c8d0d..cc2a11b3de97 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -273,13 +273,12 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 
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
 		case CODEC_MAX98360A:
 			max_98360a_dai_link(&links[id]);
@@ -304,20 +303,6 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
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
-		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							  "SSP%d Pin",
-							  ssp_amp);
-		if (!links[id].cpus->dai_name)
-			goto devm_err;
 		id++;
 	}
 
@@ -355,7 +340,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
-	int ret, ssp_amp;
+	int ret;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -380,7 +365,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 		ctx->hdmi.idisp_codec = true;
 
-	ssp_amp = (sof_nau8825_quirk & SOF_NAU8825_SSP_AMP_MASK) >>
+	ctx->ssp_amp = (sof_nau8825_quirk & SOF_NAU8825_SSP_AMP_MASK) >>
 			SOF_NAU8825_SSP_AMP_SHIFT;
 
 	ctx->ssp_codec = sof_nau8825_quirk & SOF_NAU8825_SSP_CODEC_MASK;
@@ -395,7 +380,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 		sof_audio_card_nau8825.num_links++;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
-					      ctx->ssp_codec, ssp_amp,
+					      ctx->ssp_codec, ctx->ssp_amp,
 					      ctx->dmic_be_num, ctx->hdmi_num,
 					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
-- 
2.43.0

