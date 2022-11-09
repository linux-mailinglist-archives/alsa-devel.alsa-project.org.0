Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F526227C7
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 10:58:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DF97847;
	Wed,  9 Nov 2022 10:57:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DF97847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667987895;
	bh=KIRH0e6TtYSUzL2iOyD/W8+Kyc58f5rHOBaLhSvtbzc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZDs2bfKlsurRsXg4yNcHL6BelvW8ZSZvToFznIHnyPT94jQZ1Op/rpHMeGQOarVI4
	 bD+Im8zN80dABF3BFT09sFPfioJeYTmp4huJp1uLjmIeyuwMXQG/KGV3vlafXLuV8t
	 M3RBplwSL3hhlyra9jJCIPGv6FNy4AzqnwQid2/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17591F802A0;
	Wed,  9 Nov 2022 10:57:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2736F8023B; Wed,  9 Nov 2022 10:57:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBC24F80114
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 10:57:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBC24F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lNxoH6I6"
Received: by mail-wm1-x330.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so886178wmi.3
 for <alsa-devel@alsa-project.org>; Wed, 09 Nov 2022 01:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hsfhxs1hYrONLDNG0hq6h1vR8M+W0oashll6Jl8JPxI=;
 b=lNxoH6I6bNsajHKLUCqLi8yzFj+xh/SJ9Jm0xwLFtM1a4+vh/pKpBOq7bD5zrQ0DWa
 QDh/od+nbvxdulmA/f4sitrLQ92IZV1lb7P/VhT4qi7IiHf87lmivZBEMlXu6vVP+Q5q
 MlCpoYKk+XcMfQLU1AZlxaZGU/VSzjTwnGw7OvLPX57pZlGwI4iv3jsk6hIqqd9xvVNV
 EjQ3EOzaOSKJAd5hRdo1Rnqk6MygyFYIc6VDqROoyLeC2INOy5eiJmUNnrYF3hkuilUf
 4OKYJqryGmZqNXuy8o55rPxjozhGmlJfhZ/V07cmoaNlrudgORnzGWyE7bysb4y704WW
 OwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Hsfhxs1hYrONLDNG0hq6h1vR8M+W0oashll6Jl8JPxI=;
 b=G3IqfftZhqLQzFydRiKwqffr1gW5U5bLc5j1cbemgAmrKcCebdKW2NcJ4g1WaG4NQN
 vO+JGfEDfsNtnwcPVgtiWTTXHze+aT8xt9SSI73XgDCW9ws8YU2NxUssxLg4GrrpAI2I
 FTohQfiQL8GV5Ey/cINJGSArFaMiV+gNheAIGF56o3VTYrO71FwnoBpiZkm5Z/SSSOzs
 bpzqG6ggmkF5HlxySMWIlpbXdCNetKiDxOC/TfhZ2wCl+aRCIOlRub6FN6XJ50AB4LZi
 j1eMbb5fOQ0t+dp2ja9t9PF+dhalU1zNfKrsnk3FVKiNC/+0+9I1QzCp9+1mn7dkk24E
 qT5g==
X-Gm-Message-State: ACrzQf0crMy77+LGN3OeJrhl84drEQQR7Ni2XqSdjPp2rkPgEViATGoS
 VfQRfjhejkIgV4VVVxMaSH9QSg==
X-Google-Smtp-Source: AMsMyM66qL6/Z5tH6JpI1VqRleHOIsZAYvyin14QrXAPew92l2qjEFHEDpwMfYhbJrYWDZqb4k1TYw==
X-Received: by 2002:a05:600c:1609:b0:3cf:4dc4:5a99 with SMTP id
 m9-20020a05600c160900b003cf4dc45a99mr40114474wmn.67.1667987826262; 
 Wed, 09 Nov 2022 01:57:06 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 t17-20020a05600c199100b003b4fdbb6319sm1094033wmq.21.2022.11.09.01.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 01:57:05 -0800 (PST)
Message-ID: <e72c458b-458d-17f7-7c63-a486de0996f1@linaro.org>
Date: Wed, 9 Nov 2022 09:57:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 1/3] dt-bindings: slimbus: convert bus description to
 DT schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20221026164315.39038-1-krzysztof.kozlowski@linaro.org>
 <20221026164315.39038-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221026164315.39038-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Rob Herring <robh@kernel.org>
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



On 26/10/2022 17:43, Krzysztof Kozlowski wrote:
> Convert the SLIMbus bus description bindings to DT Schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>


Applied all thanks,

--srini
> ---
>   .../devicetree/bindings/slimbus/bus.txt       | 60 ------------
>   .../bindings/slimbus/slim-ngd-qcom-ctrl.txt   |  2 -
>   .../bindings/slimbus/slim-qcom-ctrl.txt       |  3 -
>   .../devicetree/bindings/slimbus/slimbus.yaml  | 95 +++++++++++++++++++
>   4 files changed, 95 insertions(+), 65 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/slimbus/bus.txt
>   create mode 100644 Documentation/devicetree/bindings/slimbus/slimbus.yaml
> 
> diff --git a/Documentation/devicetree/bindings/slimbus/bus.txt b/Documentation/devicetree/bindings/slimbus/bus.txt
> deleted file mode 100644
> index bbe871f82a8b..000000000000
> --- a/Documentation/devicetree/bindings/slimbus/bus.txt
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -SLIM(Serial Low Power Interchip Media Bus) bus
> -
> -SLIMbus is a 2-wire bus, and is used to communicate with peripheral
> -components like audio-codec.
> -
> -Required property for SLIMbus controller node:
> -- compatible	- name of SLIMbus controller
> -
> -Child nodes:
> -Every SLIMbus controller node can contain zero or more child nodes
> -representing slave devices on the bus. Every SLIMbus slave device is
> -uniquely determined by the enumeration address containing 4 fields:
> -Manufacturer ID, Product code, Device index, and Instance value for
> -the device.
> -If child node is not present and it is instantiated after device
> -discovery (slave device reporting itself present).
> -
> -In some cases it may be necessary to describe non-probeable device
> -details such as non-standard ways of powering up a device. In
> -such cases, child nodes for those devices will be present as
> -slaves of the SLIMbus controller, as detailed below.
> -
> -Required property for SLIMbus child node if it is present:
> -- reg		- Should be ('Device index', 'Instance ID') from SLIMbus
> -		  Enumeration  Address.
> -		  Device Index Uniquely identifies multiple Devices within
> -		  a single Component.
> -		  Instance ID Is for the cases where multiple Devices of the
> -		  same type or Class are attached to the bus.
> -
> -- compatible	-"slimMID,PID". The textual representation of Manufacturer ID,
> -	 	  Product Code, shall be in lower case hexadecimal with leading
> -		  zeroes suppressed
> -
> -Optional property for SLIMbus child node if it is present:
> -- slim-ifc-dev	- Should be phandle to SLIMBus Interface device.
> -		  Required for devices which deal with streams.
> -
> -SLIMbus example for Qualcomm's slimbus manager component:
> -
> -	slim@28080000 {
> -		compatible = "qcom,apq8064-slim", "qcom,slim";
> -		reg = <0x28080000 0x2000>,
> -		interrupts = <0 33 0>;
> -		clocks = <&lcc SLIMBUS_SRC>, <&lcc AUDIO_SLIMBUS_CLK>;
> -		clock-names = "iface", "core";
> -		#address-cells = <2>;
> -		#size-cell = <0>;
> -
> -		codec_ifd: ifd@0,0{
> -			compatible = "slim217,60";
> -			reg = <0 0>;
> -		};
> -
> -		codec: wcd9310@1,0{
> -			compatible = "slim217,60";
> -			reg = <1 0>;
> -			slim-ifc-dev  = <&codec_ifd>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/slimbus/slim-ngd-qcom-ctrl.txt b/Documentation/devicetree/bindings/slimbus/slim-ngd-qcom-ctrl.txt
> index e94a2ad3a710..7c3d9eb6af5d 100644
> --- a/Documentation/devicetree/bindings/slimbus/slim-ngd-qcom-ctrl.txt
> +++ b/Documentation/devicetree/bindings/slimbus/slim-ngd-qcom-ctrl.txt
> @@ -5,8 +5,6 @@ with SLIMBus slaves directly over the bus using messaging interface and
>   communicating with master component residing on ADSP for bandwidth and
>   data-channel management
>   
> -Please refer to slimbus/bus.txt for details of the common SLIMBus bindings.
> -
>   - compatible:
>   	Usage: required
>   	Value type: <stringlist>
> diff --git a/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt b/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
> index 922dcb8ff24a..6d955e129f90 100644
> --- a/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
> +++ b/Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
> @@ -4,9 +4,6 @@ master component.
>   
>   Required properties:
>   
> - - #address-cells - refer to Documentation/devicetree/bindings/slimbus/bus.txt
> - - #size-cells	- refer to Documentation/devicetree/bindings/slimbus/bus.txt
> -
>    - reg : Offset and length of the register region(s) for the device
>    - reg-names : Register region name(s) referenced in reg above
>   	 Required register resource entries are:
> diff --git a/Documentation/devicetree/bindings/slimbus/slimbus.yaml b/Documentation/devicetree/bindings/slimbus/slimbus.yaml
> new file mode 100644
> index 000000000000..22513fb7c59a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/slimbus/slimbus.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/slimbus/slimbus.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SLIM (Serial Low Power Interchip Media) bus
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description:
> +  SLIMbus is a 2-wire bus, and is used to communicate with peripheral
> +  components like audio-codec.
> +
> +properties:
> +  $nodename:
> +    pattern: "^slim(@.*|-[0-9a-f])*$"
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+,[0-9a-f]+$":
> +    type: object
> +    description: |
> +      Every SLIMbus controller node can contain zero or more child nodes
> +      representing slave devices on the bus. Every SLIMbus slave device is
> +      uniquely determined by the enumeration address containing 4 fields::
> +      Manufacturer ID, Product code, Device index, and Instance value for the
> +      device.
> +
> +      If child node is not present and it is instantiated after device
> +      discovery (slave device reporting itself present).
> +
> +      In some cases it may be necessary to describe non-probeable device
> +      details such as non-standard ways of powering up a device. In such cases,
> +      child nodes for those devices will be present as slaves of the SLIMbus
> +      controller.
> +
> +    properties:
> +      compatible:
> +        pattern: "^slim[0-9a-f]+,[0-9a-f]+$"
> +
> +      reg:
> +        maxItems: 1
> +        description: |
> +          Pair of (device index, instande ID), where::
> +           - Device index, which uniquely identifies multiple devices within a
> +             single component.
> +           - Instance ID, can be used for the cases where multiple devices of
> +             the same type or class are attached to the bus.
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +    additionalProperties: true
> +
> +required:
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-msm8960.h>
> +    #include <dt-bindings/clock/qcom,lcc-msm8960.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        slim@28080000 {
> +            compatible = "qcom,apq8064-slim", "qcom,slim";
> +            reg = <0x28080000 0x2000>, <0x80207c 4>;
> +            reg-names = "ctrl", "slew";
> +            interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&lcc SLIMBUS_SRC>, <&lcc AUDIO_SLIMBUS_CLK>;
> +            clock-names = "iface", "core";
> +            #address-cells = <2>;
> +            #size-cells = <0>;
> +
> +            audio-codec@1,0 {
> +                compatible = "slim217,60";
> +                reg = <1 0>;
> +            };
> +        };
> +    };
