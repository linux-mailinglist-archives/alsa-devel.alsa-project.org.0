Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D64501B5C
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 20:52:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 924581908;
	Thu, 14 Apr 2022 20:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 924581908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649962342;
	bh=hz0j5HdOTjDc5+YpSg319DZvwXWGnDvQQi8cCT8RzVo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QR/yJl0IJsOM8QsA4lVyHpclb7JhcvoV+AD3yeSWzFUqfpvrON1Ilsdzur8ioZgI6
	 up9v1KtCsByjWjdmNMN7n7FkgBPQKsN7IEIEtnr1wuKq5BIZxSA9Wm4ow5ydknUOIV
	 d69x8Z5t6jHvaRtn2nj+BjH5uBpKzqRD38Znen8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9CEAF8055B;
	Thu, 14 Apr 2022 20:49:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C472AF80544; Thu, 14 Apr 2022 20:49:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81D67F80526
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 20:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81D67F80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j0Pt+c06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962137; x=1681498137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hz0j5HdOTjDc5+YpSg319DZvwXWGnDvQQi8cCT8RzVo=;
 b=j0Pt+c06KaWVU1j9WrWRqY97UpnvWvXaIh+YC0A0oIVnIdj1HdLTaay5
 yu4jxuNfLtaW41diviMQt8G/QgmN8WJMFS1xTCmDLm1M5plE+M0WlnBCw
 z+NxZMSGpkAt6//p2Rqb/iqZ/qOxfp8oiUS6BMYDSFGW3fZCdoFs1B7cc
 ABBO0i5XPVWQtI0FHB5n7IUqKPSyf4TZFxpfyYCUEbkBsbag5LZ5M1CuR
 PsLpWeUSvTi48AYIE4wWVbKyHuQpm22mwx580fcwNYjpBYKayky1Kxe38
 hQ2r5qpkIPSU6DKZFLmMmyGrz/9iieRW7FaEyAQe7KV9ip9a0D45O7hBX w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="349442350"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="349442350"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:40 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="560304642"
Received: from rrsolima-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.130.212])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 08/15] ASoC: SOF: remove const qualifier for 'struct
 snd_sof_dsp_ops'
Date: Thu, 14 Apr 2022 13:48:10 -0500
Message-Id: <20220414184817.362215-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
References: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Rander Wang <rander.wang@intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Now that we start having multiple platforms with minor variants, the
use of the const qualifier for 'dsp_ops' is starting to be
sub-optimal: the structures are copied across platforms, with only a
couple of members that differ.

This patch removes the const qualifier without any functionality
changes, and adds an optional initialization callback. In follow-up
patches, the dsp_ops will revisited for Intel HDaudio platforms, with
the differences added programmatically over a common baseline.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/sof.h                    | 4 +++-
 sound/soc/sof/amd/acp.h                | 2 +-
 sound/soc/sof/amd/renoir.c             | 2 +-
 sound/soc/sof/core.c                   | 3 +++
 sound/soc/sof/debug.c                  | 2 +-
 sound/soc/sof/imx/imx8.c               | 4 ++--
 sound/soc/sof/imx/imx8m.c              | 2 +-
 sound/soc/sof/intel/apl.c              | 2 +-
 sound/soc/sof/intel/bdw.c              | 2 +-
 sound/soc/sof/intel/byt.c              | 4 ++--
 sound/soc/sof/intel/cnl.c              | 2 +-
 sound/soc/sof/intel/hda.h              | 8 ++++----
 sound/soc/sof/intel/icl.c              | 2 +-
 sound/soc/sof/intel/pci-tng.c          | 2 +-
 sound/soc/sof/intel/shim.h             | 2 +-
 sound/soc/sof/intel/tgl.c              | 2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 sound/soc/sof/ops.h                    | 6 ++++++
 sound/soc/sof/pcm.c                    | 2 +-
 19 files changed, 33 insertions(+), 22 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 96997650be65..1a82a0db5e7f 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -16,6 +16,7 @@
 #include <sound/soc-acpi.h>
 
 struct snd_sof_dsp_ops;
+struct snd_sof_dev;
 
 /**
  * enum sof_fw_state - DSP firmware state definitions
@@ -135,7 +136,8 @@ struct sof_dev_desc {
 	/* default firmware name */
 	const char *default_fw_filename[SOF_IPC_TYPE_COUNT];
 
-	const struct snd_sof_dsp_ops *ops;
+	struct snd_sof_dsp_ops *ops;
+	int (*ops_init)(struct snd_sof_dev *sdev);
 };
 
 int sof_dai_get_mclk(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 35e46fe6676a..ca69b4969ca2 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -204,7 +204,7 @@ int acp_pcm_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *substr
 		      struct snd_pcm_hw_params *params,
 		      struct snd_sof_platform_stream_params *platform_params);
 
-extern const struct snd_sof_dsp_ops sof_renoir_ops;
+extern struct snd_sof_dsp_ops sof_renoir_ops;
 
 /* Machine configuration */
 int snd_amd_acp_find_config(struct pci_dev *pci);
diff --git a/sound/soc/sof/amd/renoir.c b/sound/soc/sof/amd/renoir.c
index 409fd57448b8..73f639fa16a4 100644
--- a/sound/soc/sof/amd/renoir.c
+++ b/sound/soc/sof/amd/renoir.c
@@ -123,7 +123,7 @@ static struct snd_soc_acpi_mach *amd_sof_machine_select(struct snd_sof_dev *sdev
 }
 
 /* AMD Renoir DSP ops */
-const struct snd_sof_dsp_ops sof_renoir_ops = {
+struct snd_sof_dsp_ops sof_renoir_ops = {
 	/* probe and remove */
 	.probe			= amd_sof_acp_probe,
 	.remove			= amd_sof_acp_remove,
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index e91631618bff..27a98867f999 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -357,6 +357,9 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	sdev->first_boot = true;
 	dev_set_drvdata(dev, sdev);
 
+	/* init ops, if necessary */
+	sof_ops_init(sdev);
+
 	/* check all mandatory ops */
 	if (!sof_ops(sdev) || !sof_ops(sdev)->probe || !sof_ops(sdev)->run ||
 	    !sof_ops(sdev)->block_read || !sof_ops(sdev)->block_write ||
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 8a77245b5182..b59619ecfacf 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -331,7 +331,7 @@ EXPORT_SYMBOL_GPL(snd_sof_dbg_memory_info_init);
 
 int snd_sof_dbg_init(struct snd_sof_dev *sdev)
 {
-	const struct snd_sof_dsp_ops *ops = sof_ops(sdev);
+	struct snd_sof_dsp_ops *ops = sof_ops(sdev);
 	const struct snd_sof_debugfs_map *map;
 	int i;
 	int err;
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index db53be825384..d3a60c8e42cc 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -487,7 +487,7 @@ static int imx8_dsp_set_power_state(struct snd_sof_dev *sdev,
 }
 
 /* i.MX8 ops */
-static const struct snd_sof_dsp_ops sof_imx8_ops = {
+static struct snd_sof_dsp_ops sof_imx8_ops = {
 	/* probe and remove */
 	.probe		= imx8_probe,
 	.remove		= imx8_remove,
@@ -550,7 +550,7 @@ static const struct snd_sof_dsp_ops sof_imx8_ops = {
 };
 
 /* i.MX8X ops */
-static const struct snd_sof_dsp_ops sof_imx8x_ops = {
+static struct snd_sof_dsp_ops sof_imx8x_ops = {
 	/* probe and remove */
 	.probe		= imx8_probe,
 	.remove		= imx8_remove,
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 196ca7d7521f..8e9ae08dc7b0 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -412,7 +412,7 @@ static int imx8m_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state
 }
 
 /* i.MX8 ops */
-static const struct snd_sof_dsp_ops sof_imx8m_ops = {
+static struct snd_sof_dsp_ops sof_imx8m_ops = {
 	/* probe and remove */
 	.probe		= imx8m_probe,
 	.remove		= imx8m_remove,
diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 6721c8f95161..518d543591b5 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -26,7 +26,7 @@ static const struct snd_sof_debugfs_map apl_dsp_debugfs[] = {
 };
 
 /* apollolake ops */
-const struct snd_sof_dsp_ops sof_apl_ops = {
+struct snd_sof_dsp_ops sof_apl_ops = {
 	/* probe/remove/shutdown */
 	.probe		= hda_dsp_probe,
 	.remove		= hda_dsp_remove,
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index efdc9e6282f3..3449eeccd9e8 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -567,7 +567,7 @@ static struct snd_soc_dai_driver bdw_dai[] = {
 };
 
 /* broadwell ops */
-static const struct snd_sof_dsp_ops sof_bdw_ops = {
+static struct snd_sof_dsp_ops sof_bdw_ops = {
 	/*Device init */
 	.probe          = bdw_probe,
 
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 748d1452d4d8..3db125d82a1e 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -216,7 +216,7 @@ static int byt_acpi_probe(struct snd_sof_dev *sdev)
 }
 
 /* baytrail ops */
-static const struct snd_sof_dsp_ops sof_byt_ops = {
+static struct snd_sof_dsp_ops sof_byt_ops = {
 	/* device init */
 	.probe		= byt_acpi_probe,
 	.remove		= byt_remove,
@@ -298,7 +298,7 @@ static const struct sof_intel_dsp_desc byt_chip_info = {
 };
 
 /* cherrytrail and braswell ops */
-static const struct snd_sof_dsp_ops sof_cht_ops = {
+static struct snd_sof_dsp_ops sof_cht_ops = {
 	/* device init */
 	.probe		= byt_acpi_probe,
 	.remove		= byt_remove,
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 6a96470b967f..81fe490c7f77 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -244,7 +244,7 @@ void cnl_ipc_dump(struct snd_sof_dev *sdev)
 }
 
 /* cannonlake ops */
-const struct snd_sof_dsp_ops sof_cnl_ops = {
+struct snd_sof_dsp_ops sof_cnl_ops = {
 	/* probe/remove/shutdown */
 	.probe		= hda_dsp_probe,
 	.remove		= hda_dsp_remove,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 05e5e158614a..c7e248280527 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -687,10 +687,10 @@ extern struct snd_soc_dai_driver skl_dai[];
 /*
  * Platform Specific HW abstraction Ops.
  */
-extern const struct snd_sof_dsp_ops sof_apl_ops;
-extern const struct snd_sof_dsp_ops sof_cnl_ops;
-extern const struct snd_sof_dsp_ops sof_tgl_ops;
-extern const struct snd_sof_dsp_ops sof_icl_ops;
+extern struct snd_sof_dsp_ops sof_apl_ops;
+extern struct snd_sof_dsp_ops sof_cnl_ops;
+extern struct snd_sof_dsp_ops sof_tgl_ops;
+extern struct snd_sof_dsp_ops sof_icl_ops;
 
 extern const struct sof_intel_dsp_desc apl_chip_info;
 extern const struct sof_intel_dsp_desc cnl_chip_info;
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index b44a649bfc0b..da1e6dc4dc85 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -88,7 +88,7 @@ static int icl_dsp_post_fw_run(struct snd_sof_dev *sdev)
 }
 
 /* Icelake ops */
-const struct snd_sof_dsp_ops sof_icl_ops = {
+struct snd_sof_dsp_ops sof_icl_ops = {
 	/* probe/remove/shutdown */
 	.probe		= hda_dsp_probe,
 	.remove		= hda_dsp_remove,
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 38ce6fd838b5..ca313c7db47e 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -136,7 +136,7 @@ static int tangier_pci_probe(struct snd_sof_dev *sdev)
 	return ret;
 }
 
-const struct snd_sof_dsp_ops sof_tng_ops = {
+struct snd_sof_dsp_ops sof_tng_ops = {
 	/* device init */
 	.probe		= tangier_pci_probe,
 
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index f36cd9d5eb94..80c61a7cedf6 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -173,7 +173,7 @@ struct sof_intel_dsp_desc {
 	bool (*check_sdw_irq)(struct snd_sof_dev *sdev);
 };
 
-extern const struct snd_sof_dsp_ops sof_tng_ops;
+extern struct snd_sof_dsp_ops sof_tng_ops;
 
 extern const struct sof_intel_dsp_desc tng_chip_info;
 
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 72d92ff6cef5..2bb32bbce426 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -59,7 +59,7 @@ static int tgl_dsp_core_put(struct snd_sof_dev *sdev, int core)
 }
 
 /* Tigerlake ops */
-const struct snd_sof_dsp_ops sof_tgl_ops = {
+struct snd_sof_dsp_ops sof_tgl_ops = {
 	/* probe/remove/shutdown */
 	.probe		= hda_dsp_probe,
 	.remove		= hda_dsp_remove,
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 5085a3ac3da8..90ec7b14823b 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -393,7 +393,7 @@ static struct snd_soc_dai_driver mt8195_dai[] = {
 };
 
 /* mt8195 ops */
-static const struct snd_sof_dsp_ops sof_mt8195_ops = {
+static struct snd_sof_dsp_ops sof_mt8195_ops = {
 	/* probe and remove */
 	.probe		= mt8195_dsp_probe,
 	.remove		= mt8195_dsp_remove,
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index a19474663767..d866a96ba0d9 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -21,6 +21,12 @@
 #define sof_ops(sdev) \
 	((sdev)->pdata->desc->ops)
 
+static inline void sof_ops_init(struct snd_sof_dev *sdev)
+{
+	if (sdev->pdata->desc->ops_init)
+		sdev->pdata->desc->ops_init(sdev);
+}
+
 /* Mandatory operations are verified during probing */
 
 /* init */
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index b5cbc8b5c0ee..6242327e663e 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -393,7 +393,7 @@ static int sof_pcm_open(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	const struct snd_sof_dsp_ops *ops = sof_ops(sdev);
+	struct snd_sof_dsp_ops *ops = sof_ops(sdev);
 	struct snd_sof_pcm *spcm;
 	struct snd_soc_tplg_stream_caps *caps;
 	int ret;
-- 
2.30.2

