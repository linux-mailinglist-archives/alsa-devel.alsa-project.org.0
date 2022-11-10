Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EDC624306
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 14:15:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E5FB1661;
	Thu, 10 Nov 2022 14:14:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E5FB1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668086138;
	bh=LbwfKsHqVmoatV3DqpuQNw5SluBGEENfM/HktWK0sPs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uJDUnBUoxN/5vQZPZEvi8KtOwHF/q4OK34vmmKbnmggWCb289oB2Ls7gjZE/RyjGP
	 0ou4CSvPEO5hvibWX6KAso6beUj3JYgWBuaIBt01l1v5yoWcPZW8w+H70HjFJN22cL
	 OtKWZ/77XrgPKGaojaH8hnGH7pzTy5HA6O85j6LM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92E6FF80104;
	Thu, 10 Nov 2022 14:14:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8317DF8021D; Thu, 10 Nov 2022 14:14:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A43FF80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 14:14:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A43FF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="UPG+Z2qp"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AACjddP028494; Thu, 10 Nov 2022 07:14:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=kD1m6VCRlQYW+ijK5eEXwbmuUugkbgmTtw/FTowKXZ8=;
 b=UPG+Z2qpQ4+qji+mMslS35OZfNbBY3sJ85P1nQ4DDx7m1pKLxNmtS6agP9EtVXAhY/dN
 a1eOaipQph2487rbwzIXRV4d0s35eK9yK7me+v9zjTGevOKUdDr6k93bkLYPDTlYc8Fj
 gxBBks0+8F2rKflsIQhluJjUkFzewxIOXMGMA+8TRQ9jbvly+7BfgrcyYnIwXDvqlWGR
 zflM9j0xjhdPEyy+XG++0wnFWvrNcwFNOhM2HJIL9+pzhrKKqCm6Esf3ExtTGe6Aa+8a
 1S2DVoVKrqlfOUV/nQv1iwiqXNV+dyWkzQW2sS1xiLyiCcJAfM+JQ4yU9BH16/XVavFu Zg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3knn81q224-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 07:14:32 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Thu, 10 Nov
 2022 07:14:30 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.15 via
 Frontend Transport; Thu, 10 Nov 2022 07:14:30 -0600
Received: from [198.90.251.111] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3F55946B;
 Thu, 10 Nov 2022 13:14:30 +0000 (UTC)
Message-ID: <4d50faae-7eea-bc5a-9def-935c2063a7b3@opensource.cirrus.com>
Date: Thu, 10 Nov 2022 13:14:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 09/12] irqchip: cirrus: Add driver for Cirrus Logic
 CS48L31/32/33 codecs
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
 <20221109165331.29332-10-rf@opensource.cirrus.com>
 <87mt8zutib.wl-maz@kernel.org>
 <c0c05799-6424-7edf-01b3-e28a10907b2c@opensource.cirrus.com>
 <86pmdvow5y.wl-maz@kernel.org>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <86pmdvow5y.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aQX-5YRNzgLfR64UzVEJh_O4ywOPGPrg
X-Proofpoint-GUID: aQX-5YRNzgLfR64UzVEJh_O4ywOPGPrg
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linus.walleij@linaro.org, lee@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-gpio@vger.kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 10/11/2022 12:01, Marc Zyngier wrote:
> On Thu, 10 Nov 2022 11:22:26 +0000,
> Richard Fitzgerald <rf@opensource.cirrus.com> wrote:
>>
>> On 10/11/2022 08:02, Marc Zyngier wrote:
>>> On Wed, 09 Nov 2022 16:53:28 +0000,
>>> Richard Fitzgerald <rf@opensource.cirrus.com> wrote:
>>>>
>>>> The Cirrus Logic CS48L31/32/33 audio codecs contain a programmable
>>>> interrupt controller with a variety of interrupt sources, including
>>>> GPIOs that can be used as interrupt inputs.
>>>>
>>>> This driver provides the handling for the interrupt controller. As the
>>>> codec is accessed via regmap, the generic regmap_irq functionality
>>>> is used to do most of the work.
>>>>
>>>
>>> I cannot spot a shred of interrupt controller code in there. This
>>
>> It is providing support for handling an interrupt controller so that
>> other drivers can bind to those interrupts. It's just that regmap
>> provides a lot of generic implementation for SPI-connected interrupt
>> controllers so we don't need to open-code all that in the
>> irqchip driver.
> 
> And thus none of that code needs to live in drivers/irqchip.
> 
>>
>>> belongs IMO to the MFD code.
>>
>> We did once put interrupt support in MFD for an older product line but
>> the MFD maintainer doesn't like the MFD being a dumping-ground for
>> random other functionality that have their own subsystems.
> 
> I don't like this stuff either. All this code is a glorified set of
> interrupt handlers and #defines that only hide the lack of a proper DT
> binding to express the interrupt routing (it feels like looking at
> board files from 10 years ago).
> 
> None of that belongs in the irqchip code.
> 
>>
>>>   It is also a direct copy of the existing
>>> irq-madera.c code, duplicated for no obvious reason.
>>
>> It's not a duplicate. The register map of this device is different
>> (different addressing, 32-bit registers not 16-bit)
> 
> And? How hard is it to implement an indirection containing the
> register map and the relevant callbacks? /roll-eyes
> 

I note your accusation that we were too lazy (or too stupid?)
to think of this.

> 	M.
> 
