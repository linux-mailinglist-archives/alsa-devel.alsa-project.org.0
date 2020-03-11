Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E72F181B16
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 15:23:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DF071666;
	Wed, 11 Mar 2020 15:22:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DF071666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583936604;
	bh=x0rkzHKVCO4/4BCh3NikI3YFRku7HPCiwGonVS7gOis=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S1OIUNYkHujM2nhlI//fqeRUhUEZT9WIg/TlutQj8nNdJlYJQ5PUEGTFDRcKfZZKE
	 HKbQfmUePm85KfA26B//FFMSu/t5KumiRWe+XDwocHG+OQnnDWg3h/BhFAA2/EGEW9
	 T5i7+0y6ojKkuPmUDBhenIOjSw0yyVeE/8pD+GMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 180EAF801F7;
	Wed, 11 Mar 2020 15:21:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 316D0F801EB; Wed, 11 Mar 2020 15:21:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E3EAF80141
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 15:21:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E3EAF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Gkc0L1z8"
Received: by mail-vs1-xe43.google.com with SMTP id u24so1407181vso.11
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 07:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AA36Z3gXSwJUntGmt4TTG30h5qvPXt0r2XDT/8zcsfI=;
 b=Gkc0L1z8chPU37ylfxfld8kL1758g6oY0Td7cWlPBhRSaljv0nEP9i+wF1FJLm0Drg
 7zQLQnQGtshFfkBxcXQOD8UJjfPEBJlxiQbOQQRDjlQyYcs4GHopCD3WQpPexAJCvhto
 8XN93qTBP25DLXymYoqMYfRDFiCDl00Tu7l7HwjPGS2KJhr2hl68CUYN42965CRUP9pQ
 ZDPNq0D/OlBZjkMIJz112kgpsvq2mG8Y0bHAG6O4T5kI9wyjM5tx9FQxhltw0y0ATKH4
 ttb7rdiO3me+gomGLr9dPZ6NNBAkBHLub4H4YSPSffAKhD/PJ/7fQfqhDsJtoj4Mb2vw
 xi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AA36Z3gXSwJUntGmt4TTG30h5qvPXt0r2XDT/8zcsfI=;
 b=k1TVVmaOj9MaaQBLktmKXqOddHAXV6Iz7iEpRsXYj/cuzVuyOqWTtP1dXgH9xBN22T
 H+DyC8Ep53o/gPpCszmaM0tVwr0LE05o7UFv+8Z5YFS/jTbLe3YQWA818BmsHDIjXO/x
 aj6CvENosCpmfsniXdXpFFvCeLwg8pL/1VqFV5Ihx0qlzTjdiH9lVZ8eYloj7jCyCQvr
 cQFcprtyzgKRf27yVJfdOPgT98m50pmTdx0tMwNypDAQmU4JVI20gNeAE/69oOPaDGGM
 IwJpEXHu9O8eYXCIF4d89ZkQpaR1P87oVRdpVeVM0JCkYTPM5WX1rOf37DiisjChthMN
 ketw==
X-Gm-Message-State: ANhLgQ3srAIOfTDWlOBshTYB/nFcjHdDDt2klIfMsUz9XFpeosjEuzDc
 lgQU4jHNdqK6lGi5blbOrVc36kKEqBQdaScMsss/lA==
X-Google-Smtp-Source: ADFU+vvAwSiaVqdqSV80/n9skavFztB4aCTDjE1foC884CVvIqJg8m9aPx1YictIGAray0JPA7so3t3+znzsKWxY1WY=
X-Received: by 2002:a05:6102:2051:: with SMTP id
 q17mr2225224vsr.165.1583936495390; 
 Wed, 11 Mar 2020 07:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583896344.git.joe@perches.com>
 <ad408ff8dc4e5fae0884312cb0aa618664e546e5.1583896348.git.joe@perches.com>
 <20200311084052.3ca3c331@xps13>
In-Reply-To: <20200311084052.3ca3c331@xps13>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 11 Mar 2020 15:20:59 +0100
Message-ID: <CAPDyKFo2UensmH_gYkH+u22bs=K9Xn0q3Dr9v6tq6GPNRg_Lew@mail.gmail.com>
Subject: Re: [PATCH -next 013/491] INGENIC JZ47xx SoCs: Use fallthrough;
To: Miquel Raynal <miquel.raynal@bootlin.com>, Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Vignesh Raghavendra <vigneshr@ti.com>,
 David Airlie <airlied@linux.ie>, Richard Weinberger <richard@nod.at>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Wed, 11 Mar 2020 at 08:40, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Joe,
>
> Joe Perches <joe@perches.com> wrote on Tue, 10 Mar 2020 21:51:27 -0700:
>
> > Convert the various uses of fallthrough comments to fallthrough;
> >
> > Done via script
> > Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/
> >
> > Signed-off-by: Joe Perches <joe@perches.com>
> > ---
> >  drivers/gpu/drm/ingenic/ingenic-drm.c           | 2 +-
> >  drivers/mmc/host/jz4740_mmc.c                   | 6 ++----
> >  drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 2 +-
> >  drivers/mtd/nand/raw/ingenic/jz4725b_bch.c      | 4 ++--
> >  drivers/mtd/nand/raw/ingenic/jz4780_bch.c       | 4 ++--
> >  sound/soc/codecs/jz4770.c                       | 2 +-
> >  6 files changed, 9 insertions(+), 11 deletions(-)
>
> I like very much the new way to advertise for fallthrough statements,
> but I am not willing to take any patch converting a single driver
> anymore. I had too many from Gustavo when these comments had to be
> inserted. I would really prefer a MTD-wide or a NAND-wide or at least a
> raw-NAND-wide single patch (anything inside drivers/mtd/nand/raw/).
>
> Hope you'll understand!

I fully agree (for mmc). One patch please.

Another option is to make a big fat tree wide patch and ask Linus if
he want to pick up immediately after an rc1. That should cause less
disturbance for everyone, no?

Kind regards
Uffe
