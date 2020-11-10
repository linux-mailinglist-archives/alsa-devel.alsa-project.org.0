Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2C42AEAC3
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 09:03:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9F701763;
	Wed, 11 Nov 2020 09:02:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9F701763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605081821;
	bh=fAfmMCLNoPASg0fYsRO/XlvaKp0D7zkPIpRmKwHen6M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z2ZXsuKUTphR3Zcwm9Z9aCgN9QtOnrODwmazCBkV1McYUnuzwu/NmqQNWP2D3uxU5
	 jR7992zki3dvdW+efLuTqQYIgAWKxpIZsNHa+BZGctISd3Y4IFesrfyJYF9iZxyHBD
	 RDQB71q+akjw/8t8e/gdB2bCsAZfGvtc3bI/HCvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CAB4F804E4;
	Wed, 11 Nov 2020 09:00:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AAFDF801D5; Tue, 10 Nov 2020 21:40:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50DCAF80212
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 21:40:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50DCAF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jl/H62Sz"
Received: by mail-qk1-x733.google.com with SMTP id l2so12902458qkf.0
 for <alsa-devel@alsa-project.org>; Tue, 10 Nov 2020 12:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U1Vxx3On5OoCGlAJlMT9R/O092hYIbQ/lZQCU95J+O4=;
 b=jl/H62Szjzds9H+/BLbXV48Zd82e5yzlUSvNgY4w41OJcQ04/5henmVYl8cQOLvaY+
 7jD54wjEgO9rx4RpkGgnCF9L0i2+anH/2mr6ZgRTlwgQfFHltZJLege6NHiUxBe7oR/n
 RKRxn4ytrhGSbfhjnwRU/68kXTdGdyyVgTRKye0IAnmG9EoErBx9u/ons2GTen2Ut1eQ
 Twg8zKHaRbzX8UCgyfp2JTFAqNqcOSOVF551HFrQ3Ui4AnEr8+XVUUteNJqOQW4KCkpR
 bslLEl5wEDeX1Q1kCSW9/6pY/nmIJwCCdPMSKTBPLWTB6f+mSevMURueJq78yFT12sSX
 5M6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U1Vxx3On5OoCGlAJlMT9R/O092hYIbQ/lZQCU95J+O4=;
 b=S2f/rfbobXYlc0UVuDhNo/eDG285gKBUQLtZjxfz/Fz3nEhVcdKTv6NUrxhUHbQkrJ
 TThASzLbWWZB6KXrfO391uHFcqOBkzuE/ovZr7u6bncNKw1dCLd6215WuEWt/JRl/ANl
 4k6m96/vzUGoRXxjz9Ch5nSywOKTdhDjUmvqCNJY2nh0tb36e3Qzzod/kBkPQUmQcK3w
 P8bYRq33Acq2fVRBLCOZhVd8YGLdl7vYr+3PUs5OXvr0dseyejD5VvN+nqEw728bYQbg
 sQD22VqDFm7HkX9JnpG5bCprMF3TDFptPJlvA6xIxaVroYB2EIx/IhXG/eXNXYNYLeco
 Tzjw==
X-Gm-Message-State: AOAM530q04e6FQcP/6Rh5yp7zIfNJWeX8hGqnmeKXN7pCNzZslRmXRte
 j1NEuAR7AtG9XAsbv2RC204=
X-Google-Smtp-Source: ABdhPJwXIPHHg484bs6p7eaAX5iJgKj9tZLPDi3kQwNPvBgCxHW/VccQKT2eScfGuVlFH+QiAiPbIA==
X-Received: by 2002:a05:620a:b19:: with SMTP id
 t25mr21464953qkg.204.1605040805858; 
 Tue, 10 Nov 2020 12:40:05 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:997:69a4:dc84:4b91:560e])
 by smtp.gmail.com with ESMTPSA id
 a85sm6247719qkg.3.2020.11.10.12.40.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 12:40:05 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 6/6] ASoC: imx-ssi: Remove unused driver
Date: Tue, 10 Nov 2020 17:39:37 -0300
Message-Id: <20201110203937.25684-6-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201110203937.25684-1-festevam@gmail.com>
References: <20201110203937.25684-1-festevam@gmail.com>
X-Mailman-Approved-At: Wed, 11 Nov 2020 09:00:11 +0100
Cc: nicoleotsuka@gmail.com, shengjiu.wang@nxp.com,
 Fabio Estevam <festevam@gmail.com>, alsa-devel@alsa-project.org
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

The imx-ssi driver was only used by i.MX non-DT platforms.

Since 5.10-rc1, i.MX has been converted to a DT-only platform and all
board files are gone.

Remove the imx-ssi audio driver as there are no more users at all.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/Kconfig   |   6 +-
 sound/soc/fsl/Makefile  |   2 -
 sound/soc/fsl/imx-ssi.c | 651 ----------------------------------------
 3 files changed, 1 insertion(+), 658 deletions(-)
 delete mode 100644 sound/soc/fsl/imx-ssi.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 31897fff6c71..a299f61e529e 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -228,15 +228,11 @@ endif # SND_POWERPC_SOC
 
 config SND_SOC_IMX_PCM_FIQ
 	tristate
-	default y if SND_SOC_IMX_SSI=y && (SND_SOC_FSL_SSI=m || SND_SOC_FSL_SPDIF=m) && (MXC_TZIC || MXC_AVIC)
+	default y if (SND_SOC_FSL_SSI=m || SND_SOC_FSL_SPDIF=m) && (MXC_TZIC || MXC_AVIC)
 	select FIQ
 
 if SND_IMX_SOC
 
-config SND_SOC_IMX_SSI
-	tristate
-	select SND_SOC_FSL_UTILS
-
 comment "SoC Audio support for Freescale i.MX boards:"
 
 config SND_SOC_EUKREA_TLV320
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index 5637ebbe8ab2..0b20e038b65b 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -53,9 +53,7 @@ obj-$(CONFIG_SND_MPC52xx_SOC_PCM030) += pcm030-audio-fabric.o
 obj-$(CONFIG_SND_MPC52xx_SOC_EFIKA) += efika-audio-fabric.o
 
 # i.MX Platform Support
-snd-soc-imx-ssi-objs := imx-ssi.o
 snd-soc-imx-audmux-objs := imx-audmux.o
-obj-$(CONFIG_SND_SOC_IMX_SSI) += snd-soc-imx-ssi.o
 obj-$(CONFIG_SND_SOC_IMX_AUDMUX) += snd-soc-imx-audmux.o
 
 obj-$(CONFIG_SND_SOC_IMX_PCM_FIQ) += imx-pcm-fiq.o
diff --git a/sound/soc/fsl/imx-ssi.c b/sound/soc/fsl/imx-ssi.c
deleted file mode 100644
index f8488e8f5f5b..000000000000
--- a/sound/soc/fsl/imx-ssi.c
+++ /dev/null
@@ -1,651 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-//
-// imx-ssi.c  --  ALSA Soc Audio Layer
-//
-// Copyright 2009 Sascha Hauer <s.hauer@pengutronix.de>
-//
-// This code is based on code copyrighted by Freescale,
-// Liam Girdwood, Javier Martin and probably others.
-//
-// The i.MX SSI core has some nasty limitations in AC97 mode. While most
-// sane processor vendors have a FIFO per AC97 slot, the i.MX has only
-// one FIFO which combines all valid receive slots. We cannot even select
-// which slots we want to receive. The WM9712 with which this driver
-// was developed with always sends GPIO status data in slot 12 which
-// we receive in our (PCM-) data stream. The only chance we have is to
-// manually skip this data in the FIQ handler. With sampling rates different
-// from 48000Hz not every frame has valid receive data, so the ratio
-// between pcm data and GPIO status data changes. Our FIQ handler is not
-// able to handle this, hence this driver only works with 48000Hz sampling
-// rate.
-// Reading and writing AC97 registers is another challenge. The core
-// provides us status bits when the read register is updated with *another*
-// value. When we read the same register two times (and the register still
-// contains the same value) these status bits are not set. We work
-// around this by not polling these bits but only wait a fixed delay.
-
-#include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/device.h>
-#include <linux/dma-mapping.h>
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-
-#include <sound/core.h>
-#include <sound/initval.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-
-#include <linux/platform_data/asoc-imx-ssi.h>
-
-#include "imx-ssi.h"
-#include "fsl_utils.h"
-
-#define SSI_SACNT_DEFAULT (SSI_SACNT_AC97EN | SSI_SACNT_FV)
-
-/*
- * SSI Network Mode or TDM slots configuration.
- * Should only be called when port is inactive (i.e. SSIEN = 0).
- */
-static int imx_ssi_set_dai_tdm_slot(struct snd_soc_dai *cpu_dai,
-	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width)
-{
-	struct imx_ssi *ssi = snd_soc_dai_get_drvdata(cpu_dai);
-	u32 sccr;
-
-	sccr = readl(ssi->base + SSI_STCCR);
-	sccr &= ~SSI_STCCR_DC_MASK;
-	sccr |= SSI_STCCR_DC(slots - 1);
-	writel(sccr, ssi->base + SSI_STCCR);
-
-	sccr = readl(ssi->base + SSI_SRCCR);
-	sccr &= ~SSI_STCCR_DC_MASK;
-	sccr |= SSI_STCCR_DC(slots - 1);
-	writel(sccr, ssi->base + SSI_SRCCR);
-
-	writel(~tx_mask, ssi->base + SSI_STMSK);
-	writel(~rx_mask, ssi->base + SSI_SRMSK);
-
-	return 0;
-}
-
-/*
- * SSI DAI format configuration.
- * Should only be called when port is inactive (i.e. SSIEN = 0).
- */
-static int imx_ssi_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
-{
-	struct imx_ssi *ssi = snd_soc_dai_get_drvdata(cpu_dai);
-	u32 strcr = 0, scr;
-
-	scr = readl(ssi->base + SSI_SCR) & ~(SSI_SCR_SYN | SSI_SCR_NET);
-
-	/* DAI mode */
-	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
-	case SND_SOC_DAIFMT_I2S:
-		/* data on rising edge of bclk, frame low 1clk before data */
-		strcr |= SSI_STCR_TXBIT0 | SSI_STCR_TSCKP | SSI_STCR_TFSI |
-			SSI_STCR_TEFS;
-		scr |= SSI_SCR_NET;
-		if (ssi->flags & IMX_SSI_USE_I2S_SLAVE) {
-			scr &= ~SSI_I2S_MODE_MASK;
-			scr |= SSI_SCR_I2S_MODE_SLAVE;
-		}
-		break;
-	case SND_SOC_DAIFMT_LEFT_J:
-		/* data on rising edge of bclk, frame high with data */
-		strcr |= SSI_STCR_TXBIT0 | SSI_STCR_TSCKP;
-		break;
-	case SND_SOC_DAIFMT_DSP_B:
-		/* data on rising edge of bclk, frame high with data */
-		strcr |= SSI_STCR_TXBIT0 | SSI_STCR_TSCKP | SSI_STCR_TFSL;
-		break;
-	case SND_SOC_DAIFMT_DSP_A:
-		/* data on rising edge of bclk, frame high 1clk before data */
-		strcr |= SSI_STCR_TXBIT0 | SSI_STCR_TSCKP | SSI_STCR_TFSL |
-			SSI_STCR_TEFS;
-		break;
-	}
-
-	/* DAI clock inversion */
-	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-	case SND_SOC_DAIFMT_IB_IF:
-		strcr ^= SSI_STCR_TSCKP | SSI_STCR_TFSI;
-		break;
-	case SND_SOC_DAIFMT_IB_NF:
-		strcr ^= SSI_STCR_TSCKP;
-		break;
-	case SND_SOC_DAIFMT_NB_IF:
-		strcr ^= SSI_STCR_TFSI;
-		break;
-	case SND_SOC_DAIFMT_NB_NF:
-		break;
-	}
-
-	/* DAI clock master masks */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-		break;
-	default:
-		/* Master mode not implemented, needs handling of clocks. */
-		return -EINVAL;
-	}
-
-	strcr |= SSI_STCR_TFEN0;
-
-	if (ssi->flags & IMX_SSI_NET)
-		scr |= SSI_SCR_NET;
-	if (ssi->flags & IMX_SSI_SYN)
-		scr |= SSI_SCR_SYN;
-
-	writel(strcr, ssi->base + SSI_STCR);
-	writel(strcr, ssi->base + SSI_SRCR);
-	writel(scr, ssi->base + SSI_SCR);
-
-	return 0;
-}
-
-/*
- * SSI system clock configuration.
- * Should only be called when port is inactive (i.e. SSIEN = 0).
- */
-static int imx_ssi_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
-				  int clk_id, unsigned int freq, int dir)
-{
-	struct imx_ssi *ssi = snd_soc_dai_get_drvdata(cpu_dai);
-	u32 scr;
-
-	scr = readl(ssi->base + SSI_SCR);
-
-	switch (clk_id) {
-	case IMX_SSP_SYS_CLK:
-		if (dir == SND_SOC_CLOCK_OUT)
-			scr |= SSI_SCR_SYS_CLK_EN;
-		else
-			scr &= ~SSI_SCR_SYS_CLK_EN;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	writel(scr, ssi->base + SSI_SCR);
-
-	return 0;
-}
-
-/*
- * SSI Clock dividers
- * Should only be called when port is inactive (i.e. SSIEN = 0).
- */
-static int imx_ssi_set_dai_clkdiv(struct snd_soc_dai *cpu_dai,
-				  int div_id, int div)
-{
-	struct imx_ssi *ssi = snd_soc_dai_get_drvdata(cpu_dai);
-	u32 stccr, srccr;
-
-	stccr = readl(ssi->base + SSI_STCCR);
-	srccr = readl(ssi->base + SSI_SRCCR);
-
-	switch (div_id) {
-	case IMX_SSI_TX_DIV_2:
-		stccr &= ~SSI_STCCR_DIV2;
-		stccr |= div;
-		break;
-	case IMX_SSI_TX_DIV_PSR:
-		stccr &= ~SSI_STCCR_PSR;
-		stccr |= div;
-		break;
-	case IMX_SSI_TX_DIV_PM:
-		stccr &= ~0xff;
-		stccr |= SSI_STCCR_PM(div);
-		break;
-	case IMX_SSI_RX_DIV_2:
-		stccr &= ~SSI_STCCR_DIV2;
-		stccr |= div;
-		break;
-	case IMX_SSI_RX_DIV_PSR:
-		stccr &= ~SSI_STCCR_PSR;
-		stccr |= div;
-		break;
-	case IMX_SSI_RX_DIV_PM:
-		stccr &= ~0xff;
-		stccr |= SSI_STCCR_PM(div);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	writel(stccr, ssi->base + SSI_STCCR);
-	writel(srccr, ssi->base + SSI_SRCCR);
-
-	return 0;
-}
-
-/*
- * Should only be called when port is inactive (i.e. SSIEN = 0),
- * although can be called multiple times by upper layers.
- */
-static int imx_ssi_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *params,
-			     struct snd_soc_dai *cpu_dai)
-{
-	struct imx_ssi *ssi = snd_soc_dai_get_drvdata(cpu_dai);
-	u32 reg, sccr;
-
-	/* Tx/Rx config */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		reg = SSI_STCCR;
-	else
-		reg = SSI_SRCCR;
-
-	if (ssi->flags & IMX_SSI_SYN)
-		reg = SSI_STCCR;
-
-	sccr = readl(ssi->base + reg) & ~SSI_STCCR_WL_MASK;
-
-	/* DAI data (word) size */
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S16_LE:
-		sccr |= SSI_SRCCR_WL(16);
-		break;
-	case SNDRV_PCM_FORMAT_S20_3LE:
-		sccr |= SSI_SRCCR_WL(20);
-		break;
-	case SNDRV_PCM_FORMAT_S24_LE:
-		sccr |= SSI_SRCCR_WL(24);
-		break;
-	}
-
-	writel(sccr, ssi->base + reg);
-
-	return 0;
-}
-
-static int imx_ssi_trigger(struct snd_pcm_substream *substream, int cmd,
-		struct snd_soc_dai *dai)
-{
-	struct imx_ssi *ssi = snd_soc_dai_get_drvdata(dai);
-	unsigned int sier_bits, sier;
-	unsigned int scr;
-
-	scr = readl(ssi->base + SSI_SCR);
-	sier = readl(ssi->base + SSI_SIER);
-
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		if (ssi->flags & IMX_SSI_DMA)
-			sier_bits = SSI_SIER_TDMAE;
-		else
-			sier_bits = SSI_SIER_TIE | SSI_SIER_TFE0_EN;
-	} else {
-		if (ssi->flags & IMX_SSI_DMA)
-			sier_bits = SSI_SIER_RDMAE;
-		else
-			sier_bits = SSI_SIER_RIE | SSI_SIER_RFF0_EN;
-	}
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_RESUME:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			scr |= SSI_SCR_TE;
-		else
-			scr |= SSI_SCR_RE;
-		sier |= sier_bits;
-
-		scr |= SSI_SCR_SSIEN;
-
-		break;
-
-	case SNDRV_PCM_TRIGGER_STOP:
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			scr &= ~SSI_SCR_TE;
-		else
-			scr &= ~SSI_SCR_RE;
-		sier &= ~sier_bits;
-
-		if (!(scr & (SSI_SCR_TE | SSI_SCR_RE)))
-			scr &= ~SSI_SCR_SSIEN;
-
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (!(ssi->flags & IMX_SSI_USE_AC97))
-		/* rx/tx are always enabled to access ac97 registers */
-		writel(scr, ssi->base + SSI_SCR);
-
-	writel(sier, ssi->base + SSI_SIER);
-
-	return 0;
-}
-
-static const struct snd_soc_dai_ops imx_ssi_pcm_dai_ops = {
-	.hw_params	= imx_ssi_hw_params,
-	.set_fmt	= imx_ssi_set_dai_fmt,
-	.set_clkdiv	= imx_ssi_set_dai_clkdiv,
-	.set_sysclk	= imx_ssi_set_dai_sysclk,
-	.set_tdm_slot	= imx_ssi_set_dai_tdm_slot,
-	.trigger	= imx_ssi_trigger,
-};
-
-static int imx_ssi_dai_probe(struct snd_soc_dai *dai)
-{
-	struct imx_ssi *ssi = dev_get_drvdata(dai->dev);
-	uint32_t val;
-
-	snd_soc_dai_set_drvdata(dai, ssi);
-
-	val = SSI_SFCSR_TFWM0(ssi->dma_params_tx.maxburst) |
-		SSI_SFCSR_RFWM0(ssi->dma_params_rx.maxburst);
-	writel(val, ssi->base + SSI_SFCSR);
-
-	/* Tx/Rx config */
-	dai->playback_dma_data = &ssi->dma_params_tx;
-	dai->capture_dma_data = &ssi->dma_params_rx;
-
-	return 0;
-}
-
-static struct snd_soc_dai_driver imx_ssi_dai = {
-	.probe = imx_ssi_dai_probe,
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_96000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_96000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
-	},
-	.ops = &imx_ssi_pcm_dai_ops,
-};
-
-static struct snd_soc_dai_driver imx_ac97_dai = {
-	.probe = imx_ssi_dai_probe,
-	.playback = {
-		.stream_name = "AC97 Playback",
-		.channels_min = 2,
-		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
-	},
-	.capture = {
-		.stream_name = "AC97 Capture",
-		.channels_min = 2,
-		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_48000,
-		.formats = SNDRV_PCM_FMTBIT_S16_LE,
-	},
-	.ops = &imx_ssi_pcm_dai_ops,
-};
-
-static const struct snd_soc_component_driver imx_component = {
-	.name		= DRV_NAME,
-};
-
-static void setup_channel_to_ac97(struct imx_ssi *imx_ssi)
-{
-	void __iomem *base = imx_ssi->base;
-
-	writel(0x0, base + SSI_SCR);
-	writel(0x0, base + SSI_STCR);
-	writel(0x0, base + SSI_SRCR);
-
-	writel(SSI_SCR_SYN | SSI_SCR_NET, base + SSI_SCR);
-
-	writel(SSI_SFCSR_RFWM0(8) |
-		SSI_SFCSR_TFWM0(8) |
-		SSI_SFCSR_RFWM1(8) |
-		SSI_SFCSR_TFWM1(8), base + SSI_SFCSR);
-
-	writel(SSI_STCCR_WL(16) | SSI_STCCR_DC(12), base + SSI_STCCR);
-	writel(SSI_STCCR_WL(16) | SSI_STCCR_DC(12), base + SSI_SRCCR);
-
-	writel(SSI_SCR_SYN | SSI_SCR_NET | SSI_SCR_SSIEN, base + SSI_SCR);
-	writel(SSI_SOR_WAIT(3), base + SSI_SOR);
-
-	writel(SSI_SCR_SYN | SSI_SCR_NET | SSI_SCR_SSIEN |
-			SSI_SCR_TE | SSI_SCR_RE,
-			base + SSI_SCR);
-
-	writel(SSI_SACNT_DEFAULT, base + SSI_SACNT);
-	writel(0xff, base + SSI_SACCDIS);
-	writel(0x300, base + SSI_SACCEN);
-}
-
-static struct imx_ssi *ac97_ssi;
-
-static void imx_ssi_ac97_write(struct snd_ac97 *ac97, unsigned short reg,
-		unsigned short val)
-{
-	struct imx_ssi *imx_ssi = ac97_ssi;
-	void __iomem *base = imx_ssi->base;
-	unsigned int lreg;
-	unsigned int lval;
-
-	if (reg > 0x7f)
-		return;
-
-	pr_debug("%s: 0x%02x 0x%04x\n", __func__, reg, val);
-
-	lreg = reg <<  12;
-	writel(lreg, base + SSI_SACADD);
-
-	lval = val << 4;
-	writel(lval , base + SSI_SACDAT);
-
-	writel(SSI_SACNT_DEFAULT | SSI_SACNT_WR, base + SSI_SACNT);
-	udelay(100);
-}
-
-static unsigned short imx_ssi_ac97_read(struct snd_ac97 *ac97,
-		unsigned short reg)
-{
-	struct imx_ssi *imx_ssi = ac97_ssi;
-	void __iomem *base = imx_ssi->base;
-
-	unsigned short val = -1;
-	unsigned int lreg;
-
-	lreg = (reg & 0x7f) <<  12 ;
-	writel(lreg, base + SSI_SACADD);
-	writel(SSI_SACNT_DEFAULT | SSI_SACNT_RD, base + SSI_SACNT);
-
-	udelay(100);
-
-	val = (readl(base + SSI_SACDAT) >> 4) & 0xffff;
-
-	pr_debug("%s: 0x%02x 0x%04x\n", __func__, reg, val);
-
-	return val;
-}
-
-static void imx_ssi_ac97_reset(struct snd_ac97 *ac97)
-{
-	struct imx_ssi *imx_ssi = ac97_ssi;
-
-	if (imx_ssi->ac97_reset)
-		imx_ssi->ac97_reset(ac97);
-	/* First read sometimes fails, do a dummy read */
-	imx_ssi_ac97_read(ac97, 0);
-}
-
-static void imx_ssi_ac97_warm_reset(struct snd_ac97 *ac97)
-{
-	struct imx_ssi *imx_ssi = ac97_ssi;
-
-	if (imx_ssi->ac97_warm_reset)
-		imx_ssi->ac97_warm_reset(ac97);
-
-	/* First read sometimes fails, do a dummy read */
-	imx_ssi_ac97_read(ac97, 0);
-}
-
-static struct snd_ac97_bus_ops imx_ssi_ac97_ops = {
-	.read		= imx_ssi_ac97_read,
-	.write		= imx_ssi_ac97_write,
-	.reset		= imx_ssi_ac97_reset,
-	.warm_reset	= imx_ssi_ac97_warm_reset
-};
-
-static int imx_ssi_probe(struct platform_device *pdev)
-{
-	struct resource *res;
-	struct imx_ssi *ssi;
-	struct imx_ssi_platform_data *pdata = pdev->dev.platform_data;
-	int ret = 0;
-	struct snd_soc_dai_driver *dai;
-
-	ssi = devm_kzalloc(&pdev->dev, sizeof(*ssi), GFP_KERNEL);
-	if (!ssi)
-		return -ENOMEM;
-	dev_set_drvdata(&pdev->dev, ssi);
-
-	if (pdata) {
-		ssi->ac97_reset = pdata->ac97_reset;
-		ssi->ac97_warm_reset = pdata->ac97_warm_reset;
-		ssi->flags = pdata->flags;
-	}
-
-	ssi->irq = platform_get_irq(pdev, 0);
-	if (ssi->irq < 0)
-		return ssi->irq;
-
-	ssi->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(ssi->clk)) {
-		ret = PTR_ERR(ssi->clk);
-		dev_err(&pdev->dev, "Cannot get the clock: %d\n",
-			ret);
-		goto failed_clk;
-	}
-	ret = clk_prepare_enable(ssi->clk);
-	if (ret)
-		goto failed_clk;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ssi->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(ssi->base)) {
-		ret = PTR_ERR(ssi->base);
-		goto failed_register;
-	}
-
-	if (ssi->flags & IMX_SSI_USE_AC97) {
-		if (ac97_ssi) {
-			dev_err(&pdev->dev, "AC'97 SSI already registered\n");
-			ret = -EBUSY;
-			goto failed_register;
-		}
-		ac97_ssi = ssi;
-		setup_channel_to_ac97(ssi);
-		dai = &imx_ac97_dai;
-	} else
-		dai = &imx_ssi_dai;
-
-	writel(0x0, ssi->base + SSI_SIER);
-
-	ssi->dma_params_rx.addr = res->start + SSI_SRX0;
-	ssi->dma_params_tx.addr = res->start + SSI_STX0;
-
-	ssi->dma_params_tx.maxburst = 6;
-	ssi->dma_params_rx.maxburst = 4;
-
-	ssi->dma_params_tx.filter_data = &ssi->filter_data_tx;
-	ssi->dma_params_rx.filter_data = &ssi->filter_data_rx;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_DMA, "tx0");
-	if (res) {
-		imx_pcm_dma_params_init_data(&ssi->filter_data_tx, res->start,
-			IMX_DMATYPE_SSI);
-	}
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_DMA, "rx0");
-	if (res) {
-		imx_pcm_dma_params_init_data(&ssi->filter_data_rx, res->start,
-			IMX_DMATYPE_SSI);
-	}
-
-	platform_set_drvdata(pdev, ssi);
-
-	ret = snd_soc_set_ac97_ops(&imx_ssi_ac97_ops);
-	if (ret != 0) {
-		dev_err(&pdev->dev, "Failed to set AC'97 ops: %d\n", ret);
-		goto failed_register;
-	}
-
-	ret = snd_soc_register_component(&pdev->dev, &imx_component,
-					 dai, 1);
-	if (ret) {
-		dev_err(&pdev->dev, "register DAI failed\n");
-		goto failed_register;
-	}
-
-	ssi->fiq_params.irq = ssi->irq;
-	ssi->fiq_params.base = ssi->base;
-	ssi->fiq_params.dma_params_rx = &ssi->dma_params_rx;
-	ssi->fiq_params.dma_params_tx = &ssi->dma_params_tx;
-
-	ssi->fiq_init = imx_pcm_fiq_init(pdev, &ssi->fiq_params);
-	ssi->dma_init = imx_pcm_dma_init(pdev, IMX_SSI_DMABUF_SIZE);
-
-	if (ssi->fiq_init && ssi->dma_init) {
-		ret = ssi->fiq_init;
-		goto failed_pcm;
-	}
-
-	return 0;
-
-failed_pcm:
-	snd_soc_unregister_component(&pdev->dev);
-failed_register:
-	clk_disable_unprepare(ssi->clk);
-failed_clk:
-	snd_soc_set_ac97_ops(NULL);
-
-	return ret;
-}
-
-static int imx_ssi_remove(struct platform_device *pdev)
-{
-	struct imx_ssi *ssi = platform_get_drvdata(pdev);
-
-	if (!ssi->fiq_init)
-		imx_pcm_fiq_exit(pdev);
-
-	snd_soc_unregister_component(&pdev->dev);
-
-	if (ssi->flags & IMX_SSI_USE_AC97)
-		ac97_ssi = NULL;
-
-	clk_disable_unprepare(ssi->clk);
-	snd_soc_set_ac97_ops(NULL);
-
-	return 0;
-}
-
-static struct platform_driver imx_ssi_driver = {
-	.probe = imx_ssi_probe,
-	.remove = imx_ssi_remove,
-
-	.driver = {
-		.name = "imx-ssi",
-	},
-};
-
-module_platform_driver(imx_ssi_driver);
-
-/* Module information */
-MODULE_AUTHOR("Sascha Hauer, <s.hauer@pengutronix.de>");
-MODULE_DESCRIPTION("i.MX I2S/ac97 SoC Interface");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:imx-ssi");
-- 
2.17.1

