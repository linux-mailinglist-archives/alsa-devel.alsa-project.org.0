Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5135F1D2
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 13:01:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E71BB16FD;
	Wed, 14 Apr 2021 13:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E71BB16FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618398065;
	bh=ItdR8+NjYRVhc8ZGsxBUuVWGVTiwFoS7z46Ji4ZYSQY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d5RSPwuuVWUtoCvNLSF7VO9QkmDh3ME8ZKBOS4hl9mLDDPsumqBCPQ/NcdOMUCKoc
	 oh/u6q2RSdk2lEKqB4E3DO9VPa9pAyPg4AHj1zvGqOIEDcuJQDnKx1uUv0yiTY7SOl
	 27TuRdJlkutL4WVM5Da6P01BD/YtowOJOuvxAuf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EDCFF80278;
	Wed, 14 Apr 2021 12:59:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DE26F80277; Wed, 14 Apr 2021 12:59:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4E70F80128
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 12:59:48 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 82BA2A0040;
 Wed, 14 Apr 2021 12:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 82BA2A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618397988; bh=NODKSom++VePUeZRN/7IY62d+yXUj4JCsQlROnySTsc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PkF2Z7aHqQGXTPwuQBrCv5hQLzfrLj0riM9pPU/XrVweHg/SpTIAaUTzTJGz0OyJJ
 fgqlPAFiMP2kZ5hJRrmnm1hBuGxXD+lNFRiRNgPVGmxBsiJWJI0+n86RPKwmzXnOVZ
 7jRZHqdsIvpP+Puf8Li6IN+T5G2JDZEUIyvYy3hE=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 14 Apr 2021 12:59:44 +0200 (CEST)
Subject: Re: [PATCH] ALSA: control_led - fix the stack usage (control element
 ops)
To: Takashi Iwai <tiwai@suse.de>
References: <20210414093031.1934261-1-perex@perex.cz>
 <s5h35vtw681.wl-tiwai@suse.de>
 <7624e19b-d618-0dcd-8798-989a1375614f@perex.cz>
 <s5hy2dluoie.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <2acd2ad6-ebd4-2ef0-0b19-98fe55f11fe8@perex.cz>
Date: Wed, 14 Apr 2021 12:59:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <s5hy2dluoie.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Nathan Chancellor <nathan@kernel.org>,
 ALSA development <alsa-devel@alsa-project.org>
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

Dne 14. 04. 21 v 12:52 Takashi Iwai napsal(a):
> On Wed, 14 Apr 2021 12:09:07 +0200,
> Jaroslav Kysela wrote:
>>
>> Dne 14. 04. 21 v 11:44 Takashi Iwai napsal(a):
>>> On Wed, 14 Apr 2021 11:30:31 +0200,
>>> Jaroslav Kysela wrote:
>>>>
>>>> It's a bad idea to allocate big structures on the stack. Allocate
>>>> the required structures on demand and cache them in the led
>>>> structure.
>>>>
>>>> Fixes: 22d8de62f11b ("ALSA: control - add generic LED trigger module as the new control layer")
>>>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>>>> Cc: Nathan Chancellor <nathan@kernel.org>
>>>> Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
>>>
>>> Thanks for the patch.
>>>
>>> But, wouldn't it be simpler if we just add snd_ctl_elem_info and
>>> _value in snd_ctl_led object itself?
>>>
>>> -- 8< --
>>> --- a/sound/core/control_led.c
>>> +++ b/sound/core/control_led.c
>>> @@ -38,6 +38,8 @@ struct snd_ctl_led {
>>>  	enum led_audio trigger_type;
>>>  	enum snd_ctl_led_mode mode;
>>>  	struct snd_ctl_led_card *cards[SNDRV_CARDS];
>>> +	struct snd_ctl_elem_info elem_info;
>>> +	struct snd_ctl_elem_value elem_value;
>>>  };
>>>  
>>>  struct snd_ctl_led_ctl {
>>>
>>> -- 8< --
>>>
>>> Then we need no extra kmalloc.  I guess snd_ctl_led_get() shall be
>>> called almost always, so we won't save much even if we allocate
>>> dynamically.
>>
>> The idea was to allocate this structure purely on demand. We can have the case
>> where some LED group is inactive (no speaker LED for example) or the LED
>> functionality is not used at all even if the module is loaded. And it's true
>> that those structures requires some more bytes.
>>
>> Another option is just to make the structures in snd_ctl_led_get() static -
>> two line patch. The calls are protected with snd_ctl_led_mutex . But it may be
>> problematic if we do a finer mutex locking per LED group in the future.
> 
> OK, I see your points.  OTOH, I prefer simplicity at this moment over
> yet another kmalloc.  If the static variables are enough, that sounds
> like the best option.  Not only that it's way simpler (only two line
> changes), it's even more byte-saving as it allocates only once
> globally, not per snd_ctl_led object.  Having a comment should be good
> enough for avoiding the pitfall in future changes (if any).

Ok, new patch is out.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
