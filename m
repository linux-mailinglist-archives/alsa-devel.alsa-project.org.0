Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC3A1E7B42
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 13:09:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10A0717CE;
	Fri, 29 May 2020 13:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10A0717CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590750546;
	bh=iIEslzxfH6bDmY8Mj5xKBkYCHktO5b0zJ0xrE+fvVtw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jPLgoL1OJ5QkZe8skp+OmcsGw109yY2fWfu+mgEte7zQ0CTblkkD+ERyBC5iB/3lg
	 dmsI80jtWx93RCU0DUYZc/SdXpTlhqMg091uGUnltn8JLsHn+cQgxOsW80avcCRouh
	 Hkr7YTbn+altq/KUxEP3HnWHdVHcA7D0YbpVmUCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D6F3F80227;
	Fri, 29 May 2020 13:08:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F5BCF8014E; Fri, 29 May 2020 13:08:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 493AAF80107
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 13:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 493AAF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Oq8nzdxR"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC7762074B;
 Fri, 29 May 2020 11:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590750482;
 bh=iIEslzxfH6bDmY8Mj5xKBkYCHktO5b0zJ0xrE+fvVtw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oq8nzdxR6eA4taPt43AhEbztBkrvrHSQ+dN/crQT4+I/6GtFEN4Lds7QXKALPZUFy
 prXy1Y99yiOZUukQjz0Mej1bp4s8U2pT1wzRuWFy4rusvjRSy+4g4kn+WdtXbuBCP8
 gtAnFBWua/jMwyGjm2D6hOXs1TaHQtomFuT8e5vU=
Date: Fri, 29 May 2020 12:07:58 +0100
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com
Subject: Re: [PATCH] Enable class-D silence and clock detections
Message-ID: <20200529110758.GG4610@sirena.org.uk>
References: <1590750310-30085-1-git-send-email-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ulDeV4rPMk/y39in"
Content-Disposition: inline
In-Reply-To: <1590750310-30085-1-git-send-email-derek.fang@realtek.com>
X-Cookie: The Killer Ducks are coming!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, kent_chen@realtek.com, lgirdwood@gmail.com,
 shumingf@realtek.com, flove@realtek.com
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


--ulDeV4rPMk/y39in
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2020 at 07:05:10PM +0800, derek.fang@realtek.com wrote:
> From: "derek.fang" <derek.fang@realtek.com>
>=20
> Avoid noise under bypass boost mode.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--ulDeV4rPMk/y39in
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Q7Q4ACgkQJNaLcl1U
h9BRcAf/UWd25WvXWnRw7J7s3gbDQHNWRNjTsQ/y3AwcHi1ioTl7EU7lSCItXujP
AYVXxnCty3XhF88TJKNFtQUJ7rXZtVZukWD8akct2ELQ5YzuqH3gpheIeYMTLcme
Ujlc2JHtxCaz8GThz2UkuDt7pUn4GqZvKm4zi6r/KEaloQ7SKdn7FdnjBDSZaTMH
aU4vY7l7r15203vNMJR2IOXejJWF4rBqYoK8uO8g7q22x6+lidR9cH/OTf7wVryF
0ML4HAR1eeL95TTJyOSgYoYE2EhBPWzEeZY+SDs54/6Hlml266x47VsM+dmpjcGv
/6BzAhVBoPZgzwUSAcu1iL49tcI3FQ==
=IdGS
-----END PGP SIGNATURE-----

--ulDeV4rPMk/y39in--
