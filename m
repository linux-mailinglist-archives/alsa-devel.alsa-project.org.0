Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB87D6FD7CC
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 09:05:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15EAEF1E;
	Wed, 10 May 2023 09:04:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15EAEF1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683702335;
	bh=20m06jekukP6ePfxHFWEJjXmIyf0hKiO1G7Nu5/UbR0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZYHVHKahFvkEGnZjpJQ1/uQd1f37ORzJl6GHTK3zYjH+6fJooK0a6sH6Vc440b/Kt
	 xA6jYcCgm/VQRpcpsgaQjaP5+F5rHiP4QVBAqQTRYdUbFak/ChkLTceh72MlVJpRdO
	 tcm2L6V461aVytdrt5OZRANSDxYDDoje4DqOtZDo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 843C2F80310;
	Wed, 10 May 2023 09:04:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFA0CF8032D; Wed, 10 May 2023 09:04:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBA01F8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 09:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBA01F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=a5yKktjz
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bdd7b229cso12653214a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 00:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683702268; x=1686294268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ZkCFCzZD4JzTnaOmZhJFgRNPCw8xQEqtc/R5QiPjAA=;
        b=a5yKktjzJci/iih+IbtLEXlWS76EBbag1OAy+gRfRxDFwf5YCvXkJhdSlWypHe87Rh
         i+wqExTbmndbOdSRWh0veTzHIyCG9zVIYmZW7sS5Y9xdUnHm48iAxjV3x+yAc8ri/ak5
         Ew6hj8by22Ol1hWCl4QyFoOAZO0yE+90vun71U34mXZl3A4Av+pDZDWOGF1GCqfrQIcF
         rMikVNcLyAzrb417C9qgmpu+S9Qod32ihXFrQbMl02RcuntS8rWv8LCA2yMd0Ycw2/SC
         cxynjIaH/9hHH4KspZOxO2ZCd+5a/7+VSNZiwVVyJvvEKWzxux/l4Y6qFp8Is+kFr/5p
         awtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683702268; x=1686294268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZkCFCzZD4JzTnaOmZhJFgRNPCw8xQEqtc/R5QiPjAA=;
        b=leXaEf1qFTx6S+A1VYtOQXuwTWxcsgX99M3541hhWD0AC46sUFMmucCzutdO3Aiawt
         sgCNxaJyvIW/RCKImN+QJQ+eFJ93+yJaTzuBRQx18dwWw3cPVxzJFFgvJ0XRvNKDvAYK
         RCzrlYhj3+5wuz6O2Nm6QBno2pLnxKK5HTSi9Mj9As2ue0WmAvWEEgrcu1njUbKmsRAH
         vzUEWRTsAIhuVfE/E1Dz/vFiuZwy+FIvCNw6Ag8goVrMG1pMxpIFTTuHidy1ByGsuIxD
         SL4iUg/4N3e30l92Ex6wHSAIaJH5Ikxbx6F3bFMSKMvrkZtpp5FMWekH6Zp+U8MOy+qm
         TtpQ==
X-Gm-Message-State: AC+VfDzeIeLE/tvUmW90LHAqRv49JfP4dbr6pU1N1otGlTaNbjJ26hNd
	xomibrgD+Xqt+1z9bb2RU3MfbQ==
X-Google-Smtp-Source: 
 ACHHUZ4HmhCpVncMbbPtAqVY5vpN5YsolRPIOPz8n6DozDJQEyEQza7ajEOa/3Qm38aLyM5bEpqqIg==
X-Received: by 2002:a17:906:4fd1:b0:961:8d21:a471 with SMTP id
 i17-20020a1709064fd100b009618d21a471mr14352353ejw.58.1683702268662;
        Wed, 10 May 2023 00:04:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d?
 ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id
 b16-20020a170906195000b0094e96e46cc0sm2276891eje.69.2023.05.10.00.04.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:04:28 -0700 (PDT)
Message-ID: <ca9d45cf-8a84-4fbc-e1dd-c96eef36fe25@linaro.org>
Date: Wed, 10 May 2023 09:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/5] ASoC: dt-bindings: Add tas2781 amplifier
Content-Language: en-US
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com
References: <20230508054512.719-1-13916275206@139.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508054512.719-1-13916275206@139.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2PEBYG52VEWWE6OK3RNVDJY3NPFVDT27
X-Message-ID-Hash: 2PEBYG52VEWWE6OK3RNVDJY3NPFVDT27
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: kevin-lu@ti.com, shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com, navada@ti.com,
 gentuser@gmail.com, Ryan_Chu@wistron.com, Sam_Wu@wistron.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2PEBYG52VEWWE6OK3RNVDJY3NPFVDT27/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/05/2023 07:45, Shenghao Ding wrote:
> Create tas2781.yaml for tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>
> 
> ---
> Changes in v7:

Your subject says it is v2 and previously it was v6. Make it consistent.

>  - Submit together with tas2781 codec driver code

Fix your patchset threading. I don't think it's possible to apply your one.

>  - Add more detail description for ti,audio-slots
>  - Keep consistent for "I2C"
>  - remove reset-gpios description
>  - For reg, express as constraints instead
>  - remove unnecessary '|'
>  Changes to be committed:
> 	new file:   Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> ---
>  .../devicetree/bindings/sound/ti,tas2781.yaml | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> new file mode 100644
> index 000000000000..96c2584855d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 - 2023 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TAS2781 SmartAMP
> +
> +maintainers:
> +  - Shenghao Ding <shenghao-ding@ti.com>
> +
> +description:
> +  The TAS2781 is a mono, digital input Class-D audio amplifier
> +  optimized for efficiently driving high peak power into small
> +  loudspeakers. Integrated an on-chip DSP supports Texas Instruments
> +  Smart Amp speaker protection algorithm. The integrated speaker
> +  voltage and current sense provides for real time
> +  monitoring of loudspeaker behavior.
> +

you miss allOf with ref to saound-dai-common.

> +properties:
> +  compatible:
> +    enum:
> +      - ti,tas2781
> +
> +  reg:
> +    description: I2C address of the primary device.
> +    items:
> +      minimum: 0x38
> +      maximum: 0x3f
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ti,audio-slots:
> +    description:
> +      Multiple tas2781s aggregate as one Audio Amp to support
> +      multiple audio slots
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    maxItems: 4

You said you can have here two addresses. You don't allow it, test it.

Missing minItems, but...

> +    items:
> +      minimum: 0x38
> +      maximum: 0x3f

... So these are fixed? No need to encode them in such case...

and anyway actually I agree with Rob here - these addresses should be
put in reg.

> +      description:
> +        I2C address of the device for different audio slots,
> +        useless in mono case.
> +
> +  ti,broadcast-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Generic I2C address for all the tas2781 devices in
> +      purpose of I2C broadcast during the multi-device
> +      writes, useless in mono case.

Probably you can figure it out from previous addresses and there is no
need for this property.

> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +


Best regards,
Krzysztof

