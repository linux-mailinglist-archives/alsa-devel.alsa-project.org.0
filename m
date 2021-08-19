Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 543103F1C61
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Aug 2021 17:13:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE44D1687;
	Thu, 19 Aug 2021 17:12:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE44D1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629385979;
	bh=7gNJge1B1O8IP1CqH2yhR7h1b+6mqwlq4VMnM7YuSoQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sReHsmflL3r46CrbmGg/LW82ICr6B8NzhmCCtERq9VrWLjoX3i4EzS5E3HCbOyCs8
	 H0jbv6TR1ZUdHkGZaDQ9XtMyI8ZmdFdJxeO+uirumjYxikiPNkyg85auwnFgLIEX5W
	 rO5QPOXgxgFhPR5lmYn0Wx6+axOsH2kcqKdRCog0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 014E4F80272;
	Thu, 19 Aug 2021 17:11:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EA43F8026D; Thu, 19 Aug 2021 17:11:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2500F800F8
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 17:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2500F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="hGNY3mAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629385889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BZNUNlu8wVsisChveZvNcZgPBdKsWQpxQI2cw/eBXTE=;
 b=hGNY3mAvV7sKDGe6Bu1VyRUzg0kOJo67/9YDbGK9wc63xRi/exbAxm5V9ra31njmiYqgv2
 GSdqDBdpFUhkynFY4vWnPhCjCV0ZcmnJh+7qX6dFsvcsJRSeQJEPvkgd9o4AOGVQIN5pmk
 bFDLSpePzPFplXzxKo/mgSxTMb3Ltkk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-6Hvg29oZOLq-2QHDd40pjA-1; Thu, 19 Aug 2021 11:11:28 -0400
X-MC-Unique: 6Hvg29oZOLq-2QHDd40pjA-1
Received: by mail-ed1-f72.google.com with SMTP id
 p2-20020a50c9420000b02903a12bbba1ebso2964651edh.6
 for <alsa-devel@alsa-project.org>; Thu, 19 Aug 2021 08:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BZNUNlu8wVsisChveZvNcZgPBdKsWQpxQI2cw/eBXTE=;
 b=pBtSEKjsuS2N9+6xT2Y+aV9W5HmQAR1iz7jY3oxUOi3xi3anZqeqEJaP8LEftuo8Ic
 EmUiiUv4a1HlnjXWwS5fM5MIb8MRTrQQB0F/VJOiGh0i0GqWem55nSgKqk6Xp1G2hjOQ
 XfUyHA+6GuvdgJJyf7j+7GpMF8fL3P9TYU6Hc4905+PY8BOmD4WGosRNwdKa7GSA2zmY
 OFCJqf3CIdc+V93oCxgNQhViDjPI+azaOp43hvVh4FZLuoQfjRXKcwh3WgPdlAFE5uKb
 DQGROPrVAImY5v3SbF1+FUMNas65xA8ffcGFW/DIzDzpQ4Ak8kKRJ6brQdjiIUumER0Q
 49wQ==
X-Gm-Message-State: AOAM532KeS7vC6NGFwFzO3dsKeDT8TQ4XOUtlRUsejX0RM4DumLYKyxe
 qbwAAOfokLaFUYJf7TBzLBvM1cGGiY4fGXSLargtN3vbJswfPs83EdpGuDR/LZoUwOhizWhCv9J
 QSmsiT+033DTZhmoWWbQxBwLgN13D8e5oN17q2SmFSmeefwucp/XmGX9q3JJr12KLN0ZBFPcXUX
 s=
X-Received: by 2002:a17:906:405:: with SMTP id
 d5mr16104529eja.189.1629385886937; 
 Thu, 19 Aug 2021 08:11:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylKeG7fzvO0RwBuLilXK7QofYfUiC/JIogh/5IsESQT8nKptUQqjEtpXbrBoKnNQ9NTqbjOg==
X-Received: by 2002:a17:906:405:: with SMTP id
 d5mr16104500eja.189.1629385886661; 
 Thu, 19 Aug 2021 08:11:26 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id g16sm1410587ejw.74.2021.08.19.08.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 08:11:26 -0700 (PDT)
Subject: Re: [5.14 regression] "ASoC: intel: atom: Fix reference to PCM buffer
 address" breaks Intel SST audio
To: Takashi Iwai <tiwai@suse.de>
References: <2048c6aa-2187-46bd-6772-36a4fb3c5aeb@redhat.com>
 <e9ac9c13-75c6-89a4-39d0-8c82dda2e560@redhat.com>
 <s5ha6lda3lr.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <aa8f9df0-96a4-4050-454c-dda7104bce3c@redhat.com>
Date: Thu, 19 Aug 2021 17:11:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5ha6lda3lr.wl-tiwai@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 8/19/21 4:52 PM, Takashi Iwai wrote:
> On Thu, 19 Aug 2021 16:45:19 +0200,
> Hans de Goede wrote:
>>
>> Hi,
>>
>> On 8/19/21 4:42 PM, Hans de Goede wrote:
>>> Hi All,
>>>
>>> After rebasing a set of bytcr_rt5640 patches, on top of asoc/for-next
>>> I noticed that playing back audio would only generate random-noise / buzzing
>>> (I did not try recording any audio). 
>>>
>>> After poking at this for a while I've found the culprit:
>>>
>>> 2e6b836312a4 ("ASoC: intel: atom: Fix reference to PCM buffer address")
>>>
>>> If I revert that single commit then audio on Intel Bay Trail and
>>> Cherry Trail devices works fine again with 5.14.
>>>
>>> This is with a Fedora 34 userspace using pipewire as audiodaemon
>>>
>>> I'm not sure what is going on here, but since the old code
>>> changed by the broken commit has worked fine for ages and
>>> given where we are in the devel-cycle I think it might be best
>>> to just revert 2e6b836312a4 again.
>>
>> p.s. to be clear I noticed this after rebasing on top of asoc/for-next
>> but the troublesome commit is actually in Linus tree now and thus
>> will hit end users once 5.14 is released.
>>
>> (the troublesome commit landed in 5.14-rc6 and my previous tests
>> were with 5.14-rc5)
> 
> Ah, the commit might be problematic on 5.14 where dma_addr isn't set
> yet for the CONTINUOUS buffer type (which was fixed in sound.git
> for-next branch).
> 
> Could you try the patch below?

I can confirm that this fixes things.

Note though that I'm running 5.14-rc6 with asoc/for-next merged in,
so this suggest that the "dma_addr isn't set yet for the CONTINUOUS
buffer type" problem also exists in asoc/for-next which means that
asoc/for-next as a standalone tree also has broken Intel SST audio
atm (I did not verify this).

Either way I guess that even with the dma_addr being set doing
virt_to_phys(substream->runtime->dma_area) will still be fine,
so this probably is the right thing to do for now regardless.

Regards,

Hans








> 
> 
> thanks,
> 
> Takashi
> 
> ---
> --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
> @@ -127,7 +127,7 @@ static void sst_fill_alloc_params(struct snd_pcm_substream *substream,
>  	snd_pcm_uframes_t period_size;
>  	ssize_t periodbytes;
>  	ssize_t buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
> -	u32 buffer_addr = substream->runtime->dma_addr;
> +	u32 buffer_addr = virt_to_phys(substream->runtime->dma_area);
>  
>  	channels = substream->runtime->channels;
>  	period_size = substream->runtime->period_size;
> 

