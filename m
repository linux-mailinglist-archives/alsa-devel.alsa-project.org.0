Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66195212D1A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 21:26:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1493016CA;
	Thu,  2 Jul 2020 21:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1493016CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593718010;
	bh=8dcyltR5g5glwPpbFnbbix9TuEPmw7M/QtoN9jJL+Qo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B32+G4EXljqtJZIt4pG29EnP8jlaDVreycCZ31ERjX9zFj2d2hOVmM3szLokmlcrG
	 d7iEVlFJKfnlS5LD+dhay4Ww0U166MnfvPmJH7Eq0/c+DvW4c5vt/S4XIEnB0Bd4Kw
	 /TjY5dOdm2oIpf0GvF7fNlQz11QwyvgCsZMyrM8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CB00F802EB;
	Thu,  2 Jul 2020 21:22:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA2B7F802E0; Thu,  2 Jul 2020 21:22:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 205C2F8027B
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 21:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 205C2F8027B
IronPort-SDR: i+2XfCFDuuP5k29uWaHVb1s3xDMAHJ2CejnpbKveX9Pk6UfDdJ4E5tqac7xrh6iWaKIrf/M9UL
 p/IvjcuOyrdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="165059458"
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="165059458"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:22:02 -0700
IronPort-SDR: VC72ixVpyhh/fzeRMmVEKwl5TjkPN9T8Gz6Ihijn5Ym4BmvGMVKt/JyIvDAMZIjI26KDBZluLx
 TXWvphkw/aQQ==
X-IronPort-AV: E=Sophos;i="5.75,305,1589266800"; d="scan'208";a="304345329"
Received: from dhprice-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.75.219])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 12:22:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 5/6] ASoC: fsl: fsl_asrc: fix kernel-doc
Date: Thu,  2 Jul 2020 14:21:40 -0500
Message-Id: <20200702192141.168018-6-pierre-louis.bossart@linux.intel.com>
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

Fix W=1 warnings. fix kernel doc and describe arguments.

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/fsl_asrc.c | 57 +++++++++++++++++++++++++++-------------
 1 file changed, 39 insertions(+), 18 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 462ce9f9ab48..02c81d2e34ad 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -37,7 +37,7 @@ static struct snd_pcm_hw_constraint_list fsl_asrc_rate_constraints = {
 	.list = supported_asrc_rate,
 };
 
-/**
+/*
  * The following tables map the relationship between asrc_inclk/asrc_outclk in
  * fsl_asrc.h and the registers of ASRCSR
  */
@@ -68,7 +68,7 @@ static unsigned char output_clk_map_imx53[ASRC_CLK_MAP_LEN] = {
 	0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7, 0x7,
 };
 
-/**
+/*
  * i.MX8QM/i.MX8QXP uses the same map for input and output.
  * clk_map_imx8qm[0] is for i.MX8QM asrc0
  * clk_map_imx8qm[1] is for i.MX8QM asrc1
@@ -102,16 +102,17 @@ static unsigned char clk_map_imx8qxp[2][ASRC_CLK_MAP_LEN] = {
 };
 
 /**
- * Select the pre-processing and post-processing options
+ * fsl_asrc_sel_proc - Select the pre-processing and post-processing options
+ * @inrate: input sample rate
+ * @outrate: output sample rate
+ * @pre_proc: return value for pre-processing option
+ * @post_proc: return value for post-processing option
+ *
  * Make sure to exclude following unsupported cases before
  * calling this function:
  * 1) inrate > 8.125 * outrate
  * 2) inrate > 16.125 * outrate
  *
- * inrate: input sample rate
- * outrate: output sample rate
- * pre_proc: return value for pre-processing option
- * post_proc: return value for post-processing option
  */
 static void fsl_asrc_sel_proc(int inrate, int outrate,
 			     int *pre_proc, int *post_proc)
@@ -148,7 +149,9 @@ static void fsl_asrc_sel_proc(int inrate, int outrate,
 }
 
 /**
- * Request ASRC pair
+ * fsl_asrc_request_pair - Request ASRC pair
+ * @channels: number of channels
+ * @pair: pointer to pair
  *
  * It assigns pair by the order of A->C->B because allocation of pair B,
  * within range [ANCA, ANCA+ANCB-1], depends on the channels of pair A
@@ -193,7 +196,8 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 }
 
 /**
- * Release ASRC pair
+ * fsl_asrc_release_pair - Release ASRC pair
+ * @pair: pair to release
  *
  * It clears the resource from asrc and releases the occupied channels.
  */
@@ -217,7 +221,10 @@ static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
 }
 
 /**
- * Configure input and output thresholds
+ * fsl_asrc_set_watermarks- configure input and output thresholds
+ * @pair: pointer to pair
+ * @in: input threshold
+ * @out: output threshold
  */
 static void fsl_asrc_set_watermarks(struct fsl_asrc_pair *pair, u32 in, u32 out)
 {
@@ -234,7 +241,9 @@ static void fsl_asrc_set_watermarks(struct fsl_asrc_pair *pair, u32 in, u32 out)
 }
 
 /**
- * Calculate the total divisor between asrck clock rate and sample rate
+ * fsl_asrc_cal_asrck_divisor - Calculate the total divisor between asrck clock rate and sample rate
+ * @pair: pointer to pair
+ * @div: divider
  *
  * It follows the formula clk_rate = samplerate * (2 ^ prescaler) * divider
  */
@@ -250,7 +259,10 @@ static u32 fsl_asrc_cal_asrck_divisor(struct fsl_asrc_pair *pair, u32 div)
 }
 
 /**
- * Calculate and set the ratio for Ideal Ratio mode only
+ * fsl_asrc_set_ideal_ratio - Calculate and set the ratio for Ideal Ratio mode only
+ * @pair: pointer to pair
+ * @inrate: input rate
+ * @outrate: output rate
  *
  * The ratio is a 32-bit fixed point value with 26 fractional bits.
  */
@@ -293,7 +305,9 @@ static int fsl_asrc_set_ideal_ratio(struct fsl_asrc_pair *pair,
 }
 
 /**
- * Configure the assigned ASRC pair
+ * fsl_asrc_config_pair - Configure the assigned ASRC pair
+ * @pair: pointer to pair
+ * @use_ideal_rate: boolean configuration
  *
  * It configures those ASRC registers according to a configuration instance
  * of struct asrc_config which includes in/output sample rate, width, channel
@@ -508,7 +522,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 }
 
 /**
- * Start the assigned ASRC pair
+ * fsl_asrc_start_pair - Start the assigned ASRC pair
+ * @pair: pointer to pair
  *
  * It enables the assigned pair and makes it stopped at the stall level.
  */
@@ -539,7 +554,8 @@ static void fsl_asrc_start_pair(struct fsl_asrc_pair *pair)
 }
 
 /**
- * Stop the assigned ASRC pair
+ * fsl_asrc_stop_pair - Stop the assigned ASRC pair
+ * @pair: pointer to pair
  */
 static void fsl_asrc_stop_pair(struct fsl_asrc_pair *pair)
 {
@@ -552,7 +568,9 @@ static void fsl_asrc_stop_pair(struct fsl_asrc_pair *pair)
 }
 
 /**
- * Get DMA channel according to the pair and direction.
+ * fsl_asrc_get_dma_channel- Get DMA channel according to the pair and direction.
+ * @pair: pointer to pair
+ * @dir: DMA direction
  */
 static struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair,
 						 bool dir)
@@ -896,7 +914,8 @@ static const struct regmap_config fsl_asrc_regmap_config = {
 };
 
 /**
- * Initialize ASRC registers with a default configurations
+ * fsl_asrc_init - Initialize ASRC registers with a default configuration
+ * @asrc: ASRC context
  */
 static int fsl_asrc_init(struct fsl_asrc *asrc)
 {
@@ -930,7 +949,9 @@ static int fsl_asrc_init(struct fsl_asrc *asrc)
 }
 
 /**
- * Interrupt handler for ASRC
+ * fsl_asrc_isr- Interrupt handler for ASRC
+ * @irq: irq number
+ * @dev_id: ASRC context
  */
 static irqreturn_t fsl_asrc_isr(int irq, void *dev_id)
 {
-- 
2.25.1

