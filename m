Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BF7348B78
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 09:25:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C88B86F;
	Thu, 25 Mar 2021 09:24:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C88B86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616660737;
	bh=hUMXifg4DllRlKp4bBst02xn2fnLE9S92O0iHR60F+Y=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T/C9IkL2L2Nd6WbuVNq6DTecIJd/DQ5p4Hl1Tu3cdI5afv16XLqaH2jW0O18iCeda
	 WAyKaEBffeWmjYAFSJrnXe/En+g9umI0id3t+8FEC+TU3Irj5Qw6kD7fvcWanUnvdG
	 aOuojuEfAns05SfeiMRIFHpxrdQ5eLy3LfNpMJRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED046F80104;
	Thu, 25 Mar 2021 09:24:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E42FF80257; Thu, 25 Mar 2021 09:24:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D979AF80103
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 09:23:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D979AF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="aEZ1pz0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616660635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYiX0x7fQEzSPtx5RzR0nO5WMxQ7mszVE6ntaDRhN3o=;
 b=aEZ1pz0Zp9+lXgHarwV0qcP/QQOhdcZrNheTov4z1axOBlCM8WArvtCd7ADBQMKN2REa48
 45lmU9eC+kk1jwYLHNTaP1MLmnXaZH4wtwdXHyCPYoc8zCyzbdN16N4Upa/UF2ZGY9bzl2
 2YOe/LgnKdHOv3xON6kpwK3vOdB+/Z0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-KclSYrJFMQG1tQXLk2Y68Q-1; Thu, 25 Mar 2021 04:23:53 -0400
X-MC-Unique: KclSYrJFMQG1tQXLk2Y68Q-1
Received: by mail-ej1-f72.google.com with SMTP id h14so2190578ejg.7
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 01:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RYiX0x7fQEzSPtx5RzR0nO5WMxQ7mszVE6ntaDRhN3o=;
 b=DByY8VfQF/jdRJz4iT4XNwFq+AMujy95Uc0nUfGiKkEU6ZtP+epRtOs/TLi0wbMuNI
 Z/MFuMXM2G3G0SRO1lGc6pHb2GDDAkGYdyNPNqjgsL4xkdPswtHT5DIFeDFr9SEb9qIG
 tecgIwHHSBMqo8/roQypX+FN3+kBU9PrhUdoP1owjHkLOoc+gvtLJdQ18IFgzxRAxi8Q
 i6W41prrPvN3f3l2qy5s5UtV7RizKBvGC8OnoydP3/QrLVLd3Gt1hjmmrDF0YKNGga32
 fOVa5pBl5PIUMuad05oaos9vkNiYy4nlILc28nTqUNq8A4zt4PkVMRDurl8/leyEt49x
 pMgg==
X-Gm-Message-State: AOAM533UtwVdIPHTb+Xuj4MWFB/hSw+fx1ioefmDdqr/lYawkMu9PqbT
 kxz46Q+28EMHi4NM9zOG/Dmy+5l7tWd9HjoCMusIeWdPvQNJFMyTp6D9OusdGKxPjZ41T4mnRV/
 a8j8o82Jdi5O9izqYeocTlzM=
X-Received: by 2002:a05:6402:35c9:: with SMTP id
 z9mr7747110edc.94.1616660632260; 
 Thu, 25 Mar 2021 01:23:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDH0fg1ePwOG2M9JA9L6BIxw9TAwkOOxCpGB3Y6hBhA86qYmvC+FvOwa/BzMPMfYaG9/TeAQ==
X-Received: by 2002:a05:6402:35c9:: with SMTP id
 z9mr7747099edc.94.1616660632118; 
 Thu, 25 Mar 2021 01:23:52 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id q2sm2082722eje.24.2021.03.25.01.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 01:23:51 -0700 (PDT)
Subject: Re: [PATCH v5 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To: "Yuan, Perry" <Perry.Yuan@dell.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "pobrn@protonmail.com" <pobrn@protonmail.com>,
 "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "Limonciello, Mario" <Mario.Limonciello@dell.com>
References: <20210322093841.11840-1-Perry_Yuan@Dell.com>
 <a1fae1fc-2d4f-63e8-e0be-0f9c4c91640c@linux.intel.com>
 <c61b975a-a771-eb63-5232-2da184ca95fe@redhat.com>
 <SJ0PR19MB4528ED97AA4A5D0821A3E68584629@SJ0PR19MB4528.namprd19.prod.outlook.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5ec52d3c-3587-6bf7-bf84-b6f8f31be0e7@redhat.com>
Date: Thu, 25 Mar 2021 09:23:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <SJ0PR19MB4528ED97AA4A5D0821A3E68584629@SJ0PR19MB4528.namprd19.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
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

On 3/25/21 8:52 AM, Yuan, Perry wrote:
> Hi Hans.
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Wednesday, March 24, 2021 3:40 AM
>> To: Pierre-Louis Bossart; Yuan, Perry; pobrn@protonmail.com;
>> oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
>> mgross@linux.intel.com; Limonciello, Mario
>> Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org;
>> lgirdwood@gmail.com; platform-driver-x86@vger.kernel.org;
>> broonie@kernel.org
>> Subject: Re: [PATCH v5 1/2] platform/x86: dell-privacy: Add support for Dell
>> hardware privacy
>>
>>
>> [EXTERNAL EMAIL]
>>
>> Hi,
>>
>> On 3/23/21 7:57 PM, Pierre-Louis Bossart wrote:
>>> Minor comments below.
>>
>> <snip<
>>
>>>> +int __init dell_privacy_acpi_init(void)
>>>
>>> is the __init necessary? You call this routine from another which already has
>> this qualifier.
>>
>> Yes this is necessary, all functions which are only used during module_load /
>> from the module's init function must be marked as __init so that the kernel
>> can unload them after module loading is done.
>>
>> I do wonder if this one should not be static though (I've not looked at this
>> patch in detail yet).
>>
>>>
>>>> +{
>>>> +    int err;
>>>> +    struct platform_device *pdev;
>>>> +
>>>> +    if (!wmi_has_guid(DELL_PRIVACY_GUID))
>>>> +        return -ENODEV;
>>>> +
>>>> +    privacy_acpi = kzalloc(sizeof(*privacy_acpi), GFP_KERNEL);
>>>> +    if (!privacy_acpi)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    err = platform_driver_register(&dell_privacy_platform_drv);
>>>> +    if (err)
>>>> +        goto pdrv_err;
>>>> +
>>>> +    pdev = platform_device_register_simple(
>>>> +            PRIVACY_PLATFORM_NAME, PLATFORM_DEVID_NONE, NULL, 0);
>>>> +    if (IS_ERR(pdev)) {
>>>> +        err = PTR_ERR(pdev);
>>>> +        goto pdev_err;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +
>>>> +pdev_err:
>>>> +    platform_device_unregister(pdev);
>>>> +pdrv_err:
>>>> +    kfree(privacy_acpi);
>>>> +    return err;
>>>> +}
>>>> +
>>>> +void __exit dell_privacy_acpi_exit(void)
>>>
>>> is the __exit required here?
>>
>> Idem. Also static ?
>>
>> Regards,
>>
>> Hans
>>
> 
> If adding static to the function,  I will be worried about that the init and exit cannot be called by another file .

That is right, which is why I added the "?".

But this is no longer relevant after my detailed review of the patch,
so lets discuss things further in the detailed review email-thread.

Regards,

Hans

