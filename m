Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F462E786F
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Dec 2020 13:10:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60F1F180F;
	Wed, 30 Dec 2020 13:02:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60F1F180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609329822;
	bh=AW7C5O+TYA+aCk35ySdUiJ8qGkKQZYh3OdLAJnqK5dA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AnurO2tJsS2u1+FE/KZxMBj3LfPJjLT3sCmgfTQ191b5gqmeC9C4jVfBhtfX20c0G
	 6Hc6jCbBbUhNDJfUGbyjjtJOqO1GVl5hE0iZHRFbJ7YmxqpyTnU1DrtMqd9OF7hu/c
	 qbUIV6KVu8koLCYK+idDf1KypXE5mYXwDpAjfg/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAEBEF801F9;
	Wed, 30 Dec 2020 13:02:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E828FF801F5; Wed, 30 Dec 2020 13:02:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29CF3F80141
 for <alsa-devel@alsa-project.org>; Wed, 30 Dec 2020 13:02:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29CF3F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ERzMrKNu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609329718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdsX3gvXRtUGGqerTQfjWF9gTDTad8buu+q61eqnm3U=;
 b=ERzMrKNuAAQd3HIRC7FElowzoDk8U/jUPmXhPlGctxMHWBQjTd98s1AFWZQRB9pqQih+4Y
 p2vWOxvjxTiEYC3g2J/KEAtMcYOeNlglsXKCFFwoe1PnZgPvyVVljivRc/1af0iY7FaqS6
 mAWBVhVMQpE6N8H2opjGA/1vPB7EL64=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-WJtxpowiM1C7Q-SbRC03Ug-1; Wed, 30 Dec 2020 07:01:56 -0500
X-MC-Unique: WJtxpowiM1C7Q-SbRC03Ug-1
Received: by mail-ed1-f69.google.com with SMTP id u17so5808459edi.18
 for <alsa-devel@alsa-project.org>; Wed, 30 Dec 2020 04:01:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NvjfJ+LFatFfbZe/Q9mQaV9ad4YgiDZqIK+OxZ/le3U=;
 b=aEmtfzw7wLz1uJDcRELb9BXK+X6IDblLChl+/2ibTnJ687oYt4EFU1Ctu/UPXqOh17
 bADGNRyCdhiGLxRkQ9anGTECVM22Dfc1pvS5AbRCpNkBvkMIqOhznHAOLkVbv1V0p8Ru
 cH3pIhmGJY6ToqWdPvq9pbOFFNWLvWPaLijiP08+ON6cGd7YfrswKCjProhXMB3qzvy3
 J0mcxnNjRjwkhL8EnMCjeb9tICJ2EeO8zz9E1x43ZlqfakdOmpvASA8XBQ20IXZqOFEM
 wTDen4m9tVYvfFn9ZpKJ209kkLGvfwfeNK81JPjddtHcaHIbNW68/ZpPk5P1a4KgI6Oq
 YXAA==
X-Gm-Message-State: AOAM532S58rd9+ddOpz3O8vIhs/mkCXB44qmnyIdZofFVQNP/KdVgKju
 mruUhssoM9AVqk/1g+fw2tOXi10nVdBRlYLtvTs92lIB/2mvABYfqOj7po78WI5Ey1gwy/EDRvS
 XYnpJ7+hjaBBwfjV1AioBZBfbFAwa4TdAv4gX3B0RJHrcX3hMjkDbLaJUY/C7v+ULQ6i5LaZ7uh
 M=
X-Received: by 2002:a05:6402:3553:: with SMTP id
 f19mr36819142edd.129.1609329713721; 
 Wed, 30 Dec 2020 04:01:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjaRbE/am2+NboBmQCUgz+kg7SEgmdVf3ihW/4XjLdr0/9shWVpLDwEOOxXukbmncXQYENeg==
X-Received: by 2002:a05:6402:3553:: with SMTP id
 f19mr36819110edd.129.1609329713442; 
 Wed, 30 Dec 2020 04:01:53 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id d6sm18914733ejy.114.2020.12.30.04.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Dec 2020 04:01:52 -0800 (PST)
Subject: Re: [PATCH 01/14] mfd: arizona: Add jack pointer to struct arizona
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20201227211232.117801-1-hdegoede@redhat.com>
 <20201227211232.117801-2-hdegoede@redhat.com>
 <20201228122138.GA5352@sirena.org.uk>
 <44f84485-8efc-39f9-d0a7-cb8db2ea3faa@redhat.com>
 <20201228162807.GE5352@sirena.org.uk>
 <20201229130657.GN9673@ediswmail.ad.cirrus.com>
 <19c2d056-4f71-2c4c-c243-cdcc0115876c@redhat.com>
 <20201229150635.GP9673@ediswmail.ad.cirrus.com>
 <20201229151548.GG4786@sirena.org.uk>
 <1d982dd1-eb02-e7c7-357e-83cf5003c624@redhat.com>
 <21333e30-1e7a-2c95-9e7c-6325c7e78f9a@opensource.cirrus.com>
 <833781fc-efde-fe98-fded-f81855e54de8@redhat.com>
 <53504898-3062-fb9a-3e44-ac0a2ccc86e2@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <f2c7d303-6137-4a02-a581-afd2ab6b1ca9@redhat.com>
Date: Wed, 30 Dec 2020 13:01:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <53504898-3062-fb9a-3e44-ac0a2ccc86e2@opensource.cirrus.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Lee Jones <lee.jones@linaro.org>
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

On 12/30/20 12:23 PM, Richard Fitzgerald wrote:
> On 30/12/2020 11:04, Hans de Goede wrote:
>> Hi,
>>
>> On 12/29/20 5:51 PM, Richard Fitzgerald wrote:
>>>
>>>
>>> On 29/12/2020 15:40, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 12/29/20 4:15 PM, Mark Brown wrote:
>>>>> On Tue, Dec 29, 2020 at 03:06:35PM +0000, Charles Keepax wrote:
>>>>>
>>>>>> There is maybe more argument for porting the Arizona code across
>>>>>> anyways, since for a long time Android didn't properly support extcon
>>>>>> either. It supported the earlier out of tree switch stuff, extcon
>>>>>
>>>>> Completely moving the driver doesn't cause the same problems as the
>>>>> current proposal (unless it drops functionality I guess, there were
>>>>> issues with adding new detection types into the input layer but I can't
>>>>> remember if this hardware was impacted by that or not).
>>>>
>>>> The input-layer supports the following switches:
>>>>
>>>> SW_HEADPHONE_INSERT
>>>> SW_MICROPHONE_INSERT
>>>> SW_LINEOUT_INSERT
>>>> SW_JACK_PHYSICAL_INSERT
>>>>
>>>> Which is a 1:1 mapping with the cable-types currently exported by
>>>> extcon-arizona.c .
>>>>
>>>> I'm fine with fully moving extcon-arizona.c over to only using
>>>> sound/core/jack.c functionality and it no longer exporting an
>>>> extcon device.
>>>>
>>>> I guess we should move it out of drivers/extcon then though.
>>>> I suggest using: sound/soc/cirrus/arizona-jack-detect.c
>>>> Note that sound/soc/cirrus is a new dir here. Would that work
>>>> for you ?
>>>
>>> Shouldn't it be sound/soc/codecs/arizona-jack.c so that it is with all
>>> the other code for those codecs?
>>
>> The arizona codecs use the MFD framework and there is a separate
>> platform-device instantiated for the jack-detect functionality, so this
> 
> That is because it is an extcon driver. It is a different subsystem to
> the other child drivers so has to be a separate child.
> 
>> (mostly) a standalone platform-driver which has very little interaction
>> with the rest of the codec code.
>>
>> It is not a codec driver, or code shared between the codec drivers,
>> so putting it under sound/soc/codecs would be a bit weird.
>>
> 
> In fact it is tied into the codec driver. The code in arizona.c that
> handles HP OUT has to synchronize  with the jack detection to avoid one
> driver trashing the state of the other. But because they are currently
> separate drivers they have to communicate through hp_ena and
> hp_clamp in the parent mfd data. See arizona_hp_ev().

So what you are suggesting is to do something along these lines ? :

1. Drop the MFD instantiated arizona-extcon device
2. Move the extcon code to something more like a library
3. Have the various codec drivers call into the library
   at various points
4. Have the library call snd_soc_card_jack_new,
   snd_soc_jack_report, etc. ?

That works for me, but I would like to make sure we are all on
the same page here before spending time on coding this solution.

Regards,

Hans

