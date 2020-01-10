Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E611379AC
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 23:30:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72AC116B2;
	Fri, 10 Jan 2020 23:29:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72AC116B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578695413;
	bh=eSlL37pc9/JImeoj5Tx3e8ZSOGB9ipTtVsTjEB880Zg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R0GyNhey48FxLNH173ruzTnR6/PAjoKtFdOVbN2nc0QO2227TrKsPRkcQHRERBM1r
	 +WE64IwPYnE3S0usyMECahZRByyYYWBheeLtxabRWjRoR/CQfN/BD8XMspJGl089vO
	 TWtekFusR6jzIdVBeBlNhl0WPXFWgFtzArqKzZvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF912F80299;
	Fri, 10 Jan 2020 23:25:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30B7EF8024A; Fri, 10 Jan 2020 23:25:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D4E1F8011C
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 23:25:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D4E1F8011C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 14:25:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,418,1571727600"; d="scan'208";a="216813267"
Received: from ewronsha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.66.226])
 by orsmga008.jf.intel.com with ESMTP; 10 Jan 2020 14:25:36 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 10 Jan 2020 16:25:28 -0600
Message-Id: <20200110222530.30303-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200110222530.30303-1-pierre-louis.bossart@linux.intel.com>
References: <20200110222530.30303-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 4/6] ASoC: Intel: common: add match tables for
	CNL/CFL/CML w/ SoundWire
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Rander Wang <rander.wang@linux.intel.com>

The two configurations are with the Realtek 3-in-1 board requiring all
4 links to be enabled, or basic configuration with the on-board
RT700 using link1.

For now we only have definitions for CML. CNL and CFL are just
placeholders.

Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-cfl-match.c   |  5 ++
 .../intel/common/soc-acpi-intel-cml-match.c   | 89 +++++++++++++++++++
 .../intel/common/soc-acpi-intel-cnl-match.c   |  5 ++
 3 files changed, 99 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cfl-match.c b/sound/soc/intel/common/soc-acpi-intel-cfl-match.c
index d6fd2026d0b8..ff9d6938b9f6 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cfl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cfl-match.c
@@ -14,5 +14,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cfl_machines[] = {
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cfl_machines);
 
+struct snd_soc_acpi_mach snd_soc_acpi_intel_cfl_sdw_machines[] = {
+	{}
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cfl_sdw_machines);
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index fb9ba8819706..f55634c4c2e8 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -59,5 +59,94 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cml_machines);
 
+static const u64 rt711_0_adr[] = {
+	0x000010025D071100
+};
+
+static const u64 rt1308_1_adr[] = {
+	0x000110025D130800
+};
+
+static const u64 rt1308_2_adr[] = {
+	0x000210025D130800
+};
+
+static const u64 rt715_3_adr[] = {
+	0x000310025D071500
+};
+
+static const struct snd_soc_acpi_link_adr cml_3_in_1_default[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_0_adr),
+		.adr = rt711_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1308_1_adr),
+		.adr = rt1308_1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1308_2_adr),
+		.adr = rt1308_2_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt715_3_adr),
+		.adr = rt715_3_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr cml_3_in_1_mono_amp[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_0_adr),
+		.adr = rt711_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1308_1_adr),
+		.adr = rt1308_1_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt715_3_adr),
+		.adr = rt715_3_adr,
+	},
+	{}
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_sdw_machines[] = {
+	{
+		.link_mask = 0xF, /* 4 active links required */
+		.links = cml_3_in_1_default,
+		.drv_name = "sdw_rt711_rt1308_rt715",
+		.sof_fw_filename = "sof-cml.ri",
+		.sof_tplg_filename = "sof-cml-rt711-rt1308-rt715.tplg",
+	},
+	{
+		/*
+		 * link_mask should be 0xB, but all links are enabled by BIOS.
+		 * This entry will be selected if there is no rt1308 exposed
+		 * on link2 since it will fail to match the above entry.
+		 */
+		.link_mask = 0xF,
+		.links = cml_3_in_1_mono_amp,
+		.drv_name = "sdw_rt711_rt1308_rt715",
+		.sof_fw_filename = "sof-cml.ri",
+		.sof_tplg_filename = "sof-cml-rt711-rt1308-mono-rt715.tplg",
+	},
+	{
+		.link_mask = 0x2, /* RT700 connected on Link1 */
+		.drv_name = "sdw_rt700",
+		.sof_fw_filename = "sof-cml.ri",
+		.sof_tplg_filename = "sof-cml-rt700.tplg",
+	},
+	{}
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cml_sdw_machines);
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index 27588841c8b0..828980d5630d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -27,5 +27,10 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cnl_machines);
 
+struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_sdw_machines[] = {
+	{},
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cnl_sdw_machines);
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel Common ACPI Match module");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
