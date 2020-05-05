Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A041C6288
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 23:00:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1234C1772;
	Tue,  5 May 2020 22:59:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1234C1772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588712440;
	bh=Igla09ETp60iY1gEx1MlGo1GxsIuTceT4ToXnMNebzM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IEBi4jpnnoUp4omKyxZ10Qj+U4ezosPcVEZXooFO4XvFtZdxH5iATgO1l3wKPVv0Q
	 xInk2/LFD/ko3r3a4H+s9SzA/1BEWpvZrqsQyHzqimX5/8HqNL38UaoR5S004C4jl/
	 JfhdJE+Pz3F5UZ+t29gkpImH+AfGuaFsB/EYnphw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE6F0F802FF;
	Tue,  5 May 2020 22:54:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D7BFF802A7; Tue,  5 May 2020 22:54:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 217C7F800DE
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 22:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 217C7F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mNM1t4iV"
Received: by mail-qv1-xf43.google.com with SMTP id di6so1767348qvb.10
 for <alsa-devel@alsa-project.org>; Tue, 05 May 2020 13:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XKmSnGYNJYfMgcjNS7NMC+RW900x2WF7flSWrL//nLY=;
 b=mNM1t4iVUhmNy+EwBiHOBNh3wnuqB85BqlTNM7E7K5bZBCUIfJS/yakqI7AxtYCJP+
 laA1BS8sRXbhsEMIQXuwT0+eG5XGHvLIjnPIBUm/e60ajdSR01vkWQhETXDtVCBhHscE
 SlrgiQRezan9HrQ3sxp5J3N4ih+2unJ0cnjXMqGxBxiGmuoabFy4wIrBWJ2w2Qf7p0ce
 R0fBtZ7SHdDt6ucS1IrpDUo97D1RH9ibSyWSTNHLzQLxKlSRGF/7q1GK/yUX0whs9G0b
 SgIt/mInuWy3v2+lLwBGvzTzdfHUL/MQLz/XLwx6QYNCiH/4BuvonEN9SJmIMRfqHDHj
 0q/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XKmSnGYNJYfMgcjNS7NMC+RW900x2WF7flSWrL//nLY=;
 b=M5z4hUjHixwV23RQEDPnXtIp+ybiPaoWJUWO9dZhdC9T8eQxY6qRkXghIRFUzpUaDX
 TLW89HLJqdPInaDbHhpdNeBWxx0jBSQCcMtJEOapT/i4o79OPgWyB9nEMIWvXzsb+a9Q
 MdT0ebWN9fPCELA7Qd/otr4P2894quuQRhl9roMkbPdhw5J+bhsa6s2W65ARIgyhTMZm
 Re1aTR/l/cOOv3FaXNlEcgCfPFKuZ4/d+wsT9DqsARyattMR18rhJ8yewdL/s2Ys52bH
 hRJKLdRlWNoOwNIV17wmMeDojS1SgVRu32udIeRr4LV8mEGe9UPLuzH+LAEYLVvYpF5O
 SNYQ==
X-Gm-Message-State: AGi0PuYGWuX7UTjFVPybQwcezQ/GL5BdFYQRIJYYMherZNCVIS1dFEP1
 GqaWxrEYNqt/gJC4j6mhmbWvesbo
X-Google-Smtp-Source: APiQypLciT4SuIOMrAbayYTD+AYqnAp/sLVvy6tlxVh5+HQtCRuxh/L9gt8zmx5IGV6dlgKUXJQGMQ==
X-Received: by 2002:a05:6214:572:: with SMTP id
 cj18mr4602002qvb.209.1588712027048; 
 Tue, 05 May 2020 13:53:47 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id k58sm2972513qtf.40.2020.05.05.13.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 13:53:46 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH 08/14] ASoC: amd: add ACP PDM DMA driver dai ops
Date: Tue,  5 May 2020 16:53:21 -0400
Message-Id: <20200505205327.642282-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200505205327.642282-1-alexander.deucher@amd.com>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
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
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 147 ++++++++++++++++++++++++++-
 sound/soc/amd/renoir/rn_acp3x.h      |   7 ++
 2 files changed, 152 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 0b5dc49f42c3..6e8d5b85bce4 100644
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
+	while (++timeout < 20000) {
+		pdm_dma_enable = rn_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
+		if ((pdm_dma_enable & 0x02) == ACP_PDM_DMA_EN_STATUS)
+			return 0;
+		udelay(5);
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
+		while (++timeout < 20000) {
+			pdm_dma_enable = rn_readl(acp_base +
+						  ACP_WOV_PDM_DMA_ENABLE);
+			if ((pdm_dma_enable & 0x02) == 0x00)
+				return 0;
+			udelay(5);
+		}
+		if (timeout == 20000)
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
@@ -234,9 +326,60 @@ static int acp_pdm_dma_close(struct snd_soc_component *component,
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
 static struct snd_soc_dai_ops acp_pdm_dai_ops = {
-	.hw_params = NULL,
-	.trigger   = NULL,
+	.hw_params = acp_pdm_dai_hw_params,
+	.trigger   = acp_pdm_dai_trigger,
 };
 
 static struct snd_soc_dai_driver acp_pdm_dai_driver = {
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index 3536d24374f3..f63e232565af 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -31,6 +31,13 @@
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
 
 #define ACP_SRAM_PTE_OFFSET	0x02050000
 #define PAGE_SIZE_4K_ENABLE     0x2
-- 
2.25.4

