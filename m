Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5224D1F85
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:55:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 826DE15C1;
	Tue,  8 Mar 2022 18:54:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 826DE15C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646762133;
	bh=Y400gESJwkWxySv58CBqaReoIFnr6ClmE7nD17qsRnU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a3dSSj6FocYrzJXc+bZ0Bh4ddx8mJqeQTn8porV8Lw8Ezw5xqr7TdSjmVDkCXrVJO
	 m+t4noQiPwo1hkZ0jqxKmzSchP38wCIfv5+FKQ6VpxL05Gi9yyWBXOTzrPbCzEADMD
	 m8jY8HdA96rdYUmxB8teVKY/d2FhhNtuKT7J1Css=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6FCEF800D2;
	Tue,  8 Mar 2022 18:54:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05452F8025E; Tue,  8 Mar 2022 18:54:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C367F80121
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C367F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QjAWR5Nc"
Received: by mail-oi1-x235.google.com with SMTP id ay7so12436oib.8
 for <alsa-devel@alsa-project.org>; Tue, 08 Mar 2022 09:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YtQCeUbZZCmiCIVx7ADMFl1mAFUDmXnXrihrMX74Cb8=;
 b=QjAWR5Nc3uDAU4XDNh38DeHwvIOy8k5LbdNTqWNLjVxNDo7LmXCn7j19M6PWld5R4C
 DgovSdjfczZ9htzBvFwOg3DL9En7wQhkwBiDc8Chnk1r/V1auAWy2kFLcqzLc1f7hSqX
 IsZ/epBtWAYn0GYnSqB67+9Tqk7NpWuw9FnMd0nYMnD/S49s1mTUs8b0orG9Y4Mgt1Qz
 Pf2mdMRp07yVX5/Yx6i1GzH7gniaPu+YG7YM3CSOE9dZIJU7HO1N8859VklyyFfaI8FV
 esoIfOwHrHYR40t8QsIRFj2+v9OQbx9fIeeEfMu1CaYkaRWaXU91MiWNSWR9bKhQHPG8
 kYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YtQCeUbZZCmiCIVx7ADMFl1mAFUDmXnXrihrMX74Cb8=;
 b=t5o7mN7P5gdUc2dB4iBeMxrfpAdI6AMmaLJO30iIhVPr7ZWE3ktIPcEcLGBXIoNO1L
 0Z/q8hE260OjfTu40iPiPPuP+357fgXbphk6ewTrxtyypQNsa2h2gy1h3ZGruw+LahFg
 T4UOLff68JqVpQxVDrS7YCKikSJ8ChN8Ihf7NvSdG+THPXD5m3eInRNX5i1huKy+PmBW
 1nSqUIL/G3/ITQ1SpwxoN4KzZDJoEUE0W7pxqP3+iq9kdSVVJBmvRUiJSTjRwVGbnEn+
 B2bJkYr0jrNh0lwxqqrQYjqxDeMd7KMHmCvY6rCAs9kvdroZckWfu/TisrulrenT87Sw
 zqhQ==
X-Gm-Message-State: AOAM5331rjTeHSKguZZQl8QXyuEZFSTfXrZCB/PvRlZZiBXolDTJ9XC5
 Gng+Uf30p79+70EJR0E8slb/Xw==
X-Google-Smtp-Source: ABdhPJw6GhMDIn1CtF9hpsr0Biejf1mzf7u53dmYmPy3Nc049ZYzkfnAgGTVBPNYVLIScNy6reWp5A==
X-Received: by 2002:a05:6808:3021:b0:2d4:40f3:6b30 with SMTP id
 ay33-20020a056808302100b002d440f36b30mr3398845oib.31.1646762057248; 
 Tue, 08 Mar 2022 09:54:17 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 ay39-20020a056820152700b003209eddff85sm5414282oob.45.2022.03.08.09.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 09:54:16 -0800 (PST)
Date: Tue, 8 Mar 2022 09:55:59 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v10 4/7] pinctrl: qcom: Update lpi pin group structure
Message-ID: <YieYr00MRUfeSE1B@ripper>
References: <1646737394-4740-1-git-send-email-quic_srivasam@quicinc.com>
 <1646737394-4740-5-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646737394-4740-5-git-send-email-quic_srivasam@quicinc.com>
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

> Update lpi group structure with core group_desc structure
> to avoid redundant struct params.
> 

This fails to express why you're doing that, please see below.

> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  drivers/pinctrl/qcom/Kconfig             |  1 +
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 44 +++++++++++++++-----------------
>  2 files changed, 22 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index ca6f68a..31c4aa6 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -351,6 +351,7 @@ config PINCTRL_LPASS_LPI
>  	select PINMUX
>  	select PINCONF
>  	select GENERIC_PINCONF
> +	select GENERIC_PINCTRL_GROUPS

This allow you to use struct group_desc, but what does that give you?

I don't see a change where you're moving to use the common group_desc
helpers that the framework supplies. Without that this just replace 3
entries in struct lpi_pingroup with 4 entries in struct group_desc.


Change looks good, iff it's followed by a transition to replace the
driver's custom functions with pinctrl_generic_get_group_*().

Regards,
Bjorn

>  	depends on GPIOLIB
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 3c15f80..54750ba 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -51,11 +51,11 @@
>  
>  #define LPI_PINGROUP(id, soff, f1, f2, f3, f4)		\
>  	{						\
> -		.name = "gpio" #id,			\
> -		.pins = gpio##id##_pins,		\
> +		.group.name = "gpio" #id,			\
> +		.group.pins = gpio##id##_pins,		\
>  		.pin = id,				\
>  		.slew_offset = soff,			\
> -		.npins = ARRAY_SIZE(gpio##id##_pins),	\
> +		.group.num_pins = ARRAY_SIZE(gpio##id##_pins),	\
>  		.funcs = (int[]){			\
>  			LPI_MUX_gpio,			\
>  			LPI_MUX_##f1,			\
> @@ -67,9 +67,7 @@
>  	}
>  
>  struct lpi_pingroup {
> -	const char *name;
> -	const unsigned int *pins;
> -	unsigned int npins;
> +	struct group_desc group;
>  	unsigned int pin;
>  	/* Bit offset in slew register for SoundWire pins only */
>  	int slew_offset;
> @@ -150,20 +148,20 @@ enum sm8250_lpi_functions {
>  	LPI_MUX__,
>  };
>  
> -static const unsigned int gpio0_pins[] = { 0 };
> -static const unsigned int gpio1_pins[] = { 1 };
> -static const unsigned int gpio2_pins[] = { 2 };
> -static const unsigned int gpio3_pins[] = { 3 };
> -static const unsigned int gpio4_pins[] = { 4 };
> -static const unsigned int gpio5_pins[] = { 5 };
> -static const unsigned int gpio6_pins[] = { 6 };
> -static const unsigned int gpio7_pins[] = { 7 };
> -static const unsigned int gpio8_pins[] = { 8 };
> -static const unsigned int gpio9_pins[] = { 9 };
> -static const unsigned int gpio10_pins[] = { 10 };
> -static const unsigned int gpio11_pins[] = { 11 };
> -static const unsigned int gpio12_pins[] = { 12 };
> -static const unsigned int gpio13_pins[] = { 13 };
> +static int gpio0_pins[] = { 0 };
> +static int gpio1_pins[] = { 1 };
> +static int gpio2_pins[] = { 2 };
> +static int gpio3_pins[] = { 3 };
> +static int gpio4_pins[] = { 4 };
> +static int gpio5_pins[] = { 5 };
> +static int gpio6_pins[] = { 6 };
> +static int gpio7_pins[] = { 7 };
> +static int gpio8_pins[] = { 8 };
> +static int gpio9_pins[] = { 9 };
> +static int gpio10_pins[] = { 10 };
> +static int gpio11_pins[] = { 11 };
> +static int gpio12_pins[] = { 12 };
> +static int gpio13_pins[] = { 13 };
>  static const char * const swr_tx_clk_groups[] = { "gpio0" };
>  static const char * const swr_tx_data_groups[] = { "gpio1", "gpio2", "gpio5" };
>  static const char * const swr_rx_clk_groups[] = { "gpio3" };
> @@ -262,7 +260,7 @@ static const char *lpi_gpio_get_group_name(struct pinctrl_dev *pctldev,
>  {
>  	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>  
> -	return pctrl->data->groups[group].name;
> +	return pctrl->data->groups[group].group.name;
>  }
>  
>  static int lpi_gpio_get_group_pins(struct pinctrl_dev *pctldev,
> @@ -272,8 +270,8 @@ static int lpi_gpio_get_group_pins(struct pinctrl_dev *pctldev,
>  {
>  	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
>  
> -	*pins = pctrl->data->groups[group].pins;
> -	*num_pins = pctrl->data->groups[group].npins;
> +	*pins = pctrl->data->groups[group].group.pins;
> +	*num_pins = pctrl->data->groups[group].group.num_pins;
>  
>  	return 0;
>  }
> -- 
> 2.7.4
> 
