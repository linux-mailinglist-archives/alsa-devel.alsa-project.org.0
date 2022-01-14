Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2C548F039
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 19:57:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA6541EE4;
	Fri, 14 Jan 2022 19:56:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA6541EE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642186646;
	bh=tVxcndZpucXY/fxonjNTC9QP5PFOxTC9VPwEcDHNBLY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QfMScG6p81dAbNucXBT3PoAiLnF1Jvoz6SYLB4KLqZPhbstv/C1XV3kg7URZ1R8y9
	 ozeAupFMXel4zFmAKtLsP6T3xy9UMF92pCyOIgH4bswR8AiefcNNQbhI7qSNY/4r+a
	 vLIPB5MmNPxBHmcOdQ6OxRraLrA0BohNKMbDA9NM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40309F80310;
	Fri, 14 Jan 2022 19:56:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03CD0F8030F; Fri, 14 Jan 2022 19:56:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00596F800CE
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 19:56:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00596F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="TXwiIDFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642186568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=51ImlDEadEsctg6nVH5bEBazgwQXCgp/FsQbc0BxjHM=;
 b=TXwiIDFvsUZmxqS8YtaR4O58vY1s2m195rtKKzGxQlhx24rOPJfzJ1YNR9HaXniRkUVhf9
 I2Ltlc/h5N7heS/dJckyfTbHGpw1R+6ytyHStToqyhTGp0Y3cVAzN07fo7YYl50DwBh95D
 wAzYixajvbSl84CMYs67o5cMsGm9XCA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-wN2IIqbqMICLhh3YrLKCiQ-1; Fri, 14 Jan 2022 13:56:07 -0500
X-MC-Unique: wN2IIqbqMICLhh3YrLKCiQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 y18-20020a056402271200b003fa16a5debcso8895842edd.14
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 10:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=51ImlDEadEsctg6nVH5bEBazgwQXCgp/FsQbc0BxjHM=;
 b=a+gRUCF4MxDCPDVd1Do1ULkDh49yQkVqZbA7+XL3emmgINYzcsiWoSuHsN2tu5ypF1
 07ACpB2YYs2+gyb82HoSiWYRCHURRB4zDbwE6MFgQi5yRK/EoA5Ld7R8Ke3Ww6uufycK
 CLBZlrUFkF1V/3sG404Xl0AvRSww8P+kneEoKbImLsN46+zwtGnpkAa3mEUHmSKAyS/v
 +9/xa5LunBOvUS0emey9QqboQxX1FjXJHvOg7pjXDxb+NrDwI5MGeeI7LLYDv+OyAIXF
 cJyWcMbljm5A05NTu+xZGWUFT3i9ICf1qJaujYcMvKz7y3RvuW9FAd3dJHBhUFa0loFE
 ++og==
X-Gm-Message-State: AOAM532bohD2BtAQy6XUNHtwl7EK2H4DGCzbK2jFxdefFpNMv4pOPP0z
 GwZoeDXfYD4Lq0g7gR3brJAHmL4LtNBH3cbF6+9/90vCw4N6ATmlS5P25/VNvil7Yw2Oviw+I1Y
 NurtTpn5QLB/bp0oO1hp0vcc=
X-Received: by 2002:a05:6402:217:: with SMTP id
 t23mr7399931edv.283.1642186566035; 
 Fri, 14 Jan 2022 10:56:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyAnjfubbtpBrUe4OTbYQbUw+9LhVVYNB3cYNRwnppOgGUs9iR9DDM+srSbwA1kCbdnuGSAoA==
X-Received: by 2002:a05:6402:217:: with SMTP id
 t23mr7399910edv.283.1642186565843; 
 Fri, 14 Jan 2022 10:56:05 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id hd16sm2000023ejc.62.2022.01.14.10.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 10:56:05 -0800 (PST)
Message-ID: <55cb8127-65e2-4d56-5127-2722c5bfe11f@redhat.com>
Date: Fri, 14 Jan 2022 19:56:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/5] ACPI / scan: Create platform device for CLSA0100
To: "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.de>
References: <20220113170728.1953559-1-tanureal@opensource.cirrus.com>
 <20220113170728.1953559-5-tanureal@opensource.cirrus.com>
 <s5hee5a47et.wl-tiwai@suse.de>
 <CAJZ5v0ijGWNd9s-4mrFgK-QbPDhnj2K3DF+Z45t7ckV6ET0hpQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0ijGWNd9s-4mrFgK-QbPDhnj2K3DF+Z45t7ckV6ET0hpQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Mark Gross <markgross@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Len Brown <lenb@kernel.org>
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

On 1/14/22 18:51, Rafael J. Wysocki wrote:
> On Fri, Jan 14, 2022 at 5:19 PM Takashi Iwai <tiwai@suse.de> wrote:
>>
>> On Thu, 13 Jan 2022 18:07:28 +0100,
>> Lucas Tanure wrote:
>>>
>>> The ACPI device with CLSA0100 is a sound card with
>>> multiple instances of CS35L41 connected by I2C to
>>> the main CPU.
>>>
>>> We add an ID to the i2c_multi_instantiate_idsi list
>>> to enumerate all I2C slaves correctly.
>>>
>>> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
>>
>> I think it's better to merge this from sound git tree together with
>> others in the patch set, presumably for rc1.
>>
>> It'd be great if ACPI people can take a review and give an ack/nack.
> 
> Hans, what do you think?

This patch (5/5) applies on top of:

https://lore.kernel.org/linux-acpi/20211210154050.3713-1-sbinding@opensource.cirrus.com/

Which still needs some work and which really should be merged
through the ACPI tree. IMHO it would be best to simply drop
this (5/5) from this series and move it to the v3 of the
series which I've linked to above.

1-4 can be merged through the alsa tree independently of 5/5 AFAIK.

Regards,

Hans




> 
>>> ---
>>>  drivers/acpi/scan.c                          | 2 ++
>>>  drivers/platform/x86/i2c-multi-instantiate.c | 8 ++++++++
>>>  2 files changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
>>> index c215bc8723d0..2a68031d953e 100644
>>> --- a/drivers/acpi/scan.c
>>> +++ b/drivers/acpi/scan.c
>>> @@ -1753,6 +1753,8 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>>>        */
>>>               {"BCM4752", },
>>>               {"LNV4752", },
>>> +     /* Non-conforming _HID for Cirrus Logic already released */
>>> +             {"CLSA0100", },
>>>               {}
>>>       };
>>>
>>> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
>>> index 4956a1df5b90..a51a74933fa9 100644
>>> --- a/drivers/platform/x86/i2c-multi-instantiate.c
>>> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
>>> @@ -147,6 +147,12 @@ static const struct i2c_inst_data int3515_data[]  = {
>>>       {}
>>>  };
>>>
>>> +static const struct i2c_inst_data cs35l41_hda[] = {
>>> +     { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
>>> +     { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
>>> +     {}
>>> +};
>>> +
>>>  /*
>>>   * Note new device-ids must also be added to i2c_multi_instantiate_ids in
>>>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
>>> @@ -155,6 +161,8 @@ static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
>>>       { "BSG1160", (unsigned long)bsg1160_data },
>>>       { "BSG2150", (unsigned long)bsg2150_data },
>>>       { "INT3515", (unsigned long)int3515_data },
>>> +     /* Non-conforming _HID for Cirrus Logic already released */
>>> +     { "CLSA0100", (unsigned long)cs35l41_hda },
>>>       { }
>>>  };
>>>  MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
>>> --
>>> 2.34.1
>>>
> 

