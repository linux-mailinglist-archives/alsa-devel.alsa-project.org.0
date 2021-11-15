Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B1545609D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:36:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5652181F;
	Thu, 18 Nov 2021 17:35:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5652181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253404;
	bh=/t8XfUWWM8z249haMNnkzo9rz3rqA5hhnI/QUDdDTws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aCk1PA7vrNYxxT5kmO84eks01AVEJpVKs7PUCJC1KXuVxu2MOL4jpjChgTRG1fCvg
	 jkEf5zvouHcLwI/fqxsNHbA3BL4vAV9ck755FVUeWt7fm3QpGt6Wdb/iY35VkYViHL
	 wXHf01Wtl4Cw71faEsmnPSKP4mHNJPfoF0sTg/g0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C520F80511;
	Thu, 18 Nov 2021 17:33:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FE8DF8027D; Mon, 15 Nov 2021 11:23:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21B03F80163
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 11:23:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21B03F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BuOY5ELT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A98063231
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636971821;
 bh=/t8XfUWWM8z249haMNnkzo9rz3rqA5hhnI/QUDdDTws=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BuOY5ELTwM8ARl8dht0vPj74GqpW7Omi9ye6DZXl4ISYUdhHvn/MD+ynDDUT+QFtA
 v8L7yTHPnv3tNZT+6a7jmvQiyHLX42OhSBtuErgkkpXMWboLAxbpYYXhkMyhP3kE41
 WUL+WGa8r2Ml5m1pmbyJCKNiWaAA/tcOe62yL/fiNo14Evo43QgmMCKuyU9uToylcA
 J85yoCIJTYPD2hiiYP9cnEUTFS41uyXrFoia9J9lYRG9OY91kMrhg72OL5ozjj1uQi
 01RuRIianAw8FITBywentT0od4DYro7YDzqlmkyd3IDz3Pd+duWc1lFOAhroRxLO8P
 vWZ7OvjtlSIUw==
Received: by mail-wr1-f49.google.com with SMTP id b12so29659836wrh.4
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 02:23:41 -0800 (PST)
X-Gm-Message-State: AOAM532iouKk0FUiXKUOHxiYyzMhAI9OMRCeBrZd0Ulf0n4GjqaMW9GW
 rsXQE659bFo8+eWc1Yr4UokOu7JQY0PuSL+6MOE=
X-Google-Smtp-Source: ABdhPJzrg17TRzVZ0g7WiohBQZUnVilsZRnhlMklfo7pQF89sOPyjg8lWeE+TbAhUi7fYkrm+wuR9SFoHCL7lz7Lazw=
X-Received: by 2002:adf:df89:: with SMTP id z9mr45210699wrl.336.1636971819867; 
 Mon, 15 Nov 2021 02:23:39 -0800 (PST)
MIME-Version: 1.0
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-11-arnd@kernel.org>
 <CAMhs-H98kPNqH491+X0Mp81Ng++v1aQ=97XSHEhs+vx3g8W_4A@mail.gmail.com>
In-Reply-To: <CAMhs-H98kPNqH491+X0Mp81Ng++v1aQ=97XSHEhs+vx3g8W_4A@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Nov 2021 11:23:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2hfcbTJ-yKik1hN35dTdqhjhCd=3X6G_hW4MXRHDVrfA@mail.gmail.com>
Message-ID: <CAK8P3a2hfcbTJ-yKik1hN35dTdqhjhCd=3X6G_hW4MXRHDVrfA@mail.gmail.com>
Subject: Re: [PATCH 10/11] staging: ralink-gdma: stop using slave_id config
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 18 Nov 2021 17:33:02 +0100
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Laxman Dewangan <ldewangan@nvidia.com>,
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
 linux-kernel <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
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

On Mon, Nov 15, 2021 at 10:55 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
> On Mon, Nov 15, 2021 at 9:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > ---
> >  drivers/staging/ralink-gdma/ralink-gdma.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
>
> This driver has been already deleted from the staging tree. See [0].

Ok, thanks! I'll just leave out the patch from future submissions, and remove
it completely once your commit hits mainline.

       Arnd
