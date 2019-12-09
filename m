Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA25117529
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:03:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEEED1674;
	Mon,  9 Dec 2019 20:03:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEEED1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575918231;
	bh=jgSCgxkTD/6OkafSrC0MNWKI9Cy49KVy8J+0FJuzwB0=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=AcV5t5tZQi0fxwsvsSp3+UIXMwFnRXzdk3CykAmtsPuLrni8ALNUekmRTKMgt43mb
	 awFQ0KI2T/b80RsMZkOCUu4TvMBths5YhcbYuIxx56dR4t53EIpWZbqzTqRtI2Ftb+
	 8jBbw0sYD7hLZKmIC4UcGVqyVOz5yHCMWYldtml0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5131F8028C;
	Mon,  9 Dec 2019 19:59:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78575F80274; Mon,  9 Dec 2019 19:58:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 33663F80265
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:58:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33663F80265
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A00B1045;
 Mon,  9 Dec 2019 10:58:51 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E98893F6CF;
 Mon,  9 Dec 2019 10:58:50 -0800 (PST)
Date: Mon, 09 Dec 2019 18:58:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20191204211556.12671-8-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191204211556.12671-8-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Introduce default_fw_filename
	member in sof_dev_desc" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Introduce default_fw_filename member in sof_dev_desc

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 03eec9b4eb897dde5985579508c978e7a29052bd Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 4 Dec 2019 15:15:50 -0600
Subject: [PATCH] ASoC: SOF: Introduce default_fw_filename member in
 sof_dev_desc

Currently the FW filename is obtained from the ACPI matching
table when determining which machine driver to use. In
preparation for making the machine driver ACPI match optional
for Device Tree platforms and moving the machine driver selection
out of the SOF core, this patch introduces the default_fw_filename
member in struct sof_dev_desc.

Once the machine driver selection is moved out of SOF core,
the nocodec_fw_filename will become obsolete and will be removed.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191204211556.12671-8-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof.h          | 3 +++
 sound/soc/sof/sof-acpi-dev.c | 5 +++++
 sound/soc/sof/sof-of-dev.c   | 1 +
 sound/soc/sof/sof-pci-dev.c  | 9 +++++++++
 4 files changed, 18 insertions(+)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 479101736ee0..1723478db4a2 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -91,6 +91,9 @@ struct sof_dev_desc {
 	const char *default_fw_path;
 	const char *default_tplg_path;
 
+	/* default firmware name */
+	const char *default_fw_filename;
+
 	const struct snd_sof_dsp_ops *ops;
 	const struct sof_arch_ops *arch_ops;
 };
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index df318f50dd0b..22e13ef09811 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -45,6 +45,7 @@ static const struct sof_dev_desc sof_acpi_haswell_desc = {
 	.chip_info = &hsw_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-hsw.ri",
 	.nocodec_fw_filename = "sof-hsw.ri",
 	.nocodec_tplg_filename = "sof-hsw-nocodec.tplg",
 	.ops = &sof_hsw_ops,
@@ -62,6 +63,7 @@ static const struct sof_dev_desc sof_acpi_broadwell_desc = {
 	.chip_info = &bdw_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-bdw.ri",
 	.nocodec_fw_filename = "sof-bdw.ri",
 	.nocodec_tplg_filename = "sof-bdw-nocodec.tplg",
 	.ops = &sof_bdw_ops,
@@ -81,6 +83,7 @@ static const struct sof_dev_desc sof_acpi_baytrailcr_desc = {
 	.chip_info = &byt_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-byt.ri",
 	.nocodec_fw_filename = "sof-byt.ri",
 	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
 	.ops = &sof_byt_ops,
@@ -96,6 +99,7 @@ static const struct sof_dev_desc sof_acpi_baytrail_desc = {
 	.chip_info = &byt_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-byt.ri",
 	.nocodec_fw_filename = "sof-byt.ri",
 	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
 	.ops = &sof_byt_ops,
@@ -111,6 +115,7 @@ static const struct sof_dev_desc sof_acpi_cherrytrail_desc = {
 	.chip_info = &cht_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-cht.ri",
 	.nocodec_fw_filename = "sof-cht.ri",
 	.nocodec_tplg_filename = "sof-cht-nocodec.tplg",
 	.ops = &sof_cht_ops,
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 28a9692974e5..81deb5582d77 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -19,6 +19,7 @@ extern struct snd_sof_dsp_ops sof_imx8_ops;
 static struct sof_dev_desc sof_of_imx8qxp_desc = {
 	.default_fw_path = "imx/sof",
 	.default_tplg_path = "imx/sof-tplg",
+	.default_fw_filename = "sof-imx8.ri",
 	.nocodec_fw_filename = "sof-imx8.ri",
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
 	.ops = &sof_imx8_ops,
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index bbeffd932de7..046bd57657ca 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -47,6 +47,7 @@ static const struct sof_dev_desc bxt_desc = {
 	.chip_info = &apl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-apl.ri",
 	.nocodec_fw_filename = "sof-apl.ri",
 	.nocodec_tplg_filename = "sof-apl-nocodec.tplg",
 	.ops = &sof_apl_ops,
@@ -65,6 +66,7 @@ static const struct sof_dev_desc glk_desc = {
 	.chip_info = &apl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-glk.ri",
 	.nocodec_fw_filename = "sof-glk.ri",
 	.nocodec_tplg_filename = "sof-glk-nocodec.tplg",
 	.ops = &sof_apl_ops,
@@ -93,6 +95,7 @@ static const struct sof_dev_desc tng_desc = {
 	.chip_info = &tng_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-byt.ri",
 	.nocodec_fw_filename = "sof-byt.ri",
 	.nocodec_tplg_filename = "sof-byt.tplg",
 	.ops = &sof_tng_ops,
@@ -111,6 +114,7 @@ static const struct sof_dev_desc cnl_desc = {
 	.chip_info = &cnl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-cnl.ri",
 	.nocodec_fw_filename = "sof-cnl.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
@@ -129,6 +133,7 @@ static const struct sof_dev_desc cfl_desc = {
 	.chip_info = &cnl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-cfl.ri",
 	.nocodec_fw_filename = "sof-cfl.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
@@ -149,6 +154,7 @@ static const struct sof_dev_desc cml_desc = {
 	.chip_info = &cnl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-cml.ri",
 	.nocodec_fw_filename = "sof-cml.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
@@ -167,6 +173,7 @@ static const struct sof_dev_desc icl_desc = {
 	.chip_info = &icl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-icl.ri",
 	.nocodec_fw_filename = "sof-icl.ri",
 	.nocodec_tplg_filename = "sof-icl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
@@ -185,6 +192,7 @@ static const struct sof_dev_desc tgl_desc = {
 	.chip_info = &tgl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-tgl.ri",
 	.nocodec_fw_filename = "sof-tgl.ri",
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
@@ -203,6 +211,7 @@ static const struct sof_dev_desc ehl_desc = {
 	.chip_info = &ehl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
+	.default_fw_filename = "sof-ehl.ri",
 	.nocodec_fw_filename = "sof-ehl.ri",
 	.nocodec_tplg_filename = "sof-ehl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
