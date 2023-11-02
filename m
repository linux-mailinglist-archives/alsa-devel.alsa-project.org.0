Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F002E7DF864
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Nov 2023 18:10:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1398C822;
	Thu,  2 Nov 2023 18:10:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1398C822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698945055;
	bh=CXIPzvC3FUKsfm3RbFiCNlRA6j0Y9/yLAH2lP0YZf/M=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=B2MxMAjv75VqoCAP1S4re+vi9k8Gnrs7RI/jQ4yA0nDx8uU7e5KfC6YzgSJOpPB5r
	 zsAb9ciisMLX5AHNKYLsOpK+H6f+B188HfgHiPbff06E6eT8HTyQptte1aIC5x3TTN
	 rIUmh4b1pgkGLPrTDfoIZIHXjI+81hw6GYGyusos=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40818F8020D; Thu,  2 Nov 2023 18:10:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7823F8020D;
	Thu,  2 Nov 2023 18:10:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9456DF80290; Thu,  2 Nov 2023 18:09:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F30BFF8003C
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 18:09:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F30BFF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LiTKNYjx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698944990; x=1730480990;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CXIPzvC3FUKsfm3RbFiCNlRA6j0Y9/yLAH2lP0YZf/M=;
  b=LiTKNYjxfIa92J/hLEhpUPx74tE7xt4oShy/0kNOzOQK12aa4RaMDke9
   k5p5idv/ld1XWzfo6rQsI9Sk4UqOV1fLGe+rG1bmYnT96k1419ddoZc/R
   bYNRlVcXMv4bscyXjNy0aRX4a9zQx/0okK45Uztk1LEFM76M1lawXhvej
   hMAQQbNibwyGwiK7VgnesMujwpMtkixbFv1lUtK/rHH6Qvtq6vQ7R3ECB
   xSu1ExiypucYFhZU+pPqAMd7QYjnVMp55cWHfygSHvjjHD769+U1u1rIE
   +XzXZqyleTOMWGZKrV7pAWDqH9bANTTTJxSUqiCUXnaV0GCOmegSvFUL6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="455245388"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200";
   d="scan'208";a="455245388"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 10:09:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200";
   d="scan'208";a="2613430"
Received: from macchian-builder.itwn.intel.com ([10.5.253.188])
  by fmviesa002.fm.intel.com with ESMTP; 02 Nov 2023 10:09:42 -0700
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
Subject: [PATCH v2] ASoC: Intel: sof_rt5682: add mtl_rt5650 support
Date: Thu,  2 Nov 2023 12:48:44 -0400
Message-Id: <20231102164844.6930-1-mac.chiang@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N47RRHO4G3WBKYLDLA6UTCEGTP4SZ7QF
X-Message-ID-Hash: N47RRHO4G3WBKYLDLA6UTCEGTP4SZ7QF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N47RRHO4G3WBKYLDLA6UTCEGTP4SZ7QF/>
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
pick up from Link: https://github.com/thesofproject/linux/pull/4661
for Chrome MTL projects.

Changes v2:
  - regen format patch due to v1 from github remote
---
 sound/soc/intel/boards/sof_rt5682.c               |  9 +++++++++
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 06ad15af46de..9723479f43da 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1147,6 +1147,15 @@ static const struct platform_device_id board_ids[] = {
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
index 301b8142d554..af4224bff718 100644
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

