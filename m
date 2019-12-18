Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FEF1252B7
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 21:08:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 448E41616;
	Wed, 18 Dec 2019 21:08:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 448E41616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576699730;
	bh=E7jpZdZvOhYeneQSK7AoZX6XcINwKCjm04mrKOkE+1E=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ppfafpuL3nM0hRiTRBqyK/Q2+wryOd36UGzL1vH08ngKZo6i2Nvoel1IAC1249jWL
	 ADiBSN5+2ghPko5YHwkErdfw0z1gkgm/5sGcAJSfq4Pyl/sNKzrhMhyMMNaXyTNh78
	 vIGtdQ3IRKxdfAjZPc7PFlZsEwSxWcwsg4AzqHgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92639F80272;
	Wed, 18 Dec 2019 21:05:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3774F80269; Wed, 18 Dec 2019 21:05:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 693B3F80255
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 21:05:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 693B3F80255
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D16A11B3;
 Wed, 18 Dec 2019 12:05:33 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD7E13F67D;
 Wed, 18 Dec 2019 12:05:32 -0800 (PST)
Date: Wed, 18 Dec 2019 20:05:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191217202231.18259-8-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191217202231.18259-8-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: move arch_ops under ops" to the
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

   ASoC: SOF: move arch_ops under ops

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

From 0f501c7cde4086d15c396a95c59631b05dbc0351 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 17 Dec 2019 14:22:30 -0600
Subject: [PATCH] ASoC: SOF: move arch_ops under ops

The current structures are not well designed. We include Xtensa
information from the ACPI and PCI levels, but at the Kconfig/module
level everything Xtensa related is included at the sof/intel level.

Move the arch_ops under ops so that Xtensa is hidden in the DSP ops,
with a structure that follows the Kconfig/module partition.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191217202231.18259-8-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/sof.h          |  1 -
 sound/soc/sof/intel/apl.c    |  2 ++
 sound/soc/sof/intel/bdw.c    |  2 ++
 sound/soc/sof/intel/byt.c    |  6 ++++++
 sound/soc/sof/intel/cnl.c    |  2 ++
 sound/soc/sof/sof-acpi-dev.c |  4 ----
 sound/soc/sof/sof-pci-dev.c  | 10 ----------
 sound/soc/sof/sof-priv.h     |  4 +++-
 8 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 6ea74f1a9ec2..a0cbca021230 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -93,7 +93,6 @@ struct sof_dev_desc {
 	const char *default_fw_filename;
 
 	const struct snd_sof_dsp_ops *ops;
-	const struct sof_arch_ops *arch_ops;
 };
 
 int sof_nocodec_setup(struct device *dev,
diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 97831d2c9df6..2483b15699e7 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -111,6 +111,8 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 			SNDRV_PCM_INFO_INTERLEAVED |
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
+
+	.arch_ops = &sof_xtensa_arch_ops,
 };
 EXPORT_SYMBOL_NS(sof_apl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
 
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index f017089c7b2d..4d45b54a0f8b 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -632,6 +632,8 @@ const struct snd_sof_dsp_ops sof_bdw_ops = {
 			SNDRV_PCM_INFO_INTERLEAVED |
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_BATCH,
+
+	.arch_ops = &sof_xtensa_arch_ops,
 };
 EXPORT_SYMBOL_NS(sof_bdw_ops, SND_SOC_SOF_BROADWELL);
 
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 07634873deb6..08193882f91f 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -618,6 +618,8 @@ const struct snd_sof_dsp_ops sof_tng_ops = {
 			SNDRV_PCM_INFO_INTERLEAVED |
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_BATCH,
+
+	.arch_ops = &sof_xtensa_arch_ops,
 };
 EXPORT_SYMBOL_NS(sof_tng_ops, SND_SOC_SOF_MERRIFIELD);
 
@@ -792,6 +794,8 @@ const struct snd_sof_dsp_ops sof_byt_ops = {
 			SNDRV_PCM_INFO_INTERLEAVED |
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_BATCH,
+
+	.arch_ops = &sof_xtensa_arch_ops,
 };
 EXPORT_SYMBOL_NS(sof_byt_ops, SND_SOC_SOF_BAYTRAIL);
 
@@ -865,6 +869,8 @@ const struct snd_sof_dsp_ops sof_cht_ops = {
 			SNDRV_PCM_INFO_INTERLEAVED |
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_BATCH,
+
+	.arch_ops = &sof_xtensa_arch_ops,
 };
 EXPORT_SYMBOL_NS(sof_cht_ops, SND_SOC_SOF_BAYTRAIL);
 
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index b27088e67c7b..9e2d8afe0535 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -297,6 +297,8 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 			SNDRV_PCM_INFO_INTERLEAVED |
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
+
+	.arch_ops = &sof_xtensa_arch_ops,
 };
 EXPORT_SYMBOL_NS(sof_cnl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
 
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 9100d7c70bb2..1278aa95effa 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -48,7 +48,6 @@ static const struct sof_dev_desc sof_acpi_broadwell_desc = {
 	.default_fw_filename = "sof-bdw.ri",
 	.nocodec_tplg_filename = "sof-bdw-nocodec.tplg",
 	.ops = &sof_bdw_ops,
-	.arch_ops = &sof_xtensa_arch_ops
 };
 #endif
 
@@ -67,7 +66,6 @@ static const struct sof_dev_desc sof_acpi_baytrailcr_desc = {
 	.default_fw_filename = "sof-byt.ri",
 	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
 	.ops = &sof_byt_ops,
-	.arch_ops = &sof_xtensa_arch_ops
 };
 
 static const struct sof_dev_desc sof_acpi_baytrail_desc = {
@@ -82,7 +80,6 @@ static const struct sof_dev_desc sof_acpi_baytrail_desc = {
 	.default_fw_filename = "sof-byt.ri",
 	.nocodec_tplg_filename = "sof-byt-nocodec.tplg",
 	.ops = &sof_byt_ops,
-	.arch_ops = &sof_xtensa_arch_ops
 };
 
 static const struct sof_dev_desc sof_acpi_cherrytrail_desc = {
@@ -97,7 +94,6 @@ static const struct sof_dev_desc sof_acpi_cherrytrail_desc = {
 	.default_fw_filename = "sof-cht.ri",
 	.nocodec_tplg_filename = "sof-cht-nocodec.tplg",
 	.ops = &sof_cht_ops,
-	.arch_ops = &sof_xtensa_arch_ops
 };
 
 #endif
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 20638f666189..da7b17e5177b 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -50,7 +50,6 @@ static const struct sof_dev_desc bxt_desc = {
 	.default_fw_filename = "sof-apl.ri",
 	.nocodec_tplg_filename = "sof-apl-nocodec.tplg",
 	.ops = &sof_apl_ops,
-	.arch_ops = &sof_xtensa_arch_ops
 };
 #endif
 
@@ -68,7 +67,6 @@ static const struct sof_dev_desc glk_desc = {
 	.default_fw_filename = "sof-glk.ri",
 	.nocodec_tplg_filename = "sof-glk-nocodec.tplg",
 	.ops = &sof_apl_ops,
-	.arch_ops = &sof_xtensa_arch_ops
 };
 #endif
 
@@ -96,7 +94,6 @@ static const struct sof_dev_desc tng_desc = {
 	.default_fw_filename = "sof-byt.ri",
 	.nocodec_tplg_filename = "sof-byt.tplg",
 	.ops = &sof_tng_ops,
-	.arch_ops = &sof_xtensa_arch_ops
 };
 #endif
 
@@ -114,7 +111,6 @@ static const struct sof_dev_desc cnl_desc = {
 	.default_fw_filename = "sof-cnl.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
-	.arch_ops = &sof_xtensa_arch_ops
 };
 #endif
 
@@ -132,7 +128,6 @@ static const struct sof_dev_desc cfl_desc = {
 	.default_fw_filename = "sof-cfl.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
-	.arch_ops = &sof_xtensa_arch_ops
 };
 #endif
 
@@ -152,7 +147,6 @@ static const struct sof_dev_desc cml_desc = {
 	.default_fw_filename = "sof-cml.ri",
 	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
-	.arch_ops = &sof_xtensa_arch_ops
 };
 #endif
 
@@ -170,7 +164,6 @@ static const struct sof_dev_desc icl_desc = {
 	.default_fw_filename = "sof-icl.ri",
 	.nocodec_tplg_filename = "sof-icl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
-	.arch_ops = &sof_xtensa_arch_ops
 };
 #endif
 
@@ -188,7 +181,6 @@ static const struct sof_dev_desc tgl_desc = {
 	.default_fw_filename = "sof-tgl.ri",
 	.nocodec_tplg_filename = "sof-tgl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
-	.arch_ops = &sof_xtensa_arch_ops
 };
 #endif
 
@@ -206,7 +198,6 @@ static const struct sof_dev_desc ehl_desc = {
 	.default_fw_filename = "sof-ehl.ri",
 	.nocodec_tplg_filename = "sof-ehl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
-	.arch_ops = &sof_xtensa_arch_ops
 };
 #endif
 
@@ -223,7 +214,6 @@ static const struct sof_dev_desc jsl_desc = {
 	.default_tplg_path = "intel/sof-tplg",
 	.nocodec_tplg_filename = "sof-jsl-nocodec.tplg",
 	.ops = &sof_cnl_ops,
-	.arch_ops = &sof_xtensa_arch_ops
 };
 #endif
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 3f1e1eb7c55f..bc2337cf1142 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -217,6 +217,8 @@ struct snd_sof_dsp_ops {
 
 	/* ALSA HW info flags, will be stored in snd_pcm_runtime.hw.info */
 	u32 hw_info;
+
+	const struct sof_arch_ops *arch_ops;
 };
 
 /* DSP architecture specific callbacks for oops and stack dumps */
@@ -226,7 +228,7 @@ struct sof_arch_ops {
 			  u32 *stack, u32 stack_words);
 };
 
-#define sof_arch_ops(sdev) ((sdev)->pdata->desc->arch_ops)
+#define sof_arch_ops(sdev) ((sdev)->pdata->desc->ops->arch_ops)
 
 /* DSP device HW descriptor mapping between bus ID and ops */
 struct sof_ops_table {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
