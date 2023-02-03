Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 379A0689186
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 09:04:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67E7B86E;
	Fri,  3 Feb 2023 09:04:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67E7B86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675411497;
	bh=eJQI9w6FdZj8Xrz+5ibWHYX+zV1mVgEMp7DmgXYizEI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hO8h9Kh4uwQ/GGAZRd1eFp0lCP5Gqe73XZwLxqa0XKkOwwVhFTjpnczGovAJSxk6P
	 lGXgG445dzFwRyVB7u/2Opcftfgpdg/aj17gU+B83wrLb9OFEFTwwBSvkgrvN74NM4
	 EKZfkS6LjzmNG1y8YrKtXWR2ASGsPkvr4QE17fdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3242F80494;
	Fri,  3 Feb 2023 09:04:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F56BF8047D; Fri,  3 Feb 2023 09:04:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24564F80022
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 09:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24564F80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VKuUvjTl
Received: by mail-wm1-x329.google.com with SMTP id k16so3220949wms.2
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 00:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5n5nzjeWYrzvFdzePtFgwKj0yhRVHY39hpZH36NwKnk=;
 b=VKuUvjTlX5a1O4eMIYlvvN7JZ19j0qIbN/KBLlJ4miIJCOS10HO5/biPIEzBjlaL8j
 wJOvFnYXDW/rxLJ/vC2Rh4Bc2rlBVhGOiku0lr+ZhbhOS8GhO3f9cA2XiAx/6XYRgqkg
 1hIRoiQgIXUBb7+LNc3WmyBNsaY2aS9QxITLZPA//DroZJQRHVZblV0r0NKP4wFGJjC9
 hEZLRCCW7BSem7OjHHznc7HSP0JqQrilzIwTzuvMQEXzFA5sR+evvkygqIRDw/6lx3CI
 K+0VwdnsBVuNbJlu7QE1JAGddfd1n4i74dNRpgLBL6cJ+UbGfpFQREllpUEYWxfnFdRY
 3/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5n5nzjeWYrzvFdzePtFgwKj0yhRVHY39hpZH36NwKnk=;
 b=0lsUOkwkZY5BGrZh34fsYZ081FmOdX996BZXCStcJ+ayfs2Yeui0ef/+U1qzZmNRxb
 91Qbr+d6cAVxAOhqfZJZv+SX3iAucYOyftj4Te0/fx2av/arcuuZnkTyB4iCoa50uP5y
 fWze2SMnPEWasebDq08su6nsRGmepapA4438UJ74q+nvidq/1yQX7O4aaxoARV/UhSGZ
 pU4ZswdKbLn22IC3lP5LEpHFIN94ErI2ZkEg03SHhGDJDgFw2OO+5SEksXXbrpCmnSg9
 msDSdVllyEAfJqase2i8UdVzfMcdmeCJBvrF+uR3uExof76fMBr/Hcr5XC+VSB2goPGi
 MmcA==
X-Gm-Message-State: AO0yUKV0aXjl5wgdkDqOyda9YbiW0zvXka3dIIF14mv066oFvrLSBaZv
 7KcD6mCmkgOsYvAz7RAZ5cXuLg==
X-Google-Smtp-Source: AK7set8ndf5+O2ob1W8PMCs/4gc2zLHq73SYbJTh14EOpBU1XesXZgsXJjKB3N2Hs3hq6EQctUIVZw==
X-Received: by 2002:a05:600c:3d88:b0:3d2:3f55:f757 with SMTP id
 bi8-20020a05600c3d8800b003d23f55f757mr8759506wmb.20.1675411440191; 
 Fri, 03 Feb 2023 00:04:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a05600c330a00b003dc3f195abesm1839823wmp.39.2023.02.03.00.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 00:03:59 -0800 (PST)
Message-ID: <3ac4c315-cff1-b313-6936-2fe5ca87c350@linaro.org>
Date: Fri, 3 Feb 2023 09:03:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 8/9] ASoC: dt-bindings: meson: convert axg spdif output to
 schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-9-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202183653.486216-9-jbrunet@baylibre.com>
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
> Convert the DT binding documentation for the Amlogic axg spdif output to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-spdifout.txt   | 25 ------
>  .../bindings/sound/amlogic,axg-spdifout.yaml  | 83 +++++++++++++++++++
>  2 files changed, 83 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
> deleted file mode 100644
> index 28381dd1f633..000000000000
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -* Amlogic Audio SPDIF Output
> -
> -Required properties:
> -- compatible: 'amlogic,axg-spdifout' or
> -	      'amlogic,g12a-spdifout' or
> -	      'amlogic,sm1-spdifout'
> -- clocks: list of clock phandle, one for each entry clock-names.
> -- clock-names: should contain the following:
> -  * "pclk" : peripheral clock.
> -  * "mclk" : master clock
> -- #sound-dai-cells: must be 0.
> -
> -Optional property:
> -- resets: phandle to the dedicated reset line of the spdif output.
> -
> -Example on the A113 SoC:
> -
> -spdifout: audio-controller@480 {
> -	compatible = "amlogic,axg-spdifout";
> -	reg = <0x0 0x480 0x0 0x50>;
> -	#sound-dai-cells = <0>;
> -	clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
> -		 <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
> -	clock-names = "pclk", "mclk";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
> new file mode 100644
> index 000000000000..c661ce7f8b9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-spdifout.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Audio AXG SPDIF Output
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
> +          - const:
> +              amlogic,axg-spdifout

All usual comments apply.

> +      - items:
> +          - enum:
> +              - amlogic,g12a-spdifout
> +              - amlogic,sm1-spdifout
> +          - const:
> +              amlogic,axg-spdifout
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +      - description: SPDIF output master clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: mclk
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +  - clocks
> +  - clock-names
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - amlogic,g12a-spdifout
> +          - amlogic,sm1-spdifout
> +then:
> +  properties:
> +    resets:
> +      items:
> +        - description: dedicated device reset line
> +
> +  required:
> +    - resets
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/axg-audio-clkc.h>
> +
> +    spdifout: audio-controller@480 {
> +    	compatible = "amlogic,axg-spdifout";

Indentation.


Best regards,
Krzysztof

