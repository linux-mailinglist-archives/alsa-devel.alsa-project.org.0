Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC26C68932D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 10:11:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E86B682A;
	Fri,  3 Feb 2023 10:10:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E86B682A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675415470;
	bh=pcqJQ61wBtH+RmebpWk/duoXIFKOmZlUCkldd1eNdqE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bLjA77qBavh9XfImI+R6zO7cXP8pTOa1jKK2Jaz7Yst4RZyQSrg5mbkN3lhn4U7Su
	 AnOwYXF4aOJppztxjWFIMBQKIY8CZyC6NPRMYM9B9paC19XRsi2AO43RY6EuI06SR6
	 5HQrNPotEZMGTGkiyBLfR3u860vk2qQN1z9dpAys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC1CEF800E3;
	Fri,  3 Feb 2023 10:10:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C582BF80254; Fri,  3 Feb 2023 10:09:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD3E8F80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 10:09:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD3E8F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AMN5K4po
Received: by mail-wr1-x432.google.com with SMTP id r2so4014667wrv.7
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 01:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MHn45+vnENK/TVFtx99s7WoA9gA2YZddyjnUzP5s16c=;
 b=AMN5K4po0wih1uiCioK2NDKoMhZFPH7TpH9vUPEsXKmokVADyzbPdoWoVoFMz1jRD7
 mcSs4Z9hgfq5SsEakOIiz1qASOlNVRvCpGuodPSZEvdMIP2bKxJ6AnUb9mOSrJqbaqyh
 WIiEYKwRuBWljB1udt3BVDR1cBJCNRm7FhwTsvRzCSs5SXRJHQrO3BzNlYVkSCd5A6VG
 PO9Tcx38k31bAUvAe5YgpnJo7d/hacCaYIVzA6XTJyBG06y+tUHqNoEkxWPL17QKEXlD
 sEESzc5OYdKaBfnhGc8XDj0Gos37AH5EsUjvwDARWezGpHlrVlHwh/7g3ebCAiRevVjw
 Fh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MHn45+vnENK/TVFtx99s7WoA9gA2YZddyjnUzP5s16c=;
 b=8DNszY4hYLTYZvTp9977LqsaH4iLOgGIW9mJJergJTBPi0MCiiionGCv+sGij//i+q
 VAFlE+Hkdcw8hvy4IpRs98AgR9N2tztUZVpbyWefjP675anaNTrnpnJtvmnjR036vOzs
 22zJc/LcjfpS7bt4dj7neIKomgiJjadrYpswDXnTVN9eADfeVpTbtYoZxEYBeUoogz0W
 qQ8ZQSfBF+M7yiA9LaNrhhuG1LrhaMIPvC/E/oaWHWL9EtcEUGMI5j673ELEkc/q/mn7
 5177Jzc2MIZ0J3v5a8JjzHB+CfmRi1BsqSanIMi3rgUHjYd5lJJtLtkqRUyHTvqVzgW4
 c+3Q==
X-Gm-Message-State: AO0yUKWOnvtveZmqqY1mHCXTDrb4yOS5IF9Lc8tEUuue7PmydZqJnzBJ
 d2cabjgclJ/hpMEB6+slz+B2oA==
X-Google-Smtp-Source: AK7set84hsw/7fWJrGnI1HI7nN5pusbfTFUXGtJoj7Z/splNoJLWpDd3zxqfsMBSwstHnOGC7Hp9iw==
X-Received: by 2002:a5d:61ca:0:b0:2bf:d14a:21dd with SMTP id
 q10-20020a5d61ca000000b002bfd14a21ddmr10487360wrv.29.1675415384078; 
 Fri, 03 Feb 2023 01:09:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a5d4dc9000000b002bfb37497a8sm1478281wru.31.2023.02.03.01.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 01:09:43 -0800 (PST)
Message-ID: <46974ae7-5f7f-8fc1-4ea8-fe77b58f5bfb@linaro.org>
Date: Fri, 3 Feb 2023 10:09:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: dt-bindings: renesas: adjust to R-Car Gen4
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
References: <87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com>
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

On 03/02/2023 02:22, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> R-Car Gen4 is not compatible with Gen3, this patch adjusts
> to R-Car Gen4.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> The "required" with if - then - else on "rcar_sound,ssi" is
> always match to "then" even though it is checking "renesas,rcar_sound-gen4" or not.
> Why ?? Is it my fault ??
> 
>  .../bindings/sound/renesas,rsnd.yaml          | 62 ++++++++++++++-----
>  1 file changed, 46 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index d106de00c6b2..9a88b1c34e72 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -106,7 +106,9 @@ properties:
>      items:
>        oneOf:
>          - const: ssi-all
> +        - const: clkin
>          - pattern: '^ssi\.[0-9]$'
> +        - pattern: '^ssiu\.[0-9]$'
>          - pattern: '^src\.[0-9]$'
>          - pattern: '^mix\.[0-1]$'
>          - pattern: '^ctu\.[0-1]$'
> @@ -254,10 +256,20 @@ properties:
>            no-busif:
>              description: BUSIF is not used when [mem -> SSI] via DMA case
>              $ref: /schemas/types.yaml#/definitions/flag
> -        required:
> -          - interrupts
> -          - dmas
> -          - dma-names
> +        allOf:
> +          - if:
> +              properties:
> +                compatible:
> +                  contains:
> +                    const: renesas,rcar_sound-gen4
> +            then:
> +              required:
> +                - interrupts
> +            else:
> +              required:
> +                - interrupts

This does not make sense - you just require it always.



> +                - dmas
> +                - dma-names
>      additionalProperties: false
>  
>    # For DAI base
> @@ -307,18 +319,36 @@ allOf:
>                - ssi
>                - adg
>      else:
> -      properties:
> -        reg:
> -          maxItems: 5
> -        reg-names:
> -          maxItems: 5
> -          items:
> -            enum:
> -              - scu
> -              - adg
> -              - ssiu
> -              - ssi
> -              - audmapp
> +      if:

Please do not embed if within another if, unless strictly necessary. It
gets unmanageable.

> +        properties:
> +          compatible:
> +            contains:
> +              const: renesas,rcar_sound-gen4
> +      then:
> +        properties:
> +          reg:

minItems

> +            maxItems: 4
> +          reg-names:
> +            maxItems: 4

Drop

> +            items:
> +              enum:
> +                - adg
> +                - ssiu
> +                - ssi
> +                - sdmc
> +      else:
> +        properties:
> +          reg:

minItems

> +            maxItems: 5
> +          reg-names:
> +            maxItems: 5

Drop


Best regards,
Krzysztof

