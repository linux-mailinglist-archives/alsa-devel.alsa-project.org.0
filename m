Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 244EB7327DA
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 08:49:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BE3D843;
	Fri, 16 Jun 2023 08:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BE3D843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686898185;
	bh=iWnJbgwh0T9lZF52oJFx/PfM6eCdscB/2fVbEaWlmmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uVMDG4/WVr22gzT+GV4AJztXpOWDlCSvZLtobFCSIa9YfptKFHGCjFro0HuGPvNGb
	 00hwcZZGIyN2jiNb/mt1KDHfWO4f6zbcMPIylrd6cKeDg3np2LYmG8iqtYjJx1rBG+
	 2zdJLdTWaSiaXzhrP2SZtzl/F/p5kti4kfh+Mv+A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B75BFF80246; Fri, 16 Jun 2023 08:48:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE7D6F80548;
	Fri, 16 Jun 2023 08:48:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9765F80149; Fri, 16 Jun 2023 08:42:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A72E3F80130
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 08:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A72E3F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gwLLhaaT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686897772; x=1718433772;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iWnJbgwh0T9lZF52oJFx/PfM6eCdscB/2fVbEaWlmmc=;
  b=gwLLhaaTgjv5JHqlJtJtAnCzfiIFwLVDeucwvylxRPyIA+6hd13YQIRJ
   ae4A/WK8Pvz3QjxFiUMjWGFGfitd7Y3tBmyNaBvp3VgWCNnPKkNz98gFX
   s5dmgMzR3SvwL+b6CQUJcRNxxCZxtfXIVi+Wm+OFTvR35Y7NH4EYpufDL
   X24qRw/Oz04tIroidKvuoORqjXECXVpZdrcFk6Kfp3DzUiR2Lb83qH+fM
   PSalJ8tS+bicz/ZlPh+l0UWgvsKVIqLlPbAGL+4WYIOif+uoUlC7sAMJR
   ZVzzBI2sus/9HvquAMO+2Wk1obHyXPwhPDfhylXbHR540z1hR7SHq2LAk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="358017079"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400";
   d="scan'208";a="358017079"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 23:42:14 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="746062653"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400";
   d="scan'208";a="746062653"
Received: from macchian-builder.itwn.intel.com ([10.5.253.188])
  by orsmga001.jf.intel.com with ESMTP; 15 Jun 2023 23:42:12 -0700
From: Mac Chiang <mac.chiang@intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	htcheong@chromium.org,
	zhourui@huaqin.corp-partner.google.com,
	bard.liao@intel.com,
	mac.chiang@intel.com
Subject: [PATCH v2 2/2] ASoC: Intel: sof_rt5682: Add mtl support RT1019P
 speaker
Date: Fri, 16 Jun 2023 02:36:17 -0400
Message-Id: <20230616063617.25900-2-mac.chiang@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230616063617.25900-1-mac.chiang@intel.com>
References: <20230616063617.25900-1-mac.chiang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VZSO23RZNGKM5245HG5CIHGQQ7OGCG5C
X-Message-ID-Hash: VZSO23RZNGKM5245HG5CIHGQQ7OGCG5C
X-MailFrom: mac.chiang@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VZSO23RZNGKM5245HG5CIHGQQ7OGCG5C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch support below hardware configuration:

SSP2: 10EC5682/RTL5682 codec
SSP0: RTL1019 amplifier

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
---
 sound/soc/intel/boards/sof_rt5682.c           | 23 +++++++++++++++++++
 .../intel/common/soc-acpi-intel-mtl-match.c   | 12 ++++++++++
 2 files changed, 35 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index be34d7595537..7c034d671cf3 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -239,6 +239,20 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_SSP_BT_OFFLOAD_PRESENT
 					),
 	},
+	{
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Rex"),
+			DMI_MATCH(DMI_OEM_STRING, "AUDIO-ALC1019_ALC5682I_I2S"),
+		},
+		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(2) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT1019_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(0) |
+					SOF_RT5682_NUM_HDMIDEV(3)
+					),
+	},
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
@@ -1155,6 +1169,15 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(1) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
+	{
+		.name = "mtl_rt1019_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(2) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT1019_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(0) |
+					SOF_RT5682_NUM_HDMIDEV(3)),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 3d5cf8867926..ed9821adc1d9 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -20,6 +20,11 @@ static const struct snd_soc_acpi_codecs mtl_max98360a_amp = {
 	.codecs = {"MX98360A"}
 };
 
+static const struct snd_soc_acpi_codecs mtl_rt1019p_amp = {
+	.num_codecs = 1,
+	.codecs = {"RTL1019"}
+};
+
 static const struct snd_soc_acpi_codecs mtl_rt5682_rt5682s_hp = {
 	.num_codecs = 2,
 	.codecs = {"10EC5682", "RTL5682"},
@@ -40,6 +45,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 		.quirk_data = &mtl_max98360a_amp,
 		.sof_tplg_filename = "sof-mtl-max98360a-rt5682.tplg",
 	},
+	{
+		.comp_ids = &mtl_rt5682_rt5682s_hp,
+		.drv_name = "mtl_rt1019_rt5682",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &mtl_rt1019p_amp,
+		.sof_tplg_filename = "sof-mtl-rt1019-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_mtl_machines);
-- 
2.20.1

