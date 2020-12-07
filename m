Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BC12D0D4E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Dec 2020 10:47:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE0F816A4;
	Mon,  7 Dec 2020 10:46:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE0F816A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607334425;
	bh=0kZ+3B4ZwE6XbIKhQAsEWfpiBBGinFzIKbHnu8rrzDU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aDrp9rm7lB2p6x+Mj3Ql5sz6E68Ek5TOsS8ORLtbOXeOeH8lICRP3gH9f47KDxqM9
	 saC9/Bjmv2Pz73ckyuvUu2HdPYTjP0XPb0H2DgMD4xPsKwjTuzRuvkksVK6iYQoyqp
	 oTbQA1TzJNUGMVIMunPUTzTE24/EscTAO6l0/dXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FDE6F80217;
	Mon,  7 Dec 2020 10:45:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75DF0F8020D; Mon,  7 Dec 2020 10:45:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF36DF800E1
 for <alsa-devel@alsa-project.org>; Mon,  7 Dec 2020 10:45:19 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B9BD4A0040;
 Mon,  7 Dec 2020 10:45:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B9BD4A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1607334318; bh=r9UquN0PujV2iZOkdKVtVy5RyDRywOKFNEZQxJkGS08=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qH/lMhuTe7e6ViUaYGlqNhLo9be4LC0cD1JBtiF7t2GURr1csKlxTgX2MhqONkQbb
 9uyQpsHg1hGrO2vL0shYQfCr09e6ZTJrYQLrpNAOMaTtF567H3oe+Eji6z8sI0jeub
 IVP6HuQXJvbHHbrzVjwoPxqiIguhHV2X//eD9UjM=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  7 Dec 2020 10:45:14 +0100 (CET)
Subject: Re: snd-rn-pci-acp3x - auto dmic detection unreliable
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
References: <a13f4f45-513e-0b99-8cf4-0ae89bf7d6bd@perex.cz>
 <MWHPR12MB166388C29409E3D488E5C85597E10@MWHPR12MB1663.namprd12.prod.outlook.com>
 <a7f011e4-0fb8-b861-ebc8-be6de0d46d50@perex.cz>
 <86f7bb6c-21ed-f18f-2c9f-d86136898cae@amd.com>
 <c893265d-f71f-9be9-1bf5-879ff26d13fe@amd.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <7cdfd2fa-2724-b42e-116a-f8697834ec4a@perex.cz>
Date: Mon, 7 Dec 2020 10:45:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <c893265d-f71f-9be9-1bf5-879ff26d13fe@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: ALSA development <alsa-devel@alsa-project.org>, "Kandimalla,
 NagaMalleswaraRao" <NagaMalleswaraRao.Kandimalla@amd.com>, "Arya,
 Virendra-Pratap" <Virendra-Pratap.Arya@amd.com>
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

Dne 07. 12. 20 v 10:51 Mukunda,Vijendar napsal(a):
> 
> Corrected typo error.
> 
> On 07/12/20 3:19 pm, Mukunda,Vijendar wrote:
>>
>>
>> On 07/12/20 2:22 pm, Jaroslav Kysela wrote:
>>> Dne 18. 11. 20 v 10:25 Mukunda, Vijendar napsal(a):
>>>> [AMD Public Use]
>>>
>>> AMD: You just replicated my original question without any answer (2 
>>> weeks+).
>>> Do you have something to share or do you not support your code?
>>
>> We are already provided reply on 18th Nov.
>>
>> _WOV integer value should be set only when DMIC is connected to APU.
>> When DMIC is not connected to APU,  _WOV integer value should be set to 
>> zero by BIOS.
>>
>>   DMIC doesn't had auto presence detect logic on AMD platforms and DMIC 
>> connection to AMD platform is simple wiring.
>> Whether DMIC connected to APU or HDAUDIO codec can be decided by ODMs.
>>
> ODM BIOS has to update the _WOV method value based on DMIC connected to APU
>> or not.

Thank you. Please, format correctly your e-mail messages, do not write your
answers inside the old text without '>' markers:

https://mailman.alsa-project.org/pipermail/alsa-devel/2020-November/177218.html

I just overlooked your lines inside my forwarded message.

So the problem is that the hardware vendors do not do the right job in this case.

			Thank you again,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
