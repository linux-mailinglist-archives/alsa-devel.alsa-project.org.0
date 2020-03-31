Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13481199936
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 17:08:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B91E01672;
	Tue, 31 Mar 2020 17:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B91E01672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585667296;
	bh=TWpmbApNI59cAR4VmwJHkC1RWd80cTR3CK6Bp8mp/SY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j0uzo1cUgi4k2KCLNk81LMlZ1ZaDlWanruH5zh1HGLbNsat3lJC/XpFz7BG90dM8d
	 acwEahsBCOX3w4/Liv/dR+odjr3E19fCjMgTCF50536HRl0iTEa0qBK/0U2/Kaq+7O
	 enLP00RvK1wNcnTPbrHFUorOdZEefuTAt5ff6flk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F039BF80146;
	Tue, 31 Mar 2020 17:07:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C25F5F80157; Tue, 31 Mar 2020 17:07:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 077FDF8010C
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 17:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 077FDF8010C
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 3E134A1A4A8F5;
 Tue, 31 Mar 2020 17:07:11 +0200 (CEST)
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JtvVJyT7uiVF; Tue, 31 Mar 2020 17:07:05 +0200 (CEST)
Received: from [192.168.105.119] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 29CF7A1A4A820;
 Tue, 31 Mar 2020 17:07:05 +0200 (CEST)
Subject: Re: Functionality of pcm_notify in snd-aloop?
To: Jaroslav Kysela <perex@perex.cz>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <b4af9071-f8d7-5b47-4d7a-c5743bd67394@ivitera.com>
 <61d837f1-de1a-7aa6-ca8f-d0cfaa36ea69@perex.cz>
 <28a05a44-55bf-1831-aa3c-875e0499caea@ivitera.com>
 <28063dd1-71ab-a313-04b8-f4d97312b1b5@ivitera.com>
 <a325c165-5ced-618b-0b71-c0c4381473a1@perex.cz>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <2787fae9-ec83-5c9f-ccb6-f68c8b0a9056@ivitera.com>
Date: Tue, 31 Mar 2020 17:07:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <a325c165-5ced-618b-0b71-c0c4381473a1@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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


Dne 30. 03. 20 v 17:09 Jaroslav Kysela napsal(a):
> Dne 30. 03. 20 v 16:43 Pavel Hofman napsal(a):
>>
>> Dne 26. 03. 20 v 18:59 Pavel Hofman napsal(a):
>>> Dne 26. 03. 20 v 18:44 Jaroslav Kysela napsal(a):
>>>> Dne 26. 03. 20 v 18:19 Pavel Hofman napsal(a):
>>>>> Hi,
>>>>>
>>>>> Please how is the module params pcm_notify supposed to be used, to do
>>>>> what the documentation says: Break capture when PCM 
>>>>> format/rate/channels
>>>>> changes?
>>>>>
>>>>> Breaking capture side operation when the playback side changes the
>>>>> params is very useful, but I cannot find a way to use this param
>>>>> properly. When the capture side is open, the playback side cannot 
>>>>> use a
>>>>> different parameter than the one currently used by the capture side 
>>>>> (the
>>>>> configuration space is limited)
>>>>
>>>> Really? Then it's a bug introduced by the last changes.
>>>>
>>>> If you look to sources:
>>>>
>>>>        if (get_notify(dpcm))
>>>>                  runtime->hw = loopback_pcm_hardware;
>>>>          else
>>>>                  runtime->hw = cable->hw;
>>>>
>>>> And:
>>>>
>>>>        if (!(cable->valid & ~(1 << substream->stream)) ||
>>>>              (get_setup(dpcm)->notify &&
>>>>               substream->stream == SNDRV_PCM_STREAM_PLAYBACK))
>>>>                  params_change(substream);
>>>>
>>>> So the functionality should be there.
>>>
>>> I am using older kernels (4.15 and 3.16), but this is an old 
>>> functionality.
>>>
>>> modprobe snd-aloop pcm_substreams=1 pcm_notify=1,1
>>>
>>
>> Please is there any way to solve this issue? Thanks a lot for your 
>> patience.
> 
> I can reproduce this. It appears that the driver should be fixed, but I 
> don't have a solution at the moment.
> 
> It seems that 898dfe4687f460ba337a01c11549f87269a13fa2 from Takashi 
> broke this functionality (tied the cable parameters more strictly, so 
> the playback cannot set freely own parameters for the pcm_notify=1 
> case). We need to find another way to detach capture stream in this case.
> 

Thanks a lot for your effort. I am afraid I cannot help with such 
design-level task.

BTW the sound design of snd-aloop allows reliable operation at 20MHz 
samplerate, it took just a period_max param change 
https://www.diyaudio.com/forums/equipment-and-tools/349239-support-samplerates-sw-analyzers.html#post6133979 
I will ask for considering a substantial samplerate range extension in a 
separate post :-)

Thanks again.

Best regards,

Pavel.
