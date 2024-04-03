Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E56896A06
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:09:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F4422BED;
	Wed,  3 Apr 2024 11:09:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F4422BED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712135358;
	bh=pkZwS+e5I+h69eXwpb5Uy35vKeyJ9txD4lCmRKkROoU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E0TQVFKJrFhW8GBG5IcqFbvXV0WCfKxtsEjKPypbMwjlT4IZG7v62kPUtvV7A69GY
	 7ZV/fpDXzAwApA71qk4JfWnHFU6iUvUTgt3/yqOtfnjYj25+jYPTQ1JHm3eaHwAbkA
	 lgORZioWYLdtnjsQDjqT1Rvl5LoJxJ4YkESf707g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D69AF80568; Wed,  3 Apr 2024 11:08:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DCA6F8057D;
	Wed,  3 Apr 2024 11:08:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A62DDF8020D; Wed,  3 Apr 2024 11:06:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1607EF80130
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1607EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yfUg9fl5
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a4e65dec03eso398133266b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Apr 2024 02:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712135192; x=1712739992;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uj+vStzBE1g5HSFxOT3J1gWV2WIEySZ+b3hpcha4y3E=;
        b=yfUg9fl5m7hFtvZhnNUjPpho0+ym8uPMXa1fmo+KBS1/oKDZckDfoJNa4gEQuJd1+A
         kaAywGOMqn+o5x3hupUkyBtQHfvtez0XVybqqPItrZpr9nuiZmHCk1dcXs4wdPnrJANE
         8ZMHOCMXpbbIfViEoCqPF2w4YVtO8mdfVBiOO+5Rqde9FjOBajBVao+TvbZWSjXIvrJA
         m5mQcfj79sk0FD4oifYDy/zKCPW2q9UNk42aj9ukngd0iPliOvtSVxy4Pa2QeEDPVeHS
         f8WkpSzi7vJCRFecNEJuw2Z13mdzGO7BRCSo7umapp8E2zBEm9fypcpIHyR+a7/spM3J
         V1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712135192; x=1712739992;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj+vStzBE1g5HSFxOT3J1gWV2WIEySZ+b3hpcha4y3E=;
        b=BdqCDD6l8Ns2pE+c+RJ6ebm66MZtvO3o6FAP664rEN37zKL08bW8/xs2uSksXBFYg/
         BR3KxRR3rAfDF3dLjzoVXRXkoTSu2DjKNYeXOpf2zZS8bJNwXobdzjSqf4bG3cFcBRbp
         03ZLr3K2VdNQy/p8f6qrENpnvkYogP5Wx+5CL4B6g9AYKM6/E8vETj4Xmfr/Fco3qrgI
         5V6rHOLUsFB73HM+WIRFX34ikyQQKZgynl9RXMORcZlmk0QKBnvI7SmRaBW5hrk8U4qq
         xwiLGivXQFGpp5Z0qG9DP+WbkSFXzhLOYIyVtdQ5bsM0A6aBu7xeDJ1AZVbfy1sKNbRW
         l8nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzZurTvquDR4M2iPfEV3vBqsgVkR0KkBJI9OAKAu1QTWP/9gH0QMaWQtIqNG+6/detbRI3Fz4p27MlWpmrUilo9SNXe7C06KIBBMk=
X-Gm-Message-State: AOJu0Yxad9NoFMqp0T1jWG6Ryma9NjA16/L5bdZ8dGuHx4Rod8i4sW8d
	fpKVln/l6QmaGhGw7CMR85ZgPQPUJTvrmd8Z5lZEAzSh6bj/O3B/n7j2fUzAF38=
X-Google-Smtp-Source: 
 AGHT+IGRqZpi9oCpnNmrge8Z32DKZEdGLAfYi9Oj1PCEBcKrbaPVEKfjcmfbYYYevLIwW3BRhRIHyQ==
X-Received: by 2002:a17:906:39c2:b0:a4e:7f22:cfc2 with SMTP id
 i2-20020a17090639c200b00a4e7f22cfc2mr1464281eje.28.1712135191799;
        Wed, 03 Apr 2024 02:06:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 pw14-20020a17090720ae00b00a4e35cc42c7sm6377026ejb.170.2024.04.03.02.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 02:06:31 -0700 (PDT)
Message-ID: <2c9af070-ab35-41c7-9d81-a1f20509a20e@linaro.org>
Date: Wed, 3 Apr 2024 11:06:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/34] ASoC: remove incorrect of_match_ptr/ACPI_PTR
 annotations
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Yinchuan Guo <guoych37@mail2.sysu.edu.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-33-arnd@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240403080702.3509288-33-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BMOBGUJKF2PLCVZ5WQIKJLAUYHFMTX2J
X-Message-ID-Hash: BMOBGUJKF2PLCVZ5WQIKJLAUYHFMTX2J
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BMOBGUJKF2PLCVZ5WQIKJLAUYHFMTX2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/04/2024 10:06, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When building with CONFIG_OF and/or CONFIG_ACPI disabled but W=1 extra
> warnings enabled, a lot of driver cause a warning about an unused
> ID table:
> 
> sound/soc/atmel/sam9x5_wm8731.c:187:34: error: unused variable 'sam9x5_wm8731_of_match' [-Werror,-Wunused-const-variable]
> sound/soc/codecs/rt5514-spi.c:496:34: error: unused variable 'rt5514_of_match' [-Werror,-Wunused-const-variable]
> sound/soc/samsung/aries_wm8994.c:524:34: error: unused variable 'samsung_wm8994_of_match' [-Werror,-Wunused-const-variable]
> 
> The fix is always to just remove the of_match_ptr() and ACPI_PTR() wrappers
> that remove the reference, rather than adding another #ifdef just for build
> testing for a configuration that doesn't matter in practice.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  sound/soc/amd/acp3x-rt5682-max9836.c | 2 +-
>  sound/soc/atmel/sam9x5_wm8731.c      | 2 +-
>  sound/soc/codecs/rt5514-spi.c        | 2 +-
>  sound/soc/qcom/lpass-sc7280.c        | 2 +-
>  sound/soc/samsung/aries_wm8994.c     | 2 +-

I sent it already as well:
https://lore.kernel.org/all/20230310214333.274903-5-krzysztof.kozlowski@linaro.org/

and Mark did not pick it up, I guess for the same reason as SPI.

Best regards,
Krzysztof

