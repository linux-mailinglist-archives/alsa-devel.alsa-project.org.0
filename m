Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CAC4D1F5D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:45:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BB0718D4;
	Tue,  8 Mar 2022 18:44:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BB0718D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646761545;
	bh=ZQbJk+/HybidIIGcNgZtUu4hCJhZl/gp7AZauV6Pd7E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ViGF+1pEho6FKzTauhcMAx35ah6DkOSKnRhNhRe1KoKrMF/8gWG4AzmsYOG433Uoj
	 zntu7tQoTHbCgEvqLMcdA9a+QBBwmksbUNnRAGUW5TIbot2b/gbrXN0I67mwlADovB
	 Cmkt293rCGs/tv8vc7tuCIQMK364sdQrYtGdyv18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DADC9F8026D;
	Tue,  8 Mar 2022 18:44:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94ABEF80121; Tue,  8 Mar 2022 18:44:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93E9CF80121
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:44:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93E9CF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aDCxkrA6"
Received: by mail-oi1-x234.google.com with SMTP id x193so60352oix.0
 for <alsa-devel@alsa-project.org>; Tue, 08 Mar 2022 09:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LWBHo8zyRbtdgwtvZ69Wg4Ge808fFLN2tC6X5Zn9ZkA=;
 b=aDCxkrA6yFPydxBcxmDwIW0PjIDqrTBzHkAdiRd9zZtESMHM6/XNtBZ2HVZV1HjtZr
 iu/5YMOzeJBcov436XH1FbQ6ShbJGMgIeiTEI8Hg6WPEAII6pCfcLL695yjiR2WoZSBe
 PmK5cwoG3mPRN/vBYNW7DTw8YI/Xc0AGHfHA7wpaqcVQzeUNMxbkYViIjoyH8cliUXz0
 IpIpyGWV6eN0YYbxtq2bmhmlbfsgterUKbHbYPPWCK9Ryl8+5/2Ss9JTibdIxOcT1hQy
 jXZ3Om/LFm+g95bwfVQ8DhdPDr/3VwR/NY35q/FymjdgvjUtSWp11xARAQHlwrjP113c
 OcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LWBHo8zyRbtdgwtvZ69Wg4Ge808fFLN2tC6X5Zn9ZkA=;
 b=jCEGjzGjyqZHm9H5DnAOq+7lO2Mecl4dW96/9QpRSvf9cMAcjWYYLlHxmJf09+ZxGJ
 YM2B7846D7mufdpH/mSpPEr1n9fTxD77dl82sBub+POrA2fEkVOeaf1n40qM71q2mdW8
 G8M2PeYKCGEWieZWYKzA4UVz9QUu30WjffzwiQu87gJnK6/Q7pNS0WaujceSjydEutd6
 aPBHfbVOMlSB3t2449n+YCOCA/zBQ9YRQHi9seFaFFob18shLq2vmfMzTWE/ilI0+AHS
 mBvW19kZz8tyf7dtiRfXEsEo6tYV+ZRbJdJpES7jwZ6YNz+JJk4vAP7FI2+FPavZmttU
 +v4g==
X-Gm-Message-State: AOAM533Jv5bOKGVPT7hH2p7rAYwjdtbRViQE+n9PA1bAfsYfho7qhWRp
 ApK7sLEDxxppAfCV73gsL6wJlA==
X-Google-Smtp-Source: ABdhPJwAg6e9dMfVsqqM7of4Q4JH4WF/O8PgvyZH6AwlM7Xy7iK9Wv14Io5Dt/gTtcDvPi7FPeA2Hg==
X-Received: by 2002:a05:6808:10c8:b0:2d4:a070:d20b with SMTP id
 s8-20020a05680810c800b002d4a070d20bmr3370323ois.88.1646761467535; 
 Tue, 08 Mar 2022 09:44:27 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a9d5cc4000000b005af6f4ff5e2sm7982132oti.61.2022.03.08.09.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 09:44:27 -0800 (PST)
Date: Tue, 8 Mar 2022 09:46:10 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v10 3/7] pinctrl: qcom: Update macro name to LPI specific
Message-ID: <YieWYtK5gCCIaPA+@ripper>
References: <1646737394-4740-1-git-send-email-quic_srivasam@quicinc.com>
 <1646737394-4740-4-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646737394-4740-4-git-send-email-quic_srivasam@quicinc.com>
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

> Update NO_SLEW macro to LPI_NO_SLEW macro as this driver lpi specific.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 2f19ab4..3c15f80 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -40,7 +40,7 @@
>  #define LPI_GPIO_KEEPER			0x2
>  #define LPI_GPIO_PULL_UP		0x3
>  #define LPI_GPIO_DS_TO_VAL(v)		(v / 2 - 1)
> -#define NO_SLEW				-1
> +#define LPI_NO_SLEW				-1
>  
>  #define LPI_FUNCTION(fname)			                \
>  	[LPI_MUX_##fname] = {		                \
> @@ -193,14 +193,14 @@ static const struct lpi_pingroup sm8250_groups[] = {
>  	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
>  	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
>  	LPI_PINGROUP(5, 12, swr_tx_data, swr_rx_data, _, _),
> -	LPI_PINGROUP(6, NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
> -	LPI_PINGROUP(7, NO_SLEW, dmic1_data, i2s1_ws, _, _),
> -	LPI_PINGROUP(8, NO_SLEW, dmic2_clk, i2s1_data, _, _),
> -	LPI_PINGROUP(9, NO_SLEW, dmic2_data, i2s1_data, _, _),
> +	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
> +	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
> +	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
> +	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, _, _),
>  	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
>  	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
> -	LPI_PINGROUP(12, NO_SLEW, dmic3_clk, i2s2_data, _, _),
> -	LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
> +	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
> +	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, _, _),
>  };
>  
>  static const struct lpi_function sm8250_functions[] = {
> @@ -435,7 +435,7 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
>  			}
>  
>  			slew_offset = g->slew_offset;
> -			if (slew_offset == NO_SLEW)
> +			if (slew_offset == LPI_NO_SLEW)
>  				break;
>  
>  			mutex_lock(&pctrl->slew_access_lock);
> -- 
> 2.7.4
> 
