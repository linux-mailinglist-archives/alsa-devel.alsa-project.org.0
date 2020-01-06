Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0552131BDE
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jan 2020 23:54:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12E8D180A;
	Mon,  6 Jan 2020 23:53:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12E8D180A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578351260;
	bh=HtQoJhUpQ190zAoJ8t5NQ4fsVv5y53wKnTEmDrOhIJM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bYFIZcw7ECEpFMs74sno1YnVCWwG65y1CDIH8x9j1iG7c18LgHuYZkGRqS8Lo4vou
	 3uzCDJI1lZhrvQCEJklkyqMc+qRPahV8Cuom8mROYyx2XBJPhnLIEkHh0iYPgyy33F
	 f28hULcdhm3QYof30yFaOrSL/Ch8tU0nWZElcR8M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A6E6F801ED;
	Mon,  6 Jan 2020 23:52:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A604F80159; Mon,  6 Jan 2020 23:52:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8051F8010C
 for <alsa-devel@alsa-project.org>; Mon,  6 Jan 2020 23:52:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8051F8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DbB7eUCM"
Received: by mail-wr1-x435.google.com with SMTP id j42so51702994wrj.12
 for <alsa-devel@alsa-project.org>; Mon, 06 Jan 2020 14:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=D1j8jZVUSsBQvFFq7ND5bKifuO7/9j3R8mpqNXycss8=;
 b=DbB7eUCMydaveFkWM03gVSUnTMY8fOlyY3tl/v+jtsNqxM5s7SKdK0PaCB7z5ZLy6p
 6W9dAydfQ5Pw4W60mGjJOlFgfP6rG3NMy0c0TGJ8Srqpd2h/UinRaYAJ77fi2OyZT1GT
 8O9tR5fAUStqvqNnPTmS6mmzapuiCosTZw8rSawRufU4ZvpSo+uk9f7MjWd83DLkYUWZ
 /5X9Y0VHHHMH7oNu/8/rmD5PyIKbM75HCIHlIGUfcBss6ya9oZ/2wy7a1l7NsAYqDQWB
 bh9sCEX1E6GfkEovLKlresTMbRBbpqFn0m1qt9JeW8k14LdCPuduNeAXtMGnHqNz98j8
 eXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D1j8jZVUSsBQvFFq7ND5bKifuO7/9j3R8mpqNXycss8=;
 b=BbMgK3sxCHqVk4WFdTpFLxs6/wJ8/dq6JKfo2fAZuHoibhS7tzqZ6CxPwnssc5T3FX
 zI+XaxvbIMGLeLL3/OHHT8Pr1wdJg7F8CVEPkrqyNPz7drBCNM1z5+Mw+HmrzUuO30UG
 qdioffnjzljd68oCYHoLUZ1/6k3xvX3uVWn0DqcgnPgO7ZtYd7fwUDHriaCwVie25LH5
 HjgAuCXLEUsoDWey80zfiwbE2Pb/UuwX3svfHJDBrXaqob1LWxQ0a6zbyIdj9EEWrVT9
 IL2OGcULznwsAJ9K9fre7yoo4V2dgteOD/AMcIIQOJsim0MP6lVJB+c5pVzwfl6BVxZ4
 TC1Q==
X-Gm-Message-State: APjAAAWeGkstmc6JHZOkMjesljDcfyQoB/CS1yg22qLCyXfY8KAljlwD
 T+eetLMq//LmbSbByydiaf8=
X-Google-Smtp-Source: APXvYqw/dUShK5hUfS+L2LHeI4OXMrtKaD+p66I9kevOgRq4PEXFaQeZtaiYPEsKO11laLafTf3tOA==
X-Received: by 2002:adf:a746:: with SMTP id e6mr110131971wrd.329.1578351146663; 
 Mon, 06 Jan 2020 14:52:26 -0800 (PST)
Received: from localhost.localdomain ([46.216.160.87])
 by smtp.gmail.com with ESMTPSA id b10sm76576468wrt.90.2020.01.06.14.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 14:52:26 -0800 (PST)
Received: from [127.0.0.1] (helo=jeknote.loshitsa1.net)
 by localhost.localdomain with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <jekhor@gmail.com>)
 id 1iobEW-0002Ec-NL; Tue, 07 Jan 2020 01:52:24 +0300
Date: Tue, 7 Jan 2020 01:52:20 +0300
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Message-ID: <20200106225217.GA5999@jeknote.loshitsa1.net>
References: <20200106102116.GA96770@jeknote.loshitsa1.net>
 <4cb71b85-f296-1276-06a9-53ef9c1f2909@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4cb71b85-f296-1276-06a9-53ef9c1f2909@redhat.com>
Cc: alsa-devel@alsa-project.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Jan 06, 2020 at 12:09:32PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 06-01-2020 11:21, Yauhen Kharuzhy wrote:
> > Hello,
> > 
> > I am working now to get sound working at Lenovo Yoga Book tablet. It is
> > Intel CherryTrail-based device and has RT5677 sound codec.
> > 
> > The RT5677 codec driver uses two GPIOs to reset and enable the codec,
> > with names 'realtek,reset' and 'realtek,pow-ldo2'. The ACPI definition lacks a
> >   _DSD section with GPIO name->CRS ID definition, so I need to manually
> > define this mapping somewhere using existing
> > devm_acpi_dev_add_driver_gpios() method (various devices has various _CRS
> >   definitions order and content, so this is cannot be placed into
> > rt5677.c codec driver).
> > 
> > The most obvious place for this is ASoC machine driver for my device, but the
> > codec driver is binded to the ACPI device and initializes before machine
> > driver.
> > 
> > Can somebody advice how to define such GPIOs mapping for codec in my
> > case?
> 
> Hmm, so normally I would say to move the devm_gpiod_get_optional calls
> into the component probe part of the codec driver (rt5677_probe) which
> does run after the machine driver, but it seems that the GPIOs must
> be driven to the correct values before we can do any i2c transfers.
> 
> You could move everything below (and including) the devm_gpiod_get_optional calls
> from rt5677_i2c_probe to the top of rt5677_probe, but then you will also
> be moving these calls:
> 
>         rt5677_init_gpio(i2c);
>         ret = rt5677_init_irq(i2c);
> 
> Which register a GPIO chip themselves, which may be a dependency for probing
> other bits of the sound stack so moving those 2 calls is a bad idea.
> 
> This means that the codec-driver itself and specifically the  rt5677_i2c_probe()
> function is pretty much the only remaining place where you can add the
> devm_acpi_dev_add_driver_gpios() call. Note that you may also need to set some
> pdata settings. For the rt5640 and rt5651 drivers we set some device properties
> from the machine driver and check those in the component probe function. But
> rt5677 already depends on various props inside the i2c probe function.
> 
> Note that taking care of machine specific bits in the codec driver is not
> unheard of, the rt5645.c also does this and includes a DMI table for this
> even though typically this would be more appropriate for the machine driver.
> 
> So in this case given the constraints I think it is fine to de a DMI match
> and add the devm_acpi_dev_add_driver_gpios() call based on that to the
> codec driver itself, like we are doing in sound/soc/codecs/rt5645.c, you
> can then also set some of the pdata based on the DMI match as needed.
> 
> For now I would not worry about making this generic, my suggestion would
> be to add a "rt5677_lenovo_yogabook_fixup" function which stars with the
> DMI check (and bails if it fails) and then does whatever you need wrt
> both the devm_acpi_dev_add_driver_gpios() call and the pdata settings.
> 
> And then add a call to rt5677_lenovo_yogabook_fixup() directly under the
> rt5677_read_device_properties() call in rt5677_i2c_probe().
> 
> We can worry about making the X86 machine specific fixups more generic
> when we need to add them for a second X86 device.
> 
> Regards,
> 
> Hans

OK, thanks for the answer. This sounds not ideal but reasonable, I will go
by such way.


-- 
Yauhen Kharuzhy
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
