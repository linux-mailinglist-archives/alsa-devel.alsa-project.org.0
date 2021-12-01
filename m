Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D3A465093
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 15:54:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44DD52596;
	Wed,  1 Dec 2021 15:53:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44DD52596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638370447;
	bh=x9uBLOA0MAThOCMwxiAh7XAB3RS/+Ju3nHofvCP1qY8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AIx8KtelWu1rJ0oqj63xTqZFfJuicGB/+z2cUWXKzZ1bxayCnqQaudPd53VMQKre1
	 UjKf2ZrpeCP4tDLqzMorA24i+iPr2OKaskD1juLUzjuIw1p346Y4H2bmMxDoFzBAKE
	 LfjyWG/2Y+Ps55khUv0Oi3rtsvCok+JHnT6HobvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C83CF804FC;
	Wed,  1 Dec 2021 15:52:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7390F804FF; Wed,  1 Dec 2021 15:52:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0EC9F804FC
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 15:52:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0EC9F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="N0a7Yiil"
Received: by mail-wr1-x434.google.com with SMTP id d24so52957108wra.0
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 06:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Im4lhnDU7h1zzEhl7Bg6dNQdOJiiGLdPlwaGdlFdY0w=;
 b=N0a7Yiilgm9EGpuyCzXLbA5mmqYCItPOful2q8+86Y8Az88yCITQKe9AqyBa4pDWqN
 lAyrbGoNCHs4VALD+g5PxHaKlLldcuXhXkeWwQImSJxPJPySV39xQHXIj7vdUY1RTfLz
 gKWTrp12/+PBD2LLijhRcDiZLkA2ydXM92JKtr/bBX6Q03JGqJeE9+AlxM8fDKQ9+mpl
 k7tTzNgYFyGhhmxzgOPf0RPUmXxLaGeJTzBez5ot0AE4qNXl18R0vAlNN1gh+Zs+6ifD
 vXhPCQmpO0Z0baMTozp5rmYzflECFVtosStlfYN3mbnhkxcSMXCEYbMQys7VGEecQE0W
 K6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Im4lhnDU7h1zzEhl7Bg6dNQdOJiiGLdPlwaGdlFdY0w=;
 b=tCPJE/ZXhHVh7KPY4dlZn+7e03bNW8V/qVt0LETS3kNkA4hwWb8JE3j39yNzCPwagm
 EVU3Fq1pYw462seGAqWFmAS1w/eWltZT247rX3slJBGGIQYokMSYlQqnZJdyzW5HNVrV
 Rqaj1BtAPPdOcJ670rgaILC4lgUwaJ51BR0fOAa20tJMQ974BLo0R/2wtBM8JUt7NSXa
 2lZSONm0FjneLBjnWab0sdr/yyNVu+KGd5HS449+oN2zFVfcL5tXj5v+lZp8+1SbujQI
 q4LHTfmPwjXoa3Q5N5t5DwfjthakNLAPKtgiuhyR6FaXG+gjzJE7ZoovYj7pePGx9En7
 n+tQ==
X-Gm-Message-State: AOAM531w8wzB/1GBi6e9o4WTPcma3C6ljd11+YvklMZCX617d+EnCPie
 cU0y6aY8dnzgCTDwhD/puy0tRA==
X-Google-Smtp-Source: ABdhPJyAt928KhsGzc7akjW3LCjIvAwdtXvf03dwEyiYbCd2F1dSKNV1Hl1qm6/oNSiWMY4mjNzZmw==
X-Received: by 2002:a05:6000:82:: with SMTP id
 m2mr7044492wrx.202.1638370323944; 
 Wed, 01 Dec 2021 06:52:03 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id j40sm1282103wms.19.2021.12.01.06.52.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 06:52:03 -0800 (PST)
Subject: Re: [PATCH v6 02/10] ASoC: qcom: lpass: Add dma fields for codec dma
 lpass interface
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
 <1637928282-2819-3-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <bf9e086f-29d0-6df0-f8b8-8a26b4c052a8@linaro.org>
Date: Wed, 1 Dec 2021 14:52:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637928282-2819-3-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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



On 26/11/2021 12:04, Srinivasa Rao Mandadapu wrote:
> Add lpass interface memebers to support audio path over codec dma.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass.h | 133 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 133 insertions(+)
> 
> diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
> index 63aaa6f..4142f12 100644
> --- a/sound/soc/qcom/lpass.h
> +++ b/sound/soc/qcom/lpass.h
> @@ -19,6 +19,17 @@
>   #define LPASS_MAX_MI2S_PORTS			(8)
>   #define LPASS_MAX_DMA_CHANNELS			(8)
>   #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
> +#define LPASS_MAX_CDC_DMA_CHANNELS		(8)
> +#define LPASS_MAX_VA_CDC_DMA_CHANNELS		(8)
> +#define LPASS_CDC_DMA_INTF_ONE_CHANNEL		(0x01)
> +#define LPASS_CDC_DMA_INTF_TWO_CHANNEL		(0x03)
> +#define LPASS_CDC_DMA_INTF_FOUR_CHANNEL		(0x0F)
> +#define LPASS_CDC_DMA_INTF_SIX_CHANNEL		(0x3F)
> +#define LPASS_CDC_DMA_INTF_EIGHT_CHANNEL	(0xFF)
> +
> +#define LPASS_MAX_CDC_CLKS			(9)
> +#define LPASS_ACTIVE_PDS			(4)
> +#define LPASS_PROXY_PDS			(8)
>   
>   #define QCOM_REGMAP_FIELD_ALLOC(d, m, f, mf)    \
>   	do { \
> @@ -50,6 +61,12 @@ struct lpaif_dmactl {
>   	struct regmap_field *burst8;
>   	struct regmap_field *burst16;
>   	struct regmap_field *dynburst;
> +	struct regmap_field *codec_enable;
> +	struct regmap_field *codec_pack;
> +	struct regmap_field *codec_intf;
> +	struct regmap_field *codec_fs_sel;
> +	struct regmap_field *codec_channel;
> +	struct regmap_field *codec_fs_delay;
>   };
>   
>   /* Both the CPU DAI and platform drivers will access this data */
> @@ -64,6 +81,25 @@ struct lpass_data {
>   	/* MI2S bit clock (derived from system clock by a divider */
>   	struct clk *mi2s_bit_clk[LPASS_MAX_MI2S_PORTS];
>   
> +	struct clk *cdc_dma_clks[LPASS_MAX_CDC_CLKS];
> +
> +	struct clk *xo;
> +	struct clk *gcc_cfg_noc_lpass;
> +	struct clk *core_cc_core;
> +	struct clk *aon_cc_audio_hm_h;
> +	struct clk *core_cc_sysnoc_mport_core;
> +	struct clk *audio_cc_ext_mclk0;
> +	struct clk *audio_cc_ext_mclk1;
> +	struct clk *core_cc_lpm_core;
> +	struct clk *core_cc_lpm_mem0_core;
> +	struct clk *audio_cc_codec_mem;
> +	struct clk *audio_cc_codec_mem0;
> +	struct clk *audio_cc_codec_mem1;
> +	struct clk *audio_cc_codec_mem2;
> +	struct clk *audio_cc_rx_mclk_2x;
> +	struct clk *audio_cc_rx_mclk;
> +	struct clk *aon_cc_va_mem0;
> +
>   	/* MI2S SD lines to use for playback/capture */
>   	unsigned int mi2s_playback_sd_mode[LPASS_MAX_MI2S_PORTS];
>   	unsigned int mi2s_capture_sd_mode[LPASS_MAX_MI2S_PORTS];
> @@ -72,38 +108,61 @@ struct lpass_data {
>   	bool mi2s_was_prepared[LPASS_MAX_MI2S_PORTS];
>   
>   	int hdmi_port_enable;
> +	int codec_dma_enable;
>   
>   	/* low-power audio interface (LPAIF) registers */
>   	void __iomem *lpaif;
>   	void __iomem *hdmiif;
> +	void __iomem *rxtx_lpaif;
> +	void __iomem *va_lpaif;
> +
> +	u32 rxtx_cdc_dma_lpm_buf;
> +	u32 va_cdc_dma_lpm_buf;
>   
>   	/* regmap backed by the low-power audio interface (LPAIF) registers */
>   	struct regmap *lpaif_map;
>   	struct regmap *hdmiif_map;
> +	struct regmap *rxtx_lpaif_map;
> +	struct regmap *va_lpaif_map;
>   
>   	/* interrupts from the low-power audio interface (LPAIF) */
>   	int lpaif_irq;
>   	int hdmiif_irq;
> +	int rxtxif_irq;
> +	int vaif_irq;
> +
>   	/* SOC specific variations in the LPASS IP integration */
>   	struct lpass_variant *variant;
>   
>   	/* bit map to keep track of static channel allocations */
>   	unsigned long dma_ch_bit_map;
>   	unsigned long hdmi_dma_ch_bit_map;
> +	unsigned long rxtx_dma_ch_bit_map;
> +	unsigned long va_dma_ch_bit_map;
>   
>   	/* used it for handling interrupt per dma channel */
>   	struct snd_pcm_substream *substream[LPASS_MAX_DMA_CHANNELS];
>   	struct snd_pcm_substream *hdmi_substream[LPASS_MAX_HDMI_DMA_CHANNELS];
> +	struct snd_pcm_substream *rxtx_substream[LPASS_MAX_CDC_DMA_CHANNELS];
> +	struct snd_pcm_substream *va_substream[LPASS_MAX_CDC_DMA_CHANNELS];
>   
>   	/* SOC specific clock list */
>   	struct clk_bulk_data *clks;
>   	int num_clks;
> +	struct clk_bulk_data *cdc_clks;
> +	int cdc_num_clks;
>   
>   	/* Regmap fields of I2SCTL & DMACTL registers bitfields */
>   	struct lpaif_i2sctl *i2sctl;
>   	struct lpaif_dmactl *rd_dmactl;
>   	struct lpaif_dmactl *wr_dmactl;
>   	struct lpaif_dmactl *hdmi_rd_dmactl;
> +
> +	/* Regmap fields of CODEC DMA CTRL registers*/
> +	struct lpaif_dmactl *rxtx_rd_dmactl;
> +	struct lpaif_dmactl *rxtx_wr_dmactl;
> +	struct lpaif_dmactl *va_wr_dmactl;
> +
>   	/* Regmap fields of HDMI_CTRL registers*/
>   	struct regmap_field *hdmitx_legacy_en;
>   	struct regmap_field *hdmitx_parity_calc_en;
> @@ -130,6 +189,24 @@ struct lpass_variant {
>   	u32	wrdma_reg_base;
>   	u32	wrdma_reg_stride;
>   	u32	wrdma_channels;
> +	u32	rxtx_irq_reg_base;
> +	u32	rxtx_irq_reg_stride;
> +	u32	rxtx_irq_ports;
> +	u32	rxtx_rdma_reg_base;
> +	u32	rxtx_rdma_reg_stride;
> +	u32	rxtx_rdma_channels;
> +	u32	rxtx_wrdma_reg_base;
> +	u32	rxtx_wrdma_reg_stride;
> +	u32	rxtx_wrdma_channels;
> +	u32	va_irq_reg_base;
> +	u32	va_irq_reg_stride;
> +	u32	va_irq_ports;
> +	u32	va_rdma_reg_base;
> +	u32	va_rdma_reg_stride;
> +	u32	va_rdma_channels;
> +	u32	va_wrdma_reg_base;
> +	u32	va_wrdma_reg_stride;
> +	u32	va_wrdma_channels;
>   	u32	i2sctrl_reg_base;
>   	u32	i2sctrl_reg_stride;
>   	u32	i2s_ports;
> @@ -233,12 +310,66 @@ struct lpass_variant {
>   	struct reg_field wrdma_enable;
>   	struct reg_field wrdma_dyncclk;
>   
> +	/*CDC RXTX RD_DMA */
> +	struct reg_field rxtx_rdma_intf;
> +	struct reg_field rxtx_rdma_bursten;
> +	struct reg_field rxtx_rdma_wpscnt;
> +	struct reg_field rxtx_rdma_fifowm;
> +	struct reg_field rxtx_rdma_enable;
> +	struct reg_field rxtx_rdma_dyncclk;
> +	struct reg_field rxtx_rdma_burst8;
> +	struct reg_field rxtx_rdma_burst16;
> +	struct reg_field rxtx_rdma_dynburst;
> +	struct reg_field rxtx_rdma_codec_enable;
> +	struct reg_field rxtx_rdma_codec_pack;
> +	struct reg_field rxtx_rdma_codec_intf;
> +	struct reg_field rxtx_rdma_codec_fs_sel;
> +	struct reg_field rxtx_rdma_codec_ch;
> +	struct reg_field rxtx_rdma_codec_fs_delay;
> +
> +	/*CDC RXTX WR_DMA */
> +	struct reg_field rxtx_wrdma_intf;
> +	struct reg_field rxtx_wrdma_bursten;
> +	struct reg_field rxtx_wrdma_wpscnt;
> +	struct reg_field rxtx_wrdma_fifowm;
> +	struct reg_field rxtx_wrdma_enable;
> +	struct reg_field rxtx_wrdma_dyncclk;
> +	struct reg_field rxtx_wrdma_burst8;
> +	struct reg_field rxtx_wrdma_burst16;
> +	struct reg_field rxtx_wrdma_dynburst;
> +	struct reg_field rxtx_wrdma_codec_enable;
> +	struct reg_field rxtx_wrdma_codec_pack;
> +	struct reg_field rxtx_wrdma_codec_intf;
> +	struct reg_field rxtx_wrdma_codec_fs_sel;
> +	struct reg_field rxtx_wrdma_codec_ch;
> +	struct reg_field rxtx_wrdma_codec_fs_delay;
> +
> +	/*CDC VA WR_DMA */
> +	struct reg_field va_wrdma_intf;
> +	struct reg_field va_wrdma_bursten;
> +	struct reg_field va_wrdma_wpscnt;
> +	struct reg_field va_wrdma_fifowm;
> +	struct reg_field va_wrdma_enable;
> +	struct reg_field va_wrdma_dyncclk;
> +	struct reg_field va_wrdma_burst8;
> +	struct reg_field va_wrdma_burst16;
> +	struct reg_field va_wrdma_dynburst;
> +	struct reg_field va_wrdma_codec_enable;
> +	struct reg_field va_wrdma_codec_pack;
> +	struct reg_field va_wrdma_codec_intf;
> +	struct reg_field va_wrdma_codec_fs_sel;
> +	struct reg_field va_wrdma_codec_ch;
> +	struct reg_field va_wrdma_codec_fs_delay;
> +
>   	/**
>   	 * on SOCs like APQ8016 the channel control bits start
>   	 * at different offset to ipq806x
>   	 **/
>   	u32	dmactl_audif_start;
>   	u32	wrdma_channel_start;
> +	u32	rxtx_wrdma_channel_start;
> +	u32	va_wrdma_channel_start;
> +
>   	/* SOC specific initialization like clocks */
>   	int (*init)(struct platform_device *pdev);
>   	int (*exit)(struct platform_device *pdev);
> @@ -250,10 +381,12 @@ struct lpass_variant {
>   	int num_dai;
>   	const char * const *dai_osr_clk_names;
>   	const char * const *dai_bit_clk_names;
> +	const char * const *cdc_dma_clk_names;
>   
>   	/* SOC specific clocks configuration */
>   	const char **clk_name;
>   	int num_clks;
> +	int cdc_dma_num_clks;
>   };
>   
>   struct lpass_pcm_data {
> 
