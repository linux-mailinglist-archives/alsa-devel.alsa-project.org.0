Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E09F9425184
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 12:52:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CA52165E;
	Thu,  7 Oct 2021 12:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CA52165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633603961;
	bh=V9YsRqPf6M+HwooSeELhKH0OgVqlU2gJN2LwWnw6RZk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uyU+Rae97xvl2sRgyDkEQU8SvGh6z2NxPEpd5m7p/PKyoHRd/+2QuoEUFCp1CygMA
	 QCfJwvHfK5SCB+HNqnlIIx8aHJN4y/dS081LiNFTsW3Ks+2t8kdsyLtyZr+wrnMW6o
	 Jt3oR1MwSSWaGUCIffGozS9TOY9/S7u6DQeI6urE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A03CF8028B;
	Thu,  7 Oct 2021 12:51:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA2C3F8027D; Thu,  7 Oct 2021 12:51:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 843E1F800F0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 12:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 843E1F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="aF93Ke3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633603873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xZcHK2zPMTtvz38dMNG6NjrsYTH0Moo1lHPDJw+AVuU=;
 b=aF93Ke3c9Bj0RAgMC/171/gDoBoPVQSj+NJpptw+49xYoOMNAiMgCgPT0Izy9lCcBPiIKo
 2IqPLp8FHrAYtRs2/7ZjyIaTyeHUJvZTYI5BwAbT+x59OvN/EBCra6EyNx4vCJiTzAXJeV
 BP3rXdBrBn+IsPxmSikcG90WukTwmgw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-WmwASXjiMOqh4AsIOhVlJQ-1; Thu, 07 Oct 2021 06:51:07 -0400
X-MC-Unique: WmwASXjiMOqh4AsIOhVlJQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 c7-20020a05640227c700b003d27f41f1d4so5460384ede.16
 for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021 03:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xZcHK2zPMTtvz38dMNG6NjrsYTH0Moo1lHPDJw+AVuU=;
 b=mCBXWcjTHlZQ5Xlcxe/e5QOz+EQrCj7mO7VP4M4V3UNFnWIk6Uz1tt0CX4ub53rGLB
 /nU4GgDATczTWf8tzKpfuyn+0XNdC5Rx8Xv46g6djm8hSAjA3k6sb6WgLqrSeWIuxBJK
 8twvTle+q+0rKgUbDshmjwL81Oc539jlX5V3woZ0Q0myvzz9Tj49mOOuKlrr9Qt66xuR
 xa+WTdSUly446GwL4CMySNo2k13URf3c+iK5+eTRS77ZYFZ6iDA8tXfp+Qn6gqF2gb7a
 NDVV26RSS93gkK1yJB92a8eO59HvPO2zgMZGvifn4dKKcEkvGZLm9hdO4hEvHFBo6vUu
 7ojQ==
X-Gm-Message-State: AOAM530JOQ/iZEmhvGVzRpiyXHJ5sjHnwYTbo553vurLxkIvD9fHiaT2
 m1mQ6H4p4qYJ8FoL3Z7F0CVyVUYCmlWCUApUoZCb9LmW6L1R568APNBsPnMz6AcCD2hi9Uo9Fcf
 WiJnE6xI2+XiTcDMSre+Y0/zVtbDai54c0jdutz+MPRHCxsNUZ0X6icAJuEs3Aersdz/O4G/LQq
 o=
X-Received: by 2002:a50:d88a:: with SMTP id p10mr5238767edj.274.1633603866052; 
 Thu, 07 Oct 2021 03:51:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2mPXhyfAYYAqqFdDdlSI7qpVDhmrmxyRAb1YLLpoOLYO9xqj5xSt/8nTepDVf2KedfbFGPQ==
X-Received: by 2002:a50:d88a:: with SMTP id p10mr5238719edj.274.1633603865770; 
 Thu, 07 Oct 2021 03:51:05 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id nd36sm206271ejc.17.2021.10.07.03.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 03:51:04 -0700 (PDT)
Subject: Re: DAPM PIN switches do not update in alsamixer when changed through
 UCM profile
To: Mark Brown <broonie@kernel.org>
References: <b8cf9bb0-bad1-26a0-0806-0a7c66b228d0@redhat.com>
 <s5hv92ego8y.wl-tiwai@suse.de>
 <8e0a6491-bc87-0f9a-099f-3baff1fc0e0d@redhat.com>
 <YVr6Xkm0tm0IghON@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <99e34b9e-f3ac-217f-80f2-81f54fc625ab@redhat.com>
Date: Thu, 7 Oct 2021 12:51:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVr6Xkm0tm0IghON@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>
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

On 10/4/21 2:58 PM, Mark Brown wrote:
> On Sun, Oct 03, 2021 at 06:32:13PM +0200, Hans de Goede wrote:
>> On 10/3/21 4:46 PM, Takashi Iwai wrote:
> 
>> But it does not work for the "Headphone" and "Line Out" switches,
>> these are actually hooked up to jack-detect, so I guess that the
>> jack-detection is already flipping them and then when the UCM
>> profile changes them it is a no-op causing the UCM setting of
>> the control to not cause an event because it is not a change.
> 
> It's not meaningful or sensible to have a pin switch and jack detection
> connected to the same pin, any machine driver doing that is buggy.  It's
> unclear how the two would be supposed to interact and there's nothing
> that makes an effort to keep them in sync.  Either jack detection should
> be disconnected from DAPM and userspace responsible for managing the
> paths via the pin switches or the pin switches should be removed.

Right, so the way this code evolved is that in the beginning there
was no jack-detection support and then there was a pins-witch for
each of the "Speaker" and "Headphone" outputs.

Later jack-detect was added later to the "Headphone" pin.

As you say this is not meaningful / a machine driver bug but 
unfortunately we cannot change this, the UCM profile for e.g.
the bytcr-rt5640 card contains:

                        EnableSequence [
                                cset "name='Headphone Switch' on"
                        ]

                        DisableSequence [
                                cset "name='Headphone Switch' off"
                        ]

And:

        Value {
                JackControl "Headphone Jack"
	}


And AFAIK there is no way to get the soc-jack code to still make userspace
see "Headphone Jack" events without adding a "Headphone" snd_soc_jack_pin.
Likewise UCM will error out if the 'Headphone Switch' control goes away.
So even though it is confusing for userspace at the same time we need to
keep both the SOC_DAPM_PIN_SWITCH("Headphone") kcontrol and the
"Headphone" snd_soc_jack_pin since userspace depends on them now.

This does explain why the 'Headphone Switch' kcontrol is not getting
change events when the output is changed based on a jack-detection event.

When the headphone is plugged in the Headphone pin gets enabled and
a "Headphone Jack" event is sent then e.g. pulseaudio will switch
the UCM output profile to the Headhpone output, doing:

                        EnableSequence [
                                cset "name='Headphone Switch' on"
                        ]

But this is a no-up since the soc-jack code has already enabled the pin.

With Takashi's "ASoC: DAPM: Fix missing kctl change notifications" we
will get a kcontrol change event for the 'Headphone Switch' however
when manually (1) switching between speakers/headphones.

TL;DR: you're right the missing kcontrol change events are caused
by the SOC_DAPM_PIN_SWITCH and the snd_soc_jack_pin both pointing to
the same pin. But we cannot fix this because userspace UCM profiles
depend on the pin name not changing in either case.

This is not a problem, the missing change events do not cause any actual
issues, its just something which I noticed when debugging/monitoring
UCM profile output switching with alsamixer. So IMHO the missing events
is just something which we will have to live with.

One leason to learn from this is to make sure to not have identical
named SOC_DAPM_PIN_SWITCH-es and snd_soc_jack_pin-s in new machine
drivers.

Regards,

Hans


1) When either a jack is inserted but the user wants the speaker output
anyways or on a board where jack-detect is not supported



