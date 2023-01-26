Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4884667C809
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 11:09:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADCEFE99;
	Thu, 26 Jan 2023 11:08:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADCEFE99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674727767;
	bh=wb6ILCQ1cTC9pBv2u2C6lULUzFkV5Mzo0cqauuI6ykw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Wwv32AZ+AcygV3opo4EjmFRj/9RsBv9sFE6prqDDgNi49Ix7o7IwILcoL+D2xMBAQ
	 dNQSQ+alEuZnU/Px5xvD1PCftCTu6udeZtpyVIPxG4XRu0+xFGQcfDW+dpCq/p9gOF
	 a2s4cwH8kE7L5uyBLIi7fyzuGi1+d1eJ9PlNkl8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 484EFF80224;
	Thu, 26 Jan 2023 11:08:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C61BF80224; Thu, 26 Jan 2023 11:08:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D3CAF80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 11:08:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D3CAF80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CmBV4M5C
Received: by mail-wr1-x429.google.com with SMTP id n7so1215713wrx.5
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 02:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OCMpSj2qX/TvzjoL4WBA0wHs1RQU0xmnM0hsa+C5VYk=;
 b=CmBV4M5Cp06VI+Bqc7KdM3VcQ7S5S3Ya4+rhl5CQbTLwdmq8TgJH7H1pjh/lDWlW/k
 IsE4YUY+WWqWDFcQJ1tQcpL+zrUwzmpwFI6vzgIBLHDm7laszZjy+4x+7VqdRl6Y3sLr
 l2B+gd7SXtNOtZ+2eHG6licGhpHzZlBEo4gKiwFQlOJ/s9MwjKdbXaFnEYVC2KnGtweo
 IQfnFSyBoBUt9Zq50b7egWunrtCCKHxjEqeMbXA0TJbMTb3rKuCeHGNLpU7uTNxFAEmz
 CwaxpYnmn+X9T+hHO/q+VNkggupSgIFd97nBfhodCR5mL47OZj8/rP8UnNyKnZ8UeoGP
 XppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OCMpSj2qX/TvzjoL4WBA0wHs1RQU0xmnM0hsa+C5VYk=;
 b=PqcvuDN+UMJk6fHEPFdHzHIcthoiUrpWEMObJT2w/AGhuIFw2hXu5s6PRslLFAt03V
 Z/ukO/BubF9BoVh5UCuj23hsGHs5OvD093yG2WbGZrYsINrmm6PTQo0UcU+sbihytDto
 Q5BUu4NRZfvR8bk/uwW33fZQVJsgXWvVibMJyA3KZ5A/ZofQdSsEeXozJxYv6UwaPgUu
 POZmTVhtMGB39s6WDAg6RLbD1qosfJHz14y0NLJgIcsCpWJh5o608e+25iXyi5qvIGvM
 /XlhQWDMkcbL3PoiQuhNo61I/NPwZcdZtUff37x31BBaMYqWIQq2XrInFqOt0H+Sb9Ou
 8moA==
X-Gm-Message-State: AFqh2koyKbpX+1tD20Dag6e08jeutICZrC65zKRTj8h7EjwcxaQtQjay
 HQwL2Vb7vz6QpX2rcEubOO5Y8w==
X-Google-Smtp-Source: AMrXdXvkdqGYnmBaXPcM4k99z+W9QBzHNjb5GVMx2Ejf2Dv7jLU2bRlGzTrG4Cmx6n5GRBCzwMkNfg==
X-Received: by 2002:a5d:5b0e:0:b0:250:22e4:b89e with SMTP id
 bx14-20020a5d5b0e000000b0025022e4b89emr33781953wrb.65.1674727709017; 
 Thu, 26 Jan 2023 02:08:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a5d434e000000b002bfbda53b98sm841421wrr.35.2023.01.26.02.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 02:08:28 -0800 (PST)
Message-ID: <a7b9d4b9-892d-a131-a223-c286efdc9b9c@linaro.org>
Date: Thu, 26 Jan 2023 11:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] ASoC: dt-bindings: renesas: add R8A779G0 V4H
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <87zga6t5r4.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87zga6t5r4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 26/01/2023 02:59, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

There is stray blank line before your "From".

> 
> Document R-Car V4H (R8A779G0), and R-Car Gen4 SoC bindings.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/renesas,rsnd.yaml          | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index 679a246dd666..5319abdda8a2 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -49,12 +49,21 @@ properties:
>                - renesas,rcar_sound-r8a77995  # R-Car D3
>            - enum:
>                - renesas,rcar_sound-gen3
> +
> +      # for Gen4 SoC
> +      - items:
> +          - enum:
> +              - renesas,rcar_sound-r8a779g0  # R-Car V4H
> +          - enum:
> +              - renesas,rcar_sound-gen4

This is not enum but const. I send a fix for the rest, please rebase on
top of it.

Best regards,
Krzysztof

