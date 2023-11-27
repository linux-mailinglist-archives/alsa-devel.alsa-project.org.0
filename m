Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF27FA4F1
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:40:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 487C4E8A;
	Mon, 27 Nov 2023 16:40:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 487C4E8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099647;
	bh=/aZ5dxakQtq/x5Qt5/UYeLdfsoMev4N846nYiIvN8pQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l+ueS/0Ed0Orm8EeCF/kExhPNcbOqQjuA6Zfqq/Nd/vV7V0C/LKoGZPif5XMpTVVx
	 baq2GK7/DTFOVP7JyXImi+qI6Qf+Dg/ruqaN3bzH3h9y1c3+u/OtLpNyQsdLI2+E5p
	 xGLV16cK8/9KbCEMfzoSTjXpCRKo1qeMfGR2qIuw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 198B7F89629; Mon, 27 Nov 2023 16:36:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E917F8962A;
	Mon, 27 Nov 2023 16:36:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CE36F807D1; Mon, 27 Nov 2023 16:36:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABDACF80605
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABDACF80605
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OMW2aX8L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099342; x=1732635342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/aZ5dxakQtq/x5Qt5/UYeLdfsoMev4N846nYiIvN8pQ=;
  b=OMW2aX8LnX7L53jSMcfH7K1kD4uSuf2XqBbmXYHrvD8MiOPzEx92l9L8
   mGTplO4sk7+7BHihYmyU/0xUBCxvpn8Vro2W4TJc1SdYZqCfMTnKdA4II
   gqCoTMwqZqN5Z0n7gc9KWXfGVYDLHFLaa1OjffINFHALL9geoF8mhK677
   tXBIVo+loPJC4MTb0PnOiP/DWf81SCfM3Rbg55cOplRswQHLka05z3Wya
   W8VEOcGlss+Am9wPQ98zPaZtvWxqClXVHmcnt/klTY8YSKAOyNl6+U0+D
   TvAUr1EQ42jz/BinlV2m6XKkNw95vMkYrp/FDMtqw/j02AVA7yXoydYmS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894618"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894618"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771957000"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771957000"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:15 -0800
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
Subject: [PATCH 20/27] ASoC: Intel: sof_ssp_amp: use common module for BT
 offload link
Date: Mon, 27 Nov 2023 17:26:47 +0200
Message-ID: <20231127152654.28204-21-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DV7ALAO4EG3UVEHZCZNUZ56GE55VZSAF
X-Message-ID-Hash: DV7ALAO4EG3UVEHZCZNUZ56GE55VZSAF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DV7ALAO4EG3UVEHZCZNUZ56GE55VZSAF/>
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
 sound/soc/intel/boards/sof_ssp_amp.c | 31 ++++++++++------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index c463bc698c10..72505f6a6501 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -215,29 +215,14 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 		int port = (sof_ssp_amp_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
 				SOF_BT_OFFLOAD_SSP_SHIFT;
 
-		links[id].id = id;
-		links[id].cpus = &cpus[id];
-		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-							  "SSP%d Pin", port);
-		if (!links[id].cpus->dai_name)
-			goto devm_err;
-		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
-		if (!links[id].name)
-			goto devm_err;
-		links[id].codecs = &snd_soc_dummy_dlc;
-		links[id].num_codecs = 1;
-		links[id].platforms = platform_component;
-		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].dpcm_playback = 1;
-		links[id].dpcm_capture = 1;
-		links[id].no_pcm = 1;
-		links[id].num_cpus = 1;
+		ret = sof_intel_board_set_bt_link(dev, &links[id], id, port);
+		if (ret)
+			return NULL;
+
 		id++;
 	}
 
 	return links;
-devm_err:
-	return NULL;
 }
 
 static int sof_ssp_amp_probe(struct platform_device *pdev)
@@ -261,6 +246,10 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	else
 		ctx->dmic_be_num = 0;
 
+	/* port number of peripherals attached to ssp interface */
+	ctx->ssp_bt = (sof_ssp_amp_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
+			SOF_BT_OFFLOAD_SSP_SHIFT;
+
 	ctx->ssp_amp = sof_ssp_amp_quirk & SOF_AMPLIFIER_SSP_MASK;
 
 	/* set number of dai links */
@@ -288,8 +277,10 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 		ctx->hdmi_num = 0;
 	}
 
-	if (sof_ssp_amp_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
+	if (sof_ssp_amp_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
+		ctx->bt_offload_present = true;
 		sof_ssp_amp_card.num_links++;
+	}
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
 					      ctx->ssp_amp, ctx->dmic_be_num,
-- 
2.43.0

