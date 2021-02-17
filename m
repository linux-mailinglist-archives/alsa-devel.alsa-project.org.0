Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A760531D9BD
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Feb 2021 13:49:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 302D71654;
	Wed, 17 Feb 2021 13:48:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 302D71654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613566181;
	bh=ZjC/UubO4oeX/p8Q80zL9oTH48n4U2Jjnd8RfR3aVmo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JQYU7ZGRm8xPHbg9XDavQzTH48TUyMTul+AgkE97MlPz3coajCIQhDIis5j4skTFE
	 QeEa6/BpV5FwOdWazCS/3bL+5BUi4vzJskqamZD+UL/TEV/wyCf6mK2B7HFVPhqBGp
	 O2IxaNRgdygox/YJP0PFTxUOVKjBU1kBIl3rgn4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FC78F800D0;
	Wed, 17 Feb 2021 13:48:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79DADF80258; Wed, 17 Feb 2021 13:48:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3240EF800D0
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 13:48:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3240EF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DzngJu7Z"
Received: by mail-pl1-x632.google.com with SMTP id f8so5766733plg.5
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 04:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=LxFn4W9o9jOzv9KLzMHQXyxirKKlLx5EMaZ9RsITOuw=;
 b=DzngJu7Z6z0/+kWv251zZ4GEzpARMockZt/9+QoKi5MQQtIJ+Y0umbS8cDEkpyOmfw
 ust/Kiuu4JyHc4DrgnrYRTx33vMhPnjXlD5m+tFjFIM6TDOubmyumNbqrhprZ9PK0y5x
 D+E5p3IPfUC23iiACIODUi+NBXs35cdUu9w/OYlSxnbGgHUph2wNx0AxPQENgw6L1/Cm
 ReRRr6F9A1k2w25Vx4AxCdH7nF/fSu+oD7eGReffZTF6rzN7K6K4Gy8awLP7SsgeNqxq
 ylpvMnwqKpHrFmriMWbrTFK+ut8aiSKcDi7kIlHnRRnAfyn3xuheT6yQYRpcPjCHwbE/
 4V6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=LxFn4W9o9jOzv9KLzMHQXyxirKKlLx5EMaZ9RsITOuw=;
 b=EpACh/Bv8VJFN8DhZLJL2KoKf0slbsAz5LqLyBsMxhnCzy60NzRErUwg+7Iep3GYOq
 LIaRepD3kHWkyVNONurilVQ5FX91iNxLzro5GtTrReZLOIG0Ar2OBxRuSH+ORn3MnEEG
 qIpbPUCBY+dwL12+hZjn8j74aJbAbM7bUN+nxCqvAlCF0IvGMoKsDZEx5QnBxRnTHYZx
 f/eo0SyRY13jnSUM3LF2gM87cUc1C/IwXnVxXnsbX+K5a54bjfuBj8jYDUKxsPwToZUJ
 Roa/F+rR8x9Wqi1Dak00MG1E2WFOOXI5ZzL3IzHVbXyK7FlZIWB47UaQ75ruTzMLSa6k
 4x6w==
X-Gm-Message-State: AOAM5316zRgr5vb/xyBykcxiCdpVcCnSo3KCGg4yKUQobuqRR1fZOLCR
 lI+DNZk3iiD1tGv1nBbEq0s=
X-Google-Smtp-Source: ABdhPJzja9YOfu921M8CWphegsgmA9y9BsmyYOmipRer8O9IXuclHZHnGiUjpqUjW0uuVCoGFT8YNw==
X-Received: by 2002:a17:902:bcc6:b029:e3:f95:6da5 with SMTP id
 o6-20020a170902bcc6b02900e30f956da5mr24612328pls.6.1613566081427; 
 Wed, 17 Feb 2021 04:48:01 -0800 (PST)
Received: from [0.0.0.0] ([2605:52c0:2:4a5::])
 by smtp.gmail.com with ESMTPSA id i1sm2322259pjd.37.2021.02.17.04.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 04:48:01 -0800 (PST)
Subject: Re: [PATCH v3 1/3] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Perry Yuan <Perry.Yuan@dell.com>, oder_chiou@realtek.com, perex@perex.cz,
 tiwai@suse.com, hdegoede@redhat.com, mgross@linux.intel.com
References: <20210112171723.19484-1-Perry_Yuan@Dell.com>
 <bf048701-4e6b-ad18-1a73-8bca5c922425@linux.intel.com>
 <79277bf2-3c9e-8b66-47a9-b926a2576f7f@gmail.com>
 <31982e8d-3b0d-7187-8798-900f95d876ee@linux.intel.com>
From: Perry Yuan <perry979106@gmail.com>
Message-ID: <e66d8098-beb6-1299-20aa-42cfe13882f6@gmail.com>
Date: Wed, 17 Feb 2021 20:47:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <31982e8d-3b0d-7187-8798-900f95d876ee@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mario.Limonciello@dell.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 platform-driver-x86@vger.kernel.org, broonie@kernel.org
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

Hi Pierre:
On 2021/2/16 22:56, Pierre-Louis Bossart wrote:
> 
>>>> +static const struct acpi_device_id privacy_acpi_device_ids[] = {
>>>> +    {"PNP0C09", 0},
>>>> +    { },
>>>> +};
>>>> +MODULE_DEVICE_TABLE(acpi, privacy_acpi_device_ids);
>>>> +
>>>> +static struct platform_driver dell_privacy_platform_drv = {
>>>> +    .driver = {
>>>> +        .name = PRIVACY_PLATFORM_NAME,
>>>> +        .acpi_match_table = ACPI_PTR(privacy_acpi_device_ids),
>>>> +    },
>>>
>>> no .probe?
>> Originally i added the probe here, but it cause the driver  .probe 
>> called twice. after i use platform_driver_probe to register the driver 
>> loading process, the duplicated probe issue resolved.
>>
>> I
>>>
>>>> +    .remove = dell_privacy_acpi_remove,
>>>> +};
>>>> +
>>>> +int __init dell_privacy_acpi_init(void)
>>>> +{
>>>> +    int err;
>>>> +    struct platform_device *pdev;
>>>> +    int privacy_capable = wmi_has_guid(DELL_PRIVACY_GUID);
>>>> +
>>>> +    if (!wmi_has_guid(DELL_PRIVACY_GUID))
>>>> +        return -ENODEV;
>>>> +
>>>> +    privacy_acpi = kzalloc(sizeof(*privacy_acpi), GFP_KERNEL);
>>>> +    if (!privacy_acpi)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    pdev = platform_device_register_simple(
>>>> +            PRIVACY_PLATFORM_NAME, PLATFORM_DEVID_NONE, NULL, 0);
>>>> +    if (IS_ERR(pdev)) {
>>>> +        err = PTR_ERR(pdev);
>>>> +        goto pdev_err;
>>>> +    }
>>>> +    err = platform_driver_probe(&dell_privacy_platform_drv,
>>>> +            dell_privacy_acpi_probe);
>>>> +    if (err)
>>>> +        goto pdrv_err;
>>>
>>> why is the probe done here? Put differently, what prevents you from 
>>> using a 'normal' platform driver, and do the leds_setup in the .probe()?
>> At first ,I used the normal platform driver framework, however tt 
>> cause the driver  .probe called twice. after i use 
>> platform_driver_probe to register the driver loading process, the 
>> duplicated probe issue resolved.
> 
> This sounds very odd...
> 
> this looks like a conflict with the ACPI subsystem finding a device and 
> probing the driver that's associated with the PNP0C09 HID, and then this 
> module __init  creating a device manually which leads to a second probe
> 
> Neither the platform_device_register_simple() nor 
> platform_driver_probe() seem necessary?Because this privacy acpi driver file has dependency on the ec handle, 
so i want to determine if the driver can be loaded basing on the EC ID 
PNP0C09 matching.

So far,It works well for me to register the privacy driver with  the 
register sequence.
Dose it hurt to keep current registering process with 
platform_driver_probe used?

Perry
