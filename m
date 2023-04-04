Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E936D5A8F
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 10:16:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BFBC1F7;
	Tue,  4 Apr 2023 10:15:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BFBC1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680596188;
	bh=u5rrtQb7rNCX8CcgD8xmXU9ClGdlgMFhGrYK8HjdI2g=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rehGyYdYI65r6x9IcODSDEJoXuq8ksSjZ1sSJOxaIugTbdB+5tyvxoarzNipaKql5
	 PISaA9nMw9vlueOle5A6YYu/797M6Ep4mKgOfJyf3kt2L9IGJ3N3MMaUyQW/iLCsa0
	 WoqQ2Z/LphkxA9OrXH7tibw5rihG8OrKXg+FrA4E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FBCCF801C0;
	Tue,  4 Apr 2023 10:15:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1035DF8024C; Tue,  4 Apr 2023 10:15:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8078DF80054
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 10:15:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8078DF80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NRYH2aD+
Received: by mail-ed1-x52e.google.com with SMTP id ek18so127203128edb.6
        for <alsa-devel@alsa-project.org>;
 Tue, 04 Apr 2023 01:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680596129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxmMKV3AzGJpb+DJfP0Ri3E5yjDAWlJf8T4Fjwm6+p0=;
        b=NRYH2aD+xdXdnuA7nNqgRSyhnn2aP9Ph2LWz6h3BZx7LmEIuwO6pBaYDb5DRjWxcfW
         kiGL37qqa+P8NMcCTcvkA1pEy7Ez/DM2uIg+ju1lxKAMbtVHrhmuz1+f7G9jfEMJbr2+
         Kh4yWf7rKMeTXgCGa0+kzfDR5lL9JW0AwFpI7K61R085HhePmYJBaO3lM3XFD5LnWtDU
         0QVq98Q1UNtIQL2IaClR7bcRxK2RjweLBmAuX/uuMvNujABRxoLlWLebGlR6G1LWaamv
         bFuU0aF8qilZvAq3cVH92smx61Te+KxrKTDea43Zy2kAXbJf611pd8vcbbj0yOibK+yt
         CykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680596129;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxmMKV3AzGJpb+DJfP0Ri3E5yjDAWlJf8T4Fjwm6+p0=;
        b=1ZiE+3WpKc1RJxEpTZ3PuBcLR//a5JMmSQoGwNuBkNN3SciDwFm/kAT0eCTJEwMtDK
         dkJnw40daDqb2NVhW1zWZsl87RZVQHbdH+a5i6mXcROuUPZPLLb/ai8umobMsbr5WHnZ
         4I0NT6bNqywW4aUzPGumBiqM1o+oJiKgjUPAIFppsNPUDQ/jpYeIbWxoX92O3hOxO5gF
         hhSvrpAEXplzxeaH6iTgak/+Zkp8xalqirfS9O8+NmmN0xvD6g2hTHwIqqViHSvKb2a+
         Vly/TW4FwAS9wY7sy6Gr9IzNz0eR/YnC5073mxi5ZvEWsqKaDxWCQIxgOuT7r1hAt/5L
         XmCg==
X-Gm-Message-State: AAQBX9cpTQA9xPBczRYJIboT5oDqxarHtsrenA9rJG0X9dIi1o23j9It
	U66CC1OW9EvuMbnOONh06XOvSA==
X-Google-Smtp-Source: 
 AKy350bmdYzpUDTlUygS9hYOdaEvEPlNrLUMLXOcy9WcF2s6LIUp3B4MPrvRrNTyH6Y5JTFrdJSBQg==
X-Received: by 2002:a17:906:86d0:b0:932:c1e2:998b with SMTP id
 j16-20020a17090686d000b00932c1e2998bmr1319118ejy.15.1680596129470;
        Tue, 04 Apr 2023 01:15:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:233a:5c18:b527:381e?
 ([2a02:810d:15c0:828:233a:5c18:b527:381e])
        by smtp.gmail.com with ESMTPSA id
 b17-20020a170906491100b008e57b5e0ce9sm5557101ejq.108.2023.04.04.01.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 01:15:29 -0700 (PDT)
Message-ID: <143754c2-9e37-4386-af92-174c0df2eb0a@linaro.org>
Date: Tue, 4 Apr 2023 10:15:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
 <20230328092645.634375-3-herve.codina@bootlin.com>
 <20230330160510.GB489249@google.com> <20230331094208.41ab4420@bootlin.com>
 <6d39e9c3-fb6a-4b2a-9889-8fe8d86716d5@linaro.org>
 <20230331141104.42445da9@bootlin.com>
 <a642e653-e3e2-c3d2-68cb-1efc92be05bb@linaro.org>
 <20230331165904.4e7f46a1@bootlin.com> <20230403142822.GA8371@google.com>
 <20230404092036.2d1cd5d9@bootlin.com>
 <f7ab2fcc-93fc-ce87-8767-579d33907225@linaro.org>
 <20230404100759.5bc9cd20@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230404100759.5bc9cd20@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AHWRDILEBBAJ34DMVCKSQM3LO24RFRJJ
X-Message-ID-Hash: AHWRDILEBBAJ34DMVCKSQM3LO24RFRJJ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHWRDILEBBAJ34DMVCKSQM3LO24RFRJJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/04/2023 10:07, Herve Codina wrote:

>>> So, the structure I have in mind:
>>> - pef2256.c (MFD)
>>>   implement and do the setup at probe()
>>>   Add the children at probe():
>>>     - pef2256-pinctrl (pinctrl) added using mfd_add_devices()
>>>     - pef2256-codec (ASoC codec) added using devm_of_platform_populate()
>>>
>>> Lee, with this in mind, can the core pef2256.c be a MFD driver ?  
>>
>> You do not use MFD here, so why do you want to keep it in MFD? If you
>> disagree, please tell me where is the MFD code in your patch?
> 
> I don't want to absolutely use MFD.
> I just want to put my driver somewhere and I don't know the right location
> between MFD and Misc.
> 
> Basically, the driver needs to do (little simplified and error path removed):
> 
>   static const struct mfd_cell pef2256_devs[] = {
>   	{ .name = "lantiq-pef2256-pinctrl", },
>   };
> 
>   static int pef2256_probe(struct platform_device *pdev)
>   {
> 	struct pef2256 *pef2256;
> 	void __iomem *iomem;
> 	int ret;
> 	int irq;
> 
> 	pef2256 = devm_kzalloc(&pdev->dev, sizeof(*pef2256), GFP_KERNEL);
> 	if (!pef2256)
> 		return -ENOMEM;
> 
> 	pef2256->dev = &pdev->dev;
> 
> 	iomem = devm_platform_ioremap_resource(pdev, 0);
> 
> 	pef2256->regmap = devm_regmap_init_mmio(&pdev->dev, iomem,
> 						&pef2256_regmap_config);
> 
> 	pef2256->mclk = devm_clk_get_enabled(&pdev->dev, "mclk");
> 	pef2256->sclkr = devm_clk_get_enabled(&pdev->dev, "sclkr");
> 	pef2256->sclkx = devm_clk_get_enabled(&pdev->dev, "sclkx");
> 
> 	pef2256->reset_gpio = devm_gpiod_get_optional(&pdev->dev, "reset", GPIOD_OUT_LOW);
> 	if (pef2256->reset_gpio) {
> 		gpiod_set_value_cansleep(pef2256->reset_gpio, 1);
> 		udelay(10);
> 		gpiod_set_value_cansleep(pef2256->reset_gpio, 0);
> 		udelay(10);
> 	}
> 
> 	pef2556_of_parse(pef2256, np);
> 
> 	irq = platform_get_irq(pdev, 0);
> 	ret = devm_request_irq(pef2256->dev, irq, pef2256_irq_handler, 0, "pef2256", pef2256);
> 
> 	platform_set_drvdata(pdev, pef2256);
> 
> 	mfd_add_devices(pef2256->dev, PLATFORM_DEVID_NONE, pef2256_devs,
> 	      		ARRAY_SIZE(pef2256_devs), NULL, 0, NULL);

Wait, now you use MFD framework, so the driver is suitable for MFD.
Before there was nothing like that in your code.

Best regards,
Krzysztof

