Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCDC2EEE96
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 09:30:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66C5E16B6;
	Fri,  8 Jan 2021 09:29:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66C5E16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610094602;
	bh=SAoDiXJG+49pPIJcmLEdT3YdpudMLb3tXzuV+M1ddMg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NM9+Z+BO2jArAflkBdvN3pYAO1s3xEjCSw/uf0xa2LAT+0G2O02svt2rm2N4d5Vz3
	 Zt4OdF+7VtofWq3CZQUz0T4YnuS8xtlj4q/2ckJfQC9+dkfMl4aPhk7TaVKkqeBhqN
	 aV+T/iT+vHvgEjMe8ZxrqwFUL2THunOXV7VXDK2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F422CF80165;
	Fri,  8 Jan 2021 09:28:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B976F80166; Fri,  8 Jan 2021 09:28:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE0B2F800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 09:28:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE0B2F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EnEKOJIN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CC7A23435;
 Fri,  8 Jan 2021 08:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610094479;
 bh=SAoDiXJG+49pPIJcmLEdT3YdpudMLb3tXzuV+M1ddMg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EnEKOJIN+WnD4u6lFgo77faKCj54N+d/pFKhcGzW/Y3/Ccl68siuEONd2+MQVmWwA
 g8i5J1Jp9PRFqP+bjh1UVHmW6ZNZoM79Em/nHN5DHOG6ps9hEvQuax6LdoYTVQba6R
 W0M3rPvSPrbm/vYAaPU9CsppYeuXAhSoIAN8UGVK69VCDMDjU1FlkyeISfeCHTf0Cp
 UrPLrlJpGz0S4tUYkZu+D7Yp8uZm4/13PvNs53jDnTG1yuR/TZx3S6Q2A5kjWrfu5R
 w1MefWO2hD7veYyvb2xtc7eB2pAO3ZpInFWl5OgE2Cy2VRAsn/olPyc/xhF+bAgyze
 9qY+rCVqge15w==
Date: Fri, 8 Jan 2021 13:57:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 05/10] dma: tx49 removal
Message-ID: <20210108082754.GW2771@vkoul-mobl>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
 <20210105140305.141401-6-tsbogend@alpha.franken.de>
 <b84dadc2e98b1986dc800c5f6f202880ed905b38.camel@perches.com>
 <20210107164015.GA12533@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210107164015.GA12533@alpha.franken.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-spi@vger.kernel.org,
 linux-rtc@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org, Joe Perches <joe@perches.com>,
 Mark Brown <broonie@kernel.org>, Matt Mackall <mpm@selenic.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Alessandro Zummo <a.zummo@towertech.it>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 "David S.  Miller" <davem@davemloft.net>
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

On 07-01-21, 17:40, Thomas Bogendoerfer wrote:
> On Wed, Jan 06, 2021 at 11:10:38AM -0800, Joe Perches wrote:
> > On Tue, 2021-01-05 at 15:02 +0100, Thomas Bogendoerfer wrote:
> > > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > []
> > > diff --git a/drivers/dma/txx9dmac.h b/drivers/dma/txx9dmac.h
> > []
> > > @@ -26,11 +26,6 @@
> > >   * DMA channel.
> > >   */
> > >  
> > > 
> > > -#ifdef CONFIG_MACH_TX49XX
> > > -static inline bool txx9_dma_have_SMPCHN(void)
> > > -{
> > > -	return true;
> > > -}
> > >  #define TXX9_DMA_USE_SIMPLE_CHAIN
> > >  #else
> > >  static inline bool txx9_dma_have_SMPCHN(void)
> > 
> > This doesn't look like it compiles as there's now an #else
> > without an #if
> 
> you are right, no idea what I had in mind while doing that.
> 
> Vinod,
> 
> as this patch series found a still active user of the platform,
> could you drop the patch from your tree, or do you want a revert
> from me ?

Dropped now

-- 
~Vinod
