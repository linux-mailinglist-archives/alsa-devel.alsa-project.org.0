Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC3145ED69
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 13:07:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C4E01917;
	Fri, 26 Nov 2021 13:06:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C4E01917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637928437;
	bh=Tap7nohqhvIdOVO/sEbYr6QeW+YBWZazlQEShSPm7Ew=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k8+ijA+9Omh2CLEiFY9aMw175iAQXySHD67qoNTEZs0aa+j3OnYKttBIb6E/KvAML
	 NrKfEYtRoJJlPXnRmOyw5fkTXNLq9woiYyd7Y/sgd1fpqUVLWuQci5fwgCubvBq9TI
	 tke+/IxYheKBeutCc+ypehz7uDPyTEZnliXs/bos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3131BF804CF;
	Fri, 26 Nov 2021 13:05:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C080F804E7; Fri, 26 Nov 2021 13:05:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 107F2F80166
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 13:05:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 107F2F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="Dc5Y84y4"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637928314; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ny5/MAer/BwRYVsU2jMEoXnsxBJUkSduwdN5B9tSzS4=;
 b=Dc5Y84y49liPPKZVwfIIdxIiR8riTFQVzeEPFccv1KGqo58oeedRFZ2eJe8h47nsgok+XMg8
 xo+z//I00Mz0eCf7ZgJtyO7f2moBixbjCBFh5P5nLvf2E2ftaHaL/oj+k4WrF7fEn/aJdqYW
 00YRWL4T7RW9JMrvhWc7RtA0QiQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 61a0cd78bebfa3d4d5ccda14 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Nov 2021 12:05:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3584CC4360D; Fri, 26 Nov 2021 12:05:12 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 167B4C4338F;
 Fri, 26 Nov 2021 12:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 167B4C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH v6 02/10] ASoC: qcom: lpass: Add dma fields for codec dma
 lpass interface
Date: Fri, 26 Nov 2021 17:34:34 +0530
Message-Id: <1637928282-2819-3-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
References: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

Add lpass interface memebers to support audio path over codec dma.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 sound/soc/qcom/lpass.h | 133 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 63aaa6f..4142f12 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -19,6 +19,17 @@
 #define LPASS_MAX_MI2S_PORTS			(8)
 #define LPASS_MAX_DMA_CHANNELS			(8)
 #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
+#define LPASS_MAX_CDC_DMA_CHANNELS		(8)
+#define LPASS_MAX_VA_CDC_DMA_CHANNELS		(8)
+#define LPASS_CDC_DMA_INTF_ONE_CHANNEL		(0x01)
+#define LPASS_CDC_DMA_INTF_TWO_CHANNEL		(0x03)
+#define LPASS_CDC_DMA_INTF_FOUR_CHANNEL		(0x0F)
+#define LPASS_CDC_DMA_INTF_SIX_CHANNEL		(0x3F)
+#define LPASS_CDC_DMA_INTF_EIGHT_CHANNEL	(0xFF)
+
+#define LPASS_MAX_CDC_CLKS			(9)
+#define LPASS_ACTIVE_PDS			(4)
+#define LPASS_PROXY_PDS			(8)
 
 #define QCOM_REGMAP_FIELD_ALLOC(d, m, f, mf)    \
 	do { \
@@ -50,6 +61,12 @@ struct lpaif_dmactl {
 	struct regmap_field *burst8;
 	struct regmap_field *burst16;
 	struct regmap_field *dynburst;
+	struct regmap_field *codec_enable;
+	struct regmap_field *codec_pack;
+	struct regmap_field *codec_intf;
+	struct regmap_field *codec_fs_sel;
+	struct regmap_field *codec_channel;
+	struct regmap_field *codec_fs_delay;
 };
 
 /* Both the CPU DAI and platform drivers will access this data */
@@ -64,6 +81,25 @@ struct lpass_data {
 	/* MI2S bit clock (derived from system clock by a divider */
 	struct clk *mi2s_bit_clk[LPASS_MAX_MI2S_PORTS];
 
+	struct clk *cdc_dma_clks[LPASS_MAX_CDC_CLKS];
+
+	struct clk *xo;
+	struct clk *gcc_cfg_noc_lpass;
+	struct clk *core_cc_core;
+	struct clk *aon_cc_audio_hm_h;
+	struct clk *core_cc_sysnoc_mport_core;
+	struct clk *audio_cc_ext_mclk0;
+	struct clk *audio_cc_ext_mclk1;
+	struct clk *core_cc_lpm_core;
+	struct clk *core_cc_lpm_mem0_core;
+	struct clk *audio_cc_codec_mem;
+	struct clk *audio_cc_codec_mem0;
+	struct clk *audio_cc_codec_mem1;
+	struct clk *audio_cc_codec_mem2;
+	struct clk *audio_cc_rx_mclk_2x;
+	struct clk *audio_cc_rx_mclk;
+	struct clk *aon_cc_va_mem0;
+
 	/* MI2S SD lines to use for playback/capture */
 	unsigned int mi2s_playback_sd_mode[LPASS_MAX_MI2S_PORTS];
 	unsigned int mi2s_capture_sd_mode[LPASS_MAX_MI2S_PORTS];
@@ -72,38 +108,61 @@ struct lpass_data {
 	bool mi2s_was_prepared[LPASS_MAX_MI2S_PORTS];
 
 	int hdmi_port_enable;
+	int codec_dma_enable;
 
 	/* low-power audio interface (LPAIF) registers */
 	void __iomem *lpaif;
 	void __iomem *hdmiif;
+	void __iomem *rxtx_lpaif;
+	void __iomem *va_lpaif;
+
+	u32 rxtx_cdc_dma_lpm_buf;
+	u32 va_cdc_dma_lpm_buf;
 
 	/* regmap backed by the low-power audio interface (LPAIF) registers */
 	struct regmap *lpaif_map;
 	struct regmap *hdmiif_map;
+	struct regmap *rxtx_lpaif_map;
+	struct regmap *va_lpaif_map;
 
 	/* interrupts from the low-power audio interface (LPAIF) */
 	int lpaif_irq;
 	int hdmiif_irq;
+	int rxtxif_irq;
+	int vaif_irq;
+
 	/* SOC specific variations in the LPASS IP integration */
 	struct lpass_variant *variant;
 
 	/* bit map to keep track of static channel allocations */
 	unsigned long dma_ch_bit_map;
 	unsigned long hdmi_dma_ch_bit_map;
+	unsigned long rxtx_dma_ch_bit_map;
+	unsigned long va_dma_ch_bit_map;
 
 	/* used it for handling interrupt per dma channel */
 	struct snd_pcm_substream *substream[LPASS_MAX_DMA_CHANNELS];
 	struct snd_pcm_substream *hdmi_substream[LPASS_MAX_HDMI_DMA_CHANNELS];
+	struct snd_pcm_substream *rxtx_substream[LPASS_MAX_CDC_DMA_CHANNELS];
+	struct snd_pcm_substream *va_substream[LPASS_MAX_CDC_DMA_CHANNELS];
 
 	/* SOC specific clock list */
 	struct clk_bulk_data *clks;
 	int num_clks;
+	struct clk_bulk_data *cdc_clks;
+	int cdc_num_clks;
 
 	/* Regmap fields of I2SCTL & DMACTL registers bitfields */
 	struct lpaif_i2sctl *i2sctl;
 	struct lpaif_dmactl *rd_dmactl;
 	struct lpaif_dmactl *wr_dmactl;
 	struct lpaif_dmactl *hdmi_rd_dmactl;
+
+	/* Regmap fields of CODEC DMA CTRL registers*/
+	struct lpaif_dmactl *rxtx_rd_dmactl;
+	struct lpaif_dmactl *rxtx_wr_dmactl;
+	struct lpaif_dmactl *va_wr_dmactl;
+
 	/* Regmap fields of HDMI_CTRL registers*/
 	struct regmap_field *hdmitx_legacy_en;
 	struct regmap_field *hdmitx_parity_calc_en;
@@ -130,6 +189,24 @@ struct lpass_variant {
 	u32	wrdma_reg_base;
 	u32	wrdma_reg_stride;
 	u32	wrdma_channels;
+	u32	rxtx_irq_reg_base;
+	u32	rxtx_irq_reg_stride;
+	u32	rxtx_irq_ports;
+	u32	rxtx_rdma_reg_base;
+	u32	rxtx_rdma_reg_stride;
+	u32	rxtx_rdma_channels;
+	u32	rxtx_wrdma_reg_base;
+	u32	rxtx_wrdma_reg_stride;
+	u32	rxtx_wrdma_channels;
+	u32	va_irq_reg_base;
+	u32	va_irq_reg_stride;
+	u32	va_irq_ports;
+	u32	va_rdma_reg_base;
+	u32	va_rdma_reg_stride;
+	u32	va_rdma_channels;
+	u32	va_wrdma_reg_base;
+	u32	va_wrdma_reg_stride;
+	u32	va_wrdma_channels;
 	u32	i2sctrl_reg_base;
 	u32	i2sctrl_reg_stride;
 	u32	i2s_ports;
@@ -233,12 +310,66 @@ struct lpass_variant {
 	struct reg_field wrdma_enable;
 	struct reg_field wrdma_dyncclk;
 
+	/*CDC RXTX RD_DMA */
+	struct reg_field rxtx_rdma_intf;
+	struct reg_field rxtx_rdma_bursten;
+	struct reg_field rxtx_rdma_wpscnt;
+	struct reg_field rxtx_rdma_fifowm;
+	struct reg_field rxtx_rdma_enable;
+	struct reg_field rxtx_rdma_dyncclk;
+	struct reg_field rxtx_rdma_burst8;
+	struct reg_field rxtx_rdma_burst16;
+	struct reg_field rxtx_rdma_dynburst;
+	struct reg_field rxtx_rdma_codec_enable;
+	struct reg_field rxtx_rdma_codec_pack;
+	struct reg_field rxtx_rdma_codec_intf;
+	struct reg_field rxtx_rdma_codec_fs_sel;
+	struct reg_field rxtx_rdma_codec_ch;
+	struct reg_field rxtx_rdma_codec_fs_delay;
+
+	/*CDC RXTX WR_DMA */
+	struct reg_field rxtx_wrdma_intf;
+	struct reg_field rxtx_wrdma_bursten;
+	struct reg_field rxtx_wrdma_wpscnt;
+	struct reg_field rxtx_wrdma_fifowm;
+	struct reg_field rxtx_wrdma_enable;
+	struct reg_field rxtx_wrdma_dyncclk;
+	struct reg_field rxtx_wrdma_burst8;
+	struct reg_field rxtx_wrdma_burst16;
+	struct reg_field rxtx_wrdma_dynburst;
+	struct reg_field rxtx_wrdma_codec_enable;
+	struct reg_field rxtx_wrdma_codec_pack;
+	struct reg_field rxtx_wrdma_codec_intf;
+	struct reg_field rxtx_wrdma_codec_fs_sel;
+	struct reg_field rxtx_wrdma_codec_ch;
+	struct reg_field rxtx_wrdma_codec_fs_delay;
+
+	/*CDC VA WR_DMA */
+	struct reg_field va_wrdma_intf;
+	struct reg_field va_wrdma_bursten;
+	struct reg_field va_wrdma_wpscnt;
+	struct reg_field va_wrdma_fifowm;
+	struct reg_field va_wrdma_enable;
+	struct reg_field va_wrdma_dyncclk;
+	struct reg_field va_wrdma_burst8;
+	struct reg_field va_wrdma_burst16;
+	struct reg_field va_wrdma_dynburst;
+	struct reg_field va_wrdma_codec_enable;
+	struct reg_field va_wrdma_codec_pack;
+	struct reg_field va_wrdma_codec_intf;
+	struct reg_field va_wrdma_codec_fs_sel;
+	struct reg_field va_wrdma_codec_ch;
+	struct reg_field va_wrdma_codec_fs_delay;
+
 	/**
 	 * on SOCs like APQ8016 the channel control bits start
 	 * at different offset to ipq806x
 	 **/
 	u32	dmactl_audif_start;
 	u32	wrdma_channel_start;
+	u32	rxtx_wrdma_channel_start;
+	u32	va_wrdma_channel_start;
+
 	/* SOC specific initialization like clocks */
 	int (*init)(struct platform_device *pdev);
 	int (*exit)(struct platform_device *pdev);
@@ -250,10 +381,12 @@ struct lpass_variant {
 	int num_dai;
 	const char * const *dai_osr_clk_names;
 	const char * const *dai_bit_clk_names;
+	const char * const *cdc_dma_clk_names;
 
 	/* SOC specific clocks configuration */
 	const char **clk_name;
 	int num_clks;
+	int cdc_dma_num_clks;
 };
 
 struct lpass_pcm_data {
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

