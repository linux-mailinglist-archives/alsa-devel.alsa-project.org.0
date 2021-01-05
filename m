Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD78E2EA1A2
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 01:53:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 759401676;
	Tue,  5 Jan 2021 01:52:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 759401676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609808023;
	bh=CaCb3AkloOR/gj/zR9Qr+2la6Oju7yx17SC3pwmmucs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qHXTYWniJ6GnWBHYSPVVQXG4ujNqXLkcQKn4ExaKcjQ6e12K8FVI2Vraxfwd39GB/
	 3Yi5rW8C4Sq/+7ZWsn2kMlQbjKJ5n8drqPiJHgppxd5SeJsOgfcKkv/selt3O0Uh9X
	 j29ZwKmwps6+0iQw9eF3gcmE66+b5y1wuwZ259ZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D936F80167;
	Tue,  5 Jan 2021 01:52:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4808EF80166; Tue,  5 Jan 2021 01:52:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_32,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7135FF8012C
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 01:52:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7135FF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="VH4YB3KA"
Received: by mail-ed1-x534.google.com with SMTP id g24so29304564edw.9
 for <alsa-devel@alsa-project.org>; Mon, 04 Jan 2021 16:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WBmAQEVK+d4iAJti2GEvFbY9xySgwvFGBDCdqOb6r0o=;
 b=VH4YB3KAxYrKdsAEQNP8eGJvmHZPYEIOL/Wk5c1jc1CaDg0kbcYFUxsMzIIdMEw6NJ
 roxcZmJiCU51O0ZrSmD2phPcmySG3sPOi2M/NJaZw8gPK2V+eyGY97r+oS8igSd+voqd
 OrjM6uXZUYzkHrzjGNWvYIoBvw/O7+aNi51H0LOmgcljqkAbT7kzzANZKl4fVSqiQRaM
 eNMgYm4AiYljDOm5/K05WqyKJZuZnYwAidOXCdsSgvEM7cdb02iEWL6u4Ey+rE8v2mwz
 +2McsRVPDBLvpXX9Y87Bd8pdQw19z/iCdiYH2EqAk28vs1SHisBJsjZAo4M50pvK4S4K
 YC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WBmAQEVK+d4iAJti2GEvFbY9xySgwvFGBDCdqOb6r0o=;
 b=cpgm3hYqeOyxBD7Ug+IMYyxJ0HcYKxZDj5Z7q6rfv/p4GoKsrBvUPZIzu7go9pjJ51
 Hgc9e7kEOkBu+zwlL+RTWNysATZBxfQQyx1ZI05KR4cD0EHgseCVJddrv9CjvFvXVuiI
 VDu9IjwZLwqlra7EHY+6xGNyie0USb1AFExBNAGoHlKGPa+jbHG+fQ6kMMldyq/la4Bi
 Y6UwYfzpTIMg/YsBpUM8RqMfOsxTe1s+yf1+5ot2nBXhGr5NbMe1jhWK7hUWYq0FF75L
 htH6aDqKq62gOGHr4MaMAkwP382x5CDNkGCM/95TzcabG9HaZ+r3p7eOlbon70JexwhH
 4rBg==
X-Gm-Message-State: AOAM532EbOqSIVTVCiinxy/vdVdT1+BTA836uiWvnrRIPYH0FWCMlPj3
 BhzZHxj66S6iBN7BlQ/ikdZIF0ZR0hw3cE8WoSCI/g==
X-Google-Smtp-Source: ABdhPJx/xFK6oHnwbgHxjjQstwquyCH8dZKA1eVEWKIXofDnOHNlD62w60xu2i4e02Nc/f/wfco70KpV1hZ/ILyBB1k=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr72431946edr.97.1609807918552; 
 Mon, 04 Jan 2021 16:51:58 -0800 (PST)
MIME-Version: 1.0
References: <20201218140854.GW552508@nvidia.com>
 <20201218155204.GC5333@sirena.org.uk>
 <20201218162817.GX552508@nvidia.com> <20201218180310.GD5333@sirena.org.uk>
 <20201218184150.GY552508@nvidia.com> <20201218203211.GE5333@sirena.org.uk>
 <20201218205856.GZ552508@nvidia.com> <20201221185140.GD4521@sirena.org.uk>
 <20210104180831.GD552508@nvidia.com> <20210104211930.GI5645@sirena.org.uk>
 <20210105001341.GL552508@nvidia.com>
In-Reply-To: <20210105001341.GL552508@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 4 Jan 2021 16:51:51 -0800
Message-ID: <CAPcyv4gxprMo1LwGTqGDyN-z2TrXLcAvJ3AN9-fbUs6y-LwXeA@mail.gmail.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
To: Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kiran Patil <kiran.patil@intel.com>, alsa-devel@alsa-project.org,
 David Miller <davem@davemloft.net>, linux-rdma <linux-rdma@vger.kernel.org>,
 Greg KH <gregkh@linuxfoundation.org>, Martin Habets <mhabets@solarflare.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fred Oh <fred.oh@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
 Lee Jones <lee.jones@linaro.org>, Shiraz Saleem <shiraz.saleem@intel.com>,
 Netdev <netdev@vger.kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
 Parav Pandit <parav@mellanox.com>
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

On Mon, Jan 4, 2021 at 4:14 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Mon, Jan 04, 2021 at 09:19:30PM +0000, Mark Brown wrote:
>
>
> > > Regardless of the shortcut to make everything a struct
> > > platform_device, I think it was a mistake to put OF devices on
> > > platform_bus. Those should have remained on some of_bus even if they
> >
> > Like I keep saying the same thing applies to all non-enumerable buses -
> > exactly the same considerations exist for all the other buses like I2C
> > (including the ACPI naming issue you mention below), and for that matter
> > with enumerable buses which can have firmware info.
>
> And most busses do already have their own bus type. ACPI, I2C, PCI,
> etc. It is just a few that have been squished into platform, notably
> OF.
>

I'll note that ACPI is an outlier that places devices on 2 buses,
where new acpi_driver instances are discouraged [1] in favor of
platform_drivers. ACPI scan handlers are awkwardly integrated into the
Linux device model.

So while I agree with sentiment that an "ACPI bus" should
theoretically stand on its own there is legacy to unwind.

I only bring that up to keep the focus on how to organize drivers
going forward, because trying to map some of these arguments backwards
runs into difficulties.

[1]: http://lore.kernel.org/r/CAJZ5v0j_ReK3AGDdw7fLvmw_7knECCg2U_huKgJzQeLCy8smug@mail.gmail.com

> > > are represented by struct platform_device and fiddling in the core
> > > done to make that work OK.
> >
> > What exactly is the fiddling in the core here, I'm a bit unclear?
>
> I'm not sure, but I bet there is a small fall out to making bus_type
> not 1:1 with the struct device type.. Would have to attempt it to see
>
> > > This feels like a good conference topic someday..
> >
> > We should have this discussion *before* we get too far along with trying
> > to implement things, we should at least have some idea where we want to
> > head there.
>
> Well, auxillary bus is clearly following the original bus model
> intention with a dedicated bus type with a controlled naming
> scheme. The debate here seems to be "what about platform bus" and
> "what to do with mfd"?
>
> > Those APIs all take a struct device for lookup so it's the same call for
> > looking things up regardless of the bus the device is on or what
> > firmware the system is using - where there are firmware specific lookup
> > functions they're generally historical and shouldn't be used for new
> > code.  It's generally something in the form
> >
> >       api_type *api_get(struct device *dev, const char *name);
>
> Well, that is a nice improvement since a few years back when I last
> worked on this stuff.
>
> But now it begs the question, why not push harder to make 'struct
> device' the generic universal access point and add some resource_get()
> API along these lines so even a platform_device * isn't needed?
>
> Then the path seems much clearer, add a multi-bus-type device_driver
> that has a probe(struct device *) and uses the 'universal api_get()'
> style interface to find the generic 'resources'.
>
> The actual bus types and bus structs can then be split properly
> without the boilerplate that caused them all to be merged to platform,
> even PCI could be substantially merged like this.
>
> Bonus points to replace the open coded method disptach:
>
> int gpiod_count(struct device *dev, const char *con_id)
> {
>         int count = -ENOENT;
>
>         if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node)
>                 count = of_gpio_get_count(dev, con_id);
>         else if (IS_ENABLED(CONFIG_ACPI) && dev && ACPI_HANDLE(dev))
>                 count = acpi_gpio_count(dev, con_id);
>
>         if (count < 0)
>                 count = platform_gpio_count(dev, con_id);
>
> With an actual bus specific virtual function:
>
>     return dev->bus->gpio_count(dev);
>
> > ...and then do the same thing for every other bus with firmware
> > bindings.  If it's about the firmware interfaces it really isn't a
> > platform bus specific thing.  It's not clear to me if that's what it is
> > though or if this is just some tangent.
>
> It should be split up based on the unique naming scheme and any bus
> specific API elements - like raw access to ACPI or OF data or what
> have you for other FW bus types.

I agree that the pendulum may have swung too far towards "reuse
existing bus_type", and auxiliary-bus unwinds some of that, but does
the bus_type really want to be an indirection for driver apis outside
of bus-specific operations?
