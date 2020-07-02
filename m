Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBB1212B35
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 19:26:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B8AB16EB;
	Thu,  2 Jul 2020 19:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B8AB16EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593710774;
	bh=LV+MUhj4rp72rMU/eWNZPRvglgEicQYsj1SixcBob8Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rlNCGI1qFZ4UPJlqePbyPLpz8Cyv+9SVb13GanwNrwsA/tvjim6n6nw3TdqsDAST4
	 gyoickwN1TepVvpvnDrZ/FO9z238Hnti9f78WBhDvwuIVGMV/qoDGsAYj2f7hFrrSe
	 zqPKDpncWWyZTFH+6sifHlvZ7oJC7gPFxpUOFMto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22A74F802D2;
	Thu,  2 Jul 2020 19:23:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6693BF802BE; Thu,  2 Jul 2020 19:22:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D50CEF8022B
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 19:22:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D50CEF8022B
IronPort-SDR: RBXuKfMfpd1zI5Zwm7X/GhS3bEEVBW7I8WQW3QvQ6Z1DFCtUY3+jOrPn8LE+lGcvTBYa3muHNj
 AzUiTGRST8bA==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="144480295"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="144480295"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 10:22:47 -0700
IronPort-SDR: TywODd3A6Rbbvxw++ov1zfM57qFI8aQMZrbQOuZd9wNRE8HMu86fVVAwz+U7TqWN7OS6u1kmTQ
 QuCUZtgfcKEw==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="356521247"
Received: from nzbastur-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.182])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 10:22:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/6] ASoC: fsl: fsl_ssi: fix kernel-doc
Date: Thu,  2 Jul 2020 12:22:23 -0500
Message-Id: <20200702172227.164474-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 tiwai@suse.de,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 broonie@kernel.org, Fabio Estevam <festevam@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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

Fix W=1 warnings. The kernel-doc support is partial, add more
descriptions and follow proper syntax

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/fsl_ssi.c | 70 ++++++++++++++++++++++++++---------------
 1 file changed, 44 insertions(+), 26 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 1a2fa7f18142..7ec80b240563 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -203,12 +203,10 @@ struct fsl_ssi_soc_data {
 };
 
 /**
- * fsl_ssi: per-SSI private data
- *
+ * struct fsl_ssi - per-SSI private data
  * @regs: Pointer to the regmap registers
  * @irq: IRQ of this SSI
  * @cpu_dai_drv: CPU DAI driver for this device
- *
  * @dai_fmt: DAI configuration this device is currently used with
  * @streams: Mask of current active streams: BIT(TX) and BIT(RX)
  * @i2s_net: I2S and Network mode configurations of SCR register
@@ -221,38 +219,29 @@ struct fsl_ssi_soc_data {
  * @slot_width: Width of each DAI slot
  * @slots: Number of slots
  * @regvals: Specific RX/TX register settings
- *
  * @clk: Clock source to access register
  * @baudclk: Clock source to generate bit and frame-sync clocks
  * @baudclk_streams: Active streams that are using baudclk
- *
  * @regcache_sfcsr: Cache sfcsr register value during suspend and resume
  * @regcache_sacnt: Cache sacnt register value during suspend and resume
- *
  * @dma_params_tx: DMA transmit parameters
  * @dma_params_rx: DMA receive parameters
  * @ssi_phys: physical address of the SSI registers
- *
  * @fiq_params: FIQ stream filtering parameters
- *
  * @card_pdev: Platform_device pointer to register a sound card for PowerPC or
  *             to register a CODEC platform device for AC97
  * @card_name: Platform_device name to register a sound card for PowerPC or
  *             to register a CODEC platform device for AC97
  * @card_idx: The index of SSI to register a sound card for PowerPC or
  *            to register a CODEC platform device for AC97
- *
  * @dbg_stats: Debugging statistics
- *
  * @soc: SoC specific data
  * @dev: Pointer to &pdev->dev
- *
  * @fifo_watermark: The FIFO watermark setting. Notifies DMA when there are
  *                  @fifo_watermark or fewer words in TX fifo or
  *                  @fifo_watermark or more empty words in RX fifo.
  * @dma_maxburst: Max number of words to transfer in one go. So far,
  *                this is always the same as fifo_watermark.
- *
  * @ac97_reg_lock: Mutex lock to serialize AC97 register access operations
  */
 struct fsl_ssi {
@@ -374,7 +363,9 @@ static bool fsl_ssi_is_i2s_cbm_cfs(struct fsl_ssi *ssi)
 }
 
 /**
- * Interrupt handler to gather states
+ * fsl_ssi_irq - Interrupt handler to gather states
+ * @irq: irq number
+ * @dev_id: context
  */
 static irqreturn_t fsl_ssi_isr(int irq, void *dev_id)
 {
@@ -395,7 +386,10 @@ static irqreturn_t fsl_ssi_isr(int irq, void *dev_id)
 }
 
 /**
- * Set SCR, SIER, STCR and SRCR registers with cached values in regvals
+ * fsl_ssi_config_enable - Set SCR, SIER, STCR and SRCR registers with
+ * cached values in regvals
+ * @ssi: SSI context
+ * @tx: direction
  *
  * Notes:
  * 1) For offline_config SoCs, enable all necessary bits of both streams
@@ -474,7 +468,7 @@ static void fsl_ssi_config_enable(struct fsl_ssi *ssi, bool tx)
 	ssi->streams |= BIT(dir);
 }
 
-/**
+/*
  * Exclude bits that are used by the opposite stream
  *
  * When both streams are active, disabling some bits for the current stream
@@ -495,7 +489,10 @@ static void fsl_ssi_config_enable(struct fsl_ssi *ssi, bool tx)
 	((vals) & _ssi_xor_shared_bits(vals, avals, aactive))
 
 /**
- * Unset SCR, SIER, STCR and SRCR registers with cached values in regvals
+ * fsl_ssi_config_disable - Unset SCR, SIER, STCR and SRCR registers
+ * with cached values in regvals
+ * @ssi: SSI context
+ * @tx: direction
  *
  * Notes:
  * 1) For offline_config SoCs, to avoid online reconfigurations, disable all
@@ -577,7 +574,9 @@ static void fsl_ssi_tx_ac97_saccst_setup(struct fsl_ssi *ssi)
 }
 
 /**
- * Cache critical bits of SIER, SRCR, STCR and SCR to later set them safely
+ * fsl_ssi_setup_regvals - Cache critical bits of SIER, SRCR, STCR and
+ * SCR to later set them safely
+ * @ssi: SSI context
  */
 static void fsl_ssi_setup_regvals(struct fsl_ssi *ssi)
 {
@@ -661,9 +660,12 @@ static void fsl_ssi_shutdown(struct snd_pcm_substream *substream,
 }
 
 /**
- * Configure Digital Audio Interface bit clock
+ * fsl_ssi_set_bclk - Configure Digital Audio Interface bit clock
+ * @substream: ASoC substream
+ * @dai: pointer to DAI
+ * @hw_params: pointers to hw_params
  *
- * Note: This function can be only called when using SSI as DAI master
+ * Notes: This function can be only called when using SSI as DAI master
  *
  * Quick instruction for parameters:
  * freq: Output BCLK frequency = samplerate * slots * slot_width
@@ -782,7 +784,10 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
 }
 
 /**
- * Configure SSI based on PCM hardware parameters
+ * fsl_ssi_hw_params - Configure SSI based on PCM hardware parameters
+ * @substream: ASoC substream
+ * @hw_params: pointers to hw_params
+ * @dai: pointer to DAI
  *
  * Notes:
  * 1) SxCCR.WL bits are critical bits that require SSI to be temporarily
@@ -997,7 +1002,9 @@ static int _fsl_ssi_set_dai_fmt(struct fsl_ssi *ssi, unsigned int fmt)
 }
 
 /**
- * Configure Digital Audio Interface (DAI) Format
+ * fsl_ssi_set_dai_fmt - Configure Digital Audio Interface (DAI) Format
+ * @dai: pointer to DAI
+ * @fmt: format mask
  */
 static int fsl_ssi_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
@@ -1011,7 +1018,12 @@ static int fsl_ssi_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 /**
- * Set TDM slot number and slot width
+ * fsl_ssi_set_dai_tdm_slot - Set TDM slot number and slot width
+ * @dai: pointer to DAI
+ * @tx_mask: mask for TX
+ * @rx_mask: mask for RX
+ * @slots: number of slots
+ * @slot_width: number of bits per slot
  */
 static int fsl_ssi_set_dai_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask,
 				    u32 rx_mask, int slots, int slot_width)
@@ -1055,7 +1067,10 @@ static int fsl_ssi_set_dai_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask,
 }
 
 /**
- * Start or stop SSI and corresponding DMA transaction.
+ * fsl_ssi_trigger - Start or stop SSI and corresponding DMA transaction.
+ * @substream: ASoC substream
+ * @cmd: trigger command
+ * @dai: pointer to DAI
  *
  * The DMA channel is in external master start and pause mode, which
  * means the SSI completely controls the flow of data.
@@ -1239,7 +1254,8 @@ static struct snd_ac97_bus_ops fsl_ssi_ac97_ops = {
 };
 
 /**
- * Initialize SSI registers
+ * fsl_ssi_hw_init - Initialize SSI registers
+ * @ssi: SSI context
  */
 static int fsl_ssi_hw_init(struct fsl_ssi *ssi)
 {
@@ -1268,7 +1284,8 @@ static int fsl_ssi_hw_init(struct fsl_ssi *ssi)
 }
 
 /**
- * Clear SSI registers
+ * fsl_ssi_hw_clean - Clear SSI registers
+ * @ssi: SSI context
  */
 static void fsl_ssi_hw_clean(struct fsl_ssi *ssi)
 {
@@ -1285,7 +1302,8 @@ static void fsl_ssi_hw_clean(struct fsl_ssi *ssi)
 		regmap_update_bits(ssi->regs, REG_SSI_SCR, SSI_SCR_SSIEN, 0);
 	}
 }
-/**
+
+/*
  * Make every character in a string lower-case
  */
 static void make_lowercase(char *s)
-- 
2.25.1

