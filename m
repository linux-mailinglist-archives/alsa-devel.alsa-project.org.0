Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C33117523
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:02:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DD201663;
	Mon,  9 Dec 2019 20:01:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DD201663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575918121;
	bh=SJTBRpchxXhNdqYfpPFPp6tc1hrfYJ3y4buyciVOIVw=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CQ1Fs0bShcNlpsBkW/H2zwA1CVlqsNxRhO4or2QL1P6Cz2DaatSCWXX98FGT1r6og
	 Mdf2+MGwtKagrbAS5T1nib+d6i2FST2JC4iBChnhcxZEf9DFJmPo7/yg2SB6qwklnA
	 ng0K5eRX9kxQ9K/icq9YD5qjKxOGJFROsJbzjmt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69695F80234;
	Mon,  9 Dec 2019 19:58:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1419F80258; Mon,  9 Dec 2019 19:58:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D348BF80234
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:58:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D348BF80234
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9C28328;
 Mon,  9 Dec 2019 10:58:40 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48DBD3F6CF;
 Mon,  9 Dec 2019 10:58:40 -0800 (PST)
Date: Mon, 09 Dec 2019 18:58:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20191204211556.12671-12-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191204211556.12671-12-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: remove nocodec_fw_filename" to the
	asoc tree
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

   ASoC: SOF: remove nocodec_fw_filename

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

From f4e4113b2aec2d344276ac07f78e80460eb8ebf8 Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 4 Dec 2019 15:15:54 -0600
Subject: [PATCH] ASoC: SOF: remove nocodec_fw_filename

Remove nocodec_fw_filename from struct sof_dev_desc
as it is not longer needed.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191204211556.12671-12-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof.h          |  1 -
 sound/soc/sof/sof-acpi-dev.c |  5 -----
 sound/soc/sof/sof-of-dev.c   |  1 -
 sound/soc/sof/sof-pci-dev.c  | 10 ----------
 4 files changed, 17 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 1723478db4a2..98a757d3a67d 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -84,7 +84,6 @@ struct sof_dev_desc {
 	const void *chip_info;
 
 	/* defaults for no codec mode */
-	const char *nocodec_fw_filename;
 	const char *nocodec_tplg_filename;
 
 	/* defaults paths for firmware and topology files */
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 8174b9a7da95..9c0a4eed5cc8 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -46,7 +46,6 @@ static const struct sof_dev_desc sof_acpi_haswell_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-hsw.ri",
-	.nocodec_fw_filename = "sof-hsw.ri",
 	.nocodec_tplg_filename = "sof-hsw-nocodec.tplg",
 	.ops = &sof_hsw_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -64,7 +63,6 @@ static const struct sof_dev_desc sof_acpi_broadwell_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-bdw.ri",
-	.nocodec_fw_filename = "sof-bdw.ri",
 	.nocodec_tplg_filename = "sof-bdw-nocodec.tplg",
 	.ops = &sof_bdw_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -84,7 +82,6 @@ static const struct sof_dev_desc sof_acpi_baytrailcr_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-byt.ri",
-	.nocodec_fw_filename = "sof-byt.ri",
 	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
 	.ops = &sof_byt_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -100,7 +97,6 @@ static const struct sof_dev_desc sof_acpi_baytrail_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-byt.ri",
-	.nocodec_fw_filename = "sof-byt.ri",
 	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
 	.ops = &sof_byt_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -116,7 +112,6 @@ static const struct sof_dev_desc sof_acpi_cherrytrail_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-cht.ri",
-	.nocodec_fw_filename = "sof-cht.ri",
 	.nocodec_tplg_filename = "sof-cht-nocodec.tplg",
 	.ops = &sof_cht_ops,
 	.arch_ops = &sof_xtensa_arch_ops
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index 170a5839150f..39ea8af6213f 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -20,7 +20,6 @@ static struct sof_dev_desc sof_of_imx8qxp_desc = {
 	.default_fw_path = "imx/sof",
 	.default_tplg_path = "imx/sof-tplg",
 	.default_fw_filename = "sof-imx8.ri",
-	.nocodec_fw_filename = "sof-imx8.ri",
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
 	.ops = &sof_imx8_ops,
 };
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 1c7b87392708..5f08a9ca6bf8 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -48,7 +48,6 @@ static const struct sof_dev_desc bxt_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-apl.ri",
-	.nocodec_fw_filename = "sof-apl.ri",
 	.nocodec_tplg_filename = "sof-apl-nocodec.tplg",
 	.ops = &sof_apl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -67,7 +66,6 @@ static const struct sof_dev_desc glk_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-glk.ri",
-	.nocodec_fw_filename = "sof-glk.ri",
 	.nocodec_tplg_filename = "sof-glk-nocodec.tplg",
 	.ops = &sof_apl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -96,7 +94,6 @@ static const struct sof_dev_desc tng_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-byt.ri",
-	.nocodec_fw_filename = "sof-byt.ri",
 	.nocodec_tplg_filename = "sof-byt.tplg",
 	.ops = &sof_tng_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -115,7 +112,6 @@ static const struct sof_dev_desc cnl_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-cnl.ri",
-	.nocodec_fw_filename = "sof-cnl.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -134,7 +130,6 @@ static const struct sof_dev_desc cfl_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-cfl.ri",
-	.nocodec_fw_filename = "sof-cfl.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -155,7 +150,6 @@ static const struct sof_dev_desc cml_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-cml.ri",
-	.nocodec_fw_filename = "sof-cml.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -174,7 +168,6 @@ static const struct sof_dev_desc icl_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-icl.ri",
-	.nocodec_fw_filename = "sof-icl.ri",
 	.nocodec_tplg_filename = "sof-icl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -193,7 +186,6 @@ static const struct sof_dev_desc tgl_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-tgl.ri",
-	.nocodec_fw_filename = "sof-tgl.ri",
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -212,7 +204,6 @@ static const struct sof_dev_desc ehl_desc = {
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
 	.default_fw_filename = "sof-ehl.ri",
-	.nocodec_fw_filename = "sof-ehl.ri",
 	.nocodec_tplg_filename = "sof-ehl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
@@ -230,7 +221,6 @@ static const struct sof_dev_desc jsl_desc = {
 	.chip_info = &jsl_chip_info,
 	.default_fw_path = "intel/sof",
 	.default_tplg_path = "intel/sof-tplg",
-	.nocodec_fw_filename = "sof-jsl.ri",
 	.nocodec_tplg_filename = "sof-jsl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
 	.arch_ops = &sof_xtensa_arch_ops
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
