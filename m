Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 378526C9386
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Mar 2023 11:28:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 635B79F6;
	Sun, 26 Mar 2023 11:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 635B79F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679822931;
	bh=B0sx8isT0COYeesptZcweVqpfbi0EYPOVRiXQq7ORj4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XYkAOmxo9KiG5xrS67I1RdUN+Pb1Pp4z0P9a99c+TZgGbXIJML9IdE4PhB5vzmKil
	 XQSCmsX8SdP00PZ5QQgk5EAfQv7SOi+S8Pw4TWTW7KhPi8TCVMpHE0XBPHl+ZyjEta
	 ou1kSrP5b7EJyic806g6zOZwP8iP91I7hIhr0VXo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 669B2F8024E;
	Sun, 26 Mar 2023 11:27:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F195F80272; Sun, 26 Mar 2023 11:27:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C45BF800C9
	for <alsa-devel@alsa-project.org>; Sun, 26 Mar 2023 11:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C45BF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PTa4unM2
Received: by mail-ed1-x52d.google.com with SMTP id h8so24261075ede.8
        for <alsa-devel@alsa-project.org>;
 Sun, 26 Mar 2023 02:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679822817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VahlOo5KlwSRji1K/2qUnu3qE76o4itfuZQQxoCQsXQ=;
        b=PTa4unM2NVPnWXcwefj8aetMPoDppDQtgUbk6dZ0/ItkMDWynTY3hyV4rKF39NyJGN
         hVsPi2kX8sl8H5A4wF01rf6giIOf369UdEmH6XYwWmaek2VRY608qvfiio+X9ZQkZyBL
         oteYqq1LCp8kDzrY34yZXkxI2D/3P2v56nkGU8L/msN3rEHWuoYN2tKbHqIA///7rH0s
         UZBJFCzHPAF0yHStNjHc/a8nDgsYSC2J3s6n9Z5YpZBowy8tszYM6ZqfvK+twZmYGUDs
         2ofFN+bvgYr+6FDHQpsp/hJs47Kmsny1ZKlUAGSFlJ6wraHZ5WJL0e4SXKczq+x1R2ID
         QtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679822817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VahlOo5KlwSRji1K/2qUnu3qE76o4itfuZQQxoCQsXQ=;
        b=ti/TwVIhIMR9oiYOVDP//E17WgTPiQbq72anSm1xa1GV+13ojZ1WvXE5YZ+zRpWrRr
         eFXggJlOGtTOgGacvUW78ORu5x9E2e4J8cQafiLrnQDf7jHVeLPq9W2y6zNLX6klXGXm
         OjiTW9GTS2uQBG05c8CU6XdkQT/tCb0vZ1iwnnbk5jGhNKF8tDsvF+xB4B3thxFpgBSZ
         sjlsA6kLWgzHphaRUte+BwUVoRItloLg1pjf/qxkPpCgPxbqUZVGZGorigsThZ+LDHyT
         s/gvSM0Axwj3pk7m/yNe9ar2drGWESXrdsphF8rMjKJRxFuE0jMi/Ofz9itV0EldeaoT
         cw1Q==
X-Gm-Message-State: AAQBX9cjLbQPvJ2Y4cw1E232IeUVl1IcD8ujqJimKvpDqzUsMEL1YLmK
	ji5/hcnqVvUt6uwDJu5NwkVoPA==
X-Google-Smtp-Source: 
 AKy350aKep/8NAQS3ScZSU6WqB5Ppr/tKZPCLWKiF6NI2LIizmmJ0+03GiPNzUYSVh9U7ITxLM5Rlw==
X-Received: by 2002:a05:6402:2022:b0:4fd:2675:3785 with SMTP id
 ay2-20020a056402202200b004fd26753785mr9170207edb.22.1679822817074;
        Sun, 26 Mar 2023 02:26:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6cac:926d:a4f2:aa09?
 ([2a02:810d:15c0:828:6cac:926d:a4f2:aa09])
        by smtp.gmail.com with ESMTPSA id
 u27-20020a50951b000000b004bf999f8e57sm13249082eda.19.2023.03.26.02.26.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 02:26:56 -0700 (PDT)
Message-ID: <4762f4a1-5e99-4e5a-72c0-9c4c61cdc856@linaro.org>
Date: Sun, 26 Mar 2023 11:26:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: ak4458: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>, shengjiu.wang@nxp.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.baluta@nxp.com
References: <20230325201007.13006-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230325201007.13006-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: US6HISMUGP7H5TWN3FRQNMC24EQS3AQ6
X-Message-ID-Hash: US6HISMUGP7H5TWN3FRQNMC24EQS3AQ6
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/US6HISMUGP7H5TWN3FRQNMC24EQS3AQ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/03/2023 21:10, Saalim Quadri wrote:
> Convert the AK4458 audio DAC bindings to DT schema.
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---
>  .../devicetree/bindings/sound/ak4458.txt      | 28 ---------
>  .../bindings/sound/asahi-kasei,ak4458.yaml    | 62 +++++++++++++++++++
>  2 files changed, 62 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/ak4458.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ak4458.txt b/Documentation/devicetree/bindings/sound/ak4458.txt
> deleted file mode 100644
> index 0416c14895d6..000000000000
> --- a/Documentation/devicetree/bindings/sound/ak4458.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -AK4458 audio DAC
> -
> -This device supports I2C mode.
> -
> -Required properties:
> -
> -- compatible : "asahi-kasei,ak4458" or "asahi-kasei,ak4497"
> -- reg : The I2C address of the device for I2C
> -
> -Optional properties:
> -- reset-gpios: A GPIO specifier for the power down & reset pin
> -- mute-gpios: A GPIO specifier for the soft mute pin
> -- AVDD-supply: Analog power supply
> -- DVDD-supply: Digital power supply
> -- dsd-path: Select DSD input pins for ak4497
> -            0: select #16, #17, #19 pins
> -            1: select #3, #4, #5 pins
> -
> -Example:
> -
> -&i2c {
> -	ak4458: dac@10 {
> -		compatible = "asahi-kasei,ak4458";
> -		reg = <0x10>;
> -		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>
> -		mute-gpios = <&gpio1 11 GPIO_ACTIVE_HIGH>
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
> new file mode 100644
> index 000000000000..b97aee96fa17
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/asahi-kasei,ak4458.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AK4458 audio DAC
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - asahi-kasei,ak4458
> +      - asahi-kasei,ak4497
> +
> +  reg:
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog power supply
> +
> +  dvdd-supply:
> +    description: Digital power supply
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  mute-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO used to mute all the outputs
> +
> +  dsd-path:
> +    description: Select DSD input pins for ak4497
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    oneOf:
> +      - const: 0
> +        description: select #16, #17, #19 pins
> +      - const: 1
> +        description: select #3, #4, #5 pins
> +
> +required:
> +  - compatible
> +  - reg
> +

Based on driver:

allOf:
  - if:
      properties:
        compatible:
          enum:
            - ak4458.....
  then:
    properties:
      dsd-path: false

> +additionalProperties: false
> +
Best regards,
Krzysztof

