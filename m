Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BA15F1C65
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Oct 2022 15:37:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 611F11AC6;
	Sat,  1 Oct 2022 15:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 611F11AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664631434;
	bh=MwIO9r6rg5ajSmXM+LVft1mMV6EJS1EA26V1qJ1HQvI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q7u+BfvPUkUoTqKcOUJyfOz0u+MOGg0EBmtPKHo09vQNEOZoHentirQYlSgEqNRcU
	 z6jhLF61xMTRm98RH3kW8MAw889u9k4xGe7AwAs5VJl59dFJlXBC2It/RCFS5RwchV
	 v8u0z+SLWrcFIY6jioqfsJfnNC9rbByR7ZGCOwOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D36CCF8047C;
	Sat,  1 Oct 2022 15:36:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85C17F80171; Sat,  1 Oct 2022 15:36:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9BC8F800A7
 for <alsa-devel@alsa-project.org>; Sat,  1 Oct 2022 15:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9BC8F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="a3dxsTTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664631366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=InGcGES9RM1j0v3IUkn075jwMMvBPf6JGnYPIT+bkAM=;
 b=a3dxsTTXW/eqSOtYQCYMVhFItNtYHh8XwH2KvEMghc9DtrTqosRPOZCr0Cy+7z8lSE5eDJ
 +HynMix0FTNcm3JK/Q7m1M4VxU4jAWD0Mur1ph6oqLksGnkGTWI+o+Pw31lxGlWP3+z9VK
 9znjNd5vkJHc5a5u1V0tcTDd5DLNzRk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-cFNggx6mMuCe4SsDet4tNA-1; Sat, 01 Oct 2022 09:36:04 -0400
X-MC-Unique: cFNggx6mMuCe4SsDet4tNA-1
Received: by mail-ej1-f69.google.com with SMTP id
 sg44-20020a170907a42c00b007822e506a4fso2534472ejc.16
 for <alsa-devel@alsa-project.org>; Sat, 01 Oct 2022 06:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=InGcGES9RM1j0v3IUkn075jwMMvBPf6JGnYPIT+bkAM=;
 b=6lfPQ0uo1GQUdqkskaXUoC3f5PnMUHXaMjbE/iLWC4UwSqgljQicTSUDgbNJX0Ye/r
 airsmURpKfltJaNzaH8OmPTtqiUgYDOnFAiVfBcRWYqxB7o/NXN3CMfTpFOgj0WDApW2
 Q0cGjxAdU+7qdOV9YnJInuFJGogqYBySGBpep/EkzaMGvnNaCQYRwttd/spXME9/ey0r
 vD2k01ThVYQCbGmcZMMy6U9P9glmIXemniAqUML17mgNAuuKYrCfPMgcjLfr5YvWLwpV
 ABfu8NKiNdhDgsM2Ct21nEFwQlaqllAkE9srC5uiPrE3rgm0favmQI2SiD1kQxxaF6Yh
 DJSQ==
X-Gm-Message-State: ACrzQf3uxAhLpENNZlScccw6DE26XPK1DqKUy1XThe7aSLPJ+48Usxxi
 NB1+YnvvucRrSnb4TEjBnGpPoiAVQXta5nYuAB0Sh49lF1zflCrvafM7Myp7fCwSuwodLI2BpTf
 7/LhxM1TWDu6AB0UukBgOAA8=
X-Received: by 2002:a17:906:11d:b0:712:abf:3210 with SMTP id
 29-20020a170906011d00b007120abf3210mr9797517eje.292.1664631363223; 
 Sat, 01 Oct 2022 06:36:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7g6tl69y+qZLUEwfX4cyybB5/VOaR6nyVikOD/3WaP/Fr4EZ3XKDDnUtYcINE7BsTMR4Hkag==
X-Received: by 2002:a17:906:11d:b0:712:abf:3210 with SMTP id
 29-20020a170906011d00b007120abf3210mr9797505eje.292.1664631362946; 
 Sat, 01 Oct 2022 06:36:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906219200b00781e7d364ebsm2744091eju.144.2022.10.01.06.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Oct 2022 06:36:02 -0700 (PDT)
Message-ID: <e4e07b52-9751-a62c-c384-0abd36ea35f0@redhat.com>
Date: Sat, 1 Oct 2022 15:36:01 +0200
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
 <c24d34a9-e609-d44d-8e0f-c2e5928b95f4@redhat.com>
 <87h70q8qq8.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87h70q8qq8.wl-tiwai@suse.de>
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

On 9/29/22 11:38, Takashi Iwai wrote:
> On Thu, 29 Sep 2022 11:05:47 +0200,
> Hans de Goede wrote:
>>
>> Hi,
>>
>> On 9/29/22 08:10, Takashi Iwai wrote:
>>> On Wed, 28 Sep 2022 18:33:55 +0200,
>>> Hans de Goede wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 9/11/22 09:05, Takashi Iwai wrote:
>>>>> On Sun, 11 Sep 2022 08:15:59 +0200,
>>>>> Takashi Iwai wrote:
>>>>>>
>>>>>> On Sat, 10 Sep 2022 19:52:36 +0200,
>>>>>> Hans de Goede wrote:
>>>>>>>
>>>>>>> Hi All,
>>>>>>>
>>>>>>> To test some kernel work (backlight refactor) which I have been doing
>>>>>>> I have booted Debian Testing with a 6.0 kernel on a Sony Vaio VPX11S1E
>>>>>>> (which is ancient).
>>>>>>>
>>>>>>> I noticed that when tab-completing something in a terminal the
>>>>>>> terminal bell sound would keep repeating and playing another longer
>>>>>>> sound sample gets stuck with the first couple of seconds of that
>>>>>>> sample looping.
>>>>>>>
>>>>>>> This is under GNOME3 with pulseaudio as sound server.
>>>>>>>
>>>>>>> I accidentally found an interesting workaround if I run:
>>>>>>>
>>>>>>> aplay -Dplughw:CARD=MID,DEV=0 /usr/share/sounds/alsa/Front_Left.wav
>>>>>>>
>>>>>>> once, then that works properly and after that the problem is gone...
>>>>>>>
>>>>>>> Note that this laptop does have only 1 speaker AFAICT.
>>>>>>>
>>>>>>> alsa-info output below.
>>>>>>>
>>>>>>> I would be happy to test any patches / module-options which might
>>>>>>> fix this.
>>>>>>
>>>>>> Could you check the very latest Linus tree (6.0-rc5)?
>>>>>> There has been a regression fix for HD-audio, and possibly this might
>>>>>> be your case.
>>>>>
>>>>> And if this doesn't change the behavior, try snoop=0 option for
>>>>> snd-hda-intel module.
>>>>
>>>> Thanks, I've just tried with 6.0-rc6 both with and without snoop=0
>>>> and neither helps I'm afraid.
>>>
>>> Then one another thing could be position_fix option of snd-hda-intel.
>>> Otherwise we need bisection -- supposing it worked well in the past.
>>
>> Thanks, position_fix=1 does the trick (I did not try any of
>> the other possible values).
>>
>> I see there is a snd_pci_quirk position_fix_list, so I guess
>> I should prepare a patch adding a quirk for this?
> 
> I guess this is rather controller issue, so I'd patch for Poulsbo like
> below.  Let me know if it works, then I'll cook a proper patch.
> 
>> Or are some other position_fix values preferred and should
>> I try those first?
> 
> LPIB should suffice, so no further test about the option needed.
> 
> 
> thanks,
> 
> Takashi
> 
> -- 8< --
> --- a/sound/pci/hda/hda_intel.c
> +++ b/sound/pci/hda/hda_intel.c
> @@ -2547,7 +2547,8 @@ static const struct pci_device_id azx_ids[] = {
>  	  .driver_data = AZX_DRIVER_SCH | AZX_DCAPS_INTEL_PCH_NOPM },
>  	/* Poulsbo */
>  	{ PCI_DEVICE(0x8086, 0x811b),
> -	  .driver_data = AZX_DRIVER_SCH | AZX_DCAPS_INTEL_PCH_BASE },
> +	  .driver_data = AZX_DRIVER_SCH | AZX_DCAPS_INTEL_PCH_BASE |
> +	  AZX_DCAPS_POSFIX_LPIB },
>  	/* Oaktrail */
>  	{ PCI_DEVICE(0x8086, 0x080a),
>  	  .driver_data = AZX_DRIVER_SCH | AZX_DCAPS_INTEL_PCH_BASE },
> 


I can confirm that this does the trick, thanks:

Reported-and-tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

