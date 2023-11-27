Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 835877FA4F6
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:41:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E36CEE88;
	Mon, 27 Nov 2023 16:41:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E36CEE88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099699;
	bh=SOnk6ihrh+pfMoZ1m7lDiOTUxVZO5qLcx7QmL0ACqBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CXQqvoT1rlFPMftK8ddNjeMMBtGKdJ7EM4DXr1HolzUnx9SxO/DiICEHvNNoMcR7s
	 1RqvSL4qUUd6bFBFKlE9+XiV51FH6lxWJco/DDsDwcnw0INq3MPc3rcNYhann+ccXs
	 61I0urwZ+u/7YNPeIvkSlNPm9zduQbKwdU/gFTqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A247BF8971B; Mon, 27 Nov 2023 16:36:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04D04F8970D;
	Mon, 27 Nov 2023 16:36:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FD8EF8087B; Mon, 27 Nov 2023 16:36:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C37B6F80589
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C37B6F80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LIuxi18R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099355; x=1732635355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SOnk6ihrh+pfMoZ1m7lDiOTUxVZO5qLcx7QmL0ACqBo=;
  b=LIuxi18RZdL/UPn9qZgDK8GM28y68uZWAkQeB3UlLDn8VgrO/s/CMhKk
   RhURM/IuFnWnxIP+Hgqr07Bm2YSLcdmTiRRqKAxgNDOcsEb5mS6O2050V
   ByU9O0s/oN1M8qJy1hD82at+ZqpnK8IB3r1TOEKEH970mM58NT1c9Fjhv
   XaSScUQCLTyKq92CNn9o73UHkLJZtTgiHvonHiJJDFzDi3n1As8TnG9Pc
   7PZMIOTtsSVTxiqieJFSHaX/HQW329VIFu+NcMePt/o+uJC3DZ1lEGROk
   s8SZGS/Qf5EFHP3LCo7e4TNzQDqTaVIXzqiPGr6WtrMMOwwCRWnVbBkBm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894655"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894655"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771957110"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771957110"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:23 -0800
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
Subject: [PATCH 23/27] ASoC: Intel: sof_rt5682: use common module for HDMI-In
 link
Date: Mon, 27 Nov 2023 17:26:50 +0200
Message-ID: <20231127152654.28204-24-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6OEUJILCTWAXQVVWX225HZZASVVMO46Z
X-Message-ID-Hash: 6OEUJILCTWAXQVVWX225HZZASVVMO46Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6OEUJILCTWAXQVVWX225HZZASVVMO46Z/>
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
 sound/soc/intel/boards/sof_rt5682.c | 37 +++++++----------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 22dd85129a51..d353ad758c60 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -463,13 +463,6 @@ static struct snd_soc_ops sof_rt5682_ops = {
 	.hw_params = sof_rt5682_hw_params,
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
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
@@ -576,18 +569,14 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 			  int ssp_amp, int dmic_be_num, int hdmi_num,
 			  bool idisp_codec, bool is_legacy_cpu)
 {
-	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_dai_link *links;
 	int i;
 	int id = 0;
 	int ret;
-	int hdmi_id_offset = 0;
 
 	links = devm_kcalloc(dev, sof_audio_card_rt5682.num_links,
 			    sizeof(struct snd_soc_dai_link), GFP_KERNEL);
-	cpus = devm_kcalloc(dev, sof_audio_card_rt5682.num_links,
-			    sizeof(struct snd_soc_dai_link_component), GFP_KERNEL);
-	if (!links || !cpus)
+	if (!links)
 		goto devm_err;
 
 	/* codec SSP */
@@ -735,22 +724,11 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 		int port = 0;
 
 		for_each_set_bit(port, &hdmi_in_ssp, 32) {
-			links[id].cpus = &cpus[id];
-			links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
-								  "SSP%d Pin", port);
-			if (!links[id].cpus->dai_name)
-				return NULL;
-			links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-HDMI", port);
-			if (!links[id].name)
+			ret = sof_intel_board_set_hdmi_in_link(dev, &links[id],
+							       id, port);
+			if (ret)
 				return NULL;
-			links[id].id = id + hdmi_id_offset;
-			links[id].codecs = &snd_soc_dummy_dlc;
-			links[id].num_codecs = 1;
-			links[id].platforms = platform_component;
-			links[id].num_platforms = ARRAY_SIZE(platform_component);
-			links[id].dpcm_capture = 1;
-			links[id].no_pcm = 1;
-			links[id].num_cpus = 1;
+
 			id++;
 		}
 	}
@@ -831,7 +809,10 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "sof_rt5682_quirk = %lx\n", sof_rt5682_quirk);
 
-	/* port number of peripherals attached to ssp interface */
+	/* port number/mask of peripherals attached to ssp interface */
+	ctx->ssp_mask_hdmi_in = (sof_rt5682_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT_MASK) >>
+			SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT;
+
 	ctx->ssp_bt = (sof_rt5682_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
 			SOF_BT_OFFLOAD_SSP_SHIFT;
 
-- 
2.43.0

