Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 408D2606840
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 20:36:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C877A9BD3;
	Thu, 20 Oct 2022 20:35:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C877A9BD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666290959;
	bh=7bOTFa1SESQomUIunjFPnoqJepLVjNPvO0VBmhHHwzA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WrMKCgnWVHBomW1lzBYlknKzXncSCyFWa2JyRddu5Xm9A5MZpiL9y+4gX/kHj8kU/
	 e76zKFe3PGHEmATNZH+611KH3zqCENrNNt4llLXmzaG7c9GUgwhMsXkZBLZ+q3vFNF
	 phBMkTi8cxXrorH9Fjfs7GGMeIrBblF5ZzJMh8DU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B648F800B5;
	Thu, 20 Oct 2022 20:35:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 009C9F804D8; Thu, 20 Oct 2022 20:35:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C47AF800B5
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 20:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C47AF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pipBb0x+"
Received: by mail-qk1-x734.google.com with SMTP id a5so507178qkl.6
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 11:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HY9CsyVy0myxvaLITwUS3Qt0lBRKhpdzPVxX3EBA/CY=;
 b=pipBb0x+cr2R0D3fuF6NLkbPQDO0qI5bzzvLkE1sgy/MUEA7P6YiYSeCFkzr45wkyp
 76YJPkPeQNs/Kg3itSirub4zm2GEh2NYUWsqKOHai15PQ1N6jFWHPXhRbw7VC60dsT2K
 myD8HBZtN6L34bwnOnLzTYgH7EjRrxaPyvPHfQWf8g+pmsWPY5jGVtu6COzIOnYVFih3
 YJU+geOvXw+G2zx/9MLP55wKP1I9dAPZPzb1NWdnww8gC5kkY7ZMeoBuDMbTK1t132k0
 XzSKbAUg2qjY6iMTgJ8t4W2MgiYfFj0KZDte+9Xj3zgI3pOj5ICnGJLkhxaqfx9rYbfz
 yRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HY9CsyVy0myxvaLITwUS3Qt0lBRKhpdzPVxX3EBA/CY=;
 b=JDM8jmxRI5Ke/q2t88JYaAbjrkqrXT2O6gHBY7U7O+1Gl0sYjMp+y+eeeOx7/hTApY
 x4V9Y3NBurVRuzkS6lk/P3X8nWW9U6qcp4UhVDL2K2FhkirSZMazzmQG44p/eJ8jBIZI
 hqY6h75oI77i2NY7Uk4pgbNRv4e77eacnYZs9BWJbsqLn4Krm3VUZ4B7VmUXN3JUYvWW
 ToRNHhXEaFznpdJNrbgw0eL7IKCEI/8a/BgeyJGNVL5xFEg/+z3iqHlN9WpI466BOSZ8
 OUP6a95XHuch2Hv1QKtwLVkGINex21HBHHyHOFeunCr0l1z+OPNoTeiHv8S2IZJ5yJP1
 GbdA==
X-Gm-Message-State: ACrzQf1jHZ88+1XHMkv2nzhELOlJI1rVBAeJLLYVi1ByM5wWmmpihbtg
 cdf97Ku6K3lbROWseBgxVBPBYQ==
X-Google-Smtp-Source: AMsMyM6/i6uGqja8uWjQHRC3kvF+iBiGDVTF7QSKqI8YynKmQZGi7xBdrUtDnUCwkHk0gZiKfL3PQA==
X-Received: by 2002:a37:5d2:0:b0:6ee:7931:825a with SMTP id
 201-20020a3705d2000000b006ee7931825amr10334659qkf.591.1666290895303; 
 Thu, 20 Oct 2022 11:34:55 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net.
 [72.83.177.149]) by smtp.gmail.com with ESMTPSA id
 s7-20020a05620a254700b006ec59941acasm7980520qko.11.2022.10.20.11.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 11:34:54 -0700 (PDT)
Message-ID: <77087a4a-ac21-c622-59ec-1b308c37cc2c@linaro.org>
Date: Thu, 20 Oct 2022 14:34:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3] dt-bindings: soundwire: Convert text bindings to DT
 Schema
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 quic_plai@quicinc.com, bgoswami@quicinc.com, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1666271160-22424-1-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1666271160-22424-1-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
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

On 20/10/2022 09:06, Srinivasa Rao Mandadapu wrote:
> Convert soundwire text bindings to DT Schema format.
> 
> Update interrupt property items as per device tree,
> as it is not appropriately described in text file.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
> Signed-off-by: Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>
> ---

Thank you for your patch. There is something to discuss/improve.

> -};
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> new file mode 100644
> index 0000000..12cd3c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
> @@ -0,0 +1,184 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soundwire/qcom,soundwire.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SoundWire Controller
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +  - Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> +
> +description:
> +  The Qualcomm SoundWire controller along with its board specific bus parameters.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,soundwire-v1.3.0
> +      - qcom,soundwire-v1.5.0
> +      - qcom,soundwire-v1.5.1
> +      - qcom,soundwire-v1.6.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: specify the SoundWire controller core.
> +      - description: specify the Soundwire controller wake IRQ.

The second property was optional. You need to test DTS before sending
the bindings. Please run `make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

IOW, you need here:
  minItems: 1

> +
> +  interrupt-names:

  minItems: 1

> +    items:
> +      - const: wakeup
> +      - const: core

That's definitely wrong order and should not pass any tests...

> +
> +  clocks:
> +    items:
> +      - description: iface clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +
> +  resets:
> +    items:
> +      - description: SWR_AUDIO_CGCR RESET
> +
> +  reset-names:
> +    items:
> +      - const: swr_audio_cgcr
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +  '#address-cells':
> +    const: 2
> +
> +  '#size-cells':
> +    const: 0
> +
> +  wakeup-source: true
> +
> +  qcom,din-ports:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: count of data in ports
> +
> +  qcom,dout-ports:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: count of data out ports
> +
> +  qcom,ports-word-length:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: size of payload channel sample.
> +    maxItems: 5
> +
> +  qcom,ports-sinterval-low:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: sample interval low of each data port.
> +    maxItems: 5
> +
> +  qcom,ports-offset1:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: payload transport window offset1 of each data port.

You miss here some pieces of original description,

> +    maxItems: 5
> +
> +  qcom,ports-offset2:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: payload transport window offset2 of each data port.

Ditto - and in other places.

> +    maxItems: 5
> +
> +  qcom,ports-lane-control:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: identify which data lane the data port uses.
> +    maxItems: 5
> +
> +  qcom,ports-block-pack-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: indicate the block packing mode.
> +    maxItems: 5
> +
> +  qcom,ports-hstart:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: identifying lowerst numbered coloum in SoundWire frame.
> +    maxItems: 5
> +
> +  qcom,ports-hstop:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: identifying highest numbered coloum in SoundWire frame.
> +    maxItems: 5
> +
> +  qcom,ports-block-group-count:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    description: indicate how many sample intervals are combined into a payload.
> +    maxItems: 5
> +
> +  codec@4:

It's too specific. What if different device uses different address?

You need patternProperties "^codec@[0-9a-f]+$"


> +    $ref: ../sound/qcom,wcd938x-sdw.yaml#

Full path, so /schemas/sound/qcom,wcd.....

Cannot we have other codecs attached? For example check SC7280 IDP,
SM8250 MTP, RB5.


> +    description:
> +      Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC.
> +      It has RX and TX Soundwire slave devices. This bindings is for the
> +      slave devices.
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - '#sound-dai-cells'
> +  - '#address-cells'
> +  - '#size-cells'
> +  - qcom,dout-ports
> +  - qcom,din-ports
> +  - qcom,ports-sinterval-low
> +  - qcom,ports-offset1
> +  - qcom,ports-offset2
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
> +
> +    soundwire@3210000 {
> +        compatible = "qcom,soundwire-v1.6.0";
> +        reg = <0x03210000 0x2000>;
> +
> +        interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
> +                     <&pdc 130 IRQ_TYPE_LEVEL_HIGH>;
> +

Missing interrupt names.

Best regards,
Krzysztof

