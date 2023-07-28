Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 580AB766D99
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 14:50:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D388782A;
	Fri, 28 Jul 2023 14:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D388782A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690548645;
	bh=veEUpNDAbhpl8fSsHHKrqHlqJCrZgSXqMFaf/wWQtgo=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mSBdDn8ogVPcbcWxH26aH/EoVOyybwgYvTWUcDCwungaTBHQ1A9icIikDUsfddek8
	 eFiXOs/lBuD4ksO+joAuEGIUUpYo/3T/nnvmQkDa20kam26beZdZPPsdcgaroFr4ML
	 lJ3sHc7hUZIp85ovIRel/8+O1jNdaudIlMVTXkcs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8A62F80520; Fri, 28 Jul 2023 14:49:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1165EF800D2;
	Fri, 28 Jul 2023 14:49:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0C47F8019B; Fri, 28 Jul 2023 14:49:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 282C6F80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 14:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 282C6F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=c/cFY5nV
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so286335266b.2
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jul 2023 05:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690548553; x=1691153353;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pbse/FL/bYEXl8Mf1x5aLqpTAzrAh7Ly043ErMcYY4k=;
        b=c/cFY5nVzAvu7QFQu1rz7uRvwVsVKG81Ki6j04f4TsAe7ATGVGdS4FzmF8VIboOogg
         dd5WRmUNjpKbJGx/YMPDWZl10r9zQSNGavTTjKyMXEow2Vb5e7LH6bUbiGpHpcML3k8v
         3SeNsF7yJU0tZijtUh+Kw4f0T7YzLA9+NPx9BRBafhkq92wHdco7DuK1vfE0xMxB55gv
         QRjZ+hijsp+NXXVbCzxb+sdm1X9NtOsNCCw5b9At1K7cQkiTGixF5vzjb92P7AyY//vo
         Zym9fOFDvmUsQxhpPloWOrTnZE/T1K7GJXtg5Wfr3E1WhYhI3qE8i9OryjYPlcbM6xJr
         HEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690548553; x=1691153353;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pbse/FL/bYEXl8Mf1x5aLqpTAzrAh7Ly043ErMcYY4k=;
        b=BPuJFfONNxsB2XohDpVicZIk+JwJrQ0Pnf7oLzeO61kHwhbk0UFPKO3NSUw6UvU36j
         EIBZ3TMXUDRM/N5C1qj5Wb0nJ+JZXwIu/pieq1kxMFKJXdsrv1DRhAYhR56EC+Hdbnm+
         Alwt9hr1PAoXZwlTPojR1CTZOn+EOWncgu3FFkzyr6vCbNIdhi+gPrycTCfuHZ5sQuBv
         8W9T+OIwAnuShbgQ6cP74e1dh/aUAWTgMiafYtmYjvq7emcqOI7XvWv8Je9O0mxNSBRs
         9s3g3XuKr4SdGgcCfUgLAfQGNuvOiyEEUn+AiYXY4oAaqviTQUeuVg0U7CPkRpU3uWnm
         T4mA==
X-Gm-Message-State: ABy/qLYLJqWytB9WM95Xy90OHYu00VyL+OZCUre0Ictqk+lZZkdmgSIF
	6RvXN8gxSRozdXvruLU3ZtPzPg==
X-Google-Smtp-Source: 
 APBJJlE7Un/8lOfEtuAAfoTFWj+mEND0Z4JJSWgUz9Y7zsFlTWcgLUkH/JhnP38nXuMjCviOhje1ng==
X-Received: by 2002:a17:906:64d5:b0:991:e458:d14 with SMTP id
 p21-20020a17090664d500b00991e4580d14mr2238981ejn.34.1690548552914;
        Fri, 28 Jul 2023 05:49:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 mb5-20020a170906eb0500b0098963eb0c3dsm2010040ejb.26.2023.07.28.05.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 05:49:12 -0700 (PDT)
Message-ID: <7d70f893-ee75-d355-4b4c-4afe7a72cd7c@linaro.org>
Date: Fri, 28 Jul 2023 14:49:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 5/6] ASoC: dt-bindings: mediatek,mt7986-wm8960: add
 mt7986-wm8960 document
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Mars Chen <chenxiangrui@huaqin.corp-partner.google.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230728090819.18038-1-maso.huang@mediatek.com>
 <20230728090819.18038-6-maso.huang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728090819.18038-6-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PY453YLZUTDYXU6JQ2MG2OKJAMYF4XA2
X-Message-ID-Hash: PY453YLZUTDYXU6JQ2MG2OKJAMYF4XA2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PY453YLZUTDYXU6JQ2MG2OKJAMYF4XA2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/07/2023 11:08, Maso Huang wrote:
> Add document for mt7986 board with wm8960.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>  .../sound/mediatek,mt7986-wm8960.yaml         | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
> new file mode 100644
> index 000000000000..76394f7e5502
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt7986-wm8960.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT7986 sound card with WM8960 codec
> +
> +maintainers:
> +  - Maso Huang <maso.huang@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt7986-wm8960-machine
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT7986 platform.
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      sink/source pair of strings. Valid names could be the input or output
> +      widgets of audio components, power supplies, MicBias of codec and the
> +      software switch.
> +
> +  mediatek,audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of wm8960 codec.
> +

How did you implement Rob's comment? Or did you just ignore it?

Best regards,
Krzysztof

