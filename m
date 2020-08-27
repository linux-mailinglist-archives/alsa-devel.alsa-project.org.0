Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFF825599A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 13:47:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 473D3187A;
	Fri, 28 Aug 2020 13:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 473D3187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598615247;
	bh=C8RyEJColrK2Qa8SLkUrXidNQWdL/KKEg43M0eLpH8k=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c1qp/Me34DgDJzDpf3Q2gPl7oldpYtpvL7vNjdZuEnlPreXM8GSUjHUqe9UcLbgBK
	 9DTQcbOsr4IuinFv4VZtU5vix4RDKROdp0ZaLw/bbudbT8Xp6pxgsCfwNCC2T6nNTj
	 sT42xuTKAuaIGeNKRriIjNJ4DCQP2wQHpBSGoc+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8C99F802DB;
	Fri, 28 Aug 2020 13:44:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8A0EF8016F; Thu, 27 Aug 2020 20:16:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2D9CF80085
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 20:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2D9CF80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wSFnOytp"
Received: by mail-lj1-x242.google.com with SMTP id r13so4083938ljm.0
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 11:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BMtVJeUzPW/21lgl19SChHP4cZE4M9iPKQteLK365hc=;
 b=wSFnOytpcvV49hUor1Rhdq4fcuf+m8XOkFWmRJFZONnZr5+2pKLo+thilZqINwctis
 Lih/hDbQknTYZiybi6yukykCPU/WuKeauT6TYHuuzPC2WcCYX/EwIZ4xgLFQESP8pBvg
 AuogxTrIHrNP7sZx5EiOukhE+A0WhNOPsuhU0/B6gSEuRBpdPaFS+oTNWCU0Y/txxi99
 nkpUElLoghA9MMX+xLCn49XPBXwSzET5O96KWH1urHfmWqEW3bVymWP4gtDJDAJB6j+W
 9xB/QzVEqvL5GGvXEOdRp9v0sdiTttXrn9JCLjxoQlhZ+2ievLWVO5tsWO8+SWalt9yc
 1YRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BMtVJeUzPW/21lgl19SChHP4cZE4M9iPKQteLK365hc=;
 b=A+LK12Ajg5K9oYiCLmQsZocy6nW0QhdOyPIuXFovFyDTeFLtpYeCiuA6s41BS7c3n5
 5FPUe+yEgkZ5KLUf05hhsS7TA9bWMtzqTQZeY/pJDUNZPpPQsnCDo5ux01Rm9d25hXvk
 nBMdqr2I0m+KT9jJaI4CGaO9KPLeW0MXTn7qBP+mY47jozrQwMhenqqZ3qEqcgLg1fwP
 LxRH4ancU5mNm/erOIuCU0KqGEFkQROrX/4/GHBuJvfjLwjdnZsTRqoSzXsDo58QJD2z
 I3YIlIJQldc8/k1CibWjaw6hls6zsq4V2pgNz6W4H04x6FozP0HET292JQshkPPbr9Jh
 4kSA==
X-Gm-Message-State: AOAM531QG6DF1aET3raCvSp5p1yB/4Esi+Hg3F9z1Ir9KNAbG/iL3Ujg
 7psJX6eoi0K/aW59h1PJfUi8Og==
X-Google-Smtp-Source: ABdhPJyRXbMmaqx33BlJbVeirHn2s23BP4VtRqpHZtPTTzbS8hQiyMwTkQPXvTPUnMPGqyp4G53J/w==
X-Received: by 2002:a05:651c:310:: with SMTP id
 a16mr9665626ljp.250.1598552176768; 
 Thu, 27 Aug 2020 11:16:16 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.50])
 by smtp.gmail.com with ESMTPSA id s4sm615367lja.124.2020.08.27.11.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 11:16:15 -0700 (PDT)
Subject: Re: [PATCH 4/5] soundwire: qcom: avoid dependency on CONFIG_SLIMBUS
To: Jonathan Marek <jonathan@marek.ca>, alsa-devel@alsa-project.org
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-5-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <43fdb4d4-0adc-28f2-b4a5-e0594b9a3044@linaro.org>
Date: Thu, 27 Aug 2020 21:16:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200608204347.19685-5-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 28 Aug 2020 13:44:03 +0200
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>
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

On 08/06/2020 23:43, Jonathan Marek wrote:
> The driver may be used without slimbus, so don't depend on slimbus.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/soundwire/Kconfig | 1 -
>   drivers/soundwire/qcom.c  | 5 +++++
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> index fa2b4ab92ed9..d121cf739090 100644
> --- a/drivers/soundwire/Kconfig
> +++ b/drivers/soundwire/Kconfig
> @@ -33,7 +33,6 @@ config SOUNDWIRE_INTEL
>   
>   config SOUNDWIRE_QCOM
>   	tristate "Qualcomm SoundWire Master driver"
> -	depends on SLIMBUS

I'd suggest:
depends on SLIMBUS || !SLIMBUS #if SLIMBUS=m, this can not be builtin

This would allow building both SLIMBUS and SOUNDWIRE_QCOM as modules

>   	depends on SND_SOC
>   	help
>   	  SoundWire Qualcomm Master driver.
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 14334442615f..ac81c64768ea 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -769,13 +769,18 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	if (!ctrl)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_SLIMBUS

and then #if IS_ENABLED(CONFIG_SLIBMUS) here

>   	if (dev->parent->bus == &slimbus_bus) {
> +#else
> +	if (false) {
> +#endif
>   		ctrl->reg_read = qcom_swrm_ahb_reg_read;
>   		ctrl->reg_write = qcom_swrm_ahb_reg_write;
>   		ctrl->regmap = dev_get_regmap(dev->parent, NULL);
>   		if (!ctrl->regmap)
>   			return -EINVAL;
>   	} else {
> +
>   		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   
>   		ctrl->reg_read = qcom_swrm_cpu_reg_read;
> 


-- 
With best wishes
Dmitry
