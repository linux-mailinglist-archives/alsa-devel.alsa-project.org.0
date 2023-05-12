Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E69700BD3
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 17:31:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5125850;
	Fri, 12 May 2023 17:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5125850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683905501;
	bh=X8AXcLdZDd8g0bREu1oKpsEQqDaJRXVL0Ysp5iLKSEw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ET+TBquaztjRH9U+r/vPjoc79g6nomoaCYLTqCa8D/5boHZDDmugviHPfp0d2WEKB
	 /YIaqr0jueDkMexkFJSQLb9kx4cCVewPcd7YrRJ+D+wvQ0Mn9R6mtzKGYbzRkyTHXH
	 1agKKtmzdEagL4RxaGYAtNqVPBQC9gibdfpnC1kY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE08AF80548; Fri, 12 May 2023 17:30:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CFEFF8032D;
	Fri, 12 May 2023 17:30:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1121F8052E; Fri, 12 May 2023 17:30:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDB82F802E8
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 17:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDB82F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=B3wUVVsl
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bdd7b229cso18244684a12.0
        for <alsa-devel@alsa-project.org>;
 Fri, 12 May 2023 08:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683905440; x=1686497440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xefq3pdZcO0e8EKQ19pFTto53xIKapXB7LmHWfDyQu4=;
        b=B3wUVVsls0aEbOr/VInqZjyshEeKanQt80a2sIm/FNUZlIQ9xR8OUTxnSZ5AgNhS5b
         I1FQ37AJtyHDuRoXWZ0SB023RcQmLubkjYBsu65owCYFhe96Wq9PrjYghN8cNEXUuEiE
         xkIWdGT0nleZobLTdcoI7WmSrwhlUo/Fgx5W0KCyYXVfmGQW/+IVUTY0i7KMdeu+DhFU
         rzZKJSa+so2eE5r2DUjWbcURlNbIA3/4VzDd5lzGfeY1Gj71F/Q4WYpaiYKPBnjm9npI
         QW9TVbJvsF7aO6viJuxShULipefO1sPsY7zumjiUcNwoufCtOSjgdnDOKM8VywTQLcNo
         ti7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683905440; x=1686497440;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xefq3pdZcO0e8EKQ19pFTto53xIKapXB7LmHWfDyQu4=;
        b=AhBXT+CnRWegCRVik0sxeCx6IkoMJ3Ei+GhQmvZu+ywhHsvq4ftd30XU3sqHDrjeHB
         mDG9HJVfLi1nWfqh2ORUUAORFbJhz/roSGSfwIKXNqnKuwUzQyLwhqVc6Dm8OOpPW3KF
         Pfa0+TZ3W0Se0+9MdXFvp3GqqZp0hxAqGbPU0nkE+DpB2pgOwS7TQBvtHcK6z5SdpaMU
         h0cms8lx0yxfsFb0R3aXz3cjIcJ8Ajt0+K86py9I8Ytte14CMfUVEtzWM2SG4cpXyPhe
         +cvH52PLB/xX79Syn61hmcz6x1YqAma2/PN7VZvRji6rA+QSiGZViZPLCDjqqlqEL/++
         mj7Q==
X-Gm-Message-State: AC+VfDxr5kQyqMqYlcf6UjiLTeP/w+Q6Z42JF0DIBdTlFoHKjkA1Zv2N
	EQc5hWqcfM5Vxx9vXJNJknuWRA==
X-Google-Smtp-Source: 
 ACHHUZ7ox4zpEalJuln5LCdWNNjDzEjIcylFmSEdARdvEn9rrWst0L377ZSaS0MUvfliMWUYEJBOGg==
X-Received: by 2002:a17:907:d16:b0:966:391b:5b3e with SMTP id
 gn22-20020a1709070d1600b00966391b5b3emr20842436ejc.55.1683905439693;
        Fri, 12 May 2023 08:30:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883?
 ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id
 bn13-20020a170906c0cd00b0096599bf7029sm5588639ejb.145.2023.05.12.08.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 08:30:39 -0700 (PDT)
Message-ID: <9591999e-9d7f-2a4a-29df-d9c42dfa736b@linaro.org>
Date: Fri, 12 May 2023 17:30:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 08/10] pinctrl: cs42l43: Add support for the cs42l43
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
 lee@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, tglx@linutronix.de, maz@kernel.org,
 linus.walleij@linaro.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-9-ckeepax@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512122838.243002-9-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GAS6WUN5RTQ777OCIIFUL6VKT34VJ5ZC
X-Message-ID-Hash: GAS6WUN5RTQ777OCIIFUL6VKT34VJ5ZC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GAS6WUN5RTQ777OCIIFUL6VKT34VJ5ZC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/05/2023 14:28, Charles Keepax wrote:
> The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> for portable applications. It provides a high dynamic range, stereo
> DAC for headphone output, two integrated Class D amplifiers for
> loudspeakers, and two ADCs for wired headset microphone input or
> stereo line input. PDM inputs are provided for digital microphones.
> 
> Add a basic pinctrl driver which supports driver strength for the
> various pins, gpios, and pinmux for the 2 multi-function pins.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

...

> +{
> +	struct cs42l43 *cs42l43 = dev_get_drvdata(pdev->dev.parent);
> +	struct cs42l43_pin *priv;
> +	struct pinctrl_dev *pctldev;
> +	int ret;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = &pdev->dev;
> +	priv->regmap = cs42l43->regmap;
> +
> +	priv->shutters_locked = cs42l43->hw_lock;
> +
> +	priv->gpio_chip.request = gpiochip_generic_request;
> +	priv->gpio_chip.free = gpiochip_generic_free;
> +	priv->gpio_chip.direction_input = cs42l43_gpio_direction_in;
> +	priv->gpio_chip.direction_output = cs42l43_gpio_direction_out;
> +	priv->gpio_chip.get = cs42l43_gpio_get;
> +	priv->gpio_chip.set = cs42l43_gpio_set;
> +	priv->gpio_chip.label = dev_name(priv->dev);
> +	priv->gpio_chip.parent = priv->dev;
> +	priv->gpio_chip.can_sleep = true;
> +	priv->gpio_chip.base = -1;
> +	priv->gpio_chip.ngpio = CS42L43_NUM_GPIOS;
> +	priv->gpio_chip.fwnode = dev_fwnode(cs42l43->dev);
> +
> +	if (is_of_node(dev_fwnode(cs42l43->dev))) {
> +		device_set_node(priv->dev,
> +				fwnode_get_named_child_node(dev_fwnode(cs42l43->dev),
> +							    "pinctrl"));

That's something unusual. It seems you want to bind to a DT node because
you miss compatible in DT node?

> +	} else {
> +		device_set_node(priv->dev, dev_fwnode(cs42l43->dev));
> +	}
> +
> +	pm_runtime_enable(priv->dev);
> +	pm_runtime_idle(priv->dev);
> +

....

> +
> +static struct platform_driver cs42l43_pin_driver = {
> +	.driver = {
> +		.name	= "cs42l43-pinctrl",
> +	},
> +
> +	.probe		= cs42l43_pin_probe,
> +	.remove		= cs42l43_pin_remove,
> +};
> +module_platform_driver(cs42l43_pin_driver);
> +
> +MODULE_DESCRIPTION("CS42L43 Pinctrl Driver");
> +MODULE_AUTHOR("Charles Keepax <ckeepax@opensource.cirrus.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:cs42l43-pinctrl");

Same comment, so I guess you have this pattern everywhere.

Best regards,
Krzysztof

