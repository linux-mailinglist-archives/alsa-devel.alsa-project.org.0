Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0363C65D3FE
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 14:18:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 373AEAE4B;
	Wed,  4 Jan 2023 14:18:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 373AEAE4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672838330;
	bh=2Qe7ZucFSY1S6VSY/coooiZSsIRc3bcTxXMb1tKcI3o=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MgyEZygOJlN6BEwFjdeDdc2H+UjqutadcO6nJoxqPlypEgC4s4A9Vi52Tk+QY53Gl
	 dotc/2DJSTUco9WJY6px8ckyx16WzZ7a4QaSETDPoYGHCfCBOBa/vhptjKhgc48qpI
	 HM4IyX3OCVFevVFM0spR+du5N3Vfpca4fomANh3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC8F3F8023B;
	Wed,  4 Jan 2023 14:17:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 960A8F8023B; Wed,  4 Jan 2023 14:17:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93EA4F80238
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 14:17:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93EA4F80238
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XFVAy4YJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96DDC61705;
 Wed,  4 Jan 2023 13:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A09C433AC;
 Wed,  4 Jan 2023 13:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672838273;
 bh=2Qe7ZucFSY1S6VSY/coooiZSsIRc3bcTxXMb1tKcI3o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XFVAy4YJJ2fcJmeZM/RzIG436dqtkTYASrR+hbsri3kYmVnSIMPbEHh+tH3asEQk6
 LpYkwqFZcuUXnm89K26kKE0lIOlQLVsgzBrlQf1qSWjhHK+JSYpSnbsz7GcBXYj9is
 MjTAvbUJ0v3UMW6aSFHqrOwBRmYiWQMu05YEW46xw3H0C+1zboBAztP9SwXdwCc+2U
 nvVdPKMtojXclt4ujCZmAKUUCrqm+PS0DFcnNJXFA+A4Squ/Uyjw70PMAV2Wn2yoBF
 PznQr+BqOr6yy8ipANN7HXdDUZqxFdH5WTMsMaUnMhP5wDEARX3AM2hzLG7CptOWEK
 np5WK+LhpgPfQ==
Date: Wed, 4 Jan 2023 13:17:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH 3/3] ASOC: sma1303: change the overall contents
Message-ID: <Y7V8fSJfzGqFzEje@sirena.org.uk>
References: <20230104064342.2094-1-kiseok.jo@irondevice.com>
 <20230104064342.2094-4-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rdDklsKOwQSLa/S9"
Content-Disposition: inline
In-Reply-To: <20230104064342.2094-4-kiseok.jo@irondevice.com>
X-Cookie: Stay away from hurricanes for a while.
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
Cc: alsa-devel@alsa-project.org, application@irondevice.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--rdDklsKOwQSLa/S9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 04, 2023 at 03:43:42PM +0900, Kiseok Jo wrote:
> Change the component function like DAPM route, widget and controls.
> Apply the hw params according to DAI fmt.(Not be user controllable)
> Remove unnecessary content.
> Revise the style following the kernel coding style.

This is too many different things going on in one commit - it really
needs to be split up, and things like fixing to use hw_params should be
part of the original commit (which I've not looked at yet).  Try to have
one thing per commit with the commit log saying specifically what the
change is doing so that reviwers can make sure the code changes are
doign what they're supposed to.

--rdDklsKOwQSLa/S9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO1fHwACgkQJNaLcl1U
h9Bh3Qf+PQiP8oc5pz+fDqn/p2lSM+cr4DQTUNzdExOnQnFMktx/YY6F3qziTM/c
hevTj+kglocH4t00rlTB5wV9shqPJkJFFnfIYpere0p60UKkj3kFldI0nZfvUVJk
/GSOq6bkuys+scy289G6Gm0Uysi88j40Q+1Ow2g3grYgQCH0AXGVpx5f6c36RV5H
hMTL1joNKr9ZFpbVY85ZBIgppF+oRkms6tnE/OjLrDFsYP8pCt5gZNgaZQBNVfpd
B0y6wEkpYHnI7p3TVIRHR7pbdeJZK+OHIdhhGnoKsnNKoD6ZfyB5MKmBywU+R64B
Mg8PnG68X6vjXhdk8GFyRQ5yDMEFkw==
=f1cG
-----END PGP SIGNATURE-----

--rdDklsKOwQSLa/S9--
