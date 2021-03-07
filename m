Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E296033016F
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 14:53:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 749ED18A4;
	Sun,  7 Mar 2021 14:52:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 749ED18A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615125193;
	bh=PdjJv/wSzuFQwLI/DXSnsx6pxMAWrVW+2yDpOEQO3AY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m3mIdXnAJJjymK/FAy0AbsYZpliAn+m2qZ+8pPBO4FjOsdoHHzjamomMqCuaZ2ZY3
	 eSDgegK49Ufsq7i5oQWu9m47w1U/uak09/FIRTMS013+9WMjR/XoGcMa1fAWuojvTC
	 JfBQsndGgn8fZ2txYRJbeJ7TQlycC9ouYwgMs4MM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C206F8019B;
	Sun,  7 Mar 2021 14:51:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8257F80227; Sun,  7 Mar 2021 14:51:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65A78F80139
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 14:51:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65A78F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="JSGYCscE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615125095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nl9Sj3YxkWagQW7vKJTj3GlJD4MvHQwvVGxJZdUe55A=;
 b=JSGYCscEsZ6b1B7Gk7YhivqY0L9GodfFiCoCZXq0npFSSMIWVpy9+mUeCB1tzoDjdgsW1W
 GTJwa9YJlT8DJJbDvbtzp2DXmII+Lom2s+fZxfZz0mNfpNMZBReFoEOmtjeowp8QHvZRm8
 QNRu3UfI8b+r4gTeuS+J3RX4mjTlOnQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-ugwN8JE0NQyVuMYt8o5AsA-1; Sun, 07 Mar 2021 08:51:33 -0500
X-MC-Unique: ugwN8JE0NQyVuMYt8o5AsA-1
Received: by mail-ed1-f72.google.com with SMTP id w18so914959edu.5
 for <alsa-devel@alsa-project.org>; Sun, 07 Mar 2021 05:51:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nl9Sj3YxkWagQW7vKJTj3GlJD4MvHQwvVGxJZdUe55A=;
 b=qrRD26cEwuXMNS/icA8M2IdxOpd6GaN2glGaOWYYzp6A7Ja040nplh038aSs1l5tWR
 9WUhXT7uI4aqDqre8zOA5m5WKa1HI9nR4rmPYrUJ+P0HgaY6UIS4vPmtYZh7WA1atYaz
 ejqpxnugYQvJD8glnbAlx5JAxlpaQsuOA5otaaWOaM/SWDmlcWfZxBQt84/blAPayGPb
 rB6zQqjalagykJuCjYEea37zEbgwdpEK3QWAztoXVKHXANyx6IoyCFERWVzf1gONunoL
 DMRO1AfJcR4+f3i3hbO4SGnCWYdIm/3dNwk4cQdUdvdktL7q19CjJ6zlTVaJk0+YQowV
 YjtA==
X-Gm-Message-State: AOAM530xj2Rpk/aOOTKTcRpP5tHBhO+kOYZHbLcSii48TfPvscve3+Qb
 fwHrRZ7OIIV7ex+bMTxAYngVxdZErlAaqFjNpRFhZ9S4spcA+5Cx+jst6swxDs52Ef89DnE6jOc
 0tghRARr5FPMQo+exgAJYkW0Bl5cBN7juhxGubHTpymuRQVjRKllX/2BiHQL7KMw2QSvgNoLJT2
 M=
X-Received: by 2002:a05:6402:48c:: with SMTP id
 k12mr6898168edv.237.1615125092317; 
 Sun, 07 Mar 2021 05:51:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0NzFHpWbhWhqO0UGfcbJFJOoKIhWEOogPA8X4/Jupbb9pq7f9vJ8EHD7frgnehD7BO8fRTQ==
X-Received: by 2002:a05:6402:48c:: with SMTP id
 k12mr6898146edv.237.1615125092093; 
 Sun, 07 Mar 2021 05:51:32 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id r5sm5060795ejx.96.2021.03.07.05.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Mar 2021 05:51:31 -0800 (PST)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>
References: <20210224125927.GB4504@sirena.org.uk>
 <e47c7fa5-cb1a-f8a3-bfe4-1f6bca6a7d80@redhat.com>
 <20210224193626.GF4504@sirena.org.uk>
 <56ea1110-c129-5f3a-264b-fb389f615dbe@redhat.com>
 <20210225145901.GB5332@sirena.org.uk>
 <c785af21-8170-62ca-6f08-0a9a1a9071bb@redhat.com>
 <20210301132352.GA4628@sirena.org.uk>
 <76103f3e-c416-c988-7bc2-d7657e1868bd@redhat.com>
 <20210301191503.GI4628@sirena.org.uk>
 <54c5fd8e-1835-b9c3-d5fd-5cb363eab32c@redhat.com>
 <20210301204313.GK4628@sirena.org.uk>
 <6d34af65-761b-7314-6af6-daf15cc9535c@redhat.com>
 <4b61303c-cee6-32cc-a9b9-3de7db0043d8@perex.cz>
 <7c6c2f44-e6a1-48e7-773e-033ba4582742@redhat.com>
 <28fffebd-1ce9-7480-0f2f-ed8369abddf1@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5868cfc7-1ad4-2378-eef0-f72e64f6b262@redhat.com>
Date: Sun, 7 Mar 2021 14:51:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <28fffebd-1ce9-7480-0f2f-ed8369abddf1@perex.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On 3/5/21 2:02 PM, Jaroslav Kysela wrote:
> Dne 04. 03. 21 v 20:39 Hans de Goede napsal(a):
>> Hi,
>>
>> On 3/2/21 10:14 PM, Jaroslav Kysela wrote:
>>> Dne 01. 03. 21 v 22:26 Hans de Goede napsal(a):
>>>> Hi,
>>>>
>>>> On 3/1/21 9:43 PM, Mark Brown wrote:
>>>>> On Mon, Mar 01, 2021 at 08:49:34PM +0100, Hans de Goede wrote:
>>>>>> On 3/1/21 8:15 PM, Mark Brown wrote:
>>>>>
>>>>>>> Off the top of my head something like writing a control name into a
>>>>>>> sysfs file might work, it doesn't scale if you need to use multiple
>>>>>>> controls as rt5640 does though.
>>>>>
>>>>>> Currently ALSA/UCM does not use sysfs files for anything, so this
>>>>>> feels very inconsistent with how all the rest of this currently works.
>>>>>
>>>>> Yes, you'd really want to add string controls in ALSA.
>>>>
>>>> Hmm, we already have SNDRV_CTL_ELEM_TYPE_BYTES controls. I think that will
>>>> work nicely actually, we can have the UCM conf file send a 0 terminated
>>>> string to the driver that way. It would be nice to have some syntactic
>>>> sugar on the UCM side to be able to actually specify a string instead
>>>> of an array of bytes, but I don't think we need any new userspace API
>>>> for this.
>>>
>>> The LEDs are controlled per machine not per card. So do we need to create the 'Speaker/Mic LED Control' control for all cards?
>>>
>>> Also, this change sounds really generic. The interface may be implemented in my proposed control led kernel module, not in the codec drivers.
>>>
>>> The Mark's sysfs idea is not bad in my opinion. The sequences may be extended in UCM, we have already 'exec' command. Yes, this command is a little heavy for the sysfs writes, but we can add command like 'sysset' or so for sysfs like:
>>
>> Okay, so this would be a sysfs file per card then? Sol we would have for example
>> 2 new sysfs files like this show up when your module is loaded:
>>
>> /sys/class/sounds/card0/spk_mute_led_control
>> /sys/class/sounds/card0/mic_mute_led_control
>>
>> And reading would iterate over all mixer-elements of the card and print
>> the names of those which have the relevant access LED flag set, where
>> as a write would be taken as a control-name to add the access LED flag
>> too?
> 
> It depends if we want to have this feature as an independent add-on
> (implemented in the generic sound LED module) or if we tie this more to
> the ALSA's core control code.
> 
> My proposal creates virtual sound ctl-led driver - thus
> /sysfs/devices/virtual/sound/ctl-led/ tree. We can add a subdirectory per card
> there like:
> 
> /sysfs/devices/virtual/sound/ctl-led/speaker/card0/attach
> 
> ...

Ok, I see.

>> And an empty write would be special and clear the flag on all controls?
>> I guess we don't strictly need that if we only set things up at boot once,
>> but it might still be handy to force things to a clean state.
> 
> The list operations should be probably identified by separate sysfs files.
> 
> /sysfs/devices/virtual/sound/ctl-led/speaker/card0/attach
> /sysfs/devices/virtual/sound/ctl-led/speaker/card0/detach
> /sysfs/devices/virtual/sound/ctl-led/speaker/card0/reset
> /sysfs/devices/virtual/sound/ctl-led/speaker/card0/controls

Ack, that would be better.

> And /sys/class/sounds/card0/controlC0/led-speaker may be a symlink to
> /sysfs/devices/virtual/sound/ctl-led/speaker/card0/ .
> 
>>>   # detach all speaker LED controls for card 1
>>>   # similar to 'echo -n "card=1,*" > /sysfs/devices/virtual/sound/ctl-led/speaker/detach'
>>>   sysset "devices/virtual/sound/ctl-led/speaker/detach:card=1,*"
>>>
>>>   # attach the 'Speaker Playback Switch',10 control to speaker LED trigger in card 1
>>>   # similar to 'echo -n "card=1,iface=MIXER,name='Speaker Playback Switch',index=10" > /sysfs/devices/virtual/sound/ctl-led/speaker/attach
>>>   sysset "devices/virtual/sound/ctl-led/speaker/attach:card=1,iface=MIXER,name='Speaker Playback Switch',index=10"
>>
>> I think a sysfs file per card would work better, that would certainly be
>> a lot more inline with how sysfs is normally used...
>>
>> Also do we need the iface=MIXER part ?
> 
> It was just a complete example (element ID specification in a string from
> alsa-lib/amixer). Of course, the other element types won't be probably used
> for the LED functionality...

Ok, the reason I was asking is because if possible we should having to
avoid to do string-parsing inside the kernel. So if the sysfs files
just take a control-name without any of the name=value pair stuff going
on that would be better.

> 
>>> Security: The LED-control bindings should be handled only in the boot / init phase (thus in UCM BootSequence section) and the sysfs interface files should be read-only for normal users.
>>
>> Yes that make sense, but it will require some extra helper to that, I guess it
>> could be an extra flag to the alsactl restore command which already gets run
>> at boot, or an extra alsactl command ?
> 
> The alsactl does the BootSequence initialization when UCM is supported in
> alsa-lib. But, we have a little issue that the this sequence is executed only
> if some controls are changed (added or removed) between last alsa state config
> (/var/lib/alsa/asound.state) or if the state for the given card does not exist
> to not override the values which may be changed by the user. It really depends
> on the control API only.
> 
> Apparently, we need another sequence which will be forcefully executed on
> boot. ColdSequence , FixedBootSequence, ForcedSequence, ForcedBootSequence ?

FixedBootSequence seems the best.

This does seem to have quickly grown into something somewhat complex though.

While all that is necessary for the 2 ASoC using devices with actual mute-LEDs
which I'm trying to get supported is 2 very simple static assignments of
the LED flag.  I've just completed some alsa-lib work to deal with the
sometimes quirky control-names and with that in place, the spk-mute-led
flag can be statically set on the access flags of the Speaker + HP output
mute controls as Mark suggested as an alternative.  That seems a lot more KISS
to me.

But I guess the flexibility this gives us will also be helpful for some HDA /
other SOF cases like the Dell privacy stuff which also involves tying a mute
control on an ASoC codec to a led-trigger ?

Regards,

Hans


