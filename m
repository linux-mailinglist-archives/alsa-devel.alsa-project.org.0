Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8568B4560A9
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:38:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 272C0182F;
	Thu, 18 Nov 2021 17:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 272C0182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253486;
	bh=0vPaiFLUq2SXWicOiHJ0dTL68j+HqvYqhdUUZpm4Lbg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OuFw6a6+H9pxTZD5Tvie/UoV4Zvbfr2IPryS6fULI6//F+4yD8jRv9/Uu3PrMyJRQ
	 /m8t23IaUfWBTDyDDOwSXcwv85aTxT9KRTbFJSFQdtpSyBGZqhQ421VQi9Ksr04kDe
	 7Ro3JnAC6wWbLA+aELXVfAeFSlToZ/4iRfnF7Kqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FDCEF8052D;
	Thu, 18 Nov 2021 17:33:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EC9AF801D5; Mon, 15 Nov 2021 13:38:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D68EF800FA
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 13:38:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D68EF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="I+1x2XZx"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 446E661B72
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 12:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636979905;
 bh=0vPaiFLUq2SXWicOiHJ0dTL68j+HqvYqhdUUZpm4Lbg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=I+1x2XZxjf0LcgW3lMmbiJPZ71Bi+3kqOGuAZRKXN1JfNBFrZaiB21OzI8/74f0h0
 Qq9j3mNJNww5Ebh37UUU7T73Uy/xgxrT9Cch7mYImOv2H/bbOmofM9xkajEGTkGGUU
 hGAI73KgAeiXM888w+zysyYQTZ4yYyjDXcXqXXwQJ8IyYB0pf/b0pqA/XCjqw9IpRl
 yCWpvb6UA7WovNrxde2iEzHRITt42AWtZE7nvXGbJMW3vN4eAR3DyqEs1DZrNZzLk2
 tuMyHLag1K86+X0psZqBhLcvq1czh8i8zV/S46+iyDlDN0sbFnwCD3e9XH7d1GqYQT
 IxYpNW3g9oKFg==
Received: by mail-wm1-f53.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso10403744wmr.4
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 04:38:25 -0800 (PST)
X-Gm-Message-State: AOAM53333EkO60bu5/X68zhAAovMmcOoPqYtmL0UBQ6loSiwVMosCS6l
 er4Hnb3yepJhY11pgM6J1l/L51e3G3gFwIRn8pA=
X-Google-Smtp-Source: ABdhPJwFTprJJd11s9duELVend6oLQx+lemeU4w9vOaJiXxZUrLq0sghW72KOFAqYJMNV8KCFht4GWVIPZFIhNgyYas=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr58047076wmi.173.1636979903584; 
 Mon, 15 Nov 2021 04:38:23 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
 <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
 <YZJJVA/92KYH8hQL@pendragon.ideasonboard.com>
In-Reply-To: <YZJJVA/92KYH8hQL@pendragon.ideasonboard.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 13:38:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a27rPBVbU-PrYR0BE4KV2DyJk7FoXaeDS=FU1=_RSwoQQ@mail.gmail.com>
Message-ID: <CAK8P3a27rPBVbU-PrYR0BE4KV2DyJk7FoXaeDS=FU1=_RSwoQQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] dmaengine: xilinx_dpdma: stop using slave_id field
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 18 Nov 2021 17:33:02 +0100
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-staging@lists.linux.dev, Michal Simek <michal.simek@xilinx.com>,
 Jon Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, dmaengine@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Baolin Wang <baolin.wang7@gmail.com>
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

On Mon, Nov 15, 2021 at 12:49 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Nov 15, 2021 at 11:21:30AM +0100, Arnd Bergmann wrote:
> > On Mon, Nov 15, 2021 at 10:14 AM Laurent Pinchart wrote:
> > > On Mon, Nov 15, 2021 at 09:54:00AM +0100, Arnd Bergmann wrote:
> > > > @@ -1285,11 +1287,13 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
> > > >       spin_lock_irqsave(&chan->lock, flags);
> > > >
> > > >       /*
> > > > -      * Abuse the slave_id to indicate that the channel is part of a video
> > > > -      * group.
> > > > +      * Abuse the peripheral_config to indicate that the channel is part
> > >
> > > Is it still an abuse, or is this now the right way to pass custom data
> > > to the DMA engine driver ?
> >
> > It doesn't make the driver any more portable, but it's now being
> > more explicit about it. As far as I can tell, this is the best way
> > to pass data that cannot be expressed through the regular interfaces
> > in DT and the dmaengine API.
> >
> > Ideally there would be a generic way to pass this flag, but I couldn't
> > figure out what this is actually doing, or whether there is a better
> > way. Maybe Vinod has an idea.
>
> I don't think we need a generic API in this case. The DMA engine is
> specific to the display device, I don't foresee a need to mix-n-match.


Right. I wonder if there is even a point in using the dmaengine API
in that case, I think for other single-purpose drivers we tend to just
integrate the functionality in the client driver. No point changing this
now of course, but it does feel odd.

From my earlier reading of the driver, my impression was that this
is just a memory-to-memory device, so it could be used that way
as well, but does need a flag when working on the video memory.
I couldn't quite make sense of that though.

> >         /*
> >          * Use the peripheral_config to indicate that the channel is part
> >          * of a video group. This requires matching use of the custom
> >          * structure in each driver.
> >          */
> >         pconfig = config->peripheral_config;
> >         if (WARN_ON(config->peripheral_size != 0 &&
> >                     config->peripheral_size != sizeof(*pconfig)))
> >                 return -EINVAL;
>
> How about
>
>         if (WARN_ON(config->peripheral_config &&
>                     config->peripheral_size != sizeof(*pconfig)))
>
> >
> >         spin_lock_irqsave(&chan->lock, flags);
> >         if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
> >             config->peripheral_size == sizeof(*pconfig))
>
> And here you can test pconfig != NULL.

Good idea. Changed now, using 'if (pconfig)' without the '!= NULL'
in both expressions.

        Arnd
