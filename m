Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 093AD64EF3C
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 17:34:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F9FB16FF;
	Fri, 16 Dec 2022 17:33:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F9FB16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671208481;
	bh=3U9MijwPMjs7Tfj5Ham7kzzyRfehVPhXuYVYSqNirvA=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=vCZfBgF94i8evPd7wQSh/95CORsBETJ0tPKq4V51M3AeqDAG8AQx7/LjiBjAJ7NoO
	 YzAYS9/rpwc2bryMHjbEi5IvF6qrodHFYH41cwmHmr+f4+I6PtRz6yBH+SU3IeYglQ
	 OsMW07b9P6c70mkbz4xQ/5bg5kuOb+6h4R1bYCkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BDC3F804E7;
	Fri, 16 Dec 2022 17:33:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58294F804E2; Fri, 16 Dec 2022 17:33:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ADEDF804D0
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 17:33:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ADEDF804D0
Received: by mail-oi1-f179.google.com with SMTP id r130so2395329oih.2
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 08:33:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WdpQJXPwUnb7fStkLNmeiXBz/MV3q7NoGJn3vpIa2Uk=;
 b=nPzoiliNrZsWEGUzotK5TweBVMMxSDj791c7O0XTjjeD3cx7YJgJj28UQTLJQaH8gg
 qwjK4ljjJDQ7A2ol5S0zpGG/TY4twn4J4gOFWgB3gSwX7yKduUOaNcn3tF3d+kbG/UXG
 EL/J65pVc4l5FCbhGRs6/4uIYxnGspgoXkWAlE6PgO4oCcdyeQxuQDvO/BCnHsGqCXRl
 EyUas51ltLC1YKCxAe9Xs6fVitXQfbEWBFWltfQ9jlL5XVfC6S8ORlQElptv+KAQzGAB
 Cn6BULSa77klvPv927Y/ePFL/fSrmsvplHz7W0qg/2/RJTvAoklgI+mbc1oFfVDQW1x/
 p2dQ==
X-Gm-Message-State: ANoB5pmwnB2CPryIYi9SyPVJuJaq4cAszSG6md7FH0p50q7r0Uy2I4gs
 HhOqgrOKWTT0uxateJUxCg==
X-Google-Smtp-Source: AA0mqf4tDeiIyYogKgvG5t14pw04hopCs2LWM+XFiXAzuvkeZRnDzAD8mzS7NAAAMyY6h/jtcy/Eaw==
X-Received: by 2002:a54:4e99:0:b0:35a:1e78:dbe5 with SMTP id
 c25-20020a544e99000000b0035a1e78dbe5mr14379242oiy.55.1671208415753; 
 Fri, 16 Dec 2022 08:33:35 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n206-20020aca59d7000000b00354932bae03sm895871oib.10.2022.12.16.08.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 08:33:35 -0800 (PST)
Received: (nullmailer pid 2862892 invoked by uid 1000);
 Fri, 16 Dec 2022 16:33:34 -0000
Date: Fri, 16 Dec 2022 10:33:34 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 02/11] ASoC: dt-bindings: audio-graph-port: add
 definitions/ports
Message-ID: <20221216163334.GB2839409-robh@kernel.org>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
 <87sfhipynv.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sfhipynv.wl-kuninori.morimoto.gx@renesas.com>
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sameer Pujar <spujar@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Dec 14, 2022 at 01:22:13AM +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Audio Graph user needs "ports" not only "port".
> This patch adds new "ports" on audio-graph-port to use it easily.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/audio-graph-port.yaml  | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 56d47dcab490..273da5a76b8a 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -97,6 +97,18 @@ definitions:
>                minimum: 1
>                maximum: 64
>  
> +  ports:
> +    $ref: "#/definitions/port-base"
> +    unevaluatedProperties: false
> +    patternProperties:
> +      "^port(@[0-9a-f]+)?$":
> +        $ref: "#/definitions/port-base"
> +        unevaluatedProperties: false
> +        patternProperties:
> +          "^endpoint(@[0-9a-f]+)?":
> +            $ref: "#/definitions/endpoint-base"
> +            unevaluatedProperties: false
> +

This won't work because any user that uses 'ports' here cannot add any 
properties to port or endpoint nodes which I thought was the point of 
this series.

Rob
