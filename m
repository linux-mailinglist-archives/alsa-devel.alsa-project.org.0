Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F35693002D4
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 13:25:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88F921DAD;
	Fri, 22 Jan 2021 13:24:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88F921DAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611318330;
	bh=nvQd7UdeioXwGCpfnAM5t+snsnt+97GeA9WILbgcfJA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fOJsZ9j7WrlR1724M+/2AQpikEUPFB9NPOUFWFsvn9bDfjAWcSTR4kHrYXVH2SWkO
	 LGrk7ui8E16N9hNWYlX639KYJqXNlCgEiLIpAAsar8uP3s/39CjOCb7JXT5CfLpq3J
	 Oyd+ruN2QQceoGF8DYAN/Qy4R5dbP9PP0fCK+WUA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB541F8015B;
	Fri, 22 Jan 2021 13:23:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE56CF8016E; Fri, 22 Jan 2021 13:23:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00D11F80129
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 13:23:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00D11F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="XTD51kI2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611318229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7b3zvbpY/n9kJJVosCpujp2jT4wMZCusOs0B3DM1KKA=;
 b=XTD51kI2tnglfSR7FcAO8UcX0FaUcjoofykEs5NQyHZhkleUponNTIKfyU2p9+yGoFqeOn
 7mCKc+0cbzN/st4hzAY2+NMKhI1X04sdSQpY3+WeLJbHXCWCjHh5GhWDQN5J0H6LDaJeor
 fi9fyeBD6Ni2CxojFMhAGj7tvaaTztA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-lBHtwwKlM1e0NmhCjViMYQ-1; Fri, 22 Jan 2021 07:23:47 -0500
X-MC-Unique: lBHtwwKlM1e0NmhCjViMYQ-1
Received: by mail-ed1-f70.google.com with SMTP id f21so2826877edx.23
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 04:23:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7b3zvbpY/n9kJJVosCpujp2jT4wMZCusOs0B3DM1KKA=;
 b=t6Bw3ZpdhYFSpxtiOpDwInG8ZEEGjhG3xBMwk5Q1iD2CqcYIkpcssR+D0UKq0fwsK/
 rXZ5EqOuYLqWFiAs84ifj8snJRevkr0zrkewbq26jIIefOOXL+vS/yFOA5zGEaLB6itV
 Y4JNxRJsPzpXOK1chYzc1NKCv3wqO2KGlE9kdmfjqV1aupSmGiy+qD8SLh7YYFd44NMq
 45phyl1iWl6+ny3ztSSIPSiacDkzdjmjDiU25ZCpRtB++aaZXDVXHPCweX+gYZNZp69x
 WJDG+k/oq3JVMdM83AFoYafJZu4z15sYny4QvNGgzdYtZ/Cyj2eFNfKBFPzClwWVX6Fi
 tBNQ==
X-Gm-Message-State: AOAM532IYEwlD5PZOIez8yUDMJLgeRr1cXUrxxlp5yFLtiA75Li3gC0X
 QgPMhaOw8HZSZ+GSKUSE0moIM08ied2+Lo/oKwJY+NXtMZyuYUvdrHIiYPzPWzp4eKl8Ja8DIiH
 qeK7UbZmkGDUL+u2SSV+lJJdr/PIFlNzzjzmB7IBDTbTmXmM53jtCArPxBjcaoMBCY7YOA8CR/+
 Y=
X-Received: by 2002:a05:6402:402:: with SMTP id
 q2mr3057833edv.116.1611318226302; 
 Fri, 22 Jan 2021 04:23:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxemtshMYQB0sIHcc8kjsbPlJYkp4XDvVf126fNP5CNzsYosbhIk4f4lZNJeTKwLN0nHGxRTA==
X-Received: by 2002:a05:6402:402:: with SMTP id
 q2mr3057802edv.116.1611318225849; 
 Fri, 22 Jan 2021 04:23:45 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id m10sm5013134edi.54.2021.01.22.04.23.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 04:23:45 -0800 (PST)
Subject: Re: [PATCH v2 08/12] ASoC: arizona-jack: convert into a helper
 library for codec drivers
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20210117160555.78376-1-hdegoede@redhat.com>
 <20210117160555.78376-9-hdegoede@redhat.com>
 <CAHp75VeSqVYWE9o-6JwY+pmjU7nfBJwZvaSk0v-ngjeGMMxQAQ@mail.gmail.com>
 <e902dc43-42d1-c90b-98df-d054a72a5558@opensource.cirrus.com>
 <5c1f181f-f074-397d-cdba-d37ab58f9a2b@redhat.com>
 <20210122112607.GH106851@ediswmail.ad.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <4274589c-9a52-7f1a-f937-1c5d60b76559@redhat.com>
Date: Fri, 22 Jan 2021 13:23:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210122112607.GH106851@ediswmail.ad.cirrus.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 1/22/21 12:26 PM, Charles Keepax wrote:
> On Thu, Jan 21, 2021 at 05:55:00PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 1/19/21 10:51 AM, Richard Fitzgerald wrote:
>>> On 18/01/2021 17:24, Andy Shevchenko wrote:
>>>> On Sun, Jan 17, 2021 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>
>>>>> Convert the arizona extcon driver into a helper library for direct use
>>>>> from the arizona codec-drivers, rather then being bound to a separate
>>>>> MFD cell.
>>>>>
>>>>> Note the probe (and remove) sequence is split into 2 parts:
>>>>>
>>>>> 1. The arizona_jack_codec_dev_probe() function inits a bunch of
>>>>> jack-detect specific variables in struct arizona_priv and tries to get
>>>>> a number of resources where getting them may fail with -EPROBE_DEFER.
>>>>>
>>>>> 2. Then once the machine driver has create a snd_sock_jack through
>>>>> snd_soc_card_jack_new() it calls snd_soc_component_set_jack() on
>>>>> the codec component, which will call the new arizona_jack_set_jack(),
>>>>> which sets up jack-detection and requests the IRQs.
>>>>>
>>>>> This split is necessary, because the IRQ handlers need access to the
>>>>> arizona->dapm pointer and the snd_sock_jack which are not available
>>>>> when the codec-driver's probe function runs.
>>>>>
>>>>> Note this requires that machine-drivers for codecs which are converted
>>>>> to use the new helper functions from arizona-jack.c are modified to
>>>>> create a snd_soc_jack through snd_soc_card_jack_new() and register
>>>>> this jack with the codec through snd_soc_component_set_jack().
>>>>
>>>> ...
>>>>
>>>>> +int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
>>>>>   {
>>>>> -       struct arizona *arizona = dev_get_drvdata(pdev->dev.parent);
>>>>> +       struct arizona *arizona = info->arizona;
>>>>>          struct arizona_pdata *pdata = &arizona->pdata;
>>>>
>>>>> +       int ret, mode;
>>>>>
>>>>>          if (!dev_get_platdata(arizona->dev))
>>>>> -               arizona_extcon_device_get_pdata(&pdev->dev, arizona);
>>>>> +               arizona_extcon_device_get_pdata(dev, arizona);
>>>>>
>>>>> -       info->micvdd = devm_regulator_get(&pdev->dev, "MICVDD");
>>>>> +       info->micvdd = devm_regulator_get(arizona->dev, "MICVDD");
>>>>
>>>> I'm wondering if arizona->dev == dev here. if no, can this function
>>>> get a comment / kernel-doc explaining what dev is?
>>>>
>>>
>>> pdev->dev would be *this* driver.
>>> arizona->dev should be the MFD parent driver.
>>>
>>> I think these gets should be against the dev passed in as argument
>>> (I assume that is the caller's pdev->dev). So they are owned by this
>>> driver, not its parent.
>>
>> Right, this is all correct.
>>
>> The reason why I used arizona->dev instead of dev for the devm_regulator_get()
>> is because the codec code already does a regulator_get for MICVDD through:
>>
>> SND_SOC_DAPM_REGULATOR_SUPPLY("MICVDD", 0, SND_SOC_DAPM_REGULATOR_BYPASS),
>>
>> And doing it again leads to an error being logged about trying to
>> create a file in debugs with a name which already exists, because now
>> we do a regulator_get("MICVDD") with the same consumer twice.
>>
>> But I now see that I overlooked the devm part, turning my "fix" from
>> a cute hack to just being outright wrong.
>>
> 
> Aye we should definitely drop the devm here.

We can keep the devm as long as we pass the codec child-device as dev
parameter, this will introduce the mentioned debugfs error getting
logged, but other then the logging of that error being a bit
ugly it is harmless .

But see below.


>> So there are a number of solutions here:
>>
>>
>> 1. Keep the code as is, live with the debugfs error. This might be
>> best for now, as I don't want to grow the scope of this series too much.
>> I will go with this for the next version of this series (unless
>> I receive feedback otherwise before I get around to posting the next
>> version).
>>
> 
> Not ideal but as you say might be the best thing for now.

Ack, but again see below.


>> 2. Switch the arizona-jack code from directly poking the regulator
>> to using snd_soc_component_force_enable_pin("MICVDD") and
>> snd_soc_component_disable_pin("MICVDD"). I like this, but there is
>> one downside, the dapm code assumes that when the regulator is
>> enabled the bypass must be disabled:
>>
> ...
>>
>> When enabling MIC-current / button-press IRQs.
>>
>> If we switch to using snd_soc_component_force_enable_pin("MICVDD") and
>> snd_soc_component_disable_pin("MICVDD") we loose the power-saving
>> of using the bypass when we only need MICVDD for button-press
>> detection.
>>
> 
> Yeah we really don't want to force the micbias's to be regulated
> during button detect, so I think this option has to go.

Ok.


>> Note there is a pretty big issue with the original code here, if
>> the MICVDD DAPM pin is on for an internal-mic and then we run through the
>> jack-detect mic-detect sequence, we end up setting
>> bypass=true causing the micbias for the internal-mic to no longer
>> be what was configured. IOW poking the bypass setting underneath the
>> DAPM code is racy.
>>
> 
> The regulator bypass code keeps an internal reference count. All
> the users of the regulator need to allow bypass for it to be
> placed into bypass mode, so I believe this can't happen.

Ah I did not know that, since the regulator_allow_bypass function
takes a bool rather then having enable/disable variants I thought
it would directly set the bypass, but you are right. So this is not
a problem, good.

So this has made me look at the problem again and I believe that
a much better solution is to simply re-use the MICVDD regulator-reference
which has been regulator_get-ed by the dapm code when instantiating the:

SND_SOC_DAPM_REGULATOR_SUPPLY("MICVDD", 0, SND_SOC_DAPM_REGULATOR_BYPASS),

widget. So I plan to have a new patch in v3 of the series which replaces
the devm_regulator_get with something like this:

	/*
 	 * There is a DAPM widget for the MICVDD regulator, since
	 * the button-press detection has special requirements wrt
	 * the regulator bypass settings we cannot directly
	 * use snd_soc_component_force_enable_pin("MICVDD") /
	 * snd_soc_component_disable_pin("MICVDD").
	 *
	 * Instead we lookup the widget's regulator reference here
	 * and use that to directly control the regulator.
	 * Both the regulator's enable and bypass settings are
	 * ref-counted so this will not interfere with the DAPM use
	 * of the regulator.
	 */
	for_each_card_widgets(dapm->card, w) {
		if (!strcmp(w->name, "MICVDD"))
			info->micvdd_regulator = w->regulator;
			break;
		}
	}

(note I've not tested this yet, but I expect this to work fine).

Regards,

Hans

