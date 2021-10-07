Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B944C425A25
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 19:58:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51334165E;
	Thu,  7 Oct 2021 19:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51334165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633629531;
	bh=rq0HaF9YsHWiqAPMEPl6ABfwa71LLgo4rS1WaOiKk7g=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ud3gYduzkOnG8qomT6zyflC5oOKYqR3BU+YqvQUmUxyDhmYmpMPZyypky4370NWSp
	 r3N0y4UCwclhvKAzl3j2dGfBq129qf02FANf84MF7AuWb4XjvwFwXXmTPujheaLfFW
	 kEudg5LXd/NRfcW5Xd2DSicDXv/pmA7Ed0A2zWgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD6CAF8028B;
	Thu,  7 Oct 2021 19:57:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24F01F8027D; Thu,  7 Oct 2021 19:57:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64B38F800F0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 19:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64B38F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="b+B3rRcr"
Received: by mail-ot1-x32f.google.com with SMTP id
 c26-20020a056830349a00b0054d96d25c1eso8449569otu.9
 for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021 10:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=tNffkl0Q4XYFcl/VueyyIpHh5QtOfORzbwnyFe2lGUk=;
 b=b+B3rRcrnNNlpsNamNM5v+Dg5DxzaCynl+SWNFYgRP4C1AnU07jrfTNLTW3dVfQRNr
 m16M6gVxXz3tLCf9fGZXHnleEiyRdUWguUWmryHmIQ82olFUq30yn7iNGN3fm3PbT7gq
 iuVijXL/lXLB2gsZHyuvZ/TeV4YTcLK+kzvu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=tNffkl0Q4XYFcl/VueyyIpHh5QtOfORzbwnyFe2lGUk=;
 b=PZsrMTPRs4ExJ7/BKb8E1zc7rRJfBu0L1FtCLSrzVA8oqQwi11pdiupHJzUhBGYvcY
 T5IDuVsXJTEDAyzFh8n0Puhb+KhibxxLvD4J+nS8Sn0dLfMlwp2917Kwn2Sq7XdJ6Fcm
 9ycqOieL89/TWdpQ7TuDh2r1SNPGaz5M4kHINEroFuMWfkHu/FlPRwCYH9eF6g4uliVY
 W+BuJ+exIOZR7fs9ZLpuJCjQZoX4mcW6WXEvAhwy1IOODXMAl8+CQL+1Eux+4eFtYl6s
 ts4Z9VUcCralGqsElPIkWwRtjPpczDkJaFaUjhZ0/SEcXmAnEJkY4KaMc6tzkxM8Fxuj
 hUnQ==
X-Gm-Message-State: AOAM5301EUN771yjJa9PpM4GyapkgKb9FCayDv9kE6eCCkgqLkMjSwT8
 P4+fzyydCMUD4zo8E96wb/tj8ip8S4nyOrFHGUxRHQ==
X-Google-Smtp-Source: ABdhPJwAvWX1ls2QReA8P64elG2Woqp0Lk3ZSmYVtjCSdDEAjMULvzOhTxb4cSKxDFAzNCrZ2d6cimg76yLQk+aAvUE=
X-Received: by 2002:a9d:12f4:: with SMTP id g107mr908111otg.77.1633629447464; 
 Thu, 07 Oct 2021 10:57:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 13:57:27 -0400
MIME-Version: 1.0
In-Reply-To: <1633614519-26680-2-git-send-email-srivasam@codeaurora.org>
References: <1633614519-26680-1-git-send-email-srivasam@codeaurora.org>
 <1633614519-26680-2-git-send-email-srivasam@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 7 Oct 2021 13:57:27 -0400
Message-ID: <CAE-0n52Ge_XZr914Ksmq5Myk3FRp7+Sc5P-9jj8wuspKkjXnYw@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: qcom: Update lpass variant independent
 functions as generic
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
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

Quoting Srinivasa Rao Mandadapu (2021-10-07 06:48:37)
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 2f19ab4..c0117c5 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -124,7 +124,8 @@ static const struct pinctrl_pin_desc sm8250_lpi_pins[] = {
>         PINCTRL_PIN(13, "gpio13"),
>  };
>
> -enum sm8250_lpi_functions {
> +

Please drop this extra newline so the diff makes sense.

> +enum lpass_lpi_functions {
>         LPI_MUX_dmic1_clk,
>         LPI_MUX_dmic1_data,
>         LPI_MUX_dmic2_clk,
> @@ -203,7 +204,7 @@ static const struct lpi_pingroup sm8250_groups[] = {
>         LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
>  };
>
> -static const struct lpi_function sm8250_functions[] = {
> +static const struct lpi_function lpass_functions[] = {

Why not follow the approach of other qcom pinctrl drivers and make a
core driver that each SoC uses as a library?

>         LPI_FUNCTION(dmic1_clk),
>         LPI_FUNCTION(dmic1_data),
>         LPI_FUNCTION(dmic2_clk),
> @@ -615,7 +616,7 @@ static int lpi_pinctrl_probe(struct platform_device *pdev)
>                 return dev_err_probe(dev, PTR_ERR(pctrl->slew_base),
>                                      "Slew resource not provided\n");
>
> -       ret = devm_clk_bulk_get(dev, MAX_LPI_NUM_CLKS, pctrl->clks);
> +       ret = devm_clk_bulk_get_optional(dev, MAX_LPI_NUM_CLKS, pctrl->clks);

Please mention in the commit text why this is now optional.

>         if (ret)
>                 return dev_err_probe(dev, ret, "Can't get clocks\n");
>
