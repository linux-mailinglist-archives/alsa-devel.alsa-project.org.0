Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3B47739B8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 12:42:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A87A9E84;
	Tue,  8 Aug 2023 12:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A87A9E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691491340;
	bh=OHX1uXSFwjycPDN2HmXSyPRSwy891xsdwdxNNTeAFoM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ukk/5WgWvtHV8DsPCPhqUOSGcIbAVpmplngs+M3bVcK3WLsq/k7se61YGM8XZuHXM
	 4N1uo8uPKpswjmetdpy84lB9XhF/7HIu5MJpD8LB1dBBewP7LgBHPtlIxZ5r5/Ehej
	 YI9gFgRvf92ry7NW39/zmoEmwwDJ5zlitfjIJNik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93448F80564; Tue,  8 Aug 2023 12:36:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3C59F80564;
	Tue,  8 Aug 2023 12:36:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4779F8016D; Mon,  7 Aug 2023 11:37:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-9.1 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9106BF80087
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 11:37:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9106BF80087
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 7F62F7FD3;
	Mon,  7 Aug 2023 17:37:40 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 7 Aug
 2023 17:37:40 +0800
Received: from [192.168.125.128] (113.72.146.246) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 7 Aug
 2023 17:37:39 +0800
Message-ID: <80d6ac43-2b78-97e4-9905-38bf8440ffb9@starfivetech.com>
Date: Mon, 7 Aug 2023 17:33:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: snps,designware-i2s: Add
 StarFive JH7110 SoC support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxim Kochetkov
	<fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Walker Chen <walker.chen@starfivetech.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-riscv@lists.infradead.org>
References: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
 <20230802084301.134122-3-xingyu.wu@starfivetech.com>
 <37a636dd-fbd8-d475-8814-e0cc6d5cc812@linaro.org>
 <12a9bfda-9c9f-6baf-3e5f-ce7cc7d79aee@starfivetech.com>
 <f0744dfd-00fe-2f58-065e-6828b6bd3450@linaro.org>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <f0744dfd-00fe-2f58-065e-6828b6bd3450@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [113.72.146.246]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UD4PT5DYJVLF6XCFGL7AKSLTQMR2P5AW
X-Message-ID-Hash: UD4PT5DYJVLF6XCFGL7AKSLTQMR2P5AW
X-Mailman-Approved-At: Tue, 08 Aug 2023 10:36:05 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UD4PT5DYJVLF6XCFGL7AKSLTQMR2P5AW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023/8/7 17:17, Krzysztof Kozlowski wrote:
> On 07/08/2023 11:03, Xingyu Wu wrote:
>>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: snps,designware-i2s
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          maxItems: 1
>>>> +        clock-names:
>>>> +          maxItems: 1
>>>> +        resets:
>>>> +          maxItems: 1
>>>> +    else:
>>>> +      properties:
>>>> +        resets:
>>>> +          minItems: 2
>> 
>> The resets of TX0/TX1/RX on JH7110 SoC are mentioned in 'else' here.
> 
> Ah, its fine. Clocks seem to be also constrained.

OK, I will keep it here.

> 
>> 
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: starfive,jh7110-i2stx0
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          minItems: 5
>>>
>>> Also maxItems
>> 
>> Will add.
>> 
>>>
>>>> +        clock-names:
>>>> +          minItems: 5
>>>
>>> Also maxItems
>> 
>> Will add.
>> 
>>>
>>> What about resets? 1 or 2 items?
>> 
>> Mentioned it in the 'else'.
>> Or do you mean I should drop the 'else' and add the resets in here?
>> And is the same for TX1 and RX?
> 
> It won't be easy to read... probably the binding should be split.
> Anyway, it's fine as is, except the maxItems above.
> 

So I will keep it and just add the maxItems in next version.

Thanks,
Xingyu Wu

