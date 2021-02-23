Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E792E323123
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 20:05:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C2C81679;
	Tue, 23 Feb 2021 20:04:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C2C81679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614107146;
	bh=VKeQhAies7RU8wPon2XXPb6gXORcNSu0HddyAa4lR8g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vDSyNce/kv/u63xA2ySzJ+rjG3arZ/nBYixbH3xA/tUZcc+MQ2SsYItC7cPg3x3ac
	 prPVQuXIZ5ezAA6LkPoGdmXi3HF/ryZ7M0Y3J9r/onj7VlzT+3QlXxYdgYB9pRyjvo
	 TzeptYFQ9jWlsQg0E8Vi5maMbmd3jxdyvNXzGlSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99F12F8016D;
	Tue, 23 Feb 2021 20:04:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF6E3F800B4; Tue, 23 Feb 2021 20:04:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BD95F800B4
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 20:04:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BD95F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="DpNR5CtY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614107044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=csCxomwI82Jg6fdk0rjG9kK2d0mMv6v+TpH/OsUg/CM=;
 b=DpNR5CtYb4Gk7tTzjM5B8jbSAvFADouOHT5XLrV5SaCx8me/FR1GsHTVHv9QGePV1O1fsq
 bck8r55zmwRJHa8e9fbaA8IdAT4zjXdLPMs0JisYHfLIj+Z2gfeyBlHif5Vvb6Z2K9M4o4
 u9KHt4HdUW0VqRblqIsBAX9pEe1Ni2U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-9eCZ9w0uOG62LJ7TBX4O8g-1; Tue, 23 Feb 2021 14:04:01 -0500
X-MC-Unique: 9eCZ9w0uOG62LJ7TBX4O8g-1
Received: by mail-ed1-f72.google.com with SMTP id m1so5059755edv.12
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 11:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=csCxomwI82Jg6fdk0rjG9kK2d0mMv6v+TpH/OsUg/CM=;
 b=HmtT3T+50VjUvn55ooBfJiX9vJAzsnnGgQawZUblxucsmy/ji5sYmHF2lA/RYzEzrb
 ni7IH9UWcQHXH1UPAxrKa3l4MQtjyCwwzBFSc75UiIPXhAmpTTUXGOxXFSjzaGAPraAa
 ARcVyZoLPjsUAf651ZzXu1pHW1gej15zO+yzNBQZ905L+5bQJL6x4pTA2YkS7vgSNhMP
 ooz6vnTBF7YG3K/26S9nsgQDT86zMzcwvjhR9nTuZOFxfQyMcZj5OEB0DyEtfpgdIqrV
 V5D4mvcIr+D6cvku8MTXy3eUoMusss2utun8pj9zuSs6aIiTI+bkbNpRCg9QwOc40xMK
 zSMQ==
X-Gm-Message-State: AOAM531HWKWlbMVirv1Domi8GmdKmOw/onbhPMWuAswVdHtD1W1/7Aby
 Qh+nq8Jbx+T07iDi/lcND3i+RJFGmsXcwrqCQoPxKSZ/CoxIExlBmtLMzEpKl/ilhhJwJ1y5dQJ
 oQdb7CFYLKgpX5vOqGAC5cGvDsBpR0WCzykjIOeFpzj1GqhtxLJpR+0rU0x2aOTbtsidqntwEIi
 A=
X-Received: by 2002:a17:907:760a:: with SMTP id
 jx10mr18392201ejc.212.1614107040249; 
 Tue, 23 Feb 2021 11:04:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqlczuOH4AyS4jFsXjIx1X5kvIH9kxvyr0/FPG9/sDE5QV/D3X5oby7eQDj04VkTg7lRYVKg==
X-Received: by 2002:a17:907:760a:: with SMTP id
 jx10mr18392166ejc.212.1614107039970; 
 Tue, 23 Feb 2021 11:03:59 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id cr20sm12890083ejc.57.2021.02.23.11.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 11:03:59 -0800 (PST)
Subject: Re: [RFC 2/2] ASoC: rt5670: Add LED trigger support
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>
References: <20210215142419.308651-1-hdegoede@redhat.com>
 <20210215142419.308651-3-hdegoede@redhat.com>
 <20210223134506.GF5116@sirena.org.uk>
 <578b1ee3-f426-c5b5-bc78-5a91108ebdc8@redhat.com>
 <20210223140930.GH5116@sirena.org.uk> <s5h8s7evp8p.wl-tiwai@suse.de>
 <fc28d535-87a7-fbfd-89c7-992a537606bc@perex.cz>
 <20210223172055.GI5116@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <fe2941de-02ce-9ed0-70ff-d7967aeecc44@redhat.com>
Date: Tue, 23 Feb 2021 20:03:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210223172055.GI5116@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Oder Chiou <oder_chiou@realtek.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <bard.liao@intel.com>
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

On 2/23/21 6:20 PM, Mark Brown wrote:
> On Tue, Feb 23, 2021 at 05:14:32PM +0100, Jaroslav Kysela wrote:
>> Dne 23. 02. 21 v 15:21 Takashi Iwai napsal(a):
> 
>>> That's one of my concerns in the recent actions for putting the
>>> hard-coded mute LED controls.  So far, the only usage of led-audio
>>> trigger is HD-audio, and it's enabled only for selected devices and
>>> setups.  OTOH, if we apply the audio-led trigger generically in ASoC
>>> codec driver, it's always done and might misfit; e.g. what happens if
>>> two codecs are present on the system?.
> 
>> That's the abstraction issue. We can use PCI, ACPI, DMI or DT checks at the
>> _right_ place (machine top-level code) to mark those controls with the LED
>> flags in the kernel space. I've never said that the right place is the generic
>> ASoC codec driver.
> 
> We already need ACPI and DMI quirks in the CODEC drivers anyway due to
> the limitations of ACPI so it wouldn't be particularly surprising to
> have stuff there.  OTOH this would fix things per machine while with
> fancier hardware things might easily be flexible enough that there's
> multiple choices that could be made depending on use case.

I have a feeling from the discussion here that you would prefer this
per model/machine option over the current patch which unconditionally
sets the SNDRV_CTL_ELEM_ACCESS_SPK/MIC_LED flag on the main DAC/ADC
mute controls ?

So I believe that it would be best for me to respin this patch
series moving to making this a per model/machine thing, correct?

> I'd be a lot more comfortable with ASoC having some runtime control for
> overriding which controls get mapped, even if we try to pick defaults
> with quirks.

The drivers in question already allow overriding their quirks bitmap
via a module-parameter.  If we are going to enable the mixer-element
access-flag which enables LED control on a per-model basis based on
DMI quirks, then I plan to simply add 1 new flag in the quirks bitmap
for this for each mixer-element on which we need the flag.

So for now this would be just 2 new flags, since atm we only need
the SNDRV_CTL_ELEM_ACCESS_SPK_LED resp. SNDRV_CTL_ELEM_ACCESS_SPK_LED
flag on one mixer-element each.

And then the user can always override the settings using the quirk
module parameter. This is not exactly runtime control, but IMHO it
is close enough and anything else will just overcomplicate things.
I'm aware of only 3 model 2-in-1s which need this and on those
3 the implementation is very straight forward.

Regards,

Hans

