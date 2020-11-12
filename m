Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF9C2B0A09
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 17:33:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC581181A;
	Thu, 12 Nov 2020 17:32:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC581181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605198819;
	bh=Pv0UOA5L6YJIvIHmz6UmpJNFkQ6W+jkVejo0cHIR1vU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E/8kN4zHUfdUd5VGBZZNvwgRRN3BNsZpSIxUyHaF6K+SCieVi3gxt7pYsjKfs8XKh
	 CqjMFknUBe5bg4Qwv/nWQ3LQgZqW80kl0/cdbQCzOhfjap6hVRab+cBltQOE7YDZdK
	 bNngBtz3R75M91j5VczLhhI9CbhTDBkD2y0dzmRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB07EF804E1;
	Thu, 12 Nov 2020 17:31:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFB56F804BD; Thu, 12 Nov 2020 17:31:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92D34F801EB
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 17:31:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92D34F801EB
IronPort-SDR: i+xDs/fiM/IRYCRteCiK+Aa2jtWr6az9mBtRBaaAmTHuKc1DH7sabU4yuPY8nnHcZUDIWdZhPA
 QOxdj6p5ZPCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="231956988"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="231956988"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:31:14 -0800
IronPort-SDR: YvE1yjy+zp0H6SUZziCl5U70Um2MT2IiprGH/ucdyI1sum0yjk7fHrvC9cgT1Gf8dw86/Ifx4R
 X1a657jbOuaA==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="532228321"
Received: from nsalmulx-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.36.117])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:31:12 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: Intel: keembay: use inclusive language for bclk and
 fsync
Date: Thu, 12 Nov 2020 10:31:00 -0600
Message-Id: <20201112163100.5081-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112163100.5081-1-pierre-louis.bossart@linux.intel.com>
References: <20201112163100.5081-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Use 'clock provider' and 'clock consumer' terms.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/keembay/kmb_platform.c | 22 +++++++++++-----------
 sound/soc/intel/keembay/kmb_platform.h |  8 ++++----
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index f54b710ee1c2..3441e69ced04 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -358,7 +358,7 @@ static void kmb_i2s_start(struct kmb_i2s_info *kmb_i2s,
 
 	kmb_i2s_irq_trigger(kmb_i2s, substream->stream, config->chan_nr, true);
 
-	if (kmb_i2s->master)
+	if (kmb_i2s->clock_provider)
 		writel(1, kmb_i2s->i2s_base + CER);
 	else
 		writel(0, kmb_i2s->i2s_base + CER);
@@ -393,13 +393,13 @@ static int kmb_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	struct kmb_i2s_info *kmb_i2s = snd_soc_dai_get_drvdata(cpu_dai);
 	int ret;
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-		kmb_i2s->master = false;
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBP_CFP:
+		kmb_i2s->clock_provider = false;
 		ret = 0;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
-		writel(MASTER_MODE, kmb_i2s->pss_base + I2S_GEN_CFG_0);
+	case SND_SOC_DAIFMT_CBC_CFC:
+		writel(CLOCK_PROVIDER_MODE, kmb_i2s->pss_base + I2S_GEN_CFG_0);
 
 		ret = clk_prepare_enable(kmb_i2s->clk_i2s);
 		if (ret < 0)
@@ -410,7 +410,7 @@ static int kmb_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		if (ret)
 			return ret;
 
-		kmb_i2s->master = true;
+		kmb_i2s->clock_provider = true;
 		break;
 	default:
 		return -EINVAL;
@@ -510,7 +510,7 @@ static int kmb_dai_hw_params(struct snd_pcm_substream *substream,
 		 * Platform is not capable of providing clocks for
 		 * multi channel audio
 		 */
-		if (kmb_i2s->master)
+		if (kmb_i2s->clock_provider)
 			return -EINVAL;
 
 		write_val = ((config->chan_nr / 2) << TDM_CHANNEL_CONFIG_BIT) |
@@ -524,12 +524,12 @@ static int kmb_dai_hw_params(struct snd_pcm_substream *substream,
 		 * Platform is only capable of providing clocks need for
 		 * 2 channel master mode
 		 */
-		if (!(kmb_i2s->master))
+		if (!(kmb_i2s->clock_provider))
 			return -EINVAL;
 
 		write_val = ((config->chan_nr / 2) << TDM_CHANNEL_CONFIG_BIT) |
 				(config->data_width << DATA_WIDTH_CONFIG_BIT) |
-				MASTER_MODE | I2S_OPERATION;
+				CLOCK_PROVIDER_MODE | I2S_OPERATION;
 
 		writel(write_val, kmb_i2s->pss_base + I2S_GEN_CFG_0);
 		break;
@@ -544,7 +544,7 @@ static int kmb_dai_hw_params(struct snd_pcm_substream *substream,
 
 	config->sample_rate = params_rate(hw_params);
 
-	if (kmb_i2s->master) {
+	if (kmb_i2s->clock_provider) {
 		/* Only 2 ch supported in Master mode */
 		u32 bitclk = config->sample_rate * config->data_width * 2;
 
diff --git a/sound/soc/intel/keembay/kmb_platform.h b/sound/soc/intel/keembay/kmb_platform.h
index 9756b132c12f..0c393e5916b6 100644
--- a/sound/soc/intel/keembay/kmb_platform.h
+++ b/sound/soc/intel/keembay/kmb_platform.h
@@ -58,7 +58,7 @@
 #define PSS_CPR_CLK_CLR		0x000
 #define PSS_CPR_AUX_RST_EN	0x070
 
-#define MASTER_MODE		BIT(13)
+#define CLOCK_PROVIDER_MODE	BIT(13)
 
 /* Interrupt Flag */
 #define TX_INT_FLAG		GENMASK(5, 4)
@@ -99,8 +99,8 @@
 
 #define DWC_I2S_PLAY	BIT(0)
 #define DWC_I2S_RECORD	BIT(1)
-#define DW_I2S_SLAVE	BIT(2)
-#define DW_I2S_MASTER	BIT(3)
+#define DW_I2S_CONSUMER	BIT(2)
+#define DW_I2S_PROVIDER	BIT(3)
 
 #define I2S_RXDMA	0x01C0
 #define I2S_TXDMA	0x01C8
@@ -130,7 +130,7 @@ struct kmb_i2s_info {
 	u32 ccr;
 	u32 xfer_resolution;
 	u32 fifo_th;
-	bool master;
+	bool clock_provider;
 
 	struct i2s_clk_config_data config;
 	int (*i2s_clk_cfg)(struct i2s_clk_config_data *config);
-- 
2.25.1

