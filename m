Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA224560BB
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:40:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0573518A2;
	Thu, 18 Nov 2021 17:39:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0573518A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253639;
	bh=rcwRBlCKqfF/fOP7nToqyQtxiDrvbRwb9qhV9pcd3SE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bxevHmVAv9KvmjwLsWpEj/xD1ti14v7nWo8ENHn/aXd1EpQ6gvsV5mHulwStuk7YQ
	 cu54SQw21bEDHaduCcuoycUYy3B5n3g8hNkazQj0GQSkdM7cY5HD9qBaTC4ttZ0wtV
	 soOcJpcAkMbQidYcIsatRp7vQ0aW7B+zN3zBMYgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 476D3F80567;
	Thu, 18 Nov 2021 17:33:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70781F80272; Tue, 16 Nov 2021 05:29:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC599F80089
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 05:29:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC599F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WCkkYmiC"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66AA16023D;
 Tue, 16 Nov 2021 04:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637036939;
 bh=rcwRBlCKqfF/fOP7nToqyQtxiDrvbRwb9qhV9pcd3SE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WCkkYmiCsuCs6VTYyStyePuhjavoZznkD15Pfk4kfmFcnpOyhqwefXwCEerdsi5BB
 gaxqtKh7IVnWz3O+cSAsdJUjs6zKFkagpHyNquC8O99klBS/lKo/7gFtT7CHdCC6ar
 6K/pSsHI8+2FH3V1I1L7V2qq8dmjNebnK0MyEtDZ/hdrNv4x1IyseRUmNFq3EiZJ7c
 1oiPRI0DMs2kje0Hvslatdsud/obFQMRW9uHW8NpKk4mIv94ytNZbHvJadN/Nn9YZY
 tGLIxmhA6nCk6OcdFZAV34UHFuwVplf/2bcz9WsNFmm3THY7N2KypMCnwedbGoDGcy
 AW5qdaBZVvhpQ==
Date: Tue, 16 Nov 2021 09:58:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 08/11] dmaengine: xilinx_dpdma: stop using slave_id field
Message-ID: <YZMzhoWX0S5oPI6j@matsya>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
 <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
X-Mailman-Approved-At: Thu, 18 Nov 2021 17:33:03 +0100
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
 Laxman Dewangan <ldewangan@nvidia.com>, Baolin Wang <baolin.wang7@gmail.com>
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

On 15-11-21, 11:21, Arnd Bergmann wrote:
> On Mon, Nov 15, 2021 at 10:14 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
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
> 
> I'll change s/Abuse/Use/ for the moment until I get a definite answer.

I would feel this is still not use for the peripheral_config, but lets
keep it to get rid of slave_id.

Also, I would be better if this was moved to DT as the next cell, don't
recall why that was not done/feasible.

-- 
~Vinod
