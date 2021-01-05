Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B730F2EACF9
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 15:09:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ACA316CB;
	Tue,  5 Jan 2021 15:08:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ACA316CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609855783;
	bh=NM02vya9y2V9/BIHyBu3+r90ag/AdkNr9lYqeOUaBRk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NHQj7dqVV+4Ugk+BK/YBHX0PMsouE3RY6x/3eqisWekH+n7UvZkJuSMbY3nNwKUIx
	 L2IZMODeUY0VWT8gNI3+XDBOdXsTPNn4gwrSHa1h/xSMMlZY8Yq5Ac2MiMZil2g38U
	 wx2o7jM2u48GgVTNNjvt+mDDxpDRZlsG6obzKqWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49772F804B0;
	Tue,  5 Jan 2021 15:06:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E72EF8049C; Tue,  5 Jan 2021 15:06:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77587F80268
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 15:06:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77587F80268
X-Originating-IP: 90.89.98.255
Received: from xps13 (lfbn-tou-1-1535-bdcst.w90-89.abo.wanadoo.fr
 [90.89.98.255]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4F0391C000F;
 Tue,  5 Jan 2021 14:06:37 +0000 (UTC)
Date: Tue, 5 Jan 2021 15:06:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 06/10] mtd: Remove drivers used by TX49xx
Message-ID: <20210105150636.175598fc@xps13>
In-Reply-To: <20210105140305.141401-7-tsbogend@alpha.franken.de>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
 <20210105140305.141401-7-tsbogend@alpha.franken.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-rtc@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>,
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-watchdog@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Matt Mackall <mpm@selenic.com>, Dan Williams <dan.j.williams@intel.com>,
 Alessandro Zummo <a.zummo@towertech.it>, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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

Hi Thomas,

Thomas Bogendoerfer <tsbogend@alpha.franken.de> wrote on Tue,  5 Jan
2021 15:02:51 +0100:

> CPU support for TX49xx is getting removed, so remove MTD support for it.
>=20
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

If the removal happens, you may take this patch through the mips tree.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

One less driver to convert to ->exec_op() :-)

> ---
>  drivers/mtd/maps/Kconfig                 |   6 -
>  drivers/mtd/maps/Makefile                |   1 -
>  drivers/mtd/maps/rbtx4939-flash.c        | 133 -------
>  drivers/mtd/nand/raw/Kconfig             |   7 -
>  drivers/mtd/nand/raw/Makefile            |   1 -
>  drivers/mtd/nand/raw/txx9ndfmc.c         | 423 -----------------------
>  include/linux/platform_data/txx9/ndfmc.h |  28 --
>  7 files changed, 599 deletions(-)
>  delete mode 100644 drivers/mtd/maps/rbtx4939-flash.c
>  delete mode 100644 drivers/mtd/nand/raw/txx9ndfmc.c
>  delete mode 100644 include/linux/platform_data/txx9/ndfmc.h

Thanks,
Miqu=C3=A8l
