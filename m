Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 090503F516F
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 21:42:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69ACF85D;
	Mon, 23 Aug 2021 21:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69ACF85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629747735;
	bh=j71WdEv6Jpnetb8lOkq2Nq+HDd18F6EPNLaNkhipJj4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iMAJc9tNkOQ2eODqq+pK4H56bfYJIBLLg6gD4TTFPtEUzdxj+/rawdo43zz1mkI2A
	 bUmxzrEsSNR6r+BJPk+rNaByIQGJstQjAarQ6WgLRY7IjYHb06Z3r/nySGqO+PB4jK
	 pkvIBhn/8PEqoEnZKFGeO1I7/GmcanRmULT7vyyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00731F8020D;
	Mon, 23 Aug 2021 21:40:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B316AF8020C; Mon, 23 Aug 2021 21:40:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69BBCF800AE
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 21:40:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69BBCF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QT0TUhGN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06CDD613D0;
 Mon, 23 Aug 2021 19:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629747649;
 bh=j71WdEv6Jpnetb8lOkq2Nq+HDd18F6EPNLaNkhipJj4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QT0TUhGNo9DyLiFnK7ZRR3dTCzWUuBzLr/9CsP//c0AsFdW/T5zQCW57qF73e5Zeb
 LngHY9Ga7zxsOzUTszTbnH40yDHQ4vP8spqV3SbEnfWp0tE+LfqVs3+Mk1T6lb5ydM
 8e8VKUco2zGbB0678IRqpIAc1IfZfUd2l1yM1cXBDtA153+NoZFMNEh9RwuOPAb0Z8
 Oaq+f/RoqCVpC9mDZ9DNlXdZYbLjcbGjNJ9R+weqrLdt1Nor2NCoJPq4MvGxZbdWP6
 BpjMo2MkSFony1t7NtHqPz04PJJ6nFRooMU7mLza08/CWSYs6q/kfTbUYRByIoTfmp
 K1kfHSs7b57kQ==
Date: Mon, 23 Aug 2021 20:40:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: panel: ili9341: correct
 indentation
Message-ID: <20210823194022.GE4380@sirena.org.uk>
References: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
 <162973996481.3102.17751483171907199985.b4-ty@kernel.org>
 <YSP5UGRATAjuRteM@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Content-Disposition: inline
In-Reply-To: <YSP5UGRATAjuRteM@ravnborg.org>
X-Cookie: APL hackers do it in the quad.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dillon Min <dillon.minfei@gmail.com>
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


--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 23, 2021 at 09:38:56PM +0200, Sam Ravnborg wrote:
> On Mon, Aug 23, 2021 at 06:37:55PM +0100, Mark Brown wrote:

> > [2/2] dt-bindings: sound: rt1015p: correct indentation
> >       commit: 0aeb17d1728257f29131a290f0cc8e281cc7274c

> I am confused here.
> Did you apply both patches or only the one touching sound?

> I will pick up the panel patch otherwise.

Only the second patch, it's the only one listed above and the subject
says subset.

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEj+aYACgkQJNaLcl1U
h9ClAQf9GdZp+od3AaNAgXcmo215Bu0e9MGJHFtwWkD+ZFNnarLK9zWH5feM/WDM
72DyLI12wP9dbnQRL6AVlWTUwHiHbGxR5ecJwrGOx3+mkzwltvOiG52swo30V5yO
1rjxW8zoOKIzQ+FfBc/bu+r899PyFRNDYdGcIRpR315V+gy3qqhl7aNaCsLsdHcT
Lw69UT3qXu2zcqWsWAwAyOTaUO24SGfphxPK35CG3aWyI8oF78mzYKoqRiJftRaM
PVlnaImAl8wGMeEtR23bh2mJHtjUgYRpqsuJeKW5U4jAlcARAdA6Ka4tekGfM46d
keVRV5CSGwLWho2G/lo6K24Ex7e1/Q==
=UIFw
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--
