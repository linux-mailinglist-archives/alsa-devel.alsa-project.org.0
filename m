Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB72624DD7
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 23:56:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D5D31663;
	Thu, 10 Nov 2022 23:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D5D31663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668121009;
	bh=kA0gsUDdNhGyjLzZQWVmWvgQaOpKF1Wxf0AS2wYJLpk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pLmMz+CJLtAwWRhtgLqigyD4TGjrC9dD72MLP301YCpTB9/KfTsHjxDrMtIFiZteM
	 hV5HLcw3ZIqcRy4Mm7QR4+TlfyrrMlelk5dr4Mu9zX7+KaUpwvDQH8311E316w4xrT
	 xBNVdmOPj+tFkNufqziD3TKqoeSsEzPn8ifYtpcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43F93F80559;
	Thu, 10 Nov 2022 23:55:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D224F80104; Thu, 10 Nov 2022 23:55:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9202FF80104
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 23:55:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9202FF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Z5Qsc3BP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668120911; x=1699656911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kA0gsUDdNhGyjLzZQWVmWvgQaOpKF1Wxf0AS2wYJLpk=;
 b=Z5Qsc3BP2VEqJm3Mwq0Ph3Ica0u8mB1Q3/syV3HAWxbH3yx0E7Rx1shx
 QDE+eEjizFIQPnPLtQ7K5Vs9IbxH3Gintlu7jiqIzjqbxGPZW0n4qz4gv
 j8zivm54iRl8Z+l2JsTNi9Dl2eIbjvh2U36ME2CRJrhlsAAn93ciqNyn9
 rd1j1IfB7gKg5OcglGPuKLghTXqWhDZKcBMtq8NTcVcGnSx47OpqsQb+i
 5lVMcsng/c9wN4hiXEdpMESXu0+J1jvhg5Gc4t86wBitlOfqYbodGXxhv
 ZtSFQCWtaidgmicKVMxnMCL3nocdjJIOr58XY5FJng39K0CoY8QaEDu1k A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="373588029"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="373588029"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 14:55:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="670533766"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="670533766"
Received: from tleibov-mobl.ger.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.214.199.216])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 14:55:03 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ASoC: Intel: soc-acpi: add SKU 0C10 SoundWire
 configuration
Date: Thu, 10 Nov 2022 16:54:29 -0600
Message-Id: <20221110225432.144184-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221110225432.144184-1-pierre-louis.bossart@linux.intel.com>
References: <20221110225432.144184-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Gongjun Song <gongjun.song@intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

Audio hardware configuration of SKU 0C10 product is rt714 on link0,
two rt1316s on link1 and link2

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-rpl-match.c   | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 9ccf7370157b4..371333ed8c16c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -65,6 +65,15 @@ static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
+	{
+		.adr = 0x000230025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1316-2"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
 	{
 		.adr = 0x000330025D131601ull,
@@ -74,6 +83,15 @@ static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt714_0_adr[] = {
+	{
+		.adr = 0x000030025D071401ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt714"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt714_2_adr[] = {
 	{
 		.adr = 0x000230025D071401ull,
@@ -107,6 +125,25 @@ static const struct snd_soc_acpi_link_adr rpl_sdca_3_in_1[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr rpl_sdw_rt1316_link12_rt714_link0[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1316_1_group1_adr),
+		.adr_d = rt1316_1_group1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1316_2_group1_adr),
+		.adr_d = rt1316_2_group1_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt714_0_adr),
+		.adr_d = rt714_0_adr,
+	},
+	{}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 	{},
 };
@@ -120,6 +157,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-rpl-rt711-l0-rt1316-l13-rt714-l2.tplg",
 	},
+	{
+		.link_mask = 0x7, /* rt714 on link0 & two rt1316s on link1 and link2 */
+		.links = rpl_sdw_rt1316_link12_rt714_link0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-rpl-rt1316-l12-rt714-l0.tplg",
+	},
 	{
 		.link_mask = 0x1, /* link0 required */
 		.links = rpl_rvp,
-- 
2.34.1

