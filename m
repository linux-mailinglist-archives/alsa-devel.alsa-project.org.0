Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA38B45B528
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:16:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7707E17B6;
	Wed, 24 Nov 2021 08:15:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7707E17B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637738201;
	bh=4PfOAUt6QKc48ACHS98y3JiF9O1Ou/AA/jDXs86HipQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+ZcJdTi5GFPPHF9JidqLyA04h+gHhYjDiU7jO+F20yOGZjsQFwyQa0VBYGFcbkDc
	 9MJ3Quz94UQj6Fy/LZ605nstD1HkTxhgDs8d+g/+3t6+dlr4b5jLIc/c38NeM+ZI8d
	 Vd5SyfEf2X/f44paHAYVKhUTnoKcqi7S01PSdl3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8568AF805E8;
	Wed, 24 Nov 2021 08:06:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38C6FF8049E; Tue, 23 Nov 2021 19:36:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87A75F80087
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 19:36:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87A75F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="aQAZW5zA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637692559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z5k6zTG4KRWbGgN3rihRDKhTPbVU4ZF9XdZlS05EGq0=;
 b=aQAZW5zA6OHiEl7dd6b9+G+ofroVUUWkmAcMse4gfC4U6hPzMPTPkTkM4F6muoPGiXkU9t
 mHbzOZmyDtX4ZcnQg665GhrR/bu4sKs4gdCqvEtj4bD+IWKMlnZIYHvdVAMUfkGQ09DM6f
 Cs3udlyOhuOfsaHPDZ3NJSEh6cerPPQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-pAyGAsmINeSqh4Z9swx9Lg-1; Tue, 23 Nov 2021 13:35:58 -0500
X-MC-Unique: pAyGAsmINeSqh4Z9swx9Lg-1
Received: by mail-ed1-f70.google.com with SMTP id
 f4-20020a50e084000000b003db585bc274so18544970edl.17
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 10:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z5k6zTG4KRWbGgN3rihRDKhTPbVU4ZF9XdZlS05EGq0=;
 b=NVpZudlY22zl/8O1l0aor0MvJ6iAgMz6e9iKP2N3TzNn1q6/oNQ9paNQMHWcOX8Mc6
 ylGZp8pCDBn4/rhUMnGOTrd5tiLuOUzHWG/KzhYzwtqhy10+eK89q62NDaFFwHyJxpCB
 ZbmkkozKDtNlW22MYfrys5Huk1a7r7WYQXGCTozi72ubxKGo21Minxz8QND6tmbH6dGJ
 QMvpqNYDXcohS6iOTn8y4JSlV/SETuGxLA28LXWCA31H5AqWd7I/G2VcjI12kcNQthBd
 sDssnqLAtJeyKmRRti3XVZe0eTcWKlLIE1IBixF0BaIQDsAL/hJIEoyE1dastBgdsLsI
 1eUA==
X-Gm-Message-State: AOAM530yyxmxsFiRgb1BplNbiLZBidWTwY/I/hHana+Nbcz/vKVZ9CMP
 EhQ5RPea9gE0xTo5fyI3rmCL4L6JObDx5JJfdq5BRG0pw3y6vOBzDcNhP9Q+ETDSW7WEO9UeZ8R
 inlwc3/RbGrKD6OWMAsrw2bo=
X-Received: by 2002:a50:c446:: with SMTP id w6mr12781955edf.137.1637692557247; 
 Tue, 23 Nov 2021 10:35:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUEZ9mmoxlVEliHny2DZXCv4YHhMo0Z9nYbdF9XbP1qCPsXkZcVzsMr3MWrgS3oizeCWcDog==
X-Received: by 2002:a50:c446:: with SMTP id w6mr12781899edf.137.1637692557030; 
 Tue, 23 Nov 2021 10:35:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214?
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id yd13sm5601817ejb.39.2021.11.23.10.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 10:35:56 -0800 (PST)
Message-ID: <1605be8d-0913-4b52-32e2-8076fff01d30@redhat.com>
Date: Tue, 23 Nov 2021 19:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 11/11] ACPI / scan: Create platform device for CLSA0100
 ACPI nodes
To: Lucas tanure <tanureal@opensource.cirrus.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Mark Gross <markgross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Kailang Yang <kailang@realtek.com>,
 Shuming Fan <shumingf@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Vitaly Rodionov <vitalyr@opensource.cirrus.com>
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
 <20211123163149.1530535-12-tanureal@opensource.cirrus.com>
 <87af37a2-dc02-2ae0-a621-b82c8601c16c@redhat.com>
 <756f813c-cc3e-7ddf-e5db-cf6c874f907e@opensource.cirrus.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <756f813c-cc3e-7ddf-e5db-cf6c874f907e@opensource.cirrus.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Chris Chiu <chris.chiu@canonical.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jack Yu <jack.yu@realtek.com>, Arnd Bergmann <arnd@arndb.de>,
 Jeremy Szu <jeremy.szu@canonical.com>, patches@opensource.cirrus.com,
 Elia Devito <eliadevito@gmail.com>, alsa-devel@alsa-project.org,
 Werner Sembach <wse@tuxedocomputers.com>, platform-driver-x86@vger.kernel.org,
 Hui Wang <hui.wang@canonical.com>, linux-acpi@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Sami Loone <sami@loone.fi>,
 Cameron Berkenpas <cam@neo-zeon.de>, linux-kernel@vger.kernel.org
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

On 11/23/21 18:11, Lucas tanure wrote:
> On 11/23/21 17:05, Hans de Goede wrote:
>> Hi Lucas,
>>
>> On 11/23/21 17:31, Lucas Tanure wrote:
>>> The ACPI device with CLSA0100 is a sound card with multiple
>>> instances of CS35L41.
>>>
>>> We add an ID to the I2C multi instantiate list to enumerate
>>> all I2C slaves correctly.
>>>
>>> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
>>> ---
>>>   drivers/acpi/scan.c                          | 1 +
>>>   drivers/platform/x86/i2c-multi-instantiate.c | 7 +++++++
>>>   2 files changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
>>> index 2c80765670bc..16827a33e93b 100644
>>> --- a/drivers/acpi/scan.c
>>> +++ b/drivers/acpi/scan.c
>>> @@ -1708,6 +1708,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>>>           {"BSG2150", },
>>>           {"INT33FE", },
>>>           {"INT3515", },
>>> +        {"CLSA0100", },
>>>           {}
>>>       };
>>>   diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
>>> index 4956a1df5b90..ed25a0adc656 100644
>>> --- a/drivers/platform/x86/i2c-multi-instantiate.c
>>> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
>>> @@ -147,6 +147,12 @@ static const struct i2c_inst_data int3515_data[]  = {
>>>       {}
>>>   };
>>>   +static const struct i2c_inst_data clsa0100_data[]  = {
>>> +    { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
>>> +    { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
>>
>> This suggests that both amplifiers are using the same GPIO pin as shared
>> IRQ, is that correct ? Can you share an acpidump of the laptop's DSDT tables ?
>>
>> Regards,
>>
>> Hans
>>
> 
> DSDT attached.
> Yes, both amps share the same IRQ gpio.

Thanks, this patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> 
>>
>>
>>
>>> +    {}
>>> +};
>>> +
>>>   /*
>>>    * Note new device-ids must also be added to i2c_multi_instantiate_ids in
>>>    * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
>>> @@ -155,6 +161,7 @@ static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
>>>       { "BSG1160", (unsigned long)bsg1160_data },
>>>       { "BSG2150", (unsigned long)bsg2150_data },
>>>       { "INT3515", (unsigned long)int3515_data },
>>> +    { "CLSA0100", (unsigned long)clsa0100_data },
>>>       { }
>>>   };
>>>   MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
>>>
>>

