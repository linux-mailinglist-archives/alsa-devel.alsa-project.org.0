Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AE4361170
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 19:52:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF08A167B;
	Thu, 15 Apr 2021 19:51:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF08A167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618509137;
	bh=8Y3OOnD3fbMyH7/x7lZ6H58a0nEWLPfIbeOTl+EV6s0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SLHyEIlmxAJ8mUrfXWPd/c4WFb7r+tYcNkI5TV5wAzDe2A8I0JG+wf3T7ONKF+7So
	 7pkVH+SHUW76a3UIYSCru0XG9r4vvqZdqYzZnZ7o1wsqH6mbkygpQbOLTgzzQE8GJJ
	 cw+FQBSGQoVmbcmatoTM/31F27IbDeZgpaoc+8jU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96913F80423;
	Thu, 15 Apr 2021 19:50:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E0FFF8032D; Thu, 15 Apr 2021 19:50:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D513F800FF
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 19:50:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D513F800FF
IronPort-SDR: l/3Wn/FCYlTgAsMxw98/O8FH5YdAl9P2Iv71ugqhIUsk6EBpsBX06ifkmVHzMHI8Y530nWoYd4
 3dFcAPq7E2Mg==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="174400788"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="174400788"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 10:50:34 -0700
IronPort-SDR: IbL44RDMfam/AgDWKDN6HIlMBJSHSXiixGKDcIO9oxdhyQ2d0sNgTHb0Qmwt7Vmdy9lc9ywcJA
 7ep0wOX102nQ==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="382804640"
Received: from lesterhu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.33.4])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 10:50:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/9] ASoC: Intel: soc-acpi: add ADL SoundWire base
 configurations
Date: Thu, 15 Apr 2021 12:50:05 -0500
Message-Id: <20210415175013.192862-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
References: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Libin Yang <libin.yang@intel.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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

Add configurations ported over from TGL.

The topology names need to include link information given all the
hardware permutations.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Libin Yang <libin.yang@intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 185 ++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 0aca340ebc25..d935745322b6 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -15,6 +15,20 @@ static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.group_id = 0,
 };
 
+static const struct snd_soc_acpi_endpoint spk_l_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 0,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 1,
+	.group_id = 1,
+};
+
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
 		.adr = 0x000020025D071100,
@@ -24,6 +38,159 @@ static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
+	{
+		.adr = 0x000120025D130800,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1308-1"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
+	{
+		.adr = 0x000220025D130800,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1308-2"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
+	{
+		.adr = 0x000320025D071500,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt715"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
+	{
+		.adr = 0x000030025D071101,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
+	{
+		.adr = 0x000131025D131601, /* unique ID is set for some reason */
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1316-1"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
+	{
+		.adr = 0x000230025D131601,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1316-2"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
+	{
+		.adr = 0x000330025D131601,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1316-2"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt714_2_adr[] = {
+	{
+		.adr = 0x000230025D071401,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt714"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt714_3_adr[] = {
+	{
+		.adr = 0x000330025D071401,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt714"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr adl_default[] = {
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
+static const struct snd_soc_acpi_link_adr adl_sdca_default[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
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
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt714_3_adr),
+		.adr_d = rt714_3_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr adl_sdca_3_in_1[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1316_1_group1_adr),
+		.adr_d = rt1316_1_group1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt714_2_adr),
+		.adr_d = rt714_2_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1316_3_group1_adr),
+		.adr_d = rt1316_3_group1_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr adl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -40,6 +207,24 @@ EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_machines);
 
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
+	{
+		.link_mask = 0xF, /* 4 active links required */
+		.links = adl_default,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-adl-rt711-l0-rt1308-l12-rt715-l3.tplg",
+	},
+	{
+		.link_mask = 0xF, /* 4 active links required */
+		.links = adl_sdca_default,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-adl-rt711-l0-rt1316-l12-rt714-l3.tplg",
+	},
+	{
+		.link_mask = 0xF, /* 4 active links required */
+		.links = adl_sdca_3_in_1,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-adl-rt711-l0-rt1316-l13-rt714-l2.tplg",
+	},
 	{
 		.link_mask = 0x1, /* link0 required */
 		.links = adl_rvp,
-- 
2.25.1

