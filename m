Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 315DD7E9C0B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 13:21:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1799E84D;
	Mon, 13 Nov 2023 13:21:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1799E84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699878112;
	bh=r6NiGCRXME4/2Qr1nMwylX/MGOF9zGJYOZ6fLQgaWLY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CtLDusoVP2SQnzsn96nV41CVUAA7dqBktV1IX+iDiUZVVsT2WyQ90I7LbOGcGSbTL
	 dgEXzAsYLlwGIqzq1PMdHG+fF/gocT/HgvO+i9sB1VvcpBgn2zkveox8OmVpnPVn/h
	 u7dztrHOmBMlpY7KtjX/9aROr2cffA+3FbSVnmPs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BDC5F802E8; Mon, 13 Nov 2023 13:20:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99F7EF8016E;
	Mon, 13 Nov 2023 13:20:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14302F801D5; Mon, 13 Nov 2023 13:20:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22DF0F800ED
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 13:20:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22DF0F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bWBk4K2k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699878019; x=1731414019;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r6NiGCRXME4/2Qr1nMwylX/MGOF9zGJYOZ6fLQgaWLY=;
  b=bWBk4K2kBnpMs4eKdX6/bFMo71OKLXiaYaI57jF3P5gQL179NZvmZS7p
   1XwWkSgGrPmt4mDpBYRvDNkX1PkHeGrf32FdwaeDdCG/LlZAbLsmUtcaj
   7M1ZhDIgLur36rYZ9Oo50qzpiZKmHfxhLgrk2rfJ9HiRx37lDo/xOH+G0
   n22goUkQF6ZSqSZxa86bIh9kAlOSuhLIp6KUlhTCsHiaUcN4LneUemOOw
   EFR9/ooFts+Lf8PtvrqJzq6VPBd43k7UV4PNoyn8UPhx7NwwVZweJQA3g
   MI7CY9LXxXgS+WeDTcVPI3iGqMqe5/8265mm1t40hLlTe7BqUcKNvLODg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="369762151"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200";
   d="scan'208";a="369762151"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 04:20:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="1095736584"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200";
   d="scan'208";a="1095736584"
Received: from macchian-builder.itwn.intel.com ([10.5.253.188])
  by fmsmga005.fm.intel.com with ESMTP; 13 Nov 2023 04:20:11 -0800
From: Mac Chiang <mac.chiang@intel.com>
To: alsa-devel@alsa-project.org
Cc: cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	mac.chiang@intel.com
Subject: [RESEND,v3] ASoC: Intel: sof_rt5682: add mtl_rt5650 support
Date: Mon, 13 Nov 2023 06:59:07 -0500
Message-Id: <20231113115907.18539-1-mac.chiang@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7EHRTX52IYWVGN4RUCEH36DEDAKLDY4V
X-Message-ID-Hash: 7EHRTX52IYWVGN4RUCEH36DEDAKLDY4V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7EHRTX52IYWVGN4RUCEH36DEDAKLDY4V/>
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

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
---
Hi Pierre, I resend the patch for your review and cc maintainers. Thanks.
Pick up for Chrome MTL projects support.

Changes v3:
  - missing Reviewed-by, add it.
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

