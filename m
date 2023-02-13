Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A31694022
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 09:57:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DC8B20B;
	Mon, 13 Feb 2023 09:56:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DC8B20B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676278634;
	bh=UnnK8xTi4p4Xu9CiBzimJP8Ntekztvx2UJ8RGhi7Cfg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dUKEadAJ3hrlAY9xotU3lgvbwBzylejPXv1RBwX5yD9Wns+EEcMSxMLxDUa7otyPx
	 lmaOIeTZXxXSpzMRLiU2H0ctZMgwEGsBiJsnH6tM9VbnYDoGI/h8aaiA1jPAQeI6xf
	 xQNbORzrXeceTxFJeRCquyy46hWbpugSIvQ+vPwY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CCB5F804B4;
	Mon, 13 Feb 2023 09:56:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06729F804B4; Mon, 13 Feb 2023 09:56:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 186CCF8001E
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 09:56:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 186CCF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rTIjWg1H
Received: by mail-wr1-x434.google.com with SMTP id a2so11313982wrd.6
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Feb 2023 00:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrdEUdx+/z9tbHe2D2OpRSrhkTGl9pH4TQVq/tTgnWE=;
        b=rTIjWg1H5zFbgtvdH0T2+vGTVe57oj3JeHVdaj9RkTTrN9JebI+A0/X+dzvZFzYBGd
         0NAqzS1OzodJT5alSMWgMsb3vEZpaecbP+EoO2AdxkZ6rH38JyBbpQXOVfZ7I6Lpsdwk
         Cfs3ua1IVJ05eV9GPqDepWM3ViY8gdKLM7jw5sfJigMf9LAj7/SToOJF6LclGGe9gpqL
         cLGH2oLUxisXgoZJaFDlT7RlYhelzECVJrl+H81knWqTMGcLJjHHix8Wscfe/OnnTh+O
         KusUbWiOX5WPECddr03paFMj8Z9nkAQAsEp1vbidjISs9PnUnkHJZIrTCRJNxkhderfv
         ugmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrdEUdx+/z9tbHe2D2OpRSrhkTGl9pH4TQVq/tTgnWE=;
        b=j7+qUOqoc+6Dinl6wtoMu+bJyhtl6uK3VyOFB+DL+QPb66tjDGgOl9BCZzmDatSEPI
         ZaPZgts+52GPmrJaMV3nmTT/IvMdPsjX9Qmbh282pLCJ7oV3zuJniLBdjPauJ5uMAFgr
         4Nop5XKEbHO9mNJ6LbvZB9G6WDS5sQ6uV6wZkqn3bNQPi0Ynf/HR2UJQrZYFzEOuRmO3
         gg+CjC473c0l4RrATzLG28OE42hGtc/O0ByZsjIDcmwaBMfbrEYB82Y1QsVJw2qsdOWz
         THd1wniSIexgF+JSwwvWotlLzBTeqLGuQQz/tlEsfbTtGQzSNKUjngE8tkjQguxb5ZBM
         +QBQ==
X-Gm-Message-State: AO0yUKW73iZetL8EASKesI9+ne9WtPwRk04b/IONLCjALNtLQYiasXMx
	FK2SzII8Z5Qmh6DSkr+IVj+u6g==
X-Google-Smtp-Source: 
 AK7set8+8JNf13vYLQiwiPk8YK5KksQ6c5uv4QgocyHPIkDLVw/ziH4/6f71ADrW4slnuf6JG1pcBQ==
X-Received: by 2002:a5d:6149:0:b0:2c5:5bc0:e7bc with SMTP id
 y9-20020a5d6149000000b002c55bc0e7bcmr1203281wrt.4.1676278562948;
        Mon, 13 Feb 2023 00:56:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a5d5107000000b002c556a4f1casm2900791wrt.42.2023.02.13.00.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 00:56:02 -0800 (PST)
Message-ID: <e54208c9-d834-3ed7-86e2-55b98c3208f0@linaro.org>
Date: Mon, 13 Feb 2023 09:56:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: renesas,rsnd.yaml: drop
 "dmas/dma-names" from "rcar_sound,ssi"
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
 <87r0uu8g8x.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87r0uu8g8x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2XTCPO6M37NPKYAPGGSU2EEL567E4NC6
X-Message-ID-Hash: 2XTCPO6M37NPKYAPGGSU2EEL567E4NC6
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2XTCPO6M37NPKYAPGGSU2EEL567E4NC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/02/2023 03:13, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> SSI is supporting both "PIO mode" and "DMA mode", thus "dmas/dma-names"
> are not mandatory property. Drop these from rcar_sound,ssi's required:.
> This is prepare for Gen4 support. See more details on Link

What did you change here? I still need to read 4 different
discussions/links to have understanding why?
> 
> Link: https://lore.kernel.org/all/87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com/#r

What details are here? There is a patch with gen4 but I don't understand
how does it answer anything here.

> Link: https://lore.kernel.org/all/87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com/#r

This is previous version, so it also does not bring more details.

> Link: https://lore.kernel.org/all/87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com/#r

This as well... so you say "more details under X, where X says more
details under Y, where Y links somewhere else"?

> Link: https://lore.kernel.org/all/87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com/#r
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index c3bea5b0ec40..12ccf29338d9 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -256,8 +256,6 @@ properties:
>              $ref: /schemas/types.yaml#/definitions/flag
>          required:
>            - interrupts
> -          - dmas
> -          - dma-names
>      additionalProperties: false
>  
>    # For DAI base

Best regards,
Krzysztof

