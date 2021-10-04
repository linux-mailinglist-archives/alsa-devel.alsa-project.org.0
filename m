Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FE7421960
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 23:38:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ADAF165E;
	Mon,  4 Oct 2021 23:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ADAF165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633383486;
	bh=v3Yrfmh/rPnFLGsAqzOqUwBJT8TaYt3b8DbIQKae4UE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lmq5gAoHdFiqRkkOWBxXl33XJgFDIxFjA7SFN62u+vMxIXFpI43n9m0PmXugdNAX/
	 rCV/CbaPuKNiFuz/WyktkRnvGhHtsBIGjgsI0KpM3HdKwn72+YF2OGENqwzuIYP+cm
	 wrWsCLk36NzhPhC5YfKnvfIR1MKVKScUOA1wpSvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E677F80249;
	Mon,  4 Oct 2021 23:35:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 170DDF804ED; Mon,  4 Oct 2021 23:35:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B183F80424
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 23:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B183F80424
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="223012813"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="223012813"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 14:35:36 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="521588519"
Received: from ksgonzal-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.181.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 14:35:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/5] ASoC: Intel: soc-acpi: add missing quirk for TGL SDCA
 single amp
Date: Mon,  4 Oct 2021 16:35:11 -0500
Message-Id: <20211004213512.220836-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004213512.220836-1-pierre-louis.bossart@linux.intel.com>
References: <20211004213512.220836-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>, Rander Wang <rander.wang@intel.com>
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

We don't have a configuration for a single amp on link1.

BugLink: https://github.com/thesofproject/linux/issues/3161
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
---
 .../intel/common/soc-acpi-intel-tgl-match.c   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 5332f96eb938..9d89f01d6b84 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -156,6 +156,15 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1316_1_single_adr[] = {
+	{
+		.adr = 0x000131025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1316-1"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
 	{
 		.adr = 0x000131025D131601ull, /* unique ID is set for some reason */
@@ -320,6 +329,25 @@ static const struct snd_soc_acpi_link_adr tgl_3_in_1_sdca[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr tgl_3_in_1_sdca_mono[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1316_1_single_adr),
+		.adr_d = rt1316_1_single_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt714_3_adr),
+		.adr_d = rt714_3_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_codecs tgl_max98373_amp = {
 	.num_codecs = 1,
 	.codecs = {"MX98373"}
@@ -418,6 +446,19 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-tgl-rt711-rt1316-rt714.tplg",
 	},
+	{
+		/*
+		 * link_mask should be 0xB, but all links are enabled by BIOS.
+		 * This entry will be selected if there is no rt1316 amplifier exposed
+		 * on link2 since it will fail to match the above entry.
+		 */
+
+		.link_mask = 0xF, /* 4 active links required */
+		.links = tgl_3_in_1_sdca_mono,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-tgl-rt711-l0-rt1316-l1-mono-rt714-l3.tplg",
+	},
+
 	{
 		.link_mask = 0x3, /* rt711 on link 0 and 1 rt1308 on link 1 */
 		.links = tgl_hp,
-- 
2.25.1

