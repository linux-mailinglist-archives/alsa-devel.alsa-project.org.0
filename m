Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 748211FFD6B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 23:31:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDB121679;
	Thu, 18 Jun 2020 23:31:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDB121679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592515911;
	bh=UNO0uOe5SpI6exLNTFCO2shwIg1YC4o/uqtobOqHXr8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HgrtWnvDgOoTFwZ5SutMy5SF0y/26DG9QVuBfSROvRimvJcotx3UZ+siNcAH4GqFR
	 ZZLfO+1USGcRwgqpi3ztW4Qh+W56obYGZBYW65YlOUp9o7w4h8xUZp0RQljs+0E1Xj
	 05Rv8Odl6/QXjTZjEu9cH2WuKPNsCWuXnriZ0fPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D413FF800D1;
	Thu, 18 Jun 2020 23:30:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B352DF80162; Thu, 18 Jun 2020 23:30:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from dd48038.kasserver.com (dd48038.kasserver.com [85.13.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A627F800D1
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 23:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A627F800D1
Received: from meadow.localnet (x4e313b60.dyn.telefonica.de [78.49.59.96])
 by dd48038.kasserver.com (Postfix) with ESMTPSA id D43375005493;
 Thu, 18 Jun 2020 23:29:59 +0200 (CEST)
From: "m.eik michalke" <alsa@reaktanz.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: presonus StudioLive 24.4.2
Date: Thu, 18 Jun 2020 23:29:58 +0200
Message-ID: <2657876.DQpN11Lt7Q@meadow>
Organization: http://www.reaktanz.de/blog
X-Face: :Fk?kfw3:=Vz)np%nh,d4^[#)-y,9IYe:y,; }P|%`fw>/.msl.f=*6j*-f$vL09$qopvp6
 Ox|(^ge<|+0iS]{&|\<0>i7r'@'k+i=eB5y8*pO$#xT+$2uq=`
In-Reply-To: <20200618140623.GA314288@workstation>
References: <1859294.RmyynjnHiM@meadow> <4447737.uXMYkMNjJ4@yrla>
 <20200618140623.GA314288@workstation>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Cc: alsa-devel@alsa-project.org
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

hi,

Am Donnerstag, 18. Juni 2020, 16:06:23 CEST schrieb Takashi Sakamoto:
> The domain specific language in alsa-lib is not so easy to understand
> and control. The result affects to all of ALSA applications like pulseaud=
io.
> It's better to use alsa_in/alsa_out for the purpose to avoid unexpected
> influences, IMO...

i'll probably try both, and maybe FFADO as well. my goal is a solution that=
=20
reliably works when we (my band) start recording again.

it's a pity alsa currently can't transparently take care of this. it looks=
=20
like basically everything is in place, but you're left with that IKEA feeli=
ng,=20
a collection of parts and a construction manual in your hand. when you plug=
 in=20
a 24-channel sound card and alsa successfully detects all of them, as a use=
r=20
you'd expect the single card that is actually offered by alsa to just provi=
de=20
all those channels. that the board internally might use mutliple chips is=20
something you shouldn't have to worry about/figure out. i'd argue there's=20
exactly one configuration that everyone would expect to get from a board li=
ke=20
this, and that's all channels in one device. it would do no harm to=20
automatically configure it like this by default. should someone actually=20
prefer to have split devices for whatever use case, IMHO that should be the=
=20
exception to be configured manually.

> > let me know if you need anything else.
>=20
> Hm. If you hear sound with periodical noise, please report it. The
> dice-based device is known as one of the devices to require drivers for
> media clock recovery. In detail, please read the other case[1].

i'll check it out. we have just bought the board second-hand to replace a=20
phonic helixboard that broke after ~10 years in our studio. i'm just starti=
ng=20
to get familiar with it and haven't recorded much more than a proof of basi=
c=20
functionality yet.


viele gr=FC=DFe :: m.eik



