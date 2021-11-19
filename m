Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C36457718
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 20:37:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5D471798;
	Fri, 19 Nov 2021 20:36:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5D471798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637350624;
	bh=v03QF3HlbuCfhE+eaPC9/FuV7O0Qu4/CgV1tybo/5xk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dZBBpMfNoGW0eDHClm5sAr4FsGjF8bzrhDyiglcVOyhr4bc5mPsIDeXj9yheFSroc
	 AQ/FRfJ+XkgFLFivbGEat4eNiPJrqj0CQvEneD+OkfzaQwFuiWOfwwOEwwCdUEUO0r
	 M0rUk5Mgs41o+R9b8D5fMqjUbvtQz5qr0ovak/pw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BE1BF804FF;
	Fri, 19 Nov 2021 20:34:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBB1AF80217; Fri, 19 Nov 2021 20:34:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06FF1F8012E
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 20:34:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06FF1F8012E
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="215192460"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="215192460"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 11:34:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="473651136"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 19 Nov 2021 11:34:06 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 02/10] ASoC: SOF: Introduce num_cores and ref count per core
Date: Fri, 19 Nov 2021 21:26:13 +0200
Message-Id: <20211119192621.4096077-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211119192621.4096077-1-kai.vehmanen@linux.intel.com>
References: <20211119192621.4096077-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add two fields num_cores and dsp_cores_ref_count to
struct snd_sof_dev. These will be used to maintain the
ref count for each core to determine when it should be
powered up or down.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c      |  1 +
 sound/soc/sof/imx/imx8m.c     |  1 +
 sound/soc/sof/intel/bdw.c     |  9 +++++++++
 sound/soc/sof/intel/byt.c     |  9 +++++++++
 sound/soc/sof/intel/hda.c     |  2 ++
 sound/soc/sof/intel/pci-tng.c |  9 +++++++++
 sound/soc/sof/sof-priv.h      | 15 +++++++++++++++
 7 files changed, 46 insertions(+)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 0aeb44d0acc7..2d0448b3c8c3 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -188,6 +188,7 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	if (!priv)
 		return -ENOMEM;
 
+	sdev->num_cores = 1;
 	sdev->pdata->hw_pdata = priv;
 	priv->dev = sdev->dev;
 	priv->sdev = sdev;
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index f454a5d0a87e..c94422323d67 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -108,6 +108,7 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 	if (!priv)
 		return -ENOMEM;
 
+	sdev->num_cores = 1;
 	sdev->pdata->hw_pdata = priv;
 	priv->dev = sdev->dev;
 	priv->sdev = sdev;
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 156006bed017..1a8a39a878fd 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -412,10 +412,19 @@ static int bdw_probe(struct snd_sof_dev *sdev)
 	const struct sof_dev_desc *desc = pdata->desc;
 	struct platform_device *pdev =
 		container_of(sdev->dev, struct platform_device, dev);
+	const struct sof_intel_dsp_desc *chip;
 	struct resource *mmio;
 	u32 base, size;
 	int ret;
 
+	chip = get_chip_info(sdev->pdata);
+	if (!chip) {
+		dev_err(sdev->dev, "error: no such device supported\n");
+		return -EIO;
+	}
+
+	sdev->num_cores = chip->cores_num;
+
 	/* LPE base */
 	mmio = platform_get_resource(pdev, IORESOURCE_MEM,
 				     desc->resindex_lpe_base);
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index e2fa08f1ae74..dcfeaedb8fd5 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -113,10 +113,19 @@ static int byt_acpi_probe(struct snd_sof_dev *sdev)
 	const struct sof_dev_desc *desc = pdata->desc;
 	struct platform_device *pdev =
 		container_of(sdev->dev, struct platform_device, dev);
+	const struct sof_intel_dsp_desc *chip;
 	struct resource *mmio;
 	u32 base, size;
 	int ret;
 
+	chip = get_chip_info(sdev->pdata);
+	if (!chip) {
+		dev_err(sdev->dev, "error: no such device supported\n");
+		return -EIO;
+	}
+
+	sdev->num_cores = chip->cores_num;
+
 	/* DSP DMA can only access low 31 bits of host memory */
 	ret = dma_coerce_mask_and_coherent(sdev->dev, DMA_BIT_MASK(31));
 	if (ret < 0) {
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 1ebf8db488b8..3c69e8fcd43b 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -897,6 +897,8 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 		goto err;
 	}
 
+	sdev->num_cores = chip->cores_num;
+
 	hdev = devm_kzalloc(sdev->dev, sizeof(*hdev), GFP_KERNEL);
 	if (!hdev)
 		return -ENOMEM;
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 18eb41b8a8f4..f8c841caa362 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -55,9 +55,18 @@ static int tangier_pci_probe(struct snd_sof_dev *sdev)
 	struct snd_sof_pdata *pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = pdata->desc;
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
+	const struct sof_intel_dsp_desc *chip;
 	u32 base, size;
 	int ret;
 
+	chip = get_chip_info(sdev->pdata);
+	if (!chip) {
+		dev_err(sdev->dev, "error: no such device supported\n");
+		return -EIO;
+	}
+
+	sdev->num_cores = chip->cores_num;
+
 	/* DSP DMA can only access low 31 bits of host memory */
 	ret = dma_coerce_mask_and_coherent(&pci->dev, DMA_BIT_MASK(31));
 	if (ret < 0) {
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 9a8af76b2f8b..a56f3c8b483f 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -71,6 +71,9 @@ extern int sof_core_debug;
 /* So far the primary core on all DSPs has ID 0 */
 #define SOF_DSP_PRIMARY_CORE 0
 
+/* max number of DSP cores */
+#define SOF_MAX_DSP_NUM_CORES 8
+
 /* DSP power state */
 enum sof_dsp_power_states {
 	SOF_DSP_PM_D0,
@@ -477,6 +480,18 @@ struct snd_sof_dev {
 
 	bool msi_enabled;
 
+	/* DSP core context */
+	u32 num_cores;
+
+	/*
+	 * ref count per core that will be modified during system suspend/resume and during pcm
+	 * hw_params/hw_free. This doesn't need to be protected with a mutex because pcm
+	 * hw_params/hw_free are already protected by the PCM mutex in the ALSA framework in
+	 * sound/core/ when streams are active and during system suspend/resume, streams are
+	 * already suspended.
+	 */
+	int dsp_core_ref_count[SOF_MAX_DSP_NUM_CORES];
+
 	void *private;			/* core does not touch this */
 };
 
-- 
2.33.0

