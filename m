Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 384DE88B3D1
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:17:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC1352357;
	Mon, 25 Mar 2024 23:17:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC1352357
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711405067;
	bh=CQxyQOnKTfxFQMBIS3WgbGjfsWUDX6sFBeEw72agqH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AeVBur7Iu3bLwpC7bXxJxT8mycV9r0chMLc05k5O9l4h3o9jA9PyGK6JIdgNIJETC
	 Rt8PhRggIbL7bZ/VeAt7uBf6WNhvsKtXJXWkSjAjIi1r79Z9Cg9xUzp8rpQs53bDYD
	 TGk1zufjPZnd2Va4Ca0JyC9rQbcoZVU6Z58x/Nwc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A706F89706; Mon, 25 Mar 2024 23:12:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5BEBF89702;
	Mon, 25 Mar 2024 23:12:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90F11F805C1; Mon, 25 Mar 2024 23:12:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C26AF805C4
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C26AF805C4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LT4H9UYh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404693; x=1742940693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CQxyQOnKTfxFQMBIS3WgbGjfsWUDX6sFBeEw72agqH4=;
  b=LT4H9UYh62pvW5MDQ1TCj5mWW8qKDi7BYHJbw+iqdVDZY0MH1MoZfXhj
   lO3kBa8/N8IlkOQZ7UXqCctkAYMU/G57t0SKHZ+22hIhTQD68SKeOQVq5
   X52nEoOZR5IUYftDNKzVv9W/ebc8yhuYgr0/CglJUdPobUy0JyPR0ueHq
   enw/5rs3NJ4Dasr30s+z1EOKHxg2RbPYFMmkEW78zadmOiwTrThzrEvRf
   XvXv4To+PEAPylG7BRCzxi0Rc2HwD2Rw7gWA5FJBRy4OhrGfYbB9SgqJv
   NKb25xqi1Qwh3qArzYdpxc9yv3Fn+rBf0HXedTxJFSEzeKgegG+rUtN7H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643682"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643682"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722174"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 18/21] ASoC: Intel: sof_rt5682: remove unnecessary idisp HDMI
 quirk
Date: Mon, 25 Mar 2024 17:10:56 -0500
Message-Id: <20240325221059.206042-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TMMDRUPCZNFPGUXMP3CHNCUB5USQV742
X-Message-ID-Hash: TMMDRUPCZNFPGUXMP3CHNCUB5USQV742
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TMMDRUPCZNFPGUXMP3CHNCUB5USQV742/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Remove SOF_NUM_IDISP_HDMI(3) from board quirks since the value is 3 if
not defined.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 672636f07456..f80fdbd8fdac 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -139,7 +139,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(2) |
 					SOF_SSP_PORT_AMP(0) |
-					SOF_NUM_IDISP_HDMI(3) |
 					SOF_SSP_PORT_BT_OFFLOAD(1) |
 					SOF_BT_OFFLOAD_PRESENT
 					),
@@ -692,11 +691,11 @@ static int sof_audio_probe(struct platform_device *pdev)
 	case CODEC_RT1015P:
 		sof_rt1015p_codec_conf(&sof_audio_card_rt5682);
 		break;
+	case CODEC_MAX98357A:
+	case CODEC_MAX98360A:
+	case CODEC_RT1019P:
+	case CODEC_RT5650:
 	case CODEC_NONE:
-	case CODEC_MAX98357A:
-	case CODEC_MAX98360A:
-	case CODEC_RT1019P:
-	case CODEC_RT5650:
 		/* no codec conf required */
 		break;
 	default:
@@ -763,7 +762,6 @@ static const struct platform_device_id board_ids[] = {
 		.name = "adl_rt5682_c1_h02",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(1) |
-					SOF_NUM_IDISP_HDMI(3) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
 					SOF_SSP_MASK_HDMI_CAPTURE(0x5)),
 	},
@@ -787,7 +785,6 @@ static const struct platform_device_id board_ids[] = {
 		.name = "rpl_rt5682_c1_h02",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(1) |
-					SOF_NUM_IDISP_HDMI(3) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
 					SOF_SSP_MASK_HDMI_CAPTURE(0x5)),
 	},
@@ -796,7 +793,6 @@ static const struct platform_device_id board_ids[] = {
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1) |
-					SOF_NUM_IDISP_HDMI(3) |
 					SOF_SSP_PORT_BT_OFFLOAD(2) |
 					SOF_BT_OFFLOAD_PRESENT),
 	},
@@ -804,15 +800,13 @@ static const struct platform_device_id board_ids[] = {
 		.name = "mtl_mx98360_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(0) |
-					SOF_SSP_PORT_AMP(1) |
-					SOF_NUM_IDISP_HDMI(3)),
+					SOF_SSP_PORT_AMP(1)),
 	},
 	{
 		.name = "mtl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(2) |
 					SOF_SSP_PORT_AMP(0) |
-					SOF_NUM_IDISP_HDMI(3) |
 					SOF_SSP_PORT_BT_OFFLOAD(1) |
 					SOF_BT_OFFLOAD_PRESENT),
 	},
-- 
2.40.1

