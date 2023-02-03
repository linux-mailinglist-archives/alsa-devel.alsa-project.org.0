Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB031689134
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 08:48:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B13F1E7;
	Fri,  3 Feb 2023 08:48:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B13F1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675410532;
	bh=v23fRqaeFZ2cIiZ3gm7ijyqtFRkwqCdqV1L+97Urrcc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QlLBrHoJEgCvZnZFvu9AZoZ3Ptr0XhE5gDqQ47urAkUoYx68FyzEJBNp1SeBuofJi
	 ows2CgOueAyMqx9dbNoY94n197jSrujdAZEhBWN9VVWWSQZ0069mzS2/vFPRj4zI0j
	 hb/SPBLyCilMFIExOFRh0rNW1rEGGJqICZxy0Alo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5644BF80169;
	Fri,  3 Feb 2023 08:47:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15D37F800E3; Fri,  3 Feb 2023 08:47:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7375FF800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 08:47:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7375FF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PAIAnE2B
Received: by mail-wm1-x335.google.com with SMTP id o36so3201250wms.1
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 23:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GlzCgLEPZ69auNVfPwbs/k4QDSpIwTCL3k0EZ2tSlBM=;
 b=PAIAnE2BATdpoT1ce0rQ28Kakyc6oP+fK5eZ7MZGwg6pO0XkkLHR7K7O8G78u6CYss
 UNxfDmBs6rd+BrxkIDHyWrTk3BcLUe/pcMgDWNjxUnak4ofjUgNunQDfhh0TQHpCLW6H
 3yp5orDjScmQzNszwo+a6N4OVYlTAIRrdVlU3KmDxhQB9A50lCN4NsStbBLQoj8MCs+Q
 oDqrHrRuQowpbtCJ2S/oITMD256IM2nFXK7xBqu+f/AyTF4xmi981Ck7ZcZKju5k6b9H
 2w4uiTB1MX8Y9HQZPhic1E8RudHoexDIQtJGEBYVlsPyrrlAqcGeGpEtspmNYs4m5oTm
 7sZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GlzCgLEPZ69auNVfPwbs/k4QDSpIwTCL3k0EZ2tSlBM=;
 b=L5BImpJkXqHdwJq15z6I/Bij8+yCzpW6WzKdD7VFcdjubPJqIeAIh0TD0hbe31K/vT
 uM9QacyHnge36F28JYICUakE6+7VTbOOnFusCQZhQIT2/2Rm67/d7yVLDJYtq9a3EcZh
 HTj1swYyxABTBhgoj1EldEJW9hgc9UdX8SGhIG9brfPMw3Tjvm+ezWhVRp1y1oZz4uxX
 g/nVtTqwiKGtC6kHFFzx9A9DAXKf77zXJ8VIG6uPgMocMH9/4Xa6VAO7HtyqLFu65xNx
 L8nVyMh9QyPIqFYCkJ+f4WbK5POjSPdyW2qCwXsAmy3zjViag1t76WVmFC8wgfPxBaDg
 KvgA==
X-Gm-Message-State: AO0yUKWsklwKd5vyTkHyeS2/iwu1CKmjoTYQIQxUezSCAreKOa41ZgMz
 r8Edp6S7CrqGt4TBsZNfw+68Wg==
X-Google-Smtp-Source: AK7set8b6KYrDgJsDUasCRzNkPZH+h6KVrjKEJhah8oImVOIgUZnGx02Z+tXqXj/z7YbwM/PbXFd/w==
X-Received: by 2002:a05:600c:c06:b0:3dc:5a7c:f8ad with SMTP id
 fm6-20020a05600c0c0600b003dc5a7cf8admr10740538wmb.21.1675410462746; 
 Thu, 02 Feb 2023 23:47:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a5d604b000000b002b57bae7174sm1347095wrt.5.2023.02.02.23.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 23:47:42 -0800 (PST)
Message-ID: <e7ad1251-12b5-4161-8b51-f51ee77d0eb2@linaro.org>
Date: Fri, 3 Feb 2023 08:47:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/9] ASoC: dt-bindings: meson: convert axg tdm formatters
 to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-5-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202183653.486216-5-jbrunet@baylibre.com>
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
> Convert the DT binding documentation for the Amlogic tdm formatters to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../sound/amlogic,axg-tdm-formatters.txt      | 36 --------
>  .../sound/amlogic,axg-tdm-formatters.yaml     | 90 +++++++++++++++++++
>  2 files changed, 90 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
> deleted file mode 100644
> index 5996c0cd89c2..000000000000
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -* Amlogic Audio TDM formatters
> -
> -Required properties:
> -- compatible: 'amlogic,axg-tdmin' or
> -	      'amlogic,axg-tdmout' or
> -	      'amlogic,g12a-tdmin' or
> -	      'amlogic,g12a-tdmout' or
> -	      'amlogic,sm1-tdmin' or
> -	      'amlogic,sm1-tdmout
> -- reg: physical base address of the controller and length of memory
> -       mapped region.
> -- clocks: list of clock phandle, one for each entry clock-names.
> -- clock-names: should contain the following:
> -  * "pclk"     : peripheral clock.
> -  * "sclk"     : bit clock.
> -  * "sclk_sel" : bit clock input multiplexer.
> -  * "lrclk"    : sample clock
> -  * "lrclk_sel": sample clock input multiplexer
> -
> -Optional property:
> -- resets: phandle to the dedicated reset line of the tdm formatter.
> -
> -Example of TDMOUT_A on the S905X2 SoC:
> -
> -tdmout_a: audio-controller@500 {
> -	compatible = "amlogic,axg-tdmout";
> -	reg = <0x0 0x500 0x0 0x40>;
> -	resets = <&clkc_audio AUD_RESET_TDMOUT_A>;
> -	clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
> -		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
> -		 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
> -		 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
> -		 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
> -	clock-names = "pclk", "sclk", "sclk_sel",
> -		      "lrclk", "lrclk_sel";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
> new file mode 100644
> index 000000000000..f618724411de
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Audio AXG TDM formatters
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +allOf:
> +  - $ref: component-common.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller@.*"

Drop.

> +
> +  compatible:
> +    oneOf:

Drop oneOf.

> +      - enum:
> +          - amlogic,g12a-tdmout
> +          - amlogic,sm1-tdmout
> +          - amlogic,axg-tdmout
> +          - amlogic,g12a-tdmin
> +          - amlogic,sm1-tdmin
> +          - amlogic,axg-tdmin
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +      - description: Bit clock
> +      - description: Bit clock input multiplexer
> +      - description: Sample clock
> +      - description: Sample clock input multiplexer
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: sclk
> +      - const: sclk_sel
> +      - const: lrclk
> +      - const: lrclk_sel
> +
> +  reg:
> +    maxItems: 1

Missing property resets

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +if:

Put it under allOf.

> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - amlogic,g12a-tdmin
> +          - amlogic,sm1-tdmin
> +          - amlogic,g12a-tdmout
> +          - amlogic,sm1-tdmout
> +then:
> +  properties:
> +    resets:

Properties are defined in top-level. You can disallow it for other variants.

> +      items:
> +        - description: Dedicated device reset line
> +
> +  required:
> +    - resets
Best regards,
Krzysztof

