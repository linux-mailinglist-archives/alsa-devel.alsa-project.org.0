Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B74BC6CFD04
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 09:40:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 509F21EF;
	Thu, 30 Mar 2023 09:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 509F21EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680162046;
	bh=jFcS7bUaXABTcnaCmVl+zFu+uN/IB60LPk7WNGMa/1k=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IGs874pMhYrq4ALxUBpnmUXVOIalNy2SuJw+0p7Wz34+KX9aiS81e+c0V+gLLwwU/
	 EllT3F1qf0nkURYv5JPyctbbehNk/oq4CwR+8A1nE4dbEW8+OfWWiryLGZTjS5zhqe
	 h25+oLWvtJIkai+29b1ORPgM3hPPtVZDoFXUencY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66E10F80249;
	Thu, 30 Mar 2023 09:39:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2E99F80272; Thu, 30 Mar 2023 09:39:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44CC5F80114
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 09:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44CC5F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ruldmbq6
Received: by mail-lf1-x12a.google.com with SMTP id j11so23338199lfg.13
        for <alsa-devel@alsa-project.org>;
 Thu, 30 Mar 2023 00:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680161978;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1BFQFEcp+Yc7eK7+gRqJuLKGd2zLsXk3LDs9OcFmZs=;
        b=ruldmbq64NM+hwrT/y0is2vQMgd+GIg71Oboaq2lJYwssqBaw6eK86sRZ2/R9RWiWb
         qZGN+9RZW8Hob34SVoK1OPpL7PTvxVES2P37JZsx/bI5K3VPsMxTmqbIwMAsAFDP3jgR
         T9C9SpPHR2VTbi2RXgEVjnJ881PG78j/N1bSrbfYc8FyzzmbDrY1kNi4QESoxY7PWhXX
         Zz+UC8n1m+4CUFohK0Yzqz7RbGeBP6u84ND8MOgCw5xw1EZOC1LX63X5yQwcNFxVM3P0
         Z3ublQZNxVx67c9jRHkN7OFj4gfp82jHCEmbRP2axY0oiNuIwEHShdjoVOaKESnCGBcB
         3hZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680161978;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1BFQFEcp+Yc7eK7+gRqJuLKGd2zLsXk3LDs9OcFmZs=;
        b=C7iagP4htftoErS4+c9ZNKDG2TZ9NFO+rp8Kf+twlNuVr0PqduhvIJQefHTCXclSO2
         Qngl3UJdgFdxWUjJa5XFMmyDFPmloKHT07/3eA6ygqFfuquB8OKMuj02Hip2KTfAnpjW
         8b/JNmgaRi42JKqg+4puM2RdhlTb2Bk9DztusYkUfQijDnuuPIRpNlPo8MgDUppHZNKq
         d84Pcwd6dGH++kWkFTW0Iq6vgCXX90s9WZcUTDwjtJcskwtyHe53box1R79yOaXL+QOV
         KPPiLTqVAiSnDb1BOQoyDbyUGwfOBvNRreWaFDWw7qX31m3zZ2p532ukzNQzwoXkiEp4
         leaA==
X-Gm-Message-State: AAQBX9dx5E4pekhcyI+0ngK2XL6CNkGa+KOXz6ulJnW/1xJZI0VhahJV
	sdeeVd0bHZsL4Y2VkPUUUQrQtw==
X-Google-Smtp-Source: 
 AKy350bAQUuZJ9AdRREDwN63mloWL2b2FNGC4p1ekLCHdHGiBahv9ED14kOttKyL58M6k3Pwu6iDbA==
X-Received: by 2002:ac2:5458:0:b0:4ea:fabb:4db1 with SMTP id
 d24-20020ac25458000000b004eafabb4db1mr6418948lfn.1.1680161978106;
        Thu, 30 Mar 2023 00:39:38 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id
 b16-20020a056512219000b004d85895d7e0sm3956796lft.147.2023.03.30.00.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 00:39:37 -0700 (PDT)
Message-ID: <c999da90-1cb9-c767-23bc-c28d37708cf2@linaro.org>
Date: Thu, 30 Mar 2023 09:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/3] dt-bindings: sound: Add TDM for StarFive JH7110
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20230329153320.31390-1-walker.chen@starfivetech.com>
 <20230329153320.31390-2-walker.chen@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230329153320.31390-2-walker.chen@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MG5NKVP4FGMMD6XAURZJBRUGA4BA5ZKO
X-Message-ID-Hash: MG5NKVP4FGMMD6XAURZJBRUGA4BA5ZKO
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MG5NKVP4FGMMD6XAURZJBRUGA4BA5ZKO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/03/2023 17:33, Walker Chen wrote:
> Add bindings to describe the TDM driver for the StarFive JH7110 SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  .../bindings/sound/starfive,jh7110-tdm.yaml   | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml b/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
> new file mode 100644
> index 000000000000..d65b9ed781ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/starfive,jh7110-tdm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 TDM Controller
> +
> +description: |
> +  The TDM Controller is a Time Division Multiplexed audio interface
> +  integrated in StarFive JH7110 SoC, allowing up to 8 channels of
> +  audio over a serial interface. The TDM controller can operate both
> +  in master and slave mode.
> +
> +maintainers:
> +  - Walker Chen <walker.chen@starfivetech.com>
> +

Missing allOf: with $ref to dai-common.

> +properties:
> +  compatible:
> +    enum:
> +      - starfive,jh7110-tdm
> +
> +  reg:
> +    maxItems: 1

(...)

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - dmas
> +  - dma-names
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    tdm: tdm@10090000 {

Drop tdm label, not used.

Best regards,
Krzysztof

