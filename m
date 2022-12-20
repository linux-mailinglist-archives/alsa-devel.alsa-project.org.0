Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F82651A0D
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 05:44:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2088B2B0A;
	Tue, 20 Dec 2022 05:43:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2088B2B0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671511468;
	bh=PCFBhOmqwnUnJJ5JN8oL+3dj0SglPVwz2qVOwZ9GDYo=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IqT2Lx1NHC8VK6DWirQU4am/ERCd3/a3P3bBKQnrDB9p2TsJNZjUT+TZfxshcP2Ht
	 jPK4Mfwc4mlnCEOVW58pKO2EI5/Q5et634iHmzqUxcMvwdtRrQyDX8VbzGmqFNWOx+
	 k4uTRkL+7UZFl340+mLrWKkHSmbi8Ak4C0nd2VNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA299F8025E;
	Tue, 20 Dec 2022 05:43:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FB41F8032B; Tue, 20 Dec 2022 05:43:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50823F8025E
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 05:43:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50823F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm2
 header.b=tletu3R4; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=tY/k6Aa7
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D4C1D320093C;
 Mon, 19 Dec 2022 23:43:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 19 Dec 2022 23:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1671511386; x=
 1671597786; bh=XaLoLd2oQGvxYAKJjaWvB8j3ooz2Y1N3AgmcEsW+u24=; b=t
 letu3R41VA7e+5oPTAT2rrHCYtjSu2U3Z7SFnwuC5bBOnfQgRUwYiC+zx5F0HLdO
 Ptsee+ZMj3/lZQnl/hhPGFCpMx5Ahys96aE59evQnRBMxwWElbv++m+hY8XFCmKA
 5nLGM7qA14y245zcIIr+AryaZczpWI0rMWT3tbw5Qo37LSxfOcpIl0HnB9t0btaB
 5MkQ2r8kRkTTiIENryMa5DDR+yXHDi3b/H8o8BfyDmvm4leqXmed/erGnBnEcrcV
 NRloyEu4foh4euXFXTd3vm51gt+bx4w7+Avifbw/9Og8uJx0yOWT3XZechHd4NLj
 fOpAhmOStnZwL8qZK6ETQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1671511386; x=1671597786; bh=XaLoLd2oQGvxYAKJjaWvB8j3ooz2
 Y1N3AgmcEsW+u24=; b=tY/k6Aa7PB0lYlfUSjX+Xkgz0mNH5NlcQmbgmLQJOIUe
 /3Ov8418RKHeRaFWyt+9ahiP/MJCxOLAW4kd4hmpeibJMVdBHFpjqjstdGTOGBq3
 sB8AZV/DqLA4gL86GtMem/RF88jpjN3ur+pGk/qp60TRAJsNTP4eCadfk8qqzG3w
 t4n3tOHiTJReHFhuLovGT6bAfOXThZEa7uIi3btoxNPoSw3iV0c7c3d96xi5WPwT
 fLHssTEvpGUNGdx6ZMWRko2i6aCvZ1ZvFjML5vrjGMSCkIBdoPAyCLbUl9gKpxfb
 bC8MVIJvDZNsSPV5AxC6or+PvXsn8MKaAmmekNp2GA==
X-ME-Sender: <xms:Wj2hYw__ja2E4j3mVAX8XYW0880s59IjdCrpWnRLs04MDngERVj2lQ>
 <xme:Wj2hY4svZ-QsbWlIF-gq7Rw6PFTvFK7oHkVT-qLa-QCpAfvegurQcoRmqd0wRJLsI
 zvWBv9CkGC7YA>
X-ME-Received: <xmr:Wj2hY2B4KkoNy1wgnYr-XQEp5tpuyBDFhiBAlmj2XJ0aZTiXEx7EK3GM_0yguyasssi6QFvao9YjufjtUWrVkE0lin9FWzwPiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeeggdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiledu
 vdekjeeukefhffetgeefiefffeejjedvieejvdfgjeehteduvdekffduieenucffohhmrg
 hinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
 grsgdrtghomh
X-ME-Proxy: <xmx:Wj2hYwftnjlziRg6j-IXZ6hSmqYvKubaQ5NUHXrrU63V7z5jPsxQog>
 <xmx:Wj2hY1P6ViI-3Z1SgLzIwIajXZwyaLqTijhDzyjPoHfX4auMGPlnEw>
 <xmx:Wj2hY6nDWQO1iMf6WoH412qjmFuk3NfFQ0zvxfyUba9Gky2yXrxf7w>
 <xmx:Wj2hYz3yDdmyIdOJUwH2QukVCbPYDOIdNBsWPA_RgIYYUBt5KTZJwA>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Dec 2022 23:43:05 -0500 (EST)
Date: Tue, 20 Dec 2022 05:43:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
Message-ID: <Y6E9VixS7sV0kpWQ@mail-itl>
References: <Y5KPAs6f7S2dEoxR@mail-itl> <87tu256lqs.wl-tiwai@suse.de>
 <Y5MssNfvE+mUyyZR@mail-itl> <Y5PaF4LhQGIrKthy@mail-itl>
 <Y5SxJ3IkhHSC/Psu@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RJV2GUvBvmXRiKge"
Content-Disposition: inline
In-Reply-To: <Y5SxJ3IkhHSC/Psu@mail-itl>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Harald Arnesen <harald@skogtun.org>,
 Alex Xu <alex_y_xu@yahoo.ca>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--RJV2GUvBvmXRiKge
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Dec 2022 05:43:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Harald Arnesen <harald@skogtun.org>,
	Alex Xu <alex_y_xu@yahoo.ca>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17

On Sat, Dec 10, 2022 at 05:17:42PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi Iwai wrote:
> > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > >=20
> > > > > Hi,
> > > > >=20
> > > > > Under Xen PV dom0, with Linux >=3D 5.17, sound stops working afte=
r few
> > > > > hours. pavucontrol still shows meter bars moving, but the speakers
> > > > > remain silent. At least on some occasions I see the following mes=
sage in
> > > > > dmesg:
> > > > >=20
> > > > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Unstable LPIB (18144=
 >=3D 6396); disabling LPIB delay counting
> >=20
> > Hit the issue again, this message did not appear in the log (or at least
> > not yet).
> >=20
> > (...)
> >=20
> > > > In anyway, please check the behavior with 6.1-rc8 + the commit
> > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > >     ALSA: memalloc: Allocate more contiguous pages for fallback case
> > > > from for-next of my sound git tree (which will be in 6.2-rc1).
> >=20
> > This did not helped.
> >=20
> > > Looking at the mentioned commits, there is one specific aspect of Xen=
 PV
> > > that may be relevant. It configures PAT differently than native Linux.
> > > Theoretically Linux adapts automatically and using proper API (like
> > > set_memory_wc()) should just work, but at least for i915 driver it
> > > causes issues (not fully tracked down yet). Details about that bug
> > > report include some more background:
> > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/
> > >=20
> > > Anyway, I have tested it on a Xen modified to setup PAT the same way =
as
> > > native Linux and the audio issue is still there.
> > >=20
> > > > If the problem persists, another thing to check is the hack below
> > > > works.
> >=20
> > Trying this one now.
>=20
> And this one didn't either :/
>=20
> When it stopped working, I did two things:
> 1. switched audio profiles ("configuration" tab in pavucontrol) several
> times; this on its own did not helped
> 2. reloaded sound related modules, but did not loaded them all back (see
> attached list before and after).
>=20
> After this, it worked again for a few minutes. Not sure if/which the above
> actions were relevant, tho...
>=20
> Another observation: when it stops working, it's never during a
> playback. It's always that at some point starting an audio stream
> results in a silence.

Any other ideas? Or maybe there is another patch I should try?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--RJV2GUvBvmXRiKge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOhPVYACgkQ24/THMrX
1ywPyAf8Da/fQIl0AxdHgHqjv3NmH/GZP0iDw7p25DH//Kb3Q3pOWy4iT+4EGCoG
pt5vpO+aGzZCPYB4sdknOwY2m49iWwvmFRPntcWYtJi+83pgPrHI16yuIkXkidnC
TePBjy79Hwa0uulpfJcrISGJVHEBuTvzcBCeUWwPGNvxDLETtsKKwI8qPxTcRWWw
lsHG36E+R4xe4gvaoT0fUhK0WEOcIBFhwTUkoY5jmS9fJT2iMb+FNLl+74Ok1XPu
tITvw7qbesf0unlsyNe0iHxiI+CV+HTx1GbGWCaGFp4orzC7aLtLcFhUUgBdD5HY
oSLfQe8v04kYsY7ZxqbGOetJWQ4JkA==
=HDES
-----END PGP SIGNATURE-----

--RJV2GUvBvmXRiKge--
