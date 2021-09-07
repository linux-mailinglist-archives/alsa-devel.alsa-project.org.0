Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F29E403132
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 00:53:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30DCF165D;
	Wed,  8 Sep 2021 00:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30DCF165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631055231;
	bh=ZzndRoAJ/GICQ35K+cSRq/bJvXO8al84k1ZMxMGEsNI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vkBlM6w8F6RIvW9sLN58QpdZNHhNRByLOW4wvVf4P/3C4RC+ixMBIf1PaLaMv6ncH
	 6r60UkW2c5KCevDArDNV88tWRhlFsc+CSuDhLtfyLDPs2WGm4QmU/47rFq0yitNYoQ
	 fGNdNUIhXsbmMbfuL9vAYKygI7jofh0WMowLGfEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DC28F800BC;
	Wed,  8 Sep 2021 00:52:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D790F80224; Wed,  8 Sep 2021 00:52:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 907FAF800BC
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 00:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 907FAF800BC
Received: by mail-oi1-f182.google.com with SMTP id w19so508406oik.10
 for <alsa-devel@alsa-project.org>; Tue, 07 Sep 2021 15:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nI0CSeMUiUA5n/kuVfkp86LIEs3/EPR6sbFoOwit9lQ=;
 b=ifXPU82d2GIfr3DVjJGO7E9SkVO0bedzl7jsvodAyCbVwpL/SiLAYjN46d9UAX/mwU
 aHernJYXa5iNYm7a8T9GbaP+swblNp8qGpK2stlcN4u9HPEkDBf1Bk8sIehYT/0JELJT
 pwzbzeSTSyyOZfLjpPh+N85I1xgDuu6LnvJpWW74BUgeHHZvRFVETHWbK8Jg8ZsUMmBu
 zHmD1Q9wl6GzfEQxbBQ7FfaAq0hi7XpmubeVt9uf2RCjuUeJyQdjt9guHuRdOrzQiidN
 RUtlNo/KP3suTxhD5nbXxa66RyF86vhZZdxh8QEUNHfUfjgJiPD1kbd7uLkWlxVH1y8K
 LDAw==
X-Gm-Message-State: AOAM531lM2XAsyL/A7mjam0M9XJ4WhSLa4XQr3emFBbe88jZmsc+S1RL
 HZqN6PbytCtjFWcQ3qlG/Q==
X-Google-Smtp-Source: ABdhPJzYkbPCHmbSsjQnFKoGRlu3i4g9k50l2JVUfXgsMkO5Qcv8ng+UDJz++RL6ITiJAO8jUQAaxA==
X-Received: by 2002:aca:3954:: with SMTP id g81mr355983oia.101.1631055143882; 
 Tue, 07 Sep 2021 15:52:23 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f17sm72654otl.24.2021.09.07.15.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 15:52:23 -0700 (PDT)
Received: (nullmailer pid 509130 invoked by uid 1000);
 Tue, 07 Sep 2021 22:52:22 -0000
Date: Tue, 7 Sep 2021 17:52:22 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v5 04/21] soc: dt-bindings: qcom: add gpr bindings
Message-ID: <YTftJjzmdicnTBmI@robh.at.kernel.org>
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-5-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903112032.25834-5-srinivas.kandagatla@linaro.org>
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

On Fri, Sep 03, 2021 at 12:20:15PM +0100, Srinivas Kandagatla wrote:
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
>  .../bindings/soc/qcom/qcom,apr.yaml           | 41 +++++++++++++++----
>  include/dt-bindings/soc/qcom,gpr.h            | 18 ++++++++
>  2 files changed, 52 insertions(+), 7 deletions(-)
>  create mode 100644 include/dt-bindings/soc/qcom,gpr.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> index 922c8567c134..14d75f6a556e 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> @@ -4,20 +4,21 @@
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
>    compatible:
>      enum:
>        - qcom,apr-v2
> +      - qcom,gpr
>  
>    qcom,apr-domain:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -45,6 +46,10 @@ properties:
>          5 = Application processor Domain
>          6 = Modem2 Domain
>          7 = Application Processor2 Domain
> +      Selects the processor domain for gpr
> +        1 = Modem Domain
> +        2 = Audio DSP Domain
> +        3 = Application Processor Domain
>  
>    '#address-cells':
>      const: 1
> @@ -52,12 +57,12 @@ properties:
>    '#size-cells':
>      const: 0
>  
> -#APR Services
> +#APR/GPR Services
>  patternProperties:
> -  "^service@[3-9a-d]$":
> +  "^service@[1-9a-d]$":
>      type: object
>      description:
> -      APR node's client devices use subnodes for desired static port services.
> +      APR/GPR node's client devices use subnodes for desired static port services.
>  
>      properties:
>        compatible:
> @@ -66,9 +71,11 @@ patternProperties:
>            - qcom,q6asm
>            - qcom,q6afe
>            - qcom,q6adm
> +          - qcom,q6apm
> +          - qcom,q6prm
>  
>        reg:
> -        enum: [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
> +        enum: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

Might as well switch to minimum/maximum.

>          description:
>            APR Service ID
>              3 = DSP Core Service
> @@ -82,6 +89,11 @@ patternProperties:
>              11 = Core voice processor.
>              12 = Ultrasound stream manager.
>              13 = Listen stream manager.
> +          GPR Service ID
> +            1 = Audio Process Manager Service
> +            2 = Proxy Resource Manager Service.
> +            3 = AMDB Service.
> +            4 = Voice processing manager.
>  
>        qcom,protection-domain:
>          $ref: /schemas/types.yaml#/definitions/string-array
> @@ -140,3 +152,18 @@ examples:
>            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/soc/qcom,gpr.h>
> +    gpr {
> +        compatible = "qcom,gpr";
> +        qcom,domain = <GPR_DOMAIN_ID_ADSP>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        service@1 {
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

Dual license.

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
