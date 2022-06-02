Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 460BA53B5F3
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 11:25:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4856173D;
	Thu,  2 Jun 2022 11:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4856173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654161922;
	bh=9u0q+DNglzWIcaBr7doggJAPkLASH0hw4XfPXBgiinY=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uK7PYKZAy6rDTx4/SDwhywNBHl8pY06p/x8UT2owGcAiaCNjG1Kj4HQPw6Ia8spUP
	 RIe4mf7gWFUOWn3sVnqc+cYHcG6iqzrVsbi82Gsc8/oplXff7O6+2ZAMut56pFgcsy
	 YxN/sXwgnKBwxYFbUZ10A3Obia2sxmLbGFcN9uok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53EEBF8025E;
	Thu,  2 Jun 2022 11:24:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C070F80236; Thu,  2 Jun 2022 11:24:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85D00F80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 11:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85D00F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p6WvHIuO"
Received: by mail-pf1-x436.google.com with SMTP id c196so4285821pfb.1
 for <alsa-devel@alsa-project.org>; Thu, 02 Jun 2022 02:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :references:content-language:in-reply-to:content-transfer-encoding;
 bh=eXRog2iT+8A77EWE8Om22IKZZOAdI/qJSpQS0WBxXqM=;
 b=p6WvHIuOPDV8LNLP58pvwZs1Lw6BRZ5sRHhvQfsV37Dq5SRdm26clFtGMvonivvjhP
 Jy8lcETQ90+thqSeHNmyhacKxMIjNVIHJkevX3z5XRDS+fSoQrkcJOvbyXzC/J+mdRXH
 jrzlCG9jx6Tx9ZDov66szwr6Gih+lQTcm30rVtJN9kW8Gle95C3zN8FCYb6oydC+MUvp
 J9Y3D5ZfEKjY+2B32qBe7A85qfDdgU6cp70EFoz0BLXWtv7E3dVBV+Hepvsfe9F5zuIH
 FbNBJJdV11FoSE9p1Srwy1z4atngl+8xTvjK+2pvEUpKLzdfdasVoY1Ih0kYsI2VfAqa
 rPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=eXRog2iT+8A77EWE8Om22IKZZOAdI/qJSpQS0WBxXqM=;
 b=gpWzaGxz8U+E9nG8iA7R6m9Ch1zNG18L7Ib3v339ou3bJAQekgy0M7sxWTpfPbX/1c
 uG5FA0SdsQVedtVCP2P6JndWsgF4SmkgZhetKDQamO+kBSetGaOAzrf4egFo9vkt8iif
 e1qXFwxTn76WeNICnpNDQVxkQY5L3oECZUZfSdVzBZYd+6jyu3RSfxxzDAJS+tTFbNqu
 uEFpxCxPeBAkvlpLd2cHtI6Vso16x6nY2I367pC3ESSJnVBmxmYdp/nBIJiZjBH66aCD
 Cf/cSrZHgib26GEmHdJHSDAVc34evW6an+t/CUL04zuATkn7Z+Meu9sg1eSeXhBpNbH8
 eZKQ==
X-Gm-Message-State: AOAM533kqtreVly3tLdLGt7pdwLP1+LNZYdKb74SwM/ZRzLLF0Oo5eHz
 T8zXHcLeIPved7nsXat/qhY=
X-Google-Smtp-Source: ABdhPJyDezlKEZDXCXKZzYEQdsEzv6cAMKWtQtzzQ28azuGe5h8rGDzx4z7zdtJs1Uf/aUOudEnhOw==
X-Received: by 2002:a63:6cc7:0:b0:3f6:ba59:1bcc with SMTP id
 h190-20020a636cc7000000b003f6ba591bccmr3441341pgc.188.1654161855000; 
 Thu, 02 Jun 2022 02:24:15 -0700 (PDT)
Received: from [192.168.0.103] (39-13-101-104.adsl.fetnet.net. [39.13.101.104])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170903211100b0016648412514sm450720ple.188.2022.06.02.02.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jun 2022 02:24:14 -0700 (PDT)
Message-ID: <c492a0f0-779b-6438-6245-3d6f159b48ef@gmail.com>
Date: Thu, 2 Jun 2022 17:24:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From: David Lin <ctlin0.linux@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: nau8822: Add operation for internal PLL off and
 on
To: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <20220530040151.95221-1-hui.wang@canonical.com>
 <20220530040151.95221-2-hui.wang@canonical.com>
Content-Language: en-US
In-Reply-To: <20220530040151.95221-2-hui.wang@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: wtli@nuvoton.com, kchsu0@nuvoton.com, ctlin0@nuvoton.com
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

On 2022/5/30 下午 12:01, Hui Wang wrote:
> We tried to enable the audio on an imx6sx EVB with the codec nau8822,
> after setting the internal PLL fractional parameters, the audio still
> couldn't work and the there was no sdma irq at all.
>
> After checking with the section "8.1.1 Phase Locked Loop (PLL) Design
> Example" of "NAU88C22 Datasheet Rev 0.6", we found we need to
> turn off the PLL before programming fractional parameters and turn on
> the PLL after programming.
>
> After this change, the audio driver could record and play sound and
> the sdma's irq is triggered when playing or recording.
>
> Cc: David Lin <ctlin0@nuvoton.com>
> Cc: John Hsu <kchsu0@nuvoton.com>
> Cc: Seven Li <wtli@nuvoton.com>
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
>   sound/soc/codecs/nau8822.c | 4 ++++
>   sound/soc/codecs/nau8822.h | 3 +++
>   2 files changed, 7 insertions(+)
>
> diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
> index 58123390c7a3..b436e532993d 100644
> --- a/sound/soc/codecs/nau8822.c
> +++ b/sound/soc/codecs/nau8822.c
> @@ -740,6 +740,8 @@ static int nau8822_set_pll(struct snd_soc_dai *dai, int pll_id, int source,
>   		pll_param->pll_int, pll_param->pll_frac,
>   		pll_param->mclk_scaler, pll_param->pre_factor);
>   
> +	snd_soc_component_update_bits(component,
> +		NAU8822_REG_POWER_MANAGEMENT_1, NAU8822_PLL_EN_MASK, NAU8822_PLL_OFF);
>   	snd_soc_component_update_bits(component,
>   		NAU8822_REG_PLL_N, NAU8822_PLLMCLK_DIV2 | NAU8822_PLLN_MASK,
>   		(pll_param->pre_factor ? NAU8822_PLLMCLK_DIV2 : 0) |
> @@ -757,6 +759,8 @@ static int nau8822_set_pll(struct snd_soc_dai *dai, int pll_id, int source,
>   		pll_param->mclk_scaler << NAU8822_MCLKSEL_SFT);
>   	snd_soc_component_update_bits(component,
>   		NAU8822_REG_CLOCKING, NAU8822_CLKM_MASK, NAU8822_CLKM_PLL);
> +	snd_soc_component_update_bits(component,
> +		NAU8822_REG_POWER_MANAGEMENT_1, NAU8822_PLL_EN_MASK, NAU8822_PLL_ON);
>   
>   	return 0;
>   }
> diff --git a/sound/soc/codecs/nau8822.h b/sound/soc/codecs/nau8822.h
> index 489191ff187e..b45d42c15de6 100644
> --- a/sound/soc/codecs/nau8822.h
> +++ b/sound/soc/codecs/nau8822.h
> @@ -90,6 +90,9 @@
>   #define NAU8822_REFIMP_3K			0x3
>   #define NAU8822_IOBUF_EN			(0x1 << 2)
>   #define NAU8822_ABIAS_EN			(0x1 << 3)
> +#define NAU8822_PLL_EN_MASK			(0x1 << 5)
> +#define NAU8822_PLL_ON				(0x1 << 5)
> +#define NAU8822_PLL_OFF				(0x0 << 5)
>   
>   /* NAU8822_REG_AUDIO_INTERFACE (0x4) */
>   #define NAU8822_AIFMT_MASK			(0x3 << 3)

Sorry, reply late.

 From our internal discussion, the revise seems to it is redundant 
operation. The reason is driver set the PLL as a dapm supply node and 
consider PLL on/off from dapm route.

So when the playback/recording starts, the PLL parameters from Reg 
0x25~0x27 will be always set before Reg 0x1[5] power enable bit(PLLEN). 
When the playback/recording stops, the PLLEN will be disabled.
