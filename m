Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F03123750
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 21:29:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3219B166D;
	Tue, 17 Dec 2019 21:29:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3219B166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576614598;
	bh=1seJnjpHh8PtAzKDwD3NPuRscGcTSUMFAeYwc3wmjRI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b1Q1Sg7hG1VQ3MMVOtLqyPXFvN8Y0XanQB9f5tz63GOiNLw/0OLdByPa0QmUUA05m
	 Sz6xofQVn9tbUaFrciz/XuDMxh3FdlyhNJBH3uZufQcycl5PJpBM3ctpS7k++ez+w2
	 qmVIFd1zur+Agr2L0JEDoI7mz7c/s3sks2mqvbH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC945F802DC;
	Tue, 17 Dec 2019 21:23:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0D16F8027B; Tue, 17 Dec 2019 21:23:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAA12F80218
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 21:22:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAA12F80218
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 12:22:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="266679239"
Received: from smcdonal-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.83.42])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Dec 2019 12:22:53 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 14:22:30 -0600
Message-Id: <20191217202231.18259-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191217202231.18259-1-pierre-louis.bossart@linux.intel.com>
References: <20191217202231.18259-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 7/8] ASoC: SOF: move arch_ops under ops
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

The current structures are not well designed. We include Xtensa
information from the ACPI and PCI levels, but at the Kconfig/module
level everything Xtensa related is included at the sof/intel level.

Move the arch_ops under ops so that Xtensa is hidden in the DSP ops,
with a structure that follows the Kconfig/module partition.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
index 17a959da525a..f501f4256574 100644
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
index 54dd6d4b4c12..63f221e254bb 100644
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
