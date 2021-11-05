Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47036445DF7
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 03:30:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF7E5846;
	Fri,  5 Nov 2021 03:29:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF7E5846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636079446;
	bh=ac21aepozzrw7UdoPhSBRYVAMbBIV0It+MIdMFzwgjM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=URUIY4PioJaYPrxuT06tgKkqRYxVx1TSq2Y1SYCLiFoPxnd3N4ZJOX5ACqX0gdJnc
	 3aBwImr3qpZvhuM/qAVSYbYvMFfMXV8/fI/o/KOvmaN9jTR8j1ZFIyWtKqgp1pfhmq
	 oFr6b4EGykWQHMIWiCOw1CVP3uJpW4P2BoKHzHCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C9BCF80516;
	Fri,  5 Nov 2021 03:27:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23703F8050F; Fri,  5 Nov 2021 03:27:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4268FF8026A
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 03:27:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4268FF8026A
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="231678152"
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; d="scan'208";a="231678152"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 19:27:20 -0700
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; d="scan'208";a="501786510"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 19:27:18 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 8/9] ASoC: Intel: soc-acpi: add SKU 0B29 SoundWire
 configuration
Date: Fri,  5 Nov 2021 10:26:45 +0800
Message-Id: <20211105022646.26305-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211105022646.26305-1-yung-chuan.liao@linux.intel.com>
References: <20211105022646.26305-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
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

Product audio hardware configuration is rt711 on link2,
two rt1316s on link0 and link1, rt714 on link 3.

Signed-off-by: Gongjun Song <gongjun.song@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 3440c0fa31fa..b61a778a9d26 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -74,6 +74,15 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt711_sdca_2_adr[] = {
+	{
+		.adr = 0x000230025D071101ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
 	{
 		.adr = 0x000131025D131601ull, /* unique ID is set for some reason */
@@ -101,6 +110,24 @@ static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1316_0_group2_adr[] = {
+	{
+		.adr = 0x000031025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1316-1"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1316_1_group2_adr[] = {
+	{
+		.adr = 0x000130025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1316-2"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1316_2_single_adr[] = {
 	{
 		.adr = 0x000230025D131601ull,
@@ -209,6 +236,30 @@ static const struct snd_soc_acpi_link_adr adl_sdca_3_in_1[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr adl_sdw_rt711_link2_rt1316_link01_rt714_link3[] = {
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt711_sdca_2_adr),
+		.adr_d = rt711_sdca_2_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt1316_0_group2_adr),
+		.adr_d = rt1316_0_group2_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1316_1_group2_adr),
+		.adr_d = rt1316_1_group2_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt714_3_adr),
+		.adr_d = rt714_3_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr adl_sdw_rt1316_link12_rt714_link0[] = {
 	{
 		.mask = BIT(1),
@@ -372,6 +423,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-adl-rt711-l0-rt1316-l13-rt714-l2.tplg",
 	},
+	{
+		.link_mask = 0xF, /* 4 active links required */
+		.links = adl_sdw_rt711_link2_rt1316_link01_rt714_link3,
+		.drv_name = "sof_sdw",
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-rt711-l2-rt1316-l01-rt714-l3.tplg",
+	},
 	{
 		.link_mask = 0xC, /* rt1316 on link2 & rt714 on link3 */
 		.links = adl_sdw_rt1316_link2_rt714_link3,
-- 
2.17.1

