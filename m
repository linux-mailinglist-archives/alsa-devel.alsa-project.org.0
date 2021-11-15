Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E41745609C
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:36:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19D31181A;
	Thu, 18 Nov 2021 17:35:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19D31181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253390;
	bh=ngAS50rMmpV59azjOqW2oXCBrEGHx6Ekm0yN36KEY7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qKNUHHOB5jxGq+Aavn5LAjdWFiR0E4z/wPq4uU1tksgldEJOno1b3CDEVzP0rTfpG
	 uONst6hbwwal5zDDsncl4C+Th6iJeVnqXHGPOqipEglLMHNSAzv5iAfLgSyoLP/NnM
	 FycI7jCbvfw+Ldcm/oTZscerdYCpKJuGngTVFFFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46EA5F80510;
	Thu, 18 Nov 2021 17:33:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9845EF8027D; Mon, 15 Nov 2021 11:22:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEAF8F80134
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 11:21:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEAF8F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oHFZaspA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9893C63225
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 10:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636971708;
 bh=ngAS50rMmpV59azjOqW2oXCBrEGHx6Ekm0yN36KEY7k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oHFZaspA4e0JT2Bappei5MG7xUfxAKnXH43mnsdk+R7rbsdvrD3kUDLGpF994Lv8o
 iEcy1Ug+arpeVBA1gxKJr+XFzRMEEncjc2K9qzGu6o1iL3o1bXVBgArPKaXh3sM1KT
 pqByKGVIvlUsnVpeQARzzgb4qc9a17HQolmIyWVeIgrGPfLon8Wq7NbhnRmyj2zeoK
 0Pg+gQgghuvRxMHQ7IajfS53HSxlou+O9e931O/rQqPebWyZ0jpnTj4gKlP7r3MKfQ
 +aPZLeOvA+8d8JqKBiRKzMCqrAk2Zb1jIIa11uVmY4fIYw/I+SHpBH5/oWpHirfE6z
 g6me8ygTpOC9g==
Received: by mail-wr1-f49.google.com with SMTP id c4so29523024wrd.9
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 02:21:48 -0800 (PST)
X-Gm-Message-State: AOAM531LROI0mSgovGMqNUSAOyFsNcf52T3X9y2bs94phWdRsIKSW2YD
 JarL3s6LgE0VIghz+wNPmtQHUyteiYZ7T/YutjI=
X-Google-Smtp-Source: ABdhPJyrUjRCeMXfDabLLUXG4+a6meFiuvFYQKG804WvMbrQRiaBMGWgH0F0OdgqzdIGH+oZqJIqfFrTkkuSnIDyxB0=
X-Received: by 2002:adf:df89:: with SMTP id z9mr45196660wrl.336.1636971706955; 
 Mon, 15 Nov 2021 02:21:46 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
In-Reply-To: <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 11:21:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
Message-ID: <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
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

On Mon, Nov 15, 2021 at 10:14 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Nov 15, 2021 at 09:54:00AM +0100, Arnd Bergmann wrote:
> > @@ -1285,11 +1287,13 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
> >       spin_lock_irqsave(&chan->lock, flags);
> >
> >       /*
> > -      * Abuse the slave_id to indicate that the channel is part of a video
> > -      * group.
> > +      * Abuse the peripheral_config to indicate that the channel is part
>
> Is it still an abuse, or is this now the right way to pass custom data
> to the DMA engine driver ?

It doesn't make the driver any more portable, but it's now being
more explicit about it. As far as I can tell, this is the best way
to pass data that cannot be expressed through the regular interfaces
in DT and the dmaengine API.

Ideally there would be a generic way to pass this flag, but I couldn't
figure out what this is actually doing, or whether there is a better
way. Maybe Vinod has an idea.

I'll change s/Abuse/Use/ for the moment until I get a definite answer.

> > +      * of a video group.
> >        */
> > -     if (chan->id <= ZYNQMP_DPDMA_VIDEO2)
> > -             chan->video_group = config->slave_id != 0;
> > +     pconfig = config->peripheral_config;
>
> This could be moved to the variable declaration above, up to you.

I considered that but since it doesn't fit in a normal 80-column
line, it seemed best to do it here.

> > +     if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
> > +         config->peripheral_size == sizeof(*pconfig))
>
> Silently ignoring a size mismatch isn't nice. Could we validate the size
> at the beginning of the function and return an error ?

Yes, good idea. Since this would mean a bug in another driver,
I'll add a WARN_ON() as well to make it clear which driver caused it.
This is what I have now, let me know if you have any further suggestions:

        /*
         * Use the peripheral_config to indicate that the channel is part
         * of a video group. This requires matching use of the custom
         * structure in each driver.
         */
        pconfig = config->peripheral_config;
        if (WARN_ON(config->peripheral_size != 0 &&
                    config->peripheral_size != sizeof(*pconfig)))
                return -EINVAL;

        spin_lock_irqsave(&chan->lock, flags);
        if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
            config->peripheral_size == sizeof(*pconfig))
                chan->video_group = pconfig->video_group;
        spin_unlock_irqrestore(&chan->lock, flags);

        return 0;

> With these issues addressed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks,

       Arnd
