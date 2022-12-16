Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8351664EEDD
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 17:21:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9108F16F5;
	Fri, 16 Dec 2022 17:20:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9108F16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671207672;
	bh=N2p5+YGgH883CBSBsIyKYSwIzxU4UMX+2Nx9Xto5il4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tshc0zqcrb7yYmgR6YMTjVKd63WlTF2zvQ7UHEObbQYxLWlokm2VPr4ngiSfkXhts
	 0pkNBHLhicOrr0W02e7+bD+44UOE3VTUIAMPycla/5vA4qVcDEMAC5jNuDT7goM7c6
	 +ZhUmKOR4NIwK0C9zBJc9lel8QUaV1TLfA1G0k5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62DFCF804F1;
	Fri, 16 Dec 2022 17:20:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D5CDF804D7; Fri, 16 Dec 2022 17:20:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A9EEF804D7
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 17:20:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A9EEF804D7
Received: by mail-oi1-f173.google.com with SMTP id e205so2318898oif.11
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 08:20:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZelV8/IrwGDd9k5t5InTYqYUs7Q48WynB8woEn0oJbw=;
 b=TyidhLFCdhPpACXePfaHhnczMXjTR8/bNu+EzN5XMKJbJOXv+Co4ez/THeVpkSeATP
 9PMh3Py3fMgUCyuavbiDM2k0NXsJ3GBzJkbtMI4Lie+JZn3pYXdf65mDE4ANVZWM+BQB
 jKsAChVnvU/vzPjEAVMZvpnLnGmqfopg+g1s1oKa4TKpWB1MqzY4o3o3poyzt+Q7te+W
 EPejIujhEgx3O4p/zxuoyRxVpeikvamV+gluWqXUl/Bc25JZA6+0+mKrz/f0DLuo7bkq
 CPW3i0S36gf/5OQJbllN4tvMHrWcdyQXp/N0Z1d3C4BSAtHcXDi2SHsXKBA2Mutea9WP
 H3nw==
X-Gm-Message-State: ANoB5plohPYYRD+yiIX8NlubgbVCT7jOWmoyXnXr5ff8pkV8BgeAJgKD
 qAywb4ewRncADCOODHz6sQ==
X-Google-Smtp-Source: AA0mqf7/bJA8XzYOPRoLT/re0sj7s/XaFvo72Gw5DfZ+W/H4jYfYtNf6U+9cU7vBUoHMjStMVeQYcw==
X-Received: by 2002:a05:6808:170b:b0:357:7558:d7c6 with SMTP id
 bc11-20020a056808170b00b003577558d7c6mr23318917oib.20.1671207615955; 
 Fri, 16 Dec 2022 08:20:15 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 11-20020aca090b000000b00360bf540072sm798033oij.0.2022.12.16.08.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 08:20:15 -0800 (PST)
Received: (nullmailer pid 2848741 invoked by uid 1000);
 Fri, 16 Dec 2022 16:20:14 -0000
Date: Fri, 16 Dec 2022 10:20:14 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 04/11] ASoC: dt-bindings: audio-graph-port: add clocks on
 endpoint
Message-ID: <20221216162014.GA2839409-robh@kernel.org>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
 <87pmcmpyml.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmcmpyml.wl-kuninori.morimoto.gx@renesas.com>
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

On Wed, Dec 14, 2022 at 01:22:58AM +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Audio Graph endpoint is possible to have clock, but it is
> missing its releated properties on audio-graph-port.
> It is already defined on simple-card.
> This patch adds it. Without this patch, we will get below warning
> 
> ${LINUX}/arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dtb: audio-codec@44: ports:port@0:endpoint: Unevaluated properties are not allowed ('clocks' was unexpected)
> 	From schema: ${LINUX}/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/audio-graph-port.yaml      | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 25f7204c7c4a..37c20cc8dc36 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -48,6 +48,15 @@ definitions:
>          oneOf:
>            - $ref: /schemas/types.yaml#/definitions/flag
>            - $ref: /schemas/types.yaml#/definitions/phandle
> +      clocks:
> +        description: Indicates system clock
> +        $ref: /schemas/types.yaml#/definitions/phandle

Is this the standard 'clocks' or you defined your own. Because 'clocks' 
is not a 'phandle'. It's a phandle+args.

I don't think we should have 'clocks' in endpoint nodes. Or at least we 
don't want to endorse more cases of it. The graph describes data 
connections. The only properties on endpoints are properties of that 
connection. An endpoint can't really consume a clock.

> +      system-clock-frequency:
> +        $ref: "simple-card.yaml#/definitions/system-clock-frequency"
> +      system-clock-direction-out:
> +        $ref: "simple-card.yaml#/definitions/system-clock-direction-out"
> +      system-clock-fixed:
> +        $ref: "simple-card.yaml#/definitions/system-clock-fixed"

We have standard clock bindings. Whatever you need here should use that 
instead.

>  
>        dai-format:
>          description: audio format.
> -- 
> 2.25.1
> 
> 
