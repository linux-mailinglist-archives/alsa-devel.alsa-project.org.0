Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE7C76FDB6
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:46:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9761384C;
	Fri,  4 Aug 2023 11:45:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9761384C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691142380;
	bh=cZ4lcTHX2JCiX/bJ3cTaAdxOVGeizBzJOBganeU2uOQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aPeKyFd9+Hn7A9MXGMIaQskiBsVcofMwOQg59lk/OwS0ZsaxXpjT+SoC2B89l+L36
	 UQGooYzf5leyNaWXCbRgQqTQim/B8+wTA9mbwjXe1TWP8AA+tb7Zm65eiJhdaJUiMW
	 QkWjR5Q4exVD0ImUtXUF0YHPMmkxZ8XG0IWQWR/c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAD4EF805D7; Fri,  4 Aug 2023 11:43:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20CE2F805D7;
	Fri,  4 Aug 2023 11:43:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FD9BF80520; Thu,  3 Aug 2023 05:01:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FCEAF80087
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 05:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FCEAF80087
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id EA21F24E225;
	Thu,  3 Aug 2023 11:00:48 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 3 Aug
 2023 11:00:49 +0800
Received: from [192.168.125.84] (183.27.98.54) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 3 Aug
 2023 11:00:47 +0800
Message-ID: <2ea68c95-1581-a67d-613b-5315fcfd0016@starfivetech.com>
Date: Thu, 3 Aug 2023 11:00:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 2/3] ASoC: starfive: Add JH7110 PWM-DAC driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Walker Chen <walker.chen@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230731032829.127864-1-hal.feng@starfivetech.com>
 <20230731032829.127864-3-hal.feng@starfivetech.com>
 <b938ba84-38e9-b220-9686-6656e4452c10@linaro.org>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <b938ba84-38e9-b220-9686-6656e4452c10@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.98.54]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: hal.feng@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VUCQWJKG7JZPYC3ONOIS7MX45S7J6TJP
X-Message-ID-Hash: VUCQWJKG7JZPYC3ONOIS7MX45S7J6TJP
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:42:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VUCQWJKG7JZPYC3ONOIS7MX45S7J6TJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 31 Jul 2023 09:06:10 +0200, Krzysztof Kozlowski wrote:
> On 31/07/2023 05:28, Hal Feng wrote:
>> Add PWM-DAC driver support for the StarFive JH7110 SoC.
>> 
> 
> 
> ...
> 
>> +static int jh7110_pwmdac_probe(struct platform_device *pdev)
>> +{
>> +	struct jh7110_pwmdac_dev *dev;
>> +	struct resource *res;
>> +	int ret;
>> +
>> +	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
>> +	if (!dev)
>> +		return -ENOMEM;
>> +
>> +	dev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>> +	if (IS_ERR(dev->base))
>> +		return PTR_ERR(dev->base);
>> +
>> +	dev->mapbase = res->start;
>> +
>> +	dev->clks[0].id = "apb";
>> +	dev->clks[1].id = "core";
>> +
>> +	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(dev->clks), dev->clks);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to get pwmdac clocks\n");
> 
> return dev_err_probe

OK, will fix.

> 
>> +		return ret;
>> +	}
>> +
>> +	dev->rst_apb = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>> +	if (IS_ERR(dev->rst_apb)) {
>> +		dev_err(&pdev->dev, "failed to get pwmdac apb reset\n");
>> +		return PTR_ERR(dev->rst_apb);
> 
> return dev_err_probe

Will fix.

> 
>> +	}
>> +
>> +	dev->dev = &pdev->dev;
>> +	dev->shift = PWMDAC_SHIFT_8;
>> +	dev->duty_cycle = PWMDAC_CYCLE_CENTER;
>> +	dev->cnt_n = PWMDAC_SAMPLE_CNT_1;
>> +	dev->data_change = NO_CHANGE;
>> +	dev->data_mode = INVERTER_DATA_MSB;
>> +	dev->data_shift = PWMDAC_DATA_LEFT_SHIFT_BIT_0;
>> +
>> +	dev_set_drvdata(&pdev->dev, dev);
>> +	ret = devm_snd_soc_register_component(&pdev->dev,
>> +					      &jh7110_pwmdac_component,
>> +					      &jh7110_pwmdac_dai, 1);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to register dai\n");
>> +		return ret;
> 
> I guess here as well for consistency and shorter code even though
> EPROBE_DEFER does not happen really.
> 
> return dev_err_probe

Will fix.

> 
>> +	}
>> +
>> +	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to register pcm\n");
>> +		return ret;
> 
> return dev_err_probe

Will fix. Thanks for your review.

Best regards,
Hal

> 
>> +	}
>> +

