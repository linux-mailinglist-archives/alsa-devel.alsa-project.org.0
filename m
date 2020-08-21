Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FA724E1A6
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 22:00:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0497E1676;
	Fri, 21 Aug 2020 21:59:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0497E1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598040031;
	bh=D2op7XL64H8x27+yvp0Q7BYmSbdw6w3uJvDFw5R6CpU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J5O1cj56TGAGV+KkEeEOlgUGAHIFNBjTnQAuctdV36hwqX33A5wx8nyI2mxMfglHM
	 nv4gW6975es1/0WVYRq1dMT19dAKVfjPBX7gPaV3fueM4JAC7W2n3zdeVNjf+P4bWo
	 HXGwQsxA4OuCfkwiR62MWwdRXot0gY15MT+at/WA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D9C2F80216;
	Fri, 21 Aug 2020 21:56:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87F15F802EA; Fri, 21 Aug 2020 21:56:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81E73F800C0
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 21:56:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81E73F800C0
IronPort-SDR: q1bMj5zJGle9GAO9SxC7STSbiphROdFWHW+v9jGDFfVKZ3ID/vMDwKlhVBsQb/yOR2Wg13ylPo
 x+9VREDML54Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="217158543"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="217158543"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:16 -0700
IronPort-SDR: mnzD7vXZoFENCXWj13K/Jo5ux4rk1MvpUP+rVKeRFgCow7IYzZzidyMBSPMzWk8naASdu51M0d
 GODq2QMIN/QA==
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="279002400"
Received: from pahnn-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.176.176])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/14] ASoC: Intel: soc-acpi: mirror CML and TGL configurations
Date: Fri, 21 Aug 2020 14:55:51 -0500
Message-Id: <20200821195603.215535-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vinod.koul@intel.com, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some TGL devices use the same audio hardware as on CML platforms, with
RT711 on link0, RT1308 on link1 and optionally link2, and RT715 on
link 3.

To clarify configurations, the rt1308 configurations are split between
single amp on link1 and dual amps on link1. The case with two amps on
different links is already identified with the group1 attribute.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-cml-match.c   |   6 +-
 .../intel/common/soc-acpi-intel-tgl-match.c   | 100 +++++++++++++++++-
 2 files changed, 100 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 51535cd60a0a..8ac01a2d5886 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -118,7 +118,7 @@ static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	}
 };
 
-static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
+static const struct snd_soc_acpi_adr_device rt1308_1_single_adr[] = {
 	{
 		.adr = 0x000120025D130800,
 		.num_endpoints = 1,
@@ -182,8 +182,8 @@ static const struct snd_soc_acpi_link_adr cml_3_in_1_mono_amp[] = {
 	},
 	{
 		.mask = BIT(1),
-		.num_adr = ARRAY_SIZE(rt1308_1_adr),
-		.adr_d = rt1308_1_adr,
+		.num_adr = ARRAY_SIZE(rt1308_1_single_adr),
+		.adr_d = rt1308_1_single_adr,
 	},
 	{
 		.mask = BIT(3),
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 472f58ddda1f..aabb49617d37 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -43,7 +43,7 @@ static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	}
 };
 
-static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
+static const struct snd_soc_acpi_adr_device rt1308_1_dual_adr[] = {
 	{
 		.adr = 0x000120025D130800,
 		.num_endpoints = 1,
@@ -56,6 +56,38 @@ static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1308_1_single_adr[] = {
+	{
+		.adr = 0x000120025D130800,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
+	{
+		.adr = 0x000120025D130800,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
+	{
+		.adr = 0x000220025D130800,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
+	{
+		.adr = 0x000320025D071500,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
+};
+
 static const struct snd_soc_acpi_adr_device mx8373_1_adr[] = {
 	{
 		.adr = 0x000123019F837300,
@@ -94,8 +126,8 @@ static const struct snd_soc_acpi_link_adr tgl_rvp[] = {
 	},
 	{
 		.mask = BIT(1),
-		.num_adr = ARRAY_SIZE(rt1308_1_adr),
-		.adr_d = rt1308_1_adr,
+		.num_adr = ARRAY_SIZE(rt1308_1_dual_adr),
+		.adr_d = rt1308_1_dual_adr,
 	},
 	{}
 };
@@ -114,6 +146,49 @@ static const struct snd_soc_acpi_link_adr tgl_chromebook_base[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr tgl_3_in_1_default[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_0_adr),
+		.adr_d = rt711_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1308_1_group1_adr),
+		.adr_d = rt1308_1_group1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1308_2_group1_adr),
+		.adr_d = rt1308_2_group1_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt715_3_adr),
+		.adr_d = rt715_3_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr tgl_3_in_1_mono_amp[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_0_adr),
+		.adr_d = rt711_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1308_1_single_adr),
+		.adr_d = rt1308_1_single_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt715_3_adr),
+		.adr_d = rt715_3_adr,
+	},
+	{}
+};
+
 static struct snd_soc_acpi_codecs tgl_max98373_amp = {
 	.num_codecs = 1,
 	.codecs = {"MX98373"}
@@ -150,6 +225,25 @@ EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_machines);
 
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
+	{
+		.link_mask = 0xF, /* 4 active links required */
+		.links = tgl_3_in_1_default,
+		.drv_name = "sof_sdw",
+		.sof_fw_filename = "sof-tgl.ri",
+		.sof_tplg_filename = "sof-tgl-rt711-rt1308-rt715.tplg",
+	},
+	{
+		/*
+		 * link_mask should be 0xB, but all links are enabled by BIOS.
+		 * This entry will be selected if there is no rt1308 exposed
+		 * on link2 since it will fail to match the above entry.
+		 */
+		.link_mask = 0xF,
+		.links = tgl_3_in_1_mono_amp,
+		.drv_name = "sof_sdw",
+		.sof_fw_filename = "sof-tgl.ri",
+		.sof_tplg_filename = "sof-tgl-rt711-rt1308-mono-rt715.tplg",
+	},
 	{
 		.link_mask = 0x3, /* rt711 on link 0 and 2 rt1308s on link 1 */
 		.links = tgl_rvp,
-- 
2.25.1

