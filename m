Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4645C5EF147
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 11:06:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92151850;
	Thu, 29 Sep 2022 11:06:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92151850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664442414;
	bh=dcRCk0NkDEfg1WQrN1eSJ+cUeuyiDmU3orUuDF2SNLc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HPUJA19ptWKIVr5rbJDILXYQkW/BqAz//wPHy+4zP0uN5BDz2uzQvJyflLsWEHloL
	 /u62VnX2h4rXekT+BMfvTSJQabTM+oZewSRj7kjm09juAKog4VJo3MBDBSEzJ1uGKf
	 8ZGoGz2T6TQMbEDHRmBClx8e9eMi4NIu1dNnrblA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0F00F80109;
	Thu, 29 Sep 2022 11:05:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA59AF800AA; Thu, 29 Sep 2022 11:05:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8440BF800AA
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 11:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8440BF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="W7QnuqNh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664442351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A0IKwFWx7/IDhJLOpmGOHexrm90zAeP+uxwFXVEpNxs=;
 b=W7QnuqNhuUPeIIc2azyBNUh2u5TS7FmynVGf60VUWu9PWJvigKxjkSooJBPhZQ3dg3UiOx
 84rbzU3Qxx1lL0fLbS8GAjU+kwlFDzv/T7RKhK8DzCyJ/sZDA7+QlSRXEN/GB+0OSD5XHE
 kj07DKWXN8cnkfeiApWUVNYTafDaXqg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-275-0ujEs5N_NHO9WL4KUjVIWQ-1; Thu, 29 Sep 2022 05:05:50 -0400
X-MC-Unique: 0ujEs5N_NHO9WL4KUjVIWQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 m13-20020a056402510d00b004519332f0b1so798855edd.7
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 02:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=A0IKwFWx7/IDhJLOpmGOHexrm90zAeP+uxwFXVEpNxs=;
 b=u5qSQljzLnrXSEq57s8RtaVvDXl1920/aLUxcxL7QPxkjnuc8MKqf+LFb1SZvxwx16
 nmYugxhcsSZUise1x3+ZsVnVLDqKdbjVrsTd2prEye8ler97JThIYA+3tdrqI5YzfDOs
 gK4dGPDzAg49SRmq2kUj7QiYBz8zGysNuYKK9M2bAQ7TVyK4Ubk4g9lPq1NYdv7XEvgc
 66otQ6Erp94/5tldnV0oUc2wR0nB9YhZNwP+N0pEI++89dYjvHavKmmNm1Kad3t1g66u
 nt1iq5akDmQBGkMMLGD7vCkd+jHPCkschpEHWVYDczAvhq99bCn1fSr2Ppxh5wn59Xnx
 rDnQ==
X-Gm-Message-State: ACrzQf2tcHo+I7g1jxUcqY7rNLZTzXJyoTYoUYh6jXRFz1TRBTqO16b1
 gJCbCuSHfHHX3t9K1Nwyz63ow02z6HcoSv3e3LIvVJ3sBv+g8IbfzkRygM3rY/6eHFr/dZwSuXG
 rY0lzkbUGlC8l0RM4xj5nrbI=
X-Received: by 2002:a17:906:fe44:b0:77c:e313:a8e8 with SMTP id
 wz4-20020a170906fe4400b0077ce313a8e8mr1870644ejb.700.1664442348763; 
 Thu, 29 Sep 2022 02:05:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4JFt8xALBRjmvOrK61+Zn/kPh9gW9xrySfeBle8hlvqsPdPwdgLEbheTU1213u1mbsfKK6wg==
X-Received: by 2002:a17:906:fe44:b0:77c:e313:a8e8 with SMTP id
 wz4-20020a170906fe4400b0077ce313a8e8mr1870633ejb.700.1664442348565; 
 Thu, 29 Sep 2022 02:05:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a170906161000b007821241aaecsm3612192ejd.216.2022.09.29.02.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 02:05:47 -0700 (PDT)
Message-ID: <c24d34a9-e609-d44d-8e0f-c2e5928b95f4@redhat.com>
Date: Thu, 29 Sep 2022 11:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Sound broken (first couple of seconds play looping) on Sony Vaio
 VPX11S1E (HDA, ALC262)
To: Takashi Iwai <tiwai@suse.de>
References: <3e8697e1-87c6-7a7b-d2e8-b21f1d2f181b@redhat.com>
 <87y1uqbfmo.wl-tiwai@suse.de> <87tu5ebdc8.wl-tiwai@suse.de>
 <61bd7097-afac-5a2d-46a2-aada444a890c@redhat.com>
 <87y1u290cv.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87y1u290cv.wl-tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Hi,

On 9/29/22 08:10, Takashi Iwai wrote:
> On Wed, 28 Sep 2022 18:33:55 +0200,
> Hans de Goede wrote:
>>
>> Hi,
>>
>> On 9/11/22 09:05, Takashi Iwai wrote:
>>> On Sun, 11 Sep 2022 08:15:59 +0200,
>>> Takashi Iwai wrote:
>>>>
>>>> On Sat, 10 Sep 2022 19:52:36 +0200,
>>>> Hans de Goede wrote:
>>>>>
>>>>> Hi All,
>>>>>
>>>>> To test some kernel work (backlight refactor) which I have been doing
>>>>> I have booted Debian Testing with a 6.0 kernel on a Sony Vaio VPX11S1E
>>>>> (which is ancient).
>>>>>
>>>>> I noticed that when tab-completing something in a terminal the
>>>>> terminal bell sound would keep repeating and playing another longer
>>>>> sound sample gets stuck with the first couple of seconds of that
>>>>> sample looping.
>>>>>
>>>>> This is under GNOME3 with pulseaudio as sound server.
>>>>>
>>>>> I accidentally found an interesting workaround if I run:
>>>>>
>>>>> aplay -Dplughw:CARD=MID,DEV=0 /usr/share/sounds/alsa/Front_Left.wav
>>>>>
>>>>> once, then that works properly and after that the problem is gone...
>>>>>
>>>>> Note that this laptop does have only 1 speaker AFAICT.
>>>>>
>>>>> alsa-info output below.
>>>>>
>>>>> I would be happy to test any patches / module-options which might
>>>>> fix this.
>>>>
>>>> Could you check the very latest Linus tree (6.0-rc5)?
>>>> There has been a regression fix for HD-audio, and possibly this might
>>>> be your case.
>>>
>>> And if this doesn't change the behavior, try snoop=0 option for
>>> snd-hda-intel module.
>>
>> Thanks, I've just tried with 6.0-rc6 both with and without snoop=0
>> and neither helps I'm afraid.
> 
> Then one another thing could be position_fix option of snd-hda-intel.
> Otherwise we need bisection -- supposing it worked well in the past.

Thanks, position_fix=1 does the trick (I did not try any of
the other possible values).

I see there is a snd_pci_quirk position_fix_list, so I guess
I should prepare a patch adding a quirk for this?

Or are some other position_fix values preferred and should
I try those first?

> But as it's a so old laptop, maybe not worth...

Agreed, but it looks like a bisect won't be necessary :)

Regards,

Hans


