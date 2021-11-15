Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A14560A3
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:37:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C70801899;
	Thu, 18 Nov 2021 17:36:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C70801899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253442;
	bh=8re/QsV/3GPHXV9j74dqu0H+3pTypCailVuz8uMMvrE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rXOa6NVciYS0TTP63G2m3EMTPqgFbk9anEW4EFQMo1lUJXSL9kviIh0kZ+QX98Kqf
	 lQOPNIe8F3dsx9ZMdq2esNunjNd1i+nUkBuvAd6SUKfiGde26D3x+QN/yhU0HdO+3Y
	 6lLYTm+rMeNJRADg9bpIaPvEkab3NpwPBlpPa9ZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9B8AF8051C;
	Thu, 18 Nov 2021 17:33:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6739CF8027D; Mon, 15 Nov 2021 12:50:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EF0FF80134
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 12:50:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EF0FF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.b="DTtRDp36"
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A4AB9CA;
 Mon, 15 Nov 2021 12:50:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636977002;
 bh=8re/QsV/3GPHXV9j74dqu0H+3pTypCailVuz8uMMvrE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DTtRDp36OT7fx+mEQdB5Q6I6Uf3svTjc7O60k3oZ4d4LDZwX9gRNLXKCFKYdS58b6
 iochdzQTE6K7vejlHf4MMrQFHA3VGrfZCRSuARACO154L7RPOUcQFEq3FEieaAnbP9
 1Q/7byArzgxRl2K9AECFy7SDhkfUFmq2YmZNiRrQ=
Date: Mon, 15 Nov 2021 13:49:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 08/11] dmaengine: xilinx_dpdma: stop using slave_id field
Message-ID: <YZJJVA/92KYH8hQL@pendragon.ideasonboard.com>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
 <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
X-Mailman-Approved-At: Thu, 18 Nov 2021 17:33:03 +0100
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

Hi Arnd,

On Mon, Nov 15, 2021 at 11:21:30AM +0100, Arnd Bergmann wrote:
> On Mon, Nov 15, 2021 at 10:14 AM Laurent Pinchart wrote:
> > On Mon, Nov 15, 2021 at 09:54:00AM +0100, Arnd Bergmann wrote:
> > > @@ -1285,11 +1287,13 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
> > >       spin_lock_irqsave(&chan->lock, flags);
> > >
> > >       /*
> > > -      * Abuse the slave_id to indicate that the channel is part of a video
> > > -      * group.
> > > +      * Abuse the peripheral_config to indicate that the channel is part
> >
> > Is it still an abuse, or is this now the right way to pass custom data
> > to the DMA engine driver ?
> 
> It doesn't make the driver any more portable, but it's now being
> more explicit about it. As far as I can tell, this is the best way
> to pass data that cannot be expressed through the regular interfaces
> in DT and the dmaengine API.
> 
> Ideally there would be a generic way to pass this flag, but I couldn't
> figure out what this is actually doing, or whether there is a better
> way. Maybe Vinod has an idea.

I don't think we need a generic API in this case. The DMA engine is
specific to the display device, I don't foresee a need to mix-n-match.

> I'll change s/Abuse/Use/ for the moment until I get a definite answer.
> 
> > > +      * of a video group.
> > >        */
> > > -     if (chan->id <= ZYNQMP_DPDMA_VIDEO2)
> > > -             chan->video_group = config->slave_id != 0;
> > > +     pconfig = config->peripheral_config;
> >
> > This could be moved to the variable declaration above, up to you.
> 
> I considered that but since it doesn't fit in a normal 80-column
> line, it seemed best to do it here.
> 
> > > +     if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
> > > +         config->peripheral_size == sizeof(*pconfig))
> >
> > Silently ignoring a size mismatch isn't nice. Could we validate the size
> > at the beginning of the function and return an error ?
> 
> Yes, good idea. Since this would mean a bug in another driver,
> I'll add a WARN_ON() as well to make it clear which driver caused it.
> This is what I have now, let me know if you have any further suggestions:
> 
>         /*
>          * Use the peripheral_config to indicate that the channel is part
>          * of a video group. This requires matching use of the custom
>          * structure in each driver.
>          */
>         pconfig = config->peripheral_config;
>         if (WARN_ON(config->peripheral_size != 0 &&
>                     config->peripheral_size != sizeof(*pconfig)))
>                 return -EINVAL;

How about

 	if (WARN_ON(config->peripheral_config &&
		    config->peripheral_size != sizeof(*pconfig)))

> 
>         spin_lock_irqsave(&chan->lock, flags);
>         if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
>             config->peripheral_size == sizeof(*pconfig))

And here you can test pconfig != NULL.

>                 chan->video_group = pconfig->video_group;
>         spin_unlock_irqrestore(&chan->lock, flags);
> 
>         return 0;
> 
> > With these issues addressed,
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
