Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8337950B88A
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:33:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B71616F1;
	Fri, 22 Apr 2022 15:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B71616F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650634408;
	bh=LxxQsJF2y0siHGYkCRa3D9g3wOshXr0hI8lvjvOzhyQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e8DhOQrnA20ujcOCq3J28cVdQXqwgC0YB4jRzsROquruC7j8+ZnV3V6ljTEelQa2F
	 GBKgJp03BGGsDZAzuL3KVLwt6OtJFPHiS7WQrTRkDgIlKecMxUdMP8M1rf5yTRZ7Iu
	 NUT2XJWNrungfX/wt72xmCcZdLGxyBjc5XGigVWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7316F80506;
	Fri, 22 Apr 2022 15:31:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42130F804F1; Thu, 21 Apr 2022 07:19:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id 073D0F8047D
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 07:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 073D0F8047D
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 2EAAD811B;
 Thu, 21 Apr 2022 05:16:56 +0000 (UTC)
Date: Thu, 21 Apr 2022 08:19:45 +0300
From: Tony Lindgren <tony@atomide.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 26/41] ARM: omap1: relocate static I/O mapping
Message-ID: <YmDpcXoafouaDL7s@atomide.com>
References: <20220419133723.1394715-1-arnd@kernel.org>
 <20220419133723.1394715-27-arnd@kernel.org>
 <20220420134615.GA1947@darkstar.musicnaut.iki.fi>
 <CAK8P3a00DgKYdzTZFiBfKDF_zwaJjL6Duw8aOOJ-gVkz4L1ZwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a00DgKYdzTZFiBfKDF_zwaJjL6Duw8aOOJ-gVkz4L1ZwQ@mail.gmail.com>
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Helge Deller <deller@gmx.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kevin Hilman <khilman@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
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

* Arnd Bergmann <arnd@kernel.org> [220420 19:18]:
> On Wed, Apr 20, 2022 at 3:46 PM Aaro Koskinen <aaro.koskinen@iki.fi> wrote:
> >
> > Hi,
> >
> > On Tue, Apr 19, 2022 at 03:37:08PM +0200, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > The address range 0xfee00000-0xfeffffff is used for PCI and
> > > PCMCIA I/O port mappings, but OMAP1 has its static mappings
> > > there as well.
> > >
> > > Move the OMAP1 addresses a little higher to avoid crashing
> > > at boot.
> >
> > This has the same problem I reported in 2019, with earlyprintk the
> > system no longer boots:
> >
> >         https://marc.info/?t=156530014200005&r=1&w=2
> >
> > Tested on OSK and SX1/qemu.
> 
> Thanks a lot for testing!
> 
> I managed to get to the bottom of this after just a few hours, and
> it turned out to be a simple math error on my end, as I got
> the alignment wrong, the offset has to be 0x00f00000
> instead of 0x00fb0000 be section aligned. I made sure the
> kernel boots up (to the point of missing a rootfs) and uploaded
> the fixed branch.

Good to hear this got sorted out :)

Regards,

Tony
