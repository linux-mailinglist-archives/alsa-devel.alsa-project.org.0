Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 226228A21BE
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 00:32:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E9FC2BDB;
	Fri, 12 Apr 2024 00:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E9FC2BDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712874754;
	bh=TMR07NZyxBMzozdVg2PV5pehrtCgmfaAUxJuFw/xcPM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NW2urpfPgIjXHmTcEEwT+FDRYLoxZNutms9ziqltmh7A7B5c+kBfzh575sMT9yfNj
	 Uo2Ns4aYXbImGpI3lJoCdtf2vxOzs77EJ1P9bn/9CKDQbrmlkab1mnZ2jCT5eHFgI7
	 AnNei1MZ3TfbfluDGJoqPeQ9PqJCAVI2glODz0wo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7C3AF805E3; Fri, 12 Apr 2024 00:31:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F872F805BB;
	Fri, 12 Apr 2024 00:31:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC03BF80238; Fri, 12 Apr 2024 00:16:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6F06F8055C
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 00:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6F06F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ejYxnL7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873065; x=1744409065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TMR07NZyxBMzozdVg2PV5pehrtCgmfaAUxJuFw/xcPM=;
  b=ejYxnL7bRPlO+5/rspu4BridzxsiITZhx4QeyvqQw//EQQqbJsbKqbYo
   iU1Z7dmafcg4VCZcUSjDujSli216lFZJ297ECL4yq+8dtXwLkqQ1VDL80
   YsHPKmdgfMSmRlEadlTUc2tHIlFEwhKeiCw3jHuIbe8MT8MG6sbiJd12x
   C485dQjwIZwwIJdf2baJ+yKEZ1F367tMVxuu6P9m+iYmPrmOmr80sR7d1
   EjgwPsTNralxKUUzITBuYteuTxWmHJnWftrB/7G5nMZTa9ffJcDmgq6Fw
   1jc9/t5TPpAP4OU/Ia+xP+/B6S3lwejJHSojUwG0WozsO7VwMAGe0yTLI
   Q==;
X-CSE-ConnectionGUID: 2iIHj732TPKusVsAqv4k8w==
X-CSE-MsgGUID: oMtNiBb4RVmrzPBa/YrRNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708356"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="19708356"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:15 -0700
X-CSE-ConnectionGUID: PI80/Y/ZQDOGpo10emHSqw==
X-CSE-MsgGUID: hwQG/UANRSiHyV2r4LRchQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="21628738"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 05/12] ASoC: Intel: sof_sdw: remove FOUR_SPEAKER quirks
Date: Thu, 11 Apr 2024 17:03:40 -0500
Message-Id: <20240411220347.131267-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ID5LSMOL4UUWLTC4EKPPE3SJIQA54XNL
X-Message-ID-Hash: ID5LSMOL4UUWLTC4EKPPE3SJIQA54XNL
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch removes a confusion between speakers and amplifiers.

The existing code keeps track of the number of amplifiers and reports
it in the 'cfg-amp' component string.

The number of speakers is defined with quirks, but those quirks are
not consistently added: in the MeteorLake case, none of the supported
platforms used such a quirk, and UCM does not use the values reported
anyways. The notion of 'FOUR_SPEAKERS' is also obsolete now with some
platforms having more than four speakers.

Let's just remove all this and only report the number of amplifiers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 68 ++++++++-----------------
 sound/soc/intel/boards/sof_sdw_common.h |  1 +
 2 files changed, 23 insertions(+), 46 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6253fc464198..d65c5da49000 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -27,7 +27,7 @@ static void log_quirks(struct device *dev)
 		dev_dbg(dev, "quirk realtek,jack-detect-source %ld\n",
 			SOF_JACK_JDSRC(sof_sdw_quirk));
 	if (sof_sdw_quirk & SOF_SDW_FOUR_SPK)
-		dev_dbg(dev, "quirk SOF_SDW_FOUR_SPK enabled\n");
+		dev_err(dev, "quirk SOF_SDW_FOUR_SPK enabled but no longer supported\n");
 	if (sof_sdw_quirk & SOF_SDW_TGL_HDMI)
 		dev_dbg(dev, "quirk SOF_SDW_TGL_HDMI enabled\n");
 	if (sof_sdw_quirk & SOF_SDW_PCH_DMIC)
@@ -80,8 +80,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "098F"),
 		},
-		.driver_data = (void *)(RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+		.driver_data = (void *)(RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -89,8 +88,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0990"),
 		},
-		.driver_data = (void *)(RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+		.driver_data = (void *)(RT711_JD2),
 	},
 	/* IceLake devices */
 	{
@@ -141,8 +139,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A5D")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -151,8 +148,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A5E")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -162,7 +158,6 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					SOF_SDW_PCH_DMIC |
-					SOF_SDW_FOUR_SPK |
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
@@ -173,8 +168,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Ripto"),
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_SDW_PCH_DMIC |
-					SOF_SDW_FOUR_SPK),
+					SOF_SDW_PCH_DMIC),
 	},
 	{
 		/*
@@ -258,8 +252,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A32")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -290,7 +283,6 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					SOF_SDW_PCH_DMIC |
-					SOF_SDW_FOUR_SPK |
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
@@ -301,8 +293,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AF0")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -311,8 +302,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AF3"),
 		},
 		/* No Jack */
-		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_SDW_FOUR_SPK),
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -321,8 +311,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AFE")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -331,8 +320,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0AFF")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -341,8 +329,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B00")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -351,8 +338,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B01")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -361,8 +347,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B11")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -371,8 +356,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B12")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -400,8 +384,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0B29"),
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -429,8 +412,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0BDA")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -449,8 +431,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C10"),
 		},
 		/* No Jack */
-		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_SDW_FOUR_SPK),
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -459,8 +440,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C11")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -469,8 +449,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C40")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -479,8 +458,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0C4F")
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					RT711_JD2 |
-					SOF_SDW_FOUR_SPK),
+					RT711_JD2),
 	},
 	/* MeteorLake devices */
 	{
@@ -2010,9 +1988,7 @@ static int mc_probe(struct platform_device *pdev)
 		amp_num += codec_info_list[i].amp_num;
 
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "cfg-spk:%d cfg-amp:%d",
-					  (sof_sdw_quirk & SOF_SDW_FOUR_SPK)
-					  ? 4 : 2, amp_num);
+					  "cfg-amp:%d", amp_num);
 	if (!card->components)
 		return -ENOMEM;
 
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 8468487a6bd6..89253938ebaa 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -45,6 +45,7 @@ enum {
 };
 
 #define SOF_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
+/* Deprecated and no longer supported by the code */
 #define SOF_SDW_FOUR_SPK		BIT(4)
 #define SOF_SDW_TGL_HDMI		BIT(5)
 #define SOF_SDW_PCH_DMIC		BIT(6)
-- 
2.40.1

