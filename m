Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0397D5B0BEB
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 19:59:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 570541685;
	Wed,  7 Sep 2022 19:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 570541685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662573550;
	bh=cm7A7ug8aaFFojJwO39wmSq6lnarpOxZFUxtfHynspI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+guWERv0Nl2bUxiy0I3Urkgy+vjLq/qrfXrMlBtbtuO7xDFMULUL8VBbV/qqXQyN
	 AVxTPgD1sUgn+NUQodL8Tf/j1uWFOSzbbU25giQk2PieI7cSHbqmoreK9GvotjDtsp
	 Y88jzluy9fo7xgXEU+YgzFBjYCgjB8LF7mYACPqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B316BF80423;
	Wed,  7 Sep 2022 19:58:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A228DF8028D; Wed,  7 Sep 2022 19:58:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 830A1F80118
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 19:58:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 830A1F80118
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-1279948d93dso18136650fac.10
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 10:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=UdQDfJDRdgGrPGjr0rQoSFWlcm9yHV7FNhW1rklMkE0=;
 b=EV9PYHd/J5l+Ni6rLi16rVAH5TjIBQzg9wda6sGki8er0mSG/qUAAOayUt/DxD/3oI
 vtoEQzQaVU8TS1moUvLEnhkReJaiTKHwg5mmJoSuCFQVVgtNz6chCHaYNMHlwOE5eUUx
 Soc5aZkC99MYORsViZxbS4CQFL050o23gGf0dV865BB4/nGc865l7LcaCh8qS5SFNzq1
 jJApNuFBUPsGcoR+yZTsoQcY3/xm1gAqZqZXVYKY87Ca691xccx1Y82H83vgPaKdisOz
 M3fKLVQw4Rd7RcRRx7s1wyH6aJ/8KnWitEwy/ni+fSpMfQ5a5ITZBLTTu8rE/CXOblha
 RJpg==
X-Gm-Message-State: ACgBeo2hc1g73U0LZsj56xUaTknry846UkfUldKd4oi/ayqqzj2HH0Te
 MhPa0z++gwv0IbXhcHSjKA==
X-Google-Smtp-Source: AA6agR6xKrGz+BcPw2Zi9fBkKG87AYCGD492SkFstQc2YuZbmPjB1jUx7jBedulSPqAHkVLIY16gbQ==
X-Received: by 2002:a05:6808:e90:b0:345:49f2:a112 with SMTP id
 k16-20020a0568080e9000b0034549f2a112mr12928078oil.7.1662573480405; 
 Wed, 07 Sep 2022 10:58:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l3-20020a056870f14300b0012752d3212fsm4943445oac.53.2022.09.07.10.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 10:58:00 -0700 (PDT)
Received: (nullmailer pid 3798414 invoked by uid 1000);
 Wed, 07 Sep 2022 17:57:59 -0000
Date: Wed, 7 Sep 2022 12:57:59 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 09/14] ASoC: dt-bindings:: qcom,q6asm: convert to
 dtschema
Message-ID: <20220907175759.GA3791463-robh@kernel.org>
References: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
 <20220907101556.37394-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907101556.37394-10-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On Wed, Sep 07, 2022 at 12:15:51PM +0200, Krzysztof Kozlowski wrote:
> Convert Qualcomm Audio Stream Manager (Q6ASM) bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Expected warning because the qcom,apr.yaml is being fixed in next commit:
> 
>   Documentation/devicetree/bindings/sound/qcom,q6asm.example.dtb: apr: service@7: 'dais' does not match any of the regexes: '^.*@[0-9a-f]+$', 'pinctrl-[0-9]+'
>     From schema: /home/krzk/dev/linux/linux/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> 
> Changes since v1:
> 1. New patch.
> ---
>  .../devicetree/bindings/sound/qcom,q6asm.txt  |  70 -----------
>  .../devicetree/bindings/sound/qcom,q6asm.yaml | 112 ++++++++++++++++++
>  2 files changed, 112 insertions(+), 70 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.yaml

Should be qcom,q6asm-dais.yaml or you need to add qcom,q6asm compatible?

> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt b/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
> deleted file mode 100644
> index 0d0075125243..000000000000
> --- a/Documentation/devicetree/bindings/sound/qcom,q6asm.txt
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -Qualcomm Audio Stream Manager (Q6ASM) binding
> -
> -Q6ASM is one of the APR audio service on Q6DSP.
> -Please refer to qcom,apr.txt for details of the common apr service bindings
> -used by the apr service device.
> -
> -- but must contain the following property:
> -
> -- compatible:
> -	Usage: required
> -	Value type: <stringlist>
> -	Definition: must be "qcom,q6asm-v<MAJOR-NUMBER>.<MINOR-NUMBER>".
> -		    Or "qcom,q6asm" where the version number can be queried
> -		    from DSP.
> -		    example "qcom,q6asm-v2.0"

Where is this compatible handled now? 

> -
> -= ASM DAIs (Digital Audio Interface)
> -"dais" subnode of the ASM node represents dai specific configuration
> -
> -- compatible:
> -	Usage: required
> -	Value type: <stringlist>
> -	Definition: must be "qcom,q6asm-dais".
> -
> -- #sound-dai-cells
> -	Usage: required
> -	Value type: <u32>
> -	Definition: Must be 1
> -
> -== ASM DAI is subnode of "dais" and represent a dai, it includes board specific
> -configuration of each dai. Must contain the following properties.
> -
> -- reg
> -	Usage: required
> -	Value type: <u32>
> -	Definition: Must be dai id
> -
> -- direction:
> -	Usage: Required for Compress offload dais
> -	Value type: <u32>
> -	Definition: Specifies the direction of the dai stream
> -			Q6ASM_DAI_TX_RX (0) for both tx and rx
> -			Q6ASM_DAI_TX (1) for only tx (Capture/Encode)
> -			Q6ASM_DAI_RX (2) for only rx (Playback/Decode)
> -
> -- is-compress-dai:
> -	Usage: Required for Compress offload dais
> -	Value type: <boolean>
> -	Definition: present for Compress offload dais
> -
> -
> -= EXAMPLE
> -#include <dt-bindings/sound/qcom,q6asm.h>
> -
> -apr-service@7 {
> -	compatible = "qcom,q6asm";
> -	reg = <APR_SVC_ASM>;
> -	q6asmdai: dais {
> -		compatible = "qcom,q6asm-dais";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		#sound-dai-cells = <1>;
> -
> -		dai@0 {
> -			reg = <0>;
> -			direction = <Q6ASM_DAI_RX>;
> -			is-compress-dai;
> -		};
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6asm.yaml
> new file mode 100644
> index 000000000000..505bd64a0717
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6asm.yaml
> @@ -0,0 +1,112 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,q6asm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Audio Stream Manager (Q6ASM)
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description:
> +  Q6ASM is one of the APR audio services on Q6DSP. Each of its subnodes
> +  represent a dai with board specific configuration.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,q6asm-dais
> +
> +  iommus:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  '^dai@[0-9]+$':
> +    type: object
> +    description:
> +      Q6ASM Digital Audio Interface
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      direction:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2]
> +        description: |
> +          The direction of the dai stream::
> +           - Q6ASM_DAI_TX_RX (0) for both tx and rx
> +           - Q6ASM_DAI_TX (1) for only tx (Capture/Encode)
> +           - Q6ASM_DAI_RX (2) for only rx (Playback/Decode)
> +
> +      is-compress-dai:
> +        type: boolean
> +        description:
> +          Compress offload dai.
> +
> +    dependencies:
> +      is-compress-dai: ['direction']
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - "#sound-dai-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/soc/qcom,apr.h>
> +    #include <dt-bindings/sound/qcom,q6asm.h>
> +
> +    apr {
> +        compatible = "qcom,apr-v2";
> +        qcom,domain = <APR_DOMAIN_ADSP>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        service@7 {
> +            compatible = "qcom,q6asm";
> +            reg = <APR_SVC_ASM>;
> +            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
> +
> +            dais {
> +                compatible = "qcom,q6asm-dais";
> +                iommus = <&apps_smmu 0x1821 0x0>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                #sound-dai-cells = <1>;
> +
> +                dai@0 {
> +                    reg = <0>;
> +                };
> +
> +                dai@1 {
> +                    reg = <1>;
> +                };
> +
> +                dai@2 {
> +                    reg = <2>;
> +                    is-compress-dai;
> +                    direction = <1>;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.34.1
> 
> 
