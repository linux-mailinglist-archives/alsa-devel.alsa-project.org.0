Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A458349F23
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 02:53:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFD7C1660;
	Fri, 26 Mar 2021 02:52:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFD7C1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616723627;
	bh=GlgLJrXS47vIG01MILOKNp/6B1iWMK4BUhkc7CkLJkQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cPEbS4h39ZEoLWCBgUtIp2ep80n14H0NS7iivZioKN8q6at+f/3nr5J40sUJpx+Uo
	 AVwuZo0hwVjClzlqBlQYyNg2YBdwJ9DqVOKT9hAeF1eDziecg/hVrlfLkqeQCNAfat
	 HQeGPTb4pcT1hgL5/AviIZ8mILjTBUCAwwZ1hLE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37860F80104;
	Fri, 26 Mar 2021 02:52:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD74BF8025F; Fri, 26 Mar 2021 02:52:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17998F80104
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 02:52:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17998F80104
Received: by mail-il1-f176.google.com with SMTP id z9so3816337ilb.4
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 18:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SBBDzJB1veA3jjgPUkxR07NhQKbPrftIzj05sWg545E=;
 b=J03+UutQ1sEFw9kw45xPBOL0xogVblIjs464ESyb9hKZZfcKDjJgenIQJVFVN1nopp
 1a9NVqStFhOF0s3fnw5vx8aE0L5HaIAdBnxwyWlk0680tIwCb/hCPd8snQqxTvABeOLt
 /tRZenTIPmESxYjhtvI0fdjJJYlTYGF5iEASGsjEJIeGZuSlv5Q+8cJaKcuzN0e/LN9N
 niLBUWXyevVdUKGlGVZse8hT5IRDmvolWSZYbT9qW0i4waypI1mYDcK8I5EeKpEXDj+E
 D9uk//CQX222Jgs3hoU86gsUEdBEhMNKEFgTTN8p+xPGTeqO4dTiSMmQtmNnbcVQuwLi
 kB/A==
X-Gm-Message-State: AOAM531tKa/wUFZZ59MIAcLrS1n9aVHna7aTjsENu54Vv4x3hu98GQRl
 mOwvuc8ifghEV+jKAuzzww==
X-Google-Smtp-Source: ABdhPJxctmv3VzCtMljs/sOClUGWY+n4cUYEn+fqKf7+K54xR7A1xQD9Vwe/TfNRfu8FQqh19ZmNzA==
X-Received: by 2002:a92:ce4a:: with SMTP id a10mr7654040ilr.102.1616723522437; 
 Thu, 25 Mar 2021 18:52:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id q207sm3696255iod.6.2021.03.25.18.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:52:01 -0700 (PDT)
Received: (nullmailer pid 2163620 invoked by uid 1000);
 Fri, 26 Mar 2021 01:52:00 -0000
Date: Thu, 25 Mar 2021 19:52:00 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: wcd938x: add bindings for
 wcd938x
Message-ID: <20210326015200.GA2160488@robh.at.kernel.org>
References: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
 <20210319092919.21218-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319092919.21218-2-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org
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

On Fri, Mar 19, 2021 at 09:29:13AM +0000, Srinivas Kandagatla wrote:
> Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
> connected over SoundWire. This device has two SoundWire device RX and
> TX respectively, supporting 4 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
> 7 x TX diff inputs, 8 DMICs, MBHC.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,wcd938x.yaml          | 165 ++++++++++++++++++
>  1 file changed, 165 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
> new file mode 100644
> index 000000000000..fe47e483d4b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
> @@ -0,0 +1,165 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,wcd938x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Qualcomm WCD9380/WCD9385 Audio Codec
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC.
> +  It has RX and TX Soundwire slave devices.
> +
> +properties:
> +  compatible:
> +    const: sdw20217010d00
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO spec for reset line to use
> +    maxItems: 1
> +
> +  direction:

Needs a description and vendor prefix.

> +    oneOf:
> +      - const: rx
> +      - const: tx

Better expressed as an 'enum'

> +
> +  vdd-buck-supply:
> +    description: A reference to the 1.8V buck supply
> +
> +  vdd-rxtx-supply:
> +    description: A reference to the 1.8V rx supply
> +
> +  vdd-io-supply:
> +    description: A reference to the 1.8V I/O supply
> +
> +  qcom,micbias1-microvolt:
> +    description: micbias1 voltage
> +    minimum: 1800000
> +    maximum: 2850000
> +
> +  qcom,micbias2-microvolt:
> +    description: micbias2 voltage
> +    minimum: 1800000
> +    maximum: 2850000
> +
> +  qcom,micbias3-microvolt:
> +    description: micbias3 voltage
> +    minimum: 1800000
> +    maximum: 2850000
> +
> +  qcom,micbias4-microvolt:
> +    description: micbias4 voltage
> +    minimum: 1800000
> +    maximum: 2850000
> +
> +  qcom,mbhc-hphl-switch:
> +    description: Indicates that HPHL switch type is normally closed
> +    type: boolean
> +
> +  qcom,mbhc-ground-switch:
> +    description: Indicates that Headset Ground switch type is normally closed
> +    type: boolean
> +
> +  qcom,mbhc-button0-vthreshold-microvolt:
> +    description: Voltage threshold value headset button0
> +    minimum: 0
> +    maximum: 500000
> +
> +  qcom,mbhc-button1-vthreshold-microvolt:
> +    description: Voltage threshold value headset button1
> +    minimum: 0
> +    maximum: 500000
> +
> +  qcom,mbhc-button2-vthreshold-microvolt:
> +    description: Voltage threshold value headset button2
> +    minimum: 0
> +    maximum: 500000
> +
> +  qcom,mbhc-button3-vthreshold-microvolt:
> +    description: Voltage threshold value headset button3
> +    minimum: 0
> +    maximum: 500000
> +
> +  qcom,mbhc-button4-vthreshold-microvolt:
> +    description: Voltage threshold value headset button4
> +    minimum: 0
> +    maximum: 500000
> +
> +  qcom,mbhc-button5-vthreshold-microvolt:
> +    description: Voltage threshold value headset button5
> +    minimum: 0
> +    maximum: 500000
> +
> +  qcom,mbhc-button6-vthreshold-microvolt:
> +    description: Voltage threshold value headset button6
> +    minimum: 0
> +    maximum: 500000
> +
> +  qcom,mbhc-button7-vthreshold-microvolt:
> +    description: Voltage threshold value headset button7
> +    minimum: 0
> +    maximum: 500000
> +
> +  qcom,port-mapping:
> +    description: |
> +      Specifies static port mapping between slave and master ports.
> +      In the order of slave port index.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 4
> +    maxItems: 5
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - qcom,micbias1-microvolt
> +  - qcom,micbias2-microvolt
> +  - qcom,micbias3-microvolt
> +  - qcom,micbias4-microvolt
> +  - qcom,port-mapping
> +  - qcom,mbhc-hphl-switch
> +  - qcom,mbhc-ground-switch
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soundwire@3230000 {
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        reg = <0x03230000 0x2000>;
> +
> +        codec@0,3 {
> +            compatible = "sdw20217010d00";
> +            reg  = <0 3>;
> +            reset-gpios = <&tlmm 32 0>;
> +            direction = "tx";
> +            #sound-dai-cells = <1>;
> +            qcom,micbias1-microvolt = <1800000>;
> +            qcom,micbias2-microvolt = <1800000>;
> +            qcom,micbias3-microvolt = <1800000>;
> +            qcom,micbias4-microvolt = <1800000>;
> +            qcom,mbhc-hphl-switch;
> +            qcom,mbhc-ground-switch;
> +            qcom,mbhc-button0-vthreshold-microvolt = <75000>;
> +            qcom,mbhc-button1-vthreshold-microvolt = <150000>;
> +            qcom,mbhc-button2-vthreshold-microvolt = <237000>;
> +            qcom,mbhc-button3-vthreshold-microvolt = <500000>;
> +            qcom,mbhc-button5-vthreshold-microvolt = <500000>;
> +            qcom,mbhc-button6-vthreshold-microvolt = <500000>;
> +            qcom,mbhc-button7-vthreshold-microvolt = <500000>;
> +            qcom,port-mapping = <2 3 4 5>;
> +        };
> +    };
> +
> +...
> -- 
> 2.21.0
> 
