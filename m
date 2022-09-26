Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B583A5EA268
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 13:07:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07B8D74C;
	Mon, 26 Sep 2022 13:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07B8D74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664190429;
	bh=prT598LPdmnH/ccLfWrCiQyVa05sF+6rbvmn5huDLHU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O3qc1mVTJhax/mRgDR72sTJqgO4k77WP19KU2Z9HhZtL/laqpIwlijU9jODA3iiYV
	 SGk9kahgvNKMYJQGxxh+UkFGgotXx1ofqSUl/U5mBkSSbwfGB8jh/DW8QecHorzCUD
	 pyHNvlJ/k6ryGD5adEudeBJTNe/zRV8Fhn3h7Nts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6114DF802BE;
	Mon, 26 Sep 2022 13:06:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87559F8027D; Mon, 26 Sep 2022 13:06:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B7A8F80115
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 13:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B7A8F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ElsvJc27"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BDE5D6068B;
 Mon, 26 Sep 2022 11:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3759FC433C1;
 Mon, 26 Sep 2022 11:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664190358;
 bh=prT598LPdmnH/ccLfWrCiQyVa05sF+6rbvmn5huDLHU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ElsvJc2758gqGIPKzkGfmc7WWM/rvqKW1O5f7JkLzvdoHvY4En6vRVw1GPU4yZ16X
 pBW0euwiLzIDjPd1+/1EEOLuk7dWB1LTRO5v61fiE84pbGNU+QYSWxsfXNMzSl4PMf
 ceftkwY5I+JxawqlPo/FBWPnB9Pb4QpsJMIBoEVQYTjQVYsxxqMG8JFN+qEEDpJdmN
 JiLCmm22kP33/vCdGR8yNsSxTc0uliX22korgDGP/eUsIUdzdUxLAUVfpLXKErLBWw
 wiJZOm3e8OUwG5Yrv3JtdnzqtEA3rBPiZD0m+b827ajuZuz+b3WVIwGjRaZnFt5W/r
 v0AzeMZCNR8xQ==
Received: by pali.im (Postfix)
 id EA8018A3; Mon, 26 Sep 2022 13:05:54 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andrew Lunn <andrew@lunn.ch>, Marcin Wojtas <mw@semihalf.com>
Subject: [PATCH v2] ASoC: kirkwood: enable Kirkwood driver for Armada 38x
 platforms
Date: Mon, 26 Sep 2022 13:05:33 +0200
Message-Id: <20220926110533.13475-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220920132648.2008-2-pali@kernel.org>
References: <20220920132648.2008-2-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

From: Marcin Wojtas <mw@semihalf.com>

The audio unit of Marvell Armada38x SoC is similar to the ones comprised by
other Marvell SoCs (Kirkwood, Dove and Armada 370). Therefore KW audio
driver can be used to support it and this commit adds new compatible string
to identify Armada 38x variant.

Two new memory regions are added: first one for PLL configuration and
the second one for choosing one of audio I/O modes (I2S or S/PDIF).
For the latter purpose a new optional DT property is added ('spdif-mode').

kirkwood-i2s driver is extended by adding a new init function for Armada
38x flavor and also a routine that enables PLL output (i.e. MCLK)
configuration.

Signed-off-by: Marcin Wojtas <mw@semihalf.com>
Tested-by: Star_Automation <star@marvell.com>
Reviewed-by: Nadav Haklai <nadavh@marvell.com>
Reviewed-by: Lior Amsalem <alior@marvell.com>
Tested-by: Lior Amsalem <alior@marvell.com>
Signed-off-by: Hezi Shahmoon <hezi@marvell.com>
Reviewed-by: Neta Zur Hershkovits <neta@marvell.com>
[pali: Fix support for pre-38x SoCs]
Signed-off-by: Pali Rohár <pali@kernel.org>
---
Changes in v2:
* Dropped all other patches as they were applied
* Moved armada_38x_set_pll() call after error check per Andrew request
---
 .../devicetree/bindings/sound/mvebu-audio.txt |  14 +-
 sound/soc/kirkwood/kirkwood-i2s.c             | 135 +++++++++++++++++-
 sound/soc/kirkwood/kirkwood.h                 |   2 +
 3 files changed, 148 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mvebu-audio.txt b/Documentation/devicetree/bindings/sound/mvebu-audio.txt
index cb8c07c81ce4..4f5dec5cb3c2 100644
--- a/Documentation/devicetree/bindings/sound/mvebu-audio.txt
+++ b/Documentation/devicetree/bindings/sound/mvebu-audio.txt
@@ -6,9 +6,14 @@ Required properties:
   "marvell,kirkwood-audio" for Kirkwood platforms
   "marvell,dove-audio" for Dove platforms
   "marvell,armada370-audio" for Armada 370 platforms
+  "marvell,armada-380-audio" for Armada 38x platforms
 
 - reg: physical base address of the controller and length of memory mapped
-  region.
+  region (named "i2s_regs").
+  With "marvell,armada-380-audio" two other regions are required:
+  first of those is dedicated for Audio PLL Configuration registers
+  (named "pll_regs") and the second one ("soc_ctrl") - for register
+  where one of exceptive I/O types (I2S or S/PDIF) is set.
 
 - interrupts:
   with "marvell,kirkwood-audio", the audio interrupt
@@ -23,6 +28,13 @@ Required properties:
 	"internal" for the internal clock
 	"extclk" for the external clock
 
+Optional properties:
+
+- spdif-mode:
+  Enable S/PDIF mode on Armada 38x SoC. Using this property
+  disables standard I2S I/O. Valid only with "marvell,armada-380-audio"
+  compatible string.
+
 Example:
 
 i2s1: audio-controller@b4000 {
diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index 2a4ffe945177..afdf7d61e4c5 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -31,6 +31,122 @@
 	(SNDRV_PCM_FMTBIT_S16_LE | \
 	 SNDRV_PCM_FMTBIT_S24_LE)
 
+/* These registers are relative to the second register region -
+ * audio pll configuration.
+ */
+#define A38X_PLL_CONF_REG0			0x0
+#define     A38X_PLL_FB_CLK_DIV_OFFSET		10
+#define     A38X_PLL_FB_CLK_DIV_MASK		0x7fc00
+#define A38X_PLL_CONF_REG1			0x4
+#define     A38X_PLL_FREQ_OFFSET_MASK		0xffff
+#define     A38X_PLL_FREQ_OFFSET_VALID		BIT(16)
+#define     A38X_PLL_SW_RESET			BIT(31)
+#define A38X_PLL_CONF_REG2			0x8
+#define     A38X_PLL_AUDIO_POSTDIV_MASK		0x7f
+
+/* Bit below belongs to SoC control register corresponding to the third
+ * register region.
+ */
+#define A38X_SPDIF_MODE_ENABLE			BIT(27)
+
+static int armada_38x_i2s_init_quirk(struct platform_device *pdev,
+				     struct kirkwood_dma_data *priv,
+				     struct snd_soc_dai_driver *dai_drv)
+{
+	struct device_node *np = pdev->dev.of_node;
+	u32 reg_val;
+	int i;
+
+	priv->pll_config = devm_platform_ioremap_resource_byname(pdev, "pll_regs");
+	if (IS_ERR(priv->pll_config))
+		return -ENOMEM;
+
+	priv->soc_control = devm_platform_ioremap_resource_byname(pdev, "soc_ctrl");
+	if (IS_ERR(priv->soc_control))
+		return -ENOMEM;
+
+	/* Select one of exceptive modes: I2S or S/PDIF */
+	reg_val = readl(priv->soc_control);
+	if (of_property_read_bool(np, "spdif-mode")) {
+		reg_val |= A38X_SPDIF_MODE_ENABLE;
+		dev_info(&pdev->dev, "using S/PDIF mode\n");
+	} else {
+		reg_val &= ~A38X_SPDIF_MODE_ENABLE;
+		dev_info(&pdev->dev, "using I2S mode\n");
+	}
+	writel(reg_val, priv->soc_control);
+
+	/* Update available rates of mclk's fs */
+	for (i = 0; i < 2; i++) {
+		dai_drv[i].playback.rates |= SNDRV_PCM_RATE_192000;
+		dai_drv[i].capture.rates |= SNDRV_PCM_RATE_192000;
+	}
+
+	return 0;
+}
+
+static inline void armada_38x_set_pll(void __iomem *base, unsigned long rate)
+{
+	u32 reg_val;
+	u16 freq_offset = 0x22b0;
+	u8 audio_postdiv, fb_clk_div = 0x1d;
+
+	/* Set frequency offset value to not valid and enable PLL reset */
+	reg_val = readl(base + A38X_PLL_CONF_REG1);
+	reg_val &= ~A38X_PLL_FREQ_OFFSET_VALID;
+	reg_val &= ~A38X_PLL_SW_RESET;
+	writel(reg_val, base + A38X_PLL_CONF_REG1);
+
+	udelay(1);
+
+	/* Update PLL parameters */
+	switch (rate) {
+	default:
+	case 44100:
+		freq_offset = 0x735;
+		fb_clk_div = 0x1b;
+		audio_postdiv = 0xc;
+		break;
+	case 48000:
+		audio_postdiv = 0xc;
+		break;
+	case 96000:
+		audio_postdiv = 0x6;
+		break;
+	case 192000:
+		audio_postdiv = 0x3;
+		break;
+	}
+
+	reg_val = readl(base + A38X_PLL_CONF_REG0);
+	reg_val &= ~A38X_PLL_FB_CLK_DIV_MASK;
+	reg_val |= (fb_clk_div << A38X_PLL_FB_CLK_DIV_OFFSET);
+	writel(reg_val, base + A38X_PLL_CONF_REG0);
+
+	reg_val = readl(base + A38X_PLL_CONF_REG2);
+	reg_val &= ~A38X_PLL_AUDIO_POSTDIV_MASK;
+	reg_val |= audio_postdiv;
+	writel(reg_val, base + A38X_PLL_CONF_REG2);
+
+	reg_val = readl(base + A38X_PLL_CONF_REG1);
+	reg_val &= ~A38X_PLL_FREQ_OFFSET_MASK;
+	reg_val |= freq_offset;
+	writel(reg_val, base + A38X_PLL_CONF_REG1);
+
+	udelay(1);
+
+	/* Disable reset */
+	reg_val |= A38X_PLL_SW_RESET;
+	writel(reg_val, base + A38X_PLL_CONF_REG1);
+
+	/* Wait 50us for PLL to lock */
+	udelay(50);
+
+	/* Restore frequency offset value validity */
+	reg_val |= A38X_PLL_FREQ_OFFSET_VALID;
+	writel(reg_val, base + A38X_PLL_CONF_REG1);
+}
+
 static int kirkwood_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 		unsigned int fmt)
 {
@@ -106,7 +222,10 @@ static void kirkwood_set_rate(struct snd_soc_dai *dai,
 		 * defined in kirkwood_i2s_dai */
 		dev_dbg(dai->dev, "%s: dco set rate = %lu\n",
 			__func__, rate);
-		kirkwood_set_dco(priv->io, rate);
+		if (priv->pll_config)
+			armada_38x_set_pll(priv->pll_config, rate);
+		else
+			kirkwood_set_dco(priv->io, rate);
 
 		clks_ctrl = KIRKWOOD_MCLK_SOURCE_DCO;
 	} else {
@@ -532,7 +651,10 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, priv);
 
-	priv->io = devm_platform_ioremap_resource(pdev, 0);
+	if (of_device_is_compatible(np, "marvell,armada-380-audio"))
+		priv->io = devm_platform_ioremap_resource_byname(pdev, "i2s_regs");
+	else
+		priv->io = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->io))
 		return PTR_ERR(priv->io);
 
@@ -540,6 +662,14 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 	if (priv->irq < 0)
 		return priv->irq;
 
+	if (of_device_is_compatible(np, "marvell,armada-380-audio")) {
+		err = armada_38x_i2s_init_quirk(pdev, priv, soc_dai);
+		if (err < 0)
+			return err;
+		/* Set initial pll frequency */
+		armada_38x_set_pll(priv->pll_config, 44100);
+	}
+
 	if (np) {
 		priv->burst = 128;		/* might be 32 or 128 */
 	} else if (data) {
@@ -623,6 +753,7 @@ static const struct of_device_id mvebu_audio_of_match[] = {
 	{ .compatible = "marvell,kirkwood-audio" },
 	{ .compatible = "marvell,dove-audio" },
 	{ .compatible = "marvell,armada370-audio" },
+	{ .compatible = "marvell,armada-380-audio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mvebu_audio_of_match);
diff --git a/sound/soc/kirkwood/kirkwood.h b/sound/soc/kirkwood/kirkwood.h
index a1733a6aace5..79bb9aa7f086 100644
--- a/sound/soc/kirkwood/kirkwood.h
+++ b/sound/soc/kirkwood/kirkwood.h
@@ -131,6 +131,8 @@
 
 struct kirkwood_dma_data {
 	void __iomem *io;
+	void __iomem *pll_config;
+	void __iomem *soc_control;
 	struct clk *clk;
 	struct clk *extclk;
 	uint32_t ctl_play;
-- 
2.20.1

