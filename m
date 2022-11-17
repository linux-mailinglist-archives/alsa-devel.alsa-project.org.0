Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CAD62CF8E
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 01:27:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2B616C5;
	Thu, 17 Nov 2022 01:26:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2B616C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668644857;
	bh=qq1gVsOvuS3oOsVibSg3NJljK9tW6QdM5ju4uaikyVs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jXO2xOzNrLAZ2QwvltwN9W1jp6ZTtIkwrpcwq2fskJJrY/GvCLimxW2HnHdmMSCx8
	 MUCoCAYhmdtSG4iA4jq0khamB0auzgY9OPfrT0OFoYQA0mtxa1aof+Np11CudBoTcV
	 0DrVhzag1j37Tg1Hhnkoo5W5PoOL2Tmcnzn1Pe6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2715AF80568;
	Thu, 17 Nov 2022 01:25:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86710F80567; Thu, 17 Nov 2022 01:25:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC19BF804A9
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 01:25:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC19BF804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OTFgqm1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668644744; x=1700180744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qq1gVsOvuS3oOsVibSg3NJljK9tW6QdM5ju4uaikyVs=;
 b=OTFgqm1pnBwHzm7aptKjfx5RZZEBzCOgSLpv7aQyICmqqBUULlp43HL9
 LM4WKD8GfIKUbGn0qImTY/TBjVQi+gAw9AG/EoD92Z+/+MxjPAgZArQxs
 uz8LDuBe2lr6kX8xaZiTvbvWA2AaPy1aTpuErV8nIK5wTVfbusC23JpWJ
 Yk/gokYDmq42OxweJSxtEPZR+r00hhnZ3V+NWaHkHEL6ymV4ZPw3zSePY
 p+je9E0S6Jk4S8qUMlwl9CytfgswdLox+a3E2gT+ShinirDGrIX7ag656
 t+6axjA5sdCXGPXdKD2OOQHraGMubi+bXV8Q0KO0qVkAcQbk5JcYpQhaJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="314523573"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="314523573"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 16:25:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="764535193"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; d="scan'208";a="764535193"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2022 16:25:38 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 3/3] ASoC: Intel: soc-acpi: add SKU 0C11 SoundWire
 configuration
Date: Thu, 17 Nov 2022 08:27:58 +0800
Message-Id: <20221117002758.496211-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221117002758.496211-1-yung-chuan.liao@linux.intel.com>
References: <20221117002758.496211-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, vkoul@kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
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

From: Gongjun Song <gongjun.song@intel.com>

Audio hardware configuration of SKU 0C11 product is rt711 on link0,
two rt1318s on link1 and link2, rt714 on link3

Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-rpl-match.c   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 7c2e94dcf8fc..3c5229f41bb0 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -110,6 +110,24 @@ static const struct snd_soc_acpi_adr_device rt1316_1_group2_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1318_1_group1_adr[] = {
+	{
+		.adr = 0x000131025D131801ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1318-1"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1318_2_group1_adr[] = {
+	{
+		.adr = 0x000230025D131801ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1318-2"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt714_0_adr[] = {
 	{
 		.adr = 0x000030025D071401ull,
@@ -185,6 +203,30 @@ static const struct snd_soc_acpi_link_adr rpl_sdw_rt711_link2_rt1316_link01_rt71
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr rpl_sdw_rt711_link0_rt1318_link12_rt714_link3[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1318_1_group1_adr),
+		.adr_d = rt1318_1_group1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1318_2_group1_adr),
+		.adr_d = rt1318_2_group1_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt714_3_adr),
+		.adr_d = rt714_3_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr rpl_sdw_rt1316_link12_rt714_link0[] = {
 	{
 		.mask = BIT(1),
@@ -223,6 +265,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-rpl-rt711-l2-rt1316-l01-rt714-l3.tplg",
 	},
+	{
+		.link_mask = 0xF, /* 4 active links required */
+		.links = rpl_sdw_rt711_link0_rt1318_link12_rt714_link3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-rpl-rt711-l0-rt1318-l12-rt714-l3.tplg",
+	},
 	{
 		.link_mask = 0x7, /* rt714 on link0 & two rt1316s on link1 and link2 */
 		.links = rpl_sdw_rt1316_link12_rt714_link0,
-- 
2.25.1

