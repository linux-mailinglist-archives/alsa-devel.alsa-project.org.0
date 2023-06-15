Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F12AB731807
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 14:01:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B0BE6C1;
	Thu, 15 Jun 2023 14:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B0BE6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686830504;
	bh=iWnJbgwh0T9lZF52oJFx/PfM6eCdscB/2fVbEaWlmmc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=imlZAqgP142xQSDrFjSCYv9a6fd/HdMgpxIWjzxV6tMj+fAtJG4P1qqpL4hHj2iiH
	 3K+rsqlNitP5q0iagyrDiV3XucG+KmaZSL5Rzp3/nkQ7COCxmJPTZloZ9VkrgtKZ1V
	 oc/jELvLbIZAhmIbf7c/OCOyNK6MDTjEshtF13xA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9288F8055A; Thu, 15 Jun 2023 14:00:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74C97F80548;
	Thu, 15 Jun 2023 14:00:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 216E2F80149; Thu, 15 Jun 2023 13:59:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F2DDF800BA
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 13:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F2DDF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KtbYdIsd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686830391; x=1718366391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iWnJbgwh0T9lZF52oJFx/PfM6eCdscB/2fVbEaWlmmc=;
  b=KtbYdIsdrECDbTMLqgLVC/Y3GKFgWPC3eIYK3WBYiu0F9ys3EEt66aTR
   A5fES7MXhjRj3IU9A1DXxCzwJPl3GWa8b1u9GrTKIH2VWIpZlbn8FFeRG
   kMS8jG1uJ3Ow+Nknxx6demdSj9kGTWuY1dSbcOlTVgVDJ+x2B8GC0HOYl
   zbbLrKh8zaK7UnbmA+qq7v2nQxCWsQl5o/xrP8awx4nxiWq9X0G1nh045
   scY6cAiVJ+zy0yt2AQOdAtn3BndDFwR3zpQpoCGy7Kcobq29qcyN+ccfc
   ikPcqSzs/QQgCXIH3zgo3ef9qWYB4bPf1gxLE7L6NkYkFeIMV6NmM0tK5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="338517471"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400";
   d="scan'208";a="338517471"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 04:59:47 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="745505356"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400";
   d="scan'208";a="745505356"
Received: from macchian-builder.itwn.intel.com ([10.5.253.188])
  by orsmga001.jf.intel.com with ESMTP; 15 Jun 2023 04:59:45 -0700
From: Mac Chiang <mac.chiang@intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	mac.chiang@intel.com
Subject: [PATCH 2/2] ASoC: Intel: sof_rt5682: Add mtl support RT1019P speaker
Date: Thu, 15 Jun 2023 07:53:49 -0400
Message-Id: <20230615115349.21993-2-mac.chiang@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230615115349.21993-1-mac.chiang@intel.com>
References: <20230615115349.21993-1-mac.chiang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B6T7QJYSQWMYLAMGSGWS325ASPNMBMYN
X-Message-ID-Hash: B6T7QJYSQWMYLAMGSGWS325ASPNMBMYN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6T7QJYSQWMYLAMGSGWS325ASPNMBMYN/>
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

