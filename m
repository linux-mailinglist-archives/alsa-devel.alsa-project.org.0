Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC23B8976D2
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 19:34:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 879392C8B;
	Wed,  3 Apr 2024 19:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 879392C8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712165651;
	bh=+DelBr6m3rNY6z6t5SFfDpdd1llZYLl56cohJPx5B5Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WTvRRAZ1tm7BspzzW4khud1KiiH7HyoEuKftmgxctfv3acvVMV9k4nulIZa/7tLg/
	 8yZt5lsnWOBKp1HK+03xss2k6cnAAYHzSRMQ559g8bmj9J68C/tHuesvK11xQOhHyG
	 HVobORizt361frMus6aMukGRo3HBIudEPuJi++tA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77419F805A0; Wed,  3 Apr 2024 19:33:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBCE7F805A0;
	Wed,  3 Apr 2024 19:33:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FFB2F8020D; Wed,  3 Apr 2024 19:33:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65654F8015B
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 19:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65654F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SyNYqiGd
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56c1922096cso91164a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Apr 2024 10:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712165594; x=1712770394;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T33QVeD/UYcwqSgNmsGfgpvXToGKDIKVuMAYVc4EFqI=;
        b=SyNYqiGddGsOqc4fhpKPq2WG+wbh2wSK+6paaIPCnFe1DZfLlQelL3KfVl4qj1XLk+
         671fJNtyzVFgYEZxiE8qkiVe9t92iiqNHZ/MS8Isv5WF6BseH/9qrAfRvAackNU6xgQc
         Fd1MenKjKg8ZPMuUi+H0EaeyooTQt7Z9YgW2YzfxPKLGfaejcSmkp1jVMrCvHDUQ3lTR
         o6wGjMK1jR8OxS7XHYAl3pK+ws3AykpYYSfLO1RyMZfFampwPgA/XM940GwHqNKOU3+u
         tb5oM+KFPnCjJTuk34JhMHHtiPCs4kE7t36PgkY8YWnLnrT9LlUQnhT4J3g30sF/r4od
         ShlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712165594; x=1712770394;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T33QVeD/UYcwqSgNmsGfgpvXToGKDIKVuMAYVc4EFqI=;
        b=SWsqnW3uv1pUQ1Ai1VyJ7peFGeFpxFCaprIxCmnjUMpQtSgPRxEqyTFd5QpNk8iqtu
         fF1gf5454eRCHrkBB3JsY9EwFUOxrdHzrvpBxzAinSCfiLvRQF8GmusAfmZ22OtmpumD
         FIdBziv1AFXYJanCZe1APJNogLC9DQKCLRL+LdOFtARS4A6/92d5WCXz6eE8Yb2ObCJb
         7rOvAWko+vmmdlKsJZRAyocEg/KRJzG7SYlUdTwykjnEF1ndJFofa1Wz3bYjOl5GzFTI
         9b2JwyhnVLxz/JzVXEzXZAV//N8Y44QvUYqEjm/hKtxC1hIj2e22bW2EPVkMf2HwXikk
         H2SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRLbfZS4lGlqeQp5/2iFyZ+KKjJqzXF+5BSmLyFY62r5fICVkUM/N8vnXSmMM3CdFTw6MyKef0++AwR0Yl+43xqWZl2XZtgfjwr40=
X-Gm-Message-State: AOJu0Yx8n7yZjeOnwS/moOlPcicRUzLvvigZx164DDvf9y/0wnBnXBGz
	M97bUIDuEkbSeKFBdYWm/3EfVVb1TKM26VtZGUE4tqGL33hFwPwoV1dcTUpNSyA=
X-Google-Smtp-Source: 
 AGHT+IEwZo2+JsK5wwSD2DKtwccImfnSRm/+qcrGJ0GmVQH7neZdv0m4zCdwfN/aYbnWlHqeGhL6wQ==
X-Received: by 2002:a50:ab52:0:b0:56b:a565:f8dd with SMTP id
 t18-20020a50ab52000000b0056ba565f8ddmr60895edc.24.1712165594413;
        Wed, 03 Apr 2024 10:33:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 fe8-20020a056402390800b0056c522d014esm8075468edb.57.2024.04.03.10.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 10:33:13 -0700 (PDT)
Message-ID: <85aacb1d-40bd-46fd-8c49-5a682a7adf61@linaro.org>
Date: Wed, 3 Apr 2024 19:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: omap-mcpdm: Convert to DT schema
To: Mighty <bavishimithil@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240403165950.75-1-bavishimithil@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240403165950.75-1-bavishimithil@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DKP7IDCLQANEPFQPF426GMO4E4CBLJEI
X-Message-ID-Hash: DKP7IDCLQANEPFQPF426GMO4E4CBLJEI
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DKP7IDCLQANEPFQPF426GMO4E4CBLJEI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/04/2024 18:59, Mighty wrote:
> Convert the OMAP4+ McPDM bindings to DT schema.
> 

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching.

> Signed-off-by: Mighty <bavishimithil@gmail.com>

Is it your full name?


> ---
>  .../devicetree/bindings/sound/omap-mcpdm.txt  | 30 ----------
>  .../devicetree/bindings/sound/omap-mcpdm.yaml | 58 +++++++++++++++++++
>  2 files changed, 58 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/omap-mcpdm.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/omap-mcpdm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/omap-mcpdm.txt b/Documentation/devicetree/bindings/sound/omap-mcpdm.txt
> deleted file mode 100644
> index ff98a0cb5..000000000
> --- a/Documentation/devicetree/bindings/sound/omap-mcpdm.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -* Texas Instruments OMAP4+ McPDM
> -

...

> diff --git a/Documentation/devicetree/bindings/sound/omap-mcpdm.yaml b/Documentation/devicetree/bindings/sound/omap-mcpdm.yaml
> new file mode 100644
> index 000000000..8c9ff9d90
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/omap-mcpdm.yaml

Filename like compatible.

> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/omap-mcpdm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OMAP McPDM
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> +
> +description:
> +  OMAP ALSA SoC DAI driver using McPDM port used by TWL6040
> +
> +properties:
> +  compatible:
> +    const: ti,omap4-mcpdm
> +
> +  reg:
> +    description: 'Register location and size as an array:
> +       <MPU access base address, size>,
> +       <L3 interconnect address, size>;'

Please open existing bindings and look how it is done there.

> +
> +  interrupts:
> +    description: Interrupt number for McPDM

Same problem. Drop useless description but provide maxItems.

> +
> +  ti,hwmods:
> +    description: Name of the hwmod associated to the McPDM

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint.

Sorry, this was neither tested nor done in a way matching anything
already in the tree. Please do not invent your own style, but open
existing binding and look how is it done.

Because of above, I did not perform full review.

> +
> +  clocks:
> +    description: phandle for the pdmclk provider, likely <&twl6040>
> +
> +  clock-names:
> +    description: Must be "pdmclk"
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - ti,hwmods
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mcpdm: mcpdm@40132000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



Best regards,
Krzysztof

