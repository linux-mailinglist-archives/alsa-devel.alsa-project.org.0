Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD226FBF29
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 08:19:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F4441130;
	Tue,  9 May 2023 08:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F4441130
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683613155;
	bh=zspDmd5uSPERy0wTgxZQpA5oIZ49Nk4/LN62ISg5AEo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J2rxCUjreaJDQBtiifPc90DTu06Y7Iv5eMq1TTRPj4Z7n/BJb2nNoWKC5twvgat5U
	 Rumv1SeZyKZl0O+V8rsYrvWyu7wkkOfalpZGTpG8bWXt7k4pNFLpDzJBTXEYqWoiaJ
	 eKGnEABKFxBAjt9HO1tbOszzra3H4c8tqBIjKZwQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 266B2F80310;
	Tue,  9 May 2023 08:18:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37979F8032D; Tue,  9 May 2023 08:18:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 932C7F80217
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 08:18:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 932C7F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cNSG2zKX
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bc0ced1d9so8252351a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 08 May 2023 23:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683613097; x=1686205097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=apXwfMR8TTZYSL3Z+8JPoDod3IpeRtMiYvOMKSanre4=;
        b=cNSG2zKXrbZG0zgki2yny0n65hFaO/rT27kimKn4JNV9asf3q9q+1vXUNmKUVd1AUT
         yCNJ1OAzqttFSfRv7GsJu01tsKOrqZzmnDlvV66iXpy+f45m66XWtqZe0MMHfo/tcIZ/
         ZqXqROvQQ8vQEftsqL1aEW8JYVkQFJJIFD0ExDurzAJ3Gr0LrpjuDiPzBWoIBTq5Drws
         GdROmvPHrQA1yIgZVHs1bsLSGihMzZq5NlHcex8agnaO5BmnR2sUV0UiJ3igrhb6fLdL
         je1cml0NN6rGr6OgTALcX7f/WCbIHYVAdEXEV77vE2Qca9bzYP6Fc1J8SHkprlau9wMA
         eqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683613097; x=1686205097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=apXwfMR8TTZYSL3Z+8JPoDod3IpeRtMiYvOMKSanre4=;
        b=cOr92mIyoEw29b1Joz68jCrydWuxTBe2S6/smttV7bGiAeEGBGenLH8vCAy3cpT1Oe
         us+fjO1lvv5K3uYFpIQb7zyNNyWBjTlA/2BP6vNZmynh7MCLi64M5oBjzNis0uS+vYir
         9fMSoXWuO0wEyBl2tugOM10Pg9DqK5fb+DyfowsTdGR+IkYg2w2CAVw/4sxZvL7uMO3a
         9mC/QCdbJ34SWd+iHG1tHKmx8D0Jl2sfgKpUOWX3RsF3uVIJ91O/gqJRIKpu/R0M7bbb
         Riz9Y0+NNNhEv67kfcRia12vA0PI+IHm+EZwow91dotp+7Hi479nymFFbUZmpvcSdnCl
         410Q==
X-Gm-Message-State: AC+VfDyH+fLcie0vB+YhbqsJEdyWu/rRpXpRcgyZ3HV812Z0/o0I+Ctr
	zXgmlU9bpzcmaBNBZh1IOALMNQ==
X-Google-Smtp-Source: 
 ACHHUZ7Nlm3c3jrfo5Xh8gNy+uRRTtsjIw2hFGSA5pPqL+C2s1Q+FtoCu9NFnwOajuiCY2P17/4IlA==
X-Received: by 2002:a05:6402:352:b0:50b:c804:46c2 with SMTP id
 r18-20020a056402035200b0050bc80446c2mr10313721edw.23.1683613097444;
        Mon, 08 May 2023 23:18:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76?
 ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id
 e19-20020a056402089300b0050bd9d3ddf3sm357264edy.42.2023.05.08.23.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 23:18:17 -0700 (PDT)
Message-ID: <b8306c55-8551-4c86-f85d-3aebe1ad0ca1@linaro.org>
Date: Tue, 9 May 2023 08:18:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 4/7] ASoC: dt-bindings: Add Google Chameleon v3 audio
 codec
Content-Language: en-US
To: =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org
References: <20230508113037.137627-1-pan@semihalf.com>
 <20230508113037.137627-5-pan@semihalf.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230508113037.137627-5-pan@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SKOSC4Q3SSF7Q6QRFHBRBHQSINSRAJ5S
X-Message-ID-Hash: SKOSC4Q3SSF7Q6QRFHBRBHQSINSRAJ5S
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, amstan@chromium.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SKOSC4Q3SSF7Q6QRFHBRBHQSINSRAJ5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/05/2023 13:30, Paweł Anikiel wrote:
> Add binding for google,chv3-codec device.
> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
> ---
>  .../bindings/sound/google,chv3-codec.yaml     | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-codec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/google,chv3-codec.yaml b/Documentation/devicetree/bindings/sound/google,chv3-codec.yaml
> new file mode 100644
> index 000000000000..5329dc140b1c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/google,chv3-codec.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/google,chv3-codec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Chameleon v3 audio codec
> +
> +maintainers:
> +  - Paweł Anikiel <pan@semihalf.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: google,chv3-codec
> +
> +  "#sound-dai-cells":
> +    const: 0

No supplies? How do you get power?

> +
> +required:
> +  - compatible
> +
> +additionalProperties: false

unevaluatedProperties: false, because you might want to use name-prefix.

> +
> +examples:
> +  - |
> +    audio-codec {
> +        compatible = "google,chv3-codec";

Extend the example with dai-cells.

> +    };

Best regards,
Krzysztof

