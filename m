Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA43E6E28ED
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 19:02:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DCD1E76;
	Fri, 14 Apr 2023 19:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DCD1E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681491756;
	bh=tPqS9OHd/ajp57aylgGNTxvxC2DkdZlBKl+T0PQ4Nhk=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=llri1FEibb1PxSIpZ71LxGIi0oDZpzP5wRUHXX7gIe4S4StScos8l2K6b1RfaK2xR
	 ioKSEjWCslygl5Hzz+Jl6i40TJkrpBENERsrQOlw/u/v4hiFq0XMdCQCi1kcTDFydK
	 rKo/3mM/RUbw7c/EVVc6XrDE5kBc/k6hTZCKY6XY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EAC6F8025E;
	Fri, 14 Apr 2023 19:01:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35A92F80448; Fri, 14 Apr 2023 19:01:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A53AEF80149
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 19:01:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A53AEF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yKoeG23r
Received: by mail-ej1-x62d.google.com with SMTP id ud9so47041165ejc.7
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 10:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681491700; x=1684083700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vCbJAh+Z0aRKbTKNkNpTrH1WXy4mYvnZUCA8nbxWox8=;
        b=yKoeG23ri75vVft4xi17uGfIyuX8d/w+X/Qo03BGo9MdxEXkpILyAxwTEHB+WPPhCX
         oZFsdPz6WpboQhqKhZrV4DeoHHYeQavnUuneCodkbkTXUNmzSmDTQvW3DbjRKLzb/M+h
         eVedx7arbZOXA12EJ7vgrZNwQpM5wkPbPnbyfDgfD9feSS1gQ/YwoaTEqErnUkhECMSw
         +1/ACgoJz7wAEx9uQyKzAcVtCFjNkgNuiyYipH8uKyAd3/E3HExxfKmVogJ9G5dOj1tg
         uM47VSdyLB6tmklhyhvvwxUjTc8Ie3i0ZCCZ4bzJyegyLEU5Gy6S6PhETG2Itk2XQzE9
         y/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681491700; x=1684083700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vCbJAh+Z0aRKbTKNkNpTrH1WXy4mYvnZUCA8nbxWox8=;
        b=kNwnjrQC4HOqMvINgMWNCXdieX1b42kjeezc5WhM1mgCgCJdINXCIGF8q7eRPkw1jl
         07znlAOq6pG3RTLiXIFNYN2wj0/9Y6MRpeNLG4YFHmGM/wUkh6oAA1afiNgw2rUbHK4s
         iPfGRmOKQqnPyhAKKO+TKlbGi8QeEC2ZxYovzdxgN0S1HH3dZafaIpIuCHujC8xVkigc
         s2FmiEvfb1ipXMSj+HHvUj1OsMCzMQ+ycsrJYBLVaB3yu9sDGcQvicqWtwu/g8huynFV
         eBQbyYPSTZT3x8CCX/3q/K1WVzFwSaCHYMLHVvvJemYxxNCa7UF1m+ba1C20vXiqY1wd
         f0Qw==
X-Gm-Message-State: AAQBX9eOUnfdmncp1iYA4UcNs39SW7NdTawkPPECQsEVr6OFGuNlTedt
	0jovNyUpbqcOgo2F5+qMZmHXcA==
X-Google-Smtp-Source: 
 AKy350YiivcwJTYAsTfFGBz+OXvwfnukjw7cREDIL00YkEeOmHmKknAOL0ZHz2mzQiyD7pydh2C/3w==
X-Received: by 2002:a17:907:8d09:b0:94e:48ac:9a51 with SMTP id
 tc9-20020a1709078d0900b0094e48ac9a51mr4464472ejc.4.1681491699870;
        Fri, 14 Apr 2023 10:01:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:39b7:81a0:bd41:17b1?
 ([2a02:810d:15c0:828:39b7:81a0:bd41:17b1])
        by smtp.gmail.com with ESMTPSA id
 w18-20020a1709064a1200b0094e92b50076sm2652252eju.133.2023.04.14.10.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 10:01:39 -0700 (PDT)
Message-ID: <00b9429b-494a-24aa-9770-90dba6e2b0ea@linaro.org>
Date: Fri, 14 Apr 2023 19:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 4/9] dt-bindings: ASoC: Add it68051
Content-Language: en-US
To: =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-5-pan@semihalf.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230414140203.707729-5-pan@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2AL2HZG7RU6TQQ6T75ATAVV6YGWPIJX7
X-Message-ID-Hash: 2AL2HZG7RU6TQQ6T75ATAVV6YGWPIJX7
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2AL2HZG7RU6TQQ6T75ATAVV6YGWPIJX7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/04/2023 16:01, Paweł Anikiel wrote:
> Add binding for it68051 device.
> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
> ---
>  .../bindings/sound/ite,it68051.yaml           | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ite,it68051.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ite,it68051.yaml b/Documentation/devicetree/bindings/sound/ite,it68051.yaml
> new file mode 100644
> index 000000000000..341c171b8a8a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ite,it68051.yaml
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ite,it68051.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: it68051 audio codec
> +
> +maintainers:
> +  - Paweł Anikiel <pan@semihalf.com>
> +
> +properties:
> +  compatible:
> +    const: ite,it68051
> +

No ref to common DAI properties? No sound-dai-cells? No resources?
Bindings are supposed to be complete.


> +required:
> +  - compatible
> +
> +examples:
> +  - |
> +    it68051: audio-codec {

Drop label, you do not use it here.

> +        compatible = "ite,it68051";
> +    };

Best regards,
Krzysztof

