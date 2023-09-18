Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B04A7A4955
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 14:12:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B339820C;
	Mon, 18 Sep 2023 14:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B339820C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695039128;
	bh=pt126yEkTKq8koA6xcUg1qahv0mj2MeoYr28CFMlTbg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=coQKmnhcpmJpgT3Nx8tDVaefHqvQ05aiuJFbJn/CwlmdAX04qC4SLM9j7K0RsOI4f
	 MPkqhneBSkjLKC0L/p9Q5j7KsHJ6Go4IhaAtxP8OtvEu4hzIPI/fcZSY4SBBMtxdQm
	 Nj33C+IBXGvPEv7QUoLBDqcDcozKT2LldUmHsyao=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BDD9F80494; Mon, 18 Sep 2023 14:11:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1487F801D5;
	Mon, 18 Sep 2023 14:11:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73A55F801F5; Mon, 18 Sep 2023 14:11:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED793F800AA
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 14:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED793F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aETRdK6I
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c00e1d4c08so12762251fa.3
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Sep 2023 05:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695039069; x=1695643869;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nNg5sBvXpTkFIEXWpv9DgGZCDJnmvTQX83kuJA0NYGE=;
        b=aETRdK6IWWlzUXJMHTbX0IyC6fHxUZlFKk8v+3WrfVTkC/7tRZnairNxBtDObRPjPD
         EE70zhQkNba7aW5vNSE8I7UrEHaMvUQeZ7WnBxXPoo/jQvo1ACUMr62Praiur1wmogBQ
         iO95d2RVHdz5Y5Xpo02ygJ8vBa8cxpQUe4DkrP2qPowITB60vt/5T2vFCwmt5Us57k3N
         AJh7Fv5758Tzp6OwqVoK3rmWNeNtUY02R5uj3IOdzxzMQovbtQWwYeYr25EbcjQAJaF/
         w3Ea9U9/1xRmTCmtKhwpz9Blo+eqszrHTGbKybBPiC18C23S+6HJ1EPw4TsjCDmG72LJ
         H5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695039069; x=1695643869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNg5sBvXpTkFIEXWpv9DgGZCDJnmvTQX83kuJA0NYGE=;
        b=u19KQbHrK8BCwP7Ij7f/Hg3RsrJkTl6ZNWTRiFoD1nmAmeMYCUSqb+c7E589pAUVWz
         L1Xufahjj4TCZkziJfbUJDHisOK41kg1veh+N3wn6SlYaS9PuReNFPe7OVdKDhZBPi/E
         G541t1xFvau1OkbbZYdfBDHgHflcDKSsmalHZrtaurQm+OJj4BgtCQXmrn28OvcQCAck
         NRxQ1yjFNhqwfpc6SwivbNtDy5BF8GokCXKn9806/wSuC2D9laoHssEvgXvppP36Dd2n
         X5lGbkKwCalf/QKluwwuvWdF8etX/sJCIg7/D5LYt5V2lT5FmPjSKvj6RhUDWHSUnF8t
         p26Q==
X-Gm-Message-State: AOJu0YxyeNde4k1by2JwLK+W8QyQUWERUa4kjKO69iIraUlDv6m73qq8
	59yvpjZWuF9dRSjVCVw7t/7iYA==
X-Google-Smtp-Source: 
 AGHT+IFwerwMQ9p0BqOOgGf8TfiZGafrKqJF/xTtLKwKD07Ub3Rfj01f0aVJZ19zwA3dnMtXaMRXaA==
X-Received: by 2002:a05:651c:2115:b0:2bf:df8c:4e56 with SMTP id
 a21-20020a05651c211500b002bfdf8c4e56mr8540093ljq.39.1695039068635;
        Mon, 18 Sep 2023 05:11:08 -0700 (PDT)
Received: from [172.25.80.114] ([217.67.225.27])
        by smtp.gmail.com with ESMTPSA id
 rp9-20020a170906d96900b0099e05fb8f95sm6346237ejb.137.2023.09.18.05.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 05:11:08 -0700 (PDT)
Message-ID: <ed222918-68ca-cb57-15b8-57f45cdb5a5b@linaro.org>
Date: Mon, 18 Sep 2023 14:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add Richtek rtq9128 audio
 amplifier
Content-Language: en-US
To: cy_huang@richtek.com, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Allen Lin <allen_lin@richtek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1695030341-20711-1-git-send-email-cy_huang@richtek.com>
 <1695030341-20711-2-git-send-email-cy_huang@richtek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1695030341-20711-2-git-send-email-cy_huang@richtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JK4EHT6KWD3RCYLFYB66OX3LAFERNFMS
X-Message-ID-Hash: JK4EHT6KWD3RCYLFYB66OX3LAFERNFMS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JK4EHT6KWD3RCYLFYB66OX3LAFERNFMS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18/09/2023 11:45, cy_huang@richtek.com wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Create richtek,rtq9128.yaml for rtq9128 amplifier.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../bindings/sound/richtek,rtq9128.yaml       | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml b/Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml
> new file mode 100644
> index 000000000000..a79694c2b169
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/richtek,rtq9128.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license is needed. Just like checkpatch is asking for.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/richtek,rtq9128.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Richtek RTQ9128 Automative Audio Power Amplifier
> +
> +maintainers:
> +  - ChiYuan Huang <cy_huang@richtek.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The RTQ9128 is a ultra-low output noise, high-efficiency, four-channel
> +  class-D audio power amplifier and delivering 4x75W into 4OHm at 10%
> +  THD+N from a 25V supply in automotive applications.
> +

Missing ref to dai common.

> +properties:
> +  compatible:
> +    enum:
> +      - richtek,rtq9128
> +
> +  reg:
> +    maxItems: 1
> +
> +  enable-gpios:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#sound-dai-cells'
> +
> +unevaluatedProperties: false

This goes with mentioned $ref. Alone would not be correct.


Best regards,
Krzysztof

