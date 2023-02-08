Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB9E68E9C2
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 09:21:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D6553E8;
	Wed,  8 Feb 2023 09:20:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D6553E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675844472;
	bh=CFV5hN4r5pnxWtjCn1WbI+PV5fTfiihhAvUGQtR7sro=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rdXJC6SdxuJaQ3sKzzfw98+4DxyUtIJ05p+5LMm9W7sqxZeWrZpftwTp3GI2JaSTp
	 NPYUeOjRuwHiMNtrX0AW/DX9Yx7yahXs78rR7csE4/0mWlkxE6B8TRHo32N0GwT2V/
	 /BEvUUOSWob5K4xWnS6u8xUFTOMknbVsAfFT7feE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11CDFF8010B;
	Wed,  8 Feb 2023 09:20:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 110D7F8012B; Wed,  8 Feb 2023 09:20:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28B35F800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 09:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28B35F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=H/nofoqI
Received: by mail-wr1-x430.google.com with SMTP id g6so7911711wrv.1
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 00:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rL8LBItn4StHZi6ZJiCbES8DujHjLAlePtXEF4dNf0g=;
        b=H/nofoqIUmp53A1gy27FWZ/m0jJJznQ/E/KZPS80H3GOLmSOB4nm0pO/duSckPYhNg
         AVXMeq1840d1Qa0wNphY03L3u0TgrtcBvHZRz/kUIo75jq4GRha2P6Gh/bohMJwvIvOb
         yChvJipGdl5ODYy2btTWHsJlEu+MttL+hnKtgpLRimD6eSrT1n8BBYFKhjt7uNBtVlOJ
         2sD4eAfr6ruQJumXpUzDjzZBmy6KDApknk9ZrPh4RlbjznvAUdkZlBr9fUyyeoGeeXJq
         xJJVMlP7TaIaz9P5B/o4Exd4aw4rYP7dLETT+oQ1c9H32aB8ZH11F4ndlxT7gHfwCchr
         73aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rL8LBItn4StHZi6ZJiCbES8DujHjLAlePtXEF4dNf0g=;
        b=bjyzmL1UNOZXmXYh1xIm3EtB4AMZonFAFQNrad3ZW8QakKthh5bXDhQAUkdS+HmuN9
         EuB4RCGRqmzFv3oiAHFnNHogijm5GhVq9JSeHPBFQhNEor2UCvQhLcjPVE3+2mRiMPt2
         0J6Oz3dKdpbFnqTTun9ugt1fhKamfRS75Qo7tvT1OgFeXqSWu7jhY4lc0Hz3Q8zB5zY8
         2+oknmz1ap0fZJWYZB7w+PSpZmEdEI/NYG7LFBM9PVN408gUomWhxSLOebHPx0D1BaaT
         xPK3FUOskCR3XWE9zzad1CHKrdpbfm+K1vmwJHdYeBjlcdzR7GD2BucHRjRdFDBE1/wz
         1zNw==
X-Gm-Message-State: AO0yUKULxFAOFwh7TPxoWmiPmfCQoktbQ3sZ9oUMC7KKVR4p5tve3+Hq
	n6jBKWYqgAELhcYRtr9fF621kPiFYG7kfCFF
X-Google-Smtp-Source: 
 AK7set+8uThdO0z7pThPVeFWUZwaQVGSujdTBqV6nNjhDNcCzQS1w5bFHAVYpw4AaPnYueRPtqVU8A==
X-Received: by 2002:adf:ed11:0:b0:2bd:d45c:3929 with SMTP id
 a17-20020adfed11000000b002bdd45c3929mr5331107wro.54.1675844409094;
        Wed, 08 Feb 2023 00:20:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 o21-20020a5d58d5000000b002c3f0a78e39sm4368258wrf.9.2023.02.08.00.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 00:20:08 -0800 (PST)
Message-ID: <8fa6a9eb-df09-73c0-528b-a2efd9b262e7@linaro.org>
Date: Wed, 8 Feb 2023 09:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: adjust to R-Car
 Gen4
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
References: <87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com>
 <87o7q5t012.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87o7q5t012.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QEVKKGSJEWHZNNX4B5X2OXZU3BTTBS2K
X-Message-ID-Hash: QEVKKGSJEWHZNNX4B5X2OXZU3BTTBS2K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QEVKKGSJEWHZNNX4B5X2OXZU3BTTBS2K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/02/2023 02:32, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> R-Car Gen4 is not compatible with Gen3, this patch adjusts
> to R-Car Gen4.

Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

Same below.

> 
> By this patch, "dmas/dma-names" under "rcar_sound,ssi" are dropped
> from "required:" property, because (A) these are not mandatory if it
> was PIO transfer mode, (B) Json schema if-then-else doesn't work
> correctly on there for some reasons. see the Link for detail.

You gave three links, so why? You should rather explain why it does not
work.

> 
> Link: https://lore.kernel.org/r/CAMuHMdW_QHmODAKvn_GwHHUWw-=z4Tdq0NkhdK2u2piG_YgB-Q@mail.gmail.com
> Link: https://lore.kernel.org/all/87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com/#r
> Link: https://lore.kernel.org/all/87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com/#r
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/renesas,rsnd.yaml          | 72 ++++++++++++++-----
>  1 file changed, 55 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index c3bea5b0ec40..3214ca9bcc78 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -99,20 +99,6 @@ properties:
>      minItems: 1
>      maxItems: 31
>  
> -  clock-names:
> -    description: List of necessary clock names.
> -    minItems: 1
> -    maxItems: 31

Don't remove properties from top-level.

> -    items:
> -      oneOf:
> -        - const: ssi-all
> -        - pattern: '^ssi\.[0-9]$'
> -        - pattern: '^src\.[0-9]$'
> -        - pattern: '^mix\.[0-1]$'
> -        - pattern: '^ctu\.[0-1]$'
> -        - pattern: '^dvc\.[0-1]$'
> -        - pattern: '^clk_(a|b|c|i)$'
> -
>    ports:
>      $ref: audio-graph-port.yaml#/definitions/port-base
>      unevaluatedProperties: false
> @@ -256,8 +242,6 @@ properties:
>              $ref: /schemas/types.yaml#/definitions/flag
>          required:
>            - interrupts
> -          - dmas
> -          - dma-names

Even with your explanation in commit this does not look related to this
patch. Don't mix features and fixes.

>      additionalProperties: false
>  
>    # For DAI base
> @@ -305,7 +289,14 @@ allOf:
>                - scu
>                - ssi
>                - adg
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,rcar_sound-gen2
> +              - renesas,rcar_sound-gen3
> +    then:
>        properties:
>          reg:
>            minItems: 5
> @@ -317,6 +308,53 @@ allOf:
>                - ssiu
>                - ssi
>                - audmapp
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,rcar_sound-gen4
> +    then:
> +      properties:
> +        reg:
> +          minItems: 4


You now add the same mistakes you corrected in 1/2. Really - the same.

> +        reg-names:
> +          items:
> +            enum:
> +              - adg
> +              - ssiu
> +              - ssi
> +              - sdmc
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,rcar_sound-gen4
> +    then:
> +      properties:
> +        clock-names:
> +          description: List of necessary clock names.
> +          minItems: 3

maxItems

> +          items:
> +            enum:
> +              - ssi.0
> +              - ssiu.0
> +              - clkin
> +    else:

Best regards,
Krzysztof

