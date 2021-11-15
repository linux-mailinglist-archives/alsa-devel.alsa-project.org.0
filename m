Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 759E84560B4
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:39:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B6CF18A6;
	Thu, 18 Nov 2021 17:38:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B6CF18A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253557;
	bh=wWcBwOu3cL9+U+zjsSAWtUQyMjCz3CDgA4mV4eUmQEI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aQGbu87tPkNRCyx0g6rLDS0TD1IfbIHYE3j6N69v82Dbn6dm+8dP5ASLbTtb4TlmY
	 l+uP7r6/+PzaG8QbkNjJo9yupEp/liFtPhxapgyTU3CVfT4v7qmTP/j4jVlQTD60yO
	 GkDbQfWB/6O2OFQk197s7LHVnbQVKhweScAIILuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E074F8053E;
	Thu, 18 Nov 2021 17:33:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0237F8027D; Mon, 15 Nov 2021 14:40:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F2AEF80134
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 14:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F2AEF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q4vpjH0u"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C1AA63237
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 13:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636983617;
 bh=wWcBwOu3cL9+U+zjsSAWtUQyMjCz3CDgA4mV4eUmQEI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Q4vpjH0uJaOnwWSUMmOGk4RBT6eS8WH2rt9ntVsxRfGOv9U1AcRtQ11fRaF90BIV8
 sqeJ0HBpuF+KPmzxxWjlJGgSJ1OjqCnX5IF3kDB9UyaLteVQzEs63BelRJSGp/MN27
 rl3mqKgow43UyjRBZHGLKQ4QfjwptO5RKrADCb33Z2mbHzpBKSuGr6uGe5kRDEdiBG
 HHrLzrj7SUybGgQXnJJsO7yrqVHV48pmOVUw23xSRWxB7Me79U0ZJtPK4hVpkgoTGX
 utmi82G0Uxv9J6Q2ftbl+jiVLtnlcx62LHYmA20iHfeUpWAVrLzRRvgSwCTpk4pzn6
 ofL6tkRYcgMKA==
Received: by mail-wr1-f51.google.com with SMTP id u1so30788945wru.13
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 05:40:17 -0800 (PST)
X-Gm-Message-State: AOAM530tQtVOPtbBFUKwmsPZ9fcHl91mgG37pHyu6FheXjREN4jvC5Qa
 w16RZ6unvuv45SjVtuoLFkn0koYnJwBTKUFC9tU=
X-Google-Smtp-Source: ABdhPJydx+lGNyCCL10Ss+u6AlrY7F7Dh3irA5L/rafXQwz2EG7YLwST7GsA7bIvQOTqpVGT64n5uQbouKk1WaS2cho=
X-Received: by 2002:adf:f088:: with SMTP id n8mr7443019wro.411.1636983615679; 
 Mon, 15 Nov 2021 05:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
 <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
 <CAK8P3a1Fu11-e0CK2of8u3ebdjom84UKuXhBKi5FUs5ZPPdOVA@mail.gmail.com>
 <YZJJVA/92KYH8hQL@pendragon.ideasonboard.com>
 <CAK8P3a27rPBVbU-PrYR0BE4KV2DyJk7FoXaeDS=FU1=_RSwoQQ@mail.gmail.com>
 <YZJbLol1llm+puDT@pendragon.ideasonboard.com>
In-Reply-To: <YZJbLol1llm+puDT@pendragon.ideasonboard.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 14:39:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a16s6dwvb-7REjF-pmnKod2qQRq+mta-g8pDXbQpGQvHA@mail.gmail.com>
Message-ID: <CAK8P3a16s6dwvb-7REjF-pmnKod2qQRq+mta-g8pDXbQpGQvHA@mail.gmail.com>
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

On Mon, Nov 15, 2021 at 2:05 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Nov 15, 2021 at 01:38:07PM +0100, Arnd Bergmann wrote:
> > On Mon, Nov 15, 2021 at 12:49 PM Laurent Pinchart wrote:
> >
> > Right. I wonder if there is even a point in using the dmaengine API
> > in that case, I think for other single-purpose drivers we tend to just
> > integrate the functionality in the client driver. No point changing this
> > now of course, but it does feel odd.
>
> I agree, and that's what I would have done as well, if it wasn't for the
> fact that the DMA engine also supports a second client for audio. This
> isn't supported in upstream yet. We could still have created an ad-hoc
> solution, possibly based on the components framework, but the DMA engine
> subsystem wasn't a bad fit.

Ah, makes sense. In this case, I guess the data could have been
part of the DMA specifier after all, in a second cell after the
channel number.

        Arnd
