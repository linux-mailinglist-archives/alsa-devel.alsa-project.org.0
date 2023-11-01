Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB897DDC50
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Nov 2023 06:30:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E818A6C1;
	Wed,  1 Nov 2023 06:29:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E818A6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698816614;
	bh=YmC6Jde5Ofs/BpNYXuALQRSi/ah7hm4BxUIaNg/1/nY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=df0LfzEtAHMcnRiEX8uAm7kXn1tjxIyj8PU2xw3dcBHCQlkge08VIMo6rMJCivfi6
	 5S3J70mX1e5RHOy9OO5Je1TT5RSioQACJAhG6c0TopyiCjfufpVxC1ClSE9BJXQiBi
	 1Y8j2Er/4vUe/jTZJg0gvylr904y/r9RBNKxk86s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05540F80431; Wed,  1 Nov 2023 06:29:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19D19F8016D;
	Wed,  1 Nov 2023 06:29:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA783F8020D; Wed,  1 Nov 2023 06:27:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EED07F80152
	for <alsa-devel@alsa-project.org>; Wed,  1 Nov 2023 06:27:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EED07F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c8u7MQeY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698816454; x=1730352454;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YmC6Jde5Ofs/BpNYXuALQRSi/ah7hm4BxUIaNg/1/nY=;
  b=c8u7MQeYQ4EZgKGkI+bXSr2caV1wQ4o4Odj5HI7MZHIxkyqA3tAYzvDh
   xbmC3IZGLyafe6O1CtX5P1UInbQhv9PWTlLTmLJXuwsCujis09XDOr1XM
   F+wN5SpbnLU1F0T5Y0o2fK6Y6wQegWLCgkQAt1iLaLnmY1F83eo6X/Qt8
   ZXVuewHqU37LAVzsi5goh29YUjdOdEhZcyP9pOzyeauFatTsZYjhG3oly
   MqFNxPuCIp8a1E8Lj1GrlOf+A3biqgL2V8S2crQ3QMqmKVCk+ElChYyx+
   B3QosGOZk9OUW4adcEdeZtHxYyXbSJWOqKA2CcCT/dBaqsPtN2DoltQ9s
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1281614"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200";
   d="scan'208";a="1281614"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 22:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="831258341"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200";
   d="scan'208";a="831258341"
Received: from macchian-builder.itwn.intel.com ([10.5.253.188])
  by fmsmga004.fm.intel.com with ESMTP; 31 Oct 2023 22:27:25 -0700
From: Mac Chiang <mac.chiang@intel.com>
To: alsa-devel@alsa-project.org
Cc: cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	mac.chiang@intel.com
Subject: [PATCH] ASoC: Intel: sof_rt5682: add mtl_rt5650 support
Date: Wed,  1 Nov 2023 01:06:25 -0400
Message-Id: <20231101050625.15747-1-mac.chiang@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LMG44O2QA6B6J67GYZ6FYLWDL2SHW3SO
X-Message-ID-Hash: LMG44O2QA6B6J67GYZ6FYLWDL2SHW3SO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LMG44O2QA6B6J67GYZ6FYLWDL2SHW3SO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RT5650 is I2S codec integrated with HP and SPK.
The HW board connects SoC I2S to RT5650 codec as below:

I2S0: ALC5650 aif1 for Speaker
I2S2: ALC5650 aif2 for Headphone

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               |  9 +++++++++
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 8b7461d47308..8adc82892e2c 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1129,6 +1129,15 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(0) |
 					SOF_RT5682_NUM_HDMIDEV(3)),
 	},
+	{
+		.name = "mtl_rt5650",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(2) |
+					SOF_RT5682_SSP_AMP(0) |
+					SOF_RT5682_NUM_HDMIDEV(3) |
+					SOF_BT_OFFLOAD_SSP(1) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 61f2b2645496..2035f561ca50 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -40,6 +40,11 @@ static const struct snd_soc_acpi_codecs mtl_lt6911_hdmi = {
 	.codecs = {"INTC10B0"}
 };
 
+static const struct snd_soc_acpi_codecs mtl_rt5650_amp = {
+	.num_codecs = 1,
+	.codecs = {"10EC5650"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 	{
 		.comp_ids = &mtl_rt5682_rt5682s_hp,
@@ -77,6 +82,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
+	{
+		.id = "10EC5650",
+		.drv_name = "mtl_rt5650",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &mtl_rt5650_amp,
+		.sof_tplg_filename = "sof-mtl-rt5650.tplg",
+	},
 	/* place amp-only boards in the end of table */
 	{
 		.id = "INTC10B0",
-- 
2.20.1

