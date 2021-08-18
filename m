Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B613F0867
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 17:48:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BFDA1696;
	Wed, 18 Aug 2021 17:47:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BFDA1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629301686;
	bh=C3Ut9dOnvLpgki+5FqRitnj18iNJhFhR3cDR4O2VXN4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ESZhtN0yx+bJMixIwkKezJmhm2TJ3M/9kLNqOyt8pKEfRKloleoiqhTagXqTcxZg9
	 yRYZh7EMB+lsi6FGCDMF4WKCSjQ0Eo7PiQJh7P4cYxqtWJTiPqFa64p/+Fm7RSWiB/
	 6pTNNCKGRIoVmoLJWa9Kk6Yo/WZUdH5hn6d1Nmrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDA9BF800EC;
	Wed, 18 Aug 2021 17:46:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DBFFF80249; Wed, 18 Aug 2021 17:46:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA366F80169
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 17:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA366F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="fN3SM0Hk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629301600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEMBHIOCtkeFpKRnw1u1I7IyWJZmrEux4HUIg3ePJao=;
 b=fN3SM0Hk2hPYJ1/ijYfI+PUZuDNwe2GruUVWcsrKpoCPivMw/CCwtqVwOMeETPe1yT1l+H
 ZEO9t8lBHHtp/4WLNbUU0jA0+IHjZ/lwsG41/OEDEavuP1qcyQpZP0rJX/rzeEdGozUnlp
 PG+iKXfFcNtPYqHZts/TUMYo2QD3eHU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-WoiUj90pO0GBgJV9H9un5Q-1; Wed, 18 Aug 2021 11:46:38 -0400
X-MC-Unique: WoiUj90pO0GBgJV9H9un5Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 e18-20020a0564020892b02903be9702d63eso1249284edy.17
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 08:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LEMBHIOCtkeFpKRnw1u1I7IyWJZmrEux4HUIg3ePJao=;
 b=MY57WMyq9L8zOl+UDcYt1+LtFvzzC5PvfA3QdoDmwo89n/w41DZDvVfA0vgLi28FcD
 L+kecgtUAdYYvDeG1bsH0daVvSvE0clsiZiS7s6W6OGA1lQCvlsf7JI5PqQLNllxrdwT
 O1kGXvaSGE7s3LcEFL7wXFai33hzrv1fFiV0A2CyhFz8ZqghkGB69A3Kwz1nQC12Zr4f
 2BzX/6GNYaig2jfHikAUivfHSoZKIT/d2hvwqeIi32YKE0m6Eqj+8xZ/bwYnznDcw3wU
 K2z8Bgt8LQnoh0N1v2NrcwPn/lFvRQpcN5bo1n4Dv7SCj3rtfFGb3UG8IdIXZHIcl4Vz
 M1wQ==
X-Gm-Message-State: AOAM530DXsMtjVty+63SLUVnyveqe1tmZfSnnfIx4pPtNT37Q3wNr6md
 lZby457zMzr5YoFBGjTstFkEg1RU3r2i708RyqL1kJKSaOtm7a3Lrc2Yu3+opxZR1iFYvtFN7ga
 O/F0z/uOYPKO3D2mkX3OtweY=
X-Received: by 2002:a05:6402:13cf:: with SMTP id
 a15mr10902426edx.117.1629301597548; 
 Wed, 18 Aug 2021 08:46:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWt+pROlZgcNaJolPH1CWkdxJ5L98BsLcrsM03TP9mXxEj6D7KvnFAV47XKJdZVOz5iEhfqw==
X-Received: by 2002:a05:6402:13cf:: with SMTP id
 a15mr10902397edx.117.1629301597385; 
 Wed, 18 Aug 2021 08:46:37 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id q18sm49329ejc.84.2021.08.18.08.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 08:46:37 -0700 (PDT)
Subject: Re: [PATCH 5/5] ASoC: Intel: bytcr_rt5640: Add support for HP Elite
 Pad 1000G2 jack-detect
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20210815154935.101178-1-hdegoede@redhat.com>
 <20210815154935.101178-6-hdegoede@redhat.com>
 <f29d3c63-05ef-73f6-760c-e1b715d96651@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <2ea10f32-8810-8257-845e-ec16835fbf19@redhat.com>
Date: Wed, 18 Aug 2021 17:46:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f29d3c63-05ef-73f6-760c-e1b715d96651@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Bard Liao <bard.liao@intel.com>
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

Hi Pierre-Louis,

On 8/16/21 3:31 PM, Pierre-Louis Bossart wrote:
> Hi Hans,
> I am a bit confused by the use of acpi_dev_add_driver_gpios().

I understand admittedly my solution there is a bit hacky.

> You call
> it from the dailink .init function, and you call
> acpi_dev_remove_driver_gpios() from the .exit function.
> 
>> @@ -1172,9 +1250,60 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
>>  		snd_soc_component_set_jack(component, &priv->jack, NULL);
>>  	}
>>  
>> +	if (byt_rt5640_quirk & BYT_RT5640_JD_HP_ELITEP_1000G2) {
>> +		ret = snd_soc_card_jack_new(card, "Headset",
>> +					    SND_JACK_HEADSET,
>> +					    &priv->jack, rt5640_pins,
>> +					    ARRAY_SIZE(rt5640_pins));
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = snd_soc_card_jack_new(card, "Headset 2",
>> +					    SND_JACK_HEADSET,
>> +					    &priv->jack2, rt5640_pins2,
>> +					    ARRAY_SIZE(rt5640_pins2));
>> +		if (ret)
>> +			return ret;
>> +
>> +		acpi_dev_add_driver_gpios(ACPI_COMPANION(priv->codec_dev),
>> +					  byt_rt5640_hp_elitepad_1000g2_gpios);
>> +
>> +		rt5640_jack_gpio.data = priv;
>> +		rt5640_jack_gpio.gpiod_dev = priv->codec_dev;
>> +		rt5640_jack_gpio.jack_status_check = byt_rt5640_hp_elitepad_1000g2_jack1_check;
>> +		ret = snd_soc_jack_add_gpios(&priv->jack, 1, &rt5640_jack_gpio);
>> +		if (ret) {
>> +			acpi_dev_remove_driver_gpios(ACPI_COMPANION(priv->codec_dev));
>> +			return ret;
>> +		}
>> +
>> +		rt5640_set_ovcd_params(component);
>> +		rt5640_jack2_gpio.data = component;
>> +		rt5640_jack2_gpio.gpiod_dev = priv->codec_dev;
>> +		rt5640_jack2_gpio.jack_status_check = byt_rt5640_hp_elitepad_1000g2_jack2_check;
>> +		ret = snd_soc_jack_add_gpios(&priv->jack2, 1, &rt5640_jack2_gpio);
>> +		if (ret) {
>> +			snd_soc_jack_free_gpios(&priv->jack, 1, &rt5640_jack_gpio);
>> +			acpi_dev_remove_driver_gpios(ACPI_COMPANION(priv->codec_dev));
>> +			return ret;
>> +		}
>> +	}
>> +
>>  	return 0;
>>  }
>>  
>> +static void byt_rt5640_exit(struct snd_soc_pcm_runtime *runtime)
>> +{
>> +	struct snd_soc_card *card = runtime->card;
>> +	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
>> +
>> +	if (byt_rt5640_quirk & BYT_RT5640_JD_HP_ELITEP_1000G2) {
>> +		snd_soc_jack_free_gpios(&priv->jack2, 1, &rt5640_jack2_gpio);
>> +		snd_soc_jack_free_gpios(&priv->jack, 1, &rt5640_jack_gpio);
>> +		acpi_dev_remove_driver_gpios(ACPI_COMPANION(priv->codec_dev));
>> +	}
>> +}
> 
> so far so good, but you also add/remove gpios in the machine driver probe

Ack.

>> @@ -1490,6 +1620,20 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
>>  		return -EPROBE_DEFER;
>>  	priv->codec_dev = get_device(codec_dev);
>>  
>> +	if (byt_rt5640_quirk & BYT_RT5640_JD_HP_ELITEP_1000G2) {
>> +		acpi_dev_add_driver_gpios(ACPI_COMPANION(priv->codec_dev),
>> +					  byt_rt5640_hp_elitepad_1000g2_gpios);

So this second add here (which runs first, so it really is the first add)

>> +		priv->hsmic_detect = devm_fwnode_gpiod_get(&pdev->dev, codec_dev->fwnode,
>> +							   "headset-mic-detect", GPIOD_IN,
>> +							   "headset-mic-detect");

Is to make sure this call can succeed.

>> +		acpi_dev_remove_driver_gpios(ACPI_COMPANION(priv->codec_dev));

And this is to not have to add yet an other error-exit path which does this
to the probe() function. By simply always removing the lookup here after the
gpiod_get() we keep the error-exit paths as they were, rather then making
them more complicated.

But I guess things won't be so bad wrt err-exit-path complexity as for
them to really be a problem, so if you prefer I can also:

1. Remove the second acpi_dev_add_driver_gpios + acpi_dev_remove_driver_gpios
pair from the dai_link .init/.exit.
2. Remove the acpi_dev_remove_driver_gpios(ACPI_COMPANION(priv->codec_dev) call here
moving it to snd_byt_rt5640_mc_remove()
3. Introduce a acpi_dev_remove_driver_gpios() remove in the error-exit paths
of snd_byt_rt5640_mc_probe where necessary.

>> +		if (IS_ERR(priv->hsmic_detect)) {
>> +			ret_val = PTR_ERR(priv->hsmic_detect);
>> +			dev_err_probe(&pdev->dev, ret_val, "getting hsmic-detect GPIO\n");
>> +			goto err_device;
>> +		}
>> +	}
> Does this part need to be part of the machine driver probe, or could it
> be moved in the dailink .init function?

The idea here is that the gpiod_get may fail with -EPROBE_DEFER and then I want
to fail as early as possible, so right in the probe function.

This is also why the error is logged with dev_err_probe() which does not
log anything for EPROBE_DEFER as retval.

> Is this because you wanted to use devm_ function?

No, I did consider adding the gpiod_get() for priv->hsmic_detect to the
dai_link .init function and then I would just use a normal get, combined
with an explicit _put in the dailink exit. I put this gpiod_get in
the platform_driver probe to handle EPROBE_DEFER early on, rather then
having it happen deep inside the devm_snd_soc_register_card() call-graph
(when it calls the dailink .init).

I would prefer to keep the gpiod_get inside snd_byt_rt5640_mc_probe for this
reason, but as mentioned I can removed the second acpi_dev_add_driver_gpios +
acpi_dev_remove_driver_gpios call pair from the dai_link .init/.exit.

Please let me know how you want to proceed with this.

Regards,

Hans

