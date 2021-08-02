Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FCC3DDBCF
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 17:04:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C10AC1737;
	Mon,  2 Aug 2021 17:03:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C10AC1737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627916639;
	bh=kyXJSBoXu42idd1yJgJsXu9d79+CmweetuDyZooJbUY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Evw2CIrM7Cf9LisA9400wMSPAyEUSNNeR5qxTDLRTjEvP3Zs+OINPblgTypJwZJq0
	 rYf+lUJfgHF5Lks2aVzZxikIouQ+39hVLBlkBIU0FiSrXb59dyxD66I7rQv5ApH9IF
	 wBwnnno3DEONTTC0hLL91Ue7R66cRS759o515S7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ABB8F80268;
	Mon,  2 Aug 2021 17:02:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED567F8025F; Mon,  2 Aug 2021 17:02:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C805CF8014D
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 17:02:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C805CF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="QBVi+Up4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627916546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IQn3lWKBIP82QpyroX3uD+kOwHQGWgUweHxb8LcCMQI=;
 b=QBVi+Up4qLWkgLRJ/f+qD8NnNwA0x1uBsnqhjGlW2ckCnge9NW57sfpvHjrOA1dggKLxRP
 w8ReNSLhwRdm3e9uCOWlLvPa/GcL02ghhEXJjnTWqzdgzQ4ogDQ+B/jVId02IPBW+rWQw5
 KK3+RKrSplZ7dtBO1uaXX7TG7APxgV4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-ypya3XWnMEm8feO44soYNA-1; Mon, 02 Aug 2021 11:02:22 -0400
X-MC-Unique: ypya3XWnMEm8feO44soYNA-1
Received: by mail-ej1-f72.google.com with SMTP id
 e8-20020a1709060808b02904f7606bd58fso4804999ejd.11
 for <alsa-devel@alsa-project.org>; Mon, 02 Aug 2021 08:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IQn3lWKBIP82QpyroX3uD+kOwHQGWgUweHxb8LcCMQI=;
 b=PI0lpuWkZjdS8bWa6OJLTCk03YdkQUHGF/Iomjv6jNXrrgYWrLvDzEsA+7w+CbRkI1
 2urIY363DJwH4E526TLw1DG1XXb8jJtsC9MOSxuBMGaoTGZZw7Gs3ac1myZsowLMpCN+
 K5pZqB4UzRqbzEVM+owzLTkJvknzMGaWVpfYri+MdHWn07lwvaTJzCBCO9C8Vgh55vxK
 zE9cx4cLEzmJlnJQyyrwbuenuEGH57yy+3jLiAPe1iJD8XxbscjdPS7EEadIdET63s1r
 sS4CUzJi2McR5aRsm8w6zMzyvq0F/BI5G0tsvBgbVjBq8Y+ho9mvl6pr1hsuLqSXq3MY
 S7GQ==
X-Gm-Message-State: AOAM533DoHjiWWmZKY4YUS+0vJZD97tl0LxPF92XM49M4kjAy7feaqri
 vKLTmw+dFGsuGUsC26qvAvL61kjuf9CdwUpwLBbeBXLHLHLo0cy25JKsBrv8/kqjHLD1H0/Z2Bx
 fPCwUWd+frSgrHReT0mQmZUk=
X-Received: by 2002:a05:6402:7d3:: with SMTP id
 u19mr20379842edy.188.1627916541577; 
 Mon, 02 Aug 2021 08:02:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6RE7ktPpmN1lmsqySPYwqWoFuI2AZ3J1awe6WcE2hRCVneeoKRXtuOwJfMz8f4zNaqgGSYw==
X-Received: by 2002:a05:6402:7d3:: with SMTP id
 u19mr20379825edy.188.1627916541452; 
 Mon, 02 Aug 2021 08:02:21 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
 by smtp.gmail.com with ESMTPSA id g23sm4678427ejm.26.2021.08.02.08.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 08:02:21 -0700 (PDT)
Subject: Re: [PATCH 4/6] ASoC: Intel: bytcr_rt5640: Add support for a second
 headphones output
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20210801210431.161775-1-hdegoede@redhat.com>
 <20210801210431.161775-5-hdegoede@redhat.com>
 <101f39fb-03e3-5512-a9fc-2c569fcb98fc@linux.intel.com>
 <a373f102-fe2a-3f64-4023-497a072fc0d5@redhat.com>
 <ae8cbdab-bc35-3245-ea52-45404451d1e8@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <eaef3178-2871-7085-d088-f84edb3a09a3@redhat.com>
Date: Mon, 2 Aug 2021 17:02:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ae8cbdab-bc35-3245-ea52-45404451d1e8@linux.intel.com>
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

Hi,

On 8/2/21 4:35 PM, Pierre-Louis Bossart wrote:
> 
> 
>> I've also figured out how jack-detect works, since the codec's GPIO1 is used for the external-hp-amp enable, the jack-detect signals are directly connected to the Bay Trail SoC's GPIOs:
>>
>>   -gpioget 'INT33FC:02' 14 && gpioget 'INT33FC:00' 0 && gpioget 'INT33FC:00' 3
>>    Nothing inserted: 1 1 0
>>    Headset  in dock: 0 1 0
>>    Headphon in dock: 0 1 1
>>    Headset  in tabl: 1 0 0
>>    Headphon in tabl: 1 0 0
>>    Conclusion:
>>    GPO2 pin 14: !jack in dock
>>    GPO0 pin  0: !jack in tablet
>>    GPO0 pin  3: 1 when jack in dock with no mic
> 
> I am a bit confused about the logic. Could you have a case with 1 1 1
> (separate headphones in tablet and dock jacks)?

1 1 1 is not possible since 1 in column 0 + 1 means nothing inserted, iow
the jack-detect is active-low; and when nothing is inserted then the last
column is always 0.

With that said yes headphones in the dock + something in the tablet-jack should
be detectable as a new combination not in the table, this should give us
"0 0 x" (I did not test that yet, but the 2 jacks should be fully independent).
IOW we will end up with 2 separate snd_soc_jack-s which together register
4 pins. E.g. the declaration for the pins will look like this:

static struct snd_soc_jack_pin rt5640_pins[] = {
        {
                .pin    = "Headphone",
                .mask   = SND_JACK_HEADPHONE,
        },
        {
                .pin    = "Headset Mic",
                .mask   = SND_JACK_MICROPHONE,
        },
};

static struct snd_soc_jack_pin rt5640_pins2[] = {
        {
                .pin    = "Headphone 2",
                .mask   = SND_JACK_HEADPHONE,
        },
        {
                .pin    = "Headset Mic 2",
                .mask   = SND_JACK_MICROPHONE,
        },
};

And there will be 2 snd_soc_jack_add_gpio calls each using
1 of the set of pins (assuming I can use bias over-current
detect to differentiate between headphones/headset on the
jack on the tablet).

As you said in your other email "this is an interesting hardware setup"
I hope I won't hit any userspace issues when I have the kernel code
ready to register 2 jacks.

Regards,

Hans

