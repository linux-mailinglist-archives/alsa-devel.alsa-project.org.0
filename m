Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1B968917D
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 09:03:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 336871E2;
	Fri,  3 Feb 2023 09:03:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 336871E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675411435;
	bh=LB9lpsxPoK2LzdehUl57nAEFp3qfykFg5DEFC4cgF5Y=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QB6n60BkQalH1yg8hzr2/gJVhT+qfqjE0XdyGhJkoyOE9+cKcoNXFAYXUbZqUx7Al
	 sTiBiCTX2DM139XCk21H7CtgaxiBXQ5pOKKLR6S+/LjFuFryx50TsBIJA9KR4/Cvpy
	 PxynVvYSJoYSt5/BIN3Tnw8e07IoTmv9WvvDJvlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D94FF80022;
	Fri,  3 Feb 2023 09:02:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F18EF800E3; Fri,  3 Feb 2023 09:02:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3228CF800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 09:02:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3228CF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rq7Eu0AM
Received: by mail-wm1-x32c.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso5436261wms.0
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 00:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j/BqAshhUQwOb3XRj7imW0y64r6HrCHnAtk8R5uEluo=;
 b=rq7Eu0AMSJYRKJazkb10W8riHm1cFWqvmIxseSjsriU+YZ5WzlIwiVcSb+yMDtoMQc
 QlVwfaT5Xep7ONtrUjmbXYzlVppvCON28e/aFwCduAtLMDMN2WijfK105l4ccfbHj37t
 6OPt7OK58i56G7Bg/cOaZyXUvtHN21w5Zl0b8Hf9EqGfzJa6WG3eLWNEjaFcHdyUXoIU
 f96np5sFywJx3Ioo7OGmN3x+9S6/BXbGI06lxlKVSb8ouzQfNR8QiDI9Ef43YlajuS+k
 noVi5OcH39f3cOBa0lEK6iDEFs3op3kFMNGDq5v2o/+GyOG4JYpUTJlxn0zzKtdGjYMj
 S7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j/BqAshhUQwOb3XRj7imW0y64r6HrCHnAtk8R5uEluo=;
 b=3mRU1Od5FMe1Dvx26Su7aUEfg8Qqs3uqLws6YYNv6erCsVEwlyC+7lVa6fYA+ZdTMX
 sP1PfPpRMNGC2QrVdPQAt1IlYjQasP8I8t/Wf5vjGnUTP+EFwVhkM2DAdplwwvXnEetX
 /6CQWvDFi2PHwFLWRcNcenX0q8zkogmymeKJZHk1LuvmoNSSdDu7sFnBofaSCpi1YeeS
 qq06MYj3gI/01r3SN4y7ZeMDLFFrgZgZAMIUqoWRu3otS0vtArzat2KJBBsXXn6GHGiV
 pQNa70Dzn+T7o9e8AeDdugQQap84uC5yDamK9iHnfbhH0GtI0+8tzSqXDqm3vPP5fGqd
 ygsA==
X-Gm-Message-State: AO0yUKVQe4esmak8sYyVwSgW8ts1q9zQhsmYqzjKzqIKdydvw4LmhYbC
 dWMU/VUq7vC+Fwsen69aQFEQTQ==
X-Google-Smtp-Source: AK7set/Vb7i53/SV+BeFDBTbUdIAfdaPM5HH1OgiUxRcY1vKNvD0ss4XksA9GmnEstT0xSJMQn7pKA==
X-Received: by 2002:a05:600c:1e87:b0:3dc:353c:8b44 with SMTP id
 be7-20020a05600c1e8700b003dc353c8b44mr8608293wmb.5.1675411368292; 
 Fri, 03 Feb 2023 00:02:48 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a7bcd86000000b003dc4480df80sm7031839wmj.34.2023.02.03.00.02.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 00:02:47 -0800 (PST)
Message-ID: <6e6ed493-4748-46ca-7a26-fe9cf6e2377a@linaro.org>
Date: Fri, 3 Feb 2023 09:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/9] ASoC: dt-bindings: meson: convert axg fifo to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-7-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202183653.486216-7-jbrunet@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 02/02/2023 19:36, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg audio FIFOs to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-fifo.txt       |  34 -----
>  .../bindings/sound/amlogic,axg-fifo.yaml      | 116 ++++++++++++++++++
>  2 files changed, 116 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
> deleted file mode 100644
> index fa4545ed81ca..000000000000
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -* Amlogic Audio FIFO controllers
> -
> -Required properties:
> -- compatible: 'amlogic,axg-toddr' or
> -	      'amlogic,axg-toddr' or
> -	      'amlogic,g12a-frddr' or
> -	      'amlogic,g12a-toddr' or
> -	      'amlogic,sm1-frddr' or
> -	      'amlogic,sm1-toddr'
> -- reg: physical base address of the controller and length of memory
> -       mapped region.
> -- interrupts: interrupt specifier for the fifo.
> -- clocks: phandle to the fifo peripheral clock provided by the audio
> -	  clock controller.
> -- resets: list of reset phandle, one for each entry reset-names.
> -- reset-names: should contain the following:
> -  * "arb" : memory ARB line (required)
> -  * "rst" : dedicated device reset line (optional)
> -- #sound-dai-cells: must be 0.
> -- amlogic,fifo-depth: The size of the controller's fifo in bytes. This
> -  		      is useful for determining certain configuration such
> -		      as the flush threshold of the fifo
> -
> -Example of FRDDR A on the A113 SoC:
> -
> -frddr_a: audio-controller@1c0 {
> -	compatible = "amlogic,axg-frddr";
> -	reg = <0x0 0x1c0 0x0 0x1c>;
> -	#sound-dai-cells = <0>;
> -	interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
> -	clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
> -	resets = <&arb AXG_ARB_FRDDR_A>;
> -	fifo-depth = <512>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
> new file mode 100644
> index 000000000000..f6222ad08880
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-fifo.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic AXG Audio FIFO controllers
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller@.*"
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,axg-toddr
> +              - amlogic,axg-frddr
> +      - items:
> +          - enum:
> +              - amlogic,g12a-toddr
> +              - amlogic,sm1-toddr
> +          - const:
> +              amlogic,axg-toddr
> +      - items:
> +          - enum:
> +              - amlogic,g12a-frddr
> +              - amlogic,sm1-frddr
> +          - const:
> +              amlogic,axg-frddr
> +

All usual comments apply.

> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    items:
> +      - description: Memory ARB line
> +      - description: Dedicated device reset line

This won't work without minItems and you should see errors on your DTS
or in dt_binding_check

> +
> +  reset-names: true

minItems
maxItems

> +
> +  amlogic,fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Size of the controller's fifo in bytes
> +
> +required:

Best regards,
Krzysztof

