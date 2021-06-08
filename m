Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C8739F22F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 11:21:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5EB916AD;
	Tue,  8 Jun 2021 11:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5EB916AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623144066;
	bh=iM2MBR9ifHWxsT1gXEy0PiiL1SbSV4RGLnzBlmuVKM4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=coNri8E8luaGEMGWiE/oq6slcH2O5dNn78GZ3SngT78JBpxQ0KS95dh2yh4hKegsv
	 Cl0D6qqYDZfHVS+fUevq+jpf64oxahKE6XlfTZZkbTO6btlk4uo9FuJkJQj48pYS/a
	 nNEGR0Wx1ZKZaNLTR+7U0w32/DuOhtknzJ+0lzCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26422F8019B;
	Tue,  8 Jun 2021 11:19:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28B78F80218; Tue,  8 Jun 2021 11:19:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E5FCF8019B
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 11:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E5FCF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="LkeALtCa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623143968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GE7+6gpfNWrII839LUTf0uIxqI+VNSSjkebjLSoOYXA=;
 b=LkeALtCazKTtBEOd7fGUh/euFk5oR8YSzLrX2PqG+zjVvcuFUmk+KSLu8x9fgt9CBebYYN
 IofWf3308MnauvpxAo0Q6Qc6ZVGNhDSmNaZ0kZ35yi40ZCqxjE7NGf0zn7vPx/j5PloC2s
 X3rkBKaOhNC08juyTFJdcFptADQHiGA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-RMsaYsrDN1CiVy0v9CRdOw-1; Tue, 08 Jun 2021 05:19:27 -0400
X-MC-Unique: RMsaYsrDN1CiVy0v9CRdOw-1
Received: by mail-ej1-f71.google.com with SMTP id
 o5-20020a1709068605b02904034c0d7648so4770041ejx.8
 for <alsa-devel@alsa-project.org>; Tue, 08 Jun 2021 02:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GE7+6gpfNWrII839LUTf0uIxqI+VNSSjkebjLSoOYXA=;
 b=H/8UEdRvbO8g1eqal1wf0yGmmvGmmPme6NlwWmSkceeG9r3rDmuBfPuOd9cc745l4P
 ZSBlbp20PtHDHCLIguKCwgr8WIC7lGbUL6u3Q7AjlL5TQ83a0RvG0AmPfAtrU7yit7C1
 PFgi3LDGvm5YkYC0CJNQnbtFkwNJZU8jOosZ5y5qqlkr3mPfvFo35+vR/B/BWT2xDuX6
 0kEZB7TZtplNkmFJR7DqrCdzzVT4UdXGE23uQtFCG1qJE2Ik9LWyTs5rPjDFeTYwDBsm
 ffPaCRJY2Icdmwh9WeBfi0NfxUlQuxpRNA1ZWErXU0JDE9aaDsAoGLO/1zzvk06VIBlW
 3/mQ==
X-Gm-Message-State: AOAM530VIGev477Te4K6aE9rmZVol3ZUb10Ppr9VBIJet1vJUNX1N5GL
 KZFo+DqAv0d4/O3YGJN6u/OCx944WH8OUmnEm1PDQ8g9ZTknq/N18DNmcNwFUj2Y/iVA13Zf12p
 MLfYiZfERwu9krA/nh9u1ifs=
X-Received: by 2002:a05:6402:1e8b:: with SMTP id
 f11mr11529050edf.86.1623143965924; 
 Tue, 08 Jun 2021 02:19:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPqlX+/8JSaX8tEc1nadWbXMygDP3gPQTzrE/qD4ZhiFOVDqh94K3X8tezTgXdH3hVlIEMmA==
X-Received: by 2002:a05:6402:1e8b:: with SMTP id
 f11mr11529036edf.86.1623143965721; 
 Tue, 08 Jun 2021 02:19:25 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id u17sm8574090edx.16.2021.06.08.02.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 02:19:25 -0700 (PDT)
Subject: Re: [PATCH 2/2] ASoC: Intel: boards: use software node API in Atom
 boards
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20210607223503.584379-1-pierre-louis.bossart@linux.intel.com>
 <20210607223503.584379-3-pierre-louis.bossart@linux.intel.com>
 <0e8e01f6-d249-cc3e-2020-f6e5c81a4732@redhat.com>
 <YL8yE/HwJHJwkR66@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5419b5c4-2fb7-4b79-ef6b-7da5ade0d439@redhat.com>
Date: Tue, 8 Jun 2021 11:19:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YL8yE/HwJHJwkR66@smile.fi.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
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

On 6/8/21 11:02 AM, Andy Shevchenko wrote:
> On Tue, Jun 08, 2021 at 10:18:08AM +0200, Hans de Goede wrote:
>> On 6/8/21 12:35 AM, Pierre-Louis Bossart wrote:
>>> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>>
>>> The function device_add_properties() is going to be removed.
>>> Replacing it with software node API equivalents.
> 
> ...
> 
>>> +	device_remove_software_node(priv->codec_dev);
>>
>> This is a problem, nothing guarantees codec_dev not going away before
>> snd_byt_cht_es8316_mc_remove() runs. Although the only thing which I can come up
>> with where this happens is unbinding the i2c-controller driver I still would like
>> us to take this scenario into account.
>>
>> I think it would be better to use device_create_managed_software_node() to tie
>> the lifetime of the swnode to the lifetime of the device, this also removes
>> the need for all the goto err cases (and introducing a remove function in
>> the bytcr_rt5640.c case).
> 
> Which device? If you are telling about codec, the unload-load of the machine
> driver won't be successful or will produce a leak / warning / etc.

Yes I'm talking about the codec, and yes if the codec device goes away before
the machine-driver is unbound things will likely already break. But the
machine driver does not hold any explicit reference on the codec-device,
so this might happen (I guess there might be a reference somewhere inside the
ASoC code once devm_snd_soc_register_card() has returned successfully).

> If you are telling about machine related device, it simply doesn't belong to it.
> 
> Am I got all this right?
> 
>> This does mean that we could end up calling device_create_managed_software_node()
>> on the same device twice, when the machine driver gets unbound + rebound, but
>> that is an already existing issue with our current device_add_properties() usage.
> 
> Yep.
> 
>> We could fix this (in a separate commit since it is an already existing issue)
>> by adding a PROPERTY_ENTRY_BOOL("cht_es8316,swnode-created") property to the
>> properties and checking for that being set with
>> device_property_read_bool(codec, "cht_es8316,swnode-created")
> 
> Not sure it's a good idea, this sounds like a hack.

Right, which is why I also suggested that device_create_managed_software_node()
could be modified to fail when called a second time on the same device, this
is a check which probably would be good to add regardless. More specifically
I guess that set_secondary_fwnode() could be made to return an error when replacing
an existing secondary fwnode with a non NULL value, rather then just replacing it.

>> Or we could move the device_put(codec_dev) to snd_byt_cht_es8316_mc_remove().
> 
> This sounds better.

As I already mentioned I'm not a fan of all the goto err-s these patches
introduce, this won't fix that.

Regards,

Hans

