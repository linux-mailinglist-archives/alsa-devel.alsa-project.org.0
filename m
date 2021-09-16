Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA8940DA9F
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 15:04:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48A5D1898;
	Thu, 16 Sep 2021 15:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48A5D1898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631797483;
	bh=cCinfx/43p3RyL6PXl/dj7Igs3+y+rdq6KrOaaKxX8g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RwS3VhX7KEdW9Xu7U3Dyr2egL4HhoT4eYocSyLY/X61QUtEs/YbX+P1F7XCVLejvz
	 EEhSb1RNPHgUyUrfGOPeOshPoW9yx2sqsZowvxowuckgwHyr6pDZLyrg2Tu8BynKOS
	 VZh2wiRHMKO4BIJnRIZTVpwAMIcPgkEtSaxnmk80=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCDEAF800D3;
	Thu, 16 Sep 2021 15:03:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1ABFF8025E; Thu, 16 Sep 2021 15:03:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD664F80113
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 15:03:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD664F80113
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="222612149"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; 
 d="scan'208,223";a="222612149"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 06:03:12 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; 
 d="scan'208,223";a="471357572"
Received: from gkapusti-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.35.152])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 06:03:09 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: Rename sof_arch_ops to dsp_arch_ops
Date: Thu, 16 Sep 2021 16:03:08 +0300
Message-Id: <20210916130308.7969-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

From the name sof_arch_ops one can not decipher that these ops are DSP
architecture ops.
Rename it to dsp_arch_ops and change also the macro to retrieve the DSP
architecture specific ops as well.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c      |  4 ++--
 sound/soc/sof/imx/imx8m.c     |  2 +-
 sound/soc/sof/intel/apl.c     |  2 +-
 sound/soc/sof/intel/bdw.c     |  2 +-
 sound/soc/sof/intel/byt.c     |  4 ++--
 sound/soc/sof/intel/cnl.c     |  2 +-
 sound/soc/sof/intel/icl.c     |  2 +-
 sound/soc/sof/intel/pci-tng.c |  2 +-
 sound/soc/sof/intel/tgl.c     |  2 +-
 sound/soc/sof/sof-priv.h      | 14 +++++++-------
 sound/soc/sof/xtensa/core.c   |  2 +-
 11 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 12fedf0984bd..0a63ab026abb 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -441,7 +441,7 @@ struct snd_sof_dsp_ops sof_imx8_ops = {
 	.dbg_dump = imx8_dump,
 
 	/* Firmware ops */
-	.arch_ops = &sof_xtensa_arch_ops,
+	.dsp_arch_ops = &sof_xtensa_arch_ops,
 
 	/* DAI drivers */
 	.drv = imx8_dai,
@@ -490,7 +490,7 @@ struct snd_sof_dsp_ops sof_imx8x_ops = {
 	.dbg_dump = imx8_dump,
 
 	/* Firmware ops */
-	.arch_ops = &sof_xtensa_arch_ops,
+	.dsp_arch_ops = &sof_xtensa_arch_ops,
 
 	/* DAI drivers */
 	.drv = imx8_dai,
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index cb822d953767..5d3c05f32c37 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -293,7 +293,7 @@ struct snd_sof_dsp_ops sof_imx8m_ops = {
 	.dbg_dump = imx8_dump,
 
 	/* Firmware ops */
-	.arch_ops = &sof_xtensa_arch_ops,
+	.dsp_arch_ops = &sof_xtensa_arch_ops,
 
 	/* DAI drivers */
 	.drv = imx8m_dai,
diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index c7ed2b3d6abc..740a24052092 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -125,7 +125,7 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 
-	.arch_ops = &sof_xtensa_arch_ops,
+	.dsp_arch_ops = &sof_xtensa_arch_ops,
 };
 EXPORT_SYMBOL_NS(sof_apl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
 
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 89a6c1f04a55..6aaefd4e1ddc 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -657,7 +657,7 @@ static const struct snd_sof_dsp_ops sof_bdw_ops = {
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_BATCH,
 
-	.arch_ops = &sof_xtensa_arch_ops,
+	.dsp_arch_ops = &sof_xtensa_arch_ops,
 };
 
 static const struct sof_intel_dsp_desc bdw_chip_info = {
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 8edaf6fdd218..1b180f00c90a 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -275,7 +275,7 @@ static const struct snd_sof_dsp_ops sof_byt_ops = {
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_BATCH,
 
-	.arch_ops = &sof_xtensa_arch_ops,
+	.dsp_arch_ops = &sof_xtensa_arch_ops,
 };
 
 static const struct sof_intel_dsp_desc byt_chip_info = {
@@ -353,7 +353,7 @@ static const struct snd_sof_dsp_ops sof_cht_ops = {
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_BATCH,
 
-	.arch_ops = &sof_xtensa_arch_ops,
+	.dsp_arch_ops = &sof_xtensa_arch_ops,
 };
 
 static const struct sof_intel_dsp_desc cht_chip_info = {
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index e115e12a856f..00fcead5d5e4 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -330,7 +330,7 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 
-	.arch_ops = &sof_xtensa_arch_ops,
+	.dsp_arch_ops = &sof_xtensa_arch_ops,
 };
 EXPORT_SYMBOL_NS(sof_cnl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
 
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index ee095b8f2d01..5b18d81b6791 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -125,7 +125,7 @@ const struct snd_sof_dsp_ops sof_icl_ops = {
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 
-	.arch_ops = &sof_xtensa_arch_ops,
+	.dsp_arch_ops = &sof_xtensa_arch_ops,
 };
 EXPORT_SYMBOL_NS(sof_icl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
 
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 4bded668b672..31a0f4cf06b4 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -187,7 +187,7 @@ const struct snd_sof_dsp_ops sof_tng_ops = {
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_BATCH,
 
-	.arch_ops = &sof_xtensa_arch_ops,
+	.dsp_arch_ops = &sof_xtensa_arch_ops,
 };
 
 const struct sof_intel_dsp_desc tng_chip_info = {
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 199d41a7dc9b..273207e6e71b 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -120,7 +120,7 @@ const struct snd_sof_dsp_ops sof_tgl_ops = {
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 
-	.arch_ops = &sof_xtensa_arch_ops,
+	.dsp_arch_ops = &sof_xtensa_arch_ops,
 };
 EXPORT_SYMBOL_NS(sof_tgl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index fd8423172d8f..cc3d26c28c2b 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -268,17 +268,17 @@ struct snd_sof_dsp_ops {
 	/* ALSA HW info flags, will be stored in snd_pcm_runtime.hw.info */
 	u32 hw_info;
 
-	const struct sof_arch_ops *arch_ops;
+	const struct dsp_arch_ops *dsp_arch_ops;
 };
 
 /* DSP architecture specific callbacks for oops and stack dumps */
-struct sof_arch_ops {
+struct dsp_arch_ops {
 	void (*dsp_oops)(struct snd_sof_dev *sdev, void *oops);
 	void (*dsp_stack)(struct snd_sof_dev *sdev, void *oops,
 			  u32 *stack, u32 stack_words);
 };
 
-#define sof_arch_ops(sdev) ((sdev)->pdata->desc->ops->arch_ops)
+#define sof_dsp_arch_ops(sdev) ((sdev)->pdata->desc->ops->dsp_arch_ops)
 
 /* DSP device HW descriptor mapping between bus ID and ops */
 struct sof_ops_table {
@@ -551,16 +551,16 @@ extern struct snd_compress_ops sof_compressed_ops;
 static inline void sof_stack(struct snd_sof_dev *sdev, void *oops, u32 *stack,
 			     u32 stack_words)
 {
-		sof_arch_ops(sdev)->dsp_stack(sdev, oops, stack, stack_words);
+		sof_dsp_arch_ops(sdev)->dsp_stack(sdev, oops, stack, stack_words);
 }
 
 static inline void sof_oops(struct snd_sof_dev *sdev, void *oops)
 {
-	if (sof_arch_ops(sdev)->dsp_oops)
-		sof_arch_ops(sdev)->dsp_oops(sdev, oops);
+	if (sof_dsp_arch_ops(sdev)->dsp_oops)
+		sof_dsp_arch_ops(sdev)->dsp_oops(sdev, oops);
 }
 
-extern const struct sof_arch_ops sof_xtensa_arch_ops;
+extern const struct dsp_arch_ops sof_xtensa_arch_ops;
 
 /*
  * Utilities
diff --git a/sound/soc/sof/xtensa/core.c b/sound/soc/sof/xtensa/core.c
index bbb9a2282ed9..85f1eb1d20d2 100644
--- a/sound/soc/sof/xtensa/core.c
+++ b/sound/soc/sof/xtensa/core.c
@@ -128,7 +128,7 @@ static void xtensa_stack(struct snd_sof_dev *sdev, void *oops, u32 *stack,
 	}
 }
 
-const struct sof_arch_ops sof_xtensa_arch_ops = {
+const struct dsp_arch_ops sof_xtensa_arch_ops = {
 	.dsp_oops = xtensa_dsp_oops,
 	.dsp_stack = xtensa_stack,
 };
-- 
2.33.0

