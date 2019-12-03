Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B4C10FA0E
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 09:41:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB0241660;
	Tue,  3 Dec 2019 09:40:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB0241660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575362500;
	bh=Ta4bqQVrB4X6ZZQojXp06N96lnp5MHt87bR1KINZqJU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IpCOtNVCZnIqEbmbBK6eH/M5z8ae6y8u74xyeqJvcxKMCKP+jA4qdJWIS2ie1uB5z
	 EVnV2IQRtefnPT81/OHaEpPJqiwNNuVlUm/ArDdT4ilNHAuEc86DafL9mZTnGw42+y
	 Su6BwN9LBrCtYGRN7bqj5NqH1giT9LWaukgSJOio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38282F80227;
	Tue,  3 Dec 2019 09:39:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31C46F80227; Tue,  3 Dec 2019 09:39:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57951F800ED
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 09:39:51 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5D4B9A0040;
 Tue,  3 Dec 2019 09:39:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5D4B9A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1575362391; bh=MKwmXGXatxkvsB+38042zUiCViITHjwUADunOU9mPdY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tgpIxB3dFX4uS7Vf1IqxSJ1lasijD2lsL7pI0ckO4pned291ARjadUgIsbzjScvAM
 u5pC8sO5W1/8HdRUFQS6me4eOgYgRBWPnSxj5AOF9rz4/uJk0x6sZe/mamS4CIbhwy
 bmTi2D91PWx1RHRtvEecNn/VmZc303b/02r7e5yA=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  3 Dec 2019 09:39:48 +0100 (CET)
To: Curtis Malainey <cujomalainey@google.com>
References: <20191107015808.26844-1-cujomalainey@chromium.org>
 <20191107015808.26844-2-cujomalainey@chromium.org>
 <4b378b2c-fea2-5d77-26ff-0ff409d8e527@perex.cz>
 <0626a79d-4950-ab27-d10a-366cd74da332@perex.cz>
 <CAOReqxiCDP4ByX4P4ROmfQmjTREJenzyQNaOT=Go+4ctN5j_hg@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <eab09c08-4e63-3f25-b39e-72472dac8cd5@perex.cz>
Date: Tue, 3 Dec 2019 09:39:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAOReqxiCDP4ByX4P4ROmfQmjTREJenzyQNaOT=Go+4ctN5j_hg@mail.gmail.com>
Content-Language: en-US
Cc: Curtis Malainey <cujomalainey@chromium.org>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 02/11] ucm: docs: Add JackType value
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 03. 12. 19 v 4:22 Curtis Malainey napsal(a):
> On Fri, Nov 29, 2019 at 8:01 AM Jaroslav Kysela <perex@perex.cz> wrote:
>>
>> Dne 11. 11. 19 v 14:39 Jaroslav Kysela napsal(a):
>>> Dne 07. 11. 19 v 2:57 Curtis Malainey napsal(a):
>>>> Identifies the type of jack and how it should be accessed
>>>>
>>>> Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
>>>> ---
>>>>     include/use-case.h | 3 +++
>>>>     1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/include/use-case.h b/include/use-case.h
>>>> index 2051bd40..3208cc30 100644
>>>> --- a/include/use-case.h
>>>> +++ b/include/use-case.h
>>>> @@ -322,6 +322,9 @@ int snd_use_case_get_list(snd_use_case_mgr_t *uc_mgr,
>>>>      *        configuration that doesn't belong to UCM configuration files.
>>>>      *   - JackName
>>>>      *      - Input name is the input device name for the jack
>>>> + *   - JackType
>>>> + *      - Specifies whether the jack is accessed via hctl or gpio and therefore
>>>> + *        only carries the possible values of "gpio" or "hctl"
>>>>      */
>>>>     int snd_use_case_get(snd_use_case_mgr_t *uc_mgr,
>>>>                          const char *identifier,
>>>>
>>>
>>> What is meant with the "gpio" type? The standard input device interface? I
>>> believe it should be "inputdev" and "ctl" (hctl is just interface on top of
>>> ctl and the application can access the jack through snd_ctl functions, too.
>>
>> I see (when I was cleaning this extra Chrome stuff in the ucm profiles) that
>> it's related to the gpio (general purpose i/o pin interface) in the linux
>> kernel. The JackSwitch is probably also related and defines the pin number
>> where the application should watch for the jack state. In this case, it would
>> be probably more nice to follow the JackControl and JackDev and define the pin
>> number through JackGPIO or something like that. We will cover all three
>> posibilities: ALSA control interface, Input interface, GPIO interface .
>>
>>                                          Jaroslav
> Initially that was our thoughts too but then we realized that in the
> event of a new theoretical input subsystem "foo" that can be used for
> jack detect then we would need to create another field for that as
> well. This reduces the need for having a field for every theoretical
> subsystem in the future and only then requires a new value.

The JackDev and JackControl was defined in 2015. If we decide to switch to:

JackType "(gpio|ctl|inputdev)"
JackSwitch "(gpio pin|ctl jack control name|input device name)"

.. then we need to adapt pulseaudio, too.

Anyway, JackDev/JackControl allows to use both definitions simultaneously, 
thus the application can choose the interface as preferred (and available).

The gpio looks like a hack for drivers which does not have this abstraction 
(input device or ALSA's jack) implemented. The gpio pin value can be passed 
using the device tree to the driver.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
