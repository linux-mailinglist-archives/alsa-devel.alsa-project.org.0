Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6B6624712
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 17:32:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E047F166C;
	Thu, 10 Nov 2022 17:31:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E047F166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668097932;
	bh=d1Q/QQl1MtVQeP6hMuS9VABWjyFhlBsp8xfQ44pdXcg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q2+V9DHeuR+K0bHaTVWpte+I1PSHlSKAb3dAsRhO2CX6YnLqCQdEGFCXCEk18oTCS
	 XMkxlq6pltSXtM/FkA3yBdpL+jbSgK0wGpYPt9W6D7zR9bDGVCuhJzSRqON7SDgq5j
	 I5tF0dL7ccmLeObI1VGICJFr7sxkGLDSbvKkOTBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1E1EF8021D;
	Thu, 10 Nov 2022 17:31:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7E3CF80104; Thu, 10 Nov 2022 17:31:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE5C1F80104
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 17:31:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE5C1F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="NAiim7PG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AACffYQ021705; Thu, 10 Nov 2022 10:31:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=G1k1KLyGMwxozZNLgQY9XUSivrmWdqX+jg/q/VREfJQ=;
 b=NAiim7PGQLdTnUxXyyryjfybkJIs1146lYP1fVx1EbnRXJKv5/E3RTDxo1f47TfSRoS3
 of8nH9BOQSU6aBZeARROBxY7NUfTLqIREdqGed8GCmIgERL2OJT2GsyanQXaueJSpCVn
 VJV61rI9+MIm91tLdWiQ0iKZmKdRqvCnufWlkveTDTA2vPobcR1N4EV3yjwqMvkhISSk
 XoP4sV8zdhjnpJMuYTLIDYiZAKfO0436DLnlkG8uPr3FERreK22vJd+cPWtjybF/e+jC
 WAEjPjm8Fv1LZ18kYX1InhSvQnhT3126GAhf/KUmwCJs07iTjyIa8lETo9pcORJJeDaZ WA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3knn81qf0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Nov 2022 10:31:09 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Thu, 10 Nov
 2022 10:31:07 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.15 via Frontend Transport; Thu, 10 Nov 2022 10:31:07 -0600
Received: from [198.90.251.111] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3C0E046B;
 Thu, 10 Nov 2022 16:31:07 +0000 (UTC)
Message-ID: <05ae0e20-b472-f812-1afc-ef8c2a97cdeb@opensource.cirrus.com>
Date: Thu, 10 Nov 2022 16:31:06 +0000
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
 <ef60cbdb-f506-7bd6-a8e1-c92b6963a0f4@opensource.cirrus.com>
 <86k042q1uc.wl-maz@kernel.org>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <86k042q1uc.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9jVJuRIJp_kAT78zvrXKtjtfM9LpjTM4
X-Proofpoint-GUID: 9jVJuRIJp_kAT78zvrXKtjtfM9LpjTM4
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

On 10/11/2022 15:13, Marc Zyngier wrote:
> On Thu, 10 Nov 2022 13:00:50 +0000,
> Richard Fitzgerald <rf@opensource.cirrus.com> wrote:
>>
>> On 10/11/2022 12:01, Marc Zyngier wrote:
>>> On Thu, 10 Nov 2022 11:22:26 +0000,
>>> Richard Fitzgerald <rf@opensource.cirrus.com> wrote:
>>>>
>>>> On 10/11/2022 08:02, Marc Zyngier wrote:
>>>>> On Wed, 09 Nov 2022 16:53:28 +0000,
>>>>> Richard Fitzgerald <rf@opensource.cirrus.com> wrote:
>>>>>>
>>>>>> The Cirrus Logic CS48L31/32/33 audio codecs contain a programmable
>>>>>> interrupt controller with a variety of interrupt sources, including
>>>>>> GPIOs that can be used as interrupt inputs.
>>>>>>
>>>>>> This driver provides the handling for the interrupt controller. As the
>>>>>> codec is accessed via regmap, the generic regmap_irq functionality
>>>>>> is used to do most of the work.
>>>>>>
>>>>>
>>>>> I cannot spot a shred of interrupt controller code in there. This
>>>>
>>>> It is providing support for handling an interrupt controller so that
>>>> other drivers can bind to those interrupts. It's just that regmap
>>>> provides a lot of generic implementation for SPI-connected interrupt
>>>> controllers so we don't need to open-code all that in the
>>>> irqchip driver.
>>>
>>> And thus none of that code needs to live in drivers/irqchip.
>>>
>>>>
>>>>> belongs IMO to the MFD code.
>>>>
>>>> We did once put interrupt support in MFD for an older product line but
>>>> the MFD maintainer doesn't like the MFD being a dumping-ground for
>>>> random other functionality that have their own subsystems.
>>>
>>> I don't like this stuff either. All this code is a glorified set of
>>> interrupt handlers and #defines that only hide the lack of a proper DT
>>> binding to express the interrupt routing (it feels like looking at
>>> board files from 10 years ago).
>>>
>>
>> I didn't understand this. The whole purpose of this is to instantiate
>> Linux interrupts for the PIC interrupt sources so that other drivers
>> that want to use the interrupts from the CS48L32 PIC can use standard
>> kernel APIs or DT to bind against them.
> 
> There is zero standard APIs in this patch. Does cs48l32_request_irq()
> look standard to you? This whole thing makes a mockery of the
> interrupt model and of firmware-based interrupt description which we
> spent years to build.
> 
>>
>> The four handlers registered within the driver are done here simply
>> because they don't belong to any particular child driver. Since they
>> are a fixed feature of the chip that we know we want to handle we may as
>> well just register them.
> 
> Again, they have no purpose in an interrupt controller driver.
> 
>> If we put them in the MFD with DT definitions it would make a
>> circular dependency between MFD and its child, which is not a great
>> situation. If it's these handlers that are bothering you, we could move
>> them to the audio driver.
> 
> And what's left? Nothing.

Ah, I see. You've missed that the bulk of the implementation re-uses
existing library code from regmap. It does say this in the commit
message.

   "the generic regmap_irq functionality is used to do most of the work."

and I've also said this in previous replies.

This is no way driver that does nothing. There's over 1000 lines of code
handling the PIC and dispatching its interrupts to other drivers that
want to bind to them. It's just that it makes no sense to duplicate 1300
lines of interrupt handling code from elsewhere when we can re-use that
by calling regmap_add_irq_chip(). That gives us all the interrupt-
controller-handling code in drivers/base/regmap/regmap-irq.c

Perhaps you could re-review this taking into account that
regmap_add_irq_chip() is significant.
