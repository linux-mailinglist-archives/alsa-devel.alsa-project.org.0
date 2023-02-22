Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C9269F4BA
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 13:38:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2349FEAF;
	Wed, 22 Feb 2023 13:37:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2349FEAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677069513;
	bh=henxqy0xYaRYGP6yBhxb71yaXwkLf6f6GT5Ezc/YQU4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oplIDxOEmdPzCcrEUEVnQ+xJZu0+tKTWlQIJcFJgTl6W/B/4vmJxBOTuk+l56N9Ug
	 o3fWZ3k7dc8bQsqzEtbu1FO6eayomP//Bb10XH/jo0uRX2tLGBR+hn4xg3qbDTilnP
	 u5/7/aLCV4DyA414oirXXDAO7hwvCFlG5iFWCOKM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66B43F80496;
	Wed, 22 Feb 2023 13:37:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BBDEF804B0; Wed, 22 Feb 2023 13:36:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7342DF80266
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 13:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7342DF80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ogVriWu9
Received: by mail-ed1-x52c.google.com with SMTP id ec43so29226396edb.8
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Feb 2023 04:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rWfO3bHN/QEhS+Xs0UzkJUsUmv76YTb0jgQPn6Hkz8U=;
        b=ogVriWu9pImQoFQu6bo/zNCC8eZ0Duy+7bRXnFrKEdX/j/4s2vUWCcAKYZfQkJAiTD
         /02ZY3Psih2fZrLmQFw6SlEdNK31kCqtEEELWpHYe/cacSbLcRgZtYmpkkjU4/mvYe9C
         G1kmVKF49UuLhb/ry/6NSlXBGCj0NXjoGFYwIIip8THXSWK7KeSQo8vs9csFiXSEaXxL
         VOn5sNWrt1Voc4gucYEq8RkJ8E2VUSqSf9t/qHiYajoCztVx6xvAIv7xAOMjTyzUP+g9
         Q2TFH6pBbUI8zxGPdOgiIhcPcmqgwqYXg0TNZVsuU0u5rc0FST+suYhpqDSrVjSWYsjL
         rgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWfO3bHN/QEhS+Xs0UzkJUsUmv76YTb0jgQPn6Hkz8U=;
        b=vmJCOKKQ8OfcbofeoNsx1btuiH0l7qG8tR++BeUakMsxOOB8/bLRCxJEVjnzOP0ZAY
         b7seY3xEMmWB4/mWtdic0PwjUZiXEgZVwceypX3ZYMIJBlnuUkB0TGsxeswKdXsy+ZRr
         EnR93yztcpNCf/YKY8Vs6k/CGyJ9sp6Jsdi5yb5lqV17i/NIlyfc6J1unhTs1uU1IiNE
         V+E4/SbAnz2rWnJs3TKFX9lIncwg0s+F0AeNh9wqOhshrHx/i25IGs0hyJESzADaAtyx
         2IcuDX4pToi1Wl3ENw1BJexk0Ahxt0RrND+zOB0Qlqq+HLkKcGFztnW/A+moyoiyTu4y
         yLIA==
X-Gm-Message-State: AO0yUKVxFEuC9yQoQaN+v53ui/e8+sOMt9x2zCP/ZrHj843+ttKskbrm
	A6JoUyhdPOPX9KvCB2Q/0Yilcw==
X-Google-Smtp-Source: 
 AK7set/v1HvDm7IY1V+42v11cvnsliWIfG7RseOCxxbVQCy4vucFFgoP7tyDKRoeQOO3T7cz/WInrw==
X-Received: by 2002:a17:906:fca5:b0:878:42af:aa76 with SMTP id
 qw5-20020a170906fca500b0087842afaa76mr14505727ejb.54.1677069411749;
        Wed, 22 Feb 2023 04:36:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 fp16-20020a1709069e1000b008e22978b98bsm1640150ejc.61.2023.02.22.04.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 04:36:51 -0800 (PST)
Message-ID: <fd395ae4-d182-c637-e4b7-6d166ebc1b21@linaro.org>
Date: Wed, 22 Feb 2023 13:36:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: wlf,wm8524: Convert to json-schema
Content-Language: en-US
To: Chancel Liu <chancel.liu@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 perex@perex.cz, tiwai@suse.com, ckeepax@opensource.cirrus.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230222113945.3390672-1-chancel.liu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230222113945.3390672-1-chancel.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GKJXIJMDY3AKNFVP5MKFPYJSW6WUKK3D
X-Message-ID-Hash: GKJXIJMDY3AKNFVP5MKFPYJSW6WUKK3D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKJXIJMDY3AKNFVP5MKFPYJSW6WUKK3D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22/02/2023 12:39, Chancel Liu wrote:
> Convert the Wolfson WM8524 24-bit 192KHz Stereo DAC device tree
> binding documentation to json-schema.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../devicetree/bindings/sound/wlf,wm8524.yaml | 37 +++++++++++++++++++
>  .../devicetree/bindings/sound/wm8524.txt      | 16 --------
>  2 files changed, 37 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/wm8524.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
> new file mode 100644
> index 000000000000..09c54cc7de95
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/wlf,wm8524.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Wolfson WM8524 24-bit 192KHz Stereo DAC
> +
> +maintainers:
> +  - patches@opensource.cirrus.com
> +

$ref to dai-common.yaml

> +properties:
> +  compatible:
> +    const: wlf,wm8524
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  wlf,mute-gpios:
> +    maxItems: 1
> +    description:
> +      a GPIO spec for the MUTE pin.
> +
> +required:
> +  - compatible
> +  - wlf,mute-gpios
> +
> +additionalProperties: false

and then this should be unevaluatedProperties: false

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    wm8524: codec {
> +            compatible = "wlf,wm8524";

Use 4 spaces for example indentation.



Best regards,
Krzysztof

