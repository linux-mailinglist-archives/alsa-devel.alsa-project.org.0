Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AE12FA108
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 14:15:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15A7917FA;
	Mon, 18 Jan 2021 14:14:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15A7917FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610975735;
	bh=4ajn+bZk9qyGLUL7IVqdXVMAd0xOI9osJ5Jn3VlgEu8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LPWW6xERmjIV/m1O5ZpC+VbEUUDP58I9RO703NEtiE9pkUJ0xVhkp1v3XRZ1lhlbQ
	 3Hx6J6yfiHQbCfLWbrGEzP6ez5bGSEnf8tLWHde3IgRUeWO+oc5y8SzuynC+shYCYh
	 j6ZOVB3EaY0hLyEQcZ8SI2f/El6PDJTXaXl0xYWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92AE5F800C0;
	Mon, 18 Jan 2021 14:14:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09F69F8016E; Mon, 18 Jan 2021 14:14:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41C9CF80137
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 14:13:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41C9CF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="RCaggWcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610975634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFZsBHiz4wdGL9jh27P3G4596mkxpbLR98+Xm6UedWU=;
 b=RCaggWcsKiuhTbAhHO75dx2jPXiZQPbRWsgr7AOH0HTvb7LA8ylBuYbIpMfSfC1ejNgqS7
 W4BL87jw4ESiQRzw6TgGXmRHSty4PGziMfAQoXx8ctom3lxuM0lxxCmDKSXa8IOML2rXzd
 xjvREVdo9GxL0muKUFtDdCeApgxHN40=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-4Xg0Dp9sMIyDc3QcojrKFg-1; Mon, 18 Jan 2021 08:13:52 -0500
X-MC-Unique: 4Xg0Dp9sMIyDc3QcojrKFg-1
Received: by mail-ed1-f69.google.com with SMTP id g14so7881754edt.12
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 05:13:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HFZsBHiz4wdGL9jh27P3G4596mkxpbLR98+Xm6UedWU=;
 b=rzjpaiKYvrVvgNZECW/m6bFYPqTBSvugNlcVumm0VtqUZy4pn8pTEdnUekBEm3HTzP
 kYdRqf29hmPMVlZuqZoteXOMMd9twmpdjte3Gb8n1lnyifdjLT0HFeQiH/bMc1PxTeST
 t7l34Eon3TQIorqxAPUDywCLMwusSx7MnV+pnDnDVEOSooHcFtPqXdkLTqh3/OxdORzT
 pgvkGQdrjzu4/OERY0hrMDD1EZL8RJOaxeN9dLyfocv20oL9QOfTsCgMecE/MDJhIKA7
 MfHaW9SMsn3PiNYbov0sXNuWrS3+CBlQ5jIMacRhHSkUl3PqcJN1WlRC8IHczzpj5t38
 BcQw==
X-Gm-Message-State: AOAM531CeKsDxkX3yiriG8XVJ8GKjceQLah/RhZyzZOA33zzQ2bkuNAI
 Uyb/HfnsdwAFx3GLEqzo/8R93IaKwdZXcV7i79jg0Tl6hPMs629A7IrWZZdAzkZCfG+BsDLnHrz
 uQjpwzwcxWlHSAiJi0yWw24s=
X-Received: by 2002:aa7:c9c9:: with SMTP id i9mr18998973edt.160.1610975631549; 
 Mon, 18 Jan 2021 05:13:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyowQiRgZnged9Qb0Zo0/qKoQBk5KnmnJWS/yh3aTYVlECY53QqL30hVVGrJsyCFMoChS4w6Q==
X-Received: by 2002:aa7:c9c9:: with SMTP id i9mr18998965edt.160.1610975631416; 
 Mon, 18 Jan 2021 05:13:51 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id e7sm7083396ejb.19.2021.01.18.05.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 05:13:50 -0800 (PST)
Subject: Re: [PATCH v3 3/5] mfd: arizona: Add support for ACPI enumeration of
 WM5102 connected over SPI
To: Mark Brown <broonie@kernel.org>
References: <20210117212252.206115-1-hdegoede@redhat.com>
 <20210117212252.206115-4-hdegoede@redhat.com>
 <20210118130227.GI4455@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5ccf48f4-45dc-3a30-3d6a-cce066f01270@redhat.com>
Date: Mon, 18 Jan 2021 14:13:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210118130227.GI4455@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Christian Hartmann <cornogle@googlemail.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Lee Jones <lee.jones@linaro.org>
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

On 1/18/21 2:02 PM, Mark Brown wrote:
> On Sun, Jan 17, 2021 at 10:22:50PM +0100, Hans de Goede wrote:
> 
>> +	/*
>> +	 * Some DSDTs wrongly declare the IRQ trigger-type as IRQF_TRIGGER_FALLING
>> +	 * The IRQ line will stay low when a new IRQ event happens between reading
>> +	 * the IRQ status flags and acknowledging them. When the IRQ line stays
>> +	 * low like this the IRQ will never trigger again when its type is set
>> +	 * to IRQF_TRIGGER_FALLING. Correct the IRQ trigger-type to fix this.
>> +	 */
>> +	arizona->pdata.irq_flags = IRQF_TRIGGER_LOW;
> 
> Are you sure that all the relevant interrupt controllers support active
> low interrupts?  There were issues on some systems with missing support
> for active low interrupts (see the bodge in wm8994-irq.c to work around
> them) - it's entirely likely that there are DSDTs that are just plain
> buggy here but if someone's copying and pasting it smells like there may
> be some systems that actually need an edge triggered interrupt that
> they're getting it from.

I'm only aware of one series of devices / models which actually
use the combination of ACPI enumeration and the WM5102 codec, and that
is the Lenovo Yoga Tablet 2 series (in 8, 10 and 13 inch versions
shipping with both Windows and Android). These all use a Bay Trail
SoC which is capable of using active low interrupts.

More in general I'm not aware of any (recent-ish) x86 GPIO controllers
not being able to do active low interrupts. In theory we could hit this
code path on ARM devices using ACPI enumeration, but I don't think it
is likely we will see a combination of ARM + ACPI enumeration +
WM5102 + GPIO controller not capable of active-low interrupts.

This overriding of the flags definitely is necessary on the Lenovo
devices in question. I could add a
"if (dmi_name_in_vendors("LENOVO"))" guard around it, but that
seems unnecessary.

Regards,

Hans



> 
>> +
>> +	/* Wait 200 ms after jack insertion */
>> +	arizona->pdata.micd_detect_debounce = 200;
>> +
>> +	/* Use standard AOSP values for headset-button mappings */
>> +	arizona->pdata.micd_ranges = arizona_micd_aosp_ranges;
>> +	arizona->pdata.num_micd_ranges = ARRAY_SIZE(arizona_micd_aosp_ranges);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct acpi_device_id arizona_acpi_match[] = {
>> +	{
>> +		.id = "WM510204",
>> +		.driver_data = WM5102,
>> +	},
>> +	{
>> +		.id = "WM510205",
>> +		.driver_data = WM5102,
>> +	},
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(acpi, arizona_acpi_match);
>> +#else
>> +static int arizona_spi_acpi_probe(struct arizona *arizona)
>> +{
>> +	return -ENODEV;
>> +}
>> +#endif
>> +
>>  static int arizona_spi_probe(struct spi_device *spi)
>>  {
>>  	const struct spi_device_id *id = spi_get_device_id(spi);
>> @@ -77,6 +191,12 @@ static int arizona_spi_probe(struct spi_device *spi)
>>  	arizona->dev = &spi->dev;
>>  	arizona->irq = spi->irq;
>>  
>> +	if (has_acpi_companion(&spi->dev)) {
>> +		ret = arizona_spi_acpi_probe(arizona);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>  	return arizona_dev_init(arizona);
>>  }
>>  
>> @@ -104,6 +224,7 @@ static struct spi_driver arizona_spi_driver = {
>>  		.name	= "arizona",
>>  		.pm	= &arizona_pm_ops,
>>  		.of_match_table	= of_match_ptr(arizona_of_match),
>> +		.acpi_match_table = ACPI_PTR(arizona_acpi_match),
>>  	},
>>  	.probe		= arizona_spi_probe,
>>  	.remove		= arizona_spi_remove,
>> -- 
>> 2.28.0
>>

