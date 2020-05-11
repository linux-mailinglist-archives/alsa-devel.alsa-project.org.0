Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF801CE76C
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 23:28:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC3A21614;
	Mon, 11 May 2020 23:27:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC3A21614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589232492;
	bh=CxVgblUeg5dBR3pRgSAvREjHpbU0KebyCMC1aosPmfY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X7TGkk6n0o0A7SO8K8clEUJZOokob+QIeF1/zTDTuCM53mhpSBsJVfG8QwoGdaUu3
	 q8I/yjhN+5yge/N5MIlNRPHRgSgL1PmbebXejMuWmH9ynGC3FkhqLZp5gJPCaH3/TW
	 vBS6W3GXZcW6lMzQPm2eKbbMLqAx3kFuxLC7Zk+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC824F80316;
	Mon, 11 May 2020 23:21:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E728AF802A8; Mon, 11 May 2020 23:20:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96D5DF8028F
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96D5DF8028F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EaWqtrJ5"
Received: by mail-qk1-x741.google.com with SMTP id s186so9628754qkd.4
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wM7CDZZrP/Q8f2z/XKIV64kJVsKd3FVoJ2Oao0DsFdE=;
 b=EaWqtrJ5eDLLgsJVwtCMMiVDOJ0vgiypqvmHFIge1jt/dOtCMEyxJj8fbt2Vl7MsC/
 u9FDUvds6eiqW/JURBczaPwsStj0gYlRC9I/N01HUgu5LVkpFOn2ruMTEOpXArdtbhhj
 myjdcYJuHklE+EbvRPVbLqK4q2qq9xqAIbAjuXn9KzrBOEUZQLbEgucpaZAm9u8ML0vx
 +I37Gu4w4vIkNsbpPGTEGE4CQZuqGoqsxyk8hrat2dihI3NxRRXa/poa2Ccnq5m7Whjp
 gBcyEB0msHe8TjtyDOXRHU42VR5uh0mmQurY+47vkhU+A9LyHOkKq+4d55xh0TWWrM/3
 YsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wM7CDZZrP/Q8f2z/XKIV64kJVsKd3FVoJ2Oao0DsFdE=;
 b=jLNPQoH+KpcFIIZCXfYGSLu5jDJ74OfzIURtgoo5b6YYMBmFDXy6eIGuAQz3eXGT19
 CBGy65anKslJfnX9Fw7iTxhpGF0HPFhCFLpNXMw9ISCpzY9jkgHmSQ3EZNVGpOjCtzkd
 3lhBtuheg37BkhEFfBc3HlknsMR1Y6tUOezpaY1GOLFhPY6hoLdcNulVcsM7LpnoYmB1
 H9dVQG3UgXPKey1EKc/8bGA979JeyMt5wjBu+FRecaM5to/VRcN+IB0lmedX+i3Ps12L
 Nowa3NwlAL8WFcN5UasTXn9F7KQHtAwETvtB13ujD8ZdJhRr9NE9IyPiNANGxGTtPlok
 IsMA==
X-Gm-Message-State: AGi0Pua5aFAqYvdPFVWfeqkK6bQjgAQHFJJz0DqRzQp5BZkesisew8A5
 PZnNH7rbdhEcTBg9ICV0I5RGbE5f
X-Google-Smtp-Source: APiQypKtEB2OQ3SsYpBn8rFBXphuLBRhzDMpuRp3w2rM3Xscq4xlZl+Zx4Lui6dWnlVtWFL6+xVeOA==
X-Received: by 2002:a37:9b47:: with SMTP id d68mr17257370qke.88.1589232031987; 
 Mon, 11 May 2020 14:20:31 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id c26sm9148691qkm.98.2020.05.11.14.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:20:31 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH v2 07/14] ASoC: amd: add acp3x pdm driver dma ops
Date: Mon, 11 May 2020 17:20:07 -0400
Message-Id: <20200511212014.2359225-8-alexander.deucher@amd.com>
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

This patch adds PDM driver DMA operations.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---

v2:
- Removed SNDRV_PCM_INFO_BATCH flag

 sound/soc/amd/renoir/acp3x-pdm-dma.c | 195 +++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h      |  29 ++++
 2 files changed, 224 insertions(+)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index fdac2c1e3acd..8bb03fa5b4a5 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -16,6 +16,25 @@
 
 #define DRV_NAME "acp_rn_pdm_dma"
 
+static const struct snd_pcm_hardware acp_pdm_hardware_capture = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
+	.formats = SNDRV_PCM_FMTBIT_S32_LE,
+	.channels_min = 2,
+	.channels_max = 2,
+	.rates = SNDRV_PCM_RATE_48000,
+	.rate_min = 48000,
+	.rate_max = 48000,
+	.buffer_bytes_max = CAPTURE_MAX_NUM_PERIODS * CAPTURE_MAX_PERIOD_SIZE,
+	.period_bytes_min = CAPTURE_MIN_PERIOD_SIZE,
+	.period_bytes_max = CAPTURE_MAX_PERIOD_SIZE,
+	.periods_min = CAPTURE_MIN_NUM_PERIODS,
+	.periods_max = CAPTURE_MAX_NUM_PERIODS,
+};
+
 static irqreturn_t pdm_irq_handler(int irq, void *dev_id)
 {
 	struct pdm_dev_data *rn_pdm_data;
@@ -41,6 +60,176 @@ static irqreturn_t pdm_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 }
 
+static void init_pdm_ring_buffer(u32 physical_addr,
+				 u32 buffer_size,
+				 u32 watermark_size,
+				 void __iomem *acp_base)
+{
+	rn_writel(physical_addr, acp_base + ACP_WOV_RX_RINGBUFADDR);
+	rn_writel(buffer_size, acp_base + ACP_WOV_RX_RINGBUFSIZE);
+	rn_writel(watermark_size, acp_base + ACP_WOV_RX_INTR_WATERMARK_SIZE);
+	rn_writel(0x01, acp_base + ACPAXI2AXI_ATU_CTRL);
+}
+
+static void enable_pdm_interrupts(void __iomem *acp_base)
+{
+	u32 ext_int_ctrl;
+
+	ext_int_ctrl = rn_readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
+	ext_int_ctrl |= PDM_DMA_INTR_MASK;
+	rn_writel(ext_int_ctrl, acp_base + ACP_EXTERNAL_INTR_CNTL);
+}
+
+static void disable_pdm_interrupts(void __iomem *acp_base)
+{
+	u32 ext_int_ctrl;
+
+	ext_int_ctrl = rn_readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
+	ext_int_ctrl |= ~PDM_DMA_INTR_MASK;
+	rn_writel(ext_int_ctrl, acp_base + ACP_EXTERNAL_INTR_CNTL);
+}
+
+static void config_acp_dma(struct pdm_stream_instance *rtd, int direction)
+{
+	u16 page_idx;
+	u32 low, high, val;
+	dma_addr_t addr;
+
+	addr = rtd->dma_addr;
+	val = 0;
+
+	/* Group Enable */
+	rn_writel(ACP_SRAM_PTE_OFFSET | BIT(31), rtd->acp_base +
+		  ACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
+	rn_writel(PAGE_SIZE_4K_ENABLE, rtd->acp_base +
+		  ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1);
+
+	for (page_idx = 0; page_idx < rtd->num_pages; page_idx++) {
+		/* Load the low address of page int ACP SRAM through SRBM */
+		low = lower_32_bits(addr);
+		high = upper_32_bits(addr);
+
+		rn_writel(low, rtd->acp_base + ACP_SCRATCH_REG_0 + val);
+		high |= BIT(31);
+		rn_writel(high, rtd->acp_base + ACP_SCRATCH_REG_0 + val + 4);
+		val += 8;
+		addr += PAGE_SIZE;
+	}
+}
+
+static int acp_pdm_dma_open(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime;
+	struct pdm_dev_data *adata;
+	struct pdm_stream_instance *pdm_data;
+	int ret;
+
+	runtime = substream->runtime;
+	adata = dev_get_drvdata(component->dev);
+	pdm_data = kzalloc(sizeof(*pdm_data), GFP_KERNEL);
+	if (!pdm_data)
+		return -EINVAL;
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		runtime->hw = acp_pdm_hardware_capture;
+
+	ret = snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0) {
+		dev_err(component->dev, "set integer constraint failed\n");
+		kfree(pdm_data);
+		return ret;
+	}
+
+	enable_pdm_interrupts(adata->acp_base);
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		adata->capture_stream = substream;
+
+	pdm_data->acp_base = adata->acp_base;
+	runtime->private_data = pdm_data;
+	return ret;
+}
+
+static int acp_pdm_dma_hw_params(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params)
+{
+	struct pdm_stream_instance *rtd;
+	size_t size, period_bytes;
+
+	rtd = substream->runtime->private_data;
+	if (!rtd)
+		return -EINVAL;
+	size = params_buffer_bytes(params);
+	period_bytes = params_period_bytes(params);
+	rtd->dma_addr = substream->dma_buffer.addr;
+	rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
+	config_acp_dma(rtd, substream->stream);
+	init_pdm_ring_buffer(MEM_WINDOW_START, size, period_bytes,
+			     rtd->acp_base);
+	return 0;
+}
+
+static u64 acp_pdm_get_byte_count(struct pdm_stream_instance *rtd,
+				  int direction)
+{
+	union acp_pdm_dma_count byte_count;
+
+	byte_count.bcount.high =
+			rn_readl(rtd->acp_base +
+				 ACP_WOV_RX_LINEARPOSITIONCNTR_HIGH);
+	byte_count.bcount.low =
+			rn_readl(rtd->acp_base +
+				 ACP_WOV_RX_LINEARPOSITIONCNTR_LOW);
+	return byte_count.bytescount;
+}
+
+static snd_pcm_uframes_t acp_pdm_dma_pointer(struct snd_soc_component *comp,
+					     struct snd_pcm_substream *stream)
+{
+	struct pdm_stream_instance *rtd;
+	u32 pos, buffersize;
+	u64 bytescount;
+
+	rtd = stream->runtime->private_data;
+	buffersize = frames_to_bytes(stream->runtime,
+				     stream->runtime->buffer_size);
+	bytescount = acp_pdm_get_byte_count(rtd, stream->stream);
+	if (bytescount > rtd->bytescount)
+		bytescount -= rtd->bytescount;
+	pos = do_div(bytescount, buffersize);
+	return bytes_to_frames(stream->runtime, pos);
+}
+
+static int acp_pdm_dma_new(struct snd_soc_component *component,
+			   struct snd_soc_pcm_runtime *rtd)
+{
+	struct device *parent = component->dev->parent;
+
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+				       parent, MIN_BUFFER, MAX_BUFFER);
+	return 0;
+}
+
+static int acp_pdm_dma_mmap(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream,
+			    struct vm_area_struct *vma)
+{
+	return snd_pcm_lib_default_mmap(substream, vma);
+}
+
+static int acp_pdm_dma_close(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
+{
+	struct pdm_dev_data *adata = dev_get_drvdata(component->dev);
+
+	disable_pdm_interrupts(adata->acp_base);
+	adata->capture_stream = NULL;
+	return 0;
+}
+
 static struct snd_soc_dai_driver acp_pdm_dai_driver = {
 	.capture = {
 		.rates = SNDRV_PCM_RATE_48000,
@@ -55,6 +244,12 @@ static struct snd_soc_dai_driver acp_pdm_dai_driver = {
 
 static const struct snd_soc_component_driver acp_pdm_component = {
 	.name		= DRV_NAME,
+	.open		= acp_pdm_dma_open,
+	.close		= acp_pdm_dma_close,
+	.hw_params	= acp_pdm_dma_hw_params,
+	.pointer	= acp_pdm_dma_pointer,
+	.mmap		= acp_pdm_dma_mmap,
+	.pcm_construct	= acp_pdm_dma_new,
 };
 
 static int acp_pdm_audio_probe(struct platform_device *pdev)
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index 1ad8a7845fda..3536d24374f3 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -29,13 +29,42 @@
 #define ACP_ERROR_MASK 0x20000000
 #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
 #define PDM_DMA_STAT 0x10
+#define PDM_DMA_INTR_MASK  0x10000
+#define ACP_ERROR_STAT 29
 
+#define ACP_SRAM_PTE_OFFSET	0x02050000
+#define PAGE_SIZE_4K_ENABLE     0x2
+#define MEM_WINDOW_START	0x4000000
+
+#define CAPTURE_MIN_NUM_PERIODS     4
+#define CAPTURE_MAX_NUM_PERIODS     4
+#define CAPTURE_MAX_PERIOD_SIZE     8192
+#define CAPTURE_MIN_PERIOD_SIZE     4096
+
+#define MAX_BUFFER (CAPTURE_MAX_PERIOD_SIZE * CAPTURE_MAX_NUM_PERIODS)
+#define MIN_BUFFER MAX_BUFFER
 struct pdm_dev_data {
 	u32 pdm_irq;
 	void __iomem *acp_base;
 	struct snd_pcm_substream *capture_stream;
 };
 
+struct pdm_stream_instance {
+	u16 num_pages;
+	u16 channels;
+	dma_addr_t dma_addr;
+	u64 bytescount;
+	void __iomem *acp_base;
+};
+
+union acp_pdm_dma_count {
+	struct {
+	u32 low;
+	u32 high;
+	} bcount;
+	u64 bytescount;
+};
+
 static inline u32 rn_readl(void __iomem *base_addr)
 {
 	return readl(base_addr - ACP_PHY_BASE_ADDRESS);
-- 
2.25.4

