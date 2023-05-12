Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD984700BA4
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 17:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BCC8868;
	Fri, 12 May 2023 17:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BCC8868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683905336;
	bh=zxt/vPtCQpxf7lVwVfb4CUv1xBqhJr9MSx87JQPAm4g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rIRAH2BJIj2ZKLrOS/Gy41qE6lRsqxpi1IBaScptQi2UgWnbnzNaD8liVmSGwoVOI
	 jwDiFkvew9W8gB/ODAZslkZnAhmyS2BVm6updD6An6XL3Xo9NSchfIM35nyBtYem2l
	 oAlbKjKmfGtnReZ29fTBTvr7fB09wERtDuwDxBII=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFE06F8032D; Fri, 12 May 2023 17:27:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ACC9F8032D;
	Fri, 12 May 2023 17:27:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4816BF8032D; Fri, 12 May 2023 17:27:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1778F802E8
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 17:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1778F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cZuCKD/v
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bc5197d33so18485750a12.1
        for <alsa-devel@alsa-project.org>;
 Fri, 12 May 2023 08:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683905256; x=1686497256;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u0ut4B+E0h3ijgKitKEhlhSfAINQTp1vAT8c6mNpva4=;
        b=cZuCKD/vsU6tZh1/XVNGy0WAzBPs2z5Kp0Yqlo7tUpsH9p6YFSGZaEKZgBfuHL2n0X
         79Q5Dyhq7QRNDw9ak/D9IPjYaEDDlQKx0HWgjNN6w7pONk9ija4JI5TgDfG19x2korv4
         v8gs4GoxxJpMzSBon1uie9LeGj5An60PugmB06wq8oy/Z2yPMxA+rxvjoE5QPeySjiuU
         Cxj6mPf9mInKPY/xTI6nmf6HXdW6B15iy4yPOLCIsMxfkQwcGNk10GvHni0v+ZhrhuXU
         yHWaBLynVhpWvYFvQqzWgZfXDrvMT0KvYZCeiLUu5kmwCXdmdJX3RPs9yGAQ61xMM7PG
         OIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683905256; x=1686497256;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u0ut4B+E0h3ijgKitKEhlhSfAINQTp1vAT8c6mNpva4=;
        b=ULqUugv1uEJVP9XUkfXc7NM/5GtT5c93Tb1QTI1Mkxi4DTf4FNsQ9hK/8d+lXvjAqv
         eEb3cyYnXJ4b6OCgvLTwqwdFucILdoGWv70meZlAC1M0Ygpzqqws4vcUHQvgmQuJLzli
         D17ihGrjFVyQKobgYmUzHDwYtgOx4exr6CneTZYvOvZ6pm0h2bXeDKhoEdP2KkaGIl9h
         vMCIIz0fft9WzCfHUE9y8sxRhnqsXgyB6kQ5WVZ6DkeIcQX5vUBvXmy2CDKAZIj4nGcG
         CuZ6HG7em+xuBttOuuk/YlPlXN7VLWuW2uLWOx76vYEehAFbZQNLjsphcH+UzTi4vI6u
         YeMg==
X-Gm-Message-State: AC+VfDy1jvRWBoOJ2dOoOESRr+Oq/he60vrkbWxn1lt1qbtWNSdq7GzW
	3/VDQ03tgHrJnFYAoHV4boUtOQ==
X-Google-Smtp-Source: 
 ACHHUZ52+8WNQ0S8g9+pFes5+4q4Z5a4cjowDKRjpT0CodUm+0DDZKCTAGcXZhW1RTL6VyFOzjiP+Q==
X-Received: by 2002:a17:907:7f14:b0:94f:9acc:65c9 with SMTP id
 qf20-20020a1709077f1400b0094f9acc65c9mr22694649ejc.66.1683905255980;
        Fri, 12 May 2023 08:27:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883?
 ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id
 ty20-20020a170907c71400b0096621340285sm5515134ejc.198.2023.05.12.08.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 08:27:35 -0700 (PDT)
Message-ID: <80f5acfe-a32c-48cc-590a-ee02d2b494aa@linaro.org>
Date: Fri, 12 May 2023 17:27:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 07/10] irqchip/cs42l43: Add support for the cs42l43 IRQs
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
 <20230512122838.243002-8-ckeepax@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512122838.243002-8-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YYUVTLPQHY2JW7GB3E4TTBN3QQQ3B6YV
X-Message-ID-Hash: YYUVTLPQHY2JW7GB3E4TTBN3QQQ3B6YV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YYUVTLPQHY2JW7GB3E4TTBN3QQQ3B6YV/>
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
> The IRQ chip provides IRQ functionality both to other parts of the
> cs42l43 device and to external devices that wish to use its IRQs.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thank you for your patch. There is something to discuss/improve.

> +
> +static struct platform_driver cs42l43_irq_driver = {
> +	.driver = {
> +		.name	= "cs42l43-irq",
> +	},
> +
> +	.probe		= cs42l43_irq_probe,
> +	.remove		= cs42l43_irq_remove,
> +};
> +module_platform_driver(cs42l43_irq_driver);
> +
> +MODULE_DESCRIPTION("CS42L43 IRQ Driver");
> +MODULE_AUTHOR("Charles Keepax <ckeepax@opensource.cirrus.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:cs42l43-irq");

You miss the ID table. Don't add aliases for missing ID entries. They do
not scale and it is not their purpose.

> diff --git a/include/linux/irqchip/cs42l43.h b/include/linux/irqchip/cs42l43.h
> new file mode 100644
> index 0000000000000..99ce0dbc96a77
> --- /dev/null
> +++ b/include/linux/irqchip/cs42l43.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * CS42L43 IRQ driver external data
> + *
> + * Copyright (C) 2022-2023 Cirrus Logic, Inc. and
> + *                         Cirrus Logic International Semiconductor Ltd.
> + */
> +
> +#ifndef CS42L43_IRQ_EXT_H
> +#define CS42L43_IRQ_EXT_H
> +
> +enum cs42l43_irq_numbers {
> +	CS42L43_PLL_LOST_LOCK,
> +	CS42L43_PLL_READY,
> +

Are these really used by other subsystems? Your IRQ handling should be
anyway next to the driver.

Best regards,
Krzysztof

