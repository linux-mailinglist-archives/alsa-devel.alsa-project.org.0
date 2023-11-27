Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D61537FA4F0
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:40:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 885C8DE5;
	Mon, 27 Nov 2023 16:40:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 885C8DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099630;
	bh=2/PlK81RDS/YXT5w7vXXLMG5XVn5aYXtHWj/zVHQOHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vUabKd5AtSzCJDKxGhST6rVd5UOdsbVkZeUPb0GXUNVDi4K1eEsj8PP+XIQkod5WK
	 67InoOURcoZApeHElwk3JcucZ6Mw+k7vb06O7JUImVpVrvbsQihQxzL/dadeVutb89
	 IacwasXnc58avXCxb644KAeJH7AfbdM0qW5dOZDA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD4C8F80CC1; Mon, 27 Nov 2023 16:36:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39D8AF80CB8;
	Mon, 27 Nov 2023 16:36:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE9CEF8076A; Mon, 27 Nov 2023 16:35:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D39EF805F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D39EF805F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Wp2QNahJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099341; x=1732635341;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2/PlK81RDS/YXT5w7vXXLMG5XVn5aYXtHWj/zVHQOHE=;
  b=Wp2QNahJYk+cvg+o2Dvj/NPvixM+JGiBgE1Q86n3DKATMpQzA5x17PS9
   GJKLt3gUwuGywaVg1lJuKUMLsrrtTUBgXVrZfhoI1lguiftzdNvpR77VZ
   UflofnKWV3Z1J+B9QApkRsVQsHPfALsgRM0xwnaKEx8iFT3ZCgug+Es/k
   xDXMQIwTXfFWmqfsIQLQY0chE7a8gHQX6M/04fmTqVsZkNTrwNPuwvqDL
   HXD1XMUox1wlC4GqkuE5mRU8L6PxOvR8gorSVKvBOpz26izM7jujo2qp0
   cRm0meU7UDPzcgq6m+dnlJF0KuMWDfdLW/BTzWM2obTq001myLYQVA8He
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894601"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894601"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956957"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956957"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:12 -0800
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
Subject: [PATCH 19/27] ASoC: Intel: sof_rt5682: use common module for BT
 offload link
Date: Mon, 27 Nov 2023 17:26:46 +0200
Message-ID: <20231127152654.28204-20-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SGVAV3ZK6Z2LPPV7QIK5APCPFYNTPPK5
X-Message-ID-Hash: SGVAV3ZK6Z2LPPV7QIK5APCPFYNTPPK5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SGVAV3ZK6Z2LPPV7QIK5APCPFYNTPPK5/>
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
 sound/soc/intel/boards/sof_rt5682.c | 30 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 777d1db5c6ad..22dd85129a51 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -720,23 +720,11 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 		int port = (sof_rt5682_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
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
+		id++;
 	}
 
 	/* HDMI-In SSP */
@@ -843,6 +831,10 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "sof_rt5682_quirk = %lx\n", sof_rt5682_quirk);
 
+	/* port number of peripherals attached to ssp interface */
+	ctx->ssp_bt = (sof_rt5682_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
+			SOF_BT_OFFLOAD_SSP_SHIFT;
+
 	ctx->ssp_amp = (sof_rt5682_quirk & SOF_RT5682_SSP_AMP_MASK) >>
 			SOF_RT5682_SSP_AMP_SHIFT;
 
@@ -854,8 +846,10 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (ctx->amp_type != CODEC_NONE)
 		sof_audio_card_rt5682.num_links++;
 
-	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
+	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
+		ctx->bt_offload_present = true;
 		sof_audio_card_rt5682.num_links++;
+	}
 
 	if (sof_rt5682_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT_MASK)
 		sof_audio_card_rt5682.num_links +=
-- 
2.43.0

