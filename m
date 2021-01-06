Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E48982EC3BC
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jan 2021 20:12:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8194F16B3;
	Wed,  6 Jan 2021 20:11:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8194F16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609960350;
	bh=l8/v9J4sEWWDwtsAhLFsbYXxq9epM3rYNKo/VIyI4ZQ=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Igt1FxCNZ8R18XRjKmxrNU+s8C1lF1muSBVK2Hi+j9xR133ahlcHZp90NExOx+fMz
	 BK2DzehoenNjVZsKA+eA+IuDT+MveoejNAR/mkYSoMCVDegl4y9xT1m+kcno5PQHOE
	 mzgrGnB/ojznOP6Dwvt1mfYAQdFMbMHCFeyp3DqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDE3DF80165;
	Wed,  6 Jan 2021 20:10:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA988F80166; Wed,  6 Jan 2021 20:10:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0041.hostedemail.com
 [216.40.44.41])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7630AF800E3
 for <alsa-devel@alsa-project.org>; Wed,  6 Jan 2021 20:10:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7630AF800E3
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id BB2925C0;
 Wed,  6 Jan 2021 19:10:43 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: push15_3e110e4274e4
X-Filterd-Recvd-Size: 2304
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf11.hostedemail.com (Postfix) with ESMTPA;
 Wed,  6 Jan 2021 19:10:39 +0000 (UTC)
Message-ID: <b84dadc2e98b1986dc800c5f6f202880ed905b38.camel@perches.com>
Subject: Re: [PATCH 05/10] dma: tx49 removal
From: Joe Perches <joe@perches.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matt Mackall
 <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Dan Williams
 <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jakub Kicinski <kuba@kernel.org>,  Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown
 <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter
 Roeck <linux@roeck-us.net>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-mips@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org,  dmaengine@vger.kernel.org,
 linux-ide@vger.kernel.org,  linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 alsa-devel@alsa-project.org
Date: Wed, 06 Jan 2021 11:10:38 -0800
In-Reply-To: <20210105140305.141401-6-tsbogend@alpha.franken.de>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
 <20210105140305.141401-6-tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 2021-01-05 at 15:02 +0100, Thomas Bogendoerfer wrote:
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
[]
> diff --git a/drivers/dma/txx9dmac.h b/drivers/dma/txx9dmac.h
[]
> @@ -26,11 +26,6 @@
>   * DMA channel.
>   */
>  
> 
> -#ifdef CONFIG_MACH_TX49XX
> -static inline bool txx9_dma_have_SMPCHN(void)
> -{
> -	return true;
> -}
>  #define TXX9_DMA_USE_SIMPLE_CHAIN
>  #else
>  static inline bool txx9_dma_have_SMPCHN(void)

This doesn't look like it compiles as there's now an #else
without an #if


