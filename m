Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFBF50B93D
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:55:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DE8E182F;
	Fri, 22 Apr 2022 15:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DE8E182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635727;
	bh=5N8vfYIX7HnY2e4A45vESuisnROyuLnkKuj3K9dTi5g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kG0KbgrkTH172zrm/bWGwkbxurYyL6NiLyZ9oVuEqzefikB+TZxg2QV/kJfiK8BoV
	 tEjkX3n7bxiZeDXVmLoPqNn39p0vltEgVlCnmCInjQK97ZJiAk/bbPCen5FfLRBgfp
	 N+yq3aP2xpdQD/sYlLhDf7kZZ8BGTHvujD9Xshik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51A13F80C1E;
	Fri, 22 Apr 2022 15:32:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B1A3F80279; Thu, 21 Apr 2022 08:28:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id E29C0F800F4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 08:28:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E29C0F800F4
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 592E7811B;
 Thu, 21 Apr 2022 06:25:07 +0000 (UTC)
Date: Thu, 21 Apr 2022 09:27:57 +0300
From: Tony Lindgren <tony@atomide.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 00/41] OMAP1 full multiplatform conversion
Message-ID: <YmD5bZ8yVhRdZjdd@atomide.com>
References: <20220419133723.1394715-1-arnd@kernel.org>
 <CAPDyKFpNx9xt1xwO-EKAx_qYtfcM5RUC6=Kh9NZ5o+A=H5ut6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpNx9xt1xwO-EKAx_qYtfcM5RUC6=Kh9NZ5o+A=H5ut6A@mail.gmail.com>
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
Cc: linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, alsa-devel@alsa-project.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 aaro.koskinen@iki.fi, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, jmkrzyszt@gmail.com,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Felipe Balbi <balbi@kernel.org>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Jingoo Han <jingoohan1@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
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

* Ulf Hansson <ulf.hansson@linaro.org> [220419 14:12]:
> On Tue, 19 Apr 2022 at 15:37, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > This is the full series for converting OMAP1 to multiplatform, rebased
> > from my 2019 attempt to do the same thing. The soc tree contains simpler
> > patches to do the same for iop32x, ixp4xx, ep93xx and s3c24xx, which
> > means we are getting closer to completing this for all ARMv5 platforms
> > (I have patches for PXA, which is the last one remaining).
> >
> > Janusz already tested the branch separately and did the missing work
> > for the common-clk conversion after my previous approach was broken.
> >
> > The fbdev, mmc and ASoC portion of Janusz' work already went into the
> > corresponding maintainer tree, but I include them here for reference.
> > Unless there are any objections, I would add the entire series to the
> > for-next branch of the soc tree, but only send the first 36 patches early
> > in the merge window. After everything else has made it in, I would rebase
> > the last two patches and send them separately, which may or may not make
> > it in the merge window.
> 
> Sounds like a good plan to me. I usually send the MMC pull-request on
> Mondays, the first day of the merge window.

Sounds good to me. I tested the current omap1-multiplatform-5.18 branch
from mach-omap2 point of view, and things seem to work just fine for me.
I don't currently have any omap1 hardware online to test with.

For the patches, please feel free to add:

Acked-by: Tony Lindgren <tony@atomide.com>
