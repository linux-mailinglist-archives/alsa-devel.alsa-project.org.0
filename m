Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A17E16B59F2
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Mar 2023 10:11:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A3B0184C;
	Sat, 11 Mar 2023 10:11:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A3B0184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678525910;
	bh=nna4lezpHdBb4ajcSx61SK+0zIk1ibUEZf3O8acXUuE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rYYVMWaa9xTSABGrM7UyqskFGbG2sseyJeRRA6GW5I5TTCQge0qiSkAvFjS6usITt
	 Ppp0fOeLYNxkOhf4eWhyRNQfju6UF6lacv0gBSHL9iH0vwW2hdc7TNz2NJDTTNAa9v
	 yohc1qzzXdCPfSP8AWWGcdxTDTey65Y1gouT+Hhk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B629F80236;
	Sat, 11 Mar 2023 10:10:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A2D4F8042F; Sat, 11 Mar 2023 10:10:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D3C6F8007E
	for <alsa-devel@alsa-project.org>; Sat, 11 Mar 2023 10:10:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D3C6F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yW3q7BzZ
Received: by mail-ed1-x52a.google.com with SMTP id er25so1881816edb.5
        for <alsa-devel@alsa-project.org>;
 Sat, 11 Mar 2023 01:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678525822;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uw4cAGGgibSwDMH3Jhp+ycifcaLWuwvJWXMBQMAHLL8=;
        b=yW3q7BzZhpeN5LeV7HBwj8NAaPqj5zY+6rB6/sImmy6Sfg/aUtdFuYv7q8cESDAdmD
         9xcQ3rD7yegEDdOw0Z4iCVavF/SUJsgVBwOzHhMWFWTlNXctVQl1xKXYZJAl5kam/oTf
         hJLJXKgHO6ykDxhdWS1UF+JWwy+KKiHYL/SyIS32Ytuf6I58aTNIn/XlfIEQ5U1ld/7K
         0SoDSmy3M1LTtXwQ1jhH+olfaO6h5qpv/cg72waU5NCC/z/hizvXLNNmGqe/6e7gYfC5
         utgJN5nNul3VQ4K7JcX0NZnZmwP4SgLxm72rNovOasusLu6JPngv1wXUKtRQkMSNCkiP
         8uPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678525822;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uw4cAGGgibSwDMH3Jhp+ycifcaLWuwvJWXMBQMAHLL8=;
        b=bP8emaieASNQrNAyxYp4Ih8myUdjauVSuONyjZraO88uH4rJgcJpM3/CesFQD4701h
         Jfj8eKSgb+oQrudHqg6JjG6zIO+C+xHMuvyxe8cWirPOIPrxUzwHVoSbmHjqJrn8ZQnY
         CL3ju9yNl9edD4YUJTnSY1CLtJGyW9g+29HVvGNsghY3+fuklObOuJd3H6CU2zGbYnDd
         fICAczl2c1hgceuyIeh6netQSQRwUYK2U8ytQ1PANUWp71Hws4anLGw6ipNXp/u/JB7z
         H7YJRsuYPiPUqUrxtFTNOW1VT3XmB8BYUP3mkmFYGATLvWIXjvWvplNUzTvfyfZssAFk
         dJ7A==
X-Gm-Message-State: AO0yUKV1HnXjcbvv8OGViJ70nDoZxorRVxZJfz39JQixWoclPdrwQwVI
	I6mhoqXGUS2rNtE9UoGfXVQCMg==
X-Google-Smtp-Source: 
 AK7set8/V8muly8GrRqJlvD9mRt0320JEfLtLQwThdTKCMA0OrS8U3c/dwGkGS2n8AdHC2f24grKTw==
X-Received: by 2002:a17:906:8a64:b0:8b1:bafe:6135 with SMTP id
 hy4-20020a1709068a6400b008b1bafe6135mr25360315ejc.60.1678525822075;
        Sat, 11 Mar 2023 01:10:22 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b?
 ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id
 ae12-20020a17090725cc00b00922547486f9sm200836ejc.146.2023.03.11.01.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 01:10:21 -0800 (PST)
Message-ID: <de5d336e-43c4-9016-134c-bf5a0aa18280@linaro.org>
Date: Sat, 11 Mar 2023 10:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH V2 2/2] ASoC: dt-bindings: max98363: add soundwire
 amplifier
Content-Language: en-US
To: =?UTF-8?B?4oCcUnlhbg==?= <ryan.lee.analog@gmail.com>,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 rf@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, herve.codina@bootlin.com,
 wangweidong.a@awinic.com, james.schulman@cirrus.com,
 ajye_huang@compal.corp-partner.google.com, shumingf@realtek.com,
 povik+lin@cutebit.org, flatmax@flatmax.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 ryans.lee@analog.com
References: <20230311011409.210014-1-ryan.lee.analog@gmail.com>
 <20230311011409.210014-2-ryan.lee.analog@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311011409.210014-2-ryan.lee.analog@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DRLJ4YSL6PTJB3UZ5ANMM4RVXDCMG5GM
X-Message-ID-Hash: DRLJ4YSL6PTJB3UZ5ANMM4RVXDCMG5GM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DRLJ4YSL6PTJB3UZ5ANMM4RVXDCMG5GM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/03/2023 02:14, “Ryan wrote:
> From: Ryan Lee <ryans.lee@analog.com>
> 
> This patch adds dt-bindings information for Analog Devices MAX98363
> SoundWire Amplifier.
> 
> Signed-off-by: Ryan Lee <ryans.lee@analog.com>
> ---
> Changes from v1:
>   Fixed a syntax error for the 'dt_binding_check' build.
>   Removed unnecessary properties.
>   Added description about SoundWire device ID of MAX98363
> 
>  .../bindings/sound/adi,max98363.yaml          | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/adi,max98363.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/adi,max98363.yaml b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
> new file mode 100644
> index 000000000000..0e71b6c84007
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/adi,max98363.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices MAX98363 SoundWire Amplifier
> +
> +maintainers:
> +  - Ryan Lee <ryans.lee@analog.com>
> +
> +description:
> +  The MAX98363 is a SoundWire input Class D mono amplifier that
> +  supports MIPI SoundWire v1.2-compatible digital interface for
> +  audio and control data.
> +  SoundWire peripheral device ID of MAX98363 is 0x3X019F836300
> +  where X is the peripheral device unique ID decoded from pin.
> +  It supports up to 10 peripheral devices(0x0 to 0x9).
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,max98363

Aren't soundwire devices supposed to use device ID as compatible?

Missing blank line

> +  reg:
> +    maxItems: 1
> +    description: Peripheral-device unique ID decoded from pin.
> +

It's not a DAI?

> +required:
> +  - compatible
> +  - reg

Missing blank line

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soundwire {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        amplifier@3 {
> +            compatible = "adi,max98363";
> +            reg = <0x3>;

That looks a bit different than regular SoundWire bus. I would argue
that it's not SoundWire at all...


> +        };
> +    };

Best regards,
Krzysztof

