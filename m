Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC8A6BD262
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 15:29:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8486E10E8;
	Thu, 16 Mar 2023 15:28:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8486E10E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678976954;
	bh=c6Cjqo9wISg6oonMJu5wpCX//5UFCok8TqkSyd+nXKo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G3sJq+rsnBPPlIP8AAoGLizN9tR7TDUvxU6XQJRQOUHhGi24T4/eIhtE4bupajB98
	 stEpp19tg0Y6PGKyBl1dCnbJBA69q5HtVXGBrZmpTolF7BQ4s8vas6UH9RZ7gDzizw
	 L8PFeJIH2aKqe/n29wUZGqvo2xXk+P12o1fuht0E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9208F80272;
	Thu, 16 Mar 2023 15:28:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22E11F80423; Thu, 16 Mar 2023 15:28:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D60C1F800C9
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 15:28:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D60C1F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hE4Pctc0
Received: by mail-lf1-x133.google.com with SMTP id x17so2622174lfu.5
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Mar 2023 07:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678976890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it9aeYnxGWWMKUhD9kMlVYQPDO4LCr+X6cTL/NBM1V4=;
        b=hE4Pctc0UoYOjpdhHgG5gbMpADrAfdnujllgPy6IWkgw+aRdZx5fqDWts1+ljbkXWd
         YvRZ3n+5UY7QlSakRpf27TQ45XNwTPf2GKtIiLzxMkEK0ASd4KzpKZNjzpg4XAOAVDkh
         Pa0cQBza0mQYPgg5k5h+z5MPeS/3eSJufeztf+ZMASiNWHCPtUpjihODmjUft7wSYUbx
         FZBcH8yQiTsr414Kh2cfVQ/5bzucKCWWhjcyv4zvv/YDl5CFJAiFyveTJFXZJ3KGL0Uw
         wzkSRy0VCgoK4BL9fVSKSrdfvfmnzExdzCAtZmJZQiLU7MxrHzW3aZyKvNyKGOvKEG2r
         pK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678976890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=it9aeYnxGWWMKUhD9kMlVYQPDO4LCr+X6cTL/NBM1V4=;
        b=WcGmrKk7hacU2lEEPb0EQ/JZtP7i8yalltCbbXBoI4jx4hON8f4WUWxsW8HLqbcc9m
         0eCiRnpIlbKiGbjftah5dlOV0s+083bc/kTpliY5CFj71J71n1z++S/KTaqcA7XpzD/H
         xcUvSplLtfznrJYfrVQ9EB2HVMqmVWgP3DdYg/XNqQ7td1LVWM9uZQ1Jn7NHDFmKitZF
         spcgSfq5fxlHS+cZh3qKff+PrFzd7QSQcDeboT8r16Jg22OECvcWqXcVS+zJ4Da+Mci0
         asdDbQadZ2ThK5wmTVf+/vDs3ZyvjZLuUdRyyK/zrivtUygAUQfFk4hoLchlbD2aYBXm
         +img==
X-Gm-Message-State: AO0yUKWiEWTvhRZUwUFguKe4mWHXy6Zxh/OwijpaZC3Vy1/9zLsY8BzE
	8xtUaUDKQvlGD4m6XK8LfuY=
X-Google-Smtp-Source: 
 AK7set+uUKMPZ7JADhmNhaXXZqPitHdtc8HwflwyErfYhlV309mrVwgb3leFUbuXWa1cpJaIJubuQw==
X-Received: by 2002:a05:6512:3769:b0:4e8:5e39:6234 with SMTP id
 z9-20020a056512376900b004e85e396234mr1762176lft.16.1678976889708;
        Thu, 16 Mar 2023 07:28:09 -0700 (PDT)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id
 u5-20020a056512094500b004cafa2bfb7dsm1241553lft.133.2023.03.16.07.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 07:28:09 -0700 (PDT)
Message-ID: <b2810924-169d-0bad-8f20-6ec2e683d170@gmail.com>
Date: Thu, 16 Mar 2023 15:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car
 Gen4 support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
 <87sffa8g99.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <87sffa8g99.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 45P3LHPSGUOIR6I57SFOGUP3JETIFIJY
X-Message-ID-Hash: 45P3LHPSGUOIR6I57SFOGUP3JETIFIJY
X-MailFrom: zajec5@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/45P3LHPSGUOIR6I57SFOGUP3JETIFIJY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13.02.2023 03:13, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> There are no compatible for "reg/reg-names" and "clock-name"
> between previous R-Car series and R-Car Gen4.
> 
> "reg/reg-names" needs 3 categorize (for Gen1, for Gen2/Gen3, for Gen4),
> therefore, use 3 if-then to avoid nested if-then-else.
> 
> Move "clock-name" detail properties to under allOf to use if-then-else
> for Gen4 or others.

Hi, this patch seems to add errors for me. Are my tools outdated or is
it a real issue? See below.


> Link: https://lore.kernel.org/all/87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com/#r
> Link: https://lore.kernel.org/all/87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com/#r
> Link: https://lore.kernel.org/all/87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com/#r
> Link: https://lore.kernel.org/all/87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com/#r
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   .../bindings/sound/renesas,rsnd.yaml          | 76 ++++++++++++++++---
>   1 file changed, 64 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index 12ccf29338d9..55e5213b90a1 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -101,17 +101,7 @@ properties:
>   
>     clock-names:
>       description: List of necessary clock names.
> -    minItems: 1
> -    maxItems: 31
> -    items:
> -      oneOf:
> -        - const: ssi-all
> -        - pattern: '^ssi\.[0-9]$'
> -        - pattern: '^src\.[0-9]$'
> -        - pattern: '^mix\.[0-1]$'
> -        - pattern: '^ctu\.[0-1]$'
> -        - pattern: '^dvc\.[0-1]$'
> -        - pattern: '^clk_(a|b|c|i)$'
> +    # details are defined below
>   
>     ports:
>       $ref: audio-graph-port.yaml#/definitions/port-base
> @@ -288,6 +278,11 @@ required:
>   
>   allOf:
>     - $ref: dai-common.yaml#
> +
> +  #--------------------
> +  # reg/reg-names
> +  #--------------------
> +  # for Gen1

This seems to cause:

./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:282:4: [error] missing starting space in comment (comments)
./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:284:4: [error] missing starting space in comment (comments)
./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:339:4: [error] missing starting space in comment (comments)
./Documentation/devicetree/bindings/sound/renesas,rsnd.yaml:341:4: [error] missing starting space in comment (comments)


>     - if:
>         properties:
>           compatible:
> @@ -303,7 +298,15 @@ allOf:
>                 - scu
>                 - ssi
>                 - adg
> -    else:
> +  # for Gen2/Gen3
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,rcar_sound-gen2
> +              - renesas,rcar_sound-gen3
> +    then:
>         properties:
>           reg:
>             minItems: 5
> @@ -315,6 +318,55 @@ allOf:
>                 - ssiu
>                 - ssi
>                 - audmapp
> +  # for Gen4
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,rcar_sound-gen4
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 4
> +        reg-names:
> +          items:
> +            enum:
> +              - adg
> +              - ssiu
> +              - ssi
> +              - sdmc
> +
> +  #--------------------
> +  # clock-names
> +  #--------------------
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,rcar_sound-gen4
> +    then:
> +      properties:
> +        clock-names:
> +          maxItems: 3
> +          items:
> +            enum:
> +              - ssi.0
> +              - ssiu.0
> +              - clkin
> +    else:
> +      properties:
> +        clock-names:
> +          minItems: 1
> +          maxItems: 31
> +          items:
> +            oneOf:
> +              - const: ssi-all
> +              - pattern: '^ssi\.[0-9]$'
> +              - pattern: '^src\.[0-9]$'
> +              - pattern: '^mix\.[0-1]$'
> +              - pattern: '^ctu\.[0-1]$'
> +              - pattern: '^dvc\.[0-1]$'
> +              - pattern: '^clk_(a|b|c|i)$'
>   
>   unevaluatedProperties: false
>   

