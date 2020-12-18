Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 763172DE995
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 20:11:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00C6817D7;
	Fri, 18 Dec 2020 20:10:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00C6817D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608318663;
	bh=qFe8EP7EKzyr4KWlk53fYbJLAQ53D14Yto2qyrZYLpA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ak+jdmVe4Q5oBhZj3MGU6F15u2qH22wRNfDxK3eFJSpninX/F6GI4qkxWC+r0vI/k
	 tlPtnCDWaGPmkYRy9qk/uiPUlz5h7iRhhRpdP0GdDHIyB+A5iIPeTknhG4m0N/rW2T
	 B5M2u8RNJMY8cz3gPWZC+gq/P5DQeop3F/baELMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 640C0F80240;
	Fri, 18 Dec 2020 20:09:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9E40F801F7; Fri, 18 Dec 2020 20:09:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC1D0F80168
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 20:09:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC1D0F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KQQTxWZh"
Received: by mail-wr1-x433.google.com with SMTP id m5so3419983wrx.9
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 11:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DsPzYSmK1PzNzvrUgHsnSLZZOIK5NlSaB+JDZhlEtOQ=;
 b=KQQTxWZhnTj/uNvQiy5xn4LTnyxBdtGdpkYyOFIpxGKBvQ0jRZD0TcZ/LTAWdqpOMc
 iBcpeBjOV6WolPKdkW0k8N0vFjZSuoQjHFQImAfO7PL9uwRQteKZBpMRX1HBVjykkDEA
 U3qmmLIdCJs5EYo9f3hmuHygRAauxGP2e50tehtEmbR5vg9qpkq3aVmWqG/A+Y3wM9B5
 x2A2CCcjsXOySa5bkd3cVqt3gKt7Jjj6iBIA9+aTTnKeHl3699g09lg3tnN0bCuc9+Po
 MkaSkh0ais3cCFxxZPmnNI/HE5mGjItnY4PhUTeeO8CRkP8j2f19YX9GIjqHvIP3l0rR
 LM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DsPzYSmK1PzNzvrUgHsnSLZZOIK5NlSaB+JDZhlEtOQ=;
 b=sdV30kZ7VcV0zxGopa18R118eyuzHiewPGcagYkGGpYO7Ffn/hRZHXCI3E5RM0y9JX
 j6PoLsK2OT6ho66yBKT13183DkNQ1Bv/qudohzRSx0KuD3YkeZr0sIrCnixuBvfyTh0C
 QM6kP49SYN2f0jrGYL3CGE7YkjQSjD5H4GoKNGlIGwADsfn8K0G6CZL9nckzl4gR/Gmm
 5D2lvM0/eCF8U882Zubkr2+acH/DzxKUvLtIRRQMy6wdkBxsGRgqDFqmw43TcvB3CluR
 K3Vhob1w9fHDHf3qSTOOoraNlQe5RPaJG9gelLmVOHSeXwhkjc2Dwlztp7JJDeZIQpqO
 T72Q==
X-Gm-Message-State: AOAM532CBSBd6kP5XcQUw0PZUDPXfnG2e5Q0S9RJ/U9NDdZ8qhGwvLSf
 uhWIaGvHLYPfFCpVCSpwRoSi7g==
X-Google-Smtp-Source: ABdhPJw2jm4Tmi76TPXnjr8OBHNcrvwwjBfCy+FlD9dVZuo+ZdRb6pVpABn/SW3x01x5YHD7dj9svw==
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr5940186wru.43.1608318554221; 
 Fri, 18 Dec 2020 11:09:14 -0800 (PST)
Received: from dell ([91.110.221.216])
 by smtp.gmail.com with ESMTPSA id s13sm12555285wmj.28.2020.12.18.11.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 11:09:13 -0800 (PST)
Date: Fri, 18 Dec 2020 19:09:11 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [resend/standalone PATCH v4] Add auxiliary bus support
Message-ID: <20201218190911.GT207743@dell>
References: <CAPcyv4iLG7V9JT34La5PYfyM9378acbLnkShx=6pOmpPK7yg3A@mail.gmail.com>
 <X8usiKhLCU3PGL9J@kroah.com> <20201217211937.GA3177478@piout.net>
 <X9xV+8Mujo4dhfU4@kroah.com> <20201218131709.GA5333@sirena.org.uk>
 <20201218140854.GW552508@nvidia.com>
 <20201218155204.GC5333@sirena.org.uk>
 <20201218162817.GX552508@nvidia.com>
 <20201218180310.GD5333@sirena.org.uk>
 <20201218184150.GY552508@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201218184150.GY552508@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kiran Patil <kiran.patil@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rdma <linux-rdma@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Martin Habets <mhabets@solarflare.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Parav Pandit <parav@mellanox.com>, Jakub Kicinski <kuba@kernel.org>,
 Dave Ertman <david.m.ertman@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>, Netdev <netdev@vger.kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>, David Miller <davem@davemloft.net>
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

On Fri, 18 Dec 2020, Jason Gunthorpe wrote:

> On Fri, Dec 18, 2020 at 06:03:10PM +0000, Mark Brown wrote:
> > On Fri, Dec 18, 2020 at 12:28:17PM -0400, Jason Gunthorpe wrote:
> > > On Fri, Dec 18, 2020 at 03:52:04PM +0000, Mark Brown wrote:
> > > > On Fri, Dec 18, 2020 at 10:08:54AM -0400, Jason Gunthorpe wrote:
> > 
> > > > > I thought the recent LWN article summed it up nicely, auxillary bus is
> > > > > for gluing to subsystems together using a driver specific software API
> > > > > to connect to the HW, MFD is for splitting a physical HW into disjoint
> > > > > regions of HW.
> > 
> > > > This conflicts with the statements from Greg about not using the
> > > > platform bus for things that aren't memory mapped or "direct firmware",
> > > > a large proportion of MFD subfunctions are neither at least in so far as
> > > > I can understand what direct firmware means.
> > 
> > > I assume MFD will keep existing and it will somehow stop using
> > > platform device for the children it builds.
> > 
> > If it's not supposed to use platform devices so I'm assuming that the
> > intention is that it should use aux devices, otherwise presumably it'd
> > be making some new clone of the platform bus but I've not seen anyone
> > suggesting this.
> 
> I wouldn't assume that, I certainly don't want to see all the HW
> related items in platform_device cloned roughly into aux device.
> 
> I've understood the bus type should be basically related to the thing
> that is creating the device. In a clean view platform code creates
> platform devices. DT should create DT devices, ACPI creates ACPI
> devices, PNP does pnp devices, etc
> 
> So, I strongly suspect, MFD should create mfd devices on a MFD bus
> type.
> 
> Alexandre's point is completely valid, and I think is the main
> challenge here, somehow avoiding duplication.
> 
> If we were to look at it with some OOP viewpoint I'd say the generic
> HW resource related parts should be some shared superclass between
> 'struct device' and 'struct platform/pnp/pci/acpi/mfd/etc_device'.

You're confusing things here.

ACPI, DT and MFD are not busses.  They are just methods to
describe/register devices which will operate on buses.

Busses include things like; I2C, SPI, PCI, USB and Platform (MMIO).

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
