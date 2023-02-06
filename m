Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 387B468C69D
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 20:17:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AAAB82B;
	Mon,  6 Feb 2023 20:16:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AAAB82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675711043;
	bh=5DY4GE4eF8/yf9k5ZXv2cwyLzcG2ZeWxtOqP/Pxo9lU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SSeeUZtpqLPFkFWK/JWHW8SvWmlVvreXD6NvTm+VvDtDzrw+thYT3VBuk0hn9TmS5
	 Be0ZCd4sISt32WGrx/Ql49fJyyTA1UA1fXnbCzmC6g32k95m86iDjBekmnfL0pDT55
	 /4KyM8gJdeUmZVTV6t/bzKDIqEiEFRAomCXRO9LQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DE3CF800E3;
	Mon,  6 Feb 2023 20:16:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBD39F804FB; Mon,  6 Feb 2023 20:16:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30E7DF800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 20:16:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30E7DF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=VPj2N3jH
Received: by mail-wm1-x32a.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso11554559wms.0
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 11:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gJRDeiWMU5LminQ5X0rSwq5LRRKb8iCPzPGu9WgeBvk=;
 b=VPj2N3jHazrLOiA7IMwXdxCeFN/lEBhO1oe783NaPoPoRMAJ6L05bPfNIY1WSBVPvg
 YgR8ZcE1UpgfiKiMwyZjQz3KKkOHc/09+dTTizVt8UI471hYotXy+eaPYtI0LjD2B9X8
 TM+OupEI9O4EaWaz9EAcCuhBecxbDP0XRUE9zBxqMorKfh8kc7fSlqb8WEfyD4Fzvnb/
 oqdWiVzVZiER7qK/GwKoHDG+LSwok8oGcu7mxMwe1vb+7QABcdb2nTyS6R3QhsQ+ZRXT
 Qbw+HQvs0Uij5IaDi5jCdEmXQqTq5Lgy6J67JTREXAUoj/bQYMr60UqRZkPohBhoMUwV
 cvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gJRDeiWMU5LminQ5X0rSwq5LRRKb8iCPzPGu9WgeBvk=;
 b=ddCm773S4/+UphxUUhgybpw75o0kjadWdgE8HUtGkNwNAiLhp/NWYXeQJe6zERC8s4
 z+l1dqXPx/Cyqqp5eBky95P5xihfKh+kOfdYjMmLKACUao0MS+JBS9pvpGbF658E2lWO
 srOhw6K4qjdDR/4/1qxs3930bkkdsILWt2+rfL3Vzr9+DHwYQJbN1QcMdeqdoRrmckfr
 pKhndEnbeUERWnbtYsETkcJr0K5lZ5V7VbKbBguuGMYWs0qUCiCtmdYzmjWUMiQ3axrE
 h6WOxhTf+eXJfKx7vQCqItIOH1JJXYCyj+A4UjsypIznQPTmuFdXWjHR9LCVWuu1SxfL
 M93Q==
X-Gm-Message-State: AO0yUKVZ7dwBtO7/F5PWLNYv+77Yo3PvohaDHMQjN1mgqEZtnT4Guni8
 SwRC5HvWpd9b5e0tPHbCqbjbTA==
X-Google-Smtp-Source: AK7set9kdM2QNJOY0kxx1JjhOxRMvHbF5AvX3IsjMUfODox45NsBWNLdRL4wGOc0gLaOFODk/k+JVA==
X-Received: by 2002:a05:600c:331b:b0:3df:ead3:c6fc with SMTP id
 q27-20020a05600c331b00b003dfead3c6fcmr746809wmp.17.1675710988803; 
 Mon, 06 Feb 2023 11:16:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b003d9aa76dc6asm18047337wms.0.2023.02.06.11.16.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 11:16:28 -0800 (PST)
Message-ID: <ab80be6e-0dfe-a696-6d81-0969e5a21ddb@linaro.org>
Date: Mon, 6 Feb 2023 20:16:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 6/7] ASoC: dt-bindings: meson: convert axg spdif output
 to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-7-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206153449.596326-7-jbrunet@baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 06/02/2023 16:34, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg spdif output to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-spdifout.txt   | 25 ------
>  .../bindings/sound/amlogic,axg-spdifout.yaml  | 79 +++++++++++++++++++
>  2 files changed, 79 insertions(+), 25 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

