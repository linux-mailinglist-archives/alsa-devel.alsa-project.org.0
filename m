Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 493BD2DEBAB
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 23:38:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB33B17F0;
	Fri, 18 Dec 2020 23:37:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB33B17F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608331091;
	bh=KqRr130JeaYwhGj8VX/Knyfww3OEfVv3am2OHib8Yeg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RxZ3S3tSD0PtaDnVIBPP8rWeKKHgJv5533wZ9ZuWGd944hzKwVJHwPevrGk1mQgDX
	 Rijfy6Yu38c6ib12glpjVLHn1nWVaHGxqJzF46MZeJoE7Fn2vOfxwpm40ZLdOaGlz5
	 OjWWakzGRQuOSuakTSB8O/AplOUxMKPKhzVWl27c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28D51F8014B;
	Fri, 18 Dec 2020 23:36:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78510F801F7; Fri, 18 Dec 2020 23:36:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 264E1F80168
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 23:36:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 264E1F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="m3zOHE0w"
Received: by mail-ej1-x633.google.com with SMTP id x16so5435517ejj.7
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 14:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xTXy3XpNAms3ekkwQw/otErW5WULs88likHcciGFXeM=;
 b=m3zOHE0w3r6ahzpcAgQfVzAPl2i6KJvip2SKXyaczrJEGZnlHaHWDc6Y6e6Ue/Fk3w
 conhoHW1dPczYVsQmj2eLqr1B0wAyqCg0qSM7LzF0bAk5x3WGRvz9e63oJoCLrRPxcAo
 NCup3hmGffugX6i074UpCmza+m0e4URw20OviQ33kIumJ5YVLEwK+806pVpfQefsT2xX
 +qBOFn99wzNCn8q6eC1jAdUSPLxRJcloKOs+Xtbapw/PIX8mOrEx3E5skNWYliCtMaLN
 OEAidGbLkRLvVIrKn49ZsuMwTg+JPymV16f3E3Q1jq0ujaCjujl+6wptrt/7u45O2l8Y
 TryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xTXy3XpNAms3ekkwQw/otErW5WULs88likHcciGFXeM=;
 b=SQI0tJAgamqzxbG9TIy0LQXUqOdKMXkmiU/Y3gVe5U2aDKdlebRlX1HS4cLxG5aUm9
 +/wpMfd/udvfP1NYQjHoxRerTGUdCVzUnMpC52pMg1+l6yidxxAx0nHS8X4Tj+43KYnP
 HwKcDB2cfYzAWVZsJqahT1H7i6mdciHPSl7Kg51H8CRxGvVoPUxXXAHIbrVQ00PUzsNS
 ESOsfPcNAHdzNlioANVx1aSl+GPvcw84RFNG2j7De0lZgktzkMui2ETC7LUsRqgGTO1x
 M9DFEJrRF7zK82ZI6ZvkUGzDdbxxwtHpMuR/GBefYYoqQtnhv1FMRgKG24LSxcI7phK+
 Halg==
X-Gm-Message-State: AOAM531FPgLXLR5qhU5yMhXiNoaj4McLkK9capnUw8YeA9gH1QSYygQr
 vY+6jvE15BSfAcJdRz7TWoOKTTZ9psRKCjWMryWjpA==
X-Google-Smtp-Source: ABdhPJxVIJsNw1VhtEN2EC6NpPsqgkomLtwJyLMDGzQEDyQsVR1b9PxyeXfVm3r7ts5mggWcfo7h1ujtbU0n5AwKaRw=
X-Received: by 2002:a17:906:a29a:: with SMTP id
 i26mr6063250ejz.45.1608330985195; 
 Fri, 18 Dec 2020 14:36:25 -0800 (PST)
MIME-Version: 1.0
References: <20201217211937.GA3177478@piout.net> <X9xV+8Mujo4dhfU4@kroah.com>
 <20201218131709.GA5333@sirena.org.uk>
 <20201218140854.GW552508@nvidia.com>
 <20201218155204.GC5333@sirena.org.uk> <20201218162817.GX552508@nvidia.com>
 <20201218180310.GD5333@sirena.org.uk> <20201218184150.GY552508@nvidia.com>
 <20201218203211.GE5333@sirena.org.uk> <20201218205856.GZ552508@nvidia.com>
 <20201218211658.GH3143569@piout.net>
In-Reply-To: <20201218211658.GH3143569@piout.net>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 18 Dec 2020 14:36:14 -0800
Message-ID: <CAPcyv4iruqY546kM68Dy_h4J5Qc6Ry-eGyVKhAp5eufsZcNksQ@mail.gmail.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kiran Patil <kiran.patil@intel.com>, David Miller <davem@davemloft.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Martin Habets <mhabets@solarflare.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fred Oh <fred.oh@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Shiraz Saleem <shiraz.saleem@intel.com>, Netdev <netdev@vger.kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>, Parav Pandit <parav@mellanox.com>
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

On Fri, Dec 18, 2020 at 1:17 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 18/12/2020 16:58:56-0400, Jason Gunthorpe wrote:
> > On Fri, Dec 18, 2020 at 08:32:11PM +0000, Mark Brown wrote:
> >
> > > > So, I strongly suspect, MFD should create mfd devices on a MFD bus
> > > > type.
> > >
> > > Historically people did try to create custom bus types, as I have
> > > pointed out before there was then pushback that these were duplicating
> > > the platform bus so everything uses platform bus.
> >
> > Yes, I vaugely remember..
> >
> > I don't know what to say, it seems Greg doesn't share this view of
> > platform devices as a universal device.
> >
> > Reading between the lines, I suppose things would have been happier
> > with some kind of inheritance scheme where platform device remained as
> > only instantiated directly in board files, while drivers could bind to
> > OF/DT/ACPI/FPGA/etc device instantiations with minimal duplication &
> > boilerplate.
> >
> > And maybe that is exactly what we have today with platform devices,
> > though the name is now unfortunate.
> >
> > > I can't tell the difference between what it's doing and what SOF is
> > > doing, the code I've seen is just looking at the system it's running
> > > on and registering a fixed set of client devices.  It looks slightly
> > > different because it's registering a device at a time with some wrapper
> > > functions involved but that's what the code actually does.
> >
> > SOF's aux bus usage in general seems weird to me, but if you think
> > it fits the mfd scheme of primarily describing HW to partition vs
> > describing a SW API then maybe it should use mfd.
> >
> > The only problem with mfd as far as SOF is concerned was Greg was not
> > happy when he saw PCI stuff in the MFD subsystem.
> >
>
> But then again, what about non-enumerable devices on the PCI device? I
> feel this would exactly fit MFD. This is a collection of IPs that exist
> as standalone but in this case are grouped in a single device.
>
> Note that I then have another issue because the kernel doesn't support
> irq controllers on PCI and this is exactly what my SoC has. But for now,
> I can just duplicate the irqchip driver in the MFD driver.
>
> > This whole thing started when Intel first proposed to directly create
> > platform_device's in their ethernet driver and Greg had a quite strong
> > NAK to that.
>
> Let me point to drivers/net/ethernet/cadence/macb_pci.c which is a
> fairly recent example. It does exactly that and I'm not sure you could
> do it otherwise while still not having to duplicate most of macb_probe.
>

This still feels an orthogonal example to the problem auxiliary-bus is
solving. If a platform-device and a pci-device surface an IP with a
shared programming model that's an argument for a shared library, like
libata to house the commonality. In contrast auxiliary-bus is a
software model for software-defined sub-functionality to be wrapped in
a driver model. It assumes a parent-device / parent-driver hierarchy
that platform-bus and pci-bus do not imply.
