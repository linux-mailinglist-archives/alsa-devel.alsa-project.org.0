Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F8B74375D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 10:35:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9998850;
	Fri, 30 Jun 2023 10:34:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9998850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688114140;
	bh=9o5jFqY8Cf/eBoOjbmW/oRp3Nn20QNCjmaRK2Z1ELhI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CY3Y2V6jGr2GghpBoWSO8QKEx5vcEd86sXI/EXn5ag9JrQ0iCFs7We+dl5sHIosCG
	 7Fz3OEoVTzg4XdrPfMzDAKGYajBQMIHe8jlqNGwUc/6IxP6dxnZp89ivAmU69XJsIE
	 b/meHfFVDXNMaa1NX9ZgxcMZtaqB/qIHn0LzBzOY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB951F80589; Fri, 30 Jun 2023 10:33:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EDDBF8057D;
	Fri, 30 Jun 2023 10:33:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAD4FF80246; Fri, 30 Jun 2023 03:46:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 719FCF80169
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 03:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 719FCF80169
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id D76DF24E245;
	Fri, 30 Jun 2023 09:45:51 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 09:45:51 +0800
Received: from [192.168.125.93] (183.27.97.206) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 30 Jun
 2023 09:45:50 +0800
Message-ID: <4ed97fd6-a99c-0be8-aff5-61021be59422@starfivetech.com>
Date: Fri, 30 Jun 2023 09:45:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v1 2/5] ASoC: codecs: Add StarFive JH7110 dummy PWM-DAC
 transmitter driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Walker
 Chen" <walker.chen@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
 <20230626110909.38718-3-hal.feng@starfivetech.com>
 <4c421206-39a2-d98e-f75d-f5d269e881ff@linaro.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <4c421206-39a2-d98e-f75d-f5d269e881ff@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [183.27.97.206]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: hal.feng@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PXF7MQRLX7HIUJKDZJDXGYWQ777WAZ7H
X-Message-ID-Hash: PXF7MQRLX7HIUJKDZJDXGYWQ777WAZ7H
X-Mailman-Approved-At: Fri, 30 Jun 2023 08:33:43 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXF7MQRLX7HIUJKDZJDXGYWQ777WAZ7H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 26 Jun 2023 17:33:57 +0200, Krzysztof Kozlowski wrote:
> On 26/06/2023 13:09, Hal Feng wrote:
>> Add a dummy transmitter driver for StarFive JH7110 PWM-DAC module.
>> StarFive JH7110 PWM-DAC controller uses this driver.
>> 
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  sound/soc/codecs/Kconfig                     |  4 ++
>>  sound/soc/codecs/Makefile                    |  2 +
>>  sound/soc/codecs/jh7110_pwmdac_transmitter.c | 74 ++++++++++++++++++++
>>  3 files changed, 80 insertions(+)
>>  create mode 100644 sound/soc/codecs/jh7110_pwmdac_transmitter.c
>> 
> 
> ...
> 
>> +
>> +static struct platform_driver pwmdac_dit_driver = {
>> +	.probe		= pwmdac_dit_probe,
>> +	.driver		= {
>> +		.name	= DRV_NAME,
>> +		.of_match_table = of_match_ptr(pwmdac_dit_dt_ids),
>> +	},
>> +};
>> +
>> +module_platform_driver(pwmdac_dit_driver);
>> +
>> +MODULE_DESCRIPTION("StarFive JH7110 dummy PWM-DAC transmitter driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:" DRV_NAME);
> 
> Drop. You don't need it. If you need it, it means you miss proper ID table.

OK. I will drop it in the next version. Thanks.

Best regards,
Hal
