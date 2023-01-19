Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD9067369E
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 12:19:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D28A8008;
	Thu, 19 Jan 2023 12:18:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D28A8008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674127154;
	bh=g+nitKDqUNLxZuW5ZiET4tborzJgKdO2TUnHJwCvQn4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ubzz+bX3cii9jwGzfpRDVy11hXtYOdXLABxmdilK5WxZ7M9ZsqAB3HtM9BZn7YpBW
	 +f9TvnKEbblSlZB45B8nEuflq/cpUfPcwzkTFL2DqsR3mxGvOg7YcaTIgNP0QYh/lb
	 lAml079OxoR1ElbrA3KFq/VpbgKsRos8bMUVUZao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEFEAF800F0;
	Thu, 19 Jan 2023 12:18:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 396BBF8047B; Thu, 19 Jan 2023 12:18:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C748F800F0
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 12:18:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C748F800F0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Vtdvrj5m
Received: by mail-wm1-x32c.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so2609321wmq.1
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 03:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6Y/7gmhFhCAZgaW8XwXPZJxeQ167TuH5cJsnd9QCY0A=;
 b=Vtdvrj5mqGL5Qwyz7fZlW2SRUuyTH60A/JM+xN3FUpPJTBLokcSytP/QQ7Ng9YByVa
 OZseG7rOaETa3ijIc3tqjWwUBC/vHfSDvfyPTaiOoS2bg4iqfVKXERhiOYodXUyFFUmP
 w8L0aa44TrdKpioA8iBUkjIgat/VZU7sPWwRh7+NyuFPm9syfBtAfzqFVMURZV+0gYNu
 TYU5zi64UEb0bzXBCczqAloHvFzJROdg9CknZOMhyYm+RTBWCVyyOvqtFCOWJUMZv6KB
 BtszcMzNvSiNbe9Ubv8m+e7Jpv65KP9a28w7VlmFWUk00wEwzA9ASL81QEvXS6JLq9Wn
 wBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6Y/7gmhFhCAZgaW8XwXPZJxeQ167TuH5cJsnd9QCY0A=;
 b=uGW4Iq4HcQyBnkBeKURkOdO2pttqYdMn1KzF3q+sDeo4UZLZ4zgfyTD2yw9D2oxb05
 KA325qxK5IxZNpNIanRGLxqn0berlZJ3VTjppxfwH4Az2844sV33mX2wG9eXW7F7Va7k
 JIGmyk1NGMy18Z6C7UsTwXATDZLHeNiIeZRzoVXI62bi+e6vz/LVTbCFjhCKKXXXeT7e
 9E59cNYc11W3IJBuWDLcThJhQj1IyDNyyuRMMr0BNcn8ZxqVUjdNzYvSzo1sDD+IdDm2
 ZSYY+CtcUBnbvQ9xeOkSiYRc7SILMwdSw0M7t53ZBP8OYMwlfwO2RYdM/szC+rcP4SZF
 nzfg==
X-Gm-Message-State: AFqh2koAgM8noDq1JSxB8fKqYrGvDePZuCrQrBkAYFg6KfKas46reFji
 2wq7MEaR6HzZzn0Nsj0mjnCpOQ==
X-Google-Smtp-Source: AMrXdXsNLRE6TCmBw96DPdVTL/oG7el495vqcCnFNIL+CV051Rw93O1+XVUmqZkQ3fe6P4fxNDSUBg==
X-Received: by 2002:a05:600c:348f:b0:3db:742:cfe9 with SMTP id
 a15-20020a05600c348f00b003db0742cfe9mr9501898wmq.34.1674127089348; 
 Thu, 19 Jan 2023 03:18:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a05600012c400b002bbb2d43f65sm30424666wrx.14.2023.01.19.03.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 03:18:08 -0800 (PST)
Message-ID: <d5ae4755-26df-f4e7-b69a-83d9431bfbee@linaro.org>
Date: Thu, 19 Jan 2023 12:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v1 4/4] ASoC: dt-bindings: simple-card: create jack for
 aux_devs
Content-Language: en-US
To: Astrid Rost <astrid.rost@axis.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20230118125226.333214-1-astrid.rost@axis.com>
 <20230118125226.333214-5-astrid.rost@axis.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118125226.333214-5-astrid.rost@axis.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kernel@axis.com,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 18/01/2023 13:52, Astrid Rost wrote:
> Add simple-card,aux-jack-types:
> Array of snd_jack_type to create jack-input-event for jack devices in
> aux-devs. If the setting is 0, the supported type of the device is used.
> A device which has the functions set_jack and get_jack_supported_type
> counts as jack device.

How a device can have "set_jack"? Isn't this part of code? Are you sure
you describe here hardware, not Linux driver behavior?

> 
> Signed-off-by: Astrid Rost <astrid.rost@axis.com>
> ---
>  .../bindings/sound/simple-card.yaml           | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index ed19899bc94b..2635b1c04fc9 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -199,6 +199,13 @@ properties:
>      maxItems: 1
>    simple-audio-card,mic-det-gpio:
>      maxItems: 1
> +  simple-audio-card,aux-jack-types:
> +    $ref: "/schemas/types.yaml#/definitions/uint32-array"

Drop quotes.

> +    description: |
> +      Array of snd_jack_type to create jack-input-event for jack
> +      devices in aux-devs. If the setting is 0, the supported
> +      type of the device is used. A device which has the functions
> +      set_jack and get_jack_supported_type counts as jack device.

Same problems.

Additionally, if this is a type of aux-dev, then maybe it should be just
added as argument to aux-dev?

>  
>  patternProperties:
>    "^simple-audio-card,cpu(@[0-9a-f]+)?$":
> @@ -498,3 +505,31 @@ examples:
>              };
>          };
>      };
> +#--------------------
> +# Add a headphone and a headset mic jack,
> +# which use an auxiliary jack detector e.g. via i2c.
> +# The events, which should be enabled are:
> +# SND_JACK_HEADPHONE = 1
> +# SND_JACK_MICROPHONE = 2
> +#--------------------

No new examples, integrate it into some existing one.

> +    sound {
> +        compatible = "simple-audio-card";
> +        simple-audio-card,widgets =
> +            "Headphone", "Headphone Jack",
> +            "Headset Mic", "Headset Mic Jack";
> +        simple-audio-card,routing =
> +            "Headphone Jack", "HPLEFT",
> +            "Headphone Jack", "HPRIGHT",
> +            "LEFTIN", "Headset Mic",
> +            "RIGHTIN", "Headset Mic";
> +        simple-audio-card,aux-devs = <&hp_jack>, <&hs_mic_jack>;
> +        simple-audio-card,aux-jack-types = <1 2>;
> +        simple-audio-card,cpu {
> +            sound-dai = <&ssi2>;
> +        };
> +        simple-audio-card,codec {
> +            sound-dai = <&codec>;
> +            clocks = <&clocks>;
> +        };
> +    };

Best regards,
Krzysztof

