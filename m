Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0E81E6F4A
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 00:41:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C04017BC;
	Fri, 29 May 2020 00:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C04017BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590705671;
	bh=Jnk5ZM/t3QA0DK+QEBE25tXLtfv+NGFDuJM220R7+cQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EJgy4G0pxnhq6OIST7NRnV+clyASS+/NsevlWAjRYUE/IRPIIwV+3FkqCu5ZFFX/m
	 0x904gdVxN4G9iLbiDk/YG+6uEjQJpEYer1SeP4gl0noi9XSGkgqfXePLBMna0XqFl
	 gBQaYS1qIGUlAvEUI5VJIdBt3U06RNrIE1wmDFkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A345BF800E4;
	Fri, 29 May 2020 00:39:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8BD3F80150; Fri, 29 May 2020 00:39:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54D88F800E4
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 00:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54D88F800E4
Received: by mail-io1-f66.google.com with SMTP id q8so268387iow.7
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 15:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QywkqwL67CEWYAePg7QpYNEyzSKXdmv9SWfQghA1ISs=;
 b=mqkI+LWj+Dt3VHJDbgliWbBrcgClSpfdn+tHklhPLa7uCKqIY0fL+S7wWHDrlU6i1l
 aezp9Po5Y8KWmQMKUjhbX8FIPawACqqDyDKq/15Ota7f7aMDoBURTvaPP/T2TB2aCpUi
 BzGLwL5THlF0tfsw7IFN7514K8ZJazi7S5DO4Tm52BzTbBkM52VeKLal7IrA3qTnaiDl
 9Qo+94P8alYkEmqfYLqyreIdDQFUKOfL4aCzqwKQLA6pZaG5x1RxDQW18cC5KWdFIaN/
 1T35jQ8rmxahwjs0CCrciuMXY1iNdzp1plvpekQ8rzRJPkPEouwtxf5K9EIjruBW5JKB
 G/uw==
X-Gm-Message-State: AOAM530xU7MfuL5WrKvKvVqfoBPlvqdzHa23kU1AJL84I/qW9w8bDTPD
 4czcs33JkTvZ6IOh+ekDsw==
X-Google-Smtp-Source: ABdhPJxdT116KzRsm49ZPsxopPS2+Jbi/4nXkqdR1lWy+n/aC04YS4g5SEG70cyFhtdhbo/woYL/Gg==
X-Received: by 2002:a05:6602:1204:: with SMTP id
 y4mr4340823iot.44.1590705557992; 
 Thu, 28 May 2020 15:39:17 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id a17sm3708913ilr.68.2020.05.28.15.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 15:39:17 -0700 (PDT)
Received: (nullmailer pid 810372 invoked by uid 1000);
 Thu, 28 May 2020 22:39:16 -0000
Date: Thu, 28 May 2020 16:39:16 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: dt-bindings: simple-card: care missing address
 #address-cells
Message-ID: <20200528223916.GA804926@bogus>
References: <87pnay3ptb.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pnay3ptb.wl-kuninori.morimoto.gx@renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
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

On Thu, May 21, 2020 at 12:54:56PM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current simple-card will get below error,
> because it doesn't care about #address-cells at some part.
> 
> 	DTC     Documentation/devicetree/bindings/sound/simple-card.example.dt.yaml
> 	Documentation/devicetree/bindings/sound/simple-card.example.dts:171.46-173.15: \
> 		Warning (unit_address_vs_reg): /example-4/sound/simple-audio-card,cpu@0: \
> 		node has a unit name, but no reg or ranges property
> 	Documentation/devicetree/bindings/sound/simple-card.example.dts:175.37-177.15: \
> 		Warning (unit_address_vs_reg): /example-4/sound/simple-audio-card,cpu@1: \
> 		node has a unit name, but no reg or ranges property
> 	...
> 
> This patch fixup this issue.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/simple-card.yaml           | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index cb2bb5fac0e1..6c4c2c6d6d3c 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -208,6 +208,11 @@ patternProperties:
>        reg:
>          maxItems: 1
>  
> +      "#address-cells":
> +        const: 1
> +      "#size-cells":
> +        const: 0
> +
>        # common properties
>        frame-master:
>          $ref: "#/definitions/frame-master"
> @@ -288,7 +293,6 @@ examples:
>  
>          #address-cells = <1>;
>          #size-cells = <0>;
> -
>          simple-audio-card,dai-link@0 {		/* I2S - HDMI */
>              reg = <0>;
>              format = "i2s";
> @@ -392,11 +396,15 @@ examples:
>          simple-audio-card,routing = "ak4642 Playback", "DAI0 Playback",
>                                      "ak4642 Playback", "DAI1 Playback";
>  
> +        #address-cells = <1>;
> +        #size-cells = <0>;
>          dpcmcpu: simple-audio-card,cpu@0 {
> +            reg = <0>;

You need to add 'reg' to the schema. This isn't flagged because 
'additionalProperties: false' is missing there too. 

>              sound-dai = <&rcar_sound 0>;
>          };
>  
>          simple-audio-card,cpu@1 {
> +            reg = <1>;
>              sound-dai = <&rcar_sound 1>;
>          };
>  
> @@ -427,7 +435,12 @@ examples:
>              "pcm3168a Playback", "DAI3 Playback",
>              "pcm3168a Playback", "DAI4 Playback";
>  
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
>          simple-audio-card,dai-link@0 {
> +            reg = <0>;
> +
>              format = "left_j";
>              bitclock-master = <&sndcpu0>;
>              frame-master = <&sndcpu0>;
> @@ -441,22 +454,30 @@ examples:
>          };
>  
>          simple-audio-card,dai-link@1 {
> +            reg = <1>;
> +
>              format = "i2s";
>              bitclock-master = <&sndcpu1>;
>              frame-master = <&sndcpu1>;
>  
>              convert-channels = <8>; /* TDM Split */
>  
> +            #address-cells = <1>;
> +            #size-cells = <0>;
>              sndcpu1: cpu@0 {
> +                reg = <0>;
>                  sound-dai = <&rcar_sound 1>;
>              };
>              cpu@1 {
> +                reg = <1>;
>                  sound-dai = <&rcar_sound 2>;
>              };
>              cpu@2 {
> +                reg = <2>;
>                  sound-dai = <&rcar_sound 3>;
>              };
>              cpu@3 {
> +                reg = <3>;
>                  sound-dai = <&rcar_sound 4>;
>              };
>              codec {
> @@ -468,6 +489,8 @@ examples:
>          };
>  
>          simple-audio-card,dai-link@2 {
> +            reg = <2>;
> +
>              format = "i2s";
>              bitclock-master = <&sndcpu2>;
>              frame-master = <&sndcpu2>;
> -- 
> 2.17.1
> 
