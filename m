Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B15574D9B4
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 17:21:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62CB43E7;
	Mon, 10 Jul 2023 17:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62CB43E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689002459;
	bh=y3Qja2tZEdI5pJFpK+5UFa1z3KU+jRanN4lE0QsT3Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UI0q2SV3ioyfJu29ahgmbP/LLhXtB/FtyGLUG+IJ6plPL7kQ++gCMs3RuIvgRVisB
	 E4061ro2imzz6TyTKR9kL4/Jn6LfDwRj3yxSJ+DJ0aUXf6DshIWIbDLbgGhSbniW9i
	 eTom6PHpfp0R5H0y6WgyKL2vzrTMA8jYhX3Od2e8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC17DF80535; Mon, 10 Jul 2023 17:20:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 798F4F80153;
	Mon, 10 Jul 2023 17:20:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E150F80249; Mon, 10 Jul 2023 17:20:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84AD1F800E4
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 17:19:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84AD1F800E4
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3460815fde5so24296285ab.2
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Jul 2023 08:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689002398; x=1691594398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKBJSWYguobSqgw2ST9rUfCndiuxEmDCw91JSLUKizE=;
        b=L1+Cimbi4IwiSHfoKUCcXqA1ScrE1iMWyVccQwTXH6smalCaiSSiq4p+nEqoQUURgy
         JM+6XHT+2CBE43LRNZ/ruji6EMJDWpeOjThAwdrm62v+DkI7dpL6v5Akr69CqQ2i0MkX
         8RmvV9l7+DxiTg5m2JEQ9EogYvRvxUjRpAQHrUmJbwctBPWTSY1FSGscNZEYdflf2Zh8
         JaaZWgWo7TjyXyP3BOi9OKdRYo5hec+z/2ifgLRJ9O3lSKvxUubtz7mAI2eOfzjurqpk
         OztwDxH/ZyZO59m9Freau8Okv5AasVGFdbwuncUUpRyIK3652Ir2g0I2VbPy1LPO1qbX
         mK9g==
X-Gm-Message-State: ABy/qLYjiH/IyNyXRoiu0Ysrq8iHSWTOZVyUVVJItxXCrtf4oB/8UUwF
	ZcFySpqAUGQOv0+0xm81uA==
X-Google-Smtp-Source: 
 APBJJlHCigiMWQeoAZDBI7Y7BWxmtnDvCocoeswLmvtyKWBi4JZzDcEG6CBraMQsGMR2hpJWkdatbw==
X-Received: by 2002:a92:c6c8:0:b0:345:83d6:6020 with SMTP id
 v8-20020a92c6c8000000b0034583d66020mr13161811ilm.21.1689002398238;
        Mon, 10 Jul 2023 08:19:58 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 gv7-20020a0566382e4700b0042bb03d3a2esm1218309jab.96.2023.07.10.08.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 08:19:57 -0700 (PDT)
Received: (nullmailer pid 1997035 invoked by uid 1000);
	Mon, 10 Jul 2023 15:19:56 -0000
Date: Mon, 10 Jul 2023 09:19:56 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?utf-8?B?IkFtYWRldXN6IFPFgmF3acWEc2tpIg==?=
 <amadeuszx.slawinski@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 14/15] ASoC: dt-bindings: renesas,rsnd.yaml: add
 common port-def
Message-ID: <20230710151956.GA1992791-robh@kernel.org>
References: <87mt04o96f.wl-kuninori.morimoto.gx@renesas.com>
 <87351wo921.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87351wo921.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: RYHNFR4ZCJ7LRERS5HV532MYRNKEFBEH
X-Message-ID-Hash: RYHNFR4ZCJ7LRERS5HV532MYRNKEFBEH
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYHNFR4ZCJ7LRERS5HV532MYRNKEFBEH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 10, 2023 at 10:21:42AM +0900, Kuninori Morimoto wrote:
> renesas,rsnd uses both "ports" has "port", and these are very similar.
> To avoid duplicated definitions, this patch adds common port-def.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/renesas,rsnd.yaml          | 38 ++++++++-----------
>  1 file changed, 16 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index 8a821dec9526..d9808b130e8d 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -9,6 +9,20 @@ title: Renesas R-Car Sound Driver
>  maintainers:
>    - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>  
> +definitions:

$defs

> +  port-def:
> +    $ref: audio-graph-port.yaml#/definitions/port-base
> +    unevaluatedProperties: false
> +    patternProperties:
> +      "^endpoint(@[0-9a-f]+)?":
> +        $ref: audio-graph-port.yaml#/definitions/endpoint-base
> +        properties:
> +          playback:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +          capture:
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +        unevaluatedProperties: false
> +
>  properties:
>  
>    compatible:
> @@ -108,30 +122,10 @@ properties:
>      unevaluatedProperties: false
>      patternProperties:
>        '^port(@[0-9a-f]+)?$':
> -        $ref: audio-graph-port.yaml#/definitions/port-base
> -        unevaluatedProperties: false
> -        patternProperties:
> -          "^endpoint(@[0-9a-f]+)?":
> -            $ref: audio-graph-port.yaml#/definitions/endpoint-base
> -            properties:
> -              playback:
> -                $ref: /schemas/types.yaml#/definitions/phandle-array
> -              capture:
> -                $ref: /schemas/types.yaml#/definitions/phandle-array
> -            unevaluatedProperties: false
> +        $ref: "#/definitions/port-def"
>  
>    port:
> -    $ref: audio-graph-port.yaml#/definitions/port-base
> -    unevaluatedProperties: false
> -    patternProperties:
> -      "^endpoint(@[0-9a-f]+)?":
> -        $ref: audio-graph-port.yaml#/definitions/endpoint-base
> -        properties:
> -          playback:
> -            $ref: /schemas/types.yaml#/definitions/phandle-array
> -          capture:
> -            $ref: /schemas/types.yaml#/definitions/phandle-array
> -        unevaluatedProperties: false
> +    $ref: "#/definitions/port-def"

It would be better if users just always used "ports { port {}; };" even 
in the single port case.

>  
>    rcar_sound,dvc:
>      description: DVC subnode.
> -- 
> 2.25.1
> 
