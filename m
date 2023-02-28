Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC85F6A543B
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 09:16:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B61E1F3;
	Tue, 28 Feb 2023 09:15:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B61E1F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677572180;
	bh=tE2CU2XCJJEfTs2diBUULFIRclcMa12TWXNalRUnRYQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QWKkittYuzO/CzEYKY2mCNzbjI8sZVN6jK9mDifXtnFEXKXWjo46B2uJGUBKPWtKy
	 ldmnZXhRQZ/qoe4aKOOOEZr0DTLhhFD5eZkfKobXL5WSh0g5a48B9v/gnp1B0xnKmy
	 +NQ1j05lrfzwNC9yuyGxjZGIcwr7aovRmX7aLTKU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0291BF802BE;
	Tue, 28 Feb 2023 09:15:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13E73F8049C; Tue, 28 Feb 2023 09:15:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C92F2F800BA
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 09:15:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C92F2F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EzHU25Bu
Received: by mail-wr1-x42c.google.com with SMTP id bw19so8727089wrb.13
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Feb 2023 00:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677572114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=azxM/SMAWi+5Y+8kP4W8b45r/c639Rvk9h64PbJkv1E=;
        b=EzHU25BuMEUwIZo0ZM03zEoP1TDcjArIY7QjyqP7DDk64d455X7mVS7BLjjjX7RRZJ
         D6tRQdZ24N4rWhI037MwGUvOVAysjBvfRlnRfU3Sz0M6xUhowA2MDKy3QTMDiVOyDchi
         /uM/7RFfR5r+z300QeyaYfIcJnnLImMqnsxQVa7WISDrzMMAbCSaP95ZFx7TurlpMSaJ
         Bx+0Ysds+l6+RiqqTy5iXl2E+rvSl2AXxmffRQAkooFZ70VZkbSh5bohvxxjk9M0fLrk
         duguOisYvwhECBnF+hhJL1nXHkfkTLt0vJ0pNm5WqQs+cRj+LeeeqT8ZI3UgxFpsbciH
         1BZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677572114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=azxM/SMAWi+5Y+8kP4W8b45r/c639Rvk9h64PbJkv1E=;
        b=kqKs0fATgiZKK0Sj1loZXvONQumFt+c1Q5ERBGWILJrUBOkQ9FrCpFG8UePbfdwlQA
         v+pNlskXzOs/GiBMVUQjfdnlQuuXZCdrRIpull3v02ULUropOi7rcTULBJx2e1rLq0Q+
         tgSGvrqoGHcNX8dOX6crFw/v+1uz4lw7hfl6H9+QWG6tGNxxLzWRJX4RczPVJJ7N1Q8/
         3qxw7vv/uCXK8R8Yym+b6ZgKaO+/2O3wWZzZLG/TbZ/cYxcmVD0EsKSITcHbDKXwi/Nu
         B93V/7DUxu/u/Gop+msxYLtMIOZ1Qt6czmnYJ0ATfL3GptivpAQ1OOWxZ37M/tyFgX+X
         7V9w==
X-Gm-Message-State: AO0yUKUF33A9B0FuP4OYjmjwQrPOtOPrjRT9ouy8jMOyOL/RCAUSrsMs
	p6v84+bGi//0azdvaoxadHODrA==
X-Google-Smtp-Source: 
 AK7set9Am2h32Fsn/6toLjOljad6mPQ8tBB42OOqm1NJP0uXtXTRRGqgQTSUfJQyXOdmgvWImFuqIw==
X-Received: by 2002:adf:f204:0:b0:2c7:76a:31ff with SMTP id
 p4-20020adff204000000b002c7076a31ffmr1700105wro.18.1677572114389;
        Tue, 28 Feb 2023 00:15:14 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 x6-20020adff646000000b002c56046a3b5sm8891695wrp.53.2023.02.28.00.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 00:15:13 -0800 (PST)
Message-ID: <43fb6355-9a94-fabe-156e-8706ece97f9f@linaro.org>
Date: Tue, 28 Feb 2023 09:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 03/10] dt-bindings: sound: nvidia,tegra-audio: add
 RT5631 CODEC
Content-Language: en-US
To: Svyatoslav Ryhel <clamor95@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-4-clamor95@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221183211.21964-4-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SBJPHRE733KHEHQAX46NTCWUTKWMNBWS
X-Message-ID-Hash: SBJPHRE733KHEHQAX46NTCWUTKWMNBWS
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SBJPHRE733KHEHQAX46NTCWUTKWMNBWS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/02/2023 19:32, Svyatoslav Ryhel wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Add dt-binding for RT5631 CODEC.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../sound/nvidia,tegra-audio-rt5631.yaml      | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
> new file mode 100644
> index 000000000000..b347f34c47f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5631.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra audio complex with RT5631 CODEC
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +allOf:
> +  - $ref: nvidia,tegra-audio-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - pattern: '^[a-z0-9]+,tegra-audio-rt5631(-[a-z0-9]+)+$'
> +      - const: nvidia,tegra-audio-rt5631
> +
> +  nvidia,audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      A list of the connections between audio components.
> +      Each entry is a pair of strings, the first being the connection's sink,
> +      the second being the connection's source. Valid names for sources and
> +      sinks are the pins (documented in the binding document),
> +      and the jacks on the board.
> +    minItems: 2
> +    items:
> +      enum:
> +        # Board Connectors
> +        - "Int Spk"
> +        - "Headphone Jack"
> +        - "Mic Jack"
> +        - "Int Mic"
> +
> +        # CODEC Pins
> +        - MIC1
> +        - MIC2
> +        - AXIL
> +        - AXIR
> +        - MONOIN_RXN
> +        - MONOIN_RXP
> +        - DMIC
> +        - MIC Bias1
> +        - MIC Bias2
> +        - MONO_IN
> +        - AUXO1
> +        - AUXO2
> +        - SPOL
> +        - SPOR
> +        - HPOL
> +        - HPOR
> +        - MONO
> +
> +required:
> +  - nvidia,i2s-controller

By convention we always require compatible (and your common schema does
not require it, I think). The same for your other patches.

Best regards,
Krzysztof

