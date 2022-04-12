Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D5C4FDDA8
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 13:36:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 387F51AA3;
	Tue, 12 Apr 2022 13:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 387F51AA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649763364;
	bh=XZbcNy7PMuMXlSXvm+CTHS5PZZ7TEShvnd9kXW/cWtI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CvLDHpP40EUN6RYj9kmBpzFzfmc5j3S64C4IYyXgB51YFsUCx4WUoH1RwmTK5gSRX
	 OT6zhJzjaEJ44Vy0+iQ52ZFf2NuBssAtzSkbY+i1GahaQg0NglWsUBc4a2Gwl9cPNM
	 3PmmV2ryPNdF1/7aaNPQxwqhA6zy0gXFGyqoqAwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FD4FF80245;
	Tue, 12 Apr 2022 13:35:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EF6AF80154; Tue, 12 Apr 2022 13:35:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 330DBF8011C
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 13:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 330DBF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F/DcrA9t"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9307B61A21;
 Tue, 12 Apr 2022 11:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917B7C385AB;
 Tue, 12 Apr 2022 11:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649763293;
 bh=XZbcNy7PMuMXlSXvm+CTHS5PZZ7TEShvnd9kXW/cWtI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F/DcrA9t/aCLMMn24qpzUpjYwEKgsbHiyv1lb8g/y7cw0S1iu7o7e8fXndY6gkRw1
 rUnKw3+rSFXes3vvtT7MYl7bCK65J+2eJcxPMqk6/wSSU8WqN+jU90kEpRcRmyYzhH
 te1GAX/Z3qCTjjyxN1AO1+oz5LFdrsvxeaCho+CwmU3YUMLrqihhp/+E3Quw0If+SU
 6y0tPwkkOSXzc/zcgb6edoXLckhxo4AbfneoDBM8ZID8UCBNvh+eU4xsWi1nbgCgqq
 amZdYCrkGC+ss39Poqn8jFI7COTl2Pfkw3t7jTDrmZ5WFfXD7cIPDxUA09t0mOnzhG
 PdIbqH3WujGKQ==
Date: Tue, 12 Apr 2022 12:34:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v2 1/2] rename tas2764 to tas27xx
Message-ID: <YlVj2H1+b75IKHpZ@sirena.org.uk>
References: <20220412070621.4513-1-13691752556@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="We0CF1PvHvKO+Ork"
Content-Disposition: inline
In-Reply-To: <20220412070621.4513-1-13691752556@139.com>
X-Cookie: Approved for veterans.
Cc: navada@ti.com, robh@kernel.org, alsa-devel@alsa-project.org,
 shenghao-ding@ti.com, raphael-xu@ti.com
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


--We0CF1PvHvKO+Ork
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 12, 2022 at 03:06:20PM +0800, Raphael-Xu wrote:
> rename tas2764.yaml to tas27xx.yaml
>=20
> Signed-off-by: Raphael-Xu <13691752556@139.com>

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

--We0CF1PvHvKO+Ork
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJVY9cACgkQJNaLcl1U
h9AkUgf+OFuLf3alvzaoNxdjhi9QPVr4S/V8u5yUv9gr0OHgpzdY37vaBY8NEg9a
kGczssACLD0/TiPSF9JlHRQWbo/NmV6dXKAU478AzRy6BHZABSIXDql2Niv9gd0Y
pLPkuBPzxj8BeaEPYGRz6GtUhRpfYv+JrjeLWKClnTb9XQVhfU2ibFS5K+e2HMgk
EfnybxbiowSpu46q+/XDUXwmbzWRmAWtBV7+nXCdZ5XoDikexUdQ5SkMMisJh8UX
MCMkrFoNBzaVOXqUCL2knJ/mb3wmUlt4JdnI/iDY46ZC+XsgaZesDU+sGEq3DTgH
MM2Bfy4nImVQQDJJ9bFInJ3tvhc60A==
=ZazT
-----END PGP SIGNATURE-----

--We0CF1PvHvKO+Ork--
