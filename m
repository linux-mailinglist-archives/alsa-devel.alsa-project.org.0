Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA7D6C4437
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 08:39:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 031B1843;
	Wed, 22 Mar 2023 08:38:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 031B1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679470761;
	bh=sKGJjMoP8fvL6AXbiisJ8Bj1a/nq1rL2Q6j68gmxwUo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VknRvEhg2n3quv9UP+XqYKiAXAOsJtSY/e4OK55C/XGdvSUhYXD5953cQ/oFq0rL5
	 tEX3FZ0j/v0gGGZw6XvNx/NSWad4Gnkp/mKwskg0AKwC5kPc88ide/J1rQKeljMxxw
	 Y7xvre3ShPAIPzdENPYFyDGKDvX9kwp6/R6NZm0M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3EEAF8024E;
	Wed, 22 Mar 2023 08:38:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECDC8F8027B; Wed, 22 Mar 2023 08:38:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9046F8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 08:38:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9046F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ovk6gx9L
Received: by mail-ed1-x534.google.com with SMTP id eg48so68985030edb.13
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Mar 2023 00:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679470683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fIlFrePZXbAkRU2ELLJPQAlw9IYOtHNm0vNBQivbWPw=;
        b=Ovk6gx9LBcuOvIdpF+utI2+huZW2TwdhnKy6VxEQRwDCZA9TY4mdwyiqUaV/Q0Ue4i
         t6IQatnKJOtNRArp68GUTKweCl0MlKdRfog2LEAolB4T7hzD70haB7PLcvCCN85tjkG4
         Ffd3aNS8kKC1a3YTllsPUi64p+SQbAKjB89v0mexDiB0guMTeC6Wuyk503iTcsh+Rv/m
         e0bAZnP3FxV4ktpIDfsRFBoPOauLZJM7zoaWTj9ZRQtq6faWDENs04KxRhFVdiqtiwAb
         pI2vcKOq5KKoCWZREkNLl+6B6AOS7uDTBO7viKCZcHMHZ8sbbw7yPndR6ciO6jVrTeSu
         Pnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679470683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fIlFrePZXbAkRU2ELLJPQAlw9IYOtHNm0vNBQivbWPw=;
        b=ZhwpId0KI8ldQS/wHH0Cv7I2EIXOgI9PKYZNZWw5yO5mZYw3a3mHWeVRFqOFYB0/Do
         PPWXE7h4hvlL6xc5nl4eifLSbEEDvFM0vlKFUURIxTGIYwzgWUqcAE1CMzLtBQBTjsB/
         ps6rHDKSN+cIJag5JTcPWE96KTU/WS/h9ddc7G7oPHRnLLPARqnPrIsIYvuMgjNPEv9J
         46vqXxCmqrq+OiAwmvdmM3DU7ySWsMiJ/SVbxLFFx88dif0X3FBxt324bmy1Flgw3bTm
         Gil87AGgKspxcJzPl0DWcrwm54h4y8Yae0dQB9AHyQiCQuDS4OL4lJibhjVifCoQnNzy
         0Szg==
X-Gm-Message-State: AO0yUKXhu4eKXpFZZiqTqb/TTJyvcHuiz1Rm1gCX2RjrtEp/EpSwZaET
	XxzCiFaS2kgQolPyITjIBTfSFg==
X-Google-Smtp-Source: 
 AK7set9uNqqqp+RTyy+Lsso2YFsulLEsLgbXC/U05maYZvjld3UjEALosJg2dArGoCc9ViY65hz1fA==
X-Received: by 2002:aa7:c84e:0:b0:4fb:e9b8:ca5a with SMTP id
 g14-20020aa7c84e000000b004fbe9b8ca5amr5669909edt.40.1679470682958;
        Wed, 22 Mar 2023 00:38:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6?
 ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id
 g4-20020a170906520400b0093a35f65a30sm1619990ejm.41.2023.03.22.00.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 00:38:02 -0700 (PDT)
Message-ID: <d1559192-8f6d-26e0-ef19-d14ac7987a74@linaro.org>
Date: Wed, 22 Mar 2023 08:38:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: ak5558: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>, broonie@kernel.org,
 robh+dt@kernel.org, lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org
References: <20230321180809.9215-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230321180809.9215-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: D6VQXYQ2UTQ64SXPEGNGFRJ2VVOSYQ4Y
X-Message-ID-Hash: D6VQXYQ2UTQ64SXPEGNGFRJ2VVOSYQ4Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D6VQXYQ2UTQ64SXPEGNGFRJ2VVOSYQ4Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/03/2023 19:08, Saalim Quadri wrote:
> Convert the AK5558 ADC audio codec bindings to DT schema.
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---
>  .../devicetree/bindings/sound/ak5558.txt      | 24 ---------
>  .../devicetree/bindings/sound/ak5558.yaml     | 49 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/ak5558.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/ak5558.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ak5558.txt b/Documentation/devicetree/bindings/sound/ak5558.txt
> deleted file mode 100644
> index e28708db6686..000000000000
> --- a/Documentation/devicetree/bindings/sound/ak5558.txt
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -AK5558 8 channel differential 32-bit delta-sigma ADC
> -
> -This device supports I2C mode only.
> -
> -Required properties:
> -
> -- compatible : "asahi-kasei,ak5558" or "asahi-kasei,ak5552".
> -- reg : The I2C address of the device.
> -
> -Optional properties:
> -
> -- reset-gpios: A GPIO specifier for the power down & reset pin.
> -- AVDD-supply: Analog power supply
> -- DVDD-supply: Digital power supply
> -
> -Example:
> -
> -&i2c {
> -	ak5558: adc@10 {
> -		compatible = "asahi-kasei,ak5558";
> -		reg = <0x10>;
> -		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/sound/ak5558.yaml b/Documentation/devicetree/bindings/sound/ak5558.yaml
> new file mode 100644
> index 000000000000..90fd734daeec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ak5558.yaml

Missing vendor prefix, so
asahi-kasei,ak5558.yaml

> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ak5558.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AK5558 ADC Device Tree Bindings

drop "Device Tree Bindings"

You dropped few pieces of device description. Why? Also ADC is very
confusing.

> +
> +maintainers:
> +  - Junichi Wakasugi <wakasugi.jb@om.asahi-kasei.co.jp>
> +  - Mihai Serban <mihai.serban@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - asahi-kasei,ak5558
> +      - asahi-kasei,ak5552

Keep them ordered by name.

> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address of the device.

Drop description, obvious.

> +
> +  avdd-supply:
> +    description: A 1.8V supply that powers up the AVDD pin.
> +
> +  dvdd-supply:
> +    description: A 1.2V supply that powers up the DVDD pin.
> +
> +  reset-gpios:
> +    maxItems: 1
> +


Best regards,
Krzysztof

