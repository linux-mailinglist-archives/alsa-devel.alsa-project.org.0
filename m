Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7F66CB944
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 10:23:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E4781EE;
	Tue, 28 Mar 2023 10:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E4781EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679991798;
	bh=mBO9ClON7j0/dTXAUPkIWLugX+L8ai2U7x/x859rrN0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cE+Yym49LZ4AV1fAn/75uvz5XW/ouCLUnNp2s2GhnURM0ZRdNkGAahfecskXcJgNp
	 gOn1q/2FEuf2AKODu5mfYTxO8CW2G1oxe963+oI7V/IIPG12cPh9ydHdA08VXU3Aba
	 aRG7YLq3zyWJt2raShxmdc5OS1Xash+mLFt0FYeI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 919C0F8024E;
	Tue, 28 Mar 2023 10:22:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3917DF80272; Tue, 28 Mar 2023 10:22:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C7FAF80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 10:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C7FAF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nbVgsIqD
Received: by mail-ed1-x52c.google.com with SMTP id b20so46284996edd.1
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Mar 2023 01:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679991731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TjLk7s/ILNPy05fW3mtB8q+T3+ZfJadYGXeEI//OHA4=;
        b=nbVgsIqDmhYjo2zpI1NxF9G7P13ZUCoomofgad9VxdCmVGj6Nu3tBawyjCSeRg1jxG
         VfmoFSaRMJgNmxHFUVX94hkTRg6MBrIBXssSDToYHfi4JpviP6q2Mi8s6G7SWIg8MNFD
         TWxJUDigcLS9p/mKxugg4jOd6JbZDVbtlVCUg0ngqdgG87zhDsgJIKkRTgU2EEG/uw1e
         hf4nwVFHC6l69V4pdCKqi9jwACf/df8FDrNXCyAjPoLOwsEqZcGND0g3S4oCTwv/UaKZ
         z7VWSxEG6gxsUK3WjBOm99ekdolfW75Wp80rZDW8hgXqd8iiBX0qGdU4j1PVjndDzS51
         yEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679991731;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TjLk7s/ILNPy05fW3mtB8q+T3+ZfJadYGXeEI//OHA4=;
        b=tNoZHQ7JavYc6zy9cNkENPSg+wELh5guSjRB54hOfUHD8pA3YoS3fPg5w0Cy3tWdwz
         45zri9Ck/4ley9j7tGMTLSqO+p04ZrjGSVItsBIg1hyaoijOar7loeMd98YXZfluUgSi
         PIGJgy5TemfbaqPQzIv4/xXE6ipObhsclt1ckd4GVlbVaGRe3ZCJZ2xyyTyI+jWipLhN
         cAwcC/EgOr5iODWH7Hx6EiTrJS2cKNjcoG4YWLZ1b+MozscifpRsusaOo4+pMZsw1Q7B
         1EHr+fJ2IY45vsQxLXi9QOIRcyHsfl/V7O4rU8o3LU3wRzFnNTtS9/ElgtwF1Dw03yB0
         tEVw==
X-Gm-Message-State: AAQBX9fUvBKh6Egl72hDUsoc2IcKKzR4Ua5/rR7IbnfbywTFhm/v8LDf
	mgj0HZQmYzRDgrhT7M27QhivgQ==
X-Google-Smtp-Source: 
 AKy350bZ4edHuT+xY2SDY2CDRsHlxVx3YYIulDNRVyIMWIfCBo1UlW2mN+FmnKM1kDtckc9i+joyjQ==
X-Received: by 2002:aa7:c249:0:b0:4fb:395a:6aa4 with SMTP id
 y9-20020aa7c249000000b004fb395a6aa4mr14791797edo.31.1679991730921;
        Tue, 28 Mar 2023 01:22:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6?
 ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id
 r12-20020a50c00c000000b00501d2f10d19sm11134313edb.20.2023.03.28.01.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 01:22:10 -0700 (PDT)
Message-ID: <0a77e40f-1b6a-38ed-78df-9259959fd2c1@linaro.org>
Date: Tue, 28 Mar 2023 10:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] ASoC: dt-bindings: ak4458: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>, broonie@kernel.org,
 daniel.baluta@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, shengjiu.wang@nxp.com
References: <20230327213250.29199-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327213250.29199-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 27Y26YPP7A2LP6JV6SESZ2JD36RNV5GM
X-Message-ID-Hash: 27Y26YPP7A2LP6JV6SESZ2JD36RNV5GM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/27Y26YPP7A2LP6JV6SESZ2JD36RNV5GM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/03/2023 23:32, Saalim Quadri wrote:
> Convert the AK4458 audio DAC bindings to DT schema.
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---
> Changes:
> V1 -> V2: Use the correct way for dsd-path property
>           Drop ak4458 label form example
> V2 -> V3: ak4458 is the only one that does not support dsd-path, so we
>           do not require to define an array
> 
>  .../devicetree/bindings/sound/ak4458.txt      | 28 --------
>  .../bindings/sound/asahi-kasei,ak4458.yaml    | 65 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 28 deletions(-)
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
> index 000000000000..3842e75d9921
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
> @@ -0,0 +1,65 @@
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

What happened to dsd-path? Do not remove properties from the bindings
without some valid reason.

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const:
> +              asahi-kasei,ak4458

This is one line - const: foo bar

> +
> +    then:
> +      properties:
> +        dsd-path: false
> +
Best regards,
Krzysztof

