Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2654F68EB54
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 10:27:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DC20857;
	Wed,  8 Feb 2023 10:26:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DC20857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675848434;
	bh=k3mBb2ttmv4eUwpS+u1pcluQvLF8XcOj4JEGv2wc6Fo=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FcoU2TVXWbsAajGbJIgnvJoDDxe2Y2XQPAYFKP9XEIyHjQdtX03p7ghudRcr4FE9y
	 J8Wdm2CR0me0VL3vfCptMgfuz8GMfL4CIQPwn2RURnbZnFKMVszIYZVNa3R1vaIHYS
	 UiW/ILqCC/c71MVtKWGL+UqfeSxDq+gcuSKLi8vg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98D2DF80549;
	Wed,  8 Feb 2023 10:25:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFE56F80551; Wed,  8 Feb 2023 10:25:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B7D3F8053B
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 10:25:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B7D3F8053B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPghh-0000kc-5G; Wed, 08 Feb 2023 10:25:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPghb-003U67-4z; Wed, 08 Feb 2023 10:25:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPghb-001oLK-Eo; Wed, 08 Feb 2023 10:25:19 +0100
Date: Wed, 8 Feb 2023 10:25:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geoff Levand <geoff@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>, alsa-devel@alsa-project.org,
	kernel@pengutronix.de, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/3] ALSA: core: Make some functions return void
Message-ID: <20230208092516.7t5deh65p323hw2x@pengutronix.de>
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
 <Y+NebPBazKrqJoEZ@workstation>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="etny2rwfebu6itnu"
Content-Disposition: inline
In-Reply-To: <Y+NebPBazKrqJoEZ@workstation>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: MFY67EHFB7C7ZLR3KO7N37GNG5L7JXTT
X-Message-ID-Hash: MFY67EHFB7C7ZLR3KO7N37GNG5L7JXTT
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MFY67EHFB7C7ZLR3KO7N37GNG5L7JXTT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--etny2rwfebu6itnu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Feb 08, 2023 at 05:33:48PM +0900, Takashi Sakamoto wrote:
> On Tue, Feb 07, 2023 at 08:19:04PM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > while checking in which cases hda_tegra_remove() can return a non-zero =
value, I
> > found that actually cannot happen. This series makes the involved funct=
ions
> > return void to make this obvious.
> >=20
> > This is a preparation for making platform_driver::remove return void, t=
oo.
> >=20
> > Best regards
> > Uwe
> >=20
> > Uwe Kleine-K=F6nig (3):
> >   ALSA: core: Make snd_card_disconnect() return void
> >   ALSA: core: Make snd_card_free_when_closed() return void
> >   ALSA: core: Make snd_card_free() return void
> >=20
> >  include/sound/core.h      |  6 +++---
> >  sound/core/init.c         | 40 ++++++++++++++-------------------------
> >  sound/pci/hda/hda_tegra.c |  6 ++----
> >  sound/ppc/snd_ps3.c       |  4 +---
> >  4 files changed, 20 insertions(+), 36 deletions(-)
>=20
> All of the changes in the patches look good to me, as the return value
> seems not to be so effective for a long time (15 years or more) and
> expected so for future.

To give a more complete picture: Returning an error code in a cleanup
function does active harm. It makes driver authors expect that there
must be error handing and that they can/should return that error from
the remove function. This is wrong however and likely yields resource
leaks. See bbc126ae381cf0a27822c1f822d0aeed74cc40d9 for an example.

> Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
>=20
> One of my concern is that we are mostly in the last week for v6.3
> development. When taking influence of the changes into account, it
> would be possible to postpone to v6.4 development. But it's up to the
> maintainer.

There is no rush from my side. Eventually I want to modify
platform_driver::remove which depends on this patch series, but the 6.4
merge window is fine for me, as this effort will likely take some more
time.

> > base-commit: 05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a
>=20
> A small nitpicking. I think you use Linus' tree or so:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D05ecb680708a
>=20
> Because the hash is not reachable from the branch for next merge window on
> the tree of sound subsystem upstream:
> https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=
=3Dfor-next&id=3D05ecb680708a
>=20
> I guess it is safer to use his tree as your work-base, even
> if the three patches can be applied to it as is (fortunately).

I see your point. My reason not to do that is that finding out the right
tree (and branch) to base a patch on is not always trivial. As someone
who sends patches touching the whole tree this is a considerable
overhead and most of the time it's not worth the effort in my
experience. Even if I had based my patch on tiwai's tree, there might be
a patch still in flux that is picked up first and conflicts with my
change. Most of the time the patch still applies and stating the base is
just for the benefit of the auto builders (which might have problems
finding the base commit if it's not in next) and if it doesn't apply the
person picking up the patch probably knows about Linus' tree and so git
is helpful resolving the resulting conflict.

It's still more complicated for patches that might or might not be
considered a fix. Then it's up to the maintainer if they apply it to
their fixes or next branch. (And that situation is just about to happen
as I found a problem in a driver I touched here. So stay tuned :-)

So I gave up thinking too much about the right base and take the
opportunistic route of just using Linus' tree (or the last -rc1) and if
there really a merge conflict pops up, support the maintainer only then.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--etny2rwfebu6itnu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPjankACgkQwfwUeK3K
7Alp2wgAhePkqG/8GSYCmjFTPpe2IDS3rgPcCmWtWChjNj6uCiMlMvLU95ZzZU/w
pJfBc5VGbHGht6f1+Sylifds9e/tbpFy1Lx/Ao1hzCz1K07fNkrMngj9KFgKfpQQ
Qlyo4FQErHd68weTs+/nRQG0wMg4tcIgK0krnQwqdoQee7zuwIQeusMa1fJ47Hto
033HQPQ9GCcAgwCgh4OY6E57Ly550YZFTer5lvTfiXKyPTS11LYeQF975PlOijZO
WkJ4S3I4CjVI1tZtKxVWWTCVh1lWZnsNqLn5LsNVLznL2q7kWnZrjWPIuyMtNCHa
v73KFmbd5rxWQKVZz+37WLOoBkKUQQ==
=bbsR
-----END PGP SIGNATURE-----

--etny2rwfebu6itnu--
