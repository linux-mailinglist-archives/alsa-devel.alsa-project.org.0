Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC31B322F5A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 18:10:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44F599F6;
	Tue, 23 Feb 2021 18:09:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44F599F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614100204;
	bh=ptdt6kk/LE+ZYMgAud4TUnCWcoetQF/p5JuTwa5WDMY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VMpHTR5u/kGZZKP43S+bh6o8Y2KI80GTmO6rHDQfUWpIgrjpUEnS1zsC4FJtGHT/P
	 FyiVNpRuW/KtjHmKnb6JSxMwRJ2txmc54A6rS2LiBAgKn1owS7acU5cuvM1/pKjjL7
	 cMO8vp3z+yXBr28DGNsNtKfQwKbkGU8xvAtd+Gl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CD07F800B4;
	Tue, 23 Feb 2021 18:08:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D06FAF80169; Tue, 23 Feb 2021 18:08:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2ACA4F80129
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 18:08:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ACA4F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="jMOeJGDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614100106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gygTHjPL2smstio3kEtFc7RlbNxmdFniyvku1VThzBk=;
 b=jMOeJGDKGKupwmpt50SrqUMhNesfHPuzKFYp180QFOVOeGCMaZp4R9HfzW2AAnZJOJ672n
 AGZ0v2bez0Y8deetGc72nngiSOdBeOkJ8UeXeVZLyCqFq2exHA4leh91frrbC6al1GcBzz
 XoRGwA5GHy9tUZgd3JqgjLYwQSCTmzM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-FwejZnyqNVSs0NUU0yZKmw-1; Tue, 23 Feb 2021 12:07:30 -0500
X-MC-Unique: FwejZnyqNVSs0NUU0yZKmw-1
Received: by mail-ed1-f69.google.com with SMTP id t18so7206209edr.19
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 09:07:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gygTHjPL2smstio3kEtFc7RlbNxmdFniyvku1VThzBk=;
 b=L+slClSjMLr5KU/nZHxtwepYYge/AmeLm/+tKZne13o7HGJcZKIOvfTYslkA1hc+al
 gtws6Y7KUkJ3hEfurfW5TY5QPW7g7cZbTw3LJUGPUugjLzYzGYqtTxxZTQExB/pRdF65
 ckurlzr/pa+qxv6eBLePSPOaMgihB7k+1E8Fd4HA7z6oHuIT6WQ2Kg+KNgWRfR6EGbLK
 skvpLrZ7S/Lz+PUnoP7QRMA9lR2CN+uFEG7Dlwd/EKkCBrLJVSiDzOV7YZh1FIjgizfn
 e0xZtAid76Lk/TUsCbSHzVCjX27ujX0hCsQAfVfxfqyfHtzX4Z3koYxc8K0ZUpnOYTt0
 MBFg==
X-Gm-Message-State: AOAM530WDMc9isGwaq6p18zsmFDnflhYWZUf5f0StnAUjy8m/YC57Uet
 e0py3ykFATRxQ5vT6yY4tEnm9ow+KVJdfvG2poKY2/eXe9vy8KtJVyv93NK1fdaLyf4PAo9JKa5
 ks19meg+tY2+0pjKZxppv0OASgCyNulqikrTekxmwodZ4iY+6TDt7s79gMi8jN7uJrk/iyE/NdH
 8=
X-Received: by 2002:a17:907:76b8:: with SMTP id
 jw24mr19419801ejc.179.1614100049409; 
 Tue, 23 Feb 2021 09:07:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyaOK+1Mk8D8w9BgykrTz3JqtiCLEziAY0DWvJkeLPY56UGIMKpxnVwKYsDYVudQq7g4ps8g==
X-Received: by 2002:a17:907:76b8:: with SMTP id
 jw24mr19419764ejc.179.1614100049143; 
 Tue, 23 Feb 2021 09:07:29 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id q27sm5159234ejc.74.2021.02.23.09.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 09:07:28 -0800 (PST)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>,
 Mark Brown <broonie@kernel.org>
References: <20210215142419.308651-1-hdegoede@redhat.com>
 <20210215142419.308651-3-hdegoede@redhat.com>
 <20210223134506.GF5116@sirena.org.uk>
 <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
 <20210223140930.GH5116@sirena.org.uk> <s5h8s7evp8p.wl-tiwai@suse.de>
 <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <758d5ac4-7220-90ae-7e5a-1e14a0758328@redhat.com>
Date: Tue, 23 Feb 2021 18:07:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Bard Liao <bard.liao@intel.com>
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

On 2/23/21 5:14 PM, Jaroslav Kysela wrote:
> Dne 23. 02. 21 v 15:21 Takashi Iwai napsal(a):
>> On Tue, 23 Feb 2021 15:09:30 +0100,
>> Mark Brown wrote:
>>>
>>> On Tue, Feb 23, 2021 at 02:59:17PM +0100, Hans de Goede wrote:
>>>> On 2/23/21 2:45 PM, Mark Brown wrote:
>>>>> On Mon, Feb 15, 2021 at 03:24:19PM +0100, Hans de Goede wrote:
>>>
>>>>> Why just these particular controls - what if a system has separate mutes
>>>>> for speakers or something?
>>>
>>>> These are the main volume controls, which are always in the output / input
>>>> path independent on if we are outputting to e.g. speakers or the headphones.
>>>
>>>> We want to use the main volume control for this, because there always is
>>>> only 1 output mute LED and 1 input mute LED. Well at least that is the assumption
>>>> the current ledtrig-audio.c code has.
>>>
>>>> The idea is to only turn the single LED on if we are sure there will be not
>>>> sound output on any of the outputs, which is why we tie the LED to the
>>>> mute switch on the main volume control.
>>>
>>> Right, so that might work well on your particular system with your
>>> particular configuration but will it work well on other systems with
>>> different hardware?  It's not clear to me that it makes sense to go
>>> through all the drivers picking controls that might be used for this
>>> purpose - it seems both time consuming and error prone.  Consider a
>>> mostly digital device which has an ADC/DAC per input/output rather than
>>> a central ADC/DAC with analogue muxing for example, or a system with
>>> multiple DACs available for mixing together or analogue bypassess.  
>>
>> That's one of my concerns in the recent actions for putting the
>> hard-coded mute LED controls.  So far, the only usage of led-audio
>> trigger is HD-audio, and it's enabled only for selected devices and
>> setups.  OTOH, if we apply the audio-led trigger generically in ASoC
>> codec driver, it's always done and might misfit; e.g. what happens if
>> two codecs are present on the system?.
> 
> That's the abstraction issue. We can use PCI, ACPI, DMI or DT checks at the
> _right_ place (machine top-level code) to mark those controls with the LED
> flags in the kernel space. I've never said that the right place is the generic
> ASoC codec driver.

FWIW I'm more then happy to rework this RFC series to make the setting of the
SNDRV_CTL_ELEM_ACCESS_*_LED flag only happen on certain models based on the
existing DMI quirks mechanism in the driver.

So far I'm aware of only a few 2-in-1 models which actually have a mute LED
embedded in the (mic)mute key in their detachable keyboard.

Please let me know if you would prefer for me to rework my series
to handle the setting of the flag on a per model (DMI match) basis.

I see 2 additional advantages of this approach:

1. It would allow us to not modprobe the snd-ctl-led module on devices
where we don't need it.

2. The rt5640 codec has 2 I2S interfaces / 2 AIFs and that brings
some challenges with it. I currently have a working implementation
(which needs some more testing before posting it upstream as RFC) which
sets the SNDRV_CTL_ELEM_ACCESS_SPK_LED flag on the main volume control
for both the AIF1 and AIF2 paths to the outputs (which have separate
main volume controls) and then relies on userspace to always mute the
main volume of the unused AIF.

This requires the UCM profile to know which AIF is being used, if we
do this on a per model basis then we will know which AIF is used and
we can set the SNDRV_CTL_ELEM_ACCESS_SPK_LED flag on only one of the
2 main volume-controls, removing the requirement for userspace to
mute the unused main volume-control.

###

Note that userspace will still need to know which AIF is being used,
regardless of the mute-LED discussion, because it needs to know to
be able select the right volume-control for hardware volume control
(which is something which we really want in general, esp. for the
analog mic inputs and is necessary for the mute-LED to work).

Since userspace needs to know which AIF is being used, I've written
a kernel patch modifying the machine-driver to add a new "aif:1" or
"aif:2" string to the components string.

I have this all working now, and I will post a RFC upstream once
I've run some final tests, for the UCM changes for this, which
illustrate the need for userspace to know which AIF is used, see:

https://github.com/jwrdegoede/alsa-ucm-conf/commits/master

And specifically:

https://github.com/jwrdegoede/alsa-ucm-conf/commit/afce963f725a5659eb903508d924d3b19110244a
https://github.com/jwrdegoede/alsa-ucm-conf/commit/d2128e5380d9d6128dda67dd94f64bf7244cd3a3

Regards,

Hans

