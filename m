Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DB045DA0F
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 13:29:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F8391872;
	Thu, 25 Nov 2021 13:29:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F8391872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637843391;
	bh=u7wd6cZ5BU5UDz9AwuipntBqps4d7LfwvFZarA34cEs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UiD8IhBbCm+03UfM8PGCgBfL89SboqBZGK1gWWO0qasCgRrWQ900RiqlrROMoZn+j
	 QCzjJEpgpUbnxjbJgY1o44QCC7DOQV3eJLdpsNFXOiHsmoIY4EJjVqXWllR9WDRKgr
	 XgiAwgrfBtXzi11qusMgPXkkYjhFl12rzXFamdVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52109F804AC;
	Thu, 25 Nov 2021 13:28:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C46F1F8049E; Thu, 25 Nov 2021 13:28:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CA2FF80302
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 13:28:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CA2FF80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="quk/3Oc2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5B65610A7;
 Thu, 25 Nov 2021 12:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637843307;
 bh=u7wd6cZ5BU5UDz9AwuipntBqps4d7LfwvFZarA34cEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=quk/3Oc2Gm7g0B/lK7g7JyX7XKIAAvgXetbV1/g7GP5zMM1B6yVZ1XgRSlRzSKHby
 L/EdkgPxUL98AsU1G/57wlcEGmWEMJrQYcxNP1z5cdN6kkGY5rlosPu6R6j9QhYWZC
 F14HqUY7h0LYt/WM/lWDIqlzcpysZiBxu6qmMXqq2W9JfGvvSe7KHdMiMUP/O+M9zJ
 49eGI2D1iL3nSunLWZXi4fUqUL9BbdEP731Vltf79sxRNyyqnvLbeqXPvzzqtCoZUO
 PEPLd9DHu4vx3aryYT9kbEJsQnJXvBdIiLmRQNzAwrDLAursr2tiGzYxGt+ofpj+sx
 ktLWZ5TG47htA==
Date: Thu, 25 Nov 2021 12:28:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 07/20] ASoC: tegra20: spdif: Set FIFO trigger level
Message-ID: <YZ+BZRB0sUC08lCs@sirena.org.uk>
References: <20211124220057.15763-1-digetx@gmail.com>
 <20211124220057.15763-8-digetx@gmail.com>
 <YZ97Qo500CrSmhXu@sirena.org.uk>
 <5670741a-1517-fc64-e390-b01c53947f25@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PdAaWwVcI9TPi3M0"
Content-Disposition: inline
In-Reply-To: <5670741a-1517-fc64-e390-b01c53947f25@gmail.com>
X-Cookie: This bag is recyclable.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
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


--PdAaWwVcI9TPi3M0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 03:04:35PM +0300, Dmitry Osipenko wrote:
> 25.11.2021 15:02, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Nov 25, 2021 at 01:00:44AM +0300, Dmitry Osipenko wrote:
> >> Program FIFO trigger level properly to fix x4 accelerated playback.

> > Fixes like this should really go before any new stuff so they can be
> > sent as fixes and backported.

> This driver never worked before this patchset, hence there is nothing to
> backport, this is explained in the cover letter. But in general you're
> correct.

That's not going to stop the stable people backporting things, and I'd
guess it might've worked at some point on some systems - I'm not seeing
anything that jumps out as making the driver completely unworkable in
your patches.

--PdAaWwVcI9TPi3M0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGfgWQACgkQJNaLcl1U
h9C1FQf7BiHdMJId6Nyk58krgd7Aqzia9D0StBtbH6BZowb/5L9+OOyeWAuRaTGV
S5sF9XpfA67YuvZG9gKRvjUJR4dPeMfdau6zK/I0hrh4YKINnwwA7wV3EnjlPsnl
k8q4HNiynmcqW4/P4qe7tG4q5GzlNvl+jArcaNZ2VdDft3zh+oGkb9P6i6pvYrDt
AWjc2yClreO3lBC5VIa9H9Cu5m0E9y/pM6NJLvfexSnPPZZFxDQ6aQACrqNfbsTD
dRVh7TZzDXy2v8vDYgrNWfVSh7TIl9SYNzeh8KlMCE/3NLUFPQvqMFl7S3cyrr5a
mkLgh0QEBzrN+0BU2OdvQZwpIdOhvA==
=JNh3
-----END PGP SIGNATURE-----

--PdAaWwVcI9TPi3M0--
