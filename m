Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C62447941A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 19:28:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D189928B2;
	Fri, 17 Dec 2021 19:27:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D189928B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639765694;
	bh=6HtC0ffhr+Wk7yixsg7pyE+lMue6TbVr7MbWv9xKR5s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dIbnOM+AZ7E9BYT2v3VcqQ65p16mmYLH5EVpzqZVut2n5Ah8Qw4FmiwdfWvTdlLxb
	 Bd0IslI7WHZgWii+Bm/EHbzuqOQNDRbAUr+3Ccy9bZZgsU55lVI63bJ3AbSPUVe4kP
	 ll55WlS+lUhqqfqZTrGNrWmBvgypmjgpQ1znH/ts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23F87F8016D;
	Fri, 17 Dec 2021 19:27:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27BD4F80163; Fri, 17 Dec 2021 19:27:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26E65F800AB
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 19:26:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26E65F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Kb7N1p4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639765615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KfxK0ejkXXY8vtQyFEY/7KMOpPsxa0viz0432kyxpNQ=;
 b=Kb7N1p4jCupaB+vFjOgrUGVFvOZ8O+D/V7D47vJBR8p1J2Xs7G6DxdAACF57z50fwx+DGx
 u8aAwZlvwX5T0zt9USa/h3yfpuMOk/i6tAq2w8QqRdGQN5EVsjZGftJFAD/75Gals7pF6X
 g25NNRi04UXJEMKYXSo8+4ujUnNjoPo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-WWUCDCj8PWS7_nDLWtUjZA-1; Fri, 17 Dec 2021 13:26:53 -0500
X-MC-Unique: WWUCDCj8PWS7_nDLWtUjZA-1
Received: by mail-ed1-f70.google.com with SMTP id
 y17-20020a056402271100b003f7ef5ca612so2631687edd.17
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 10:26:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KfxK0ejkXXY8vtQyFEY/7KMOpPsxa0viz0432kyxpNQ=;
 b=BPxw08T92ZCeaYyuDejNdEUcaPNiz989FB6J9j3s4Np7Hx22R0KgOt7B+ObNVnYJnv
 2UYzGBjsEBrO2sHfCqmq7509aBXY4DU/jJR7rfd8fliB4EAIYh49Jq1Xq12Uod66YlIo
 7hCNDYUpX8Zxf3pRjd3ugBmBUIia996doESw8kJpbB1U/7/eX0Xu1Ngnq9YC2qIjtFbo
 63AtlDr12upMS1T0H2MC9RN8Wei0D9QSMQ30gMVSkbURUyCXjA9dm4K/YkgYUI39YG+K
 OIWVYq1nKBDUR7ywUE5zLO4tORLhXGtsjSqdq2mQLjSZep0Pqpi/TpwEB8wFrWOtUotq
 XRmg==
X-Gm-Message-State: AOAM53038nXyRyfXGzma/QciJDaJIYqcGDSrZ6EzByEllOnxsgkwV+hq
 z1kpn2isZEnFNm0KN91yw74PDNvEzK8ULg2FmNYjUlLkBOkrIB+LjXr95Lk8TdWsDrnG4KipCFM
 CeqGAFC/KfhQffQw3DhYJtWI=
X-Received: by 2002:aa7:c5ca:: with SMTP id h10mr3889463eds.401.1639765612421; 
 Fri, 17 Dec 2021 10:26:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymzvx+9sN5uu3fOWCecyuooYD36PdLfEQ4rkNgUaVC2uS7EjeLyEo6xpsbKMtNHdFq3cZCYg==
X-Received: by 2002:aa7:c5ca:: with SMTP id h10mr3889448eds.401.1639765612171; 
 Fri, 17 Dec 2021 10:26:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id cs15sm3032506ejc.31.2021.12.17.10.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 10:26:51 -0800 (PST)
Message-ID: <4b5506b1-20c6-3983-d541-86dc2388b2a7@redhat.com>
Date: Fri, 17 Dec 2021 19:26:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 08/10] ACPI / scan: Create platform device for CLSA0100
 and CSC3551 ACPI nodes
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Stefan Binding <sbinding@opensource.cirrus.com>
References: <20211217115708.882525-1-tanureal@opensource.cirrus.com>
 <20211217115708.882525-9-tanureal@opensource.cirrus.com>
 <CAJZ5v0jTELqFeO6q6w_mYNo_yf1R9SX66RrEz0ZSe27w7E6kog@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0jTELqFeO6q6w_mYNo_yf1R9SX66RrEz0ZSe27w7E6kog@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Mark Gross <markgross@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
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

On 12/17/21 18:19, Rafael J. Wysocki wrote:
> On Fri, Dec 17, 2021 at 12:57 PM Lucas Tanure
> <tanureal@opensource.cirrus.com> wrote:
>>
>> The ACPI device with CLSA0100 or CSC3551 is a sound card
>> with multiple instances of CS35L41 connectec by I2C to
> 
> "connected" I suppose?
> 
>> the main CPU.
>>
>> We add an ID to the i2c_multi_instantiate_ids list to enumerate
>> all I2C slaves correctly.
>>
>> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> 
> This requires an ACK from Hans.
> 
> If you receive one, please feel free to add my ACK to it too.

One problem which I see here is that this change conflicts with
this series:

https://lore.kernel.org/all/20211210154050.3713-1-sbinding@opensource.cirrus.com/

I have reviewing that series on my todo list.

One interesting question for you (Rafael) about that series is
that i2c-multi-instantiate.c, which after the series also handles
spi devices,is being moved to drivers/acpi .

This is fine with me, but I wonder if it would not be better
to keep it under drivers/platform/x86 ? Since the new SPI
use-cases are also all on x86 laptops AFAICT.

But back to this series, as said the 2 series conflict, since
both are being submitted by @opensource.cirrus.com people,
it would be good if the Cirrus folks can decide in which
order these series should be merged.

It might be best to just move this one patch to the other series?
Thus removing the conflict between the 2 series.

Regards,

Hans



>> ---
>>  drivers/acpi/scan.c                          |  3 +++
>>  drivers/platform/x86/i2c-multi-instantiate.c | 11 +++++++++++
>>  2 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
>> index b7a6b982226e..8740cfa11f59 100644
>> --- a/drivers/acpi/scan.c
>> +++ b/drivers/acpi/scan.c
>> @@ -1712,8 +1712,11 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>>         static const struct acpi_device_id i2c_multi_instantiate_ids[] = {
>>                 {"BSG1160", },
>>                 {"BSG2150", },
>> +               {"CSC3551", },
>>                 {"INT33FE", },
>>                 {"INT3515", },
>> +               /* Non-conforming _HID for Cirrus Logic already released */
>> +               {"CLSA0100", },
>>                 {}
>>         };
>>
>> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
>> index 4956a1df5b90..a889789b966c 100644
>> --- a/drivers/platform/x86/i2c-multi-instantiate.c
>> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
>> @@ -147,6 +147,14 @@ static const struct i2c_inst_data int3515_data[]  = {
>>         {}
>>  };
>>
>> +static const struct i2c_inst_data cs35l41_hda[] = {
>> +       { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
>> +       { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
>> +       { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
>> +       { "cs35l41-hda", IRQ_RESOURCE_GPIO, 0 },
>> +       {}
>> +};
>> +
>>  /*
>>   * Note new device-ids must also be added to i2c_multi_instantiate_ids in
>>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
>> @@ -154,7 +162,10 @@ static const struct i2c_inst_data int3515_data[]  = {
>>  static const struct acpi_device_id i2c_multi_inst_acpi_ids[] = {
>>         { "BSG1160", (unsigned long)bsg1160_data },
>>         { "BSG2150", (unsigned long)bsg2150_data },
>> +       { "CSC3551", (unsigned long)cs35l41_hda },
>>         { "INT3515", (unsigned long)int3515_data },
>> +       /* Non-conforming _HID for Cirrus Logic already released */
>> +       { "CLSA0100", (unsigned long)cs35l41_hda },
>>         { }
>>  };
>>  MODULE_DEVICE_TABLE(acpi, i2c_multi_inst_acpi_ids);
>> --
>> 2.34.1
>>
> 

