Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B18D4D2603
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 02:22:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 829DF1733;
	Wed,  9 Mar 2022 02:21:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 829DF1733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646788922;
	bh=/jbJOAaHHXrJyov946KqKW97l1Nt4J1/Qvm4XlD9z0k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=szF9ISsfXbvo2sT6TKCskGm0Uywmh+OQFLVf//U7cGh84ZRQBWduNJCa15SypokFI
	 wDD7zfnQ+U1cPHWnvkfbO3INKZqdvNJK0b5dOFfh53q+Nfp90rSYVXtI2wEWHSbiNE
	 kRpfQV4Z6QAYUzv5twmQTjM0wYXyO2dBJdD9XOho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5969F8026D;
	Wed,  9 Mar 2022 02:20:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63429F8026A; Wed,  9 Mar 2022 02:20:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AE11F80121
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 02:20:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AE11F80121
Received: by mail-oo1-f50.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so1111821oos.9
 for <alsa-devel@alsa-project.org>; Tue, 08 Mar 2022 17:20:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eX/AjvgUx7dimDDaqYJ1aR1sSqjm7p16ve0NHEEsMvQ=;
 b=YVYcd1w7TprsrCCsg46z7gPBxiN0aYu07J5X7+tlkIzINAxd78gOOvgMEQxgSo/7u9
 Wv2P4HUa4y5mmFoDLua77vaMh2grip20s42ns15LONc1r0vQNEQEYl1JrZRDAx3PW+Se
 H6n9efbd11rGBYjpe1oQB0jm4pjk+2Az0GyisWNISFftb94Xyiqr98bP9ygJrV4dvvIH
 LdPJ5tIYoWqG7YF6gETmDQnJ8dVDejieWrb3S55p0Gik9mF6T6l97bi+U80v1px5hHsg
 dlFn5fKdin448lPhon/f4dr35dSe7ZHefG0lyunMTs/imzZc4EWCMgvINVRPFII7vXgK
 RRyA==
X-Gm-Message-State: AOAM531D4Yt+vrgp2kXSdGWOAgMwGgWt1AA0prJDzyO7i4s25n4HzMyN
 jGqq7T6H9n+OIsHbFTmOlw==
X-Google-Smtp-Source: ABdhPJyozRXy0py67UpvosCIVPTHDhRZ/ISthdID0JeEIDiUNQKdIMRBpJnzpj2yaajNnIL0DActgw==
X-Received: by 2002:a05:6870:32ce:b0:d9:a0ee:44b3 with SMTP id
 r14-20020a05687032ce00b000d9a0ee44b3mr4390721oac.142.1646788845214; 
 Tue, 08 Mar 2022 17:20:45 -0800 (PST)
Received: from rob (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.gmail.com with ESMTPSA id
 z192-20020a4a49c9000000b003213bf4bf0csm235322ooa.31.2022.03.08.17.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 17:20:44 -0800 (PST)
Received: (nullmailer pid 1709815 invoked by uid 1000);
 Wed, 09 Mar 2022 01:20:43 -0000
Date: Tue, 8 Mar 2022 18:20:43 -0700
From: Rob Herring <robh@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH v3 15/16] ASoC: dt-bindings: cs35l41: Document CS35l41
 External Boost
Message-ID: <20220309012043.GA1694603@robh.at.kernel.org>
References: <20220308171730.454587-1-tanureal@opensource.cirrus.com>
 <20220308171730.454587-16-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308171730.454587-16-tanureal@opensource.cirrus.com>
Cc: David Rhodes <drhodes@opensource.cirrus.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Tue, Mar 08, 2022 at 05:17:29PM +0000, Lucas Tanure wrote:
> From: David Rhodes <drhodes@opensource.cirrus.com>
> 
> Document internal and external boost feature for ASoC CS35L41.
> For internal boost the following properties are required:
> - cirrus,boost-peak-milliamp
> - cirrus,boost-ind-nanohenry
> - cirrus,boost-cap-microfarad
> 
> For external boost, the GPIO1 must be configured as output,
> so the following properties are required:
> - cirrus,gpio1-src-select = <1>
> - cirrus,gpio1-output-enable
> 
> Signed-off-by: David Rhodes <drhodes@opensource.cirrus.com>
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---
>  .../bindings/sound/cirrus,cs35l41.yaml        | 44 +++++++++++++++++--
>  1 file changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
> index 3235702ce402..09b515924c59 100644
> --- a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
> @@ -75,6 +75,19 @@ properties:
>      maximum: 3
>      default: 2
>  
> +  cirrus,boost-type:
> +    description:
> +      Configures the type of Boost being used.
> +      Internal boost requires boost-peak-milliamp, boost-ind-nanohenry and
> +      boost-cap-microfarad.
> +      External Boost must have GPIO1 as GPIO output. GPIO1 will be set high to
> +      enable boost voltage.
> +      0 = Internal Boost
> +      1 = External Boost
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    minimum: 0
> +    maximum: 1

What does not present mean? Might be better to make this boolean depending
on what you are trying to accomplish.

> +
>    cirrus,gpio1-polarity-invert:
>      description:
>        Boolean which specifies whether the GPIO1
> @@ -131,9 +144,32 @@ required:
>    - compatible
>    - reg
>    - "#sound-dai-cells"
> -  - cirrus,boost-peak-milliamp
> -  - cirrus,boost-ind-nanohenry
> -  - cirrus,boost-cap-microfarad
> +
> +allOf:
> +  - if:
> +      properties:
> +        cirrus,boost-type:
> +            const: 0

Note that this will be true if cirrus,boost-type is not present. You 
probably want to add 'required'.

> +    then:
> +      required:
> +        - cirrus,boost-peak-milliamp
> +        - cirrus,boost-ind-nanohenry
> +        - cirrus,boost-cap-microfarad
> +    else:
> +      if:
> +        properties:
> +          cirrus,boost-type:
> +            const: 1
> +      then:
> +        required:
> +          - cirrus,gpio1-output-enable
> +          - cirrus,gpio1-src-select
> +        properties:
> +          cirrus,boost-peak-milliamp: false
> +          cirrus,boost-ind-nanohenry: false
> +          cirrus,boost-cap-microfarad: false
> +          cirrus,gpio1-src-select:
> +            enum: [1]
>  
>  additionalProperties: false
>  
> @@ -150,6 +186,8 @@ examples:
>            VA-supply = <&dummy_vreg>;
>            VP-supply = <&dummy_vreg>;
>            reset-gpios = <&gpio 110 0>;
> +
> +          cirrus,boost-type = <0>;
>            cirrus,boost-peak-milliamp = <4500>;
>            cirrus,boost-ind-nanohenry = <1000>;
>            cirrus,boost-cap-microfarad = <15>;
> -- 
> 2.35.1
> 
> 
