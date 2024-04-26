Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A918B3B6C
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:29:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B99151948;
	Fri, 26 Apr 2024 17:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B99151948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145342;
	bh=CUJ4gpeghgaNO6EMTLDMvbsqTzdQHrL2AHabosbSSp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uAhd+xyGOsuRWisoSpF94oFSa/diyGdtEmlmAgNRcVusLxthk1N14eAPcun6WF6dI
	 D6Nwo/wY8QVju5+605F9ac55I1kt26R7pGoyPVYzyiXqTzCStQvQkaEerdM7xGGQ3N
	 Y5t5dANEnsAUFo+7i6NV5udor7I543n+8/vf+wBA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BA88F80722; Fri, 26 Apr 2024 17:26:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAE82F80709;
	Fri, 26 Apr 2024 17:26:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0505F80638; Fri, 26 Apr 2024 17:26:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FD0DF8003A
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FD0DF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ibj8Xmp2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145150; x=1745681150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CUJ4gpeghgaNO6EMTLDMvbsqTzdQHrL2AHabosbSSp0=;
  b=ibj8Xmp2uXYad3JGNCtLJiIJGL0VRR7Z2RuiJ9s622QKes/p6cG997P8
   1gfuIAn+kW8/nwuubZukOYzUuW/mjfw5lbJpqfPMY92wOQfr/DiVIu79x
   HvfsTVnTHZ/w79hWUczViYhWHPxBgHIiFzkXAFOSNHnFwG0hAGhl/MmlR
   cUvxSeKqC4Y7CpgGZ3aiu3mNGYAuLLzd+mU9c5LCTzPPtKFYe8WINw4VW
   q4W2rLK2r2D2OQJgw8GLxoeSTUsTKCf4EvIFW33/DPB3qGjQlGwc6xfGT
   l/QZjZn8gSY+q3NgfLJusY/qRSqItT5RLHzeZyt8G5W3jBGp1E5nGV/kH
   A==;
X-CSE-ConnectionGUID: vUP9lnlWTBC1qc9KlTfgNw==
X-CSE-MsgGUID: HT7XU5vBTLmJIZkd+MxZ/g==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291321"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291321"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:46 -0700
X-CSE-ConnectionGUID: gZJC2Xo6QsW5UicGAROPRw==
X-CSE-MsgGUID: f9JYsEwKQ8Gz/tj+xf4Jsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259575"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/23] ASoC: Intel: sof_da7219: add glk_da7219_def for glk
 boards
Date: Fri, 26 Apr 2024 10:25:17 -0500
Message-Id: <20240426152529.38345-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LLOP6XUZ6VBNFYEMYKPC5LGXSW5EYZTU
X-Message-ID-Hash: LLOP6XUZ6VBNFYEMYKPC5LGXSW5EYZTU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LLOP6XUZ6VBNFYEMYKPC5LGXSW5EYZTU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add the board config glk_da7219_def to da7219 machine driver for all
glk boards using default SSP port allocation (headphone codec on SSP2,
speaker amplifiers on SSP1).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index ecb1d4b25ea6..cc5e99b21456 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -19,9 +19,10 @@
 #include "sof_maxim_common.h"
 
 /* Driver-specific board quirks: from bit 0 to 7 */
-#define SOF_DA7219_CML_BOARD			BIT(0)
-#define SOF_DA7219_JSL_BOARD			BIT(1)
-#define SOF_DA7219_MCLK_EN			BIT(2)
+#define SOF_DA7219_GLK_BOARD			BIT(0)
+#define SOF_DA7219_CML_BOARD			BIT(1)
+#define SOF_DA7219_JSL_BOARD			BIT(2)
+#define SOF_DA7219_MCLK_EN			BIT(3)
 
 #define DIALOG_CODEC_DAI	"da7219-hifi"
 
@@ -296,6 +297,14 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 	return 0;
 }
 
+#define GLK_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_AMP,         \
+					SOF_LINK_CODEC,      \
+					SOF_LINK_DMIC01,     \
+					SOF_LINK_IDISP_HDMI, \
+					SOF_LINK_NONE,       \
+					SOF_LINK_NONE,       \
+					SOF_LINK_NONE)
+
 #define CML_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_AMP,         \
 					SOF_LINK_CODEC,      \
 					SOF_LINK_DMIC01,     \
@@ -333,7 +342,13 @@ static int audio_probe(struct platform_device *pdev)
 	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 		ctx->hdmi.idisp_codec = true;
 
-	if (board_quirk & SOF_DA7219_CML_BOARD) {
+	if (board_quirk & SOF_DA7219_GLK_BOARD) {
+		/* dmic16k not support */
+		ctx->dmic_be_num = 1;
+
+		/* overwrite the DAI link order for GLK boards */
+		ctx->link_order_overwrite = GLK_LINK_ORDER;
+	} else if (board_quirk & SOF_DA7219_CML_BOARD) {
 		/* overwrite the DAI link order for CML boards */
 		ctx->link_order_overwrite = CML_LINK_ORDER;
 
@@ -427,6 +442,12 @@ static int audio_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id board_ids[] = {
+	{
+		.name = "glk_da7219_def",
+		.driver_data = (kernel_ulong_t)(SOF_DA7219_GLK_BOARD |
+					SOF_SSP_PORT_CODEC(2) |
+					SOF_SSP_PORT_AMP(1)),
+	},
 	{
 		.name = "cml_da7219_def",
 		.driver_data = (kernel_ulong_t)(SOF_DA7219_CML_BOARD |
-- 
2.40.1

