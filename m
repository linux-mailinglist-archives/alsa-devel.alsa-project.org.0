Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9824B4DA062
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 17:47:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AC8417CF;
	Tue, 15 Mar 2022 17:46:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AC8417CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647362820;
	bh=ZuItdRuId4sDVbAxhooJyGQJlRVcN62vn3VTySCu1Xc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KkNEeVDV1fJ4hHnZJh6rmdKwmbQutKoSZcTd+VQ1ouQLMZpfwU6vVJwp8VUcj5iOu
	 u0O61GiKA2wQRysJgmKdLias1Kt+kTnNGGG+dxExLlbXQVOvcBTSMx1C4+bn117Lrs
	 xSnrhSgmWic+RdXM6hRt+cBHIbd94oaXckLLciDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AF42F80095;
	Tue, 15 Mar 2022 17:45:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2157EF80162; Tue, 15 Mar 2022 17:45:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2976F80128
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 17:45:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2976F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LHFfVwsI"
Received: by mail-oi1-x233.google.com with SMTP id ay7so21416557oib.8
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 09:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KQIAXIBKJGllIMCaZmEb5MSqiteLH/1vDjvjgfPyE7Y=;
 b=LHFfVwsIV/IhMZcSXpR8nohi5II8O0LP3d8CI51s9z5py6K8EPXrDESVtjI6VLYOGV
 xSeORoNrkjO0kQxK8MvRkYjU7836piy5sro5qamS+C987w466xYblwin0kC5yqSYyfXi
 7KIRll6xU8OWxBMACwRPJyVq9I0p3vj49YBSpu1SRij0WfZVHA9ja9qseZj1ucFYNEAa
 QrP6yxV3DYKNNyJeO9TlukKLKHaSEAXkM9/oBXje4Ux6FbPc55Sj2FPeNejGyredtKJp
 ENfrw3lRfX0rYhR1Z5go5UxZepEQnXWB2ispJwXlxSiNJQG4kktNzo53Oby+pnoDhjzo
 w8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KQIAXIBKJGllIMCaZmEb5MSqiteLH/1vDjvjgfPyE7Y=;
 b=p7EY9E9qZCZV3+Pu9tss+QD/rlAHndFmI+XOtxvZKpbQoRcB8WAnNpvSvO0YA4Csqu
 /yUO6ChjyhKLDK4zZj07Qibqmi1Y+CMwP3BF6X39xtOOESYKwaGRWj0fgymgrdIFSjlB
 YUhgLRU0ssz5rT0ryYs4GbGPVl7tosUjOIne3iqUjS8USn2YNB89NqpYvnxznaKhO822
 yqFP5K24H5pDt9QEiijQGQI3eD6MwwXv8ZsS8ZtwmHe2EsKwFlVzWTgdju3P3PLaJ8bO
 6HipyRxdFi9L6TTwgKaTR5pcrACnDEONokbIiYlDcydLaouczgugrWa2V8GGj44rVt+x
 mPIg==
X-Gm-Message-State: AOAM530MRIPfM2p74mhmx8AGgKTW67SZekejVCvlVOHUY2Gv3UqQBxYu
 A1eI8vkmdYa5c0nXz7ne8O+PVw==
X-Google-Smtp-Source: ABdhPJxDFOws/D5M1bRE9WDhFOgitgbkA0Spbv3U2HFKvV5hSLOCh5Hz6nyS1g6lsfCziNM4IY4JTw==
X-Received: by 2002:a05:6808:2382:b0:2da:3ab5:6f3a with SMTP id
 bp2-20020a056808238200b002da3ab56f3amr2111496oib.33.1647362741588; 
 Tue, 15 Mar 2022 09:45:41 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a4aea41000000b002e140d2d96esm9323311ooe.13.2022.03.15.09.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 09:45:41 -0700 (PDT)
Date: Tue, 15 Mar 2022 11:45:39 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v11 4/7] pinctrl: qcom: Update lpi pin group custiom
 functions with framework generic functions
Message-ID: <YjDCs9AEJTJNIawj@builder.lan>
References: <1647359413-31662-1-git-send-email-quic_srivasam@quicinc.com>
 <1647359413-31662-5-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1647359413-31662-5-git-send-email-quic_srivasam@quicinc.com>
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

On Tue 15 Mar 10:50 CDT 2022, Srinivasa Rao Mandadapu wrote:

> Update custom pin group structure members with framework generic group_desc structure
> and replace the driver's custom pinctrl_ops with framework provided generic pin control
> group functions to avoid redundant code written in lpass lpi driver.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  drivers/pinctrl/qcom/Kconfig             |  1 +
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 98 +++++++++++++++-----------------
>  2 files changed, 48 insertions(+), 51 deletions(-)
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
>  	depends on GPIOLIB
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 3c15f80..5e27a38 100644
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
> @@ -250,38 +248,10 @@ static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
>  	return 0;
>  }
>  
> -static int lpi_gpio_get_groups_count(struct pinctrl_dev *pctldev)
> -{
> -	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> -
> -	return pctrl->data->ngroups;
> -}
> -
> -static const char *lpi_gpio_get_group_name(struct pinctrl_dev *pctldev,
> -					   unsigned int group)
> -{
> -	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> -
> -	return pctrl->data->groups[group].name;
> -}
> -
> -static int lpi_gpio_get_group_pins(struct pinctrl_dev *pctldev,
> -				   unsigned int group,
> -				   const unsigned int **pins,
> -				   unsigned int *num_pins)
> -{
> -	struct lpi_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
> -
> -	*pins = pctrl->data->groups[group].pins;
> -	*num_pins = pctrl->data->groups[group].npins;
> -
> -	return 0;
> -}
> -
>  static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
> -	.get_groups_count	= lpi_gpio_get_groups_count,
> -	.get_group_name		= lpi_gpio_get_group_name,
> -	.get_group_pins		= lpi_gpio_get_group_pins,
> +	.get_groups_count	= pinctrl_generic_get_group_count,
> +	.get_group_name		= pinctrl_generic_get_group_name,
> +	.get_group_pins		= pinctrl_generic_get_group_pins,
>  	.dt_node_to_map		= pinconf_generic_dt_node_to_map_group,
>  	.dt_free_map		= pinctrl_utils_free_map,
>  };
> @@ -582,6 +552,28 @@ static const struct gpio_chip lpi_gpio_template = {
>  	.dbg_show		= lpi_gpio_dbg_show,
>  };
>  
> +static int lpi_build_pin_desc_groups(struct lpi_pinctrl *pctrl)
> +{
> +	struct group_desc *lpi_groups;
> +	int i;
> +
> +	lpi_groups = devm_kcalloc(pctrl->dev, pctrl->data->npins,
> +					 sizeof(*lpi_groups), GFP_KERNEL);
> +	if (!lpi_groups)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < pctrl->data->npins; i++) {
> +		const struct pinctrl_pin_desc *pin_info = pctrl->desc.pins + i;
> +		struct group_desc *group = lpi_groups + i;
> +
> +		group->name = pin_info->name;
> +		group->pins = (int *)&pin_info->number;
> +		pinctrl_generic_add_group(pctrl->ctrl, group->name, group->pins, 1, NULL);

I've not used this generic interface before, but I believe you need to
pair your add with pinctrl_generic_remove_group(), both in error paths
and driver remove.

Makes me wonder about the usefulness of this, as you will end up with
a bit more code than you remove and you have the additional heap
allocation. Feels like I'm missing something...

> +	}
> +
> +	return 0;
> +}
> +
>  static int lpi_pinctrl_probe(struct platform_device *pdev)
>  {
>  	const struct lpi_pinctrl_variant_data *data;
> @@ -647,6 +639,10 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
>  		goto err_pinctrl;
>  	}
>  
> +	ret = lpi_build_pin_desc_groups(pctrl);
> +	if (ret)
> +		return ret;

A few lines up the code does error handling by goto err_pinctrl, you
should do the same.

Regards,
Bjorn

> +
>  	ret = devm_gpiochip_add_data(dev, &pctrl->chip, pctrl);
>  	if (ret) {
>  		dev_err(pctrl->dev, "can't add gpio chip\n");
> -- 
> 2.7.4
> 
