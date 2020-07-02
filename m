Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1DB212D1C
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:27:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CACB516DB;
	Thu,  2 Jul 2020 21:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CACB516DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593718029;
	bh=gp0XisQgJL7A5W89dwuxfBKA+HAbmTtginrWEET+8i4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kHiPS93S0drGKgYjey29wDs64dYz7eeFyvDzmA9GvXQiS4S6Nb8IetyU6loJRW7c7
	 anfFveBAMi/h0HOf3KwYWj/SN/HbYfZdsP2Wxcd3CTqbJPQo87lrE1tUueqdRm9S5O
	 P1+g3nD30R2ylIko0UoKGskc7FuSN5UxpLS3MdIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3393F802F9;
	Thu,  2 Jul 2020 21:22:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DF7EF802E2; Thu,  2 Jul 2020 21:22:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9ECFF80247
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9ECFF80247
IronPort-SDR: R3+lYNuezXWWLPjFHgIdpssU20K7iGp3jkEv2KYJKlLvZpFdTwvBOWPt13WlwrNRfhrlttWclH
 hoMGtpHa8u8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="165059437"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="165059437"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:21:56 -0700
IronPort-SDR: 6OjvD23UP84IymI1Eg3XIOo4iHMZS45yBUSzHrmHf1EBCQ0bK3xxVoyJdVmINb5RhnWKNzD3hN
 U18IDw47Xx7A==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="304345268"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:21:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/6] ASoC: fsl: fsl_ssi: fix kernel-doc
Date: Thu,  2 Jul 2020 14:21:37 -0500
Message-Id: <20200702192141.168018-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702192141.168018-1-pierre-louis.bossart@linux.intel.com>
References: <20200702192141.168018-1-pierre-louis.bossart@linux.intel.com>
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

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
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

