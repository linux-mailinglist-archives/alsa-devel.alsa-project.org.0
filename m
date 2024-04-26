Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1D08B3B8A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:31:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15D1D20C3;
	Fri, 26 Apr 2024 17:31:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15D1D20C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145495;
	bh=LQ5nnQ9ZW00t49syyn/ph3zhQ6ZrAYJTQfp7YGjztmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NFT9R/BxynYx/H4n5pk1Ldr+0UDzAVbcGWgAFDkHy06PJPOKxy1IbhCoa3uP5whbx
	 lVAJdwXQ253EJ6Bl1kqCTreF1vBlDKnyfqdSp5HyxkrHZUWcJcZKGtTqVE5r+Qo4Rz
	 0qIpoQIeb746hpwv9B7ni8RW/iQb+Db559lQtf50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CEE3F8963E; Fri, 26 Apr 2024 17:26:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73200F80617;
	Fri, 26 Apr 2024 17:26:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31A80F806B8; Fri, 26 Apr 2024 17:26:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 453E6F80587
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 453E6F80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JbOEZ1Sd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145156; x=1745681156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LQ5nnQ9ZW00t49syyn/ph3zhQ6ZrAYJTQfp7YGjztmw=;
  b=JbOEZ1SdYQUfmqtdfw8rGXVFENzrsTJujRjmUyzpcyMUZ7ZaQU8c+2sL
   emSyp4vBEJOnU9VUXr+VrE6cYyB+OkolPBLvxddd9ZdYGJSVOraOyE7Ex
   G5kJ7GHVm/wCcSJmkApT2P1buyIS7iz9hMJxTPZnsstscE2wd8LysVX8f
   D5k7QIc78u3DsA4P/+djl5/ytSgQlMdQVt50HoCjwRbUcUxn0uupuVEz/
   Vk9jgTMXslg1sc3LacoeZofkDgC5MQ4OgOHpctn88NrzIHOIHxALJuEnu
   FZRyyZIrCPS1isnHzvlCl9wiJhEDA1cyvTV1ZtkGgGs6VNEl3kHwFXGaI
   A==;
X-CSE-ConnectionGUID: 0ezhMnA8RbC9mk7ArLzvGw==
X-CSE-MsgGUID: lOqpovj1RiOIJgTKjXvipg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291360"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291360"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:52 -0700
X-CSE-ConnectionGUID: 8tdpBL57QIiwE5dFtLAP+g==
X-CSE-MsgGUID: geWlkK8nQwGaBWXsOfh55g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259610"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 20/23] ASoC: Intel: sof-rt5682: add driver_data to sof_rt5682
 board
Date: Fri, 26 Apr 2024 10:25:26 -0500
Message-Id: <20240426152529.38345-21-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KI6X7X5W6JEHNCZFPS4GML3N255ZT3AY
X-Message-ID-Hash: KI6X7X5W6JEHNCZFPS4GML3N255ZT3AY
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KI6X7X5W6JEHNCZFPS4GML3N255ZT3AY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Move default BYT/CHT quirk to driver_data of sof_rt5682 board. This
fixes a problem that DMI quirk of Minnowboard board got overwritten in
probe function since it's a BYT board.

Fixes: c68e07970eca ("ASoC: intel: sof_rt5682: Add quirk for number of HDMI DAI's")
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 7a35db5cab35..668b1672f570 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -638,7 +638,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct sof_card_private *ctx;
 	char *card_name;
-	bool is_legacy_cpu = false;
 	int ret;
 
 	if (pdev->id_entry && pdev->id_entry->driver_data)
@@ -646,14 +645,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	dmi_check_system(sof_rt5682_quirk_table);
 
-	if (soc_intel_is_byt() || soc_intel_is_cht()) {
-		is_legacy_cpu = true;
-
-		/* default quirk for legacy cpu */
-		sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
-				   SOF_SSP_PORT_CODEC(2);
-	}
-
 	dev_dbg(&pdev->dev, "sof_rt5682_quirk = %lx\n", sof_rt5682_quirk);
 
 	/* initialize ctx with board quirk */
@@ -676,7 +667,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 		ctx->hdmi.idisp_codec = true;
 
-	if (is_legacy_cpu) {
+	if (soc_intel_is_byt() || soc_intel_is_cht()) {
 		ctx->rt5682.is_legacy_cpu = true;
 		ctx->dmic_be_num = 0;
 		/* HDMI is not supported by SOF on Baytrail/CherryTrail */
@@ -792,6 +783,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 static const struct platform_device_id board_ids[] = {
 	{
 		.name = "sof_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_SSP_PORT_CODEC(2)),
 	},
 	{
 		.name = "glk_rt5682_def",
-- 
2.40.1

