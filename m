Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4B12ED48A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 17:42:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBFDB1699;
	Thu,  7 Jan 2021 17:41:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBFDB1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610037767;
	bh=fOWMAya6MUgIxPCi2rUu0Qt+PUSCQkj1fFqZohufbqw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MkFmQWJ3yuj2F6ZiWyDlpSAmB0Nma+Il47XsOdMqqcVoMMVxPblVRdCGt+Lu6HSyb
	 Q7tWD5de1UD2coU9fwtf2W/HVKsVPT58VgfQN0QGDAAegR8M7png7fWw/PKe1MdruV
	 s5vYVthdJi6WuEfyN+slPxxP30utbnp9ZGaQuZsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DBC0F800FD;
	Thu,  7 Jan 2021 17:41:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AEE4F80258; Thu,  7 Jan 2021 17:41:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by alsa1.perex.cz (Postfix) with ESMTP id 809FEF800FD
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 17:41:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 809FEF800FD
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1kxYL4-0000Tv-00; Thu, 07 Jan 2021 17:40:42 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 98E5BC080E; Thu,  7 Jan 2021 17:40:15 +0100 (CET)
Date: Thu, 7 Jan 2021 17:40:15 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 05/10] dma: tx49 removal
Message-ID: <20210107164015.GA12533@alpha.franken.de>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
 <20210105140305.141401-6-tsbogend@alpha.franken.de>
 <b84dadc2e98b1986dc800c5f6f202880ed905b38.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b84dadc2e98b1986dc800c5f6f202880ed905b38.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-spi@vger.kernel.org,
 linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Dan Williams <dan.j.williams@intel.com>,
 Alessandro Zummo <a.zummo@towertech.it>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, "David S.  Miller" <davem@davemloft.net>
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

On Wed, Jan 06, 2021 at 11:10:38AM -0800, Joe Perches wrote:
> On Tue, 2021-01-05 at 15:02 +0100, Thomas Bogendoerfer wrote:
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> []
> > diff --git a/drivers/dma/txx9dmac.h b/drivers/dma/txx9dmac.h
> []
> > @@ -26,11 +26,6 @@
> >   * DMA channel.
> >   */
> >  
> > 
> > -#ifdef CONFIG_MACH_TX49XX
> > -static inline bool txx9_dma_have_SMPCHN(void)
> > -{
> > -	return true;
> > -}
> >  #define TXX9_DMA_USE_SIMPLE_CHAIN
> >  #else
> >  static inline bool txx9_dma_have_SMPCHN(void)
> 
> This doesn't look like it compiles as there's now an #else
> without an #if

you are right, no idea what I had in mind while doing that.

Vinod,

as this patch series found a still active user of the platform,
could you drop the patch from your tree, or do you want a revert
from me ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
