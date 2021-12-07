Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A011146BF20
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 16:18:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 290452497;
	Tue,  7 Dec 2021 16:17:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 290452497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638890298;
	bh=t/tu5c2HgiUMse2fBQw2msqX9wQbrjm16qk401D6eu8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WJW+J6g7ATVqiFWOJcg7KGYoN14cA1Yep8eTJ7RUZSmGWlrIlRnGodX8Gfr3PozLh
	 TcqepA8XyYT4hz9Qh4M0DefetBCuUaBtood51/pWwbR5NYZT1+BnotAgYxaREYnWRv
	 GgT0otA0e/uHUZCJn5VG161phoymHg3ouqjw6qN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6126F804CF;
	Tue,  7 Dec 2021 16:16:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EFD1F804AE; Tue,  7 Dec 2021 16:16:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1A34F80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 16:16:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1A34F80103
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CF6AF20007;
 Tue,  7 Dec 2021 15:16:39 +0000 (UTC)
Date: Tue, 7 Dec 2021 16:16:32 +0100
From: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: soc-core: add the driver component name to the
 component struc
Message-ID: <20211207161632.47ee0020@kmaincent-XPS-13-7390>
In-Reply-To: <Ya9c0d/X0z1QUVN6@sirena.org.uk>
References: <20211206095920.40552-1-kory.maincent@bootlin.com>
 <Ya5lplIoyhKsqFmZ@sirena.org.uk>
 <20211207094732.3be5befb@kmaincent-XPS-13-7390>
 <Ya9c0d/X0z1QUVN6@sirena.org.uk>
Organization: bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, alexandre.belloni@bootlin.com,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
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

Mark,

On Tue, 7 Dec 2021 13:08:33 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Tue, Dec 07, 2021 at 09:47:32AM +0100, K=C3=B6ry Maincent wrote:
> > Mark Brown <broonie@kernel.org> wrote: =20
>=20
> > > Why is one device registering multiple components in the first place?=
 =20
>=20
> > Because the sound components are more and more complex. Why they should=
n't?
> > =20
>=20
> In what way are they more complex?=20

The sound hardware components add more and more features.

>=20
> > It seems to be already the case:
> > sound/soc/codecs/cros_ec_codec.c
> > sound/soc/fsl/fsl_easrc.c
> > sound/soc/mediatek/mt*/mt*-afe-pcm.c
> > sound/soc/sunxi/sun4i-codec.c
> > sound/soc/soc-utils.c =20
>=20
> Quite a few (I think all?) of these are quite old and and are the result
> of refactoring from pre-component code rather than modern drivers, it's
> likely there is no concrete reason for them to behave as they do.

I am a beginner in the kernel sound stack, alright then, the issue comes fr=
om
the drivers.

Thanks,

Regards
