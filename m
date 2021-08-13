Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 523663EBE44
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Aug 2021 00:24:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C06AF17E7;
	Sat, 14 Aug 2021 00:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C06AF17E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628893484;
	bh=hcoCcqTEKhAgWMqSboxEuD80WB/nWnzjDnYaJEXj8L4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CeqtLRHls7C+baBWZxzibBvEpt/zl+9NIj1IKMCpP18CcMM+wXw4nrVcmVP4NhZwF
	 N1biI3ovPgVXUdGW3sxJZSvOQ6MzSe3wnk1EGmVNPBkkugD+sRQSQOaJ7yPdA5Nuor
	 2+OXcV2GmCk1EdOpNakAtcueKBcCOEjSAW1Fqq5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 283B1F800E5;
	Sat, 14 Aug 2021 00:23:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C853EF802D2; Sat, 14 Aug 2021 00:23:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E314DF80129
 for <alsa-devel@alsa-project.org>; Sat, 14 Aug 2021 00:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E314DF80129
Received: by mail-oi1-f174.google.com with SMTP id w6so18014510oiv.11
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 15:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jC2PUYWO6/b2RNk6g7rayeCm9jNbK7Ru4h0UAMkLO4w=;
 b=AYuBvi9Rkp2Ls/kym63smEttOlSWsutqnBEQspiTtbC0iIr40GskZZTqeuzJEcTR7E
 ZqNEzV3VrBLirOhKBpYdhB8YdpG6Pua2Lfbnf4c98+rLMs8VmNeYXJheZlS9esNVUZ+t
 sukvLyPsmUlcI4Yj/wb5Uy9RgdHGk3VX3XFYYX8cECatCVi7yhoQ4Kc2cPOXc4ircZjM
 OcpOPKlGJyzztpsqPNGzBEDPbac8d+L61JuUkY8aDbi0H7z5bk61MvJmOYnb+Y9TLjlq
 bAHlWPX/U/dJuatayDT5APrh1UD+DtGisDK8pv22sgiGiNzBna3Idz5mAsEKKK6p+x/K
 B3IQ==
X-Gm-Message-State: AOAM5327MNrGSdc9deAgoW2zBn3Ykf8+6tIvXba7TJnJnl8PuXLmFikG
 laUXPCNqERcAZ79N4GscyA==
X-Google-Smtp-Source: ABdhPJyUUN4I1uIXZyw9oxHDZusxdXapylWJtreLq2VsbbxT8qfPv1qHmQvenD+ZV/RnDYQf+EAEkg==
X-Received: by 2002:aca:60d6:: with SMTP id u205mr3773176oib.99.1628893386667; 
 Fri, 13 Aug 2021 15:23:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d2sm574798otl.32.2021.08.13.15.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 15:23:05 -0700 (PDT)
Received: (nullmailer pid 4044137 invoked by uid 1000);
 Fri, 13 Aug 2021 22:23:04 -0000
Date: Fri, 13 Aug 2021 17:23:04 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4 01/20] soc: dt-bindings: qcom: apr: convert to yaml
Message-ID: <YRbwyIYt4YdzAbqj@robh.at.kernel.org>
References: <20210809112339.8368-1-srinivas.kandagatla@linaro.org>
 <20210809112339.8368-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809112339.8368-2-srinivas.kandagatla@linaro.org>
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

On Mon, Aug 09, 2021 at 12:23:20PM +0100, Srinivas Kandagatla wrote:
> Convert APR bindings to yaml format so that we could add new bindings support.
> 
> All the dsp services bindings are now part of apr bindings instead
> of adding them to audio bindings.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,apr.txt | 134 ------------------
>  .../bindings/soc/qcom/qcom,apr.yaml           | 127 +++++++++++++++++
>  2 files changed, 127 insertions(+), 134 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> deleted file mode 100644
> index 2e2f6dc351c0..000000000000
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
> +++ /dev/null
> @@ -1,134 +0,0 @@
> -Qualcomm APR (Asynchronous Packet Router) binding
> -
> -This binding describes the Qualcomm APR. APR is a IPC protocol for
> -communication between Application processor and QDSP. APR is mainly
> -used for audio/voice services on the QDSP.
> -
> -- compatible:
> -	Usage: required
> -	Value type: <stringlist>
> -	Definition: must be "qcom,apr-v<VERSION-NUMBER>", example "qcom,apr-v2"
> -
> -- qcom,apr-domain
> -	Usage: required
> -	Value type: <u32>
> -	Definition: Destination processor ID.
> -	Possible values are :
> -			1 - APR simulator
> -			2 - PC
> -			3 - MODEM
> -			4 - ADSP
> -			5 - APPS
> -			6 - MODEM2
> -			7 - APPS2
> -
> -= APR SERVICES
> -Each subnode of the APR node represents service tied to this apr. The name
> -of the nodes are not important. The properties of these nodes are defined
> -by the individual bindings for the specific service
> -- All APR services MUST contain the following property:
> -
> -- reg
> -	Usage: required
> -	Value type: <u32>
> -	Definition: APR Service ID
> -	Possible values are :
> -			3 - DSP Core Service
> -			4 - Audio Front End Service.
> -			5 - Voice Stream Manager Service.
> -			6 - Voice processing manager.
> -			7 - Audio Stream Manager Service.
> -			8 - Audio Device Manager Service.
> -			9 - Multimode voice manager.
> -			10 - Core voice stream.
> -			11 - Core voice processor.
> -			12 - Ultrasound stream manager.
> -			13 - Listen stream manager.
> -
> -- qcom,protection-domain
> -	Usage: optional
> -	Value type: <stringlist>
> -	Definition: Must list the protection domain service name and path
> -		    that the particular apr service has a dependency on.
> -	Possible values are :
> -			"avs/audio", "msm/adsp/audio_pd".
> -			"kernel/elf_loader", "msm/modem/wlan_pd".
> -			"tms/servreg", "msm/adsp/audio_pd".
> -			"tms/servreg", "msm/modem/wlan_pd".
> -			"tms/servreg", "msm/slpi/sensor_pd".
> -
> -= EXAMPLE
> -The following example represents a QDSP based sound card on a MSM8996 device
> -which uses apr as communication between Apps and QDSP.
> -
> -	apr {
> -		compatible = "qcom,apr-v2";
> -		qcom,apr-domain = <APR_DOMAIN_ADSP>;
> -
> -		apr-service@3 {
> -			compatible = "qcom,q6core";
> -			reg = <APR_SVC_ADSP_CORE>;
> -		};
> -
> -		apr-service@4 {
> -			compatible = "qcom,q6afe";
> -			reg = <APR_SVC_AFE>;
> -
> -			dais {
> -				#sound-dai-cells = <1>;
> -				dai@1 {
> -					reg = <HDMI_RX>;
> -				};
> -			};
> -		};
> -
> -		apr-service@7 {
> -			compatible = "qcom,q6asm";
> -			reg = <APR_SVC_ASM>;
> -			...
> -		};
> -
> -		apr-service@8 {
> -			compatible = "qcom,q6adm";
> -			reg = <APR_SVC_ADM>;
> -			...
> -		};
> -	};
> -
> -= EXAMPLE 2
> -The following example represents a QDSP based sound card with protection domain
> -dependencies specified. Here some of the apr services are dependent on services
> -running on protection domain hosted on ADSP/SLPI remote processors while others
> -have no such dependency.
> -
> -	apr {
> -		compatible = "qcom,apr-v2";
> -		qcom,glink-channels = "apr_audio_svc";
> -		qcom,apr-domain = <APR_DOMAIN_ADSP>;
> -
> -		apr-service@3 {
> -			compatible = "qcom,q6core";
> -			reg = <APR_SVC_ADSP_CORE>;
> -		};
> -
> -		q6afe: apr-service@4 {
> -			compatible = "qcom,q6afe";
> -			reg = <APR_SVC_AFE>;
> -			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> -			...
> -		};
> -
> -		q6asm: apr-service@7 {
> -			compatible = "qcom,q6asm";
> -			reg = <APR_SVC_ASM>;
> -			qcom,protection-domain = "tms/servreg", "msm/slpi/sensor_pd";
> -			...
> -		};
> -
> -		q6adm: apr-service@8 {
> -			compatible = "qcom,q6adm";
> -			reg = <APR_SVC_ADM>;
> -			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> -			...
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> new file mode 100644
> index 000000000000..12650f7084f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,apr.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm APR (Asynchronous Packet Router) binding
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  This binding describes the Qualcomm APR, APR is a IPC protocol for
> +  communication between Application processor and QDSP. APR is mainly
> +  used for audio/voice services on the QDSP.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,apr

This wasn't a valid compatible before.

> +      - qcom,apr-v2
> +
> +  qcom,apr-domain:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3, 4, 5, 6, 7]
> +    description:
> +      Selects the processor domain for apr
> +        1 = APR simulator
> +        2 = PC Domain
> +        3 = Modem Domain
> +        4 = ADSP Domain
> +        5 = Application processor Domain
> +        6 = Modem2 Domain
> +        7 = Application Processor2 Domain
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +#APR Services
> +patternProperties:
> +  "^apr-service@[0-9a-e]$":

Based on reg, this should be: [3-9a-d]

> +    type: object
> +    description:
> +      APR node's client devices use subnodes for desired static port services.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,q6core
> +          - qcom,q6asm
> +          - qcom,q6afe
> +          - qcom,q6adm
> +
> +      reg:
> +        enum: [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
> +        description:
> +          APR Service ID
> +            3 = DSP Core Service
> +            4 = Audio  Front End Service.
> +            5 = Voice Stream Manager Service.
> +            6 = Voice processing manager.
> +            7 = Audio Stream Manager Service.
> +            8 = Audio Device Manager Service.
> +            9 = Multimode voice manager.
> +            10 = Core voice stream.
> +            11 = Core voice processor.
> +            12 = Ultrasound stream manager.
> +            13 = Listen stream manager.
> +
> +      qcom,protection-domain:
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +        description: protection domain service name and path for apr service
> +          has dependency on.
> +        items:
> +          - const: avs/audio
> +          - const: msm/adsp/audio_pd

You've dropped a bunch of possible values.

> +
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - qcom,apr-domain
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/soc/qcom,apr.h>
> +    apr {
> +        compatible = "qcom,apr-v2";
> +        qcom,apr-domain = <APR_DOMAIN_ADSP>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        q6core: apr-service@3 {
> +          compatible = "qcom,q6core";
> +          reg = <APR_SVC_ADSP_CORE>;
> +          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +        };
> +
> +        q6afe: apr-service@4 {
> +          compatible = "qcom,q6afe";
> +          reg = <APR_SVC_AFE>;
> +          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +        };
> +
> +        q6asm: apr-service@7 {
> +          compatible = "qcom,q6asm";
> +          reg = <APR_SVC_ASM>;
> +          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +        };
> +
> +        q6adm: apr-service@8 {
> +          compatible = "qcom,q6adm";
> +          reg = <APR_SVC_ADM>;
> +          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +        };
> +    };
> -- 
> 2.21.0
> 
> 
