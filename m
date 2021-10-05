Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04374422EAA
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 19:01:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8563C166D;
	Tue,  5 Oct 2021 19:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8563C166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633453294;
	bh=hy8TEaUJouFPQFnlw9tTPBfcXMpJwa9rEe4OoSP3LmQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m6tqJlS2S42J9Lt8iaFGFo1xw1d2FHMpMcUS+RJ0UDc+phcX7lpDuszV3IQqxlTr1
	 2lKkO1d7rNLlktwHg6+ymyMK9H5AhlC20PMetV3y669wcw9i+gybIZLvyrJAM9jeJ5
	 DLPNrH3mZwYt/AIAnBw7FQrOlUDQccxWzPmoeVQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2D04F80154;
	Tue,  5 Oct 2021 19:00:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D29BEF8027D; Tue,  5 Oct 2021 19:00:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAF39F80154
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 19:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAF39F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="sLzQMGXP"
Received: by mail-ot1-x32b.google.com with SMTP id
 e66-20020a9d2ac8000000b0054da8bdf2aeso24498578otb.12
 for <alsa-devel@alsa-project.org>; Tue, 05 Oct 2021 10:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eT4QRWTiJcs1knqD0fms3lf+fPlsl7moqQX0wdYcY2M=;
 b=sLzQMGXP4lgmvW6RIos0qJsSgfnvDPNPlxKz2aHtLdzE6GdRTycaBnkCKNjXGOEDRC
 wrzfyJIZNmfz0HPapn33yfabQJTY5IZQNOzdjM3rXsVolGMtMpmAe40khV59mmixH6CM
 whbo3qoGSQxWG/UHNB169e90vg9khpC5JY1Zd12yJCa3tNsluVTzjHVdfKJG9eYENNBv
 U3gqZe+LI9wtybSg/larb2Nq2bMKax1sf1aWgwrR15QKY0l5h5ocm+Bgiskj6+NlZM4+
 nu8WfFDGDV1NaNMsyKV3rlECx6QgSz7avNXjrrpIoLoMdb7LttswJTUeRvkHjnV5qB2e
 Cymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eT4QRWTiJcs1knqD0fms3lf+fPlsl7moqQX0wdYcY2M=;
 b=TJymhup83RQYAxVi6k/58B/F5uuobnOechhLo7U2jIQYKF4B5rNmSdXfRALhhPc8c1
 h2Rgou7ZXmzv6o1WXhR03lfU5hvog6GPss5lbzC2wutRQP9Y7lN0I6iQRU11WgDn6jZB
 XhK7CYj0sKxIEBfzDBe9qjIbyt8KMyQAnPb1AgoqaVgG0PKdCFQsPkS+m0lz3XC4voxD
 9WhsjilptOKBW/m7XjOcSiDfPXhBzXC9pinquYGOWyIoxTf0VHyl5zA0seMkrxzWRbHa
 vM9gxt66Lwj1VGznO3RQ1YrD9WP9J2ben8b5bEaQiwUQ4bM6oPtqm5U3FXs9jl1CseEe
 HuBQ==
X-Gm-Message-State: AOAM530yVdM4TgFbjFbzbudz8b4osr+nSioMNN5DEB6UZPyfZ7MVoLh7
 k0sS8Nbw5zV4vDn6CVzTg5go8w==
X-Google-Smtp-Source: ABdhPJxY2jmsRmi0yUIG27/p4uC6tH4JPn1TN2xDpW8nkkRfeciD9lUi6d1YiRKW4hjAqu6mxi4HeQ==
X-Received: by 2002:a05:6830:2906:: with SMTP id
 z6mr15861929otu.257.1633453205311; 
 Tue, 05 Oct 2021 10:00:05 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id u2sm3664543otg.51.2021.10.05.10.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 10:00:04 -0700 (PDT)
Date: Tue, 5 Oct 2021 10:01:47 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH] ASoC: qcom: soundwire: Enable soundwire bus clock for
 version 1.6
Message-ID: <YVyE+ytKVmOh85c3@ripper>
References: <1633105471-30928-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633105471-30928-1-git-send-email-srivasam@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <potturu@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 rohitkr@codeaurora.org, swboyd@chromium.org, judyhsiao@chromium.org,
 linux-kernel@vger.kernel.org
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

On Fri 01 Oct 09:24 PDT 2021, Srinivasa Rao Mandadapu wrote:

> Add support for soundwire 1.6 version to gate RX/TX bus clock.
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  drivers/soundwire/qcom.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 0ef79d6..599b3ed 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -127,6 +127,7 @@ struct qcom_swrm_ctrl {
>  	struct device *dev;
>  	struct regmap *regmap;
>  	void __iomem *mmio;
> +	char __iomem *swrm_hctl_reg;
>  	struct completion broadcast;
>  	struct completion enumeration;
>  	struct work_struct slave_work;
> @@ -610,6 +611,12 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
>  	val = FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK, ctrl->rows_index);
>  	val |= FIELD_PREP(SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK, ctrl->cols_index);
>  
> +	if (ctrl->swrm_hctl_reg) {
> +		val = ioread32(ctrl->swrm_hctl_reg);
> +		val &= 0xFFFFFFFD;

That's a tricky way of saying:

	val &= ~BIT(1);

That said, naming bit 1 is still a very good thing.

> +		iowrite32(val, ctrl->swrm_hctl_reg);
> +	}
> +
>  	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
>  
>  	/* Enable Auto enumeration */
> @@ -1200,7 +1207,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	struct qcom_swrm_ctrl *ctrl;
>  	const struct qcom_swrm_data *data;
>  	int ret;
> -	u32 val;
> +	int val, swrm_hctl_reg = 0;
>  
>  	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
>  	if (!ctrl)
> @@ -1251,6 +1258,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	ctrl->bus.port_ops = &qcom_swrm_port_ops;
>  	ctrl->bus.compute_params = &qcom_swrm_compute_params;
>  
> +	if (!of_property_read_u32(dev->of_node, "qcom,swrm-hctl-reg", &swrm_hctl_reg))
> +		ctrl->swrm_hctl_reg = devm_ioremap(&pdev->dev, swrm_hctl_reg, 0x4);

Nack.

You may not pull an address to a single register out of an undocumented
DT property and blindly ioremap that.

And you surely should check for errors here, to avoid magical errors
caused by this ioremap failing and your bit not being cleared.

Thanks,
Bjorn

> +
>  	ret = qcom_swrm_get_port_config(ctrl);
>  	if (ret)
>  		goto err_clk;
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
> is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
