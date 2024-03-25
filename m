Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1B588B3BB
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:14:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCED32340;
	Mon, 25 Mar 2024 23:14:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCED32340
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404889;
	bh=/AbZr3luctDlVjBzrahchdMNCBFkU+915f9nJbC0iBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SDLg3Vdl+OxKhRZKcI0+oXIfOnNTIpTZAOYb+r1ANKA8pacYzrz3yqe8EpjQNMy/q
	 /h24rzfA+gzeiYdC0qG5yjkaejZbrFcIPUq5J7B9GMdriQtK2OlJ5gRPOy8095Vtpu
	 1JnxtPUmG3ejMpzh9lbuYcVSpbMlku3tqf0XeGEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 648FAF8074C; Mon, 25 Mar 2024 23:12:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E731F8074A;
	Mon, 25 Mar 2024 23:12:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0572F80649; Mon, 25 Mar 2024 23:11:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84CB3F805BA
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84CB3F805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GxerX/7d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404688; x=1742940688;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/AbZr3luctDlVjBzrahchdMNCBFkU+915f9nJbC0iBQ=;
  b=GxerX/7dk3XgKHbKVo7xu22V9iyDzxk2Gx30zwXE+RMHO48ETGsS6WxJ
   YMGy1T6Sk6us7rt6P0J4iMbgp+h6jPnngiITDmG8pHux7IPDnKUKlE6ev
   tF8P+w34gMxsrEvRD8mdFwdN2+l6bPusc8l1ZwOPfC0x+m1SbOlIAN0eL
   IPy4X4eFKMeFFmoxcW0McFoXvTahOCE1pHm8nXnTFX4epgs5ciSfH6vHw
   FO4zmEsT2RqTODPGBqtd+/8zPu7YyU+L2NOPcUAuzq1sPFElYv494+5Xs
   dyyVq10uMYSe1cj0l832W0hlCNPLtxkT9J+0qew8lxdZ1hCc6VPi5xOVj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643648"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643648"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722135"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/21] ASoC: Intel: sof_ssp_amp: use common module for
 sof_card_private initialization
Date: Mon, 25 Mar 2024 17:10:49 -0500
Message-Id: <20240325221059.206042-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LVFJTJCCVZ3QD5OSERZ2746KCVZOUD42
X-Message-ID-Hash: LVFJTJCCVZ3QD5OSERZ2746KCVZOUD42
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVFJTJCCVZ3QD5OSERZ2746KCVZOUD42/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use intel_board module to initialize sof_card_private structure.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 91 ++++++++--------------------
 1 file changed, 25 insertions(+), 66 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 0b8adab76755..b99af8bc4ccc 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -20,34 +20,12 @@
 #include "sof_board_helpers.h"
 #include "sof_realtek_common.h"
 #include "sof_cirrus_common.h"
-#include "sof_ssp_common.h"
 
-/* SSP port ID for speaker amplifier */
-#define SOF_AMPLIFIER_SSP(quirk)		((quirk) & GENMASK(3, 0))
-#define SOF_AMPLIFIER_SSP_MASK			(GENMASK(3, 0))
-
-/* HDMI capture*/
-#define SOF_HDMI_CAPTURE_SSP_MASK_SHIFT		4
-#define SOF_HDMI_CAPTURE_SSP_MASK_MASK		(GENMASK(9, 4))
-#define SOF_HDMI_CAPTURE_SSP_MASK(quirk)	\
-	(((quirk) << SOF_HDMI_CAPTURE_SSP_MASK_SHIFT) & SOF_HDMI_CAPTURE_SSP_MASK_MASK)
-
-/* HDMI playback */
-#define SOF_HDMI_PLAYBACK_PRESENT		BIT(13)
-#define SOF_NO_OF_HDMI_PLAYBACK_SHIFT		14
-#define SOF_NO_OF_HDMI_PLAYBACK_MASK		(GENMASK(16, 14))
-#define SOF_NO_OF_HDMI_PLAYBACK(quirk)	\
-	(((quirk) << SOF_NO_OF_HDMI_PLAYBACK_SHIFT) & SOF_NO_OF_HDMI_PLAYBACK_MASK)
-
-/* BT audio offload */
-#define SOF_SSP_BT_OFFLOAD_PRESENT		BIT(17)
-#define SOF_BT_OFFLOAD_SSP_SHIFT		18
-#define SOF_BT_OFFLOAD_SSP_MASK			(GENMASK(20, 18))
-#define SOF_BT_OFFLOAD_SSP(quirk)	\
-	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
+/* Driver-specific board quirks: from bit 0 to 7 */
+#define SOF_HDMI_PLAYBACK_PRESENT		BIT(0)
 
 /* Default: SSP2  */
-static unsigned long sof_ssp_amp_quirk = SOF_AMPLIFIER_SSP(2);
+static unsigned long sof_ssp_amp_quirk = SOF_SSP_PORT_AMP(2);
 
 static const struct dmi_system_id chromebook_platforms[] = {
 	{
@@ -136,45 +114,27 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	struct sof_card_private *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
-
 	if (pdev->id_entry && pdev->id_entry->driver_data)
 		sof_ssp_amp_quirk = (unsigned long)pdev->id_entry->driver_data;
 
-	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
+	dev_dbg(&pdev->dev, "sof_ssp_amp_quirk = %lx\n", sof_ssp_amp_quirk);
 
-	if (dmi_check_system(chromebook_platforms) || mach->mach_params.dmic_num > 0)
-		ctx->dmic_be_num = 2;
-	else
+	/* initialize ctx with board quirk */
+	ctx = sof_intel_board_get_ctx(&pdev->dev, sof_ssp_amp_quirk);
+	if (!ctx)
+		return -ENOMEM;
+
+	if (!dmi_check_system(chromebook_platforms) &&
+	    (mach->mach_params.dmic_num == 0))
 		ctx->dmic_be_num = 0;
 
-	/* port number/mask of peripherals attached to ssp interface */
-	ctx->ssp_mask_hdmi_in = (sof_ssp_amp_quirk & SOF_HDMI_CAPTURE_SSP_MASK_MASK) >>
-			SOF_HDMI_CAPTURE_SSP_MASK_SHIFT;
-
-	ctx->ssp_bt = (sof_ssp_amp_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
-			SOF_BT_OFFLOAD_SSP_SHIFT;
-
-	ctx->ssp_amp = sof_ssp_amp_quirk & SOF_AMPLIFIER_SSP_MASK;
-
 	if (sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT) {
-		ctx->hdmi_num = (sof_ssp_amp_quirk & SOF_NO_OF_HDMI_PLAYBACK_MASK) >>
-				SOF_NO_OF_HDMI_PLAYBACK_SHIFT;
-		/* default number of HDMI DAI's */
-		if (!ctx->hdmi_num)
-			ctx->hdmi_num = 3;
-
 		if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 			ctx->hdmi.idisp_codec = true;
 	} else {
 		ctx->hdmi_num = 0;
 	}
 
-	if (sof_ssp_amp_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
-		ctx->bt_offload_present = true;
-
 	ctx->link_order_overwrite = SSP_AMP_LINK_ORDER;
 
 	if (ctx->ssp_mask_hdmi_in) {
@@ -220,38 +180,38 @@ static const struct platform_device_id board_ids[] = {
 	},
 	{
 		.name = "tgl_rt1308_hdmi_ssp",
-		.driver_data = (kernel_ulong_t)(SOF_AMPLIFIER_SSP(2) |
-					SOF_HDMI_CAPTURE_SSP_MASK(0x22)),
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_AMP(2) |
+					SOF_SSP_MASK_HDMI_CAPTURE(0x22)),
 					/* SSP 1 and SSP 5 are used for HDMI IN */
 	},
 	{
 		.name = "adl_cs35l41",
-		.driver_data = (kernel_ulong_t)(SOF_AMPLIFIER_SSP(1) |
-					SOF_NO_OF_HDMI_PLAYBACK(4) |
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_AMP(1) |
+					SOF_NUM_IDISP_HDMI(4) |
 					SOF_HDMI_PLAYBACK_PRESENT |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
+					SOF_SSP_PORT_BT_OFFLOAD(2) |
+					SOF_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.name = "adl_lt6911_hdmi_ssp",
-		.driver_data = (kernel_ulong_t)(SOF_HDMI_CAPTURE_SSP_MASK(0x5) |
+		.driver_data = (kernel_ulong_t)(SOF_SSP_MASK_HDMI_CAPTURE(0x5) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
-					SOF_NO_OF_HDMI_PLAYBACK(3) |
+					SOF_NUM_IDISP_HDMI(3) |
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
 	{
 		.name = "rpl_lt6911_hdmi_ssp",
-		.driver_data = (kernel_ulong_t)(SOF_HDMI_CAPTURE_SSP_MASK(0x5) |
+		.driver_data = (kernel_ulong_t)(SOF_SSP_MASK_HDMI_CAPTURE(0x5) |
 					/* SSP 0 and SSP 2 are used for HDMI IN */
-					SOF_NO_OF_HDMI_PLAYBACK(3) |
+					SOF_NUM_IDISP_HDMI(3) |
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
 	{
 		.name = "mtl_lt6911_hdmi_ssp",
-		.driver_data = (kernel_ulong_t)(SOF_HDMI_CAPTURE_SSP_MASK(0x5) |
-				/* SSP 0 and SSP 2 are used for HDMI IN */
-				SOF_NO_OF_HDMI_PLAYBACK(3) |
-				SOF_HDMI_PLAYBACK_PRESENT),
+		.driver_data = (kernel_ulong_t)(SOF_SSP_MASK_HDMI_CAPTURE(0x5) |
+					/* SSP 0 and SSP 2 are used for HDMI IN */
+					SOF_NUM_IDISP_HDMI(3) |
+					SOF_HDMI_PLAYBACK_PRESENT),
 	},
 	{ }
 };
@@ -274,4 +234,3 @@ MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_CIRRUS_COMMON);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
-- 
2.40.1

