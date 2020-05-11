Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4C61CE768
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 23:26:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6546A1658;
	Mon, 11 May 2020 23:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6546A1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589232413;
	bh=xLpk5JDd4eU2iIkRBKgxWxaj6ybykQtl9UgMSC3jOD8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DoqUWl+7V+HNWLF6ts0YGOiNECd885hGVL1v2AWAf1OzDjK4fFz5D7jpeKTvqeFyO
	 H2CHrkbdGzTHC0APqjHcYb8HxWFVbvl2XcQ0bj6vfiwnIv+wt4kQtl8dXoLoHOlQD0
	 73ZhBuw15MKIyhsVaI1t3pTSqkBzAyHwNpUe11y8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADC33F802F9;
	Mon, 11 May 2020 23:21:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F612F80254; Mon, 11 May 2020 23:20:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5F21F8028C
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5F21F8028C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Dre3g5bT"
Received: by mail-qk1-x744.google.com with SMTP id f83so11437795qke.13
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+wli3xfthw14Tr4hrgeIRYpKXIahyQtBnsHI6nXN2u4=;
 b=Dre3g5bTfWxpvnd3J+d0JSWFP7/xbkbpcWHR99epa/N2quOJcNaNmmaiU+I6MOnDSW
 HMZUArdhaUN7Afq/rvvx9x6FxKl1fpPuUWtlaJV5q0cnWx9wDse1tg0NLCbs3N7qv/yX
 fC3DesSaVumP4PsrIxU82m9rtyBbuzDs7H+gF0iFL0LFdM1nMkKXJAK33uWJu9UrkuM7
 6UWiFTRUmgnKQ7aGsMaUe7BwXvtT3zEA1FPmoBbMhi4qQCbUlVp+L+qEleMXYO3puwYE
 gxfTFHxUKhcSLMqL/LvluQCJ67leC2/cvRSXB/5hEuYbPXuXmcZKixNEqR1ZUBmeO2fW
 OsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+wli3xfthw14Tr4hrgeIRYpKXIahyQtBnsHI6nXN2u4=;
 b=YJLvPFBdGr5ZDXPCSMq5pzY7n8gPTxl6o+z70IMBUgsxzRTA4zod/j9aUQMv3AL8dc
 Yf7KmqTlPwjoaxhA95r4pFoHa33+pn5WsygUtq4XDgPWdWzh4H2VwFgao2PhU02gonKB
 8JP/5IrftfGqzdhoy8s2q+TvdMU9jraDdxuURkaZbFM1arnctQLI+dnTv853Wa55wfe+
 rngjRzzVrcPj42zz5YOCo5+YDcaHMr16AM9FhEEUdEBvSQZyZ9D/6YG0IdqEhpc/bkEj
 np/oeqfGBIVFiprsY0Awhw9jiW58YfeEPEO5Uhr+K4gorPIv/34oSkquXRJBHd1u8Mxf
 exnA==
X-Gm-Message-State: AGi0PuZyPAkJsIfcaoNwgSB4eczMzdpfbSH+/DkmE8lLXYMVJOnEeKRz
 QUYLIdJIvj63j/2cRiztCyrVDJ2H
X-Google-Smtp-Source: APiQypIH86b0s14ZefWZsTSWikTI9nJhYXwclW1fVkWj8uF1z1CJdYngV6Ut3YvuGtuhK7IDokQ8Zg==
X-Received: by 2002:a37:7b83:: with SMTP id
 w125mr16853571qkc.420.1589232033158; 
 Mon, 11 May 2020 14:20:33 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id c26sm9148691qkm.98.2020.05.11.14.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:20:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH v2 08/14] ASoC: amd: add ACP PDM DMA driver dai ops
Date: Mon, 11 May 2020 17:20:08 -0400
Message-Id: <20200511212014.2359225-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200511212014.2359225-1-alexander.deucher@amd.com>
References: <20200511212014.2359225-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

This patch adds ACP3x PDM DMA driver DAI operations.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---

v2:
- Defined Macros for delay and counter and corrected dma stop sequence.

 sound/soc/amd/renoir/acp3x-pdm-dma.c | 149 +++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h      |   9 ++
 2 files changed, 158 insertions(+)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 8bb03fa5b4a5..fd19b17f553e 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -71,6 +71,27 @@ static void init_pdm_ring_buffer(u32 physical_addr,
 	rn_writel(0x01, acp_base + ACPAXI2AXI_ATU_CTRL);
 }
 
+static void config_pdm_stream_params(unsigned int ch_mask,
+				     void __iomem *acp_base)
+{
+	rn_writel(ch_mask, acp_base + ACP_WOV_PDM_NO_OF_CHANNELS);
+	rn_writel(PDM_DECIMATION_FACTOR, acp_base +
+		  ACP_WOV_PDM_DECIMATION_FACTOR);
+}
+
+static void enable_pdm_clock(void __iomem *acp_base)
+{
+	u32 pdm_clk_enable, pdm_ctrl;
+
+	pdm_clk_enable = ACP_PDM_CLK_FREQ_MASK;
+	pdm_ctrl = 0x00;
+
+	rn_writel(pdm_clk_enable, acp_base + ACP_WOV_CLK_CTRL);
+	pdm_ctrl = rn_readl(acp_base + ACP_WOV_MISC_CTRL);
+	pdm_ctrl |= ACP_WOV_MISC_CTRL_MASK;
+	rn_writel(pdm_ctrl, acp_base + ACP_WOV_MISC_CTRL);
+}
+
 static void enable_pdm_interrupts(void __iomem *acp_base)
 {
 	u32 ext_int_ctrl;
@@ -89,6 +110,77 @@ static void disable_pdm_interrupts(void __iomem *acp_base)
 	rn_writel(ext_int_ctrl, acp_base + ACP_EXTERNAL_INTR_CNTL);
 }
 
+static bool check_pdm_dma_status(void __iomem *acp_base)
+{
+	bool pdm_dma_status;
+	u32 pdm_enable, pdm_dma_enable;
+
+	pdm_dma_status = false;
+	pdm_enable = rn_readl(acp_base + ACP_WOV_PDM_ENABLE);
+	pdm_dma_enable = rn_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
+	if ((pdm_enable & ACP_PDM_ENABLE) && (pdm_dma_enable &
+	     ACP_PDM_DMA_EN_STATUS))
+		pdm_dma_status = true;
+	return pdm_dma_status;
+}
+
+static int start_pdm_dma(void __iomem *acp_base)
+{
+	u32 pdm_enable;
+	u32 pdm_dma_enable;
+	int timeout;
+
+	pdm_enable = 0x01;
+	pdm_dma_enable  = 0x01;
+
+	enable_pdm_clock(acp_base);
+	rn_writel(pdm_enable, acp_base + ACP_WOV_PDM_ENABLE);
+	rn_writel(pdm_dma_enable, acp_base + ACP_WOV_PDM_DMA_ENABLE);
+	pdm_dma_enable = 0x00;
+	timeout = 0;
+	while (++timeout < ACP_COUNTER) {
+		pdm_dma_enable = rn_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
+		if ((pdm_dma_enable & 0x02) == ACP_PDM_DMA_EN_STATUS)
+			return 0;
+		udelay(DELAY_US);
+	}
+	return -ETIMEDOUT;
+}
+
+static int stop_pdm_dma(void __iomem *acp_base)
+{
+	u32 pdm_enable, pdm_dma_enable, pdm_fifo_flush;
+	int timeout;
+
+	pdm_enable = 0x00;
+	pdm_dma_enable  = 0x00;
+	pdm_fifo_flush = 0x00;
+
+	pdm_enable = rn_readl(acp_base + ACP_WOV_PDM_ENABLE);
+	pdm_dma_enable = rn_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
+	if (pdm_dma_enable & 0x01) {
+		pdm_dma_enable = 0x02;
+		rn_writel(pdm_dma_enable, acp_base + ACP_WOV_PDM_DMA_ENABLE);
+		pdm_dma_enable = 0x00;
+		timeout = 0;
+		while (++timeout < ACP_COUNTER) {
+			pdm_dma_enable = rn_readl(acp_base +
+						  ACP_WOV_PDM_DMA_ENABLE);
+			if ((pdm_dma_enable & 0x02) == 0x00)
+				break;
+			udelay(DELAY_US);
+		}
+		if (timeout == ACP_COUNTER)
+			return -ETIMEDOUT;
+	}
+	if (pdm_enable == ACP_PDM_ENABLE) {
+		pdm_enable = ACP_PDM_DISABLE;
+		rn_writel(pdm_enable, acp_base + ACP_WOV_PDM_ENABLE);
+	}
+	rn_writel(0x01, acp_base + ACP_WOV_PDM_FIFO_FLUSH);
+	return 0;
+}
+
 static void config_acp_dma(struct pdm_stream_instance *rtd, int direction)
 {
 	u16 page_idx;
@@ -230,6 +322,62 @@ static int acp_pdm_dma_close(struct snd_soc_component *component,
 	return 0;
 }
 
+static int acp_pdm_dai_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct pdm_stream_instance *rtd;
+	unsigned int ch_mask;
+
+	rtd = substream->runtime->private_data;
+	switch (params_channels(params)) {
+	case TWO_CH:
+	default:
+		ch_mask = 0x00;
+		break;
+	}
+	config_pdm_stream_params(ch_mask, rtd->acp_base);
+	return 0;
+}
+
+static int acp_pdm_dai_trigger(struct snd_pcm_substream *substream,
+			       int cmd, struct snd_soc_dai *dai)
+{
+	struct pdm_stream_instance *rtd;
+	int ret;
+	bool pdm_status;
+
+	rtd = substream->runtime->private_data;
+	ret = 0;
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		rtd->bytescount = acp_pdm_get_byte_count(rtd,
+							 substream->stream);
+		pdm_status = check_pdm_dma_status(rtd->acp_base);
+		if (!pdm_status)
+			ret = start_pdm_dma(rtd->acp_base);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		pdm_status = check_pdm_dma_status(rtd->acp_base);
+		if (pdm_status)
+			ret = stop_pdm_dma(rtd->acp_base);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+static struct snd_soc_dai_ops acp_pdm_dai_ops = {
+	.hw_params = acp_pdm_dai_hw_params,
+	.trigger   = acp_pdm_dai_trigger,
+};
+
 static struct snd_soc_dai_driver acp_pdm_dai_driver = {
 	.capture = {
 		.rates = SNDRV_PCM_RATE_48000,
@@ -240,6 +388,7 @@ static struct snd_soc_dai_driver acp_pdm_dai_driver = {
 		.rate_min = 48000,
 		.rate_max = 48000,
 	},
+	.ops = &acp_pdm_dai_ops,
 };
 
 static const struct snd_soc_component_driver acp_pdm_component = {
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index 3536d24374f3..a4f654cf2df0 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -31,6 +31,15 @@
 #define PDM_DMA_STAT 0x10
 #define PDM_DMA_INTR_MASK  0x10000
 #define ACP_ERROR_STAT 29
+#define PDM_DECIMATION_FACTOR 0x2
+#define ACP_PDM_CLK_FREQ_MASK 0x07
+#define ACP_WOV_MISC_CTRL_MASK 0x10
+#define ACP_PDM_ENABLE 0x01
+#define ACP_PDM_DISABLE 0x00
+#define ACP_PDM_DMA_EN_STATUS 0x02
+#define TWO_CH 0x02
+#define DELAY_US 5
+#define ACP_COUNTER 20000
 
 #define ACP_SRAM_PTE_OFFSET	0x02050000
 #define PAGE_SIZE_4K_ENABLE     0x2
-- 
2.25.4

