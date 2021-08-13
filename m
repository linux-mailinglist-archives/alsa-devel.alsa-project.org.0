Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D53F3EBE4C
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Aug 2021 00:33:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABD2817E7;
	Sat, 14 Aug 2021 00:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABD2817E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628894037;
	bh=bE4bNDTqjEr1WJOtG6ZWQodw9NTFREATgAzsVz52wew=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZTnLQFuzEcL1X9vri7mNFuRZgdRxUZLkwk3WczjbBsDn3kR8V5/N0P38mfKR1S4rr
	 1GVLKxM+sZD2H1xhjYnqKbB3hxvpYZb+RCbk4hKW4r45OMPkVgER64LajMGmKrpehm
	 foxwMV/8QIVK7ULODfZHR9/T4zBZ6etMOQMj3CZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DA1BF8020D;
	Sat, 14 Aug 2021 00:32:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB036F802D2; Sat, 14 Aug 2021 00:32:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B19DF80129
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 00:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B19DF80129
Received: by mail-oi1-f180.google.com with SMTP id w6so18045571oiv.11
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 15:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aSQ91xVPzAXJR7Ir9zVwBjsmn9exYGic1VvkPyPRbjQ=;
 b=nlRtn1sQlXsBtlLi9wIuDNiFGip/o51wEjSsDXHtmbV/iQLn7nkiD4zfD/XJ2XjIEY
 gEb9GcKgKEny/3vA2uP4K2MqGzeSFrD38Vvr12CalV9ffjyQWf9tddQ6BbBXY0Hwh2ij
 t73z6WVtIlrKvA0m5qrc3dVePWnCxr1+VEp+GIZGW2arCfSA0QNESi35h0/8n7aRwikf
 +ld9Y84QRI6tdPfLUZ9JDZy/FcpvgSlekxaL3I+Y1nh3bd2rzKD8AwnmXyO8b7ZFTzN1
 TV25Ma9yTrjeoRmmnzw5RtQDqWzhfc7myaU6QGpokGzyswLcCWIA9JyZasAWufWAkBod
 pseg==
X-Gm-Message-State: AOAM532KqG98OMKByPd6gHdSEK9lL3jcAI1Md2lzbnF4yNKVe1IAmaJN
 c7I3pY0jDWxy1zAnADssFg==
X-Google-Smtp-Source: ABdhPJw12anws6OaHVH9mfi6kuY5PCH1uTMHo+F+9G+j5EgMJsVmwy/74TeWdi3mFRZZBg5+xcXqQw==
X-Received: by 2002:aca:c642:: with SMTP id w63mr3688027oif.177.1628893938406; 
 Fri, 13 Aug 2021 15:32:18 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c11sm522239oot.25.2021.08.13.15.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 15:32:17 -0700 (PDT)
Received: (nullmailer pid 4058431 invoked by uid 1000);
 Fri, 13 Aug 2021 22:32:16 -0000
Date: Fri, 13 Aug 2021 17:32:16 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 03/20] soc: dt-bindings: qcom: add gpr bindings
Message-ID: <YRby8EtUeXnqEd8m@robh.at.kernel.org>
References: <20210809112339.8368-1-srinivas.kandagatla@linaro.org>
 <20210809112339.8368-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809112339.8368-4-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, broonie@kernel.org, bjorn.andersson@linaro.org
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

On Mon, Aug 09, 2021 at 12:23:22PM +0100, Srinivas Kandagatla wrote:
> Qualcomm Generic Packet router aka GPR is the IPC mechanism found
> in AudioReach next generation signal processing framework to perform
> command and response messages between various processors.
> 
> GPR has concepts of static and dynamic port, all static services like
> APM (Audio Processing Manager), PRM (Proxy resource manager) have
> fixed port numbers where as dynamic services like graphs have dynamic
> port numbers which are allocated at runtime. All GPR packet messages
> will have source and destination domain and port along with opcode
> and payload.
> 
> This support is added using existing APR driver to reuse most of
> the code.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,apr.yaml           | 92 ++++++++++++++++++-
>  include/dt-bindings/soc/qcom,gpr.h            | 18 ++++
>  2 files changed, 105 insertions(+), 5 deletions(-)
>  create mode 100644 include/dt-bindings/soc/qcom,gpr.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> index 12650f7084f4..59d8b4dce8b5 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> @@ -4,14 +4,14 @@
>  $id: "http://devicetree.org/schemas/soc/qcom/qcom,apr.yaml#"
>  $schema: "http://devicetree.org/meta-schemas/core.yaml#"
>  
> -title: Qualcomm APR (Asynchronous Packet Router) binding
> +title: Qualcomm APR/GPR (Asynchronous/Generic Packet Router) binding
>  
>  maintainers:
>    - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>  
>  description: |
> -  This binding describes the Qualcomm APR, APR is a IPC protocol for
> -  communication between Application processor and QDSP. APR is mainly
> +  This binding describes the Qualcomm APR/GPR, APR/GPR is a IPC protocol for
> +  communication between Application processor and QDSP. APR/GPR is mainly
>    used for audio/voice services on the QDSP.
>  
>  properties:
> @@ -19,6 +19,7 @@ properties:
>      enum:
>        - qcom,apr
>        - qcom,apr-v2
> +      - qcom,gpr
>  
>    qcom,apr-domain:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -33,13 +34,22 @@ properties:
>          6 = Modem2 Domain
>          7 = Application Processor2 Domain
>  
> +  qcom,gpr-domain:

When the next flavor comes out, we'll have qcom,foo-domain?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3]
> +    description:
> +      Selects the processor domain for gpr
> +        1 = Modem Domain
> +        2 = Audio DSP Domain
> +        3 = Application Processor Domain
> +
>    '#address-cells':
>      const: 1
>  
>    '#size-cells':
>      const: 0
>  
> -#APR Services
> +#APR/GPR Services
>  patternProperties:
>    "^apr-service@[0-9a-e]$":
>      type: object
> @@ -86,9 +96,66 @@ patternProperties:
>  
>      additionalProperties: false
>  
> +  "^gpr-service@[0-9a-e]$":

And foo-service@...

Do you (the driver) care what the node name is?

> +    type: object
> +    description:
> +      GPR node's client devices use subnodes for desired static port services.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,q6apm
> +          - qcom,q6prm
> +
> +      reg:
> +        enum: [1, 2, 3, 4]
> +        description:
> +          GPR Service ID
> +            1 = Audio Process Manager Service
> +            2 = Proxy Resource Manager Service.

Looks like both reg and compatible encode what the service is.

> +            3 = AMDB Service.
> +            4 = Voice processing manager.
> +
> +      qcom,protection-domain:
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +        description: protection domain service name and path for apr service
> +          has dependency on.
> +        items:
> +          - const: avs/audio
> +          - const: msm/adsp/audio_pd

Why are we redefining the same property? You've combined the binding but 
are still sharing almost nothing...

> +
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    additionalProperties: false
> +
>  required:
>    - compatible
> -  - qcom,apr-domain
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,apr-v2
> +              - qcom,apr
> +    then:
> +      required:
> +        - qcom,apr-domain
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,gpr
> +    then:
> +      required:
> +        - qcom,gpr-domain
>  
>  additionalProperties: false
>  
> @@ -125,3 +192,18 @@ examples:
>            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/soc/qcom,gpr.h>
> +    gpr {
> +        compatible = "qcom,gpr";
> +        qcom,gpr-domain = <GPR_DOMAIN_ID_ADSP>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        gpr-service@1 {
> +          compatible = "qcom,q6apm";
> +          reg = <GPR_APM_MODULE_IID>;
> +          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +        };
> +    };
> diff --git a/include/dt-bindings/soc/qcom,gpr.h b/include/dt-bindings/soc/qcom,gpr.h
> new file mode 100644
> index 000000000000..1c68906e079c
> --- /dev/null
> +++ b/include/dt-bindings/soc/qcom,gpr.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __DT_BINDINGS_QCOM_GPR_H
> +#define __DT_BINDINGS_QCOM_GPR_H
> +
> +/* DOMAINS */
> +
> +#define GPR_DOMAIN_ID_MODEM	1
> +#define GPR_DOMAIN_ID_ADSP	2
> +#define GPR_DOMAIN_ID_APPS	3
> +
> +/* Static Services */
> +
> +#define GPR_APM_MODULE_IID		1
> +#define GPR_PRM_MODULE_IID		2
> +#define GPR_AMDB_MODULE_IID		3
> +#define GPR_VCPM_MODULE_IID		4
> +
> +#endif /* __DT_BINDINGS_QCOM_GPR_H */
> -- 
> 2.21.0
> 
> 
