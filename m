Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B4B542EB4
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 13:05:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CD4C17AD;
	Wed,  8 Jun 2022 13:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CD4C17AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654686329;
	bh=zi5uuFC3Jtd4crHe2+CxmrWZ3xV16hkK8cUfOSxJybM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H+eKfnmq9ucSj04xm9gRf8Rudigg7BW+nKsmQekSE2Rl3Jd67UktS3q+SJt9lE1yk
	 rZzaqUFixrknEgaYSYaCcF5oIoKks4LRKsWKCdFT3SBpj99mYo8RHLkBK51i7AKMvL
	 uym40N5jdvUaG2ct3IJcOYKuOj8NneUopaAwp80g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94560F800C7;
	Wed,  8 Jun 2022 13:04:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05F8CF8024C; Wed,  8 Jun 2022 13:04:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEB74F80116
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 13:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEB74F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="da7gIO01"
Received: by mail-wm1-x330.google.com with SMTP id z17so5870677wmi.1
 for <alsa-devel@alsa-project.org>; Wed, 08 Jun 2022 04:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=IU+Wnu+858a67r67UjRky1bkHMcNVgM3o6W1D+ENT84=;
 b=da7gIO01521hVerrm97QisYV7ITwbgby2F648j1xu6Gm+pRSfk8pJ+ZqFHzSyTDyTC
 DwOC7Dvbd42xGrXI7EgGTScP99k+jHUs38Sdc9Fv531QnxbaqSkd3tv9p1LmdTYWSQJQ
 Xw9JwQUS+lszMLVu+C7qDpzd97jJSHW2vjv72kBNuazWcEu5csZMk6nI1INFXyUZuymB
 jG/+UkzgME3b+F0Gq0WBUWl8KHTxpjh9gqx9YZVZHGdihCJkC2hqyrho9L2lT8skUhrm
 Vg6yaC+xPhE5YB0t6zQp6ltslaj0Uey2d2xTKcVEpUXrDRuVTqX6gsNra503jelXVXrO
 onmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IU+Wnu+858a67r67UjRky1bkHMcNVgM3o6W1D+ENT84=;
 b=RMP1qHtOrnsrQoRLA11lXJMEqxPjM3/yH5t0+uwWpLK9tmV5CsZt8mJod+4DO08KEZ
 J29aRWYJ7wpiEnHlhv2NB0G+OtwQh7B5sWFXn8p3QTH7x8SiZ+ubYmhsIBJlnX2O2fGx
 xHgB6+WM2WggRLFwSaR3NtafP8peUlogThtoEyhwFUotwVRtnqwnVYQWmfb2PFIVUbaQ
 zSSq0WZLVx4IuGcMhm56sQenjQ++LXzCsblit+YmGIivvg6B5A5hoQW5HtutDdisnnFQ
 9RcEJJscN7Df6zw/tvdxw1JNEhKsIs9cxuL3sQLT35blovs5NIhddl2cw+TfzEw9g5XF
 MVKw==
X-Gm-Message-State: AOAM533IGdCvPiEdwZ39R2wLrDaLOquif9Vmxx2HBRltZ+DdCgyxdUVx
 +HiIMo0ACzAl95Eo+OxNBFeA+A==
X-Google-Smtp-Source: ABdhPJz1MjWO0EbYP4tnqOtIlELTAxzX8+SuS5EDFPjou2XcZR1ZoG28fw94OHfgk5oA6727UgVe7w==
X-Received: by 2002:a05:600c:4e50:b0:39c:eeb:dabe with SMTP id
 e16-20020a05600c4e5000b0039c0eebdabemr50348552wmq.190.1654686257815; 
 Wed, 08 Jun 2022 04:04:17 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 u15-20020a05600c19cf00b003973b9d0447sm25238793wmq.36.2022.06.08.04.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 04:04:17 -0700 (PDT)
Message-ID: <7b855cc5-5f6c-6668-5ec6-1b5f011a0916@linaro.org>
Date: Wed, 8 Jun 2022 12:04:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/2] ASoC: qcom: soundwire: Add software clock gating
 requirement check
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
 perex@perex.cz, tiwai@suse.com, quic_rohkumar@quicinc.com,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org, vkoul@kernel.org
References: <1654667824-3760-1-git-send-email-quic_srivasam@quicinc.com>
 <1654667824-3760-3-git-send-email-quic_srivasam@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <1654667824-3760-3-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 08/06/2022 06:57, Srinivasa Rao Mandadapu wrote:
> Validate software clock gating required or not and do software
> clock gating on hclk if soundwire is operational and keep it
> running by adding flag in private dat structure.
> This is to avoid conflict between older architectures,
> where software clock gating is not required and on latest
> architectues, where software clock gating is mandatory.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>   drivers/soundwire/qcom.c | 27 ++++++++++++++++++++-------
>   1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 38c3bf5..930aa93 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -194,6 +194,12 @@ static const struct qcom_swrm_data swrm_v1_5_data = {
>   	.default_cols = 16,
>   };
>   
> +static const struct qcom_swrm_data swrm_v1_6_data = {
> +	.default_rows = 50,
> +	.default_cols = 16,
> +	.sw_clk_gate_required = 1,

.sw_clk_gate_required = true,

instead of 1 and 0

Once fixed,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini



> +};
> +
>   #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
>   
>   static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
> @@ -659,7 +665,8 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>   	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
>   	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
>   
> -	reset_control_reset(ctrl->audio_cgcr);
> +	if (ctrl->audio_cgcr)
> +		reset_control_reset(ctrl->audio_cgcr);
>   
>   	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>   
> @@ -1312,6 +1319,15 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   			return PTR_ERR(ctrl->mmio);
>   	}
>   
> +	if (data->sw_clk_gate_required) {
> +		ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
> +		if (IS_ERR(ctrl->audio_cgcr)) {
> +			dev_err(dev, "Failed to get cgcr reset ctrl required for SW gating\n");
> +			ret = PTR_ERR(ctrl->audio_cgcr);
> +			goto err_init;
> +		}
> +	}
> +
>   	ctrl->irq = of_irq_get(dev->of_node, 0);
>   	if (ctrl->irq < 0) {
>   		ret = ctrl->irq;
> @@ -1337,10 +1353,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	ctrl->bus.compute_params = &qcom_swrm_compute_params;
>   	ctrl->bus.clk_stop_timeout = 300;
>   
> -	ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
> -	if (IS_ERR(ctrl->audio_cgcr))
> -		dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");
> -
>   	ret = qcom_swrm_get_port_config(ctrl);
>   	if (ret)
>   		goto err_clk;
> @@ -1494,7 +1506,8 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>   		qcom_swrm_get_device_status(ctrl);
>   		sdw_handle_slave_status(&ctrl->bus, ctrl->status);
>   	} else {
> -		reset_control_reset(ctrl->audio_cgcr);
> +		if (ctrl->audio_cgcr)
> +			reset_control_reset(ctrl->audio_cgcr);
>   
>   		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
>   		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR,
> @@ -1559,7 +1572,7 @@ static const struct dev_pm_ops swrm_dev_pm_ops = {
>   static const struct of_device_id qcom_swrm_of_match[] = {
>   	{ .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
>   	{ .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
> -	{ .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_5_data },
> +	{ .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_6_data },
>   	{/* sentinel */},
>   };
>   
