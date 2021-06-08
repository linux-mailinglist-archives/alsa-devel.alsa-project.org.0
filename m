Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8496839F715
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 14:48:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED20316E7;
	Tue,  8 Jun 2021 14:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED20316E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623156513;
	bh=EOoeDJ5mqHpUVWyCp5EbRvfMgq9kPzVQzBEyicIJ/lk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NJtmWW9fdeZEfZ2zIWOhqtCRPLi/Yo18LEwZJTeNBcydXHwvShjWpEriWbOKjIHHT
	 O6Kti7oE7cnsrOLCEzV0HqJI7sLj0I8HAGeN8idiPNU0KK5efUgjKsXJ6HZZTLTKbV
	 3RQzYRtS54QCezC3stVVgcMXT2nBOAWidCgg2Qtw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA2FBF80256;
	Tue,  8 Jun 2021 14:47:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22223F801EC; Tue,  8 Jun 2021 14:47:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5FBAF800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5FBAF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="M2mDT1L4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623156454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RZHySvU0mp6w1WjU4HPM/uwDdeOMc50hAoF1JziKos=;
 b=M2mDT1L4OZOuAJ+siAu7ezG2+bZI7QWifu+UsAB1sZ4NL5E0b4RgU5noTx1oYuyegOAMv+
 zSvSLyOlOX6TC4zU+bKBjiUwz+Zf7qhYRKbQ+gxPAFuzH0wXUCgQ9VMs7xFcmHpu2DwWmg
 9KIZRPqEaKScl+r0df55N/nQP5nJFk8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-zMJOVnfnMKG1hguw-txRwg-1; Tue, 08 Jun 2021 08:47:32 -0400
X-MC-Unique: zMJOVnfnMKG1hguw-txRwg-1
Received: by mail-ed1-f69.google.com with SMTP id
 y18-20020a0564022712b029038ffac1995eso10844221edd.12
 for <alsa-devel@alsa-project.org>; Tue, 08 Jun 2021 05:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9RZHySvU0mp6w1WjU4HPM/uwDdeOMc50hAoF1JziKos=;
 b=j6DSmsR/K4vQMwWSL8EgOD2FcMSGmYVBcmPDhHJUCvCLE+Tz71u30EKXyTjSTEIuIS
 bvjadCrq7kP3cx1VIam77HwYwqJDRKyu67F+TltQbRMzkOv7/y8XKQ7dF1/ABmtWypC9
 ccn1ZbPuQ/u+sIxrYNjBMwXk62AJjqvv7saN6ZnblNEJEsrVnISJOI1k49eRHuH88ZhW
 M1txJqNOGHApZ70UYDi/xkhE0nLmph2MYEIiwRFR7tjeiMCwNIIEKaNB6XRIuH+Nqd5+
 v8vfeCy1S2uvwSg37EatzSEuXBUcE9AUo9pGu+zehFMyDG6NEmp+I/ynHfyn7PC1Zcnv
 vsQA==
X-Gm-Message-State: AOAM530weAQAjYvZRkQk4FbyAZBzGfivFblbohL6BGXVVKRCLOL/PGFV
 msEndtDFLOmTwOdRVaJzPNiAtrOj114Lxa+bdiXp1JzF/BEWdN/eITx71xZ2qCTHUAnV/2qL+5J
 sO815MIjYfVi/oCqHQx1A6hQ=
X-Received: by 2002:a17:906:22c8:: with SMTP id
 q8mr22566930eja.12.1623156451657; 
 Tue, 08 Jun 2021 05:47:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx13DMR2MOCVpau0FA62HXany9AF0ipDoypUJe4b2WUJULM/GVbJrNqzhjIMcUwbEA7/s4uRA==
X-Received: by 2002:a17:906:22c8:: with SMTP id
 q8mr22566918eja.12.1623156451510; 
 Tue, 08 Jun 2021 05:47:31 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id i25sm3089047ejg.103.2021.06.08.05.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 05:47:31 -0700 (PDT)
Subject: Re: [PATCH 2/2] ASoC: Intel: boards: use software node API in Atom
 boards
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20210607223503.584379-1-pierre-louis.bossart@linux.intel.com>
 <20210607223503.584379-3-pierre-louis.bossart@linux.intel.com>
 <0e8e01f6-d249-cc3e-2020-f6e5c81a4732@redhat.com>
 <a67817d5-5fd2-c5a5-e366-4e6534d2e4c9@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6a4838c5-4906-f6dc-fa07-09200a682876@redhat.com>
Date: Tue, 8 Jun 2021 14:47:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a67817d5-5fd2-c5a5-e366-4e6534d2e4c9@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 broonie@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

On 6/8/21 1:22 PM, Pierre-Louis Bossart wrote:
> 
>>>   static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
>>> @@ -617,6 +634,8 @@ static int snd_byt_cht_es8316_mc_remove(struct platform_device *pdev)
>>>       struct byt_cht_es8316_private *priv = snd_soc_card_get_drvdata(card);
>>>         gpiod_put(priv->speaker_en_gpio);
>>> +    device_remove_software_node(priv->codec_dev);
>>
>> This is a problem, nothing guarantees codec_dev not going away before
>> snd_byt_cht_es8316_mc_remove() runs. Although the only thing which I can come up
>> with where this happens is unbinding the i2c-controller driver I still would like
>> us to take this scenario into account.
> 
> Is this possible really? the codec driver will register a component that's used by the ASoC card, I was assuming that there was some sort of reference count already to prevent this unbinding from happening.

There might very well be some reference count elsewhere, but IMHO if the
machine-driver is going to keep a pointer to the device around it should
keep its own reference.

>> I think it would be better to use device_create_managed_software_node() to tie
>> the lifetime of the swnode to the lifetime of the device, this also removes
>> the need for all the goto err cases (and introducing a remove function in
>> the bytcr_rt5640.c case).
>>
>> This does mean that we could end up calling device_create_managed_software_node()
>> on the same device twice, when the machine driver gets unbound + rebound, but
>> that is an already existing issue with our current device_add_properties() usage.
>>
>> We could fix this (in a separate commit since it is an already existing issue)
>> by adding a PROPERTY_ENTRY_BOOL("cht_es8316,swnode-created") property to the
>> properties and checking for that being set with
>> device_property_read_bool(codec, "cht_es8316,swnode-created")
>>
>> Or we could move the device_put(codec_dev) to snd_byt_cht_es8316_mc_remove().
> 
> that sounds like a better plan if you want to manage explicit dependencies - regardless of how which API is used to manage properties.

Ok, so lets go with that then.

Regards,

Hans

