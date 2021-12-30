Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A07D9481F9B
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Dec 2021 20:13:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34B7C170A;
	Thu, 30 Dec 2021 20:13:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34B7C170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640891634;
	bh=4EHdyMLs9l1+rOr83YwGs7tLlysCt9vgrB2VzpldfDY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LKKfyhVqUbKzwvIQdxRK6ECfe73QSYmaqIuLPaLMLGrv+abMCt6IdKGekHkgLN4oM
	 sEhLiGi9Q3MqrWWp8vTcXD+kkrZZOWqBQ2dVV7TSvcGB3UWeOpU3i0MClOUewn4khE
	 Va7VoF9eqhbEbRHCXz4rcbdGv4hPAu1hzl/g1ez8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A8E3F80149;
	Thu, 30 Dec 2021 20:12:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0DF1F8012A; Thu, 30 Dec 2021 20:12:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E74AF800D3
 for <alsa-devel@alsa-project.org>; Thu, 30 Dec 2021 20:12:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E74AF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="hTXHgPYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640891553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d2R3CuLWYhkFUNMhd6dM0QebtffWMsYI/JhDyxY4e8c=;
 b=hTXHgPYAvj+C38vOfe+p0GaeKFKmQ0peijNCeQJn0063AoC8c/YBQU3ATJei5aWi57aTEp
 Eq4T5OzkLgN5pqh9oFUVbY1cH7YaHkVshXkfRFN0FijEmYlJJTp1kMRvx89SvOUbYD/A0Y
 9EA2ZHRvCldDjl80pkehR8q0va9AHGk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-Dy6eHGKxNG26Oq_qyVUYgw-1; Thu, 30 Dec 2021 14:12:30 -0500
X-MC-Unique: Dy6eHGKxNG26Oq_qyVUYgw-1
Received: by mail-ed1-f71.google.com with SMTP id
 s12-20020a50ab0c000000b003efdf5a226fso17596392edc.10
 for <alsa-devel@alsa-project.org>; Thu, 30 Dec 2021 11:12:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d2R3CuLWYhkFUNMhd6dM0QebtffWMsYI/JhDyxY4e8c=;
 b=3qMM5i+5drg1zZ15blnGb8Vp8H2i58JbxJ9q/V9bD/sDD5dC5fpgnRnNxU4u7MQ0/Z
 m32zzZB6DH5O0PGO8Xi4gpfTbGKorXTz/1Lp74pIkkphmlJyy5JnSB103xDoeJDcNsoh
 pL7XP3n8anh5yQmU5zWo4m0n4ptpxk/wV5Iuw6QRBJ18gshVH8+EVDtlE6Y0Q/Vj4ySy
 osvFpNMdjzzGH11DSPgZi8phkbVBEd57oWto4XpfAgFnYL9Rpq4Pzwf+auZVU84Vvo6B
 CsILFAI3duEmNT2EVPa5LSBi2WLYtSIrHmzdn9Mb87HLrarfoMtXWynOtJoClqSAJnEx
 v5VQ==
X-Gm-Message-State: AOAM531w3brsHOx1THj4FGzGUl5yGBu3KbD5nQTS3A17gz9/DTAehWHB
 254uwT+MQgZslQP3NOY/cBuuNrVumx7rZn9nEtwvfhv3K/NQNT0wrgSrmbKYiOuWXXX4KisigxO
 C2CVAjwUqRb3l9PTE1XfOCrY=
X-Received: by 2002:a17:907:7285:: with SMTP id
 dt5mr13777419ejc.376.1640891549173; 
 Thu, 30 Dec 2021 11:12:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVYiHVgXkVmKHODdNSBKBXk7kBaiEBGPw3rz2cOjBW2h1obTjN+wPQdP10Hki5mhxuVENHtA==
X-Received: by 2002:a17:907:7285:: with SMTP id
 dt5mr13777398ejc.376.1640891548916; 
 Thu, 30 Dec 2021 11:12:28 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id qk34sm7976668ejc.143.2021.12.30.11.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 11:12:28 -0800 (PST)
Message-ID: <197a6c81-1d0b-b34d-d364-33bf254deab5@redhat.com>
Date: Thu, 30 Dec 2021 20:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/5] ASoC: Intel: bytcr_rt5640: Add support for external
 GPIO jack-detect
To: Stephan Gerhold <stephan@gerhold.net>
References: <20211227153344.155803-1-hdegoede@redhat.com>
 <20211227153344.155803-5-hdegoede@redhat.com> <Yc4A2sa/tmRqcjrU@gerhold.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yc4A2sa/tmRqcjrU@gerhold.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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

On 12/30/21 19:56, Stephan Gerhold wrote:
> On Mon, Dec 27, 2021 at 04:33:44PM +0100, Hans de Goede wrote:
>> Some boards have the codec IRQ hooked-up as normally, so the driver can
>> still do things like headset vs headphones and button-press detection,
>> but instead of using one of the JD pins of the codec, an external GPIO
>> is used to report the jack-presence switch status of the jack.
>>
>> Add support for boards which have this setup and which specify which
>> external GPIO to use in the special Android AMCR0F28 ACPI device.
>>
>> And add a quirk for the Asus TF103C tablet which uses this setup.
>>
> 
> Can you clarify what exactly is the difference between the setup on
> ME176C and the TF103C? I'm a bit confused why you're using the GpioInt
> as GPIO for TF103C and as IRQ for ME176C. It's GPO2 pin 0x0004 for both
> of them as far as I can tell.
> 
> If I remember correctly the vendor kernel from ASUS also used it as
> simple GPIO on ME176C. I'm not sure if it actually belongs to the
> RT5640, I just tried using it in a way that is compatible with your
> headphone detection code. :)
> 
> Before I switched to your code I was actually using it as simple GPIO
> similar to your changes here (this could only detect headphones though):
> https://github.com/me176c-dev/linux-me176c/commit/ea3de8e47414371fdeeae819c686f737c02fac7d#diff-28a5a6c5e3db2a315d022023f3cda69ef0475ef036e22dd5ffa0fb4af31c9f81
> 
> In other words, my question is: Should we also use BYT_RT5640_JD_SRC_EXT_GPIO
> for ME176C? Or can TF103C also use the same setup as ME176C?

The Bay Trail SoC GPO2 pin 4 is connected to the codecs GPIO1 pin,
which is best thought of as the codecs IRQ pin, because that is how
the rt5640 codec driver configures it:

        /* Selecting GPIO01 as an interrupt */
        snd_soc_component_update_bits(component, RT5640_GPIO_CTRL1,
                RT5640_GP1_PIN_MASK, RT5640_GP1_PIN_IRQ);

        /* Set GPIO1 output */
        snd_soc_component_update_bits(component, RT5640_GPIO_CTRL3,
                RT5640_GP1_PF_MASK, RT5640_GP1_PF_OUT);

This may seem to be directly connected to the jack-inserted switch
of the physical jack, but it is not, the IRQ just happens to go
low/high together with the jack state (the IRQ handler is sensitive
to both edges).

But when low (jack inserted), it can go high again even though the
jack is not removed *at all*. This happens on an overcurrent situation
on the mic bias current, which is how heapdhones vs headset are
detected (headphones short the mic contact triggering OVCD). So it
really is a totally different pin from the jack-inserted switch,
it just seems to be directly connected most of the time.

On the ME176C the actual physical jack-inserted switch is connected
to the JD2 aka IN4N pin of the codec and the codec driver checks
for jack-insertion like this:

	val = snd_soc_component_read(component, RT5640_INT_IRQ_ST);

        if (rt5640->jd_inverted)
                return !(val & RT5640_JD_STATUS);
        else
                return (val & RT5640_JD_STATUS);

And the physical jack-inserted switch is *also* connected to
the Bay Trail SoC GPO2 pin 27 (second GPIO resource in the AMCROf28
device), but we ignore that since before this patch-set the rt5640
codec code assumes the switch is always connected to one of the
codecs JD pins.


On the Asus TF103C, the codecs GPIO1 aka IRQ pin is connected
to the Bay Trail SoC's GPO2 pin 4 just like on the ME176C.

What is different is that the jack's physical insertion switch
is *only* connected to the Bay Trail SoC's GPO2 pin 27 and not
connected to any of the codecs JD1/JD2 pins *at all* so we need
to work around that.

I hope this helps explain.

and yes this means that we *could* also use
BYT_RT5640_JD_SRC_EXT_GPIO on the ME176C (and actually on quite
a few BYT devices) but it does not gain us anything,
it is just another method of getting the same information,
since the jack-inserted switch is connected to both the codec
and the Bay Trail SoC.

Regards,

Hans

