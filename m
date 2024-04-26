Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EADD58B3B59
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:27:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77031B70;
	Fri, 26 Apr 2024 17:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77031B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145223;
	bh=8vZbOcgbSIpqXkZfIbzioi6VWXjubE1vsbynf0yIWAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LF+F9zXxXqc2fxIPedSl7rID+a6MdEJRNRVNFFKPOweWfJj96xZaESrNmCUeSU16O
	 3BYVh9By49DqPid/caApWo0hSGXy9b775L3AmRCb0CYzm1CRYjOXJlcPYvXRphqwmK
	 j7MaT6+8mGV7FMr9mTjFtgtJ32Iv9ohxaQdCRZLI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BE61F805AA; Fri, 26 Apr 2024 17:25:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CD8AF8056F;
	Fri, 26 Apr 2024 17:25:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17FB9F805C8; Fri, 26 Apr 2024 17:25:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01EBCF80423
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01EBCF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KUjJKzsP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145145; x=1745681145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8vZbOcgbSIpqXkZfIbzioi6VWXjubE1vsbynf0yIWAo=;
  b=KUjJKzsPl/4dxp9xV8CCKyIkkjgTcyvQWtUW7biy06BT4B+HvMSDg5A/
   kfE5970oMnefl0rbw9TM8clUKTVdEX6gETm9xGdSeuH0gHMmR6JAUi61a
   8thVNM+LXUfN2FWw3AXrFJ+e8pUdRny/BtWLxgnpDiDLs/pLMv6N+RXRM
   qzLgJq7L0pcu/2/7PvyMZz5HC8qZbDrH5pxD4OknCLhKVIgy3Vtib8B+0
   pBjhqTHEHmBUfjPMHXtTjztL1WF78ikABA31oI79hU00rOVx/72o4+hhh
   fcD8i4GlnDNixHwbNkrRPV5r1Sajz7ahzP+2qorb0nd3Ce9tsDQ2sFq4D
   w==;
X-CSE-ConnectionGUID: BUzqNOs9SnywmeLsPp9pPw==
X-CSE-MsgGUID: /O0TLgVSTUmuogs2owFGlg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291285"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291285"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:41 -0700
X-CSE-ConnectionGUID: yDAw3X00QDKy4pWyFVkfIQ==
X-CSE-MsgGUID: q57wkM1USdSdWhi9I0A1Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259542"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 04/23] ASoC: Intel: sof_da7219: add cml_da7219_def for cml
 boards
Date: Fri, 26 Apr 2024 10:25:10 -0500
Message-Id: <20240426152529.38345-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TKJEQW4DN42TP6NTKF6S25TE4ZOC67GB
X-Message-ID-Hash: TKJEQW4DN42TP6NTKF6S25TE4ZOC67GB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKJEQW4DN42TP6NTKF6S25TE4ZOC67GB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add the board config cml_da7219_def to da7219 machine driver for all
cml boards using default SSP port allocation (headphone codec on SSP0,
speaker amplifiers on SSP1).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index de5b0a8b5b8c..69555eee7c7a 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -19,8 +19,9 @@
 #include "sof_maxim_common.h"
 
 /* Driver-specific board quirks: from bit 0 to 7 */
-#define SOF_DA7219_JSL_BOARD			BIT(0)
-#define SOF_DA7219_MCLK_EN			BIT(1)
+#define SOF_DA7219_CML_BOARD			BIT(0)
+#define SOF_DA7219_JSL_BOARD			BIT(1)
+#define SOF_DA7219_MCLK_EN			BIT(2)
 
 #define DIALOG_CODEC_DAI	"da7219-hifi"
 
@@ -292,6 +293,14 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 	return 0;
 }
 
+#define CML_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_AMP,         \
+					SOF_LINK_CODEC,      \
+					SOF_LINK_DMIC01,     \
+					SOF_LINK_IDISP_HDMI, \
+					SOF_LINK_DMIC16K,    \
+					SOF_LINK_NONE,       \
+					SOF_LINK_NONE)
+
 #define JSL_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_AMP,         \
 					SOF_LINK_CODEC,      \
 					SOF_LINK_DMIC01,     \
@@ -320,7 +329,10 @@ static int audio_probe(struct platform_device *pdev)
 	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 		ctx->hdmi.idisp_codec = true;
 
-	if (board_quirk & SOF_DA7219_JSL_BOARD) {
+	if (board_quirk & SOF_DA7219_CML_BOARD) {
+		/* overwrite the DAI link order for CML boards */
+		ctx->link_order_overwrite = CML_LINK_ORDER;
+	} else if (board_quirk & SOF_DA7219_JSL_BOARD) {
 		ctx->da7219.is_jsl_board = true;
 
 		/* overwrite the DAI link order for JSL boards */
@@ -380,6 +392,12 @@ static int audio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id board_ids[] = {
+	{
+		.name = "cml_da7219_def",
+		.driver_data = (kernel_ulong_t)(SOF_DA7219_CML_BOARD |
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1)),
+	},
 	{
 		.name = "jsl_da7219_def",
 		.driver_data = (kernel_ulong_t)(SOF_DA7219_JSL_BOARD |
-- 
2.40.1

