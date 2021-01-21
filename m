Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A912FF129
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 17:56:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF24818F5;
	Thu, 21 Jan 2021 17:55:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF24818F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611248206;
	bh=G0wyBrrOkCcl5fWw0I4gz+b1K48JemP3sYoa7hdH1R0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F5Lxq4CtkGtz5T7n1xRN5SVA7gNuYcPoBuWDHlDXpeAgtL+28Py0ciAJMoO2WGS54
	 6wJ4pCwC5mAn1MJIJfWgZQSd1ehxlhjCZM1l8NWtpeWgWNqh1TCc9BM4c47lizOHig
	 YW+BZWzSL+lOhFCFiGOSPHxRNDWNBJwUn/GDFrZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17A0CF80164;
	Thu, 21 Jan 2021 17:55:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56DD2F80257; Thu, 21 Jan 2021 17:55:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF76BF80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 17:55:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF76BF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="RBMaEKbW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611248105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxyZhHcJU1Z9o3xQYjnDccoDWbBW4t+yDQbyynXh+QQ=;
 b=RBMaEKbWaMqBWy6Qm/r/dZu0e4LEsFCOJY5x4oqnoRy/GK0Ax2fvR/lMme8liRnOShAykq
 LaML1durUQ8PqldvVzLvT55TFoW/3y2pwL/SJS69RSyhHYP8O7uMSxXZsnniL2tDFDJ8Dg
 ZDKKWDP7/FYiabaR84q9C1qeyIEp2ZA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-MWnTC9LIMfG4pgP6y7Z5_Q-1; Thu, 21 Jan 2021 11:55:04 -0500
X-MC-Unique: MWnTC9LIMfG4pgP6y7Z5_Q-1
Received: by mail-ed1-f70.google.com with SMTP id w4so1471187edu.0
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 08:55:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pxyZhHcJU1Z9o3xQYjnDccoDWbBW4t+yDQbyynXh+QQ=;
 b=q+Ju2/vYK6CR1OuVPv0hJhGAPjyiknvechfFZYpEzIvq1FckH9yY+WjhVRRNQ07P+K
 ikTsDaoACeEE0DUb301A0eB14p151RfDjicIIP/WPHzLbfcCm73iHMFIYFtJdn/tnNVP
 uF7cxCyqUSx+0oui1FJ9BaRxeI0MKL4lf1qdc7ckkEUpntk6eU/83hxqNxwYtGW6rxGI
 OiYUO2bJCquSoIUytXhDn5PELZ9P/prN0+0uDyfyaAHwZQR91wgEGt8VJjZLSUNd4lAn
 3RcZByNYU2qjPaz48bDAq3xO1fuamfLvrLFf6phyjo/QTZGLWVCZih9EYY26F9UAwrua
 Px4g==
X-Gm-Message-State: AOAM532QoE4/sG3bpzZOyslkQ8FhJlqQe7Q7FjrXbpUlTk+IG5NHdqRf
 mBk9TrrwM77wUS9oZVORSv+KhhKoIHJd+1S9uRanS/sG/yIjbpYxDx/o7Z5qxHm6V+8X0t4gBTs
 XvIEPUS5VoabwfYBRprzN3fyK9WbRgm8LymoSjTt0XeA6TGRGv1KZyi8iCjBmgMbbQIKdVHzgmv
 w=
X-Received: by 2002:a17:906:7f83:: with SMTP id
 f3mr261921ejr.282.1611248101710; 
 Thu, 21 Jan 2021 08:55:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4oR8RJKs/LKAaJdaQy1GbjXShm+ss4W95e/UIk6bmEVKd7WLky3XD1Y9LMneh7K1UbBwNMw==
X-Received: by 2002:a17:906:7f83:: with SMTP id
 f3mr261888ejr.282.1611248101411; 
 Thu, 21 Jan 2021 08:55:01 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id x5sm3176866edi.35.2021.01.21.08.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 08:55:00 -0800 (PST)
Subject: Re: [PATCH v2 08/12] ASoC: arizona-jack: convert into a helper
 library for codec drivers
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210117160555.78376-1-hdegoede@redhat.com>
 <20210117160555.78376-9-hdegoede@redhat.com>
 <CAHp75VeSqVYWE9o-6JwY+pmjU7nfBJwZvaSk0v-ngjeGMMxQAQ@mail.gmail.com>
 <e902dc43-42d1-c90b-98df-d054a72a5558@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5c1f181f-f074-397d-cdba-d37ab58f9a2b@redhat.com>
Date: Thu, 21 Jan 2021 17:55:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e902dc43-42d1-c90b-98df-d054a72a5558@opensource.cirrus.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
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

On 1/19/21 10:51 AM, Richard Fitzgerald wrote:
> On 18/01/2021 17:24, Andy Shevchenko wrote:
>> On Sun, Jan 17, 2021 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Convert the arizona extcon driver into a helper library for direct use
>>> from the arizona codec-drivers, rather then being bound to a separate
>>> MFD cell.
>>>
>>> Note the probe (and remove) sequence is split into 2 parts:
>>>
>>> 1. The arizona_jack_codec_dev_probe() function inits a bunch of
>>> jack-detect specific variables in struct arizona_priv and tries to get
>>> a number of resources where getting them may fail with -EPROBE_DEFER.
>>>
>>> 2. Then once the machine driver has create a snd_sock_jack through
>>> snd_soc_card_jack_new() it calls snd_soc_component_set_jack() on
>>> the codec component, which will call the new arizona_jack_set_jack(),
>>> which sets up jack-detection and requests the IRQs.
>>>
>>> This split is necessary, because the IRQ handlers need access to the
>>> arizona->dapm pointer and the snd_sock_jack which are not available
>>> when the codec-driver's probe function runs.
>>>
>>> Note this requires that machine-drivers for codecs which are converted
>>> to use the new helper functions from arizona-jack.c are modified to
>>> create a snd_soc_jack through snd_soc_card_jack_new() and register
>>> this jack with the codec through snd_soc_component_set_jack().
>>
>> ...
>>
>>> +int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
>>>   {
>>> -       struct arizona *arizona = dev_get_drvdata(pdev->dev.parent);
>>> +       struct arizona *arizona = info->arizona;
>>>          struct arizona_pdata *pdata = &arizona->pdata;
>>
>>> +       int ret, mode;
>>>
>>>          if (!dev_get_platdata(arizona->dev))
>>> -               arizona_extcon_device_get_pdata(&pdev->dev, arizona);
>>> +               arizona_extcon_device_get_pdata(dev, arizona);
>>>
>>> -       info->micvdd = devm_regulator_get(&pdev->dev, "MICVDD");
>>> +       info->micvdd = devm_regulator_get(arizona->dev, "MICVDD");
>>
>> I'm wondering if arizona->dev == dev here. if no, can this function
>> get a comment / kernel-doc explaining what dev is?
>>
> 
> pdev->dev would be *this* driver.
> arizona->dev should be the MFD parent driver.
> 
> I think these gets should be against the dev passed in as argument
> (I assume that is the caller's pdev->dev). So they are owned by this
> driver, not its parent.

Right, this is all correct.

The reason why I used arizona->dev instead of dev for the devm_regulator_get()
is because the codec code already does a regulator_get for MICVDD through:

SND_SOC_DAPM_REGULATOR_SUPPLY("MICVDD", 0, SND_SOC_DAPM_REGULATOR_BYPASS),

And doing it again leads to an error being logged about trying to
create a file in debugs with a name which already exists, because now
we do a regulator_get("MICVDD") with the same consumer twice.

But I now see that I overlooked the devm part, turning my "fix" from
a cute hack to just being outright wrong.

So there are a number of solutions here:


1. Keep the code as is, live with the debugfs error. This might be
best for now, as I don't want to grow the scope of this series too much.
I will go with this for the next version of this series (unless
I receive feedback otherwise before I get around to posting the next
version).


2. Switch the arizona-jack code from directly poking the regulator
to using snd_soc_component_force_enable_pin("MICVDD") and
snd_soc_component_disable_pin("MICVDD"). I like this, but there is
one downside, the dapm code assumes that when the regulator is
enabled the bypass must be disabled:

int dapm_regulator_event(struct snd_soc_dapm_widget *w,
                   struct snd_kcontrol *kcontrol, int event)
{
        int ret;

        soc_dapm_async_complete(w->dapm);

        if (SND_SOC_DAPM_EVENT_ON(event)) {
                if (w->on_val & SND_SOC_DAPM_REGULATOR_BYPASS) {
                        ret = regulator_allow_bypass(w->regulator, false);
                        if (ret != 0)
                                dev_warn(w->dapm->dev,
                                         "ASoC: Failed to unbypass %s: %d\n",
                                         w->name, ret);
                }

                return regulator_enable(w->regulator);
        } else {
		...

Which is good when the MICBIAS# are being used for recording,
or for detecting the type of device being plugged in. But when
just doing button-press detection, then we can use a combination
of bypass=true, enabled=true (Note enabled=false completely disables
MICVDD independent of the bypass setting). This uses less energy
then bypass=false, enabled=true. So ATM the jack/extcon code
does this:

        if (info->detecting) {
                ret = regulator_allow_bypass(info->micvdd, false);
                if (ret != 0) {
                        dev_err(arizona->dev,
                                "Failed to regulate MICVDD: %d\n",
                                ret);
                }
        }

        ret = regulator_enable(info->micvdd);
        if (ret != 0) {
                dev_err(arizona->dev, "Failed to enable MICVDD: %d\n",
                        ret);
        }

When enabling MIC-current / button-press IRQs.

If we switch to using snd_soc_component_force_enable_pin("MICVDD") and
snd_soc_component_disable_pin("MICVDD") we loose the power-saving
of using the bypass when we only need MICVDD for button-press
detection.

Note there is a pretty big issue with the original code here, if
the MICVDD DAPM pin is on for an internal-mic and then we run through the
jack-detect mic-detect sequence, we end up setting
bypass=true causing the micbias for the internal-mic to no longer
be what was configured. IOW poking the bypass setting underneath the
DAPM code is racy.

Keeping in mind that switching to force_enable fixes the current racy code,
as well as the KISS-ness of this solution, I personally prefer this option
over option 1 as it makes the code cleaner and more correct.
I could easily do this in a next version of this series if people agree
with going this route.


3. Stop using SND_SOC_DAPM_REGULATOR_SUPPLY for MICVDD, instead making
it a custom DAPM source pin, with an event callback and do have 2
ref-counts for the regulator settings, 1 bypass_disable refcount,
where we enable the bypass if this reaches 0 and if either the
jack-detect or DAPM says the bypass must be disabled then we
disable it. and a second refcount for if the regulator itself
needs to be enabled / disabled (which is already present inside
the regulator-core code, so we don't need to duplicate this).

This solution would be the best solution as making bypass_disable
a refcount-like setting would fix the race, while keeping the
power-saving. This is however best done after the jack-detect
code has been moved from being a separate driver to being part
of the codec drivers. So this is best left as a follow-up to
this series IMHO.

Regards,

Hans

