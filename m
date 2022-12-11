Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9EF649207
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Dec 2022 03:42:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B856816A3;
	Sun, 11 Dec 2022 03:41:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B856816A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670726567;
	bh=I4aV6ixluhb8VJsXr54M8dY9ZdWG308tyqtgOnT24Nc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dqfImcqoQfucr9RYOc1kDsr8KULastPXdKaH5y5Wa4F37UB4jrL6VXz8gBrVUZ5mW
	 k2c8wobd5btLeG4nVbdVsBTIpal1wUfhF8heuU8C+k9jm8YIFCkJNL6I+tG70Udewk
	 Wah5xM5VTaeyjD7n2LhNFNs//mWbl2zcmPGMMU54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9538F8051A;
	Sun, 11 Dec 2022 03:41:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A78EF804FD; Sun, 11 Dec 2022 03:41:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA5D8F80165
 for <alsa-devel@alsa-project.org>; Sun, 11 Dec 2022 03:41:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA5D8F80165
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=rIk0uC3v
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7C15A8530B;
 Sun, 11 Dec 2022 03:41:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670726481;
 bh=PNu6jqHN6qEN9gYhRtRyOcZqjLp2EChJvb5xy2DKSGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rIk0uC3v0dkVsUux5qKnCAw2NFxN2ZY/2yzfx4Ax2LK+E1eQqek3pAVSN1wvD4snr
 qlXgy17dG11aLIOwZglhMTiGN8wM0C67qj+hFcneoX3F9OTQgoNW4JOI87iXxfNcA4
 2rP2SPXZWSdUoPAulC2synrvtKLO8DSLTVnnKj3NVICwry+gEd1xPHIOxoPoGfh6I2
 QGSyN3FqVrnv21LTYfNDWURJxplaJNcX6wxHRCAYxeIbvTwtf+Rg73n5JJaNPoSpkB
 aXgj6HnLK7Bqf3hmHx+f32LHEm2UpLNME25nMhg1bafYFnUTd9HVNe51uJgU0a6YdO
 umRZNhk24CDIA==
From: Marek Vasut <marex@denx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: fsl_sai: Export transmitter MCLK as clock
Date: Sun, 11 Dec 2022 03:41:09 +0100
Message-Id: <20221211024109.671538-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221211024109.671538-1-marex@denx.de>
References: <20221211024109.671538-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Marek Vasut <marex@denx.de>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

For SAI to generate MCLK on external SoC pad, the transmitter must be
enabled as well. With transmitter disabled, no clock are generated.
Enable the transmitter using the TERE bit.

Rather than doing ad-hoc enablement of the TERE bit, convert the mclk
handling into a clock provider and adjust the SAI driver points which
modify the TERE bit to instead enable and disable the clock. Register
two clock, mclk_tx and mclk_rx, each representing TCSR and RCSR TERE
bit respectively. Expose only the mclk_tx, since it does not really
matter which TERE bit is enabled for the generation of output MCLK,
but it does matter which TERE bit is enabled for internal operation
of the SAI.

As a nice bonus, this simplifies the MCLK handling in the driver itself.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
To: alsa-devel@alsa-project.org
---
 sound/soc/fsl/fsl_sai.c | 226 ++++++++++++++++++++++++++++++----------
 sound/soc/fsl/fsl_sai.h |   3 +
 2 files changed, 176 insertions(+), 53 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index ade5a6b44b66a..944450ba19b62 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -185,34 +185,9 @@ static int fsl_sai_set_dai_bclk_ratio(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static int fsl_sai_set_dai_sysclk_tr(struct snd_soc_dai *cpu_dai,
-		int clk_id, unsigned int freq, bool tx)
+static int fsl_sai_set_dai_sysclk_tr(struct fsl_sai *sai, int clk_id, bool tx)
 {
-	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned int ofs = sai->soc_data->reg_offset;
-	u32 val_cr2 = 0;
-
-	switch (clk_id) {
-	case FSL_SAI_CLK_BUS:
-		val_cr2 |= FSL_SAI_CR2_MSEL_BUS;
-		break;
-	case FSL_SAI_CLK_MAST1:
-		val_cr2 |= FSL_SAI_CR2_MSEL_MCLK1;
-		break;
-	case FSL_SAI_CLK_MAST2:
-		val_cr2 |= FSL_SAI_CR2_MSEL_MCLK2;
-		break;
-	case FSL_SAI_CLK_MAST3:
-		val_cr2 |= FSL_SAI_CR2_MSEL_MCLK3;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
-			   FSL_SAI_CR2_MSEL_MASK, val_cr2);
-
-	return 0;
+	return clk_set_parent(sai->mclk_clk_out[tx], sai->mclk_clk[clk_id]);
 }
 
 static int fsl_sai_set_mclk_rate(struct snd_soc_dai *dai, int clk_id, unsigned int freq)
@@ -257,13 +232,13 @@ static int fsl_sai_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 		}
 	}
 
-	ret = fsl_sai_set_dai_sysclk_tr(cpu_dai, clk_id, freq, true);
+	ret = fsl_sai_set_dai_sysclk_tr(sai, clk_id, true);
 	if (ret) {
 		dev_err(cpu_dai->dev, "Cannot set tx sysclk: %d\n", ret);
 		return ret;
 	}
 
-	ret = fsl_sai_set_dai_sysclk_tr(cpu_dai, clk_id, freq, false);
+	ret = fsl_sai_set_dai_sysclk_tr(sai, clk_id, false);
 	if (ret)
 		dev_err(cpu_dai->dev, "Cannot set rx sysclk: %d\n", ret);
 
@@ -487,8 +462,7 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	else
 		return 0;
 
-	regmap_update_bits(sai->regmap, reg, FSL_SAI_CR2_MSEL_MASK,
-			   FSL_SAI_CR2_MSEL(sai->mclk_id[tx]));
+	fsl_sai_set_dai_sysclk_tr(sai, sai->mclk_id[tx], tx);
 
 	if (savediv == 1)
 		regmap_update_bits(sai->regmap, reg,
@@ -707,32 +681,41 @@ static int fsl_sai_hw_free(struct snd_pcm_substream *substream,
 static void fsl_sai_reset(struct fsl_sai *sai, bool rx, bool tx)
 {
 	unsigned int ofs = sai->soc_data->reg_offset;
+	bool tx_keep_tere = false, rx_keep_tere = false;
+	u32 tcsr = 0, rcsr = 0;
+
+	if (sai->mclk_clk_out[0])
+		rx_keep_tere = clk_hw_is_enabled(&(sai->mclk_clk_hw[0]));
+	if (sai->mclk_clk_out[1])
+		tx_keep_tere = clk_hw_is_enabled(&(sai->mclk_clk_hw[1]));
+
+	if (rx_keep_tere) {
+		regmap_read(sai->regmap, FSL_SAI_RCSR(ofs), &rcsr);
+		rcsr &= FSL_SAI_CSR_TERE;
+	}
+
+	if (tx_keep_tere) {
+		regmap_read(sai->regmap, FSL_SAI_TCSR(ofs), &tcsr);
+		tcsr &= FSL_SAI_CSR_TERE;
+	}
 
 	if (tx)
-		regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR);
+		regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR | tcsr);
 	if (rx)
-		regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR);
+		regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR | rcsr);
 	usleep_range(1000, 2000);
 	if (tx)
-		regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
+		regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), tcsr);
 	if (rx)
-		regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
+		regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), rcsr);
 }
 
 static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
 {
 	unsigned int ofs = sai->soc_data->reg_offset;
 	bool tx = dir == TX;
-	u32 xcsr, count = 100;
 
-	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
-			   FSL_SAI_CSR_TERE, 0);
-
-	/* TERE will remain set till the end of current frame */
-	do {
-		udelay(10);
-		regmap_read(sai->regmap, FSL_SAI_xCSR(tx, ofs), &xcsr);
-	} while (--count && xcsr & FSL_SAI_CSR_TERE);
+	clk_disable_unprepare(sai->mclk_clk_out[tx]);
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 			   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
@@ -780,8 +763,7 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_FRDE, FSL_SAI_CSR_FRDE);
 
-		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
-				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
+		clk_prepare_enable(sai->mclk_clk_out[tx]);
 		/*
 		 * Enable the opposite direction for synchronous mode
 		 * 1. Tx sync with Rx: only set RE for Rx; set TE & RE for Tx
@@ -794,8 +776,7 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 		 * be safe to do, judging by years of testing results.
 		 */
 		if (fsl_sai_dir_is_synced(sai, adir))
-			regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
-					   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
+			clk_prepare_enable(sai->mclk_clk_out[!tx]);
 
 		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_xIE_MASK, FSL_SAI_FLAGS);
@@ -1281,6 +1262,86 @@ static int fsl_sai_read_dlcfg(struct fsl_sai *sai)
 	return 0;
 }
 
+static struct fsl_sai *mclk_get_clk_hw_to_sai(struct clk_hw *hw, bool *tx)
+{
+	*tx = !strcmp(clk_hw_get_name(hw), "mclk_tx");
+
+	return container_of(hw, struct fsl_sai, mclk_clk_hw[*tx]);
+}
+
+static int mclk_gate_enable(struct clk_hw *hw)
+{
+	bool tx;
+	struct fsl_sai *sai = mclk_get_clk_hw_to_sai(hw, &tx);
+	unsigned int ofs = sai->soc_data->reg_offset;
+
+	pm_runtime_get_sync(&sai->pdev->dev);
+
+	/* Transmitter must be enabled to generate MCLK on pad */
+	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
+			   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
+
+	return 0;
+}
+
+static void mclk_gate_disable(struct clk_hw *hw)
+{
+	bool tx;
+	struct fsl_sai *sai = mclk_get_clk_hw_to_sai(hw, &tx);
+	unsigned int ofs = sai->soc_data->reg_offset;
+	u32 xcsr, count = 100;
+
+	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_TERE, 0);
+
+	/* TERE will remain set till the end of current frame */
+	do {
+		udelay(10);
+		regmap_read(sai->regmap, FSL_SAI_xCSR(tx, ofs), &xcsr);
+	} while (--count && xcsr & FSL_SAI_CSR_TERE);
+
+	pm_runtime_put_sync(&sai->pdev->dev);
+}
+
+static int mclk_gate_is_enabled(struct clk_hw *hw)
+{
+	bool tx;
+	struct fsl_sai *sai = mclk_get_clk_hw_to_sai(hw, &tx);
+	unsigned int ofs = sai->soc_data->reg_offset;
+	u32 xcsr;
+
+	regmap_read(sai->regmap, FSL_SAI_xCSR(tx, ofs), &xcsr);
+
+	return !!(xcsr & FSL_SAI_CSR_TERE);
+}
+
+static u8 mclk_gate_get_parent(struct clk_hw *hw)
+{
+	bool tx;
+	struct fsl_sai *sai = mclk_get_clk_hw_to_sai(hw, &tx);
+
+	return sai->mclk_id[tx];
+}
+
+static int mclk_gate_set_parent(struct clk_hw *hw, u8 index)
+{
+	bool tx;
+	struct fsl_sai *sai = mclk_get_clk_hw_to_sai(hw, &tx);
+	unsigned int ofs = sai->soc_data->reg_offset;
+
+	regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
+			   FSL_SAI_CR2_MSEL_MASK, FSL_SAI_CR2_MSEL(index));
+
+	return 0;
+}
+
+const struct clk_ops mclk_gate_ops = {
+	.enable		= mclk_gate_enable,
+	.disable	= mclk_gate_disable,
+	.is_enabled	= mclk_gate_is_enabled,
+	.get_parent	= mclk_gate_get_parent,
+	.set_parent	= mclk_gate_set_parent,
+};
+
 static int fsl_sai_runtime_suspend(struct device *dev);
 static int fsl_sai_runtime_resume(struct device *dev);
 
@@ -1295,6 +1356,13 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	int irq, ret, i;
 	int index;
 	u32 dmas[4];
+	const char *mclk_parent_names[FSL_SAI_MCLK_MAX];
+	const char *mclk_rxtx_names[2] = { "mclk_rx", "mclk_tx" };
+	struct clk_init_data mclk_init = {
+		.ops		= &mclk_gate_ops,
+		.parent_names	= mclk_parent_names,
+		.num_parents	= FSL_SAI_MCLK_MAX,
+	};
 
 	sai = devm_kzalloc(dev, sizeof(*sai), GFP_KERNEL);
 	if (!sai)
@@ -1341,12 +1409,14 @@ static int fsl_sai_probe(struct platform_device *pdev)
 					i, PTR_ERR(sai->mclk_clk[i]));
 			sai->mclk_clk[i] = NULL;
 		}
+		mclk_parent_names[i] = __clk_get_name(sai->mclk_clk[i]);
 	}
 
 	if (sai->soc_data->mclk0_is_mclk1)
 		sai->mclk_clk[0] = sai->mclk_clk[1];
 	else
 		sai->mclk_clk[0] = sai->bus_clk;
+	mclk_parent_names[0] = __clk_get_name(sai->mclk_clk[0]);
 
 	fsl_asoc_get_pll_clocks(&pdev->dev, &sai->pll8k_clk,
 				&sai->pll11k_clk);
@@ -1443,8 +1513,34 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	/* Get sai version */
 	ret = fsl_sai_check_version(dev);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_warn(dev, "Error reading SAI version: %d\n", ret);
+		goto err_pm_get_sync;
+	}
+
+	mclk_init.name = mclk_rxtx_names[0];
+	sai->mclk_clk_hw[0].init = &mclk_init;
+	ret = of_clk_hw_register(np, &sai->mclk_clk_hw[0]);
+	if (ret)
+		goto err_pm_get_sync;
+
+	mclk_init.name = mclk_rxtx_names[1];
+	sai->mclk_clk_hw[1].init = &mclk_init;
+	ret = of_clk_hw_register(np, &sai->mclk_clk_hw[1]);
+	if (ret)
+		goto err_clk_unregister_rx;
+
+	sai->mclk_clk_out[0] = clk_hw_get_clk(&sai->mclk_clk_hw[0], NULL);
+	if (IS_ERR(sai->mclk_clk_out[0])) {
+		ret = PTR_ERR(sai->mclk_clk_out[0]);
+		goto err_clk_unregister_tx;
+	}
+
+	sai->mclk_clk_out[1] = clk_hw_get_clk(&sai->mclk_clk_hw[1], NULL);
+	if (IS_ERR(sai->mclk_clk_out[1])) {
+		ret = PTR_ERR(sai->mclk_clk_out[1]);
+		goto err_clk_put_rx;
+	}
 
 	/* Select MCLK direction */
 	if (of_find_property(np, "fsl,sai-mclk-direction-output", NULL) &&
@@ -1455,7 +1551,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret < 0 && ret != -ENOSYS)
-		goto err_pm_get_sync;
+		goto err_clk_put_tx;
 
 	/*
 	 * Register platform component before registering cpu dai for there
@@ -1466,21 +1562,39 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		if (ret) {
 			if (!IS_ENABLED(CONFIG_SND_SOC_IMX_PCM_DMA))
 				dev_err(dev, "Error: You must enable the imx-pcm-dma support!\n");
-			goto err_pm_get_sync;
+			goto err_clk_put_tx;
 		}
 	} else {
 		ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
 		if (ret)
-			goto err_pm_get_sync;
+			goto err_clk_put_tx;
 	}
 
 	ret = devm_snd_soc_register_component(dev, &fsl_component,
 					      &sai->cpu_dai_drv, 1);
 	if (ret)
-		goto err_pm_get_sync;
+		goto err_clk_put_tx;
+
+	/* Expose only the TX clock */
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					  &sai->mclk_clk_hw[1]);
+	if (ret)
+		goto err_clk_put_tx;
 
 	return ret;
 
+err_clk_put_tx:
+	clk_put(sai->mclk_clk_out[1]);
+
+err_clk_put_rx:
+	clk_put(sai->mclk_clk_out[0]);
+
+err_clk_unregister_tx:
+	clk_hw_unregister(&sai->mclk_clk_hw[1]);
+
+err_clk_unregister_rx:
+	clk_hw_unregister(&sai->mclk_clk_hw[0]);
+
 err_pm_get_sync:
 	if (!pm_runtime_status_suspended(dev))
 		fsl_sai_runtime_suspend(dev);
@@ -1492,6 +1606,12 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 static int fsl_sai_remove(struct platform_device *pdev)
 {
+	struct fsl_sai *sai = dev_get_drvdata(&pdev->dev);
+
+	clk_put(sai->mclk_clk_out[1]);
+	clk_put(sai->mclk_clk_out[0]);
+	clk_hw_unregister(&sai->mclk_clk_hw[1]);
+	clk_hw_unregister(&sai->mclk_clk_hw[0]);
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		fsl_sai_runtime_suspend(&pdev->dev);
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 197748a888d5f..f2abf2d6de218 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -6,6 +6,7 @@
 #ifndef __FSL_SAI_H
 #define __FSL_SAI_H
 
+#include <linux/clk-provider.h>
 #include <linux/dma/imx-dma.h>
 #include <sound/dmaengine_pcm.h>
 
@@ -277,6 +278,8 @@ struct fsl_sai {
 	struct clk *mclk_clk[FSL_SAI_MCLK_MAX];
 	struct clk *pll8k_clk;
 	struct clk *pll11k_clk;
+	struct clk_hw mclk_clk_hw[2];	/* MCLK provider */
+	struct clk *mclk_clk_out[2];	/* MCLK output */
 	struct resource *res;
 
 	bool is_consumer_mode;
-- 
2.35.1

