Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 816CF34693C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 20:41:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00369166E;
	Tue, 23 Mar 2021 20:41:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00369166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616528513;
	bh=kQ5j2voLGm7wOB8aDHvahK+c0RImJH3psJDLeZRenYQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mRpuEhKPGCbBSr7MHvJkrCEPkt/Rz0KRgbnY0WNNMos/1EIldn8o71CsKz7XY46/y
	 N8a1nl4h4I2+8EispOGe2IBMb0oZauJy1Sq15R5HaOovxn8it3cZlIWN9DHb9/L8ia
	 QvC3omlzdSpuo4DWsxFAArJAyVhDRHsseue76jg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 698EAF80268;
	Tue, 23 Mar 2021 20:40:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED031F8025F; Tue, 23 Mar 2021 20:40:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 117D8F800EE
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 20:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 117D8F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="N6vrrA4d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616528421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gTg0YZwN5hFKhiavzk2/eEE2JZuUQxCKgti32JKf8OQ=;
 b=N6vrrA4dO0lzZe9fhzAqoNnE28R/Apn6CpWPnFhDeCyWgVrYxM4LoWYFyS8Pw3Ud+tFTZC
 lfJmnvdBhMHcKGZUSpuqevpwLZnFiDR1eERrBHPdjsIWVVEterEmmkiKIYfg9AErp9xIuW
 isBhfgvSeVdrHOkuVEwQujixR1fyyEw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-3QKVMvNlP32KTU4Gczd6Sg-1; Tue, 23 Mar 2021 15:40:19 -0400
X-MC-Unique: 3QKVMvNlP32KTU4Gczd6Sg-1
Received: by mail-ed1-f70.google.com with SMTP id r19so1473296edv.3
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 12:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gTg0YZwN5hFKhiavzk2/eEE2JZuUQxCKgti32JKf8OQ=;
 b=ay+U1Iq7MQC1577M+sXZR2TnMLXBAB8/Yi5aWxn90IvHJiBOUvHP08XlBTKFHyzC1G
 P4T09Lueoy8tCafg8H4XNcfRs+UkL5ZBoXu8BZwcdRjwEgnrII7eqB6j2hEJ2DLOQCUS
 mJ2Ko2mak/aAXi+c0WJDwa301cxRricu3hNg44X5vegLz377KCX5Hi7XETwdfHdN4hZQ
 RGM1RwDxZEF1+eINwEhsfG47MoO6MnR51Bkp9iqYGmNq6fu2GDD/ox0WLPMQP5bur01C
 MxUa9b5wciD+LBWZMWH71Lwz8pcOETW7YxiqapLxEfll/pkY8au1Oed2EvQBx6wG5h5A
 /JTQ==
X-Gm-Message-State: AOAM530OtAYb+47YKeJpfGyaiEBnrPKM1TQI1gct73Dm+0OgVwCo8ykn
 4f6WG1qBsgr5U7eUEPiVbZzW8AtHJJMetM5selAQIxcShSGFWJEoWaPDb25/5+uBbxkl4EHLd/a
 +FnOpYPY6QGFsQYxnteJMzOI=
X-Received: by 2002:a05:6402:110b:: with SMTP id
 u11mr6397936edv.356.1616528418168; 
 Tue, 23 Mar 2021 12:40:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWHFAwTK7ag1Wvv7Id+c3/SYEgI+THVgdw8ygYHwpZENXbTKwxMbLV2w6ixKzeZOeLR4v7Vg==
X-Received: by 2002:a05:6402:110b:: with SMTP id
 u11mr6397924edv.356.1616528418074; 
 Tue, 23 Mar 2021 12:40:18 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id m14sm13563701edr.13.2021.03.23.12.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 12:40:17 -0700 (PDT)
Subject: Re: [PATCH v5 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Perry Yuan <Perry.Yuan@dell.com>, pobrn@protonmail.com,
 oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com,
 mgross@linux.intel.com, Mario.Limonciello@dell.com
References: <20210322093841.11840-1-Perry_Yuan@Dell.com>
 <a1fae1fc-2d4f-63e8-e0be-0f9c4c91640c@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c61b975a-a771-eb63-5232-2da184ca95fe@redhat.com>
Date: Tue, 23 Mar 2021 20:40:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a1fae1fc-2d4f-63e8-e0be-0f9c4c91640c@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, platform-driver-x86@vger.kernel.org,
 broonie@kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

On 3/23/21 7:57 PM, Pierre-Louis Bossart wrote:
> Minor comments below.

<snip<

>> +int __init dell_privacy_acpi_init(void)
> 
> is the __init necessary? You call this routine from another which already has this qualifier.

Yes this is necessary, all functions which are only used during module_load / from the
module's init function must be marked as __init so that the kernel can unload them
after module loading is done.

I do wonder if this one should not be static though (I've not looked at this patch in
detail yet).

> 
>> +{
>> +    int err;
>> +    struct platform_device *pdev;
>> +
>> +    if (!wmi_has_guid(DELL_PRIVACY_GUID))
>> +        return -ENODEV;
>> +
>> +    privacy_acpi = kzalloc(sizeof(*privacy_acpi), GFP_KERNEL);
>> +    if (!privacy_acpi)
>> +        return -ENOMEM;
>> +
>> +    err = platform_driver_register(&dell_privacy_platform_drv);
>> +    if (err)
>> +        goto pdrv_err;
>> +
>> +    pdev = platform_device_register_simple(
>> +            PRIVACY_PLATFORM_NAME, PLATFORM_DEVID_NONE, NULL, 0);
>> +    if (IS_ERR(pdev)) {
>> +        err = PTR_ERR(pdev);
>> +        goto pdev_err;
>> +    }
>> +
>> +    return 0;
>> +
>> +pdev_err:
>> +    platform_device_unregister(pdev);
>> +pdrv_err:
>> +    kfree(privacy_acpi);
>> +    return err;
>> +}
>> +
>> +void __exit dell_privacy_acpi_exit(void)
> 
> is the __exit required here?

Idem. Also static ?

Regards,

Hans



> 
>> +{
>> +    struct platform_device *pdev = to_platform_device(privacy_acpi->dev);
>> +
>> +    platform_device_unregister(pdev);
>> +    platform_driver_unregister(&dell_privacy_platform_drv);
>> +    kfree(privacy_acpi);
>> +}
>> +
>> +MODULE_AUTHOR("Perry Yuan <perry_yuan@dell.com>");
>> +MODULE_DESCRIPTION("DELL Privacy ACPI Driver");
>> +MODULE_LICENSE("GPL");
> 
> 

