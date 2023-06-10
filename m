Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D9B72AD54
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 18:34:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 410DD1CE;
	Sat, 10 Jun 2023 18:34:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 410DD1CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686414896;
	bh=CKUHvP1qFhPwlgVzrDicB5tiufiI/PI7lYL/vbGc4T4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TAWVxCrE2gJyz7CkZRy6fSOQWvs4nL+Nf1hrN4KrCtD/zDT/EmajEcNvOpJr3Ru4D
	 vRxONZIsxZwD9ctbiLxa4UVLvWqhEBl+IuPQACDwbIrzKCjD2BG5BMT+0onbQxbkx6
	 EKo0o1cwQz1Z13upjNg+lxF/TiphWzUWWILAfiW0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45B5FF80254; Sat, 10 Jun 2023 18:34:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A02F0F8016C;
	Sat, 10 Jun 2023 18:34:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CEE5F80199; Sat, 10 Jun 2023 18:33:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C5C6F800C8
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 18:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C5C6F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bWgDopw0
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5147f5efeb5so5036401a12.0
        for <alsa-devel@alsa-project.org>;
 Sat, 10 Jun 2023 09:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686414827; x=1689006827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l50ztdy803Rs9JFTnKYE2HhzZPCqwSZFYHkaw2+qQnQ=;
        b=bWgDopw0O6HoJAvCfQ8hW4m4bLt9ezB6Eu+AJPVf1UKhoQoUlHEbVxXfxrZyfiFwBE
         6k4UgkH1JGCEZArRbwb8AOhR3cGepM6XA/qeX3Ny3bZ9N1nYAIgMZVSYrmEb97xnHHWF
         Bt+QbKgMPRAVbm7+O9oqS0iRnVNiMop9PblAr7SlwdPwyZDb/RIgXzrONsIwz3af+Bbh
         gUOZAr2RQk3lTh6bY+JqR0LgnkMUIySg8ajKtLlGveveS8J6IpcAkF+xrikRW99ep0Ss
         LiQLx5ogqkJjbvgbL/crn/J3mWgJQooQON7OQ8V+MPYAmMO/KIwLJIgA+Stl14O34Xwr
         f4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686414827; x=1689006827;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l50ztdy803Rs9JFTnKYE2HhzZPCqwSZFYHkaw2+qQnQ=;
        b=EWjMiF2BA2nINSstDZa3SHeyORJS7p9YpM3QWyVwfkkWP3+rigVm2E6Jfkl5U8oe+R
         o9qgBjwUQq19RS1mC7H19SFSpigDd2pJqv3QiRJKKUf2UPpaQxSITstrCqpsf6UvON/T
         j5KbXLX8C/dpsrPh63Uv9zfNfRkc8xCGKQDW2h/8h0O4RXpZPR3FhJo4RPXX/VUq5O5a
         OI9Ay7Hgz/JF70zxvScl9kvdSPSJRcFs/TyVCnbjbI64la+QQ3e+lIOBE7pNI5QyopRz
         TEEH6BvnGBeC2uoVf4ITPPQqBR5Qj6bMGnRURYaJ10C4a3ekj2tAPmW3M7dZRodpQKAB
         ys3A==
X-Gm-Message-State: AC+VfDzvLE3yUlTEWqjfShvFO7QrcYtd9e5DXaKesandYrGVessI7ivu
	YoWDeohTJ2TytbaifSqPrHcg1A==
X-Google-Smtp-Source: 
 ACHHUZ6F9rno3bFUANVMaUF61hEAO1cBPieqGMKrRjs677ZGAHjB3OeBzY8fUW14V9MhS4cW4sQycQ==
X-Received: by 2002:aa7:d358:0:b0:514:a650:99fb with SMTP id
 m24-20020aa7d358000000b00514a65099fbmr1750166edr.23.1686414827478;
        Sat, 10 Jun 2023 09:33:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 q24-20020aa7d458000000b00518286f5837sm919118edr.58.2023.06.10.09.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 09:33:47 -0700 (PDT)
Message-ID: <95aca760-c17c-eb96-bcfb-85f20124812b@linaro.org>
Date: Sat, 10 Jun 2023 18:33:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 4/4] ASoC: dt-bindings: Add tas2781 amplifier
Content-Language: en-US
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com
Cc: kevin-lu@ti.com, shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com,
 navada@ti.com, gentuser@gmail.com, Ryan_Chu@wistron.com, Sam_Wu@wistron.com,
 tiwai@suse.de
References: <20230610141821.576926-1-13916275206@139.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230610141821.576926-1-13916275206@139.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VCDHKTSUH5L4IY243MAMD5JAKCGPJQ3J
X-Message-ID-Hash: VCDHKTSUH5L4IY243MAMD5JAKCGPJQ3J
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCDHKTSUH5L4IY243MAMD5JAKCGPJQ3J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/06/2023 16:18, Shenghao Ding wrote:
> Create tas2781.yaml for tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>

We keep telling you that your email threading is broken. It still is
makes reviewers life more difficult. Maintainer as well as applying is
not straightforward.

Why this is not improved?

> 
> ---
> Changes in v5:
>  - remove ti,broadcast-addr
>  - remove address-cells
>  - remove size-cells
>  - put compatible item first in properties
>  - change the maxItems of reg from 4 to 8
>  - remove white space around <>
>  - correct the reg format to <0x38>, <0x3a> etc
>  - remove '\t' in the file
>  - correct a comment in the example
> ---
>  .../devicetree/bindings/sound/ti,tas2781.yaml | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> new file mode 100644
> index 000000000000..61db14a39630
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> @@ -0,0 +1,73 @@
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
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tas2781
> +
> +  reg:
> +    description:
> +      I2C address, in multiple tas2781s case, all the i2c address
> +      aggreate as one Audio Device to support multiple audio slots.
> +    maxItems: 8
> +    items:
> +      minimum: 0x38
> +      maximum: 0x3f

It does not look like you tested the bindings, at least after quick
look. Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

You miss here minItems.


Best regards,
Krzysztof

