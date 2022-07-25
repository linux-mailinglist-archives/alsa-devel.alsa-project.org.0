Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DE05807DA
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 00:53:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE1B620B;
	Tue, 26 Jul 2022 00:52:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE1B620B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658789630;
	bh=p8+oRkXv2qUOcH3PnUBIr8KqqnZXHAfVVPG7bk6ri6k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GG2Yu4FBOEcw+oEwnmmqRm3Btz/H2IvwpFStsRjxl/ejyAtpfPTzo/UGFLYDrm2Xe
	 ckYnxguIMOd45N2xy+FPEPuZRb8X6WdJa8f/BDyIM1rykmcAUfoYjD4z2TXDvUDgif
	 j1kw7bTTBjkbKyPBuuJnwTy9NJ7pq1ElK7bRd2oA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E633F80212;
	Tue, 26 Jul 2022 00:52:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C8C9F80163; Tue, 26 Jul 2022 00:52:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C913F80128
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 00:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C913F80128
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-10bd4812c29so16610426fac.11
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 15:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5xP7lcvC698mR+A0NLXF7lWnUopE6m0G7jU4pCDJyEM=;
 b=fS3sGa5nf0bLk1dTZZAA6qHSCjP3pomkJsWsV4vsC/zyTK4mfQ/XBDC+iD9508P6e0
 9nofopzZAxARH9Qpu0/fBoV0Ehf6Vv55pnjuDezeZ36ynFUzcz90gmjv81/W56Ewf0qP
 jfpvKyNJfths9AxX2ZEEIx3E+evvtKqXfTELzc1xR5vNbe9WwMdfS5pJrZ9kRLZe5yEV
 JzfVuBlOSNKs2cRNsRpdfXbr7evb+J2FTnQRC3RMLC0SczUOMQ9oawJ6YGx9z7xaRZzf
 3lTuXJr6w8JTwOoGWRlbxDXqarCXpxIMyraTxJ9AiIM5NvyQeZ6OnMovHwvEmrqsgXob
 h9lA==
X-Gm-Message-State: AJIora8LKY+sK7yw6o1gNdXzSNMo7J+q7sH5ZkX//xmfE+zYIUeLh+7s
 yQbdyqemhvtmh5fLA9PFfA==
X-Google-Smtp-Source: AGRyM1s0NatVRNWiGNqKWhU9xiPExQLSZ+92xOwECHLDDRynEsSes9A+JiW9Xk3glYiiY3SqQ6fJww==
X-Received: by 2002:a05:6870:b40c:b0:10b:8a3c:b13d with SMTP id
 x12-20020a056870b40c00b0010b8a3cb13dmr7965560oap.108.1658789559675; 
 Mon, 25 Jul 2022 15:52:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a9d4d93000000b0061c9ccb051bsm5494405otk.37.2022.07.25.15.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 15:52:39 -0700 (PDT)
Received: (nullmailer pid 2898062 invoked by uid 1000);
 Mon, 25 Jul 2022 22:52:37 -0000
Date: Mon, 25 Jul 2022 16:52:37 -0600
From: Rob Herring <robh@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v8] ASoc: dt-bindings: tas27xx: revise tas27xx format
Message-ID: <20220725225237.GA2893298-robh@kernel.org>
References: <20220722105512.191-1-13691752556@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722105512.191-1-13691752556@139.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 shenghao-ding@ti.com, kevin-lu@ti.com, broonie@kernel.org, raphael-xu@ti.com
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

On Fri, Jul 22, 2022 at 06:55:12PM +0800, Raphael-Xu wrote:
> revise the format

Complete sentences.

And this is not v8. Each new change is v1.

> 
> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>  .../devicetree/bindings/sound/tas27xx.yaml       | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/tas27xx.yaml b/Documentation/devicetree/bindings/sound/tas27xx.yaml
> index 66a0df8850ea..573652577462 100644
> --- a/Documentation/devicetree/bindings/sound/tas27xx.yaml
> +++ b/Documentation/devicetree/bindings/sound/tas27xx.yaml
> @@ -8,7 +8,7 @@ $schema: "http://devicetree.org/meta-schemas/core.yaml#"
>  title: Texas Instruments TAS2764/TAS2780 Smart PA
>  
>  maintainers:
> -  - Shenghao Ding <shenghao-ding@ti.com>
> +  - Raphael Xu <raphael-xu@ti.com>
>  
>  description: |
>    The TAS2764/TAS2780 is a mono, digital input Class-D audio amplifier
> @@ -23,17 +23,19 @@ properties:
>        - ti,tas2780
>  
>    reg:
> -    maxItems: 1
>      description: |
> -       I2C address of the device can be between 0x38 to 0x45.

0x40-0x45 is no longer valid?

> +       I2C address of the device can be between 0x38 to 0x3f.
> +    minimum: 0x38
> +    maximum: 0x3f
>  

>    reset-gpios:
> -    maxItems: 1
>      description: GPIO used to reset the device.
> +    maxItems: 1

Unnecessary change.

>  
>    shutdown-gpios:
> +    description: |

Don't need '|' if no formatting.

> +       GPIO used to control the state of the device.Only for TAS2764.

Space needed after period.

>      maxItems: 1
> -    description: GPIO used to control the state of the device.
>  
>    interrupts:
>      maxItems: 1
> @@ -41,10 +43,14 @@ properties:
>    ti,imon-slot-no:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: TDM TX current sense time slot.
> +    minimum: 0
> +    maximum: 3
>  
>    ti,vmon-slot-no:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: TDM TX voltage sense time slot.
> +    minimum: 0
> +    maximum: 3
>  
>    '#sound-dai-cells':
>      const: 1
> -- 
> 2.35.1
> 
> 
> 
