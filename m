Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D9182909
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 07:29:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD52316C7;
	Thu, 12 Mar 2020 07:28:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD52316C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583994582;
	bh=xefrU3xp5VyQEfQdYY+wYJ/j7bCg/2XJ27ZyuthqQF8=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jbTnbuOYgfweUA1+gmq0oTz9HzGaB0BmatuL+CW0hMzc+y+lmvutI08p1q+MLyJMK
	 F6RCYuAp5ATuJsAengl8cRCPYoPxwKspKY/cDIPL6MOS24p2gT/o08DAgzMwhSGxgq
	 OC7TNoG4TmDvDnq/YgkHW9CLTqYjhlJsS2IZk9FM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 868E4F801D9;
	Thu, 12 Mar 2020 07:28:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47C82F8020C; Thu, 12 Mar 2020 07:27:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0163.hostedemail.com
 [216.40.44.163])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D68DF80086
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 07:27:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D68DF80086
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 72080182CED5B;
 Thu, 12 Mar 2020 06:27:50 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: point06_441a962f90223
X-Filterd-Recvd-Size: 3157
Received: from XPS-9350.home (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf14.hostedemail.com (Postfix) with ESMTPA;
 Thu, 12 Mar 2020 06:27:47 +0000 (UTC)
Message-ID: <969ea500cfd66fa2fc32e8d1e9c6126710d16813.camel@perches.com>
Subject: Re: [PATCH -next 013/491] INGENIC JZ47xx SoCs: Use fallthrough;
From: Joe Perches <joe@perches.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 11 Mar 2020 23:26:04 -0700
In-Reply-To: <20200311084052.3ca3c331@xps13>
References: <cover.1583896344.git.joe@perches.com>
 <ad408ff8dc4e5fae0884312cb0aa618664e546e5.1583896348.git.joe@perches.com>
 <20200311084052.3ca3c331@xps13>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2020-03-11 at 08:40 +0100, Miquel Raynal wrote:
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

I understand completely.

This set was done to generate patches by
nominally maintained subsystems.

If you want something else:

The easiest thing for you to do would be to
run the cvt_fallthrough.pl script yourself.

$ cvt_fallthrough.pl drivers/mtd/nand/raw/

That would produce:

$ git diff --shortstat drivers/mtd/nand/raw
 9 files changed, 18 insertions(+), 24 deletions(-)

or

$ cvt_fallthrough.pl drivers/mtd/

which would produce:

$ git diff --shortstat drivers/mtd/
 22 files changed, 45 insertions(+), 60 deletions(-)

cheers, Joe

