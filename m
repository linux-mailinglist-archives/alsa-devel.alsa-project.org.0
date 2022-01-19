Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D55493F54
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 18:49:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B93773106;
	Wed, 19 Jan 2022 18:48:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B93773106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642614580;
	bh=np0mo6EH6c00T0eVqXgja9QsVXbVPO0GhsDyqM2ds/0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OEZ503Lp/xk1uzjR805nTT6or9Icq0/cytIKEiBQOt47NyTjA4m0ZGuUE7gVCuePG
	 DeRRYRMtffAb3nHB7M0ilvv3Lb4EjbxZKKDdfhPz7jIfVYkzvvlXlf3fwIwoNWzcl7
	 F5EBJ0sZ2EWySbL+llwFy+oljdPvAYrD3YMWs7iw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FD12F80100;
	Wed, 19 Jan 2022 18:48:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DEDAF801F7; Wed, 19 Jan 2022 18:48:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4604EF80100
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 18:48:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4604EF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="flnxuyNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642614503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YpDeVNV5+zY/wtrGfYxy2lEajeSHJy9f5dUQzPImNNs=;
 b=flnxuyNqoC820CGLeScUXn67qerYhTgi8KDBU3JdKt6SbvO4gv7vu9OtQQQ7MWSy4kQ/4a
 J6JpKnr3ZBNWpVMR/Dh3aMjOCNP5gLG6w9gxZ2PgSxJJrMaYZJNDeejanea8u1ajnNjYmp
 PbQmoJQeWBt2JNJh26asYqYPNZU8EPY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-VQn-YqqkM3K7FuOBsbt7FA-1; Wed, 19 Jan 2022 12:48:22 -0500
X-MC-Unique: VQn-YqqkM3K7FuOBsbt7FA-1
Received: by mail-ed1-f72.google.com with SMTP id
 h21-20020aa7c955000000b0040390b2bfc5so3315075edt.15
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 09:48:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YpDeVNV5+zY/wtrGfYxy2lEajeSHJy9f5dUQzPImNNs=;
 b=wNDbSOvnpWUeRWOH830bveSBZe1VkRAqeqtTvjqGV7hzPsfB3YlHzBY1m6s6tunfmH
 /ujjN3K9/TN+hvDG2/XbhwaQXWtTi8nd+szlkS5RH/d2ay1mBqgrOfnnq03bdi8lszgc
 PpV+0iO7paUGL4w3FjjKCnaDZ66ZxukLbvMwMfUMA/Y1BGoYMRbynGpeG1576IXkGe5v
 xX13362glHte93OkqA4i2ZOZd2xCp2S4uzA9Krn1fzgDIV8OCy7x08Rj9FuSnf2oBzev
 lR/JRm3Wja/tukE3UaieLxykYCZqyezVWdfhwKdxPrXmTH1LsgLDXzh7dvr6Trjo5dec
 uNqA==
X-Gm-Message-State: AOAM53322HF2BZUAaxVAsLWb9XGUU0x7woJe53zpUzDRmu9cdAi3v8p/
 9JvYnDSbdo3RovmN0V0UtzCMhsT+11pFYQF26/k+PilsEwyIcB2pkxa9w3xA8ZYKhYgWd0I6NS3
 ljNG0XKUVbCU37s/J95R6JtY=
X-Received: by 2002:a17:907:3e24:: with SMTP id
 hp36mr17603775ejc.584.1642614499597; 
 Wed, 19 Jan 2022 09:48:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5iWS79JAvreWf3L6gIVZPiqWXYyiPVTLJMjomwG6E2H8+WN4B3GQwRNVgVkLtSBGLy4Uh7w==
X-Received: by 2002:a17:907:3e24:: with SMTP id
 hp36mr17603759ejc.584.1642614499311; 
 Wed, 19 Jan 2022 09:48:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id r18sm172741edq.25.2022.01.19.09.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 09:48:18 -0800 (PST)
Message-ID: <f55ff70c-1578-afa7-999e-ba504aa325eb@redhat.com>
Date: Wed, 19 Jan 2022 18:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 05/10] platform/x86: i2c-multi-instantiate: Move it to
 drivers/acpi folder
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Lucas tanure <tanureal@opensource.cirrus.com>
References: <20220118145251.1548-1-sbinding@opensource.cirrus.com>
 <20220118145251.1548-6-sbinding@opensource.cirrus.com>
 <CAJZ5v0g0n201FPcG9LBNG3e4UdNYSWmj_1sN3MxLxmK=GoF+tA@mail.gmail.com>
 <a3522b5e-fb36-b959-d2ea-d141d3ad9999@opensource.cirrus.com>
 <CAJZ5v0h8MWb3sSuqWHUcm9TVWP0uJ+=GmzAuqVtNag2LP+0kYQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0h8MWb3sSuqWHUcm9TVWP0uJ+=GmzAuqVtNag2LP+0kYQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>,
 Stefan Binding <sbinding@opensource.cirrus.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Gross <markgross@kernel.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com,
 linux-spi <linux-spi@vger.kernel.org>, Len Brown <lenb@kernel.org>
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

On 1/19/22 18:44, Rafael J. Wysocki wrote:
> On Wed, Jan 19, 2022 at 6:33 PM Lucas tanure
> <tanureal@opensource.cirrus.com> wrote:
>>
>> On 1/19/22 16:53, Rafael J. Wysocki wrote:
>>> On Tue, Jan 18, 2022 at 3:53 PM Stefan Binding
>>> <sbinding@opensource.cirrus.com> wrote:
>>>>
>>>> From: Lucas Tanure <tanureal@opensource.cirrus.com>
>>>>
>>>> Moving I2C multi instantiate driver to drivers/acpi folder for
>>>> upcoming conversion into a generic bus multi instantiate
>>>> driver for SPI and I2C
>>>>
>>>> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
>>>> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
>>>
>>> Why are you moving it away from platform/x86?
>>>
>>> Adding SPI to the mix doesn't seem to be a sufficient reason.
>>>
>>> If this were going to be needed on non-x86, that would be a good
>>> reason for moving it, but is that actually the case?  If so, why isn't
>>> that mentioned in the changelog above?
>>>
>>
>> It was a request made by Andy Shevchenko:
>> https://lkml.org/lkml/2021/12/3/347
> 
> But he hasn't given any reasons why that'd be better.
> 
>> There is no plan to use our CS35L41 HDA with non-x86 platforms and we
>> can't comment about i2c-multi-instantiate use.
>> For us it can stay in x86 folder until an actual request.
> 
> I'd prefer that if Hans agrees.

Ack, keeping this in drivers/platform/x86 is fine with me.

I'll try to make some time to review this new version next week.

Looking at the subjects of the patches I see that this now
refactors the SPI code to re-use the existing SPI ACPI resource
parsing there, thank you for doing that!

Regards,

Hans





> 
>>>> ---
>>>>   MAINTAINERS                                           |  2 +-
>>>>   drivers/acpi/Kconfig                                  | 11 +++++++++++
>>>>   drivers/acpi/Makefile                                 |  1 +
>>>>   .../{platform/x86 => acpi}/i2c-multi-instantiate.c    |  0
>>>>   drivers/acpi/scan.c                                   |  2 +-
>>>>   drivers/platform/x86/Kconfig                          | 11 -----------
>>>>   drivers/platform/x86/Makefile                         |  1 -
>>>>   7 files changed, 14 insertions(+), 14 deletions(-)
>>>>   rename drivers/{platform/x86 => acpi}/i2c-multi-instantiate.c (100%)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 4e828542b089..546f9e149d28 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -392,7 +392,7 @@ ACPI I2C MULTI INSTANTIATE DRIVER
>>>>   M:     Hans de Goede <hdegoede@redhat.com>
>>>>   L:     platform-driver-x86@vger.kernel.org
>>>>   S:     Maintained
>>>> -F:     drivers/platform/x86/i2c-multi-instantiate.c
>>>> +F:     drivers/acpi/i2c-multi-instantiate.c
>>>>
>>>>   ACPI PCC(Platform Communication Channel) MAILBOX DRIVER
>>>>   M:     Sudeep Holla <sudeep.holla@arm.com>
>>>> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
>>>> index ba45541b1f1f..2fd78366af6f 100644
>>>> --- a/drivers/acpi/Kconfig
>>>> +++ b/drivers/acpi/Kconfig
>>>> @@ -295,6 +295,17 @@ config ACPI_PROCESSOR
>>>>            To compile this driver as a module, choose M here:
>>>>            the module will be called processor.
>>>>
>>>> +config ACPI_I2C_MULTI_INST
>>>> +       tristate "I2C multi instantiate pseudo device driver"
>>>> +       depends on I2C
>>>> +       help
>>>> +         Some ACPI-based systems list multiple i2c-devices in a single ACPI
>>>> +         firmware-node. This driver will instantiate separate i2c-clients
>>>> +         for each device in the firmware-node.
>>>> +
>>>> +         To compile this driver as a module, choose M here: the module
>>>> +         will be called i2c-multi-instantiate.
>>>> +
>>>>   config ACPI_IPMI
>>>>          tristate "IPMI"
>>>>          depends on IPMI_HANDLER
>>>> diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
>>>> index bb757148e7ba..d4db7fb0baf0 100644
>>>> --- a/drivers/acpi/Makefile
>>>> +++ b/drivers/acpi/Makefile
>>>> @@ -104,6 +104,7 @@ obj-$(CONFIG_ACPI_SPCR_TABLE)       += spcr.o
>>>>   obj-$(CONFIG_ACPI_DEBUGGER_USER) += acpi_dbg.o
>>>>   obj-$(CONFIG_ACPI_PPTT)        += pptt.o
>>>>   obj-$(CONFIG_ACPI_PFRUT)       += pfr_update.o pfr_telemetry.o
>>>> +obj-$(CONFIG_ACPI_I2C_MULTI_INST)      += i2c-multi-instantiate.o
>>>>
>>>>   # processor has its own "processor." module_param namespace
>>>>   processor-y                    := processor_driver.o
>>>> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/acpi/i2c-multi-instantiate.c
>>>> similarity index 100%
>>>> rename from drivers/platform/x86/i2c-multi-instantiate.c
>>>> rename to drivers/acpi/i2c-multi-instantiate.c
>>>> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
>>>> index 1331756d4cfc..3e85a02f6ba2 100644
>>>> --- a/drivers/acpi/scan.c
>>>> +++ b/drivers/acpi/scan.c
>>>> @@ -1738,7 +1738,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>>>>           * must be instantiated for each, each with its own i2c_device_id.
>>>>           * Normally we only instantiate an i2c-client for the first resource,
>>>>           * using the ACPI HID as id. These special cases are handled by the
>>>> -        * drivers/platform/x86/i2c-multi-instantiate.c driver, which knows
>>>> +        * drivers/acpi/i2c-multi-instantiate.c driver, which knows
>>>>           * which i2c_device_id to use for each resource.
>>>>           */
>>>>                  {"BSG1160", },
>>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>>> index 24deeeb29af2..37c1c150508d 100644
>>>> --- a/drivers/platform/x86/Kconfig
>>>> +++ b/drivers/platform/x86/Kconfig
>>>> @@ -990,17 +990,6 @@ config TOPSTAR_LAPTOP
>>>>
>>>>            If you have a Topstar laptop, say Y or M here.
>>>>
>>>> -config I2C_MULTI_INSTANTIATE
>>>> -       tristate "I2C multi instantiate pseudo device driver"
>>>> -       depends on I2C && ACPI
>>>> -       help
>>>> -         Some ACPI-based systems list multiple i2c-devices in a single ACPI
>>>> -         firmware-node. This driver will instantiate separate i2c-clients
>>>> -         for each device in the firmware-node.
>>>> -
>>>> -         To compile this driver as a module, choose M here: the module
>>>> -         will be called i2c-multi-instantiate.
>>>> -
>>>>   config MLX_PLATFORM
>>>>          tristate "Mellanox Technologies platform support"
>>>>          depends on I2C && REGMAP
>>>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>>>> index c12a9b044fd8..6c7870190564 100644
>>>> --- a/drivers/platform/x86/Makefile
>>>> +++ b/drivers/platform/x86/Makefile
>>>> @@ -110,7 +110,6 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)        += topstar-laptop.o
>>>>
>>>>   # Platform drivers
>>>>   obj-$(CONFIG_FW_ATTR_CLASS)            += firmware_attributes_class.o
>>>> -obj-$(CONFIG_I2C_MULTI_INSTANTIATE)    += i2c-multi-instantiate.o
>>>>   obj-$(CONFIG_MLX_PLATFORM)             += mlx-platform.o
>>>>   obj-$(CONFIG_TOUCHSCREEN_DMI)          += touchscreen_dmi.o
>>>>   obj-$(CONFIG_WIRELESS_HOTKEY)          += wireless-hotkey.o
>>>> --
>>>> 2.25.1
>>>>
>>
> 

