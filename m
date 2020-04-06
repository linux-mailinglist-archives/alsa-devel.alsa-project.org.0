Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2219FB19
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 19:12:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A00D1679;
	Mon,  6 Apr 2020 19:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A00D1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586193152;
	bh=kg4uiLZ0ONxEZfbQ04N45QEqkmJrNu+atRD7jFBszXE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IDjs6Bs/jVlQR4B1t5GfXmQes2dM4Jv2VaNO3DFcH5X1KZsUtThrk7+veHSnWpRLZ
	 OkErPYhSJ3IGpxuYJoF6GFjb1Q8hBBKlyNTyQBEv88Uio6GiJrWcDfeAC5PvSDd1Yr
	 /ZuFCK6JndkZKGku9DCf0tbPvMFpJsITQkqojQbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC615F80150;
	Mon,  6 Apr 2020 19:10:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8564CF80143; Mon,  6 Apr 2020 19:10:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A95FF80140
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 19:10:43 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 48E93A003F;
 Mon,  6 Apr 2020 19:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 48E93A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1586193043; bh=gvH+xcvSt8AARZhTJeqBevccPiRpTTR/ev0xqU7rmo4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BDMVIdV04k1KgVmKJxg8qtXA3zvfRFjzwEL8ivkbqi1aJ2MZmEErScyWqSdD2OYCn
 2jRnkZITNYTqR4kS76f5HVUfrtIqBCRNK1xlB/2h9r90shn2EM0rqZ7/KpTH3ypVly
 wPwNv5gInpuy2wob+KU8CyprpAuWRNOWRmYxVO4Y=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  6 Apr 2020 19:10:40 +0200 (CEST)
Subject: Re: [PATCH 4/5] chtrt5645: Remove bogus JackHWMute settings
To: Hans de Goede <hdegoede@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20200405183454.34515-1-hdegoede@redhat.com>
 <20200405183454.34515-4-hdegoede@redhat.com>
 <d06f3894-6cd7-fd4e-2261-94505fc0db4a@linux.intel.com>
 <c19aadd5-80b4-91de-4e0a-344e21125883@redhat.com>
 <3198cbfb-f498-2c82-88cd-c8b7d0b53574@linux.intel.com>
 <2ba90327-6a23-7c5f-5b4e-f01e51b59ace@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f6832844-8fe1-9a9b-57a5-f13b072b79a1@perex.cz>
Date: Mon, 6 Apr 2020 19:10:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <2ba90327-6a23-7c5f-5b4e-f01e51b59ace@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

Dne 06. 04. 20 v 18:58 Hans de Goede napsal(a):
> Hi,
> 
> On 4/6/20 5:17 PM, Pierre-Louis Bossart wrote:
>>
>>>> So overall it seems rather unlikely that we can support dmic + headset mic in parallel?
>>>
>>> Right that is what the ConflictingDevices sections are for.
>>>
>>> Removing the JackHWMute does not allow using both add the same time,
>>> it merely allows overriding which of the 2 to use (if the headset mic
>>> is detected by the jack, the JackControl setting is kept).
>>>
>>> So lets say the internal mic is crappy, but the user prefers to
>>> have their ears free, then they can use a headset around there neck,
>>> using just the headset-mic and select speakers as output even though
>>> a jack is inserted.
>>>
>>> Note pulseaudio will still automatically switch to the headphones /
>>> headsetmic when plugged in, this merely allows overriding that
>>> choice manually.
>>>
>>> Jacks which actually physically disable (or re-route) signals are
>>> quite rare now a days so having a JackHWMute in the UCM conf is
>>> often wrong. After this patch only a few cases are left:
>>>
>>> [hans@x1 alsa-ucm-conf]$ ack -l JackHWMute ucm2
>>> ucm2/HDA-Intel/HiFi-dual.conf
>>> ucm2/chtrt5650/HiFi.conf
>>> ucm2/hda-dsp/HiFi.conf
>>> ucm2/codecs/es8316/HeadPhones.conf
>>> ucm2/sof-bdw-rt5677/HiFi.conf
>>> ucm2/broxton-rt298/HiFi.conf
>>> ucm2/skylake-rt286/HiFi.conf
>>>
>>> The es8316 case is actually correct, the es8316 has only 1
>>> output (which is amplified for e.g. a speaker) and at
>>> least the reference design suggests routing the speaker signal
>>> through the jack and using a jack which will interrupt the
>>> signal when headphones are plugged in.
>>>
>>> Note most actual designs implement this with an analog
>>> switch and a GPIO to control that switch, since 3.5 mm
>>> jacks which actually can disconnect a signal are rare
>>> (if they exist at all, but I guess they do). For the
>>> designs using the GPIO controlled analog switch, the
>>> JackHWMute technically also is wrong, but I put it
>>> there (IIRC it was me) because it matches the reference
>>> design.
>>>
>>> I'm not familiar enough with any of the others to say anything
>>> about them, but most of them are for HDA setups, where this
>>> is somewhat more normal I guess.
>>
>> If I follow the logic, I guess we should also remove the JackHWMute for sof-bdw-rt5677, hda-dsp and HDA-Intel. I can't think of a hardware limitation preventing the headset mic from being used while the speakers are used for playback. Likewise the rt5650 is a cheaper version of rt5645 so the same applies.
> 
> Right AFAIK:
> 
> JackHWMute "foo"
> 
> Means that the JackControl listed in the same section does
> something at the hardware level which makes it impossible
> for the "foo" input / output to function until the jack
> is removed. Typically this would be something like actually
> disconnecting the speakers at the electrical level.
> 
> So almost always using it is wrong.

I agree. The description is really straight (use-case.h):

"Note that JackHWMute should be used only when the hardware enforces the 
automatic muting."

Pierre, it seems that hds-dsp uses JackHWMute for Speaker and Headphones, I 
think that it should be removed. Otherwise PA thinks that those devices cannot 
be used simultaneously when user wants to..

					Jaroslav


> 
> Regards,
> 
> Hans
> 
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
