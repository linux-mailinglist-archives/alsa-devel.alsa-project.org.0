Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAFE73E363
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 17:33:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C0BC1EC;
	Mon, 26 Jun 2023 17:32:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C0BC1EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687793593;
	bh=oc8eXwxLtaHUGNNUMkPSADFM2VDoCTTTwkzNft5ySf0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mBHqUyIVTsmrcX1P0zNJI7f4BIVaDu8Ymxcf4QrYTsmmHpjulZFj7Mh3qQk2TbVtX
	 ro5EeuYCIptM1Nu2Mp8vlE/SyHLKBF1Gc/gXoSPKcdoNZojiJPazrKdITJQ5RZjtEr
	 aOSnJh+Mi/onvKyg7Npp3Y/IMi1IrbTluuzU+BQw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D382CF80544; Mon, 26 Jun 2023 17:32:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73229F80212;
	Mon, 26 Jun 2023 17:32:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D336F80246; Mon, 26 Jun 2023 17:32:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E92DF80169
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 17:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E92DF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=OiVPY0SK
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f9c2913133so44675235e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 26 Jun 2023 08:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687793527; x=1690385527;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UotEKVGu4UicdFRFt8vn+mqKSPhJyyY8erAKccSLFS8=;
        b=OiVPY0SKcCbKeSILoHCmY/qT1E319c5b9eIcoYOSF8c1k8vSUoewSPFxtd2GMDUSEv
         7qGqpG+l3PBAgiP4ckxQoCzKIvwXF4hlGeP8/yyCjrqZFc00KH1/HH4JMwxrZdC4V2qg
         j333CfYYVQwgPNSX/ctAvOS118+Lrxb2KYg1Z5oPJFl3WSzUqKVvQDjimxbpRrdUg4TK
         60Ly4FS50ydNH0ooiZm4eoSmwxmn9YxoCYyCHx/52wHZSCKaZ6aMFIxzO3HghTfGGuLi
         iiQ3RB+WJZyxlAwMqw5RdxqQDku5fLPBVeLuZW2PwkFphHG0/rmutptD0oEBQbUY+/dh
         l1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793527; x=1690385527;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UotEKVGu4UicdFRFt8vn+mqKSPhJyyY8erAKccSLFS8=;
        b=TRzmfg7jsNsGXDyxvunDbrD8oHrc7YG645OoTd8SJQyg5FIlmu9rRYBIyrU1RQfqR4
         EvJLpP8rG/6Hp/sf+OJC4IMrpPPWo3YLtbQf2zRMD/anILrZqOhumevzErCmwa3LIrXN
         sNSVAnwLJyrJXlY3o66XetQnI4VIVvxha3nC3aiXLmegySLaZvJ3ICPKN2/l/otGMZ3c
         /4FzCeOIkrJQm4RQmTUmZug0ydBYyR32YM5BmRuqL2/fQyd1uB129qXoGL4x4WrSbrfs
         jtMl/REvszGq+dxZpRQAE9VkvWdCJ/8e5p2EwEYxKxyLkcphohRIT1V8GMs2hbe2CwCP
         1ChA==
X-Gm-Message-State: AC+VfDy8VTO+YmE2Iy5klPgHoEnMxsOtvBTZdNYU14koY68s3fiptohg
	Xer9wS/zOz4jOdkgaR2YaeTU9Q==
X-Google-Smtp-Source: 
 ACHHUZ5Go2QzsyA7PJ5u3USfatgPyu7gSb79h4oB9qw8x8KLefKL4zc8Uq/5/48twyYJ9y10B561jQ==
X-Received: by 2002:a7b:ce98:0:b0:3fa:7478:64be with SMTP id
 q24-20020a7bce98000000b003fa747864bemr10432370wmj.1.1687793526846;
        Mon, 26 Jun 2023 08:32:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 f23-20020a1c6a17000000b003eddc6aa5fasm10864959wmc.39.2023.06.26.08.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 08:32:06 -0700 (PDT)
Message-ID: <92171465-d2ba-c3ba-aa55-0f705e924a0f@linaro.org>
Date: Mon, 26 Jun 2023 17:32:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: Add StarFive JH7110 dummy
 PWM-DAC transmitter
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
 <20230626110909.38718-2-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230626110909.38718-2-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ACBIB7CPXSJT3DTYDEBGUJ36EVKQZFGR
X-Message-ID-Hash: ACBIB7CPXSJT3DTYDEBGUJ36EVKQZFGR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ACBIB7CPXSJT3DTYDEBGUJ36EVKQZFGR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/06/2023 13:09, Hal Feng wrote:
> Add bindings for StarFive JH7110 dummy PWM-DAC transmitter.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../sound/starfive,jh7110-pwmdac-dit.yaml     | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac-dit.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac-dit.yaml b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac-dit.yaml
> new file mode 100644
> index 000000000000..bc43e3b1e9d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac-dit.yaml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/starfive,jh7110-pwmdac-dit.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Dummy PWM-DAC Transmitter
> +
> +maintainers:
> +  - Hal Feng <hal.feng@starfivetech.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-pwmdac-dit
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  sound-name-prefix: true

Drop

> +
> +required:
> +  - compatible
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false

Instead: unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pwmdac-dit {

pwmdac?

Best regards,
Krzysztof

