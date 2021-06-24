Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F833B2C27
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jun 2021 12:09:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE1DD165E;
	Thu, 24 Jun 2021 12:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE1DD165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624529375;
	bh=a2QOqcnBAxBRYQEUUzGYao+z3AXWsARQG+nbmSkCoe8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=abCvDP+uN7TKP5xUmOsK8jn8bOTAzU6r1CQnhb9nmvCpv6PGnhTJtpGIXEe/3+OFr
	 APGdinSGJCBZL73HZlXqdL5ohdn+tTQKrRtZfARnyVHArAJTlvl6FK0KjUGPaRbmv9
	 vH+zqkFbdrH3EN6FslRDYISnSvO7WaLiAE8pyxRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2731DF80268;
	Thu, 24 Jun 2021 12:08:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B45CF8025F; Thu, 24 Jun 2021 12:08:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D06AF80137
 for <alsa-devel@alsa-project.org>; Thu, 24 Jun 2021 12:08:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D06AF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DrzCEGz5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5F3D613FB;
 Thu, 24 Jun 2021 10:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624529279;
 bh=a2QOqcnBAxBRYQEUUzGYao+z3AXWsARQG+nbmSkCoe8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DrzCEGz5qxIgFvKsvMFN6YzTWqGOnZ/4xV1t875Vo0evVHwN4ELB8Ec8aciAYY5e3
 UumRlXkHgOK/Dc2iFB6yxGgQbonGj0rJNdIzeJ9nTAxqsOBFZeiqfFpSKifkWDZGnJ
 Akrxm7FVPg9eHBlOVVVj4B/KOtmg4akT5Y12V4POmSqcAAQMpJrvJaAD4sPlAIttCH
 lrhlxVg/dKXLlBewQb4+p9C+1wgtWqpoJAb1Sk7VbAaE1W7sirwz2r0IsxvpyN6lO/
 ZH/UrtOZBv1BCSeYDBkvKFvmBLqJkdvcXFYuKkXGx1EbOs9VvzNrGB2y+0djGymsGt
 vCW5ONGM58uBQ==
Date: Thu, 24 Jun 2021 11:07:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [GIT PULL] ASoC fixes for v5.13-rc7
Message-ID: <20210624100734.GA3912@sirena.org.uk>
References: <20210623170530.DFA99611C1@mail.kernel.org>
 <s5hpmwbn0o2.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline
In-Reply-To: <s5hpmwbn0o2.wl-tiwai@suse.de>
X-Cookie: World War III?  No thanks!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 24, 2021 at 10:10:05AM +0200, Takashi Iwai wrote:

> If you have some commits that must be inevitably in 5.13, let me know,
> then I can cherry-pick and submit to Linus.

I think these ones:

> >       ASoC: rt5645: Avoid upgrading static warnings to errors
> >       MAINTAINERS: remove Timur Tabi from Freescale SOC sound drivers

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDUWWUACgkQJNaLcl1U
h9C25Qf+NRDAOvSXrKNxHgnDPlZAyntzuxStxh/ZrzWRzldoeuJyZJ1KvRg5r3Ue
FxfHQZiJnx20IqhndqYVhrUPy8ILZIjZl78ZXipYGoxSScIk5qgNLt4ZoSmhGdnj
49JWXGkny/hjzJx5ip5+SOKkpwli8aJyavwrt8/M8G2ZWLr6XUF0MOiz1bwiu+zD
wd7NYmszhc/ezJ/5bmFAr2+aTfVERVlD8bjW+dS9+o9tHX4gP+Zymnvx8OiIZgwy
qe64z9jCOOpD12OxG9SUo0EgFhLaOrND0J1G56IKxPLluk2PO9s5W0KPmJIKJTbs
aGPpLbThiQH48YJCcnjawaZlV7l4mw==
=m3Zp
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
