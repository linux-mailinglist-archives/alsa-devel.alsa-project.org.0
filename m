Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D1D212B3A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 19:27:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A018116E4;
	Thu,  2 Jul 2020 19:27:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A018116E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593710876;
	bh=TRtmUdqpV9FQp7lwL8FTv7x2Ucis+ljESfyzyhfF/HE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NssWzlWHBHgLT5E4ynNL5YM5N/YWnKM2m2okQNZA/lBfXNnmIOo2FtotGCVLPnN8H
	 dsJohdIGfh8vBeweXFk63iujmSULqm9lh/Y1MHDG+zmT9Jv5hFXwjTJr2G5jbJaPpv
	 MfFv7JY8dh/zKU2978xkwqmuOaAtuto/2RA/S1Ow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA1EAF802F9;
	Thu,  2 Jul 2020 19:23:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 768B0F802E1; Thu,  2 Jul 2020 19:23:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 414D6F80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 19:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 414D6F80134
IronPort-SDR: +8X5/phuZj+NtZEE1xzE6jWChVsTKTCzGGzV+yITYETgjXQhjl9QfjyY48nakWVdMxyxhPDRog
 zQmwUWIjHzQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="144480314"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="144480314"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 10:22:52 -0700
IronPort-SDR: 4tbJVHoxpfHyKr4pVs60jgiNeWvWfkvRCg1DzXQtBcCXKNQF0yZDHTy7phJdY91tVoRs9s7GDU
 RPNOnzHJu6JQ==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="356521264"
Received: from nzbastur-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.182])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 10:22:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/6] ASoC: fsl: fsl_esai: fix kernel-doc
Date: Thu,  2 Jul 2020 12:22:27 -0500
Message-Id: <20200702172227.164474-7-pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warnings. Fix kernel-doc syntax and add missing parameters.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/fsl_esai.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index cbcb70d6f8c8..a1db69061b4b 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -22,8 +22,7 @@
 				SNDRV_PCM_FMTBIT_S24_LE)
 
 /**
- * fsl_esai_soc_data: soc specific data
- *
+ * struct fsl_esai_soc_data - soc specific data
  * @imx: for imx platform
  * @reset_at_xrun: flags for enable reset operaton
  */
@@ -33,8 +32,7 @@ struct fsl_esai_soc_data {
 };
 
 /**
- * fsl_esai: ESAI private data
- *
+ * struct fsl_esai - ESAI private data
  * @dma_params_rx: DMA parameters for receive channel
  * @dma_params_tx: DMA parameters for transmit channel
  * @pdev: platform device pointer
@@ -49,6 +47,8 @@ struct fsl_esai_soc_data {
  * @fifo_depth: depth of tx/rx FIFO
  * @slot_width: width of each DAI slot
  * @slots: number of slots
+ * @tx_mask: slot mask for TX
+ * @rx_mask: slot mask for RX
  * @channels: channel num for tx or rx
  * @hck_rate: clock rate of desired HCKx clock
  * @sck_rate: clock rate of desired SCKx clock
@@ -157,13 +157,15 @@ static irqreturn_t esai_isr(int irq, void *devid)
 }
 
 /**
- * This function is used to calculate the divisors of psr, pm, fp and it is
- * supposed to be called in set_dai_sysclk() and set_bclk().
+ * fsl_esai_divisor_cal - This function is used to calculate the
+ * divisors of psr, pm, fp and it is supposed to be called in
+ * set_dai_sysclk() and set_bclk().
  *
+ * @dai: pointer to DAI
+ * @tx: current setting is for playback or capture
  * @ratio: desired overall ratio for the paticipating dividers
  * @usefp: for HCK setting, there is no need to set fp divider
  * @fp: bypass other dividers by setting fp directly if fp != 0
- * @tx: current setting is for playback or capture
  */
 static int fsl_esai_divisor_cal(struct snd_soc_dai *dai, bool tx, u32 ratio,
 				bool usefp, u32 fp)
@@ -250,13 +252,12 @@ static int fsl_esai_divisor_cal(struct snd_soc_dai *dai, bool tx, u32 ratio,
 }
 
 /**
- * This function mainly configures the clock frequency of MCLK (HCKT/HCKR)
- *
- * @Parameters:
- * clk_id: The clock source of HCKT/HCKR
+ * fsl_esai_set_dai_sysclk - This function mainly configures the clock frequency of MCLK (HCKT/HCKR)
+ * @dai: pointer to DAI
+ * @clk_id: The clock source of HCKT/HCKR
  *	  (Input from outside; output from inside, FSYS or EXTAL)
- * freq: The required clock rate of HCKT/HCKR
- * dir: The clock direction of HCKT/HCKR
+ * @freq: The required clock rate of HCKT/HCKR
+ * @dir: The clock direction of HCKT/HCKR
  *
  * Note: If the direction is input, we do not care about clk_id.
  */
@@ -358,7 +359,10 @@ static int fsl_esai_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 }
 
 /**
- * This function configures the related dividers according to the bclk rate
+ * fsl_esai_set_bclk - This function configures the related dividers according to the bclk rate
+ * @dai: pointer to DAI
+ * @tx: direction boolean
+ * @freq: bclk freq
  */
 static int fsl_esai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 {
-- 
2.25.1

