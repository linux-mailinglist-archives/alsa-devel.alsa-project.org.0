Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CF42EB9F3
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jan 2021 07:20:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09748166B;
	Wed,  6 Jan 2021 07:19:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09748166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609914017;
	bh=5lp+13jiD6sIpu3g6HHgflH2MeBd+glQhPUXzn5sEb0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hbG3KUmihQpM7dCM1OxwO9jMR/s6fujnPEEc3uyVkAL0GvMp5iG0G6OHN56295EI5
	 9cG1BRzuBNxrun+fdyAVDP816urolKJbFmONnTnjEGvLIdHA3ZbEFzFBhnV8jji/IY
	 pPS9AkrDATf385oc5jANsdMTWeNC6IX0rdh5LDhg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BCD6F80167;
	Wed,  6 Jan 2021 07:18:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8E50F80166; Wed,  6 Jan 2021 07:18:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0BCEF800E3
 for <alsa-devel@alsa-project.org>; Wed,  6 Jan 2021 07:18:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0BCEF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CakvhJq/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA573207AB;
 Wed,  6 Jan 2021 06:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609913894;
 bh=5lp+13jiD6sIpu3g6HHgflH2MeBd+glQhPUXzn5sEb0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CakvhJq/S0InR70KIkE0nT8f4OsK8tazYsMYaSFjfmUD+Huax/XAoFChfqSwh2Ko3
 O2Yr5kMJTtRg84SKasb5ZjVbjiriRmjXC//Mp6svMTkOguihXcYD8Y7jrNAu5hhU9s
 NdGVzXNjj+s9GjbUJWIyH+IHiUgF6TmPNadTJjfPC+mngpvbFg7c/5UFpGfay3esh2
 cYJ3MG2vwyVhJDX/j+RFuMWxX9ZlY7uvVKpUVyQmSjwgaHtsGBtJTIpjBfFO76T5xG
 lQPLPifs3+qF6HuckWFMEKtmfxytThn8qOgCOh6FZpFqy+bNi0rc5xLf/Si1eeEIi4
 d5j4VPRJ+OyIg==
Date: Wed, 6 Jan 2021 11:48:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 05/10] dma: tx49 removal
Message-ID: <20210106061810.GO2771@vkoul-mobl>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
 <20210105140305.141401-6-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105140305.141401-6-tsbogend@alpha.franken.de>
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
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
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

On 05-01-21, 15:02, Thomas Bogendoerfer wrote:
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Applied after fixing subsystem name, thanks

-- 
~Vinod
