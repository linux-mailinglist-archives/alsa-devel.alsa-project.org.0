Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E5313112F
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jan 2020 12:11:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8747417FD;
	Mon,  6 Jan 2020 12:10:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8747417FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578309088;
	bh=K94sHhNZIZa4YzBXlR3TJenmOWkeEgJPaPR1RngpLLc=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jaZ+rGOQNRcQWnksBl/5MV82FXtLuBR5JiKzLk7xyI4A8AqJlJL3i2H7+/Vli87jZ
	 mtnaE9PzSKWO8bF33UIkNPy9pfIlJxRVK0pqMvPoAM4s9x4RmU6IQzGvs+qVU6LmJp
	 4pazVtr9tQNeFlcrROGzek0lHLqRxLDklw0q//Ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3CABF801DA;
	Mon,  6 Jan 2020 12:09:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 073CFF80159; Mon,  6 Jan 2020 12:09:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4FCFF8010C
 for <alsa-devel@alsa-project.org>; Mon,  6 Jan 2020 12:09:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4FCFF8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="IDAuhmkh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578308977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rte63XpHlC3PRfkGOgJnd0aEl1JU7LvncFtx+InpTiY=;
 b=IDAuhmkh3X2W6ceunJt7QvxKpV5/Ua0MbK7xNGk3CfIkJDp3op7liD18lSd2hL8QSHj4bT
 APClvV4w0KLMe1pysgu0MRlp6xzSMFdLhWpA/MQ2rs4IZBx26DmCkWecIvVays4yTw88LR
 WDT8+kyLOuPjIq2SPa+7CXOr+gUzvJ8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-qgF4rgyiMVGCxeiP0Vs-6w-1; Mon, 06 Jan 2020 06:09:35 -0500
Received: by mail-wr1-f72.google.com with SMTP id u18so26924696wrn.11
 for <alsa-devel@alsa-project.org>; Mon, 06 Jan 2020 03:09:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rte63XpHlC3PRfkGOgJnd0aEl1JU7LvncFtx+InpTiY=;
 b=NfK5keNQR0uoOYFgWd5fZ9kzoiPBhWCYx3HQgpRMlrQ5dnM6OpGLKmxDrStD3gU6AU
 1yOMIDf+lHzUFl5FIemBp/VdDzYGEG1ElCirvCiRM3pKMkLQiVRslmGkRIFepHO66soC
 6Vhk2R8purlha6pQ59Myj9pSbZnZfRB6DUtQSUJlX/lHDSKy4p63XscljNoa0fiNNo3I
 TFeYPsA77HHJNdwRAJXhHlLw9pgBffTu9jIqSdJN9OdoiHF8Qz7z/VOhZ1SUaRxxDllJ
 DCmBc3MKFz/3tOBZDAySzYO5aQwe1GXIc3ZgiZiq2BF0Dhtf8BxF7ZszcssbtQtCvzoY
 vQlQ==
X-Gm-Message-State: APjAAAV4QfMPPrr919ef7RIyndSuvULbhYFAgLvuGvWAsDds3EVchR1y
 C3A2Xo3XwrzQlychPTSB0/7XanM5yJawAcyXK6QDFTEyDFw0NvA/2rQmz9lW86tUplIY4uZ1ans
 3TqPkyFwXkIGKWKGzxuE0L/A=
X-Received: by 2002:a05:600c:48a:: with SMTP id
 d10mr34084589wme.87.1578308973848; 
 Mon, 06 Jan 2020 03:09:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwlwFADE8BjztaxdlZg6FxAW6R8AsrL1VMPyV+NO/vpYtoUiRSuGjgghq8hQo7X6SrH4XvV7w==
X-Received: by 2002:a05:600c:48a:: with SMTP id
 d10mr34084549wme.87.1578308973539; 
 Mon, 06 Jan 2020 03:09:33 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id n16sm72006139wro.88.2020.01.06.03.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2020 03:09:32 -0800 (PST)
To: Yauhen Kharuzhy <jekhor@gmail.com>, alsa-devel@alsa-project.org
References: <20200106102116.GA96770@jeknote.loshitsa1.net>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <4cb71b85-f296-1276-06a9-53ef9c1f2909@redhat.com>
Date: Mon, 6 Jan 2020 12:09:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200106102116.GA96770@jeknote.loshitsa1.net>
Content-Language: en-US
X-MC-Unique: qgF4rgyiMVGCxeiP0Vs-6w-1
X-Mimecast-Spam-Score: 0
Subject: Re: [alsa-devel] Right place for defining ACPI GPIO mapping for
	codec
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 06-01-2020 11:21, Yauhen Kharuzhy wrote:
> Hello,
> 
> I am working now to get sound working at Lenovo Yoga Book tablet. It is
> Intel CherryTrail-based device and has RT5677 sound codec.
> 
> The RT5677 codec driver uses two GPIOs to reset and enable the codec,
> with names 'realtek,reset' and 'realtek,pow-ldo2'. The ACPI definition lacks a
>   _DSD section with GPIO name->CRS ID definition, so I need to manually
> define this mapping somewhere using existing
> devm_acpi_dev_add_driver_gpios() method (various devices has various _CRS
>   definitions order and content, so this is cannot be placed into
> rt5677.c codec driver).
> 
> The most obvious place for this is ASoC machine driver for my device, but the
> codec driver is binded to the ACPI device and initializes before machine
> driver.
> 
> Can somebody advice how to define such GPIOs mapping for codec in my
> case?

Hmm, so normally I would say to move the devm_gpiod_get_optional calls
into the component probe part of the codec driver (rt5677_probe) which
does run after the machine driver, but it seems that the GPIOs must
be driven to the correct values before we can do any i2c transfers.

You could move everything below (and including) the devm_gpiod_get_optional calls
from rt5677_i2c_probe to the top of rt5677_probe, but then you will also
be moving these calls:

         rt5677_init_gpio(i2c);
         ret = rt5677_init_irq(i2c);

Which register a GPIO chip themselves, which may be a dependency for probing
other bits of the sound stack so moving those 2 calls is a bad idea.

This means that the codec-driver itself and specifically the  rt5677_i2c_probe()
function is pretty much the only remaining place where you can add the
devm_acpi_dev_add_driver_gpios() call. Note that you may also need to set some
pdata settings. For the rt5640 and rt5651 drivers we set some device properties
from the machine driver and check those in the component probe function. But
rt5677 already depends on various props inside the i2c probe function.

Note that taking care of machine specific bits in the codec driver is not
unheard of, the rt5645.c also does this and includes a DMI table for this
even though typically this would be more appropriate for the machine driver.

So in this case given the constraints I think it is fine to de a DMI match
and add the devm_acpi_dev_add_driver_gpios() call based on that to the
codec driver itself, like we are doing in sound/soc/codecs/rt5645.c, you
can then also set some of the pdata based on the DMI match as needed.

For now I would not worry about making this generic, my suggestion would
be to add a "rt5677_lenovo_yogabook_fixup" function which stars with the
DMI check (and bails if it fails) and then does whatever you need wrt
both the devm_acpi_dev_add_driver_gpios() call and the pdata settings.

And then add a call to rt5677_lenovo_yogabook_fixup() directly under the
rt5677_read_device_properties() call in rt5677_i2c_probe().

We can worry about making the X86 machine specific fixups more generic
when we need to add them for a second X86 device.

Regards,

Hans








> 
> 
> The ACPI definition of sound device is below. Second I2C address
> definition is for TS3A277E jack detector. The first GPIO in the _CRS is
> codec reset, the second is pow-ldo2.
> 
> Device (RTEK)
> {
>      Name (_ADR, Zero)  // _ADR: Address
>      Name (_HID, "10EC5677")  // _HID: Hardware ID
>      Name (_CID, "10EC5677")  // _CID: Compatible ID
>      Name (_DDN, "Realtek IIS Audio Codec")  // _DDN: DOS Device Name
>      Name (_SUB, "17AA7005")  // _SUB: Subsystem ID
>      Name (_UID, One)  // _UID: Unique ID
>      Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
>      {
>          CLK3
>      })
>      Name (CHAN, Package (0x02)
>      {
>          One,
>          0x0124F800
>      })
>      Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
>      {
>          Name (SBUF, ResourceTemplate ()
>          {
>              I2cSerialBusV2 (0x002C, ControllerInitiated, 0x000186A0,
>                  AddressingMode7Bit, "\\_SB.PCI0.I2C1",
>                  0x00, ResourceConsumer, , Exclusive,
>                  )
>              I2cSerialBusV2 (0x003B, ControllerInitiated, 0x000186A0,
>                  AddressingMode7Bit, "\\_SB.PCI0.I2C1",
>                  0x00, ResourceConsumer, , Exclusive,
>                  )
>              GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
>                  "\\_SB.GPO3", 0x00, ResourceConsumer, ,
>                  )
>                  {   // Pin list
>                      0x0019
>                  }
>              GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
>                  "\\_SB.GPO3", 0x00, ResourceConsumer, ,
>                  )
>                  {   // Pin list
>                      0x0012
>                  }
>              GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
>                  "\\_SB.GPO3", 0x00, ResourceConsumer, ,
>                  )
>                  {   // Pin list
>                      0x0030
>                  }
>              GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0x0000,
>                  "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>                  )
>                  {   // Pin list
>                      0x005B
>                  }
>              GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0x0000,
>                  "\\_SB.GPO0", 0x00, ResourceConsumer, ,
>                  )
>                  {   // Pin list
>                      0x004D
>                  }
>              SpiSerialBusV2 (0x0001, PolarityLow, FourWireMode, 0x08,
>                  ControllerInitiated, 0x003D0900, ClockPolarityHigh,
>                  ClockPhaseSecond, "\\_SB.PCI0.SPI1",
>                  0x00, ResourceConsumer, , Exclusive,
>                  )
>          })
>          Return (SBUF) /* \_SB_.PCI0.I2C1.RTEK._CRS.SBUF */
>      }
> 
>      Method (_STA, 0, NotSerialized)  // _STA: Status
>      {
>          Return (0x0F)
>      }
> 
>      Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
>      {
>      }
> }
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
