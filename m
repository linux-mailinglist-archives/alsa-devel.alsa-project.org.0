Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF6F66E460
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 18:05:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C2976AD7;
	Tue, 17 Jan 2023 18:04:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C2976AD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673975145;
	bh=meTufIGrCwXtXLuAZ9hg3CJ40ka4qDaITDB+EUWNAG4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RzEuKJQtVmQC0KFo5LkTHijZWH6QVd302EdJVejYG1hvHSt3GbaxKZLSLYT7uavUZ
	 949QtfNEVsT4EPMH5Kdo/S9bLn+KiEoBkV36NuoSmHLWs+osXKbr4T/YAB26w3yDgn
	 QC6ODNKC4aVR6RX/If24pSwp6BTL8Rltt3ycfI7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8B26F80083;
	Tue, 17 Jan 2023 18:04:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90D38F8047B; Tue, 17 Jan 2023 18:04:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE73EF80083
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 18:04:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE73EF80083
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-142b72a728fso32598621fac.9
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 09:04:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O1NOHb8+nu+zYx4mxjmXXXdZFvqmNP0X7dlBHqnm0BQ=;
 b=tGp0fuTfytsYDuW++gjrmdYUJlfxDo+O1c0cD/HB4n2VMf5tNJzaqDEybTKB+BeHn3
 XvoDCpk3Bwa6gc/2k/NGbOY+5Y1QRwP8oZldAG22GrNN7hoFcRSdLb7ngCh6mFckvYwW
 OM7GyQbvMM2dxqk+z4BxDV4tO9zzLlDCqoB7ss/xzBLNRoGTJVYAC+/gPb8QoPq7KksY
 rkdGmv91pHdlCpue9s5MPJONVpo6MXi9hbOa4gwKBPJUjQy4rsMD+qbUEuJzwJUnqJZa
 ijUlq3Twbmavtk772aItvziXpmi1Qhrj+WRGJHrOhIEU/UlNpZLsapsucqOiiJ4WQeIl
 wocg==
X-Gm-Message-State: AFqh2kpSTCwFUITfgJQPhrZr4a2fiax5FBPbqMERA7GGiKsMTRybfsay
 ySVYqbiO1wQcI0D587SH8w==
X-Google-Smtp-Source: AMrXdXst7AkBNDxKvrdBelcXQ7R0QKqipV1QTofl1bzW+VXPgBTgX5inmaRNFjB18W58x4vx27DAHg==
X-Received: by 2002:a05:6870:ac8e:b0:15f:4c8:7892 with SMTP id
 ns14-20020a056870ac8e00b0015f04c87892mr2439937oab.26.1673975080773; 
 Tue, 17 Jan 2023 09:04:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f15-20020a056870548f00b0015f1024d322sm5286475oan.37.2023.01.17.09.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 09:04:40 -0800 (PST)
Received: (nullmailer pid 3244003 invoked by uid 1000);
 Tue, 17 Jan 2023 17:04:39 -0000
Date: Tue, 17 Jan 2023 11:04:39 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 02/10] ASoC: dt-bindings: audio-graph-port: add
 definitions/ports
Message-ID: <20230117170439.GA3225212-robh@kernel.org>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
 <87zgapho68.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zgapho68.wl-kuninori.morimoto.gx@renesas.com>
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
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 11, 2023 at 01:09:52AM +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Audio Graph user needs "ports" not only "port".
> This patch adds standard "ports" as definitions to use it easily.
> 
> If user needs standard "ports", it can use
> 
>    ports:
>      $ref: audio-graph-port.yaml#/definitions/ports
> 
> If user want to use custom ports, it can re-use
> audio-graph-port.yaml#/definitions/port-base"
> audio-graph-port.yaml#/definitions/endpoint-base"
> 
> https://lore.kernel.org/r/87sfhipynv.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/sound/audio-graph-port.yaml  | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index fa66b73abcaf2..6fcf7f567424d 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -97,6 +97,18 @@ definitions:
>                minimum: 1
>                maximum: 64
>  
> +  ports:
> +    $ref: "#/definitions/port-base"

This applies to 'port' nodes, but this is the 'ports' node.

For example, this schema says you can have endpoint nodes directly under 
'ports' which is not valid.

But why do you need this? The graph.yaml schema should be sufficient 
because you aren't adding custom properties in 'ports'. BTW, the 
preference is to only add properties in 'endpoint' nodes.

> +    unevaluatedProperties: false
> +    patternProperties:
> +      "^port(@[0-9a-f]+)?$":
> +        $ref: "#/definitions/port-base"
> +        unevaluatedProperties: false

If 'ports' schema is applied to a DT, then its 'port' node(s) cannot 
have any additional properties. That defeats the point of patch 1.

You cannot have 2 schemas with child nodes and be able to extend the 
properties on the child nodes. The 2 child node schemas can't 'see' each 
other in that case. In these cases, the base child node schema has to be 
referenced directly by the extended child node schema.


> +        patternProperties:
> +          "^endpoint(@[0-9a-f]+)?":
> +            $ref: "#/definitions/endpoint-base"
> +            unevaluatedProperties: false

The same thing applies here.

Rob
