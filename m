Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A7B4663F7
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 13:50:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFF8A2448;
	Thu,  2 Dec 2021 13:49:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFF8A2448
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638449437;
	bh=OYZ5slALRb6YEEz0iSMCUsRQKUEEfwmgzxSeCbV3Ly0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GRaC9oXvYZFvkHiLy8+MXCDlwNqJCSRyu2mgq4KNgRDBp7GRETdV7W5gHRZeMGOgB
	 vUc3Dy6lwnAPSya6xKyxPZajZn/DAbesrEMYdfvVmFpJRzjfOq37dkNIBrtEaiZ/Bw
	 urpK6wQBM5axUsv8AgY4AtFfb+FIB247g5Dkq848=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 156A0F800BE;
	Thu,  2 Dec 2021 13:49:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98406F802A0; Thu,  2 Dec 2021 13:49:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6166EF800BE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 13:49:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6166EF800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OgwbO/pK"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DBAB0B82341;
 Thu,  2 Dec 2021 12:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F72C00446;
 Thu,  2 Dec 2021 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638449350;
 bh=OYZ5slALRb6YEEz0iSMCUsRQKUEEfwmgzxSeCbV3Ly0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OgwbO/pKpgHLYNo6JCXBabVCaL8HmrhG88Ot8MQyNV8YzXpPJOo1tImriUg7mTDvi
 zlFGrCcr+7NAE5MLXYYjBRCnly3hujJUDaF1GSH/uAy7D1mGal2GaB33D62hQ72a67
 XMrH4DrmhyA0CZolOBI8pvCMEr3Fi25NLupT4qk61E+nizj0Yrg6Q3Eelu70tKXwy+
 VVe4MoxPIsBo3D2pHKcDdGKpOk3RnmNQtWHfORvBrm3aXByUgQcqUGCERi1x4V6hRx
 7bbI6U9N0V+VkxsTDlzVV4mHyPIosds2XGABPs3FpgCj7DQqJAc9XOZVq3IgZyRQWX
 kyQp2w7iKDdww==
Date: Thu, 2 Dec 2021 12:49:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l42: Implement system suspend
Message-ID: <YajAwvruDCzaR5wS@sirena.org.uk>
References: <20211201153648.17259-1-rf@opensource.cirrus.com>
 <YaejghraYE6lD7FD@sirena.org.uk>
 <87930df9-6220-807e-a655-1c7d7ec020ab@opensource.cirrus.com>
 <YafyWnVA1J1rgCf1@sirena.org.uk>
 <20211202095333.GK18506@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nCM9gNUjdUpogTrV"
Content-Disposition: inline
In-Reply-To: <20211202095333.GK18506@ediswmail.ad.cirrus.com>
X-Cookie: Put no trust in cryptic comments.
Cc: patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, alsa-devel@alsa-project.org,
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


--nCM9gNUjdUpogTrV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 02, 2021 at 09:53:33AM +0000, Charles Keepax wrote:
> On Wed, Dec 01, 2021 at 10:08:26PM +0000, Mark Brown wrote:

> > ...that's based on the assumption that this is all about the magic write
> > sequences you're using for shutdown potentially conflicting with default
> > values you've got in the cache?  If it's not those then the assumption
> > is that either the device was reset in which case it has reset values or
> > the device was not reset and held it's previous value, in which case the
> > cache sync is redundant.

> This isn't quite accurate though, as whilst the device was
> suspended the user may have touched ALSA controls which will have

> updated the state of the cache. Thus the cache requires a sync
> regardless of if the hardware turned off.

Right, an actual description of an actual issue.  Though how would they
have touched the ALSA controls during system suspend?  Userspace should
halted before we start suspending devices so there shouldn't be anything
new coming in from the application layer while the device is in cache
only mode.  The sound card as a whole should've been suspended first so
nothing should be coming in from there either.

> I suspect we do need to have a think about the write sequences,
> but there is also a more general issue here. The sequence looks
> like this:

> 1) Device enters cache only mode.
> 2) User writes an ALSA control causing a register to return to
> its default value.
> 3) Device exits cache only and does a cache sync.

This is a thing that happens for runtime suspend but for runtime suspend
we have good tracking of if the device lost power so we shouldn't just
be marking the cache as dirty unconditionally.  For system suspend there
shouldn't be a need to worry about userspace changing anything, and
anything coming in from the rest of the kernel should be very limited.

In any case this isn't something that should be hacked around in an
individual driver, like I say whatever the driver is trying to do needs
to be written in a clear and obvious fashion.

--nCM9gNUjdUpogTrV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGowMEACgkQJNaLcl1U
h9DBhQf/TTyORcnTZkHZB+p/0txthGanm/yQPncXofYRB8q3HBkAVmWZIrmPk7Wf
836TS2fc6cXWOdXCOg91On1weoFiimW3Tf+mr4uac6H3PT3seXnv/7T69kpYN735
EIVcqQdJDRrKFHw9wWUDIzq5i2Si31QiUNuud+L7HizkMsbUlZrjoeP9bREuJaYu
FgDOn2mddi4TE+Qib//o9cFik48P0vFZ7STVNoRad1PDsbnIJUhp0m7aNA3nUSNf
cVphB6f6cWKxhh6CS8TK/faraauQ69jv/yo00BWqmVxnJF/jU2D7o4fj5HqgGETS
aQzn3pUOWBxtCdzpd/7f0wd7fOXmFQ==
=Y5jC
-----END PGP SIGNATURE-----

--nCM9gNUjdUpogTrV--
