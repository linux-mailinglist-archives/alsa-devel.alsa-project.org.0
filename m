Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBA2389A36
	for <lists+alsa-devel@lfdr.de>; Thu, 20 May 2021 01:56:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53D931672;
	Thu, 20 May 2021 01:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53D931672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621468613;
	bh=s84Cw9CfVpMQLPuumZ/zIJX4dDd5yHdrF0wAUc/qJE0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qXQw+CbE4um1jI/3CA5W1fpX+S6PnfMa2ZUv1khkS0T/qQ1JNdb7I7QEiPOJQcbR4
	 /eMjT7ld/2gjENoKl1y0iIgcHPVBLhNZORXax9+qp4nV+o3VccqSSNJsqgWMmiw1t3
	 20GHALGlqB/E8J3QsN/XppneLKSAQH1K+bbO6VdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8978F80246;
	Thu, 20 May 2021 01:55:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DABD2F8016E; Thu, 20 May 2021 01:55:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4241F80127
 for <alsa-devel@alsa-project.org>; Thu, 20 May 2021 01:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4241F80127
Received: by mail-oi1-f175.google.com with SMTP id c196so6561851oib.9
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 16:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XzJtZgK1H/5xjeQJaiKS1v1HDO3VL37NAXKpynjn5Xg=;
 b=bPkPCkYo3iYUDnDUyBm9hr3g+f+WUpzGEunr6gIqE8MW6lJFy535eRxlTv1RT52FY/
 eRKpHCHjcpWYdQ+6UfKvJvTONb2d8ObWwcN7gZCR17VqxBnA24pD8d4Tix5ng3tXqlV2
 4rsWIKWikmIgyTZC8X+SIakNXXT7gRNhr/DcnpY3pg/rzaLsBHe3oplIJJAaFygwnxLl
 dp3G+dw2yy43jf2PwJIg3m/z9hu87LIm1TRIe9ZEMrhL+s99N2UQygYgQj2QFWiNkF0P
 yMBgNZqw6dKjE0LE5ynGYa6VqLpRWo6IlHeyn8d49YZyIjr/kCxt90ZNFqf6fmr6N31x
 3wEg==
X-Gm-Message-State: AOAM533KsquCaCLyun4/QD3AKEfrpQFvUhreI1xDT7bMrJzPng8fbz5M
 moLauWhqikGZq8Z6FF+JoA==
X-Google-Smtp-Source: ABdhPJwfyiI6bLQxODhV52EzLe6i6OomkP63escY33YOfKsdPEuPMlmDEqQElPoFpt0WnHkiY6ywzw==
X-Received: by 2002:a54:4411:: with SMTP id k17mr1323323oiw.66.1621468514597; 
 Wed, 19 May 2021 16:55:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y7sm273535oto.60.2021.05.19.16.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 16:55:11 -0700 (PDT)
Received: (nullmailer pid 3909826 invoked by uid 1000);
 Wed, 19 May 2021 23:54:54 -0000
Date: Wed, 19 May 2021 18:54:54 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v6 1/9] ASoC: dt-bindings: wcd938x: add bindings for
 wcd938x
Message-ID: <20210519235454.GA3752127@robh.at.kernel.org>
References: <20210518143759.16837-1-srinivas.kandagatla@linaro.org>
 <20210518143759.16837-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518143759.16837-2-srinivas.kandagatla@linaro.org>
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

On Tue, May 18, 2021 at 03:37:51PM +0100, Srinivas Kandagatla wrote:
> Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
> connected over SoundWire. This device has two SoundWire device RX and
> TX respectively, supporting 4 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
> 7 x TX diff inputs, 8 DMICs, MBHC.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,wcd938x.yaml          | 148 ++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
> new file mode 100644
> index 000000000000..b04c5e90e283
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
> @@ -0,0 +1,148 @@
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
> +    enum:
> +      - qcom,wcd9380-codec
> +      - qcom,wcd9385-codec
> +
> +  reset-gpios:
> +    description: GPIO spec for reset line to use
> +    maxItems: 1
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
> +  qcom,tx-device:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Only 1 and no args, so just 'phandle'.

> +    maxItems: 1

And drop this.

> +    description: A reference to Soundwire tx device phandle
> +
> +  qcom,rx-device:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1

And here.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +    description: A reference to Soundwire rx device phandle
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
> +  qcom,hphl-jack-type-normally-closed:
> +    description: Indicates that HPHL jack switch type is normally closed
> +    type: boolean
> +
> +  qcom,ground-jack-type-normally-closed:
> +    description: Indicates that Headset Ground switch type is normally closed
> +    type: boolean
> +
> +  qcom,mbhc-headset-vthreshold-microvolt:
> +    description: Voltage threshold value for headset detection
> +    minimum: 0
> +    maximum: 2850000
> +
> +  qcom,mbhc-headphone-vthreshold-microvolt:
> +    description: Voltage threshold value for headphone detection
> +    minimum: 0
> +    maximum: 2850000
> +
> +  qcom,mbhc-buttons-vthreshold-microvolt:
> +    description:
> +      Array of 8 Voltage threshold values corresponding to headset
> +      button0 - button7
> +    minItems: 8
> +    maxItems: 8
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reset-gpios
> +  - qcom,tx-device
> +  - qcom,rx-device
> +  - qcom,micbias1-microvolt
> +  - qcom,micbias2-microvolt
> +  - qcom,micbias3-microvolt
> +  - qcom,micbias4-microvolt
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    codec {
> +        compatible = "qcom,wcd9380-codec";
> +        reset-gpios = <&tlmm 32 0>;
> +        #sound-dai-cells = <1>;
> +        qcom,tx-device = <&wcd938x_tx>;
> +        qcom,rx-device = <&wcd938x_rx>;
> +        qcom,micbias1-microvolt = <1800000>;
> +        qcom,micbias2-microvolt = <1800000>;
> +        qcom,micbias3-microvolt = <1800000>;
> +        qcom,micbias4-microvolt = <1800000>;
> +        qcom,hphl-jack-type-normally-closed;
> +        qcom,ground-jack-type-normally-closed;
> +        qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> +        qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> +    };
> +
> +    /* ... */
> +
> +    soundwire@3210000 {
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        reg = <0x03210000 0x2000>;
> +        wcd938x_rx: codec@0,4 {
> +            compatible = "sdw20217010d00";
> +            reg  = <0 4>;
> +            qcom,rx-port-mapping = <1 2 3 4 5>;
> +        };
> +    };
> +
> +    soundwire@3230000 {
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        reg = <0x03230000 0x2000>;
> +        wcd938x_tx: codec@0,3 {
> +            compatible = "sdw20217010d00";
> +            reg  = <0 3>;
> +            qcom,tx-port-mapping = <2 3 4 5>;
> +        };
> +    };
> +
> +...
> -- 
> 2.21.0
> 
