Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 706C94D1FD6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 19:13:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 082C716EF;
	Tue,  8 Mar 2022 19:12:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 082C716EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646763189;
	bh=6hlJy78PlcVbxE6b9SzBauQcwNLdYuMxg3dsfe7vPCQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kHsJX1ooO9O81hNbUA/U2zGlJIWgQ3EU2zv7IfvOKhRWQEa/p4lHMhZ4dRC/Er8vB
	 y/APYZ/19a1WJD5MDiZZAWgH/GRX0auybq9BC9zpMiEwjzYKRJvgNDQ9saiBvajkXL
	 aigwsnKBx/cL3YVNeKmFjweYV9BUAdxJ1VQqnTlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72C87F8026D;
	Tue,  8 Mar 2022 19:12:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D25D5F80121; Tue,  8 Mar 2022 19:12:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE170F80121
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 19:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE170F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Rt7ZP4DL"
Received: by mail-ot1-x32a.google.com with SMTP id
 s35-20020a0568302aa300b005b2463a41faso3581908otu.10
 for <alsa-devel@alsa-project.org>; Tue, 08 Mar 2022 10:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eCjdrkWFXlI2z3fvVt8j+mPo6k+YDOLeGzfqyXA7qwI=;
 b=Rt7ZP4DLJ8Wvx6/WSEzVQ+9M9PDDM1AMWmX47E+JoHJJLzlhu1GZ6UBtDpeWJlmCis
 JElGAotsUYcn60aAgpObiD+qgQ7vWebEub1OIMH1Yt+WOhiFkZlu6nKcvXcA5xMQUexW
 bQ75EJDkJdHW7EPeiKBCVxbEfvsLdMupm+RRCyoPAWndKIGFS20MAr5SaTQweE8fL7cK
 rdpxJUO1sxQN4H0yp6pCT4pg+GMD92K7cunI9n1yfLMXAy+OwhlEJZrrPjc646j6VCHp
 qPXIQ5zK4FLN3mOYJrBjLT4NVSHKN/ng/zOCIyHqQl0iQC0tDnQe6cAweP7FFc3p/ksz
 Ioww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eCjdrkWFXlI2z3fvVt8j+mPo6k+YDOLeGzfqyXA7qwI=;
 b=ZoAd3CXfAtd0Ai7TQvm022kgNmnI0Vk/cB/425C/nosHdqOSOGR6ApDZk0eb8LR0/2
 Elm/m6hBXNboUUguig+zM8KWpAQBHo2aBXRdQh/Qga08VwVSwwWaGYJ+/l89gI87dv8q
 /psB67HB6tm3imidxP4z7jkTXR9A+bDskDPWDhvBSbmZLBMnllUNyclw++fwRAeDkT8v
 gC+vGdXTCzDlsKgv4jerBKqj6A4kRr8uBVjC++C0zRUXk42p+eaGMGX9G6EJPMg//N3V
 GjtFSmR0T5QVp0UbQu0YSDDEwUTeLjJPssb+QnVbKgu7MLNm220ikgUmeI85P57psbch
 FoFA==
X-Gm-Message-State: AOAM531FMvQno/PWvsbcjdCUtRGr5CBCKA64f2beluGkKkijiaSMrhqT
 UwH7tBXLT3pXiH93XL1/YhT43Q==
X-Google-Smtp-Source: ABdhPJxvEGLL54Z+BCjwAaRSpUbf47FFGDFMMrjqGpR5+XILsKSYph+QmQPxjTwKOFmXTYhdaeb/wQ==
X-Received: by 2002:a9d:4e99:0:b0:5b2:54f4:75e7 with SMTP id
 v25-20020a9d4e99000000b005b254f475e7mr1433951otk.94.1646763112445; 
 Tue, 08 Mar 2022 10:11:52 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05687036c700b000da4bcdae42sm3072206oak.13.2022.03.08.10.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 10:11:52 -0800 (PST)
Date: Tue, 8 Mar 2022 10:13:35 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v10 7/7] pinctrl: qcom: Update clock voting as optional
Message-ID: <Yieczzo96xSaA7jp@ripper>
References: <1646737394-4740-1-git-send-email-quic_srivasam@quicinc.com>
 <1646737394-4740-8-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646737394-4740-8-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 linux-gpio@vger.kernel.org, rohitkr@codeaurora.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, quic_plai@quicinc.com, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
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

On Tue 08 Mar 03:03 PST 2022, Srinivasa Rao Mandadapu wrote:

> Update bulk clock voting to optional voting as ADSP bypass platform doesn't
> need macro and decodec clocks,

Even I am not sure what "ADSP bypass platform" means, so please express
this better.

Are they optional because sc7280 typically come with ADSP based audio,
but it might not and if not then we shouldn't control those clocks?

> these are maintained as power domains and
> operated from lpass audio core cc.
> 

So there are clocks, but they are exposed as power-domains? Or are you
just trying to say that the LPASS LPI pinctrl block is always in a
power-domain controlled by the audio clock-controller?

Regards,
Bjorn

> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c        | 12 +++++++++---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.h        |  1 +
>  drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c |  1 +
>  3 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 1ab572f..c618b74 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -407,9 +407,15 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>  				     "Slew resource not provided\n");
>  
> -	ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "Can't get clocks\n");
> +	if (data->is_clk_optional) {
> +		ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Can't get clocks\n");
> +	} else {
> +		ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Can't get clocks\n");
> +	}
>  
>  	ret = clk_bulk_prepare_enable(MAX_LPI_NUM_CLKS, pctrl->clks);
>  	if (ret)
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
> index afbac2a..3bcede6 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.h
> @@ -77,6 +77,7 @@ struct lpi_pinctrl_variant_data {
>  	int ngroups;
>  	const struct lpi_function *functions;
>  	int nfunctions;
> +	int is_clk_optional;
>  };
>  
>  int lpi_pinctrl_probe(struct platform_device *pdev);
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> index d67ff25..304d8a2 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c
> @@ -142,6 +142,7 @@ static const struct lpi_pinctrl_variant_data sc7280_lpi_data = {
>  	.ngroups = ARRAY_SIZE(sc7280_groups),
>  	.functions = sc7280_functions,
>  	.nfunctions = ARRAY_SIZE(sc7280_functions),
> +	.is_clk_optional = 1,
>  };
>  
>  static const struct of_device_id lpi_pinctrl_of_match[] = {
> -- 
> 2.7.4
> 
