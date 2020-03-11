Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6080F181225
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 08:42:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB7CE1662;
	Wed, 11 Mar 2020 08:41:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB7CE1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583912565;
	bh=ZXXCdrBU5m7zE4prAbrgQeZbV4YqDXJdjjEtbhUECWM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O38xwfB1Vo1r+bgFjbgUvXFf0TvHc5vby7LmnHvHw/LOdb9hF6l6tYSkjc3uVUOuQ
	 EEnVTIUdwdduk38JMtDRIpghjRNmCYuHaRWHPdPM17p7D4f34dx68qmJZzHBqiB75m
	 vbj6Cywv2rKUWCwy97DeQuGBmEBTc5dqL/4qlQJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F327BF801A3;
	Wed, 11 Mar 2020 08:41:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED9DEF801EB; Wed, 11 Mar 2020 08:41:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 686C1F80141
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 08:40:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 686C1F80141
X-Originating-IP: 90.89.41.158
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 60A9F1BF205;
 Wed, 11 Mar 2020 07:40:53 +0000 (UTC)
Date: Wed, 11 Mar 2020 08:40:52 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH -next 013/491] INGENIC JZ47xx SoCs: Use fallthrough;
Message-ID: <20200311084052.3ca3c331@xps13>
In-Reply-To: <ad408ff8dc4e5fae0884312cb0aa618664e546e5.1583896348.git.joe@perches.com>
References: <cover.1583896344.git.joe@perches.com>
 <ad408ff8dc4e5fae0884312cb0aa618664e546e5.1583896348.git.joe@perches.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-mmc@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
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

Hi Joe,

Joe Perches <joe@perches.com> wrote on Tue, 10 Mar 2020 21:51:27 -0700:

> Convert the various uses of fallthrough comments to fallthrough;
>=20
> Done via script
> Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390=
fa.1582230379.git.joe.com/
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm.c           | 2 +-
>  drivers/mmc/host/jz4740_mmc.c                   | 6 ++----
>  drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 2 +-
>  drivers/mtd/nand/raw/ingenic/jz4725b_bch.c      | 4 ++--
>  drivers/mtd/nand/raw/ingenic/jz4780_bch.c       | 4 ++--
>  sound/soc/codecs/jz4770.c                       | 2 +-
>  6 files changed, 9 insertions(+), 11 deletions(-)

I like very much the new way to advertise for fallthrough statements,
but I am not willing to take any patch converting a single driver
anymore. I had too many from Gustavo when these comments had to be
inserted. I would really prefer a MTD-wide or a NAND-wide or at least a
raw-NAND-wide single patch (anything inside drivers/mtd/nand/raw/).

Hope you'll understand!

Thanks,
Miqu=C3=A8l
