Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CA9195CEC
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 18:33:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0282D15F8;
	Fri, 27 Mar 2020 18:32:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0282D15F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585330393;
	bh=S5B1/iSJ4VVRW+sqz2zpO+diB3IuTgt1qb4n8BbhZuk=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jAvkFHQUB6PDdDxbJCgMoN+WQZVRxoh55QFyw5oflU6xe9MvGAsqEtGNPw37YFMiQ
	 o/t+RmR/7ZEdYDEcEYhG1P3jfpuW0DZMTp/9lYe0DUOGKFFFpzadOdKojQmbqvCi/q
	 Ib+ew7jUNvMVM3EHDBf/l8ZjSJ6iMrcD3YZnFQkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC7C8F802A0;
	Fri, 27 Mar 2020 18:29:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09774F8029B; Fri, 27 Mar 2020 18:29:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 56EE8F8028E
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 18:29:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56EE8F8028E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2520101E;
 Fri, 27 Mar 2020 10:29:09 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 654F03F71E;
 Fri, 27 Mar 2020 10:29:09 -0700 (PDT)
Date: Fri, 27 Mar 2020 17:29:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Rander Wang <rander.wang@intel.com>
Subject: Applied "ASoC: Intel: soc-acpi: update topology and driver name for
 SoundWire platforms" to the asoc tree
In-Reply-To: <20200325220746.29601-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200325220746.29601-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

The patch

   ASoC: Intel: soc-acpi: update topology and driver name for SoundWire platforms

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From ba762e67c3f34660f6ac8299296dbc9e96720939 Mon Sep 17 00:00:00 2001
From: Rander Wang <rander.wang@intel.com>
Date: Wed, 25 Mar 2020 17:07:43 -0500
Subject: [PATCH] ASoC: Intel: soc-acpi: update topology and driver name for
 SoundWire platforms

Update topology and reflect change to unified machine driver for SoundWire.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200325220746.29601-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../intel/common/soc-acpi-intel-cml-match.c   | 24 ++++++++++++++++---
 .../intel/common/soc-acpi-intel-icl-match.c   |  6 ++---
 .../intel/common/soc-acpi-intel-tgl-match.c   |  6 ++---
 3 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 3525da79c68a..bcedec6c6117 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -80,6 +80,23 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
+static const struct snd_soc_acpi_adr_device rt700_1_adr[] = {
+	{
+		.adr = 0x000110025D070000,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_link_adr cml_rvp[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt700_1_adr),
+		.adr_d = rt700_1_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
 		.adr = 0x000010025D071100,
@@ -175,7 +192,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_sdw_machines[] = {
 	{
 		.link_mask = 0xF, /* 4 active links required */
 		.links = cml_3_in_1_default,
-		.drv_name = "sdw_rt711_rt1308_rt715",
+		.drv_name = "sof_sdw",
 		.sof_fw_filename = "sof-cml.ri",
 		.sof_tplg_filename = "sof-cml-rt711-rt1308-rt715.tplg",
 	},
@@ -187,13 +204,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_sdw_machines[] = {
 		 */
 		.link_mask = 0xF,
 		.links = cml_3_in_1_mono_amp,
-		.drv_name = "sdw_rt711_rt1308_rt715",
+		.drv_name = "sof_sdw",
 		.sof_fw_filename = "sof-cml.ri",
 		.sof_tplg_filename = "sof-cml-rt711-rt1308-mono-rt715.tplg",
 	},
 	{
 		.link_mask = 0x2, /* RT700 connected on Link1 */
-		.drv_name = "sdw_rt700",
+		.links = cml_rvp,
+		.drv_name = "sof_sdw",
 		.sof_fw_filename = "sof-cml.ri",
 		.sof_tplg_filename = "sof-cml-rt700.tplg",
 	},
diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index a05fc083829e..ef8500349f2f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -166,21 +166,21 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_sdw_machines[] = {
 	{
 		.link_mask = 0xF, /* 4 active links required */
 		.links = icl_3_in_1_default,
-		.drv_name = "sdw_rt711_rt1308_rt715",
+		.drv_name = "sof_sdw",
 		.sof_fw_filename = "sof-icl.ri",
 		.sof_tplg_filename = "sof-icl-rt711-rt1308-rt715.tplg",
 	},
 	{
 		.link_mask = 0xB, /* 3 active links required */
 		.links = icl_3_in_1_mono_amp,
-		.drv_name = "sdw_rt711_rt1308_rt715",
+		.drv_name = "sof_sdw",
 		.sof_fw_filename = "sof-icl.ri",
 		.sof_tplg_filename = "sof-icl-rt711-rt1308-rt715-mono.tplg",
 	},
 	{
 		.link_mask = 0x1, /* rt700 connected on link0 */
 		.links = icl_rvp,
-		.drv_name = "sdw_rt700",
+		.drv_name = "sof_sdw",
 		.sof_fw_filename = "sof-icl.ri",
 		.sof_tplg_filename = "sof-icl-rt700.tplg",
 	},
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 3153b44f9053..db360c9a8e5b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -87,11 +87,11 @@ static struct snd_soc_acpi_codecs tgl_max98373_amp = {
 struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 	{
 		.id = "10EC1308",
-		.drv_name = "rt711_rt1308",
+		.drv_name = "sof_sdw",
 		.link_mask = 0x1, /* RT711 on SoundWire link0 */
 		.links = tgl_i2s_rt1308,
 		.sof_fw_filename = "sof-tgl.ri",
-		.sof_tplg_filename = "sof-tgl-rt711-rt1308.tplg",
+		.sof_tplg_filename = "sof-tgl-rt711-i2s-rt1308.tplg",
 	},
 	{
 		.id = "10EC5682",
@@ -118,7 +118,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 	{
 		.link_mask = 0x3, /* rt711 on link 0 and 2 rt1308s on link 1 */
 		.links = tgl_rvp,
-		.drv_name = "sdw_rt711_rt1308_rt715",
+		.drv_name = "sof_sdw",
 		.sof_fw_filename = "sof-tgl.ri",
 		.sof_tplg_filename = "sof-tgl-rt711-rt1308.tplg",
 	},
-- 
2.20.1

