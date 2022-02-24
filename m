Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DAD4C3888
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 23:12:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EA9B1914;
	Thu, 24 Feb 2022 23:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EA9B1914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645740734;
	bh=8ow+wmCJuqfgcbP9qOk/LgaL1DGb/kYpUEP42yl8fSE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C2PEpwuzNsKEldVBYFk+ldcCXYWZnxhn5Du11NjHMKAk5BeDw213PfXm6gm1Pq9CV
	 68zKanwbsNS5Sxas5cvsQVHSRQ6Q2QVTC4PaQ8HXOU4902lBF8/uL+KZA6Z8olEAT2
	 +aIR4ISKPSWvJILTHZPJOH+kxLnaJlnCq8z4r2vE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84EF0F80310;
	Thu, 24 Feb 2022 23:11:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8B5FF80118; Thu, 24 Feb 2022 23:11:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CC40F80118
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 23:10:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CC40F80118
Received: by mail-oi1-f177.google.com with SMTP id y7so5346457oih.5
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 14:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7jPRav2CBDz3bnsE92/TjinGeDQiDfreC+VSHQD3Hp4=;
 b=tOvCQKLWT9rC9uNY6mX8X2CPH+cZsJmGjaEOtzC2OsHuhZLc1J9TEaVIeeym5GJVxD
 LflPtePAgSPHxHnb0jrXwiurHYJzUit3BaXTEEP11sC3uyoCCe7uBWtTUJrwiScf/Uqg
 AyoZg8Rsalvh2NI5ytpANDrRviDwopbfA8dh85rksyqK/G9db5XlkBnQ8BkqQuJ3KG8e
 EOtc8uhBrGWOEUIA2kpZlkD0XXVq1NXhCL+B13Mqmya2JRQ07pZrAgAZljt93qKaikdn
 1cqs4zNb5/PLVF3vOSdifCdBeNj1MgttqoyjZudx2NH5cu5EbnebPZ6buaTH0HfktCJr
 +Vqg==
X-Gm-Message-State: AOAM530/rPI05SiFgSDN3Lh7t9jfi30T/v2yD3o/kOiKGzdeow+mRSKL
 zUvKtB5PGO4/fA94C0PkBw==
X-Google-Smtp-Source: ABdhPJznW56jFcCUmuEQYwGk6nU6rHrA/vbhYqbxHRVKPXvFamDlaVIiItC6QsjgrLyazIV5oHQaxw==
X-Received: by 2002:a05:6808:bc9:b0:2d7:3078:d98d with SMTP id
 o9-20020a0568080bc900b002d73078d98dmr127686oik.196.1645740654999; 
 Thu, 24 Feb 2022 14:10:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 bl26-20020a056808309a00b002d4f48e3799sm464399oib.12.2022.02.24.14.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 14:10:53 -0800 (PST)
Received: (nullmailer pid 3679049 invoked by uid 1000);
 Thu, 24 Feb 2022 22:10:53 -0000
Date: Thu, 24 Feb 2022 16:10:52 -0600
From: Rob Herring <robh@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH V2 1/2] ASoC: dt-bindings: audio-graph-port: Add
 dai-tdm-slot-width-map
Message-ID: <YhgCbKzfPXEVauwW@robh.at.kernel.org>
References: <20220217134835.282389-1-rf@opensource.cirrus.com>
 <20220217134835.282389-2-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217134835.282389-2-rf@opensource.cirrus.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org
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

On Thu, Feb 17, 2022 at 01:48:34PM +0000, Richard Fitzgerald wrote:
> Some audio hardware cannot support a fixed slot width or a slot width
> equal to the sample width in all cases. This is usually due either to
> limitations of the audio serial port or system clocking restrictions.
> 
> This property allows setting a mapping of sample widths and the
> corresponding tdm slot widths.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  .../devicetree/bindings/sound/audio-graph-port.yaml        | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> index 476dcb49ece6..420adad49382 100644
> --- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
> @@ -71,4 +71,11 @@ patternProperties:
>          description: CPU to Codec rate channels.
>          $ref: /schemas/types.yaml#/definitions/uint32
>  
> +      dai-tdm-slot-width-map:
> +        description: Mapping of sample widths to slot widths. For hardware that
> +          cannot support a fixed slot width or a slot width equal to sample

A variable slot width sounds like a feature, not a limitation.

> +          width. An array containing one or more pairs of values. Each pair
> +          of values is a sample_width and the corresponding slot_width.

That sounds like a matrix, not an array. N entries of 2 cells each. 

> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +

I'd think there are some constraints on the values? Slots should be at 
least 8 bits, right? A max of 2x32 bits or is there more 
than stereo within a slot? In any case, it's for sure no where near 2^32 
max.

Is there a need for specifying where in the slot the data is?

Rob
