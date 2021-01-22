Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D69300450
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 14:38:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F34FE1EF7;
	Fri, 22 Jan 2021 14:37:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F34FE1EF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611322678;
	bh=T73ILGbzwvijfWdiEGLwtOHcUHExUgZjFLRDCLkh2o4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H/to4rjZnNo88nq380QxeR+uU+hVUzNJ0CYkrs6LzG0lfudgXCywt27wSQyNn8DJ2
	 wNKJkoRFSAhhHDouxK6NMfuJObg6uZT57xqqAEkxwjgnTJ3dbskMYgDuAcxMqTbPZL
	 kMVjIkI4ARDek3NZAYN1xCACH+2JHcU7u31SLTrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12847F8019B;
	Fri, 22 Jan 2021 14:36:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97348F8016E; Fri, 22 Jan 2021 14:36:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7275AF80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 14:36:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7275AF80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Dqzyvgy6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611322566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QTrYS3guDB5O8MQKW0DTv3afyR+7WyuzK5+Av9id7t8=;
 b=Dqzyvgy6vvVDqI368RHIn6mTf/CuyBJXC3cv3yQ/GaGFeDQQPMeAdHd+jN+JJBmQX9ZL1v
 tZgtVuruQvFDmOd7R2IKeNgP3dJeUg72+jjA60JGnZaAFaGvJ42rFO4a6R8WHQc0CEnRrw
 DwmcVI3QnnOjsk5B7vgDMt6r5AsBwxg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-89--8cS8PI6kzzdVbAkw8w-1; Fri, 22 Jan 2021 08:36:04 -0500
X-MC-Unique: 89--8cS8PI6kzzdVbAkw8w-1
Received: by mail-ed1-f69.google.com with SMTP id m16so2895818edd.21
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 05:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QTrYS3guDB5O8MQKW0DTv3afyR+7WyuzK5+Av9id7t8=;
 b=Fyp/AdSQ4oVNC89+6TPnHzMz0sn0Qsx/gnpYZm51YiUVFKL9atT22oYX+6RU3qWUHq
 kbEnTf2tgQZfxkAZWnuINp3XLZx/dv1XiG1xE2TKF+Vzgsl+Cgan5Eirj3p/+fuD4e5h
 P2CFhZ9Ie1AS679F6JE+R7IvuB8vdTNpGJzQcLTtyV3pWJEuNjBOudJ+OAg8P4aQOy1Z
 lJt53kLFrcvZ1aEt8AkcmMx95j/6S5LXWY4x5LgwAG48P3qgk6CDwIhinSgdj5lrp2CJ
 V89ab43frQAjwG6VPpG/radUuSvfudwlEiwY2WP9S1XyjnNymQyQKvihaSjPtIbC18i9
 nsWA==
X-Gm-Message-State: AOAM532bGw+gSo3YTzAChPUUhfEfCbFM5ArVVsS3ayvBaSWES21B4CR0
 KU7M5u57JcESPbyzxpzkdUEBL4jmH1yRWpPMv01aitgkjRbRgIexcNdaMwXkhkMQOFRIn/0lF1G
 KkcD1FtJdnj0WANarYEu8ia4in4qWkUpQsyAV0fROGD6DM81S/xJ6Rbz+yqIlja2h5+UUVfh6ID
 U=
X-Received: by 2002:a05:6402:31a4:: with SMTP id
 dj4mr3226338edb.156.1611322563051; 
 Fri, 22 Jan 2021 05:36:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDMnq/NlKcQW1ErfmDFyZW627xsLSGBvBlomNhnsqJRW2YvaMMBUsKCKMO6g3bhRiqQui59Q==
X-Received: by 2002:a05:6402:31a4:: with SMTP id
 dj4mr3226311edb.156.1611322562829; 
 Fri, 22 Jan 2021 05:36:02 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id n5sm3715254edw.7.2021.01.22.05.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 05:36:02 -0800 (PST)
Subject: Re: [PATCH v2 08/12] ASoC: arizona-jack: convert into a helper
 library for codec drivers
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20210117160555.78376-1-hdegoede@redhat.com>
 <20210117160555.78376-9-hdegoede@redhat.com>
 <CAHp75VeSqVYWE9o-6JwY+pmjU7nfBJwZvaSk0v-ngjeGMMxQAQ@mail.gmail.com>
 <e902dc43-42d1-c90b-98df-d054a72a5558@opensource.cirrus.com>
 <5c1f181f-f074-397d-cdba-d37ab58f9a2b@redhat.com>
 <20210122112607.GH106851@ediswmail.ad.cirrus.com>
 <4274589c-9a52-7f1a-f937-1c5d60b76559@redhat.com>
 <20210122130412.GI106851@ediswmail.ad.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5436af42-e6d1-b0ed-7f16-60658b590919@redhat.com>
Date: Fri, 22 Jan 2021 14:36:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210122130412.GI106851@ediswmail.ad.cirrus.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On 1/22/21 2:04 PM, Charles Keepax wrote:
> On Fri, Jan 22, 2021 at 01:23:44PM +0100, Hans de Goede wrote:
>> On 1/22/21 12:26 PM, Charles Keepax wrote:
>>> On Thu, Jan 21, 2021 at 05:55:00PM +0100, Hans de Goede wrote:
>>>> On 1/19/21 10:51 AM, Richard Fitzgerald wrote:
>>>>> On 18/01/2021 17:24, Andy Shevchenko wrote:
>>>>>> On Sun, Jan 17, 2021 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>> Note there is a pretty big issue with the original code here, if
>>>> the MICVDD DAPM pin is on for an internal-mic and then we run through the
>>>> jack-detect mic-detect sequence, we end up setting
>>>> bypass=true causing the micbias for the internal-mic to no longer
>>>> be what was configured. IOW poking the bypass setting underneath the
>>>> DAPM code is racy.
>>>>
>>>
>>> The regulator bypass code keeps an internal reference count. All
>>> the users of the regulator need to allow bypass for it to be
>>> placed into bypass mode, so I believe this can't happen.
>>
>> Ah I did not know that, since the regulator_allow_bypass function
>> takes a bool rather then having enable/disable variants I thought
>> it would directly set the bypass, but you are right. So this is not
>> a problem, good.
>>
>> So this has made me look at the problem again and I believe that
>> a much better solution is to simply re-use the MICVDD regulator-reference
>> which has been regulator_get-ed by the dapm code when instantiating the:
>>
>> SND_SOC_DAPM_REGULATOR_SUPPLY("MICVDD", 0, SND_SOC_DAPM_REGULATOR_BYPASS),
>>
>> widget. So I plan to have a new patch in v3 of the series which replaces
>> the devm_regulator_get with something like this:
>>
>> 	/*
>>  	 * There is a DAPM widget for the MICVDD regulator, since
>> 	 * the button-press detection has special requirements wrt
>> 	 * the regulator bypass settings we cannot directly
>> 	 * use snd_soc_component_force_enable_pin("MICVDD") /
>> 	 * snd_soc_component_disable_pin("MICVDD").
>> 	 *
>> 	 * Instead we lookup the widget's regulator reference here
>> 	 * and use that to directly control the regulator.
>> 	 * Both the regulator's enable and bypass settings are
>> 	 * ref-counted so this will not interfere with the DAPM use
>> 	 * of the regulator.
>> 	 */
>> 	for_each_card_widgets(dapm->card, w) {
>> 		if (!strcmp(w->name, "MICVDD"))
>> 			info->micvdd_regulator = w->regulator;
>> 			break;
>> 		}
>> 	}
>>
>> (note I've not tested this yet, but I expect this to work fine).
>>
> 

<note replying in a singe email to 2 strongly related
 replies from Charles on this>

> Alas this won't work either. When I say reference count that
> isn't quite a totally accurate reflection of the usage of the
> function. When you call allow_bypass you are saying as this
> consumer of the regulator I don't mind if it goes into bypass.
> Then if all consumers agree the regulator will be put into
> bypass. So it is comparing the reference count to the number of
> consumers the regulator has to make a decision.
> 
> If you call allow_bypass independently from the jack detection
> code and the ASoC framework on the same consumer, as you
> describe here you will get bad effects.  For example the
> regulator has two consumers, our CODEC driver and some other
> device. If our codec driver calls allow_bypass twice, then
> the regulator would go into bypass without the other consumer
> having approved it would could be fatal to that device.

So I just double checked the regulator core code and you
are right that the bypass thing is per consumer. So we
will indeed need 2 calls to regulator_get, one for the
dapm use and one for the jack-det use since those 2
are independent.

Note your example does not work as you think it will though:

int regulator_allow_bypass(struct regulator *regulator, bool enable)
{
	...

        if (enable && !regulator->bypass) {
                rdev->bypass_count++;
		...

        } else if (!enable && regulator->bypass) {
                rdev->bypass_count--;
		...
	}

        if (ret == 0)
                regulator->bypass = enable;
}

So a second call to allow_bypass(..., true) from the same
consumer will be a no-op.

Sharing the same struct regulator result between the dapm widget
and the jack-det code would still be an issue though since it
will introduce the race which I was worried about earlier.

>> 1. Keep the code as is, live with the debugfs error. This might be
>> best for now, as I don't want to grow the scope of this series too much.
>> I will go with this for the next version of this series (unless
>> I receive feedback otherwise before I get around to posting the next
>> version).
>
> I wonder if this commit was related to that:
> 
> commit ff268b56ce8c ("regulator: core: Don't spew backtraces on duplicate sysfs")
> 
> Apologies I don't have as much time as I normally would to look
> into such issues at the moment, due to various internal company
> things going on.

Actually you are being super helpful, thank you. I believe that
with your latest email this is fully resolved.

> I do suspect that this option is the way to go though and if
> there are issues of duplicates being created by the regulator
> core those probably need to be resolved in there. But that can
> probably be done separate from this series.

Good catch, thanks. This means that having multiple consumers /
regulator_get calls from the same consumer-dev is supposed to work
and the debugfs error needs to be silenced somehow. I will look
into silencing the error (as a patch separate from this series).

Regards,

Hans

