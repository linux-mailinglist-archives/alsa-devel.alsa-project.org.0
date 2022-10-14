Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 876055FF0F1
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Oct 2022 17:14:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29EA86AFB;
	Fri, 14 Oct 2022 17:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29EA86AFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665760471;
	bh=83Z1Qgo5iqOgm0WE4NlAlhtFg+Ss2ozcx46vSwrjg1c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MEPzbJzpw1dBurOsyZzylImd0kfWYphah/bHxtVrVbYV8ixK4ne0oe1d9WCah/px1
	 RrHccSbdXc+nvOL9olQLZQ4oMMOO5g9aP1wfZn6+5E89sUa6eQF6sFF1fQsGlRuAnM
	 p6lARy0oJW9FfkjTcp2Q2t2g+OGwm14ZgVuu4dwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 886ADF80240;
	Fri, 14 Oct 2022 17:13:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA1E0F80224; Fri, 14 Oct 2022 17:13:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2654F800F3
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 17:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2654F800F3
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-1370acb6588so6169462fac.9
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 08:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jkHJ2WaopDUZ1kn2ahx5rf6aUqRXLuVh4aPcDlWTiFI=;
 b=zx+onUDIljPAESyq+DFF0qDBNbVJV61elLONJZv/3ZAAztVOpL4ONYQFJmDt3gxQXA
 /SJoFM6M65wVOEo01JZ2nimVtGt17pqrEp+yaerafHM9EK+dpO6OzZUFZsf5U7vLojAA
 FyJkrFk1CfG2HpkzO6aXYlP7jk++7CVUkrlKalPOyglhM59ybyyOU4L2P0wKXo65or9j
 R9njoiug4i9MK/hDjrKIKQsnvsT4KnfwEP4P8DBw+UiwTQiKFERnLFzcMcQOG+fopWNX
 VL3YpqWPM/OJ6xfF0N1WMWeeJpehxkWbjhe4NlgRLOx0mFZdNE8he1vTyQI0cLfY69Pq
 YYGw==
X-Gm-Message-State: ACrzQf0BiriiS9dzzGJ4FYW5erf42G3h23ji7iNMD5ky/o+7lkmfa/JN
 lp8z7vUeAOsXlIWXWHhFyw==
X-Google-Smtp-Source: AMsMyM51/rLYMuawRnZOlPd9BCtsnx5WBWRjk6J2A5Ed+h5n+44B2Gd7UIpz5sSnFxMIBbSZEVCa3Q==
X-Received: by 2002:a05:6870:b68d:b0:12d:484a:2643 with SMTP id
 cy13-20020a056870b68d00b0012d484a2643mr8576751oab.105.1665760405161; 
 Fri, 14 Oct 2022 08:13:25 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v5-20020a056870310500b00136c20b1c59sm1384346oaa.43.2022.10.14.08.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 08:13:24 -0700 (PDT)
Received: (nullmailer pid 1963626 invoked by uid 1000);
 Fri, 14 Oct 2022 15:13:25 -0000
Date: Fri, 14 Oct 2022 10:13:25 -0500
From: Rob Herring <robh@kernel.org>
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
Subject: Re: [PATCH 3/6] dt-bindings: sound: Add sound card bindings for
 Tesla FSD
Message-ID: <20221014151325.GA1940481-robh@kernel.org>
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104901epcas5p1a61ea81c3b1640bd8a064633c0b1e40d@epcas5p1.samsung.com>
 <20221014102151.108539-4-p.rajanbabu@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221014102151.108539-4-p.rajanbabu@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rcsekar@samsung.com, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 alim.akhtar@samsung.com, linux-kernel@vger.kernel.org
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

On Fri, Oct 14, 2022 at 03:51:48PM +0530, Padmanabhan Rajanbabu wrote:
> Add dt-binding reference document to configure the DAI link for Tesla
> FSD sound card driver.

The simple-card or graph-card bindings don't work for you?

> 
> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> ---
>  .../bindings/sound/tesla,fsd-card.yaml        | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tesla,fsd-card.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/tesla,fsd-card.yaml b/Documentation/devicetree/bindings/sound/tesla,fsd-card.yaml
> new file mode 100644
> index 000000000000..4bd590f4ee27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tesla,fsd-card.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2022 Samsung Electronics Co. Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/tesla,fsd-card.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tesla FSD ASoC sound card driver
> +
> +maintainers:
> +  - Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
> +
> +description: |
> +  This binding describes the node properties and essential DT entries of FSD
> +  SoC sound card node
> +
> +select: false

Never apply this schema. Why?

> +
> +properties:
> +  compatible:
> +    enum:
> +      - tesla,fsd-sndcard
> +
> +  model:
> +    description: Describes the Name of the sound card
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +  widgets:
> +    description: A list of DAPM widgets in the sound card. Each entry is a pair
> +      of strings, the first being the widget name and the second being the
> +      widget alias
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +
> +  audio-routing:
> +    description: A list of the connections between audio components. Each entry
> +      is a pair of strings, the first being the connection's sink, the second
> +      being the connection's source
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +
> +  dai-tdm-slot-num:
> +    description: Enables TDM mode and specifies the number of TDM slots to be
> +      enabled
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3, 4, 5, 6, 7, 8]

maximum: 8

> +    default: 2
> +
> +  dai-tdm-slot-width:
> +    description: Specifies the slot width of each TDm slot enabled
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [8, 16, 24]
> +    default: 16

All the above have types defined. You should not be redefining the 
types.

> +
> +  dai-link:
> +    description: Holds the DAI link data between CPU, Codec and Platform
> +    type: object

       additionalProperties: false

> +    properties:
> +      link-name:
> +        description: Specifies the name of the DAI link
> +        $ref: /schemas/types.yaml#/definitions/string
> +
> +      dai-format:
> +        description: Specifies the serial data format of CPU DAI
> +        $ref: /schemas/types.yaml#/definitions/string
> +
> +      tesla,bitclock-master:
> +        description: Specifies the phandle of bitclock master DAI
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +
> +      tesla,frame-master:
> +        description: Specifies the phandle of frameclock master DAI
> +        $ref: /schemas/types.yaml#/definitions/phandle

These are common properties. Drop 'tesla'.

> +
> +      cpu:
> +        description: Holds the CPU DAI node and instance
> +        type: object

           additionalProperties: false

> +        properties:
> +          sound-dai:
> +            description: Specifies the phandle of CPU DAI node
> +            $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +        required:
> +          - sound-dai
> +
> +      codec:
> +        description: Holds the Codec DAI node and instance
> +        type: object

           additionalProperties: false

> +        properties:
> +          sound-dai:
> +            description: Specifies the phandle of Codec DAI node
> +            $ref: /schemas/types.yaml#/definitions/phandle-array

Already has a type. Need to define how many entries (maxItems: 1 ?).

> +
> +        required:
> +          - sound-dai
> +
> +    required:
> +      - link-name
> +      - dai-format
> +      - tesla,bitclock-master
> +      - tesla,frame-master
> +      - cpu
> +
> +dependencies:
> +  dai-tdm-slot-width: [ 'dai-tdm-slot-num' ]

This should be captured with tdm-slot.txt converted to schema.

> +
> +required:
> +  - compatible
> +  - model
> +  - dai-link
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "tesla,fsd-sndcard";
> +        status = "disabled";

Why have a disabled example? Other than your example won't pass your 
schema.

> +        model = "fsd-i2s";
> +
> +        primary-dai-link-0 {
> +            link-name = "fsd-primary-0";
> +            dai-format = "i2s";
> +            tesla,bitclock-master = <&tdm_0>;
> +            tesla,frame-master = <&tdm_0>;
> +            cpu {
> +                sound-dai = <&tdm_0 0>;
> +            };
> +        };
> +
> +        secondary-dai-link-0 {
> +            link-name = "fsd-secondary-0";
> +            dai-format = "i2s";
> +            tesla,bitclock-master = <&tdm_0>;
> +            tesla,frame-master = <&tdm_0>;
> +            cpu {
> +                sound-dai = <&tdm_0 1>;
> +            };
> +        };
> +
> +        primary-dai-link-1 {
> +            link-name = "fsd-primary-1";
> +            dai-format = "i2s";
> +            tesla,bitclock-master = <&tdm_1>;
> +            tesla,frame-master = <&tdm_1>;
> +            cpu {
> +                sound-dai = <&tdm_1 0>;
> +            };
> +        };
> +
> +        secondary-dai-link-1 {
> +            link-name = "fsd-secondary-1";
> +            dai-format = "i2s";
> +            tesla,bitclock-master = <&tdm_1>;
> +            tesla,frame-master = <&tdm_1>;
> +            cpu {
> +                sound-dai = <&tdm_1 1>;
> +            };
> +        };
> +    };
> -- 
> 2.17.1
> 
> 
