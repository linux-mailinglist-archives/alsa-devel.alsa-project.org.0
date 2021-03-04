Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B0A32DA7E
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 20:41:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7D091896;
	Thu,  4 Mar 2021 20:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7D091896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614886872;
	bh=gbUrQlbyFPaeSoquWiGrZSzT13PRsH343/KPGjXa/fw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dySF7EVidVTPy3NhWEX57ndruqKw/5W9izm7jqFjkq7LE4wJicnAxxcGIbPckJFj6
	 mDUU0lMYvogLwOQbNZBm0H4fQey04PHND5a1B4PvhkK0zYj6vaXzl/C0yypK0IZXNh
	 CfEezAe4Q8KZ0XBoSiEYHUROfRSLBYuLwP59UWBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CD57F80271;
	Thu,  4 Mar 2021 20:39:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3B4CF80269; Thu,  4 Mar 2021 20:39:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24A6DF800ED
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 20:39:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24A6DF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Sz0kYZcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614886774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GfISi1Az92GiZ1H75h9e2EwFG/hS4VqWJ32BEcIQ/6o=;
 b=Sz0kYZcs+zkRVc9BgZorQZpqM5x8M0oyMqowKQ0FDpR8aH9Lna999Bm3LOORlw5ORQH810
 NyDf/olhHZDU4/Og2JYO3ZEdvS7ww0GUdDx0WxHQhXK5OYIbpp0D12IekPkY2QfWvlITIN
 jQltM672fHIJzJBVJ9iBwJgA4pLkIqs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-we3W2C9KOhaiW54Y-B5DLw-1; Thu, 04 Mar 2021 14:39:33 -0500
X-MC-Unique: we3W2C9KOhaiW54Y-B5DLw-1
Received: by mail-ed1-f70.google.com with SMTP id o24so4463712edt.15
 for <alsa-devel@alsa-project.org>; Thu, 04 Mar 2021 11:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GfISi1Az92GiZ1H75h9e2EwFG/hS4VqWJ32BEcIQ/6o=;
 b=YXlTE960xADg4xsoKtmo7zan0Yqg2hgyxcyLxGny4krrh7sD14rrzdyJflsWgcfimW
 QLuvpiSuug2yJSK5uY8x7pJplhSqg/lkZTUnpeLbI0hDpG+5v4bgBpHaey9j+9M/Aap6
 x75eJGLemxpog1BDu/c5ZOZ23TB6Mhg9ylUsIW2TTHn/tDYLAAWlpOzzl6uoavx9j7g1
 Uc5mcx3ndQms83G+dzj4zako+qMNMibqQDoJSGcovoriALRBxew3HFGREpStOCWB8Exg
 BFLZU7xU2EQKgLLHxJ658a3XdtnfI6H5CnyzIyGwoDg8d3fcp+7u8yEXSwq8nbtFcaOn
 kM7A==
X-Gm-Message-State: AOAM533WMUG+9NdhstpI+PYvNBLodGkcyo+B9qlwHeLJ3H6mmFvCizV1
 TelMGpBe0uA0qnilMjtQ9mm+r36JDMT7R5pp3ebB8v1vGO7ZUranqqtX8lM/74mFrjXl0J+/SgV
 edm+JQWbm25IHvTrQnkOkbAn5gTzsYw1iIJUcwDiBTkxMf3DVcD08+KWVFk73qpbx0wyPNvGYg1
 Y=
X-Received: by 2002:aa7:c983:: with SMTP id c3mr6224296edt.185.1614886771780; 
 Thu, 04 Mar 2021 11:39:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDgMYZPCZy72SZ4nO/Wikb+yzgS7LXfrtjQeHIBPkGI7Ut6ZTxgs2kQ8zzao5s3GFAaER4nw==
X-Received: by 2002:aa7:c983:: with SMTP id c3mr6224277edt.185.1614886771541; 
 Thu, 04 Mar 2021 11:39:31 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id z13sm185750edc.73.2021.03.04.11.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:39:31 -0800 (PST)
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
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <7c6c2f44-e6a1-48e7-773e-033ba4582742@redhat.com>
Date: Thu, 4 Mar 2021 20:39:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <4b61303c-cee6-32cc-a9b9-3de7db0043d8@perex.cz>
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

On 3/2/21 10:14 PM, Jaroslav Kysela wrote:
> Dne 01. 03. 21 v 22:26 Hans de Goede napsal(a):
>> Hi,
>>
>> On 3/1/21 9:43 PM, Mark Brown wrote:
>>> On Mon, Mar 01, 2021 at 08:49:34PM +0100, Hans de Goede wrote:
>>>> On 3/1/21 8:15 PM, Mark Brown wrote:
>>>
>>>>> Off the top of my head something like writing a control name into a
>>>>> sysfs file might work, it doesn't scale if you need to use multiple
>>>>> controls as rt5640 does though.
>>>
>>>> Currently ALSA/UCM does not use sysfs files for anything, so this
>>>> feels very inconsistent with how all the rest of this currently works.
>>>
>>> Yes, you'd really want to add string controls in ALSA.
>>
>> Hmm, we already have SNDRV_CTL_ELEM_TYPE_BYTES controls. I think that will
>> work nicely actually, we can have the UCM conf file send a 0 terminated
>> string to the driver that way. It would be nice to have some syntactic
>> sugar on the UCM side to be able to actually specify a string instead
>> of an array of bytes, but I don't think we need any new userspace API
>> for this.
> 
> The LEDs are controlled per machine not per card. So do we need to create the 'Speaker/Mic LED Control' control for all cards?
> 
> Also, this change sounds really generic. The interface may be implemented in my proposed control led kernel module, not in the codec drivers.
> 
> The Mark's sysfs idea is not bad in my opinion. The sequences may be extended in UCM, we have already 'exec' command. Yes, this command is a little heavy for the sysfs writes, but we can add command like 'sysset' or so for sysfs like:

Okay, so this would be a sysfs file per card then? Sol we would have for example
2 new sysfs files like this show up when your module is loaded:

/sys/class/sounds/card0/spk_mute_led_control
/sys/class/sounds/card0/mic_mute_led_control

And reading would iterate over all mixer-elements of the card and print
the names of those which have the relevant access LED flag set, where
as a write would be taken as a control-name to add the access LED flag
too?


And an empty write would be special and clear the flag on all controls?
I guess we don't strictly need that if we only set things up at boot once,
but it might still be handy to force things to a clean state.

> 
>   # detach all speaker LED controls for card 1
>   # similar to 'echo -n "card=1,*" > /sysfs/devices/virtual/sound/ctl-led/speaker/detach'
>   sysset "devices/virtual/sound/ctl-led/speaker/detach:card=1,*"
> 
>   # attach the 'Speaker Playback Switch',10 control to speaker LED trigger in card 1
>   # similar to 'echo -n "card=1,iface=MIXER,name='Speaker Playback Switch',index=10" > /sysfs/devices/virtual/sound/ctl-led/speaker/attach
>   sysset "devices/virtual/sound/ctl-led/speaker/attach:card=1,iface=MIXER,name='Speaker Playback Switch',index=10"

I think a sysfs file per card would work better, that would certainly be
a lot more inline with how sysfs is normally used...

Also do we need the iface=MIXER part ?

> Security: The LED-control bindings should be handled only in the boot / init phase (thus in UCM BootSequence section) and the sysfs interface files should be read-only for normal users.

Yes that make sense, but it will require some extra helper to that, I guess it
could be an extra flag to the alsactl restore command which already gets run
at boot, or an extra alsactl command ?

Regards,

Hans

