Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ABA74D9D9
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 17:25:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC439201;
	Mon, 10 Jul 2023 17:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC439201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689002704;
	bh=doEGXCzGELXBjhlHMMHj2D10kVYrjVBiIyTRpTAKujA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nX9e5uhgScLk5hmcgt/nXKWs4Jk+JLmiOJkv/TJeA4sITnhTxivlWkjH9ZKu8FokQ
	 /oVLGIFVDVFXoMIRorucEyPcNobAbNlM1JlCE9txRfuAICSqCxzvETSo23xM3Ff52o
	 Oy9YLTg2Pje5juGyZ+S1Upzsa7YXydP6ug/qxFyk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99B32F80544; Mon, 10 Jul 2023 17:23:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29C98F80153;
	Mon, 10 Jul 2023 17:23:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79A31F80249; Mon, 10 Jul 2023 17:23:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4720BF80093
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 17:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4720BF80093
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-78666f06691so146966839f.0
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Jul 2023 08:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689002625; x=1691594625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgntDtiN/HaSOPUrDKiRPniiMg0bi29a5uBEmLG2Jvc=;
        b=dKicTRwckYnWzzw9aafaTpEs4pHGgkY1s93K8fjltZfRZ8e8jnYdETx2yEAcmaGOOt
         2aF1AQEygtDPT4fRYnd43E+Ovx6i3xYdhFEHMMGVdYpyEIu76fsN4/RQclTunr3qVt1+
         /e9TpK++FRGXl1oRQibH6O4p/BQ+d6axkwyA1JWV4EMa8Uy6Ko+rFcXodnHhkDK934jA
         736I7T512Nyxx9raRo95VfctlG49sVMthFVjj3oT6pHVPBzbxX1yWyf+iXFP5Rmqrq4g
         NufUqohN375vKi61SSORTTl6yFKG5gggNn1CYzilv5ulxEmh5utvY/GzwTMKEXF04dyT
         VDdw==
X-Gm-Message-State: ABy/qLYtMBDnU+yOC1isje+8NQl5U5HXYS1t98w3yT2NJ+MtM8vPSZoy
	p6SgUUjsZQWF3fkP2YsXZQ==
X-Google-Smtp-Source: 
 APBJJlEIrl+JxrkL+m7AoCnXnNiZ/7i1ohm2Fy0z/ryA9efk1SBhej0LHDNHSpv/cn6JwOv2F1V8Pg==
X-Received: by 2002:a6b:5903:0:b0:786:e612:72f8 with SMTP id
 n3-20020a6b5903000000b00786e61272f8mr8371903iob.21.1689002625063;
        Mon, 10 Jul 2023 08:23:45 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 f7-20020a056638022700b0042b1cd4c096sm3204527jaq.74.2023.07.10.08.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 08:23:44 -0700 (PDT)
Received: (nullmailer pid 2002022 invoked by uid 1000);
	Mon, 10 Jul 2023 15:23:42 -0000
Date: Mon, 10 Jul 2023 09:23:42 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?utf-8?B?IkFtYWRldXN6IFPFgmF3acWEc2tpIg==?=
 <amadeuszx.slawinski@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 15/15] ASoC: dt-bindings: renesas,rsnd.yaml: enable
 multi ports for multi Component support
Message-ID: <20230710152342.GA1997421-robh@kernel.org>
References: <87mt04o96f.wl-kuninori.morimoto.gx@renesas.com>
 <871qhgo91l.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qhgo91l.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: M4HQCQ2D6WVVOM3UGK3WIQOUKPDDCYN3
X-Message-ID-Hash: M4HQCQ2D6WVVOM3UGK3WIQOUKPDDCYN3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4HQCQ2D6WVVOM3UGK3WIQOUKPDDCYN3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 10, 2023 at 10:21:58AM +0900, Kuninori Morimoto wrote:
> To enable multi Component support, "multi ports" is needed for Audio Graph
> Card/Card2, and "multi rcar_sound,dai" is needed for Simple Audio Card.
> This patch enable these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/renesas,rsnd.yaml          | 24 ++++++++++++-------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index d9808b130e8d..13a5a0a10fe6 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -91,6 +91,12 @@ properties:
>        it must be 1 if your system has audio_clkout0/1/2/3
>      enum: [0, 1]
>  
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
>    clock-frequency:
>      description: for audio_clkout0/1/2/3
>  
> @@ -117,13 +123,7 @@ properties:
>      description: List of necessary clock names.
>      # details are defined below
>  
> -  ports:
> -    $ref: audio-graph-port.yaml#/definitions/port-base
> -    unevaluatedProperties: false
> -    patternProperties:
> -      '^port(@[0-9a-f]+)?$':
> -        $ref: "#/definitions/port-def"
> -
> +  # ports is below
>    port:
>      $ref: "#/definitions/port-def"
>  
> @@ -242,8 +242,9 @@ properties:
>            - interrupts
>      additionalProperties: false
>  
> +patternProperties:
>    # For DAI base
> -  rcar_sound,dai:
> +  'rcar_sound,dai(@[0-9a-f]+)?$':

With a unit-address you need a 'reg' property.

>      description: DAI subnode.
>      type: object
>      patternProperties:
> @@ -263,6 +264,13 @@ properties:
>                - capture
>      additionalProperties: false
>  
> +  'ports(@[0-9a-f]+)?$':

Multiple 'ports' nodes is not valid.

Here too would need a 'reg' property. Did you test any of this because 
that would be a dtc warning.

> +    $ref: audio-graph-port.yaml#/definitions/port-base
> +    unevaluatedProperties: false
> +    patternProperties:
> +      '^port(@[0-9a-f]+)?$':
> +        $ref: "#/definitions/port-def"
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.25.1
> 
