Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CE91ED069
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 15:00:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48E871657;
	Wed,  3 Jun 2020 14:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48E871657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591189219;
	bh=QQFbSwdfmHH7QjqPqGqKeNPKYjaAA4mdvyIkDxV87KQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LCVw0U/cm2Z71p+doN0Pzo30lkyf36xVwntkk/Zlk48LKiz98f+61vKAsjqLnndLb
	 i+xPxxOxM9zc0euuLN1NX9nILapl/Cp/OLzdrYd7xYMcuz7DHKwAcKIhLCPoGRfBfG
	 o39/gn8fXU22+1kjh3hmGocjzxxcObNtWed4dKGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70F99F800D0;
	Wed,  3 Jun 2020 14:58:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 614B8F801ED; Wed,  3 Jun 2020 14:58:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E160F800BC
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 14:58:25 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 15FA0A003F;
 Wed,  3 Jun 2020 14:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 15FA0A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1591189103; bh=fXL+Jez9lqTi1puhrtt9P87RUkf6ljmH2Y85QmCDa5w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=k0IE3qKc/xNzV5sDsCtUxmwIAam8mb87D/lIyCHORro8xPjv0oRFepd+94zJcxLl5
 nRsno8c0CbZaWxABQu1Iidhn0ynkdRlKKMhCWEMc+4mby7qu34zTPb74Iqhg9xDkNc
 skFXZPSbsPwuT1aVtzEzQdVXlC9sf0Q1G/wcAj9w=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  3 Jun 2020 14:58:18 +0200 (CEST)
Subject: Re: alsa-project alsa-ucm : Audio endpoint is not switching when
 external mic connected
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
 Takashi Iwai <tiwai@suse.de>
References: <DM6PR12MB26332026A8F345F742B5E9FF978B0@DM6PR12MB2633.namprd12.prod.outlook.com>
 <d149204b-1e2d-1ee9-fbb4-c6f8874e369a@perex.cz>
 <da8b6e1e-fd29-fb99-07a7-d5fd8c7b78f9@canonical.com>
 <s5htuzsebm9.wl-tiwai@suse.de>
 <DM6PR12MB263397E76403D68BA6FE383E97880@DM6PR12MB2633.namprd12.prod.outlook.com>
 <s5hftbce8si.wl-tiwai@suse.de>
 <DM6PR12MB2633A59C90974B547BD0FDBC97880@DM6PR12MB2633.namprd12.prod.outlook.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <c1d060ab-0ad2-91dc-7df3-fad59a2287b9@perex.cz>
Date: Wed, 3 Jun 2020 14:58:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB2633A59C90974B547BD0FDBC97880@DM6PR12MB2633.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Hui Wang <hui.wang@canonical.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Dne 03. 06. 20 v 12:58 Mukunda, Vijendar napsal(a):
> 
> 
>> -----Original Message-----
>> From: Takashi Iwai <tiwai@suse.de>
>> Sent: Wednesday, June 3, 2020 4:06 PM
>> To: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
>> Cc: Hui Wang <hui.wang@canonical.com>; Jaroslav Kysela <perex@perex.cz>;
>> alsa-devel@alsa-project.org
>> Subject: Re: alsa-project alsa-ucm : Audio endpoint is not switching when
>> external mic connected
>>
>> On Wed, 03 Jun 2020 12:32:41 +0200,
>> Mukunda, Vijendar wrote:
>>>
>>>
>>>
>>>> -----Original Message-----
>>>> From: Takashi Iwai <tiwai@suse.de>
>>>> Sent: Wednesday, June 3, 2020 3:05 PM
>>>> To: Hui Wang <hui.wang@canonical.com>
>>>> Cc: Jaroslav Kysela <perex@perex.cz>; Mukunda, Vijendar
>>>> <Vijendar.Mukunda@amd.com>; alsa-devel@alsa-project.org
>>>> Subject: Re: alsa-project alsa-ucm : Audio endpoint is not switching when
>>>> external mic connected
>>>>
>>>> On Wed, 03 Jun 2020 02:36:25 +0200,
>>>> Hui Wang wrote:
>>>>>
>>>>>
>>>>> On 2020/6/3 上午3:39, Jaroslav Kysela wrote:
>>>>>> Dne 02. 06. 20 v 19:57 Mukunda, Vijendar napsal(a):
>>>>>>> We recently up streamed ACP PDM driver for Renoir APU.
>>>>>>>
>>>>>>> Our ACP IP has an internal PDM Decoder block where DMIC is directly
>>>>>>> connected.
>>>>>>> There are no KControls defined for PDM Driver.
>>>>>>>
>>>>>>> Our platform supports on board DMIC and South bridge Azalia (HD
>>>>>>> Audio ) endpoint .
>>>>>>> By default, DMIC endpoint is used as audio input device.
>>>>>>> When Headset Mic jack connected, it's not switching to External Mic.
>>>>>>
>>>>>> Make sure that the Headset Mic priority port in pulseaudio is is
>>>>>> greater than the one for DMIC.
>>>>>>
>>>>>>> How does audio endpoint will switch in gnome when external mic is
>>>>>>> connected?
>>>>>>>>  From our understanding, UCM conf file for HDA driver is also
>>>>>>>> required for
>>>>>>> configuring mixer controls for HD Audio capture device.
>>>>>>> Similarly when External Mic is removed , it has to switch to
>>>>>>> internal dmic .
>>>>>>
>>>>>> An configuration example for UCM (DMIC connected to DSP, HDA codec
>>>>>> for rest):
>>>>>>
>>>>>>
>>>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub
>>>> .com%2Falsa-project%2Falsa-ucm-conf%2Ftree%2Fmaster%2Fucm2%2Fsof-
>>>> hda-
>>>>
>> dsp&amp;data=02%7C01%7CVijendar.Mukunda%40amd.com%7C5fbb3a516d5
>>>>
>> 24c73568d08d807a157a1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C
>>>>
>> 0%7C637267736827671946&amp;sdata=0aO7dbLATuW%2BIeJsjWoWCGOaYEO
>>>> WQaVwI9izppB3v7k%3D&amp;reserved=0
>>>>>>
>>>>>> If you need a help to create a new configuration for your hardware,
>>>>>> show the output from the alsa-info.sh script, please.
>>>>>>
>>>>>>                      Jaroslav
>>>>>
>>>>> This audio design is  a bit different from sof-hda-dsp, the dmic is on
>>>>> a standalone sound card. Please see the alsa-info.txt:
>>>>>
>>>>>
>>>>
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpasteb
>>>>
>> in.ubuntu.com%2Fp%2F4kprhDZYbg%2F&amp;data=02%7C01%7CVijendar.Mu
>>>>
>> kunda%40amd.com%7C5fbb3a516d524c73568d08d807a157a1%7C3dd8961fe4
>>>>
>> 884e608e11a82d994e183d%7C0%7C0%7C637267736827671946&amp;sdata=Q
>>>> 50xNbF1KSqasNa0UyKzUFAzOc9KPIguBjgYHr1XSbg%3D&amp;reserved=0
>>>>
>>>> And that's an interesting case.  Can we manage multiple cards in a
>>>> single UCM profile?
>>>>
>>>>
>>>> Takashi
>>>
>>> I am not much familiar with UCM files creation.
>>> As per my understanding, UCM entries will program the mixer controls
>>> depending up on the use case and selected device.
>>
>> UCM is more than that.  It manages which PCM device is chosen, which
>> jack control corresponds, etc, too.
>>
>>
>> Takashi
> 
> Got it. Could you help us to get the UCM file which will work for both sound cards for our platform.

Please, create a new issue with the mentioned alsa-info URL at github:

https://github.com/alsa-project/alsa-ucm-conf/issues

I'll give a look when my time permits.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
