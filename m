Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B46309788
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Jan 2021 19:28:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BD6C1768;
	Sat, 30 Jan 2021 19:27:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BD6C1768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612031310;
	bh=dLl+UrTHIMKKR+PiuMmdWh0bHf4JleUUNNTG4M1q6vU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DJYCEPyFHgDbop6tjrL3n999D2bt2dM+9dyp6ksgz16eHzg5VUhNqQTorpY/QrkgY
	 zpaJQ2Ww82BAw+eSkHTrS7B6D0ZLKKHgVbFj1xvN77K8p3yXo3VyR0JsgcU33as0+d
	 BjRMY9ex+wR6ndzhRm7iki5iQ1+FkgqqIr2KbNpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8385DF801D8;
	Sat, 30 Jan 2021 19:26:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1FDFF80143; Sat, 30 Jan 2021 19:26:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61745F80143
 for <alsa-devel@alsa-project.org>; Sat, 30 Jan 2021 19:26:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61745F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="OD3m7H1N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612031197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bMLhJaveBRc7lRWdxOIflNe79Y1svj3iInUTQFcS9uE=;
 b=OD3m7H1NBnvHcumRIjc9KD39/s+hJ8zeqCxQUaOp5Cow2BsqUuRgSGgsguxqQs7Roy7q4M
 Gubrf4Z4beMw1NFcYBFK10WUducWrGHwRgwb+YwRGz27xXDxg08v512lCxcGIldvajkU1p
 axmEFQUIKhQ7QqxgpjRPj6uiAqriNF8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-2c9NGJSNM3Kn-ITukK0qFw-1; Sat, 30 Jan 2021 13:26:35 -0500
X-MC-Unique: 2c9NGJSNM3Kn-ITukK0qFw-1
Received: by mail-ed1-f70.google.com with SMTP id j11so6231520edy.20
 for <alsa-devel@alsa-project.org>; Sat, 30 Jan 2021 10:26:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bMLhJaveBRc7lRWdxOIflNe79Y1svj3iInUTQFcS9uE=;
 b=AC9tfyVWYQNYT/yaVMJAmk59YFnkfovqVFevrEeW68tCFU2+vWkh98BbsBtwd++xtl
 2xWau9YSpFV2CJdutBf1ZDhlEI3ulFo/rhg3RFC/2rYlQ3bJVPF+90cY3qHyBYvLp1Fs
 xMQKZrfkUtpNlwGhVMnPeToGXUi28RvaY/uMCpOKI/RSGYMws9K/5RjIRhmnmLul2CcV
 reX+fkN+kQXy5+spT/OiHOP+aLabjccqJQfWKsPCkbh3xt0HRtaRjOgcZLb1PKwDUnTu
 TxKAJTZgm94OtMUSJ7Ib4jyGEc4O6ha17XNRz8GMHRpXOCv1wjKtZCHnUchlsTnUTLza
 oEpA==
X-Gm-Message-State: AOAM530OqOuQIZllhRw8+ePvzKlDy0XY0WMYbND/bPO/u8m1yLuiGyiI
 ns1vgcAqKtp+1waAO9kf+nJ5/UDo8oOwGep1zAN/IaU/g+DQNMD6Db6JdIeaYb/ekHld+k2hF/F
 ko8gwXpiu5xWl2E3XAHGInZ9s5vGRq9dyNnThcNQjJL02HzFFgkGKSert5/vteauJGafjFZ4x6f
 U=
X-Received: by 2002:a17:906:198b:: with SMTP id
 g11mr10120207ejd.536.1612031194175; 
 Sat, 30 Jan 2021 10:26:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyewTalC1oL45I+R9G5vtqxAb67qhsr7XziI+556v3UJy3kBbvg9uZD1OFoMYXNzL2Gs8xDYQ==
X-Received: by 2002:a17:906:198b:: with SMTP id
 g11mr10120189ejd.536.1612031193998; 
 Sat, 30 Jan 2021 10:26:33 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id y1sm584061edq.26.2021.01.30.10.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Jan 2021 10:26:33 -0800 (PST)
Subject: Re: [PATCH v4 13/13] ASoC: Intel: bytcr_wm5102: Add jack detect
 support
To: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20210123121313.79530-1-hdegoede@redhat.com>
 <20210123121720.79863-1-hdegoede@redhat.com>
 <20210123121720.79863-4-hdegoede@redhat.com>
 <20210130154035.GX106851@ediswmail.ad.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <9492d03c-2198-1298-b15c-944b2cdd7876@redhat.com>
Date: Sat, 30 Jan 2021 19:26:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210130154035.GX106851@ediswmail.ad.cirrus.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
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

On 1/30/21 4:40 PM, Charles Keepax wrote:
> On Sat, Jan 23, 2021 at 01:17:20PM +0100, Hans de Goede wrote:
>> Add jack detect support by creating a jack and calling
>> snd_soc_component_set_jack to register the created jack
>> with the codec.
>>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> +static struct snd_soc_jack_pin byt_wm5102_pins[] = {
>> +	{
>> +		.pin	= "Headphone",
>> +		.mask	= SND_JACK_HEADPHONE,
>> +	},
>> +	{
>> +		.pin	= "Headset Mic",
>> +		.mask	= SND_JACK_MICROPHONE,
>> +	},
>> +};
>> +
> 
> This patch looks fine to me, but I did have one small question.
> What is the thinking behind punting this to the machine driver?
> 
> I guess you can not register it if there is no jack present
> on the board, or if you have multiple jacks name them
> meaningfully. Although I sort of feel like those applied to
> the old extcon approach that just internally registered all
> the interfaces.

To be honest I'm not 100% sure why this is done this way,
this is how *all* ASoC drivers do it (AFAICT).

I think it is done this way because of 2 reasons:

1. The pins controlled by the jack are what for lack of
a better word I call "end-point" pins. And these get
registered by the machine-driver, so to make sure that
the names match it makes sense to also declare the
snd_soc_jack_pin array in the machine-driver.
For example the "Headphone" pin is a widget registered
by the machine driver as:

        SND_SOC_DAPM_HP("Headphone", NULL),

2. Probe ordering, the jack gets attached to the card and
when the coded driver's probe function runs the card does
not exist yet. But I think that could be worked around by
doing things in the component-probe function.

Regards,

Hans

