Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EA224E1B1
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 22:01:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 807E01685;
	Fri, 21 Aug 2020 22:00:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 807E01685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598040087;
	bh=8BkPXc6iAkZZ0gENS+9OGh057J9Ni4GbAl8o2OwEwQM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BrXJfmrGifdE4al4WQ2tN7r8DxdLhvyO7N0UrWPF1/+i2ZzciMbiH5sV0Ae8/xHGd
	 5lr4mDY7CnTnXPabeXRH7+Qtfk4GlOmehUxAXC+FzDcMzxFPeJ4G9eI9PvMU7nvP1W
	 v0F1sI5GBDlnEFY97ejHTtrbS7rmlNY+5Lm1i4O0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0251DF802E1;
	Fri, 21 Aug 2020 21:56:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8D9FF80218; Fri, 21 Aug 2020 21:56:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59CDEF80218
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 21:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59CDEF80218
IronPort-SDR: 3WBAy0RGUgPlX5G2DnjOYD2rOU+5CWhTL6ekZRRyCFf/KxgnoVK/liovG2i2fGXRfY9RLQ4ueo
 ajbeSk5IWmAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="217158548"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="217158548"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:17 -0700
IronPort-SDR: aB9ekcmJnjJXoOuzhx3xtW4FLAkOHcsscwiFRQ6HH44mEtXPDPZF6UkZ1sTraqH6ixSKExdiW3
 uZVuFf1LPWFg==
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="279002404"
Received: from pahnn-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.176.176])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/14] ASoC: Intel: soc-acpi: add support for SDCA boards
Date: Fri, 21 Aug 2020 14:55:52 -0500
Message-Id: <20200821195603.215535-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jaska Uimonen <jaska.uimonen@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vinod.koul@intel.com,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
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

The description and board layout is similar to previous ones for
CometLake and TigerLake, except for a bump to SoundWire 1.2 and
updates to part numbers to reflect the SDCA (SoundWire Device Class
for Audio) hardware support.

Note that one of the RT1316 amplifiers uses a non-zero UniqueID which
is not required and will be ignored.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Jaska Uimonen <jaska.uimonen@intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-cml-match.c   | 63 +++++++++++++++++++
 .../intel/common/soc-acpi-intel-tgl-match.c   | 63 +++++++++++++++++++
 2 files changed, 126 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 8ac01a2d5886..ec01884ef93d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -150,6 +150,38 @@ static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
+	{
+		.adr = 0x000030025D071101,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
+	{
+		.adr = 0x000131025D131601, /* unique ID is set for some reason */
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
+	{
+		.adr = 0x000230025D131601,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt714_3_adr[] = {
+	{
+		.adr = 0x000330025D071401,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
+};
+
 static const struct snd_soc_acpi_link_adr cml_3_in_1_default[] = {
 	{
 		.mask = BIT(0),
@@ -193,6 +225,30 @@ static const struct snd_soc_acpi_link_adr cml_3_in_1_mono_amp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr cml_3_in_1_sdca[] = {
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
 struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_sdw_machines[] = {
 	{
 		.link_mask = 0xF, /* 4 active links required */
@@ -201,6 +257,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_sdw_machines[] = {
 		.sof_fw_filename = "sof-cml.ri",
 		.sof_tplg_filename = "sof-cml-rt711-rt1308-rt715.tplg",
 	},
+	{
+		.link_mask = 0xF, /* 4 active links required */
+		.links = cml_3_in_1_sdca,
+		.drv_name = "sof_sdw",
+		.sof_fw_filename = "sof-cml.ri",
+		.sof_tplg_filename = "sof-cml-rt711-rt1316-rt714.tplg",
+	},
 	{
 		/*
 		 * link_mask should be 0xB, but all links are enabled by BIOS.
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index aabb49617d37..6816847bee40 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -109,6 +109,38 @@ static const struct snd_soc_acpi_adr_device rt5682_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
+	{
+		.adr = 0x000030025D071101,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
+	{
+		.adr = 0x000131025D131601, /* unique ID is set for some reason */
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
+	{
+		.adr = 0x000230025D131601,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt714_3_adr[] = {
+	{
+		.adr = 0x000330025D071401,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
+};
+
 static const struct snd_soc_acpi_link_adr tgl_i2s_rt1308[] = {
 	{
 		.mask = BIT(0),
@@ -189,6 +221,30 @@ static const struct snd_soc_acpi_link_adr tgl_3_in_1_mono_amp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr tgl_3_in_1_sdca[] = {
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
 static struct snd_soc_acpi_codecs tgl_max98373_amp = {
 	.num_codecs = 1,
 	.codecs = {"MX98373"}
@@ -244,6 +300,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 		.sof_fw_filename = "sof-tgl.ri",
 		.sof_tplg_filename = "sof-tgl-rt711-rt1308-mono-rt715.tplg",
 	},
+	{
+		.link_mask = 0xF, /* 4 active links required */
+		.links = tgl_3_in_1_sdca,
+		.drv_name = "sof_sdw",
+		.sof_fw_filename = "sof-tgl.ri",
+		.sof_tplg_filename = "sof-tgl-rt711-rt1316-rt714.tplg",
+	},
 	{
 		.link_mask = 0x3, /* rt711 on link 0 and 2 rt1308s on link 1 */
 		.links = tgl_rvp,
-- 
2.25.1

