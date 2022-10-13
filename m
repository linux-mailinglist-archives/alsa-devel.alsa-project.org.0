Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D415FE5E6
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Oct 2022 01:38:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EDEA2E18;
	Fri, 14 Oct 2022 01:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EDEA2E18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665704286;
	bh=442YsHppE9xFvAB32VojgVH1a6biDgP3eit/L8EM2ng=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rcRZYRZMJrAhs8Eb9TH6MfOEok3PBjfUJk+lESWYQTdDXpelTsNFVPE6qfnfBXZBF
	 7Jik+6pl3iRurSlgam24fFs/isZwoxJ0vD7pKT6zFG0XhVwhaNTE2Yfk0vCnmCLLqT
	 pU/j7eAoR5Ok9dH2s6mqixVoxXoyd3ctz4vUmRTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F157F800C0;
	Fri, 14 Oct 2022 01:37:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E8F6F80269; Fri, 14 Oct 2022 01:37:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41A33F800C0
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 01:37:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A33F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DI2r/zw5"
Received: by mail-qv1-xf36.google.com with SMTP id g9so2266893qvo.12
 for <alsa-devel@alsa-project.org>; Thu, 13 Oct 2022 16:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LfeSqoj2xkCKlJljCXFGihAQXP+bw5EdlDAnTwD29f0=;
 b=DI2r/zw5cprwxbhoFNabIvVoBnWD5Xe3cprvWBoCcO9qSR6QNkCEm8+q+gMOIZGhYC
 rVG95sysEoM0nCLzm92GfrPWtoyrC+WuWu7YXHXJBI90NoEh/dQWxlTwXnN4xqMZC+SI
 RYBRVHTaxyPui+iaz5lurUD8ZqDA0VMAgPnIa9XvMiE58HgydLs71qPbOYQH5+KS/Dcu
 95FtnClffK59VAv88plMGZm0eGyQKO1UEitNW9knFzv2C8oaVf8F8nnrNORSGzPFDBr5
 XFQJzm3QYeRhfYiDQyBYSyzJ88nTYmNn7g9YWwrCpSw8qWCT0DZYWCL3B+3Dg470RPaV
 TsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LfeSqoj2xkCKlJljCXFGihAQXP+bw5EdlDAnTwD29f0=;
 b=VMQwzYRyEu/nUc6O8QlT50qurPhXmDJkj/Ryx/YBE3dVOMIssWoqpnnZYs3U0UDgqh
 FKkyjZIuy0bQZqUGYErzB1YiawwKFzTu3HS67wjHV+gPsFYuCpjRHEDXmDJNXajG+Z8W
 G394aVhlR0Aw2xFguhZ+5tuvw6+CCcpcHAk2jXzeyDvaPwCdNKeVE06r88lSXxOPm8nr
 DzIUQ0ifrAl311uQogVxYmaRM5bioxe4yjM9eeFNFGQcULo0lyeLgIdf9kMlE+9TcHgS
 x3H0vPYUQPJvYXvT4UYR8WBwXu7OaEv6p4iWG70IPkabZo8oSA5+R12QMEvVT//YaAVY
 kt2g==
X-Gm-Message-State: ACrzQf28YLdLRPN0axMYFjP7NdlcP6WP/oAiUklevYqKl2kio76sRQsL
 J7lKXSHq/pKO8T7tKCjJZS970A==
X-Google-Smtp-Source: AMsMyM5673uWNCwb3Q7nTib5kLMEJmjIwEJk3eCcftbHuxk1YZhK2neYq5isJjtuUOJf2Y4Blq8T3g==
X-Received: by 2002:a05:6214:21a6:b0:4b2:d753:ed24 with SMTP id
 t6-20020a05621421a600b004b2d753ed24mr1928297qvc.78.1665704221094; 
 Thu, 13 Oct 2022 16:37:01 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com.
 [72.225.192.120]) by smtp.gmail.com with ESMTPSA id
 bi38-20020a05620a31a600b006dfa0891397sm992423qkb.32.2022.10.13.16.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 16:37:00 -0700 (PDT)
Message-ID: <4a25e348-c6d4-ceeb-ff08-1fca4132d5a7@linaro.org>
Date: Thu, 13 Oct 2022 19:34:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2] ASoC: dt-bindings: Document audio OF graph
 dai-tdm-slot-num dai-tdm-slot-width props
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
References: <20220927185359.294322-1-marex@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927185359.294322-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
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

On 27/09/2022 14:53, Marek Vasut wrote:
> Document dai-tdm-slot-num and dai-tdm-slot-width props as those are
> parsed by simple graph card and may therefore appear in audio OF graph
> node.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> To: linux-arm-kernel@lists.infradead.org
> ---
> V2: Drop the definition refs and just fill in type and description
> ---
>  .../devicetree/bindings/sound/audio-graph-port.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index bc46a95ed8400..64654ceef2089 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -74,6 +74,12 @@ patternProperties:
>        convert-sample-format:
>          $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-format"
>  
> +      dai-tdm-slot-num:
> +        description: Number of slots in use.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      dai-tdm-slot-width:
> +        description: Width in bits for each slot.
> +        $ref: /schemas/types.yaml#/definitions/uint32

Isn't the slot width already part of dai-tdm-slot-width-map? Number of
slots maybe as well can be deducted from number of tuples in
dai-tdm-slot-width-map?

>        dai-tdm-slot-width-map:
>          description: Mapping of sample widths to slot widths. For hardware
>            that cannot support a fixed slot width or a slot width always

Best regards,
Krzysztof

