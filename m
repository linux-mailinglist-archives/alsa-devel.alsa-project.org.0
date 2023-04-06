Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F866D9832
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 15:29:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B69EE75;
	Thu,  6 Apr 2023 15:28:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B69EE75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680787758;
	bh=6lNSkc/GQh/nAxTMHwSx+0T6q1xTVk76OeidZbWEldM=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N6hRyG2Rd9QMqAmCu4dvPZSO1xUMWYa1ucOklAoqXpf43GfATpy0SD+flZCMBjXI3
	 Y+DMg9kJReJANWkLFx8j6jOG6mnRwmNwGyWSzKVTnUrYPMyfOcClRgYAFkh1x79UnQ
	 XnphdTPgWdFrxL9V9wrx3AfJeetRVx1tnto6ys2s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5D98F80171;
	Thu,  6 Apr 2023 15:28:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2761AF80246; Thu,  6 Apr 2023 15:28:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5C62F8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 15:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5C62F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IVpF4YXa
Received: by mail-lf1-x12a.google.com with SMTP id y20so50856548lfj.2
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680787689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rwe8zq3GWp8HxEsG48LdWpIG9hFBxQL8zIHC/jZqMAY=;
        b=IVpF4YXaYz8ce8WuAWOYz6kZx211xb1rjpGaEWC4a2qLrDtKyHXEBXoMr5YJBUvLfp
         L090G4F+BlSI2ZGLn3wTI/hY2g4gzStC6pDdB63txWzw1Mydkt3FbCkjiHSHh9pm9k0v
         ozFYiqnKmaw0Qy1YpaCfJzak7Enj8PggnQTszLUuJvoaMSqUjot4YfjuSpoqnrDtQd31
         uE/mf4SxPY9AX3apKuuEaXymjXjxMqvvZat+MHhApnP/7lKzoQ/fvK6/dzmBxzQQfWfo
         uWBCOzkUKzxImxkEL1LoXbEoVOM++umWc7cZavl6dX8/iSmXed9/GddgXzSdc5vcmpzH
         u1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680787689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rwe8zq3GWp8HxEsG48LdWpIG9hFBxQL8zIHC/jZqMAY=;
        b=YyeZUsuUsk7TcJGP/Bz0VT7nNMDoqQFdCxNKj3Zg4iMW0tiftvMZ365FUx98XyTDOj
         ZU4mNwDHy6vlwwhi25zaZvegAMxIY6qYzN7qrjPSvDgvV90VGkIXYyEy6bk9bQNyao29
         dtqsPF7PiZXcvMWIn3HmvNMHA6JuMLbpcdAzqxNIk38GfnayevNr21mgjWgfAPjHIw9z
         MsZ7+hx6dTWsJLyhEUOW4OxzLFUzlb9d++AvuNJPeXXKPphLHxVsjkcLtdmMAs5s9x37
         OIVoG/dE5RmVo1z4T3sJyLHu85JaiAOVCZE2Li+wBzG4h8XvvATcMCZbl/u94Vr8j/0u
         gdAg==
X-Gm-Message-State: AAQBX9dNLKMuLy7CweaWaRhIQmtwsNN6xoFpipUx4xCyFbAmJ/CYNTAE
	nLUgK2RB2Dz5NmYjz9nWoVbE8Q==
X-Google-Smtp-Source: 
 AKy350Z1yWcAgTwKhZPFNo2cgxIiiStCSVy77wlvwt7GHFbEtJjX6zinDuOgBVr26gQI8UWnkyLnJg==
X-Received: by 2002:ac2:5de5:0:b0:4d8:51e7:9f23 with SMTP id
 z5-20020ac25de5000000b004d851e79f23mr1748872lfq.34.1680787689407;
        Thu, 06 Apr 2023 06:28:09 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id
 a12-20020a056512020c00b004dc4becfcd6sm262598lfo.54.2023.04.06.06.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 06:28:09 -0700 (PDT)
Message-ID: <dc2dae02-cae8-93c1-3abd-4dd37b565863@linaro.org>
Date: Thu, 6 Apr 2023 15:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 6/7] soundwire: qcom: add support for v2.0.0 controller
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rao Mandadapu <quic_srivasam@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-7-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230403132503.62090-7-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: B6E43GJX3VJT27CE7IFMSPDQ7HQHAP5K
X-Message-ID-Hash: B6E43GJX3VJT27CE7IFMSPDQ7HQHAP5K
X-MailFrom: konrad.dybcio@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6E43GJX3VJT27CE7IFMSPDQ7HQHAP5K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3.04.2023 15:25, Krzysztof Kozlowski wrote:
> Add support for Qualcomm Soundwire Controller with a bit different
> register layout.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/soundwire/qcom.c | 65 +++++++++++++++++++++++++++++++++++-----
>  1 file changed, 57 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index b6666ffe37ae..f2e1135ef113 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -31,6 +31,7 @@
>  #define SWRM_VERSION_1_3_0					0x01030000
>  #define SWRM_VERSION_1_5_1					0x01050001
>  #define SWRM_VERSION_1_7_0					0x01070000
> +#define SWRM_VERSION_2_0_0					0x02000000
>  #define SWRM_COMP_HW_VERSION					0x00
>  #define SWRM_COMP_CFG_ADDR					0x04
>  #define SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK			BIT(1)
> @@ -42,6 +43,7 @@
>  #define SWRM_COMP_PARAMS_DIN_PORTS_MASK				GENMASK(9, 5)
>  #define SWRM_COMP_MASTER_ID					0x104
>  #define SWRM_V1_3_INTERRUPT_STATUS				0x200
> +#define SWRM_V2_0_INTERRUPT_STATUS				0x5000
>  #define SWRM_INTERRUPT_STATUS_RMSK				GENMASK(16, 0)
>  #define SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ			BIT(0)
>  #define SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED		BIT(1)
> @@ -54,24 +56,32 @@
>  #define SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION		BIT(8)
>  #define SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH		BIT(9)
>  #define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
> +#define SWRM_INTERRUPT_STATUS_AUTO_ENUM_FAILED			BIT(11)
> +#define SWRM_INTERRUPT_STATUS_AUTO_ENUM_TABLE_IS_FULL		BIT(12)
>  #define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED_V2             BIT(13)
>  #define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED_V2              BIT(14)
>  #define SWRM_INTERRUPT_STATUS_EXT_CLK_STOP_WAKEUP               BIT(16)
>  #define SWRM_INTERRUPT_MAX					17
>  #define SWRM_V1_3_INTERRUPT_MASK_ADDR				0x204
>  #define SWRM_V1_3_INTERRUPT_CLEAR				0x208
> +#define SWRM_V2_0_INTERRUPT_CLEAR				0x5008
>  #define SWRM_V1_3_INTERRUPT_CPU_EN				0x210
> +#define SWRM_V2_0_INTERRUPT_CPU_EN				0x5004
>  #define SWRM_V1_3_CMD_FIFO_WR_CMD				0x300
> +#define SWRM_V2_0_CMD_FIFO_WR_CMD				0x5020
>  #define SWRM_V1_3_CMD_FIFO_RD_CMD				0x304
> +#define SWRM_V2_0_CMD_FIFO_RD_CMD				0x5024
>  #define SWRM_CMD_FIFO_CMD					0x308
>  #define SWRM_CMD_FIFO_FLUSH					0x1
>  #define SWRM_V1_3_CMD_FIFO_STATUS				0x30C
> +#define SWRM_V2_0_CMD_FIFO_STATUS				0x5050
>  #define SWRM_RD_CMD_FIFO_CNT_MASK				GENMASK(20, 16)
>  #define SWRM_WR_CMD_FIFO_CNT_MASK				GENMASK(12, 8)
>  #define SWRM_CMD_FIFO_CFG_ADDR					0x314
>  #define SWRM_CONTINUE_EXEC_ON_CMD_IGNORE			BIT(31)
>  #define SWRM_RD_WR_CMD_RETRIES					0x7
>  #define SWRM_V1_3_CMD_FIFO_RD_FIFO_ADDR				0x318
> +#define SWRM_V2_0_CMD_FIFO_RD_FIFO_ADDR				0x5040
>  #define SWRM_RD_FIFO_CMD_ID_MASK				GENMASK(11, 8)
>  #define SWRM_ENUMERATOR_CFG_ADDR				0x500
>  #define SWRM_ENUMERATOR_SLAVE_DEV_ID_1(m)		(0x530 + 0x8 * (m))
> @@ -98,6 +108,11 @@
>  #define SWRM_DP_SAMPLECTRL2_BANK(n, m)	(0x113C + 0x100 * (n - 1) + 0x40 * m)
>  #define SWRM_DIN_DPn_PCM_PORT_CTRL(n)	(0x1054 + 0x100 * (n - 1))
>  #define SWR_V1_3_MSTR_MAX_REG_ADDR				0x1740
> +#define SWR_V2_0_MSTR_MAX_REG_ADDR				0x50ac
> +
> +#define SWRM_V2_0_CLK_CTRL					0x5060
> +#define SWRM_V2_0_CLK_CTRL_CLK_START				BIT(0)
> +#define SWRM_V2_0_LINK_STATUS					0x5064
>  
>  #define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
>  #define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
> @@ -243,6 +258,26 @@ static const struct qcom_swrm_data swrm_v1_6_data = {
>  	.reg_layout = swrm_v1_3_reg_layout,
>  };
>  
> +static const unsigned int swrm_v2_0_reg_layout[] = {
> +	[SWRM_REG_FRAME_GEN_ENABLED] = SWRM_V2_0_LINK_STATUS,
> +	[SWRM_REG_INTERRUPT_STATUS] = SWRM_V2_0_INTERRUPT_STATUS,
> +	[SWRM_REG_INTERRUPT_MASK_ADDR] = 0, /* Not present */
> +	[SWRM_REG_INTERRUPT_CLEAR] = SWRM_V2_0_INTERRUPT_CLEAR,
> +	[SWRM_REG_INTERRUPT_CPU_EN] = SWRM_V2_0_INTERRUPT_CPU_EN,
> +	[SWRM_REG_CMD_FIFO_WR_CMD] = SWRM_V2_0_CMD_FIFO_WR_CMD,
> +	[SWRM_REG_CMD_FIFO_RD_CMD] = SWRM_V2_0_CMD_FIFO_RD_CMD,
> +	[SWRM_REG_CMD_FIFO_STATUS] = SWRM_V2_0_CMD_FIFO_STATUS,
> +	[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] = SWRM_V2_0_CMD_FIFO_RD_FIFO_ADDR,
> +};
> +
> +static const struct qcom_swrm_data swrm_v2_0_data = {
> +	.default_rows = 50,
> +	.default_cols = 16,
> +	.sw_clk_gate_required = true,
> +	.max_reg = SWR_V2_0_MSTR_MAX_REG_ADDR,
> +	.reg_layout = swrm_v2_0_reg_layout,
> +};
> +
>  #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
>  
>  static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
> @@ -748,18 +783,23 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  
>  	ctrl->intr_mask = SWRM_INTERRUPT_STATUS_RMSK;
>  	/* Mask soundwire interrupts */
> -	ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
> -			SWRM_INTERRUPT_STATUS_RMSK);
> +	if (ctrl->version < SWRM_VERSION_2_0_0)
> +		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
> +				SWRM_INTERRUPT_STATUS_RMSK);
>  
>  	/* Configure No pings */
>  	ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR, &val);
>  	u32p_replace_bits(&val, SWRM_DEF_CMD_NO_PINGS, SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK);
>  	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
>  
> -	if (ctrl->version >= SWRM_VERSION_1_7_0) {
> +	if (ctrl->version == SWRM_VERSION_1_7_0) {
>  		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
>  		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
>  				SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
> +	} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
> +		ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> +		ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
> +				SWRM_V2_0_CLK_CTRL_CLK_START);
>  	} else {
>  		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
>  	}
> @@ -1609,10 +1649,14 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>  	} else {
>  		reset_control_reset(ctrl->audio_cgcr);
>  
> -		if (ctrl->version >= SWRM_VERSION_1_7_0) {
> +		if (ctrl->version == SWRM_VERSION_1_7_0) {
>  			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
>  			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL,
>  					SWRM_MCP_BUS_CLK_START << SWRM_EE_CPU);
> +		} else if (ctrl->version >= SWRM_VERSION_2_0_0) {
> +			ctrl->reg_write(ctrl, SWRM_LINK_MANAGER_EE, SWRM_EE_CPU);
> +			ctrl->reg_write(ctrl, SWRM_V2_0_CLK_CTRL,
> +					SWRM_V2_0_CLK_CTRL_CLK_START);
>  		} else {
>  			ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
>  		}
> @@ -1620,8 +1664,10 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>  			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
>  
>  		ctrl->intr_mask |= SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
> -		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
> -				ctrl->intr_mask);
> +		if (ctrl->version < SWRM_VERSION_2_0_0)
> +			ctrl->reg_write(ctrl,
> +					ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
> +					ctrl->intr_mask);
>  		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
>  				ctrl->intr_mask);
>  
> @@ -1645,8 +1691,10 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
>  	if (!ctrl->clock_stop_not_supported) {
>  		/* Mask bus clash interrupt */
>  		ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
> -		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
> -				ctrl->intr_mask);
> +		if (ctrl->version < SWRM_VERSION_2_0_0)
> +			ctrl->reg_write(ctrl,
> +					ctrl->reg_layout[SWRM_REG_INTERRUPT_MASK_ADDR],
> +					ctrl->intr_mask);
>  		ctrl->reg_write(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_CPU_EN],
>  				ctrl->intr_mask);
>  		/* Prepare slaves for clock stop */
> @@ -1684,6 +1732,7 @@ static const struct of_device_id qcom_swrm_of_match[] = {
>  	{ .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
>  	{ .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_6_data },
>  	{ .compatible = "qcom,soundwire-v1.7.0", .data = &swrm_v1_5_data },
> +	{ .compatible = "qcom,soundwire-v2.0.0", .data = &swrm_v2_0_data },
>  	{/* sentinel */},
>  };
>  
