Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1B054A824
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 06:28:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B95B18D6;
	Tue, 14 Jun 2022 06:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B95B18D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655180899;
	bh=usgtQlCLCPgZsvOAMeL9AbCf6wQR4AqkoaWpO8MMqxI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Efk7a3NoMPEQOLJvcKrhe+vJ5eHhGjCsSS+A0MyVMQkSqSTl1phtb+8QeXc+u7qBL
	 0HvmL+ZLSTemll3wp7xttvlR40BIjN9c5dsBD8h5A8dYpIsYH1txtRPUmbmQ1qlcjX
	 J7UTZIKlPtRKllocQq2cxaFFGtyOaPrNr1VBKnQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6735AF8053D;
	Tue, 14 Jun 2022 06:26:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BC54F8051E; Tue, 14 Jun 2022 06:26:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5E79F8051E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 06:25:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5E79F8051E
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A127220271B;
 Tue, 14 Jun 2022 06:25:37 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1A704202718;
 Tue, 14 Jun 2022 06:25:37 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 33D9B180219B;
 Tue, 14 Jun 2022 12:25:35 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 7/7] ASoC: fsl_sai: Configure dataline/FIFO information from
 dts property
Date: Tue, 14 Jun 2022 12:11:24 +0800
Message-Id: <1655179884-12278-8-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1655179884-12278-1-git-send-email-shengjiu.wang@nxp.com>
References: <1655179884-12278-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

The SAI has multiple successive FIFO registers, but in some use
case the required dataline/FIFOs are not successive, so need
get such information from dts property "fsl,dataline"

fsl,dataline has 3 values for each configuration:
first one means the type: I2S(1) or DSD(2),
second one is dataline mask for 'rx',
third one is dataline mask for 'tx'.

Also set dma peripheral address and TRCE bits according to data lane.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 161 +++++++++++++++++++++++++++++++++++++++-
 sound/soc/fsl/fsl_sai.h |  17 +++++
 2 files changed, 174 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 86aa0baba848..f5eabb0b10e8 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -487,13 +487,18 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	unsigned int ofs = sai->soc_data->reg_offset;
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	unsigned int channels = params_channels(params);
+	struct snd_dmaengine_dai_dma_data *dma_params;
+	struct fsl_sai_dl_cfg *dl_cfg = sai->dl_cfg;
 	u32 word_width = params_width(params);
+	int trce_mask = 0, dl_cfg_idx = 0;
+	int dl_cfg_cnt = sai->dl_cfg_cnt;
+	u32 dl_type = FSL_SAI_DL_I2S;
 	u32 val_cr4 = 0, val_cr5 = 0;
 	u32 slots = (channels == 1) ? 2 : channels;
 	u32 slot_width = word_width;
 	int adir = tx ? RX : TX;
 	u32 pins, bclk;
-	int ret;
+	int ret, i;
 
 	if (sai->slots)
 		slots = sai->slots;
@@ -507,8 +512,22 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	 * PDM mode, channels are independent
 	 * each channels are on one dataline/FIFO.
 	 */
-	if (sai->is_pdm_mode)
+	if (sai->is_pdm_mode) {
 		pins = channels;
+		dl_type = FSL_SAI_DL_PDM;
+	}
+
+	for (i = 0; i < dl_cfg_cnt; i++) {
+		if (dl_cfg[i].type == dl_type && dl_cfg[i].pins[tx] == pins) {
+			dl_cfg_idx = i;
+			break;
+		}
+	}
+
+	if (hweight8(dl_cfg[dl_cfg_idx].mask[tx]) < pins) {
+		dev_err(cpu_dai->dev, "channel not supported\n");
+		return -EINVAL;
+	}
 
 	bclk = params_rate(params) * (sai->bclk_ratio ? sai->bclk_ratio : slots * slot_width);
 
@@ -571,13 +590,28 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 				   FSL_SAI_CR5_FBT_MASK, val_cr5);
 	}
 
-	if (sai->soc_data->pins > 1)
+	if (hweight8(dl_cfg[dl_cfg_idx].mask[tx]) <= 1)
+		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
+				   FSL_SAI_CR4_FCOMB_MASK, 0);
+	else
 		regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
 				   FSL_SAI_CR4_FCOMB_MASK, FSL_SAI_CR4_FCOMB_SOFT);
 
+	dma_params = tx ? &sai->dma_params_tx : &sai->dma_params_rx;
+	dma_params->addr = sai->res->start + FSL_SAI_xDR0(tx) +
+			   dl_cfg[dl_cfg_idx].start_off[tx] * 0x4;
+
+	/* Find a proper tcre setting */
+	for (i = 0; i < sai->soc_data->pins; i++) {
+		trce_mask = (1 << (i + 1)) - 1;
+		if (hweight8(dl_cfg[dl_cfg_idx].mask[tx] & trce_mask) == pins)
+			break;
+	}
+
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx, ofs),
 			   FSL_SAI_CR3_TRCE_MASK,
-			   FSL_SAI_CR3_TRCE((1 << pins) - 1));
+			   FSL_SAI_CR3_TRCE((dl_cfg[dl_cfg_idx].mask[tx] & trce_mask)));
+
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
 			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
 			   FSL_SAI_CR4_CHMOD_MASK,
@@ -1068,6 +1102,118 @@ static int fsl_sai_check_version(struct device *dev)
 	return 0;
 }
 
+/*
+ * Calculate the offset between first two datalines, don't
+ * different offset in one case.
+ */
+static unsigned int fsl_sai_calc_dl_off(unsigned long dl_mask)
+{
+	int fbidx, nbidx, offset;
+
+	fbidx = find_first_bit(&dl_mask, FSL_SAI_DL_NUM);
+	nbidx = find_next_bit(&dl_mask, FSL_SAI_DL_NUM, fbidx + 1);
+	offset = nbidx - fbidx - 1;
+
+	return (offset < 0 || offset >= (FSL_SAI_DL_NUM - 1) ? 0 : offset);
+}
+
+/*
+ * read the fsl,dataline property from dts file.
+ * It has 3 value for each configuration, first one means the type:
+ * I2S(1) or PDM(2), second one is dataline mask for 'rx', third one is
+ * dataline mask for 'tx'. for example
+ *
+ * fsl,dataline = <1 0xff 0xff 2 0xff 0x11>,
+ *
+ * It means I2S type rx mask is 0xff, tx mask is 0xff, PDM type
+ * rx mask is 0xff, tx mask is 0x11 (dataline 1 and 4 enabled).
+ *
+ */
+static int fsl_sai_read_dlcfg(struct fsl_sai *sai)
+{
+	struct platform_device *pdev = sai->pdev;
+	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	int ret, elems, i, index, num_cfg;
+	char *propname = "fsl,dataline";
+	struct fsl_sai_dl_cfg *cfg;
+	unsigned long dl_mask;
+	unsigned int soc_dl;
+	u32 rx, tx, type;
+
+	elems = of_property_count_u32_elems(np, propname);
+
+	if (elems <= 0) {
+		elems = 0;
+	} else if (elems % 3) {
+		dev_err(dev, "Number of elements must be divisible to 3.\n");
+		return -EINVAL;
+	}
+
+	num_cfg = elems / 3;
+	/*  Add one more for default value */
+	cfg = devm_kzalloc(&pdev->dev, (num_cfg + 1) * sizeof(*cfg), GFP_KERNEL);
+	if (!cfg)
+		return -ENOMEM;
+
+	/* Consider default value "0 0xFF 0xFF" if property is missing */
+	soc_dl = BIT(sai->soc_data->pins) - 1;
+	cfg[0].type = FSL_SAI_DL_DEFAULT;
+	cfg[0].pins[0] = sai->soc_data->pins;
+	cfg[0].mask[0] = soc_dl;
+	cfg[0].start_off[0] = 0;
+	cfg[0].next_off[0] = 0;
+
+	cfg[0].pins[1] = sai->soc_data->pins;
+	cfg[0].mask[1] = soc_dl;
+	cfg[0].start_off[1] = 0;
+	cfg[0].next_off[1] = 0;
+	for (i = 1, index = 0; i < num_cfg + 1; i++) {
+		/*
+		 * type of dataline
+		 * 0 means default mode
+		 * 1 means I2S mode
+		 * 2 means PDM mode
+		 */
+		ret = of_property_read_u32_index(np, propname, index++, &type);
+		if (ret)
+			return -EINVAL;
+
+		ret = of_property_read_u32_index(np, propname, index++, &rx);
+		if (ret)
+			return -EINVAL;
+
+		ret = of_property_read_u32_index(np, propname, index++, &tx);
+		if (ret)
+			return -EINVAL;
+
+		if ((rx & ~soc_dl) || (tx & ~soc_dl)) {
+			dev_err(dev, "dataline cfg[%d] setting error, mask is 0x%x\n", i, soc_dl);
+			return -EINVAL;
+		}
+
+		rx = rx & soc_dl;
+		tx = tx & soc_dl;
+
+		cfg[i].type = type;
+		cfg[i].pins[0] = hweight8(rx);
+		cfg[i].mask[0] = rx;
+		dl_mask = rx;
+		cfg[i].start_off[0] = find_first_bit(&dl_mask, FSL_SAI_DL_NUM);
+		cfg[i].next_off[0] = fsl_sai_calc_dl_off(rx);
+
+		cfg[i].pins[1] = hweight8(tx);
+		cfg[i].mask[1] = tx;
+		dl_mask = tx;
+		cfg[i].start_off[1] = find_first_bit(&dl_mask, FSL_SAI_DL_NUM);
+		cfg[i].next_off[1] = fsl_sai_calc_dl_off(tx);
+	}
+
+	sai->dl_cfg = cfg;
+	sai->dl_cfg_cnt = num_cfg + 1;
+	return 0;
+}
+
 static int fsl_sai_runtime_suspend(struct device *dev);
 static int fsl_sai_runtime_resume(struct device *dev);
 
@@ -1134,6 +1280,13 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	else
 		sai->mclk_clk[0] = sai->bus_clk;
 
+	/* read dataline mask for rx and tx*/
+	ret = fsl_sai_read_dlcfg(sai);
+	if (ret < 0) {
+		dev_err(dev, "failed to read dlcfg %d\n", ret);
+		return ret;
+	}
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 4d657edc9c9f..9bb8ced520c8 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -218,6 +218,13 @@
 
 #define PMQOS_CPU_LATENCY   BIT(0)
 
+/* Max number of dataline */
+#define FSL_SAI_DL_NUM		(8)
+/* default dataline type is zero */
+#define FSL_SAI_DL_DEFAULT	(0)
+#define FSL_SAI_DL_I2S		BIT(0)
+#define FSL_SAI_DL_PDM		BIT(1)
+
 struct fsl_sai_soc_data {
 	bool use_imx_pcm;
 	bool use_edma;
@@ -253,6 +260,14 @@ struct fsl_sai_param {
 	u32 dataline;
 };
 
+struct fsl_sai_dl_cfg {
+	unsigned int type;
+	unsigned int pins[2];
+	unsigned int mask[2];
+	unsigned int start_off[2];
+	unsigned int next_off[2];
+};
+
 struct fsl_sai {
 	struct platform_device *pdev;
 	struct regmap *regmap;
@@ -265,6 +280,8 @@ struct fsl_sai {
 	bool is_dsp_mode;
 	bool is_pdm_mode;
 	bool synchronous[2];
+	struct fsl_sai_dl_cfg *dl_cfg;
+	unsigned int dl_cfg_cnt;
 
 	unsigned int mclk_id[2];
 	unsigned int mclk_streams;
-- 
2.17.1

