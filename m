Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9021888B3B8
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:14:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36CFB231B;
	Mon, 25 Mar 2024 23:14:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36CFB231B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404858;
	bh=4aslR8We+pag8A7hUU5/xm9a/8Ka4/9Qhko+IKJe6xc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=M4sWRIeXsyJXfJd5n8aAxby1/sflCNi+l2nfNddkSslr/yIDqnyM5j9O96mqgBXBw
	 r3ePv4x2VKi534msI6SpeCyapkRuqKpg884TScYj4EgkIJ7K4NBYCt5w21V7g1wKEU
	 pnWg0CFVrT/k4dGMhJEHXJDSHR18wUmSuguA+0pc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1E69F806E3; Mon, 25 Mar 2024 23:12:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADFADF806D0;
	Mon, 25 Mar 2024 23:11:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 917D1F8057F; Mon, 25 Mar 2024 23:11:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A28A4F8055C
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A28A4F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ERUMVqiX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404687; x=1742940687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4aslR8We+pag8A7hUU5/xm9a/8Ka4/9Qhko+IKJe6xc=;
  b=ERUMVqiXJAw0I7Y+CrhI7aSaA7Il/ZqEufAYptcoNW1fVDOYojXxROXS
   G5wAQKMC0wzHtjJcKobO6DMTA0FdFWmMZDMtxzaubbqoOArJXHSZctt1t
   VzBpNbirqnaYHs6gBMpdo0oOqBq8aKju3WmJ0F9FpET97hbnH2v1+jne7
   8TTZWtj8U+TmDTAAGq90JL+jPbx5wQmQuW8n2n3rReQDhfRG+drAbuzFb
   Gx1HVIqnQHpK2y4byfzOokdTIJyc/YrEY2nAXzN2NOJXEKCz99yM8QOsn
   azJPRrUUBwfhlINyqnNffUm300gNjJSHN9FVPmDZS74WTCxUsGslJCuko
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643638"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643638"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722125"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/21] ASoC: Intel: sof_nau8825: use common module for
 sof_card_private initialization
Date: Mon, 25 Mar 2024 17:10:47 -0500
Message-Id: <20240325221059.206042-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: R2HNJAISMI6AR6ZTM64IAM45LYDBCN2T
X-Message-ID-Hash: R2HNJAISMI6AR6ZTM64IAM45LYDBCN2T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R2HNJAISMI6AR6ZTM64IAM45LYDBCN2T/>
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
 sound/soc/intel/boards/sof_nau8825.c | 86 +++++++---------------------
 1 file changed, 22 insertions(+), 64 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 719c2fbaf515..b9db6e236a93 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -24,27 +24,8 @@
 #include "sof_realtek_common.h"
 #include "sof_maxim_common.h"
 #include "sof_nuvoton_common.h"
-#include "sof_ssp_common.h"
 
-#define SOF_NAU8825_SSP_CODEC(quirk)		((quirk) & GENMASK(2, 0))
-#define SOF_NAU8825_SSP_CODEC_MASK		(GENMASK(2, 0))
-#define SOF_NAU8825_SSP_AMP_SHIFT		4
-#define SOF_NAU8825_SSP_AMP_MASK		(GENMASK(6, 4))
-#define SOF_NAU8825_SSP_AMP(quirk)	\
-	(((quirk) << SOF_NAU8825_SSP_AMP_SHIFT) & SOF_NAU8825_SSP_AMP_MASK)
-#define SOF_NAU8825_NUM_HDMIDEV_SHIFT		7
-#define SOF_NAU8825_NUM_HDMIDEV_MASK		(GENMASK(9, 7))
-#define SOF_NAU8825_NUM_HDMIDEV(quirk)	\
-	(((quirk) << SOF_NAU8825_NUM_HDMIDEV_SHIFT) & SOF_NAU8825_NUM_HDMIDEV_MASK)
-
-/* BT audio offload: reserve 3 bits for future */
-#define SOF_BT_OFFLOAD_SSP_SHIFT		10
-#define SOF_BT_OFFLOAD_SSP_MASK		(GENMASK(12, 10))
-#define SOF_BT_OFFLOAD_SSP(quirk)	\
-	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
-#define SOF_SSP_BT_OFFLOAD_PRESENT		BIT(13)
-
-static unsigned long sof_nau8825_quirk = SOF_NAU8825_SSP_CODEC(0);
+static unsigned long sof_nau8825_quirk = SOF_SSP_PORT_CODEC(0);
 
 static struct snd_soc_jack_pin jack_pins[] = {
 	{
@@ -264,41 +245,19 @@ static int sof_audio_probe(struct platform_device *pdev)
 	struct sof_card_private *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
-
 	if (pdev->id_entry && pdev->id_entry->driver_data)
 		sof_nau8825_quirk = (unsigned long)pdev->id_entry->driver_data;
 
-	ctx->codec_type = sof_ssp_detect_codec_type(&pdev->dev);
-	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
-
 	dev_dbg(&pdev->dev, "sof_nau8825_quirk = %lx\n", sof_nau8825_quirk);
 
-	/* default number of DMIC DAI's */
-	ctx->dmic_be_num = 2;
-	ctx->hdmi_num = (sof_nau8825_quirk & SOF_NAU8825_NUM_HDMIDEV_MASK) >>
-			SOF_NAU8825_NUM_HDMIDEV_SHIFT;
-	/* default number of HDMI DAI's */
-	if (!ctx->hdmi_num)
-		ctx->hdmi_num = 3;
+	/* initialize ctx with board quirk */
+	ctx = sof_intel_board_get_ctx(&pdev->dev, sof_nau8825_quirk);
+	if (!ctx)
+		return -ENOMEM;
 
 	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
 		ctx->hdmi.idisp_codec = true;
 
-	/* port number of peripherals attached to ssp interface */
-	ctx->ssp_bt = (sof_nau8825_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
-			SOF_BT_OFFLOAD_SSP_SHIFT;
-
-	ctx->ssp_amp = (sof_nau8825_quirk & SOF_NAU8825_SSP_AMP_MASK) >>
-			SOF_NAU8825_SSP_AMP_SHIFT;
-
-	ctx->ssp_codec = sof_nau8825_quirk & SOF_NAU8825_SSP_CODEC_MASK;
-
-	if (sof_nau8825_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
-		ctx->bt_offload_present = true;
-
 	/* update dai_link */
 	ret = sof_card_dai_links_create(&pdev->dev, &sof_audio_card_nau8825, ctx);
 	if (ret)
@@ -340,33 +299,33 @@ static int sof_audio_probe(struct platform_device *pdev)
 static const struct platform_device_id board_ids[] = {
 	{
 		.name = "sof_nau8825",
-		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_NAU8825_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
+					SOF_NUM_IDISP_HDMI(4) |
+					SOF_SSP_PORT_BT_OFFLOAD(2) |
+					SOF_BT_OFFLOAD_PRESENT),
 
 	},
 	{
 		.name = "adl_rt1019p_8825",
-		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_NAU8825_SSP_AMP(2) |
-					SOF_NAU8825_NUM_HDMIDEV(4)),
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(2) |
+					SOF_NUM_IDISP_HDMI(4)),
 	},
 	{
 		.name = "adl_nau8825_def",
-		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_NAU8825_SSP_AMP(1) |
-					SOF_NAU8825_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1) |
+					SOF_NUM_IDISP_HDMI(4) |
+					SOF_SSP_PORT_BT_OFFLOAD(2) |
+					SOF_BT_OFFLOAD_PRESENT),
 	},
 	{
 		.name = "rpl_nau8825_def",
-		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
-					SOF_NAU8825_SSP_AMP(1) |
-					SOF_NAU8825_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1) |
+					SOF_NUM_IDISP_HDMI(4) |
+					SOF_SSP_PORT_BT_OFFLOAD(2) |
+					SOF_BT_OFFLOAD_PRESENT),
 	},
 	{ }
 };
@@ -392,4 +351,3 @@ MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_NUVOTON_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
-- 
2.40.1

