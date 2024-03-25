Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D889B88B3AE
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:13:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81C2F21A2;
	Mon, 25 Mar 2024 23:13:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81C2F21A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404826;
	bh=PR58LAYdPKGaBBwD+A0mxfsLF6XzjBUfB6Tu8mTI46s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bA8TnrCh42GzGGo1aul1S8osq0G8YvN8syGOgsRCt8C31QCjf2AyPWtQJRUhAUBes
	 taOWqDuvudkcQ/g38ffalDnyyBEHXjnCag9UqZq1f7Irrsf8TBN122pQ9NSE7M9QZ3
	 +IVVDo75glgpbmOIVq2MLbL1Zbxss2D0S5Lso0dY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EC27F806A0; Mon, 25 Mar 2024 23:11:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6821F806B7;
	Mon, 25 Mar 2024 23:11:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BA38F80600; Mon, 25 Mar 2024 23:11:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90B25F80570
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90B25F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DjSvUjIt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404686; x=1742940686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PR58LAYdPKGaBBwD+A0mxfsLF6XzjBUfB6Tu8mTI46s=;
  b=DjSvUjItLrVQy1ZeSYrdUdV94z1u5E7rtLX2j+N5/yyAmMhupUhGBtSQ
   ukgzAzroKYIuGfWl/eDkrWYxsJGAyp0bskKXRXcChLEbO1hPS0QSWnVCS
   Pnm7lcjHcqFm7ZIghMIbqwQVESP0/SrSMr3N9PNZmZ7ITZlqzXdYD/GNl
   8pq/SZCOfvitfP/Bmc+cWFRBvxvVWPavow+OThY0IQy2w6NM6JowD/1K3
   jaJC/Hm7byXlXDb89lWgpOu1Mt6uwBhh1uUraPFDE839+tQRYK+r+sJPU
   kCtmmjC6OHX2jYlwm+aCP2d0LCfCOM3l9xNP7giNEuwC1Mga4YOZQDDp4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643634"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643634"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722121"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 08/21] ASoC: Intel: sof_cs42l42: use common module for
 sof_card_private initialization
Date: Mon, 25 Mar 2024 17:10:46 -0500
Message-Id: <20240325221059.206042-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PO3A3747LB2YXNRB56MEAMDV7UIGTQZ7
X-Message-ID-Hash: PO3A3747LB2YXNRB56MEAMDV7UIGTQZ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PO3A3747LB2YXNRB56MEAMDV7UIGTQZ7/>
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
 sound/soc/intel/boards/sof_cs42l42.c | 72 +++++++---------------------
 1 file changed, 16 insertions(+), 56 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 330d596b2eb6..40ecfeaa1d26 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -22,23 +22,6 @@
 #include "../common/soc-intel-quirks.h"
 #include "sof_board_helpers.h"
 #include "sof_maxim_common.h"
-#include "sof_ssp_common.h"
-
-#define SOF_CS42L42_SSP_CODEC(quirk)		((quirk) & GENMASK(2, 0))
-#define SOF_CS42L42_SSP_CODEC_MASK		(GENMASK(2, 0))
-#define SOF_CS42L42_SSP_AMP_SHIFT		4
-#define SOF_CS42L42_SSP_AMP_MASK		(GENMASK(6, 4))
-#define SOF_CS42L42_SSP_AMP(quirk)	\
-	(((quirk) << SOF_CS42L42_SSP_AMP_SHIFT) & SOF_CS42L42_SSP_AMP_MASK)
-#define SOF_CS42L42_NUM_HDMIDEV_SHIFT		7
-#define SOF_CS42L42_NUM_HDMIDEV_MASK		(GENMASK(9, 7))
-#define SOF_CS42L42_NUM_HDMIDEV(quirk)	\
-	(((quirk) << SOF_CS42L42_NUM_HDMIDEV_SHIFT) & SOF_CS42L42_NUM_HDMIDEV_MASK)
-#define SOF_CS42L42_BT_OFFLOAD_PRESENT		BIT(25)
-#define SOF_CS42L42_SSP_BT_SHIFT		26
-#define SOF_CS42L42_SSP_BT_MASK			(GENMASK(28, 26))
-#define SOF_CS42L42_SSP_BT(quirk)	\
-	(((quirk) << SOF_CS42L42_SSP_BT_SHIFT) & SOF_CS42L42_SSP_BT_MASK)
 
 static struct snd_soc_jack_pin jack_pins[] = {
 	{
@@ -52,7 +35,7 @@ static struct snd_soc_jack_pin jack_pins[] = {
 };
 
 /* Default: SSP2 */
-static unsigned long sof_cs42l42_quirk = SOF_CS42L42_SSP_CODEC(2);
+static unsigned long sof_cs42l42_quirk = SOF_SSP_PORT_CODEC(2);
 
 static int sof_cs42l42_init(struct snd_soc_pcm_runtime *rtd)
 {
@@ -229,48 +212,26 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct sof_card_private *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
-
 	if (pdev->id_entry && pdev->id_entry->driver_data)
 		sof_cs42l42_quirk = (unsigned long)pdev->id_entry->driver_data;
 
-	ctx->codec_type = sof_ssp_detect_codec_type(&pdev->dev);
-	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
+	dev_dbg(&pdev->dev, "sof_cs42l42_quirk = %lx\n", sof_cs42l42_quirk);
+
+	/* initialize ctx with board quirk */
+	ctx = sof_intel_board_get_ctx(&pdev->dev, sof_cs42l42_quirk);
+	if (!ctx)
+		return -ENOMEM;
 
 	if (soc_intel_is_glk()) {
 		ctx->dmic_be_num = 1;
-		ctx->hdmi_num = 3;
 
 		/* overwrite the DAI link order for GLK boards */
 		ctx->link_order_overwrite = GLK_LINK_ORDER;
-	} else {
-		ctx->dmic_be_num = 2;
-		ctx->hdmi_num = (sof_cs42l42_quirk & SOF_CS42L42_NUM_HDMIDEV_MASK) >>
-			 SOF_CS42L42_NUM_HDMIDEV_SHIFT;
-		/* default number of HDMI DAI's */
-		if (!ctx->hdmi_num)
-			ctx->hdmi_num = 3;
 	}
 
 	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 		ctx->hdmi.idisp_codec = true;
 
-	dev_dbg(&pdev->dev, "sof_cs42l42_quirk = %lx\n", sof_cs42l42_quirk);
-
-	/* port number of peripherals attached to ssp interface */
-	ctx->ssp_bt = (sof_cs42l42_quirk & SOF_CS42L42_SSP_BT_MASK) >>
-			SOF_CS42L42_SSP_BT_SHIFT;
-
-	ctx->ssp_amp = (sof_cs42l42_quirk & SOF_CS42L42_SSP_AMP_MASK) >>
-			SOF_CS42L42_SSP_AMP_SHIFT;
-
-	ctx->ssp_codec = sof_cs42l42_quirk & SOF_CS42L42_SSP_CODEC_MASK;
-
-	if (sof_cs42l42_quirk & SOF_CS42L42_BT_OFFLOAD_PRESENT)
-		ctx->bt_offload_present = true;
-
 	/* update dai_link */
 	ret = sof_card_dai_links_create(&pdev->dev, &sof_audio_card_cs42l42, ctx);
 	if (ret)
@@ -293,21 +254,21 @@ static int sof_audio_probe(struct platform_device *pdev)
 static const struct platform_device_id board_ids[] = {
 	{
 		.name = "glk_cs4242_mx98357a",
-		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(2) |
-					SOF_CS42L42_SSP_AMP(1)),
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(2) |
+					SOF_SSP_PORT_AMP(1)),
 	},
 	{
 		.name = "jsl_cs4242_mx98360a",
-		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(0) |
-					SOF_CS42L42_SSP_AMP(1)),
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1)),
 	},
 	{
 		.name = "adl_mx98360a_cs4242",
-		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(0) |
-				SOF_CS42L42_SSP_AMP(1) |
-				SOF_CS42L42_NUM_HDMIDEV(4) |
-				SOF_CS42L42_BT_OFFLOAD_PRESENT |
-				SOF_CS42L42_SSP_BT(2)),
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1) |
+					SOF_NUM_IDISP_HDMI(4) |
+					SOF_BT_OFFLOAD_PRESENT |
+					SOF_SSP_PORT_BT_OFFLOAD(2)),
 	},
 	{ }
 };
@@ -329,4 +290,3 @@ MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
-- 
2.40.1

