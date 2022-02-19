Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 936504BC4F5
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Feb 2022 03:39:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21EA21742;
	Sat, 19 Feb 2022 03:38:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21EA21742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645238363;
	bh=F0sx7yuhodSwcpzlgrc02i8Yz+ZCgwJSEBY9+d3kV3Q=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QzdaoF2Q0mmtJwdGFMzs0ciFLKReCTRoGPekRk59vLGWBMlNZQhnIqJ9bnhsSOCoL
	 uYEiWPd/rsd76vZ3arfG8h2MUrhVdFUrsxC5Kk1JdeXKt29JtlIYh7Q4zkIz422toC
	 KlEHGG0nCD8BYEHoYz4/8blMgR31nk1rHI2COQZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC925F800EB;
	Sat, 19 Feb 2022 03:38:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C1FEF800AB; Sat, 19 Feb 2022 03:38:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5F5BF800AB
 for <alsa-devel@alsa-project.org>; Sat, 19 Feb 2022 03:38:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5F5BF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="igmVvA+p"
Received: by mail-ot1-x32c.google.com with SMTP id
 k22-20020a9d4b96000000b005ad5211bd5aso1347942otf.8
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 18:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Q/d8d9FtvFLvr7ME3dVsj5LqYy1sSgbi/qeJ46Jm0aU=;
 b=igmVvA+pynBNZ+OpRVvuE3rxbpMYu4Wko1Nb6whyoNL4U/mFTtIz7mOzAWv8suyjpg
 qQkhX/GISFBC0mmukyAFo+aDL4DzmLx/DPsYOXeuQi4mp03agz3Vm0yt029c2g1miors
 6iDhXOSShbGUBPVzQ64qq73tiFAOrEqNVneUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Q/d8d9FtvFLvr7ME3dVsj5LqYy1sSgbi/qeJ46Jm0aU=;
 b=kngUcnO93k5ELSP8c/Z4xXFFW1TWS28lUcV89Lqohe9RYSimqYbIhd158ZK7KcWoSe
 hmILaPz7BpucLfdWbTMpy11CpZE+fH/GmzTBoMplHnYwtDaBDkboy+spPzLl0AMPaced
 pvKW9zFgRS45frxMHd70odN49kcUgTW2fuN4ml6Z/ofEnuzGMOC3dJjO0qBNdjD72xCj
 Tp1NP2WtswxkdmIkeDFyW0DcZcg8Fw4OgWt/ZBKl7K/Yt7CM0q2tK5EawDmyPR69zMyP
 xnbQkqmN6EEowhkpjjBUb3aZiHx9hGgweBqiSn/xntmEmgO6NoqY53cXgVh426hefGzj
 ncdw==
X-Gm-Message-State: AOAM530pmrJSQm3X/5RSAoAKlsL9g19MihHBHkSfuPotTNPXd50WNLAi
 MQukCQ+8YBTufJXF8u3OLedDgrcUS2lcUpdyIAFX6Q==
X-Google-Smtp-Source: ABdhPJwDM7ap6YfqY8vNs89NKhqKuvxAmqVdqaPWrzkpraWmJ8qaQAj6OBhQJRKTB417QMhc9jcNWYtgJWlO7UpCuyo=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr3361118ota.159.1645238286645; Fri, 18
 Feb 2022 18:38:06 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:38:06 -0800
MIME-Version: 1.0
In-Reply-To: <1644851994-22732-5-git-send-email-quic_srivasam@quicinc.com>
References: <1644851994-22732-1-git-send-email-quic_srivasam@quicinc.com>
 <1644851994-22732-5-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 18:38:06 -0800
Message-ID: <CAE-0n51vhcUg5ng7FWzS0-09-zazCk5JKwpvLPfK4w15_r97kw@mail.gmail.com>
Subject: Re: [PATCH v6 4/7] pinctrl: qcom: Update lpi pin group structure
To: Linus Walleij <linus.walleij@linaro.org>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 robh+dt@kernel.org, rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-02-14 07:19:51)
> @@ -150,20 +148,20 @@ enum sm8250_lpi_functions {
>         LPI_MUX__,
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

Why do we lose const?

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
