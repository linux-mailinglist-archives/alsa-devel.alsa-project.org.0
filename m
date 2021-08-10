Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FD63DAA10
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 19:25:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 777731EFD;
	Thu, 29 Jul 2021 19:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 777731EFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627579546;
	bh=7//iwFjJzh6FfaE8d24vtdJi4Q2uOJEd76CRF2PXIck=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZOWHYXkQT4a/DhsKahWp69/ZKMNiBZeNEFA9k4G4Y3/KvkraWnOgAzBRxBe8LlSyT
	 9h538HHeF6X0N3nbm3ELWAasygAu9hy3fjGYXDgtA9d/v3Vh74lryo3erozo2X2OHt
	 K8Mwmj8baVMoSk2haYGBgLZwNTr0ob2p0hZtPB0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C5F7F804E0;
	Thu, 29 Jul 2021 19:23:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1178BF804DF; Thu, 29 Jul 2021 19:23:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by alsa1.perex.cz (Postfix) with ESMTP id 98304F800E9
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 19:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98304F800E9
X-IronPort-AV: E=Sophos;i="5.84,279,1620658800"; d="scan'208";a="89179394"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 30 Jul 2021 02:23:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.2])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 50A914016D48;
 Fri, 30 Jul 2021 02:23:21 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v3 2/3] sound: soc: sh: Add RZ/G2L SSIF-2 driver
Date: Thu, 29 Jul 2021 18:23:10 +0100
Message-Id: <20210729172311.31111-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210729172311.31111-1-biju.das.jz@bp.renesas.com>
References: <20210729172311.31111-1-biju.das.jz@bp.renesas.com>
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Mark Brown <broonie@kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
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

Add serial sound interface(SSIF-2) driver support for
RZ/G2L SoC.

Based on the work done by Chris Brandt for RZ/A SSI driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
 * Fixed the dependency on KCONFIG
 * Improved Error handling in probe function
v1->v2:
 * No change
---
 sound/soc/sh/Kconfig  |   9 +
 sound/soc/sh/Makefile |   4 +
 sound/soc/sh/rz-ssi.c | 871 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 884 insertions(+)
 create mode 100644 sound/soc/sh/rz-ssi.c

diff --git a/sound/soc/sh/Kconfig b/sound/soc/sh/Kconfig
index 346c806ba390..db253328f49c 100644
--- a/sound/soc/sh/Kconfig
+++ b/sound/soc/sh/Kconfig
@@ -45,6 +45,15 @@ config SND_SOC_RCAR
 	help
 	  This option enables R-Car SRU/SCU/SSIU/SSI sound support
 
+config SND_SOC_RZ
+	tristate "RZ/G2L series SSIF-2 support"
+	depends on ARCH_R9A07G044 || COMPILE_TEST
+	select SND_SIMPLE_CARD
+	help
+	  This option enables ASoC sound support for the RZ/G2L MPUs.
+	  The simple-audio-card driver and the RZ/G2L built-in serial
+	  sound interface (SSIF-2) driver are used.
+
 ##
 ## Boards
 ##
diff --git a/sound/soc/sh/Makefile b/sound/soc/sh/Makefile
index 51bd7c81671c..f6fd79948f6a 100644
--- a/sound/soc/sh/Makefile
+++ b/sound/soc/sh/Makefile
@@ -22,3 +22,7 @@ snd-soc-migor-objs		:= migor.o
 
 obj-$(CONFIG_SND_SH7760_AC97)	+= snd-soc-sh7760-ac97.o
 obj-$(CONFIG_SND_SIU_MIGOR)	+= snd-soc-migor.o
+
+# RZ/G2L
+snd-soc-rz-ssi-objs		:= rz-ssi.o
+obj-$(CONFIG_SND_SOC_RZ)	+= snd-soc-rz-ssi.o
diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
new file mode 100644
index 000000000000..ff861d9130f9
--- /dev/null
+++ b/sound/soc/sh/rz-ssi.c
@@ -0,0 +1,871 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2L ASoC Serial Sound Interface (SSIF-2) Driver
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ * Copyright (C) 2019 Chris Brandt.
+ */
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <sound/soc.h>
+
+/* REGISTER OFFSET */
+#define SSICR			0x000
+#define SSISR			0x004
+#define SSIFCR			0x010
+#define SSIFSR			0x014
+#define SSIFTDR			0x018
+#define SSIFRDR			0x01c
+#define SSIOFR			0x020
+#define SSISCR			0x024
+
+/* SSI REGISTER BITS */
+#define SSICR_DWL(x)		(((x) & 0x7) << 19)
+#define SSICR_SWL(x)		(((x) & 0x7) << 16)
+#define SSICR_MST		BIT(14)
+#define SSICR_CKDV(x)		(((x) & 0xf) << 4)
+
+#define SSICR_CKS		BIT(30)
+#define SSICR_TUIEN		BIT(29)
+#define SSICR_TOIEN		BIT(28)
+#define SSICR_RUIEN		BIT(27)
+#define SSICR_ROIEN		BIT(26)
+#define SSICR_MST		BIT(14)
+#define SSICR_BCKP		BIT(13)
+#define SSICR_LRCKP		BIT(12)
+#define SSICR_CKDV(x)		(((x) & 0xf) << 4)
+#define SSICR_TEN		BIT(1)
+#define SSICR_REN		BIT(0)
+
+#define SSISR_TUIRQ		BIT(29)
+#define SSISR_TOIRQ		BIT(28)
+#define SSISR_RUIRQ		BIT(27)
+#define SSISR_ROIRQ		BIT(26)
+#define SSISR_IIRQ		BIT(25)
+
+#define SSIFCR_AUCKE		BIT(31)
+#define SSIFCR_SSIRST		BIT(16)
+#define SSIFCR_TIE		BIT(3)
+#define SSIFCR_RIE		BIT(2)
+#define SSIFCR_TFRST		BIT(1)
+#define SSIFCR_RFRST		BIT(0)
+
+#define SSIFSR_TDC_MASK		0x3f
+#define SSIFSR_TDC_SHIFT	24
+#define SSIFSR_RDC_MASK		0x3f
+#define SSIFSR_RDC_SHIFT	8
+
+#define SSIFSR_TDC(x)		(((x) & 0x1f) << 24)
+#define SSIFSR_TDE		BIT(16)
+#define SSIFSR_RDC(x)		(((x) & 0x1f) << 8)
+#define SSIFSR_RDF		BIT(0)
+
+#define SSIOFR_LRCONT		BIT(8)
+
+#define SSISCR_TDES(x)		(((x) & 0x1f) << 8)
+#define SSISCR_RDFS(x)		(((x) & 0x1f) << 0)
+
+/* Pre allocated buffers sizes */
+#define PREALLOC_BUFFER		(SZ_32K)
+#define PREALLOC_BUFFER_MAX	(SZ_32K)
+
+#define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-44.1kHz */
+#define SSI_FMTS		SNDRV_PCM_FMTBIT_S16_LE
+#define SSI_CHAN_MIN		2
+#define SSI_CHAN_MAX		2
+#define SSI_FIFO_DEPTH		32
+
+struct rz_ssi_priv;
+
+struct rz_ssi_stream {
+	struct rz_ssi_priv *priv;
+	struct snd_pcm_substream *substream;
+	int fifo_sample_size;	/* sample capacity of SSI FIFO */
+	int period_counter;	/* for keeping track of periods transferred */
+	int sample_width;
+	int buffer_pos;		/* current frame position in the buffer */
+	int running;		/* 0=stopped, 1=running */
+
+	int uerr_num;
+	int oerr_num;
+
+	int (*transfer)(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm);
+};
+
+struct rz_ssi_priv {
+	void __iomem *base;
+	struct platform_device *pdev;
+	struct reset_control *rstc;
+	struct device *dev;
+	struct clk *sfr_clk;
+	struct clk *clk;
+
+	int irq_int;
+	int irq_tx;
+	int irq_rx;
+
+	spinlock_t lock;
+
+	/*
+	 * The SSI supports full-duplex transmission and reception.
+	 * However, if an error occurs, channel reset (both transmission
+	 * and reception reset) is required.
+	 * So it is better to use as half-duplex (playing and recording
+	 * should be done on separate channels).
+	 */
+	struct rz_ssi_stream playback;
+	struct rz_ssi_stream capture;
+
+	/* clock */
+	unsigned long audio_mck;
+	unsigned long audio_clk_1;
+	unsigned long audio_clk_2;
+
+	bool lrckp_fsync_fall;	/* LR clock polarity (SSICR.LRCKP) */
+	bool bckp_rise;	/* Bit clock polarity (SSICR.BCKP) */
+};
+
+static void rz_ssi_reg_writel(struct rz_ssi_priv *priv, uint reg, u32 data)
+{
+	writel(data, (priv->base + reg));
+}
+
+static u32 rz_ssi_reg_readl(struct rz_ssi_priv *priv, uint reg)
+{
+	return readl(priv->base + reg);
+}
+
+static void rz_ssi_reg_mask_setl(struct rz_ssi_priv __iomem *priv, uint reg,
+				 u32 bclr, u32 bset)
+{
+	u32 val;
+
+	val = readl(priv->base + reg);
+	val = (val & ~bclr) | bset;
+	writel(val, (priv->base + reg));
+}
+
+static inline struct snd_soc_dai *
+rz_ssi_get_dai(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+
+	return asoc_rtd_to_cpu(rtd, 0);
+}
+
+static inline bool rz_ssi_stream_is_play(struct rz_ssi_priv *ssi,
+					 struct rz_ssi_stream *strm)
+{
+	return strm->substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+}
+
+static inline struct rz_ssi_stream *
+rz_ssi_stream_get(struct rz_ssi_priv *ssi, struct snd_pcm_substream *substream)
+{
+	struct rz_ssi_stream *stream = &ssi->playback;
+
+	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+		stream = &ssi->capture;
+
+	return stream;
+}
+
+static int rz_ssi_stream_is_valid(struct rz_ssi_priv *ssi,
+				  struct rz_ssi_stream *strm)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&ssi->lock, flags);
+	ret = !!(strm->substream && strm->substream->runtime);
+	spin_unlock_irqrestore(&ssi->lock, flags);
+
+	return ret;
+}
+
+static int rz_ssi_stream_init(struct rz_ssi_priv *ssi,
+			      struct rz_ssi_stream *strm,
+			      struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	strm->substream = substream;
+
+	strm->sample_width = samples_to_bytes(runtime, 1);
+	strm->period_counter = 0;
+	strm->buffer_pos = 0;
+
+	strm->oerr_num = 0;
+	strm->uerr_num = 0;
+	strm->running = 0;
+
+	/* fifo init */
+	strm->fifo_sample_size = SSI_FIFO_DEPTH;
+
+	if (runtime->sample_bits != 16) {
+		dev_err(ssi->dev, "Unsupported sample width: %d\n",
+			runtime->sample_bits);
+		strm->substream = NULL;
+		return -EINVAL;
+	}
+
+	if (runtime->frame_bits != 32) {
+		dev_err(ssi->dev, "Unsupported frame width: %d\n",
+			runtime->sample_bits);
+		strm->substream = NULL;
+		return -EINVAL;
+	}
+
+	if (runtime->channels != 2) {
+		dev_err(ssi->dev, "Number of channels not matched\n");
+		strm->substream = NULL;
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,
+			       struct rz_ssi_stream *strm)
+{
+	struct snd_soc_dai *dai = rz_ssi_get_dai(strm->substream);
+	unsigned long flags;
+
+	if (strm->oerr_num > 0)
+		dev_info(dai->dev, "overrun = %d\n", strm->oerr_num);
+
+	if (strm->uerr_num > 0)
+		dev_info(dai->dev, "underrun = %d\n", strm->uerr_num);
+
+	spin_lock_irqsave(&ssi->lock, flags);
+	strm->substream = NULL;
+	spin_unlock_irqrestore(&ssi->lock, flags);
+}
+
+static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
+			    unsigned int channels)
+{
+	static s8 ckdv[16] = { 1,  2,  4,  8, 16, 32, 64, 128,
+			       6, 12, 24, 48, 96, -1, -1, -1 };
+	unsigned int channel_bits = 32;	/* System Word Length */
+	unsigned long bclk_rate = rate * channels * channel_bits;
+	unsigned int div;
+	unsigned int i;
+	u32 ssicr = 0;
+	u32 clk_ckdv;
+
+	/* Clear AUCKE so we can set MST */
+	rz_ssi_reg_writel(ssi, SSIFCR, 0);
+
+	/* Continue to output LRCK pin even when idle */
+	rz_ssi_reg_writel(ssi, SSIOFR, SSIOFR_LRCONT);
+	if (ssi->audio_clk_1 && ssi->audio_clk_2) {
+		if (ssi->audio_clk_1 % bclk_rate)
+			ssi->audio_mck = ssi->audio_clk_2;
+		else
+			ssi->audio_mck = ssi->audio_clk_1;
+	}
+
+	/* Clock setting */
+	ssicr |= SSICR_MST;
+	if (ssi->audio_mck == ssi->audio_clk_1)
+		ssicr |= SSICR_CKS;
+	if (ssi->bckp_rise)
+		ssicr |= SSICR_BCKP;
+	if (ssi->lrckp_fsync_fall)
+		ssicr |= SSICR_LRCKP;
+
+	/* Determine the clock divider */
+	clk_ckdv = 0;
+	div = ssi->audio_mck / bclk_rate;
+	/* try to find an match */
+	for (i = 0; i < ARRAY_SIZE(ckdv); i++) {
+		if (ckdv[i] == div) {
+			clk_ckdv = i;
+			break;
+		}
+	}
+
+	if (i == ARRAY_SIZE(ckdv)) {
+		dev_err(ssi->dev, "Rate not divisible by audio clock source\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * DWL: Data Word Length = 16 bits
+	 * SWL: System Word Length = 32 bits
+	 */
+	ssicr |= SSICR_CKDV(clk_ckdv);
+	ssicr |= SSICR_DWL(1) | SSICR_SWL(3);
+	rz_ssi_reg_writel(ssi, SSICR, ssicr);
+	rz_ssi_reg_writel(ssi, SSIFCR,
+			  (SSIFCR_AUCKE | SSIFCR_TFRST | SSIFCR_RFRST));
+
+	return 0;
+}
+
+static int rz_ssi_start_stop(struct rz_ssi_priv *ssi,
+			     struct rz_ssi_stream *strm,
+			     int start)
+{
+	u32 ssicr, ssifcr;
+	int timeout;
+
+	if (start) {
+		ssicr = rz_ssi_reg_readl(ssi, SSICR);
+		ssifcr = rz_ssi_reg_readl(ssi, SSIFCR) & ~0xF;
+
+		/* FIFO interrupt thresholds */
+		rz_ssi_reg_writel(ssi, SSISCR,
+				  SSISCR_TDES(strm->fifo_sample_size / 2 - 1) |
+				  SSISCR_RDFS(0));
+
+		/* enable IRQ */
+		if (rz_ssi_stream_is_play(ssi, strm)) {
+			ssicr |= SSICR_TUIEN | SSICR_TOIEN;
+			ssifcr |= SSIFCR_TIE | SSIFCR_RFRST;
+		} else {
+			ssicr |= SSICR_RUIEN | SSICR_ROIEN;
+			ssifcr |= SSIFCR_RIE | SSIFCR_TFRST;
+		}
+
+		rz_ssi_reg_writel(ssi, SSICR, ssicr);
+		rz_ssi_reg_writel(ssi, SSIFCR, ssifcr);
+
+		/* Clear all error flags */
+		rz_ssi_reg_mask_setl(ssi, SSISR,
+				     (SSISR_TOIRQ | SSISR_TUIRQ | SSISR_ROIRQ |
+				      SSISR_RUIRQ), 0);
+
+		strm->running = 1;
+		ssicr |= rz_ssi_stream_is_play(ssi, strm) ? SSICR_TEN : SSICR_REN;
+		rz_ssi_reg_writel(ssi, SSICR, ssicr);
+
+	} else {
+		strm->running = 0;
+
+		/* Disable irqs */
+		rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TUIEN | SSICR_TOIEN |
+				     SSICR_RUIEN | SSICR_ROIEN, 0);
+		rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_TIE | SSIFCR_RIE, 0);
+
+		/* Clear all error flags */
+		rz_ssi_reg_mask_setl(ssi, SSISR,
+				     (SSISR_TOIRQ | SSISR_TUIRQ | SSISR_ROIRQ |
+				      SSISR_RUIRQ), 0);
+
+		/* Wait for idle */
+		timeout = 100;
+		while (--timeout) {
+			if (rz_ssi_reg_readl(ssi, SSISR) | SSISR_IIRQ)
+				break;
+			udelay(1);
+		}
+
+		if (!timeout)
+			dev_info(ssi->dev, "timeout waiting for SSI idle\n");
+
+		/* Disable TX/RX */
+		rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
+
+		/* Hold FIFOs in reset */
+		rz_ssi_reg_mask_setl(ssi, SSIFCR, 0,
+				     SSIFCR_TFRST | SSIFCR_RFRST);
+	}
+
+	return 0;
+}
+
+static void rz_ssi_pointer_update(struct rz_ssi_stream *strm, int frames)
+{
+	struct snd_pcm_runtime *runtime = strm->substream->runtime;
+	int current_period;
+
+	strm->buffer_pos += frames;
+	WARN_ON(strm->buffer_pos > runtime->buffer_size);
+
+	/* ring buffer */
+	if (strm->buffer_pos == runtime->buffer_size)
+		strm->buffer_pos = 0;
+
+	current_period = strm->buffer_pos / runtime->period_size;
+	if (strm->period_counter != current_period) {
+		snd_pcm_period_elapsed(strm->substream);
+		strm->period_counter = current_period;
+	}
+}
+
+static int rz_ssi_pio_recv(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
+{
+	struct snd_pcm_substream *substream = strm->substream;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	u16 *buf;
+	int fifo_samples;
+	int frames_left;
+	int samples = 0;
+	int i;
+
+	if (!rz_ssi_stream_is_valid(ssi, strm))
+		return -EINVAL;
+
+	/* frames left in this period */
+	frames_left = runtime->period_size - (strm->buffer_pos %
+					      runtime->period_size);
+	if (frames_left == 0)
+		frames_left = runtime->period_size;
+
+	/* Samples in RX FIFO */
+	fifo_samples = (rz_ssi_reg_readl(ssi, SSIFSR) >>
+			SSIFSR_RDC_SHIFT) & SSIFSR_RDC_MASK;
+
+	/* Only read full frames at a time */
+	while (frames_left && (fifo_samples >= runtime->channels)) {
+		samples += runtime->channels;
+		fifo_samples -= runtime->channels;
+		frames_left--;
+	}
+
+	/* not enough samples yet */
+	if (samples == 0)
+		return 0;
+
+	/* calculate new buffer index */
+	buf = (u16 *)(strm->substream->runtime->dma_area);
+	buf += strm->buffer_pos * runtime->channels;
+
+	/* Note, only supports 16-bit samples */
+	for (i = 0; i < samples; i++)
+		*buf++ = (u16)(rz_ssi_reg_readl(ssi, SSIFRDR) >> 16);
+
+	rz_ssi_reg_mask_setl(ssi, SSIFSR, SSIFSR_RDF, 0);
+	rz_ssi_pointer_update(strm, samples / runtime->channels);
+
+	/*
+	 * If we finished this period, but there are more samples in
+	 * the RX FIFO, call this function again
+	 */
+	if (frames_left == 0 && fifo_samples >= runtime->channels)
+		rz_ssi_pio_recv(ssi, strm);
+
+	return 0;
+}
+
+static int rz_ssi_pio_send(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
+{
+	struct snd_pcm_substream *substream = strm->substream;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	int sample_space;
+	int samples = 0;
+	int frames_left;
+	int i;
+	u32 ssifsr;
+	u16 *buf;
+
+	if (!rz_ssi_stream_is_valid(ssi, strm))
+		return -EINVAL;
+
+	/* frames left in this period */
+	frames_left = runtime->period_size - (strm->buffer_pos %
+					      runtime->period_size);
+	if (frames_left == 0)
+		frames_left = runtime->period_size;
+
+	sample_space = strm->fifo_sample_size;
+	ssifsr = rz_ssi_reg_readl(ssi, SSIFSR);
+	sample_space -= (ssifsr >> SSIFSR_TDC_SHIFT) & SSIFSR_TDC_MASK;
+
+	/* Only add full frames at a time */
+	while (frames_left && (sample_space >= runtime->channels)) {
+		samples += runtime->channels;
+		sample_space -= runtime->channels;
+		frames_left--;
+	}
+
+	/* no space to send anything right now */
+	if (samples == 0)
+		return 0;
+
+	/* calculate new buffer index */
+	buf = (u16 *)(strm->substream->runtime->dma_area);
+	buf += strm->buffer_pos * runtime->channels;
+
+	/* Note, only supports 16-bit samples */
+	for (i = 0; i < samples; i++)
+		rz_ssi_reg_writel(ssi, SSIFTDR, ((u32)(*buf++) << 16));
+
+	rz_ssi_reg_mask_setl(ssi, SSIFSR, SSIFSR_TDE, 0);
+	rz_ssi_pointer_update(strm, samples / runtime->channels);
+
+	return 0;
+}
+
+static irqreturn_t rz_ssi_interrupt(int irq, void *data)
+{
+	struct rz_ssi_stream *strm = NULL;
+	struct rz_ssi_priv *ssi = data;
+	u32 ssisr = rz_ssi_reg_readl(ssi, SSISR);
+
+	if (ssi->playback.substream)
+		strm = &ssi->playback;
+	else if (ssi->capture.substream)
+		strm = &ssi->capture;
+	else
+		return IRQ_HANDLED; /* Left over TX/RX interrupt */
+
+	if (irq == ssi->irq_int) { /* error or idle */
+		if (ssisr & SSISR_TUIRQ)
+			strm->uerr_num++;
+		if (ssisr & SSISR_TOIRQ)
+			strm->oerr_num++;
+		if (ssisr & SSISR_RUIRQ)
+			strm->uerr_num++;
+		if (ssisr & SSISR_ROIRQ)
+			strm->oerr_num++;
+
+		if (ssisr & (SSISR_TUIRQ | SSISR_TOIRQ | SSISR_RUIRQ |
+			     SSISR_ROIRQ)) {
+			/* Error handling */
+			/* You must reset (stop/restart) after each interrupt */
+			rz_ssi_start_stop(ssi, strm, 0);
+
+			/* Clear all flags */
+			rz_ssi_reg_mask_setl(ssi, SSISR, SSISR_TOIRQ |
+					     SSISR_TUIRQ | SSISR_ROIRQ |
+					     SSISR_RUIRQ, 0);
+
+			/* Add/remove more data */
+			strm->transfer(ssi, strm);
+
+			/* Resume */
+			rz_ssi_start_stop(ssi, strm, 1);
+		}
+	}
+
+	if (!strm->running)
+		return IRQ_HANDLED;
+
+	/* tx data empty */
+	if (irq == ssi->irq_tx)
+		strm->transfer(ssi, &ssi->playback);
+
+	/* rx data full */
+	if (irq == ssi->irq_rx) {
+		strm->transfer(ssi, &ssi->capture);
+		rz_ssi_reg_mask_setl(ssi, SSIFSR, SSIFSR_RDF, 0);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+			      struct snd_soc_dai *dai)
+{
+	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
+	struct rz_ssi_stream *strm = rz_ssi_stream_get(ssi, substream);
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		/* Soft Reset */
+		rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);
+		rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
+		udelay(5);
+
+		ret = rz_ssi_stream_init(ssi, strm, substream);
+		if (ret)
+			goto done;
+
+		ret = strm->transfer(ssi, strm);
+		if (ret)
+			goto done;
+
+		ret = rz_ssi_start_stop(ssi, strm, 1);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+		rz_ssi_start_stop(ssi, strm, 0);
+		rz_ssi_stream_quit(ssi, strm);
+		break;
+	}
+
+done:
+	return ret;
+}
+
+static int rz_ssi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
+
+	/* set master/slave audio interface */
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		asm("nop"); /* codec is slave */
+		break;
+	default:
+		dev_err(ssi->dev, "Only master mode is supported.\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * set clock polarity
+	 *
+	 * "normal" BCLK = Signal is available at rising edge of BCLK
+	 * "normal" FSYNC = (I2S) Left ch starts with falling FSYNC edge
+	 */
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		ssi->bckp_rise = false;
+		ssi->lrckp_fsync_fall = false;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+		ssi->bckp_rise = false;
+		ssi->lrckp_fsync_fall = true;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		ssi->bckp_rise = true;
+		ssi->lrckp_fsync_fall = false;
+		break;
+	case SND_SOC_DAIFMT_IB_IF:
+		ssi->bckp_rise = true;
+		ssi->lrckp_fsync_fall = true;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* only i2s support */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		break;
+	default:
+		dev_err(ssi->dev, "Only I2S mode is supported.\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
+
+	return rz_ssi_clk_setup(ssi, params_rate(params),
+				params_channels(params));
+}
+
+static const struct snd_soc_dai_ops rz_ssi_dai_ops = {
+	.trigger	= rz_ssi_dai_trigger,
+	.set_fmt	= rz_ssi_dai_set_fmt,
+	.hw_params	= rz_ssi_dai_hw_params,
+};
+
+static const struct snd_pcm_hardware rz_ssi_pcm_hardware = {
+	.info			= SNDRV_PCM_INFO_INTERLEAVED	|
+				  SNDRV_PCM_INFO_MMAP		|
+				  SNDRV_PCM_INFO_MMAP_VALID,
+	.buffer_bytes_max	= PREALLOC_BUFFER,
+	.period_bytes_min	= 32,
+	.period_bytes_max	= 8192,
+	.channels_min		= SSI_CHAN_MIN,
+	.channels_max		= SSI_CHAN_MAX,
+	.periods_min		= 1,
+	.periods_max		= 32,
+	.fifo_size		= 32 * 2,
+};
+
+static int rz_ssi_pcm_open(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
+{
+	snd_soc_set_runtime_hwparams(substream, &rz_ssi_pcm_hardware);
+
+	return snd_pcm_hw_constraint_integer(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+}
+
+static snd_pcm_uframes_t rz_ssi_pcm_pointer(struct snd_soc_component *component,
+					    struct snd_pcm_substream *substream)
+{
+	struct snd_soc_dai *dai = rz_ssi_get_dai(substream);
+	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
+	struct rz_ssi_stream *strm = rz_ssi_stream_get(ssi, substream);
+
+	return strm->buffer_pos;
+}
+
+static int rz_ssi_pcm_new(struct snd_soc_component *component,
+			  struct snd_soc_pcm_runtime *rtd)
+{
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+				       rtd->card->snd_card->dev,
+				       PREALLOC_BUFFER, PREALLOC_BUFFER_MAX);
+	return 0;
+}
+
+static struct snd_soc_dai_driver rz_ssi_soc_dai[] = {
+	{
+		.name			= "rz-ssi-dai",
+		.playback = {
+			.rates		= SSI_RATES,
+			.formats	= SSI_FMTS,
+			.channels_min	= SSI_CHAN_MIN,
+			.channels_max	= SSI_CHAN_MAX,
+		},
+		.capture = {
+			.rates		= SSI_RATES,
+			.formats	= SSI_FMTS,
+			.channels_min	= SSI_CHAN_MIN,
+			.channels_max	= SSI_CHAN_MAX,
+		},
+		.ops = &rz_ssi_dai_ops,
+	},
+};
+
+static const struct snd_soc_component_driver rz_ssi_soc_component = {
+	.name		= "rz-ssi",
+	.open		= rz_ssi_pcm_open,
+	.pointer	= rz_ssi_pcm_pointer,
+	.pcm_construct	= rz_ssi_pcm_new,
+};
+
+static int rz_ssi_probe(struct platform_device *pdev)
+{
+	struct rz_ssi_priv *ssi;
+	struct clk *audio_clk;
+	int ret;
+
+	ssi = devm_kzalloc(&pdev->dev, sizeof(*ssi), GFP_KERNEL);
+	if (!ssi)
+		return -ENOMEM;
+
+	ssi->pdev = pdev;
+	ssi->dev = &pdev->dev;
+	ssi->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(ssi->base))
+		return PTR_ERR(ssi->base);
+
+	ssi->clk = devm_clk_get(&pdev->dev, "ssi");
+	if (IS_ERR(ssi->clk))
+		return PTR_ERR(ssi->clk);
+
+	ssi->sfr_clk = devm_clk_get(&pdev->dev, "ssi_sfr");
+	if (IS_ERR(ssi->sfr_clk))
+		return PTR_ERR(ssi->sfr_clk);
+
+	audio_clk = devm_clk_get(&pdev->dev, "audio_clk1");
+	if (IS_ERR(audio_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(audio_clk),
+				     "no audio clk1");
+
+	ssi->audio_clk_1 = clk_get_rate(audio_clk);
+	audio_clk = devm_clk_get(&pdev->dev, "audio_clk2");
+	if (IS_ERR(audio_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(audio_clk),
+				     "no audio clk2");
+
+	ssi->audio_clk_2 = clk_get_rate(audio_clk);
+	if (!(ssi->audio_clk_1 || ssi->audio_clk_2))
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "no audio clk1 or audio clk2");
+
+	ssi->audio_mck = ssi->audio_clk_1 ? ssi->audio_clk_1 : ssi->audio_clk_2;
+
+	ssi->playback.transfer = rz_ssi_pio_send;
+	ssi->capture.transfer = rz_ssi_pio_recv;
+	ssi->playback.priv = ssi;
+	ssi->capture.priv = ssi;
+
+	/* Error Interrupt */
+	ssi->irq_int = platform_get_irq_byname(pdev, "int_req");
+	if (ssi->irq_int < 0)
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Unable to get SSI int_req IRQ\n");
+
+	ret = devm_request_irq(&pdev->dev, ssi->irq_int, &rz_ssi_interrupt,
+			       0, dev_name(&pdev->dev), ssi);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "irq request error (int_req)\n");
+
+	/* Tx and Rx interrupts (pio only) */
+	ssi->irq_tx = platform_get_irq_byname(pdev, "dma_tx");
+	if (ssi->irq_tx < 0)
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Unable to get SSI dma_tx IRQ\n");
+
+	ret = devm_request_irq(&pdev->dev, ssi->irq_tx, &rz_ssi_interrupt, 0,
+			       dev_name(&pdev->dev), ssi);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "irq request error (dma_tx)\n");
+
+	ssi->irq_rx = platform_get_irq_byname(pdev, "dma_rx");
+	if (ssi->irq_rx < 0)
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Unable to get SSI dma_rx IRQ\n");
+
+	ret = devm_request_irq(&pdev->dev, ssi->irq_rx, &rz_ssi_interrupt, 0,
+			       dev_name(&pdev->dev), ssi);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "irq request error (dma_rx)\n");
+
+	ssi->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(ssi->rstc))
+		return PTR_ERR(ssi->rstc);
+
+	reset_control_deassert(ssi->rstc);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_resume_and_get(&pdev->dev);
+
+	spin_lock_init(&ssi->lock);
+	dev_set_drvdata(&pdev->dev, ssi);
+	ret = devm_snd_soc_register_component(&pdev->dev, &rz_ssi_soc_component,
+					      rz_ssi_soc_dai,
+					      ARRAY_SIZE(rz_ssi_soc_dai));
+	if (ret < 0) {
+		pm_runtime_put(ssi->dev);
+		pm_runtime_disable(ssi->dev);
+		reset_control_assert(ssi->rstc);
+		dev_err(&pdev->dev, "failed to register snd component\n");
+	}
+
+	return ret;
+}
+
+static int rz_ssi_remove(struct platform_device *pdev)
+{
+	struct rz_ssi_priv *ssi = dev_get_drvdata(&pdev->dev);
+
+	pm_runtime_put(ssi->dev);
+	pm_runtime_disable(ssi->dev);
+	reset_control_assert(ssi->rstc);
+
+	return 0;
+}
+
+static const struct of_device_id rz_ssi_of_match[] = {
+	{ .compatible = "renesas,rz-ssi", },
+	{/* Sentinel */},
+};
+MODULE_DEVICE_TABLE(of, rz_ssi_of_match);
+
+static struct platform_driver rz_ssi_driver = {
+	.driver	= {
+		.name	= "rz-ssi-pcm-audio",
+		.of_match_table = rz_ssi_of_match,
+	},
+	.probe		= rz_ssi_probe,
+	.remove		= rz_ssi_remove,
+};
+
+module_platform_driver(rz_ssi_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Renesas RZ/G2L ASoC Serial Sound Interface Driver");
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
-- 
2.17.1

