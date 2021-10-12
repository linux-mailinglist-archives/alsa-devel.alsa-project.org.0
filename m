Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB04429E57
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 09:11:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1703168C;
	Tue, 12 Oct 2021 09:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1703168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634022661;
	bh=Jph5YO/bJcNtxTl2meVF2NgqAFzEJ1tyoD6Sh4Tpo+U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T8xBbL5Rsrw80G9JvDD2/csa3r+1Ol8mchbFhozFZNeN+lrVmRWI+hVw8hBGfjzTY
	 67EtRU0kjZCl491NOzI0MJTYafYk101p3a0w+cHwFM/sHBcAgUoAhXiCRQLjjFPFRa
	 z01banjsEQ/19ExWrVPEXUK+nK/CrtJo5BxQppF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36893F80245;
	Tue, 12 Oct 2021 09:09:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3499AF80212; Tue, 12 Oct 2021 09:09:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A5C1F80083
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 09:09:34 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 93D58A003F;
 Tue, 12 Oct 2021 09:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 93D58A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1634022573; bh=MCKswC9dfx4z8lMqYYZ+iA/guE0ZI+EWy0JeZqlKWRg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KdgpgBni8FQ8qf00KE9jd6F/lFFE4gBL/deP4Gzk7btbCektMaADrYppYboQ0kWUH
 qpplY4C6k6A4bE615Q4s1ZOGDqE9skTxDMlPtBn8eVHwUDZ7PVJ6yeXG1cTCJF/Bn5
 j81zXmnFi1sB3RRSHiFqhuGUHdOs/np/CqimKvsc=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 12 Oct 2021 09:09:29 +0200 (CEST)
Message-ID: <22cb5c18-9c92-7365-99a5-e0577e243fa2@perex.cz>
Date: Tue, 12 Oct 2021 09:09:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] ASoC: simple-card: Fill in driver name
Content-Language: en-US
To: didi.debian@cknow.org
References: <YNGe3akAntQi8qJD@qwark.sigxcpu.org> <4974503.Y8KB3sNASq@bagend>
 <61a82214-0de8-816f-ff63-3979b86343bf@perex.cz> <5069869.zQgEQKRxDW@bagend>
 <f7efde11-067d-8822-45fa-7cdbe2d17d93@perex.cz>
 <97a1c38c48765fb6634de34387e3ce3c@cknow.org>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <97a1c38c48765fb6634de34387e3ce3c@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>, linux-kernel@vger.kernel.org
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

On 11. 10. 21 23:48, didi.debian@cknow.org wrote:
> On 2021-10-11 19:16, Jaroslav Kysela wrote:
>> On 10. 10. 21 12:40, Diederik de Haas wrote:
>>> On Sunday, 10 October 2021 10:40:09 CEST Jaroslav Kysela wrote:
>>>>> Unfortunately this change broke multichannel audio on my Rock64
>>>>> device
>>>>> running Debian. My Rock64 is connected to my AVR (Pioneer SC-1224)
>>>>> via a
>>>>> HDMI cable.
>>>> This looks like an user space configuration problem.
>>>
>>> I have placed ALSA card definitions (I think) from LibreELEC on my
>>> system from
>>> https://github.com/LibreELEC/LibreELEC.tv/tree/master/projects/Rockchip/
>>> filesystem/usr/share/alsa/cards
>>
>> Apparently, the alsa-lib configuration is used in this case.
>>
>> It seems that there are four sound cards (Analog/HDMI/I2S/SPDIF)
>> created for your hardware. The alsa-lib configuration is a bit weird -
>> an obfuscation for the simple-card driver use. The simple way to
>> resolve this is to create a proper UCM configuration.
>>
>> If you need further assistance, create an issue for alsa-lib or
>> alsa-ucm-conf on github and with an output from the 'alsa-info.sh'
>> script.
> 
> Will do.
> 
> FTR: It's now working again for me on a kernel with this patch included:
> https://github.com/LibreELEC/LibreELEC.tv/issues/5734#issuecomment-940088156
> 
> I have no idea whether this is a proper solution or another
> 'workaround', but
> it's working for me again :)

The patch bellow resolved your issue - alsa-lib configuration fix. But it's 
not an universal solution and there may be clashes with other simple-card 
drivers in future.

https://github.com/LibreELEC/LibreELEC.tv/pull/5749/commits/f681a48a664bd0f0e8f0dc131bd58c5d7512adc3

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
