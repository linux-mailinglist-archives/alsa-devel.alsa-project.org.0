Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5936384D1E
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 15:32:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55E2B166A;
	Wed,  7 Aug 2019 15:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55E2B166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565184758;
	bh=xXdl1/PveRgMx6ctHsVNP4f/s87oKB7xv1yDhmIPYDQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FvyAjpMO05dznSXCagi76XUehUpEMnQRB44x/4tFeYPPfSRZE2BlEeHbBFq+ZCf9V
	 9JO5BswGbKcVfKb0ssmBvTHdPbYRESG9B4S/0ePCoU6YmQt5ec7iQ+tlydMtY94lVb
	 6IHAhfbUR0WOkq2COIRRL8odo0aI7eZsw1+4boJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CA4EF80533;
	Wed,  7 Aug 2019 15:31:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E926DF805FD; Wed,  7 Aug 2019 15:30:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A460AF800F3
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 15:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A460AF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="S2KX1AX9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Lcd+whpxVpp8YXflDWMU2d1BePusjHcNl7oBzkh7LZA=; b=S2KX1AX9viXN
 Ss20JV2ISrGVPuWDkeE/OuYjYYqUtPyGz502qkgblv4bVdP/H6sxLWxW/0JSF/FcsaaMONRqnE7bX
 ORP/UBPWdQq4Z+Gj7gp+vR+fYSOdUFhfQXS8L+5yerzAw+9+1nAFKd6WLMZtWCwQ/eOhFSFT6fHpv
 7QrqA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvM1f-0007f7-8U; Wed, 07 Aug 2019 13:30:47 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9E5F02742BE8; Wed,  7 Aug 2019 14:30:46 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190806151214.6783-4-daniel.baluta@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190807133046.9E5F02742BE8@ypsilon.sirena.org.uk>
Date: Wed,  7 Aug 2019 14:30:46 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 robh@kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>, angus@akkea.ca,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-imx@nxp.com, kernel@pengutronix.de, Mihai Serban <mihai.serban@nxp.com>,
 festevam@gmail.com, mihai.serban@gmail.com, l.stach@pengutronix.de
Subject: [alsa-devel] Applied "ASoC: fsl_sai: Add support for SAI new
	version" to the asoc tree
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

   ASoC: fsl_sai: Add support for SAI new version

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 4f7a0728b5305e2d865f543fbcffd617e03c7674 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Tue, 6 Aug 2019 18:12:12 +0300
Subject: [PATCH] ASoC: fsl_sai: Add support for SAI new version

New IP version introduces Version ID and Parameter registers
and optionally added Timestamp feature.

VERID and PARAM registers are placed at the top of registers
address space and some registers are shifted according to
the following table:

Tx/Rx data registers and Tx/Rx FIFO registers keep their
addresses, all other registers are shifted by 8.

SAI Memory map is described in chapter 13.10.4.1.1 I2S Memory map
of the Reference Manual [1].

In order to make as less changes as possible we attach an offset
to each register offset to each changed register definition. The
offset is read from each board private data.

[1]https://cache.nxp.com/secured/assets/documents/en/reference-manual/IMX8MDQLQRM.pdf?__gda__=1563728701_38bea7f0f726472cc675cb141b91bec7&fileExt=.pdf

Signed-off-by: Mihai Serban <mihai.serban@nxp.com>
[initial coding in the NXP internal tree]
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
[bugfixing and cleanups]
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
[adapted to linux-next]
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/20190806151214.6783-4-daniel.baluta@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_sai.c | 228 ++++++++++++++++++++++++----------------
 sound/soc/fsl/fsl_sai.h |  41 ++++----
 2 files changed, 156 insertions(+), 113 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index f2698c94c9fe..0c5452927c04 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -40,6 +40,7 @@ static const struct snd_pcm_hw_constraint_list fsl_sai_rate_constraints = {
 static irqreturn_t fsl_sai_isr(int irq, void *devid)
 {
 	struct fsl_sai *sai = (struct fsl_sai *)devid;
+	unsigned int ofs = sai->soc_data->reg_offset;
 	struct device *dev = &sai->pdev->dev;
 	u32 flags, xcsr, mask;
 	bool irq_none = true;
@@ -52,7 +53,7 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
 	mask = (FSL_SAI_FLAGS >> FSL_SAI_CSR_xIE_SHIFT) << FSL_SAI_CSR_xF_SHIFT;
 
 	/* Tx IRQ */
-	regmap_read(sai->regmap, FSL_SAI_TCSR, &xcsr);
+	regmap_read(sai->regmap, FSL_SAI_TCSR(ofs), &xcsr);
 	flags = xcsr & mask;
 
 	if (flags)
@@ -82,11 +83,11 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
 	xcsr &= ~FSL_SAI_CSR_xF_MASK;
 
 	if (flags)
-		regmap_write(sai->regmap, FSL_SAI_TCSR, flags | xcsr);
+		regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), flags | xcsr);
 
 irq_rx:
 	/* Rx IRQ */
-	regmap_read(sai->regmap, FSL_SAI_RCSR, &xcsr);
+	regmap_read(sai->regmap, FSL_SAI_RCSR(ofs), &xcsr);
 	flags = xcsr & mask;
 
 	if (flags)
@@ -116,7 +117,7 @@ static irqreturn_t fsl_sai_isr(int irq, void *devid)
 	xcsr &= ~FSL_SAI_CSR_xF_MASK;
 
 	if (flags)
-		regmap_write(sai->regmap, FSL_SAI_RCSR, flags | xcsr);
+		regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), flags | xcsr);
 
 out:
 	if (irq_none)
@@ -140,6 +141,7 @@ static int fsl_sai_set_dai_sysclk_tr(struct snd_soc_dai *cpu_dai,
 		int clk_id, unsigned int freq, int fsl_dir)
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
+	unsigned int ofs = sai->soc_data->reg_offset;
 	bool tx = fsl_dir == FSL_FMT_TRANSMITTER;
 	u32 val_cr2 = 0;
 
@@ -160,7 +162,7 @@ static int fsl_sai_set_dai_sysclk_tr(struct snd_soc_dai *cpu_dai,
 		return -EINVAL;
 	}
 
-	regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx),
+	regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
 			   FSL_SAI_CR2_MSEL_MASK, val_cr2);
 
 	return 0;
@@ -193,6 +195,7 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
 				unsigned int fmt, int fsl_dir)
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
+	unsigned int ofs = sai->soc_data->reg_offset;
 	bool tx = fsl_dir == FSL_FMT_TRANSMITTER;
 	u32 val_cr2 = 0, val_cr4 = 0;
 
@@ -287,9 +290,9 @@ static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
 		return -EINVAL;
 	}
 
-	regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx),
+	regmap_update_bits(sai->regmap, FSL_SAI_xCR2(tx, ofs),
 			   FSL_SAI_CR2_BCP | FSL_SAI_CR2_BCD_MSTR, val_cr2);
-	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
+	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
 			   FSL_SAI_CR4_MF | FSL_SAI_CR4_FSE |
 			   FSL_SAI_CR4_FSP | FSL_SAI_CR4_FSD_MSTR, val_cr4);
 
@@ -316,6 +319,7 @@ static int fsl_sai_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(dai);
+	unsigned int ofs = sai->soc_data->reg_offset;
 	unsigned long clk_rate;
 	u32 savediv = 0, ratio, savesub = freq;
 	u32 id;
@@ -378,17 +382,17 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	 */
 	if ((sai->synchronous[TX] && !sai->synchronous[RX]) ||
 	    (!tx && !sai->synchronous[RX])) {
-		regmap_update_bits(sai->regmap, FSL_SAI_RCR2,
+		regmap_update_bits(sai->regmap, FSL_SAI_RCR2(ofs),
 				   FSL_SAI_CR2_MSEL_MASK,
 				   FSL_SAI_CR2_MSEL(sai->mclk_id[tx]));
-		regmap_update_bits(sai->regmap, FSL_SAI_RCR2,
+		regmap_update_bits(sai->regmap, FSL_SAI_RCR2(ofs),
 				   FSL_SAI_CR2_DIV_MASK, savediv - 1);
 	} else if ((sai->synchronous[RX] && !sai->synchronous[TX]) ||
 		   (tx && !sai->synchronous[TX])) {
-		regmap_update_bits(sai->regmap, FSL_SAI_TCR2,
+		regmap_update_bits(sai->regmap, FSL_SAI_TCR2(ofs),
 				   FSL_SAI_CR2_MSEL_MASK,
 				   FSL_SAI_CR2_MSEL(sai->mclk_id[tx]));
-		regmap_update_bits(sai->regmap, FSL_SAI_TCR2,
+		regmap_update_bits(sai->regmap, FSL_SAI_TCR2(ofs),
 				   FSL_SAI_CR2_DIV_MASK, savediv - 1);
 	}
 
@@ -403,6 +407,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
+	unsigned int ofs = sai->soc_data->reg_offset;
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	unsigned int channels = params_channels(params);
 	u32 word_width = params_width(params);
@@ -455,19 +460,19 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	if (!sai->is_slave_mode) {
 		if (!sai->synchronous[TX] && sai->synchronous[RX] && !tx) {
-			regmap_update_bits(sai->regmap, FSL_SAI_TCR4,
+			regmap_update_bits(sai->regmap, FSL_SAI_TCR4(ofs),
 				FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
 				val_cr4);
-			regmap_update_bits(sai->regmap, FSL_SAI_TCR5,
+			regmap_update_bits(sai->regmap, FSL_SAI_TCR5(ofs),
 				FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
 				FSL_SAI_CR5_FBT_MASK, val_cr5);
 			regmap_write(sai->regmap, FSL_SAI_TMR,
 				~0UL - ((1 << channels) - 1));
 		} else if (!sai->synchronous[RX] && sai->synchronous[TX] && tx) {
-			regmap_update_bits(sai->regmap, FSL_SAI_RCR4,
+			regmap_update_bits(sai->regmap, FSL_SAI_RCR4(ofs),
 				FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
 				val_cr4);
-			regmap_update_bits(sai->regmap, FSL_SAI_RCR5,
+			regmap_update_bits(sai->regmap, FSL_SAI_RCR5(ofs),
 				FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
 				FSL_SAI_CR5_FBT_MASK, val_cr5);
 			regmap_write(sai->regmap, FSL_SAI_RMR,
@@ -475,10 +480,10 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx),
+	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
 			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
 			   val_cr4);
-	regmap_update_bits(sai->regmap, FSL_SAI_xCR5(tx),
+	regmap_update_bits(sai->regmap, FSL_SAI_xCR5(tx, ofs),
 			   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
 			   FSL_SAI_CR5_FBT_MASK, val_cr5);
 	regmap_write(sai->regmap, FSL_SAI_xMR(tx), ~0UL - ((1 << channels) - 1));
@@ -506,6 +511,8 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 		struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
+	unsigned int ofs = sai->soc_data->reg_offset;
+
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	u32 xcsr, count = 100;
 
@@ -514,9 +521,9 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 	 * Rx sync with Tx clocks: Clear SYNC for Tx, set it for Rx.
 	 * Tx sync with Rx clocks: Clear SYNC for Rx, set it for Tx.
 	 */
-	regmap_update_bits(sai->regmap, FSL_SAI_TCR2, FSL_SAI_CR2_SYNC,
-		           sai->synchronous[TX] ? FSL_SAI_CR2_SYNC : 0);
-	regmap_update_bits(sai->regmap, FSL_SAI_RCR2, FSL_SAI_CR2_SYNC,
+	regmap_update_bits(sai->regmap, FSL_SAI_TCR2(ofs), FSL_SAI_CR2_SYNC,
+			   sai->synchronous[TX] ? FSL_SAI_CR2_SYNC : 0);
+	regmap_update_bits(sai->regmap, FSL_SAI_RCR2(ofs), FSL_SAI_CR2_SYNC,
 			   sai->synchronous[RX] ? FSL_SAI_CR2_SYNC : 0);
 
 	/*
@@ -527,43 +534,44 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx),
+		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_FRDE, FSL_SAI_CSR_FRDE);
 
-		regmap_update_bits(sai->regmap, FSL_SAI_RCSR,
+		regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
 				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
-		regmap_update_bits(sai->regmap, FSL_SAI_TCSR,
+		regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
 				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
 
-		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx),
+		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_xIE_MASK, FSL_SAI_FLAGS);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx),
+		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_FRDE, 0);
-		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx),
+		regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
 				   FSL_SAI_CSR_xIE_MASK, 0);
 
 		/* Check if the opposite FRDE is also disabled */
-		regmap_read(sai->regmap, FSL_SAI_xCSR(!tx), &xcsr);
+		regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
 		if (!(xcsr & FSL_SAI_CSR_FRDE)) {
 			/* Disable both directions and reset their FIFOs */
-			regmap_update_bits(sai->regmap, FSL_SAI_TCSR,
+			regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
 					   FSL_SAI_CSR_TERE, 0);
-			regmap_update_bits(sai->regmap, FSL_SAI_RCSR,
+			regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
 					   FSL_SAI_CSR_TERE, 0);
 
 			/* TERE will remain set till the end of current frame */
 			do {
 				udelay(10);
-				regmap_read(sai->regmap, FSL_SAI_xCSR(tx), &xcsr);
+				regmap_read(sai->regmap,
+					    FSL_SAI_xCSR(tx, ofs), &xcsr);
 			} while (--count && xcsr & FSL_SAI_CSR_TERE);
 
-			regmap_update_bits(sai->regmap, FSL_SAI_TCSR,
+			regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
 					   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
-			regmap_update_bits(sai->regmap, FSL_SAI_RCSR,
+			regmap_update_bits(sai->regmap, FSL_SAI_RCSR(ofs),
 					   FSL_SAI_CSR_FR, FSL_SAI_CSR_FR);
 
 			/*
@@ -575,13 +583,13 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 			 */
 			if (!sai->is_slave_mode) {
 				/* Software Reset for both Tx and Rx */
-				regmap_write(sai->regmap,
-					     FSL_SAI_TCSR, FSL_SAI_CSR_SR);
-				regmap_write(sai->regmap,
-					     FSL_SAI_RCSR, FSL_SAI_CSR_SR);
+				regmap_write(sai->regmap, FSL_SAI_TCSR(ofs),
+					     FSL_SAI_CSR_SR);
+				regmap_write(sai->regmap, FSL_SAI_RCSR(ofs),
+					     FSL_SAI_CSR_SR);
 				/* Clear SR bit to finish the reset */
-				regmap_write(sai->regmap, FSL_SAI_TCSR, 0);
-				regmap_write(sai->regmap, FSL_SAI_RCSR, 0);
+				regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
+				regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
 			}
 		}
 		break;
@@ -596,10 +604,11 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
+	unsigned int ofs = sai->soc_data->reg_offset;
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	int ret;
 
-	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx),
+	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx, ofs),
 			   FSL_SAI_CR3_TRCE_MASK,
 			   FSL_SAI_CR3_TRCE);
 
@@ -613,9 +622,10 @@ static void fsl_sai_shutdown(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
+	unsigned int ofs = sai->soc_data->reg_offset;
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 
-	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx),
+	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx, ofs),
 			   FSL_SAI_CR3_TRCE_MASK, 0);
 }
 
@@ -633,18 +643,20 @@ static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
 static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_sai *sai = dev_get_drvdata(cpu_dai->dev);
+	unsigned int ofs = sai->soc_data->reg_offset;
 
 	/* Software Reset for both Tx and Rx */
-	regmap_write(sai->regmap, FSL_SAI_TCSR, FSL_SAI_CSR_SR);
-	regmap_write(sai->regmap, FSL_SAI_RCSR, FSL_SAI_CSR_SR);
+	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR);
+	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR);
 	/* Clear SR bit to finish the reset */
-	regmap_write(sai->regmap, FSL_SAI_TCSR, 0);
-	regmap_write(sai->regmap, FSL_SAI_RCSR, 0);
+	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
+	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
 
-	regmap_update_bits(sai->regmap, FSL_SAI_TCR1, FSL_SAI_CR1_RFW_MASK,
+	regmap_update_bits(sai->regmap, FSL_SAI_TCR1(ofs),
+			   FSL_SAI_CR1_RFW_MASK,
 			   sai->soc_data->fifo_depth - FSL_SAI_MAXBURST_TX);
-	regmap_update_bits(sai->regmap, FSL_SAI_RCR1, FSL_SAI_CR1_RFW_MASK,
-			   FSL_SAI_MAXBURST_RX - 1);
+	regmap_update_bits(sai->regmap, FSL_SAI_RCR1(ofs),
+			   FSL_SAI_CR1_RFW_MASK, FSL_SAI_MAXBURST_RX - 1);
 
 	snd_soc_dai_init_dma_data(cpu_dai, &sai->dma_params_tx,
 				&sai->dma_params_rx);
@@ -681,12 +693,12 @@ static const struct snd_soc_component_driver fsl_component = {
 	.name           = "fsl-sai",
 };
 
-static struct reg_default fsl_sai_reg_defaults[] = {
-	{FSL_SAI_TCR1, 0},
-	{FSL_SAI_TCR2, 0},
-	{FSL_SAI_TCR3, 0},
-	{FSL_SAI_TCR4, 0},
-	{FSL_SAI_TCR5, 0},
+static struct reg_default fsl_sai_reg_defaults_ofs0[] = {
+	{FSL_SAI_TCR1(0), 0},
+	{FSL_SAI_TCR2(0), 0},
+	{FSL_SAI_TCR3(0), 0},
+	{FSL_SAI_TCR4(0), 0},
+	{FSL_SAI_TCR5(0), 0},
 	{FSL_SAI_TDR0, 0},
 	{FSL_SAI_TDR1, 0},
 	{FSL_SAI_TDR2, 0},
@@ -695,24 +707,50 @@ static struct reg_default fsl_sai_reg_defaults[] = {
 	{FSL_SAI_TDR5, 0},
 	{FSL_SAI_TDR6, 0},
 	{FSL_SAI_TDR7, 0},
-	{FSL_SAI_TMR,  0},
-	{FSL_SAI_RCR1, 0},
-	{FSL_SAI_RCR2, 0},
-	{FSL_SAI_RCR3, 0},
-	{FSL_SAI_RCR4, 0},
-	{FSL_SAI_RCR5, 0},
-	{FSL_SAI_RMR,  0},
+	{FSL_SAI_TMR, 0},
+	{FSL_SAI_RCR1(0), 0},
+	{FSL_SAI_RCR2(0), 0},
+	{FSL_SAI_RCR3(0), 0},
+	{FSL_SAI_RCR4(0), 0},
+	{FSL_SAI_RCR5(0), 0},
+	{FSL_SAI_RMR, 0},
+};
+
+static struct reg_default fsl_sai_reg_defaults_ofs8[] = {
+	{FSL_SAI_TCR1(8), 0},
+	{FSL_SAI_TCR2(8), 0},
+	{FSL_SAI_TCR3(8), 0},
+	{FSL_SAI_TCR4(8), 0},
+	{FSL_SAI_TCR5(8), 0},
+	{FSL_SAI_TDR0, 0},
+	{FSL_SAI_TDR1, 0},
+	{FSL_SAI_TDR2, 0},
+	{FSL_SAI_TDR3, 0},
+	{FSL_SAI_TDR4, 0},
+	{FSL_SAI_TDR5, 0},
+	{FSL_SAI_TDR6, 0},
+	{FSL_SAI_TDR7, 0},
+	{FSL_SAI_TMR, 0},
+	{FSL_SAI_RCR1(8), 0},
+	{FSL_SAI_RCR2(8), 0},
+	{FSL_SAI_RCR3(8), 0},
+	{FSL_SAI_RCR4(8), 0},
+	{FSL_SAI_RCR5(8), 0},
+	{FSL_SAI_RMR, 0},
 };
 
 static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
 {
+	struct fsl_sai *sai = dev_get_drvdata(dev);
+	unsigned int ofs = sai->soc_data->reg_offset;
+
+	if (reg >= FSL_SAI_TCSR(ofs) && reg <= FSL_SAI_TCR5(ofs))
+		return true;
+
+	if (reg >= FSL_SAI_RCSR(ofs) && reg <= FSL_SAI_RCR5(ofs))
+		return true;
+
 	switch (reg) {
-	case FSL_SAI_TCSR:
-	case FSL_SAI_TCR1:
-	case FSL_SAI_TCR2:
-	case FSL_SAI_TCR3:
-	case FSL_SAI_TCR4:
-	case FSL_SAI_TCR5:
 	case FSL_SAI_TFR0:
 	case FSL_SAI_TFR1:
 	case FSL_SAI_TFR2:
@@ -722,12 +760,6 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_TFR6:
 	case FSL_SAI_TFR7:
 	case FSL_SAI_TMR:
-	case FSL_SAI_RCSR:
-	case FSL_SAI_RCR1:
-	case FSL_SAI_RCR2:
-	case FSL_SAI_RCR3:
-	case FSL_SAI_RCR4:
-	case FSL_SAI_RCR5:
 	case FSL_SAI_RDR0:
 	case FSL_SAI_RDR1:
 	case FSL_SAI_RDR2:
@@ -753,9 +785,13 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
 
 static bool fsl_sai_volatile_reg(struct device *dev, unsigned int reg)
 {
+	struct fsl_sai *sai = dev_get_drvdata(dev);
+	unsigned int ofs = sai->soc_data->reg_offset;
+
+	if (reg == FSL_SAI_TCSR(ofs) || reg == FSL_SAI_RCSR(ofs))
+		return true;
+
 	switch (reg) {
-	case FSL_SAI_TCSR:
-	case FSL_SAI_RCSR:
 	case FSL_SAI_TFR0:
 	case FSL_SAI_TFR1:
 	case FSL_SAI_TFR2:
@@ -788,13 +824,16 @@ static bool fsl_sai_volatile_reg(struct device *dev, unsigned int reg)
 
 static bool fsl_sai_writeable_reg(struct device *dev, unsigned int reg)
 {
+	struct fsl_sai *sai = dev_get_drvdata(dev);
+	unsigned int ofs = sai->soc_data->reg_offset;
+
+	if (reg >= FSL_SAI_TCSR(ofs) && reg <= FSL_SAI_TCR5(ofs))
+		return true;
+
+	if (reg >= FSL_SAI_RCSR(ofs) && reg <= FSL_SAI_RCR5(ofs))
+		return true;
+
 	switch (reg) {
-	case FSL_SAI_TCSR:
-	case FSL_SAI_TCR1:
-	case FSL_SAI_TCR2:
-	case FSL_SAI_TCR3:
-	case FSL_SAI_TCR4:
-	case FSL_SAI_TCR5:
 	case FSL_SAI_TDR0:
 	case FSL_SAI_TDR1:
 	case FSL_SAI_TDR2:
@@ -804,12 +843,6 @@ static bool fsl_sai_writeable_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_TDR6:
 	case FSL_SAI_TDR7:
 	case FSL_SAI_TMR:
-	case FSL_SAI_RCSR:
-	case FSL_SAI_RCR1:
-	case FSL_SAI_RCR2:
-	case FSL_SAI_RCR3:
-	case FSL_SAI_RCR4:
-	case FSL_SAI_RCR5:
 	case FSL_SAI_RMR:
 		return true;
 	default:
@@ -817,15 +850,15 @@ static bool fsl_sai_writeable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct regmap_config fsl_sai_regmap_config = {
+static struct regmap_config fsl_sai_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
 	.fast_io = true,
 
 	.max_register = FSL_SAI_RMR,
-	.reg_defaults = fsl_sai_reg_defaults,
-	.num_reg_defaults = ARRAY_SIZE(fsl_sai_reg_defaults),
+	.reg_defaults = fsl_sai_reg_defaults_ofs0,
+	.num_reg_defaults = ARRAY_SIZE(fsl_sai_reg_defaults_ofs0),
 	.readable_reg = fsl_sai_readable_reg,
 	.volatile_reg = fsl_sai_volatile_reg,
 	.writeable_reg = fsl_sai_writeable_reg,
@@ -857,6 +890,12 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	if (sai->soc_data->reg_offset == 8) {
+		fsl_sai_regmap_config.reg_defaults = fsl_sai_reg_defaults_ofs8;
+		fsl_sai_regmap_config.num_reg_defaults =
+			ARRAY_SIZE(fsl_sai_reg_defaults_ofs8);
+	}
+
 	sai->regmap = devm_regmap_init_mmio_clk(&pdev->dev,
 			"bus", base, &fsl_sai_regmap_config);
 
@@ -971,11 +1010,13 @@ static int fsl_sai_remove(struct platform_device *pdev)
 static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
 	.use_imx_pcm = false,
 	.fifo_depth = 32,
+	.reg_offset = 0,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
 	.use_imx_pcm = true,
 	.fifo_depth = 32,
+	.reg_offset = 0,
 };
 
 static const struct of_device_id fsl_sai_ids[] = {
@@ -1008,6 +1049,7 @@ static int fsl_sai_runtime_suspend(struct device *dev)
 static int fsl_sai_runtime_resume(struct device *dev)
 {
 	struct fsl_sai *sai = dev_get_drvdata(dev);
+	unsigned int ofs = sai->soc_data->reg_offset;
 	int ret;
 
 	ret = clk_prepare_enable(sai->bus_clk);
@@ -1029,11 +1071,11 @@ static int fsl_sai_runtime_resume(struct device *dev)
 	}
 
 	regcache_cache_only(sai->regmap, false);
-	regmap_write(sai->regmap, FSL_SAI_TCSR, FSL_SAI_CSR_SR);
-	regmap_write(sai->regmap, FSL_SAI_RCSR, FSL_SAI_CSR_SR);
+	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR);
+	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR);
 	usleep_range(1000, 2000);
-	regmap_write(sai->regmap, FSL_SAI_TCSR, 0);
-	regmap_write(sai->regmap, FSL_SAI_RCSR, 0);
+	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
+	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
 
 	ret = regcache_sync(sai->regmap);
 	if (ret)
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 20c5b9b1e8bc..b89b0ca26053 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -14,12 +14,12 @@
 			 SNDRV_PCM_FMTBIT_S32_LE)
 
 /* SAI Register Map Register */
-#define FSL_SAI_TCSR	0x00 /* SAI Transmit Control */
-#define FSL_SAI_TCR1	0x04 /* SAI Transmit Configuration 1 */
-#define FSL_SAI_TCR2	0x08 /* SAI Transmit Configuration 2 */
-#define FSL_SAI_TCR3	0x0c /* SAI Transmit Configuration 3 */
-#define FSL_SAI_TCR4	0x10 /* SAI Transmit Configuration 4 */
-#define FSL_SAI_TCR5	0x14 /* SAI Transmit Configuration 5 */
+#define FSL_SAI_TCSR(ofs)	(0x00 + ofs) /* SAI Transmit Control */
+#define FSL_SAI_TCR1(ofs)	(0x04 + ofs) /* SAI Transmit Configuration 1 */
+#define FSL_SAI_TCR2(ofs)	(0x08 + ofs) /* SAI Transmit Configuration 2 */
+#define FSL_SAI_TCR3(ofs)	(0x0c + ofs) /* SAI Transmit Configuration 3 */
+#define FSL_SAI_TCR4(ofs)	(0x10 + ofs) /* SAI Transmit Configuration 4 */
+#define FSL_SAI_TCR5(ofs)	(0x14 + ofs) /* SAI Transmit Configuration 5 */
 #define FSL_SAI_TDR0	0x20 /* SAI Transmit Data 0 */
 #define FSL_SAI_TDR1	0x24 /* SAI Transmit Data 1 */
 #define FSL_SAI_TDR2	0x28 /* SAI Transmit Data 2 */
@@ -37,12 +37,12 @@
 #define FSL_SAI_TFR6	0x58 /* SAI Transmit FIFO 6 */
 #define FSL_SAI_TFR7	0x5C /* SAI Transmit FIFO 7 */
 #define FSL_SAI_TMR	0x60 /* SAI Transmit Mask */
-#define FSL_SAI_RCSR	0x80 /* SAI Receive Control */
-#define FSL_SAI_RCR1	0x84 /* SAI Receive Configuration 1 */
-#define FSL_SAI_RCR2	0x88 /* SAI Receive Configuration 2 */
-#define FSL_SAI_RCR3	0x8c /* SAI Receive Configuration 3 */
-#define FSL_SAI_RCR4	0x90 /* SAI Receive Configuration 4 */
-#define FSL_SAI_RCR5	0x94 /* SAI Receive Configuration 5 */
+#define FSL_SAI_RCSR(ofs)	(0x80 + ofs) /* SAI Receive Control */
+#define FSL_SAI_RCR1(ofs)	(0x84 + ofs)/* SAI Receive Configuration 1 */
+#define FSL_SAI_RCR2(ofs)	(0x88 + ofs) /* SAI Receive Configuration 2 */
+#define FSL_SAI_RCR3(ofs)	(0x8c + ofs) /* SAI Receive Configuration 3 */
+#define FSL_SAI_RCR4(ofs)	(0x90 + ofs) /* SAI Receive Configuration 4 */
+#define FSL_SAI_RCR5(ofs)	(0x94 + ofs) /* SAI Receive Configuration 5 */
 #define FSL_SAI_RDR0	0xa0 /* SAI Receive Data 0 */
 #define FSL_SAI_RDR1	0xa4 /* SAI Receive Data 1 */
 #define FSL_SAI_RDR2	0xa8 /* SAI Receive Data 2 */
@@ -61,14 +61,14 @@
 #define FSL_SAI_RFR7	0xdc /* SAI Receive FIFO 7 */
 #define FSL_SAI_RMR	0xe0 /* SAI Receive Mask */
 
-#define FSL_SAI_xCSR(tx)	(tx ? FSL_SAI_TCSR : FSL_SAI_RCSR)
-#define FSL_SAI_xCR1(tx)	(tx ? FSL_SAI_TCR1 : FSL_SAI_RCR1)
-#define FSL_SAI_xCR2(tx)	(tx ? FSL_SAI_TCR2 : FSL_SAI_RCR2)
-#define FSL_SAI_xCR3(tx)	(tx ? FSL_SAI_TCR3 : FSL_SAI_RCR3)
-#define FSL_SAI_xCR4(tx)	(tx ? FSL_SAI_TCR4 : FSL_SAI_RCR4)
-#define FSL_SAI_xCR5(tx)	(tx ? FSL_SAI_TCR5 : FSL_SAI_RCR5)
-#define FSL_SAI_xDR(tx)		(tx ? FSL_SAI_TDR : FSL_SAI_RDR)
-#define FSL_SAI_xFR(tx)		(tx ? FSL_SAI_TFR : FSL_SAI_RFR)
+#define FSL_SAI_xCSR(tx, ofs)	(tx ? FSL_SAI_TCSR(ofs) : FSL_SAI_RCSR(ofs))
+#define FSL_SAI_xCR1(tx, ofs)	(tx ? FSL_SAI_TCR1(ofs) : FSL_SAI_RCR1(ofs))
+#define FSL_SAI_xCR2(tx, ofs)	(tx ? FSL_SAI_TCR2(ofs) : FSL_SAI_RCR2(ofs))
+#define FSL_SAI_xCR3(tx, ofs)	(tx ? FSL_SAI_TCR3(ofs) : FSL_SAI_RCR3(ofs))
+#define FSL_SAI_xCR4(tx, ofs)	(tx ? FSL_SAI_TCR4(ofs) : FSL_SAI_RCR4(ofs))
+#define FSL_SAI_xCR5(tx, ofs)	(tx ? FSL_SAI_TCR5(ofs) : FSL_SAI_RCR5(ofs))
+#define FSL_SAI_xDR(tx, ofs)	(tx ? FSL_SAI_TDR(ofs) : FSL_SAI_RDR(ofs))
+#define FSL_SAI_xFR(tx, ofs)	(tx ? FSL_SAI_TFR(ofs) : FSL_SAI_RFR(ofs))
 #define FSL_SAI_xMR(tx)		(tx ? FSL_SAI_TMR : FSL_SAI_RMR)
 
 /* SAI Transmit/Receive Control Register */
@@ -158,6 +158,7 @@
 struct fsl_sai_soc_data {
 	bool use_imx_pcm;
 	unsigned int fifo_depth;
+	unsigned int reg_offset;
 };
 
 struct fsl_sai {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
