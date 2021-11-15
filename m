Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F28FD45609F
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:37:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93278182F;
	Thu, 18 Nov 2021 17:36:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93278182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253424;
	bh=GF5ppKwJBGyzBz8YYmc0v0PuTfRZzEb8KsPYdX9kZys=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YNa/F/vIr9krObcLUTi1WZoG+nyzrhNH3IIU88flsdZgkRTRikii0aFGWFO3vZfgX
	 fP4UZKIKAnL3cZc922nWkbyC/EBcM5NyVlJ409s9gATQmrihqnSisfjKG2ZrzBsMzd
	 v4owiLS8afhn1jTfdLZI+XuqTxKsGoIN/CKg2mEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDC11F8051B;
	Thu, 18 Nov 2021 17:33:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69FE4F8027D; Mon, 15 Nov 2021 11:42:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D26AF80163
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 11:42:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D26AF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ah/2tRgi"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42A0063218
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 10:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636972950;
 bh=GF5ppKwJBGyzBz8YYmc0v0PuTfRZzEb8KsPYdX9kZys=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ah/2tRgiVpL5fsi7FPpcL635JDhcln6l2ExZIWHTLBUbMjdBJtz0DoVh8A2lD2GeS
 Vn5loajjfQVDFPQtLSRLZGgFOOu9gaKK3ygqoSrLlln9jWXCpaNqhh48lZ8c+k+4gu
 sRf7wuCD69gIDwdqAcDKjxNp/YsEuFSMvDDDQT7VHpaJYuJxZPW/xofRGd5PidTsHa
 kAWstx1aMCAeHyFhdJIprnubYysWs5QAKZBMy/vWApTOP0uD7D8phUBIQiY3lLQ5f/
 +MVP+HB9F9xrWDthVsi8GxjjhUCyNhOn85FTRAs3rVEuGA/K5Upw6e+cpw5gK86TyV
 zRQeafG4VMnqA==
Received: by mail-wm1-f51.google.com with SMTP id 133so13513130wme.0
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 02:42:30 -0800 (PST)
X-Gm-Message-State: AOAM532MuiFH3zRv9fKcqydt1yPVd5x5YVXqbU+h47Bh+Zg5/5+Z2OpK
 YLdKsUq7tfj0VG33a54JmqqCp+G7a0li1MaTZWw=
X-Google-Smtp-Source: ABdhPJxXAexhirAvGW2LKyfe3zijMEf2dKYT5qfqRJ6eAMXzz6GR60sm0yXhnH6+pWfe4YG9EjpedQhiHwxXAXFjyDM=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr57234330wmi.173.1636972948695; 
 Mon, 15 Nov 2021 02:42:28 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-2-arnd@kernel.org>
 <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de>
In-Reply-To: <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 11:42:12 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
Message-ID: <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
Subject: Re: [PATCH 01/11] ASoC: dai_dma: remove slave_id field
To: Lars-Peter Clausen <lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 18 Nov 2021 17:33:02 +0100
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi <linux-spi@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-staging@lists.linux.dev,
 Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
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

On Mon, Nov 15, 2021 at 11:14 AM Lars-Peter Clausen <lars@metafoo.de> wrote:
>
> On 11/15/21 9:53 AM, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > This field is never set, and serves no purpose, so remove it.
>
> I agree that we should remove it. Its been legacy support code for a
> while, but the description that there is no user is not right.
>
> The tegra20_spdif driver obviously uses it and that user is removed in
> this patch. I think it makes sense to split that out into a separate
> patch with a description why the driver will still work even with
> slave_id removed. Maybe the best is to remove the whole tegra20_spdif
> driver.

Ok, I'll split out the tegra patch and try to come up with a better
description for it. What I saw in that driver is it just passes down the
slave_id number from a 'struct resource', but there is nothing in
the kernel that sets up this resource.

Do you or someone else have more information on the state of this
driver? I can see that it does not contain any of_device_id based
probing, so it seems that this is either dead code, the platform_device
gets created by some other code that is no longer compatible with
this driver.

      Arnd
