Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A611F5613
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 15:46:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA08C166C;
	Wed, 10 Jun 2020 15:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA08C166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591796773;
	bh=pTvgODDLpGVAtsKRFTt5fVldNM5O/r4VoSBkm+++f1I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rYnSnR01wouH+OctsM3AzPJoDjKEKbUm1gGDvByjDG5p1WaBTgU3+DKQ4c4dVcFE7
	 nHCiBakXIKXhCJC7T4n9eElKH3bHqugDzayc7QuS2NAMpW7MsVt7P2ezf9Awyzmu+X
	 Wgtui48ttg7hVzQVnQ2Zrex9kjgPKLL0AgpcQOzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE5EAF8021C;
	Wed, 10 Jun 2020 15:44:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FB78F8021C; Wed, 10 Jun 2020 15:44:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65549F80058
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 15:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65549F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M5kMYju+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5E4220734;
 Wed, 10 Jun 2020 13:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591796666;
 bh=pTvgODDLpGVAtsKRFTt5fVldNM5O/r4VoSBkm+++f1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M5kMYju+6C069CftZHLAzC2L5jVZM7/v+mM8sUaHN0LJJC3bymRJ9hapy0CCUAWpJ
 trydbk1Qw2NuONBmr1EGWdLOv/+FEw0ZV3ZAx/sZVaT7G5IlKn5YcemFDIsuwLqlAC
 yStYcBJCgN5ces/uYVVWGdbTyIEPI3SyDhycCW3c=
Date: Wed, 10 Jun 2020 14:44:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [GIT PULL] ASoC fixes for v5.8
Message-ID: <20200610134424.GE5005@sirena.org.uk>
References: <20200610133412.97D6E2067B@mail.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/2994txjAzEdQwm5"
Content-Disposition: inline
In-Reply-To: <20200610133412.97D6E2067B@mail.kernel.org>
X-Cookie: fortune: No such file or directory
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


--/2994txjAzEdQwm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 02:34:09PM +0100, broonie@kernel.org wrote:
> The following changes since commit a6b675a89e51a1cdad0481b809b7840d3f86e4=
b5:
>=20
>   ASoC: qcom: q6asm-dai: kCFI fix (2020-06-01 12:15:53 +0100)
>=20
> are available in the Git repository at:

This mail is unsigned because I'm automating sending pull requests and
it's hard to do GnuPG MIME stuff from scripts.

--/2994txjAzEdQwm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7g47cACgkQJNaLcl1U
h9Abzwf/fIwoPfob9W22ZDhshKNg36GKZy4DSKGtg8kfTfKoRioQcUygJ2O+o8Bc
bxL1yqGH3CoDjak4d4bjyp0ItDmYOG6GLCerpfYRqnHwFy1oBtkLPAwgIXPXLgGK
NaQWqMvN9Iv8wQVkpNbSmiIINqsK1OcgNsCHw4BGLDeq1EXNjlWcZ6vVAROa5lZN
3TPorb26Z+1wOMeVI6W5+bWJ9bRyzvJ6XwY5+GKzbe/g8leSiwKnMzWjK0U5ehME
UOUdAhdBuJPMVGZaCc0AsOlr6YS7NBsXpi0ZEJwND4yQaJBLo6CytpsAxnJhSscz
8/JBCQnTJiQv6eoiSUXOc1sztFgwYg==
=sQPr
-----END PGP SIGNATURE-----

--/2994txjAzEdQwm5--
