Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BEA768D1C
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 09:07:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47AED7F8;
	Mon, 31 Jul 2023 09:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47AED7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690787236;
	bh=pCnTb0sOrn3xXxMthpVr3lJ9LiT5xiQpoNF7GyVwQqI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mt6RJHO52KB/iZ3IFs0Z80tCmx3NfDQfDMoK/g4UqLYgZXsIXrYX4u9WZMyPnjVtg
	 +yjw1Z9WhiGFqtoGsiqsw4p4D3T5BYAH3P/4GgONsoQ+A+Vuq6EqB3BMR3+0yLuPPX
	 mrFNbvj1WIBZVL5HU22l6zCWrwpq/Ew5x0nitjo0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EDDCF80425; Mon, 31 Jul 2023 09:06:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 617DAF80163;
	Mon, 31 Jul 2023 09:06:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7490BF8016D; Mon, 31 Jul 2023 09:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E9FDF80153
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 09:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E9FDF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JWdIFUyP
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so663077666b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 31 Jul 2023 00:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690787173; x=1691391973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2S79vQkr/Q6AsrCfTC9FA0lnKMVA5NRuZdzXti1EXs=;
        b=JWdIFUyPCSGhlS9/udGq4gNVONwXz7IgcHWdgX38rdevQIipSg0PqMICpRfm7kXMq6
         HsWcRRKT4BiOviTPUx5rvVAzEaDbr05j76NHSb2wLnYHNKAJwR+6I0s0jN9TGITjPPcD
         lYBRBUirFzBqD0/Ei32YyQeSuExCH4/XMMMN0bObvLNipjF5uxkRwl+yeUop00SwR8QG
         t4eTZ8pJSyTvmTFIkp23JyxfZbH1jGqadG0ylrkpCQePqw/pmGMeZYnkHfzvG/XLyNZ0
         DX/azZfNF4bfhgUB1bX7bY5I+Q8o5QqZ+xysWiVoIYhQZMmDJ2jqC83OsOa1CO05CvRg
         Q8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690787173; x=1691391973;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2S79vQkr/Q6AsrCfTC9FA0lnKMVA5NRuZdzXti1EXs=;
        b=jQlXceXkXavv/t0cp+EEhQx9+AtMAlovmP9qNIc3M3XNaP3ihZdie89WbnVL9yx7eD
         oWh5lHOy9PYnFMFBaItqkzDvpaDWxKXF9RabekUZf0NJEj0C6cZNjKfLMTCZhozR/Nj1
         55Jg2JKVptDf3qzoNIRSyb+3zn5+qEM00rZIG4S/63OBKBXedwKP/hIDRykE+wjmI67g
         +aPTUUJpQqP112NghWVQu8InXp2mpc3od/HC2CaZO+dlQUeKt2sdhKcK1ROKzwGaCxA2
         DTDUzNqP0LiCaq8XJbvyYJI/rZTz9kiBtcOK7jXt3n5chG83/k5bJ2UUtKkvi3iJLfoP
         crFg==
X-Gm-Message-State: ABy/qLbqpR4C9g3szzIhKti3EFztmBinMj9MStf3rsVuiZzaR4jThXFm
	fWQPInYuDPELfTbSfKduWJHAhA==
X-Google-Smtp-Source: 
 APBJJlEPFgaPUMMYauFP7cTFYrzHjUp57IMDsTKAdaxvn07SrcaBjIcW2QxMB+JxkUTO7HjFCXXPvw==
X-Received: by 2002:a17:906:4f:b0:991:d2a8:658a with SMTP id
 15-20020a170906004f00b00991d2a8658amr6680496ejg.34.1690787173223;
        Mon, 31 Jul 2023 00:06:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 lj24-20020a170906f9d800b0099bca8b9a31sm5703554ejb.100.2023.07.31.00.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 00:06:12 -0700 (PDT)
Message-ID: <b938ba84-38e9-b220-9686-6656e4452c10@linaro.org>
Date: Mon, 31 Jul 2023 09:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 2/3] ASoC: starfive: Add JH7110 PWM-DAC driver
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Walker Chen <walker.chen@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230731032829.127864-1-hal.feng@starfivetech.com>
 <20230731032829.127864-3-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230731032829.127864-3-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5GMX7B4ZNHZVYZRQBVSLF5CAVA7JO2BG
X-Message-ID-Hash: 5GMX7B4ZNHZVYZRQBVSLF5CAVA7JO2BG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5GMX7B4ZNHZVYZRQBVSLF5CAVA7JO2BG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31/07/2023 05:28, Hal Feng wrote:
> Add PWM-DAC driver support for the StarFive JH7110 SoC.
> 


...

> +static int jh7110_pwmdac_probe(struct platform_device *pdev)
> +{
> +	struct jh7110_pwmdac_dev *dev;
> +	struct resource *res;
> +	int ret;
> +
> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return -ENOMEM;
> +
> +	dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(dev->base))
> +		return PTR_ERR(dev->base);
> +
> +	dev->mapbase = res->start;
> +
> +	dev->clks[0].id = "apb";
> +	dev->clks[1].id = "core";
> +
> +	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(dev->clks), dev->clks);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to get pwmdac clocks\n");

return dev_err_probe

> +		return ret;
> +	}
> +
> +	dev->rst_apb = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(dev->rst_apb)) {
> +		dev_err(&pdev->dev, "failed to get pwmdac apb reset\n");
> +		return PTR_ERR(dev->rst_apb);

return dev_err_probe

> +	}
> +
> +	dev->dev = &pdev->dev;
> +	dev->shift = PWMDAC_SHIFT_8;
> +	dev->duty_cycle = PWMDAC_CYCLE_CENTER;
> +	dev->cnt_n = PWMDAC_SAMPLE_CNT_1;
> +	dev->data_change = NO_CHANGE;
> +	dev->data_mode = INVERTER_DATA_MSB;
> +	dev->data_shift = PWMDAC_DATA_LEFT_SHIFT_BIT_0;
> +
> +	dev_set_drvdata(&pdev->dev, dev);
> +	ret = devm_snd_soc_register_component(&pdev->dev,
> +					      &jh7110_pwmdac_component,
> +					      &jh7110_pwmdac_dai, 1);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register dai\n");
> +		return ret;

I guess here as well for consistency and shorter code even though
EPROBE_DEFER does not happen really.

return dev_err_probe

> +	}
> +
> +	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register pcm\n");
> +		return ret;

return dev_err_probe

> +	}
> +

Best regards,
Krzysztof

