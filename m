Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FA54336F2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 15:23:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8918C16A3;
	Tue, 19 Oct 2021 15:22:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8918C16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634649793;
	bh=7fsumYHDliZuLC11v2hwsWrg44f5IwD62fDRzCRuku8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=akyHODpzAW4gXKOrKAgHgTsASMqYy1AEi6Nuu+SgBiDiYzNd2SbZ+yyHwrodrDtT1
	 tvJQzp3awHcWBf1/2N3t1VYd1hfWFGuySXcVnWMS9g0GXDYaH5/bEQzMeTSA0abrAK
	 1VG+HoDquKXWGWU08kwA1k5RHEyNXCZ/LZzLwapw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5831F80246;
	Tue, 19 Oct 2021 15:21:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C2C0F80240; Tue, 19 Oct 2021 15:21:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6BA7F80082
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 15:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6BA7F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VAUKxfVA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 513046137C;
 Tue, 19 Oct 2021 13:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634649705;
 bh=7fsumYHDliZuLC11v2hwsWrg44f5IwD62fDRzCRuku8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VAUKxfVAvg8SUdJNNnAGoYRxfRZEkx6scwtL8yAlrxqUpn/mvZ6PHOrXhckH8HQxs
 7eMkzyT134ChPKz/BS4WuR60eZ2avvsmMFY75RtD2H/AJjnnWp8IpJoSaXxp/M2DXo
 37oUJT26/muOZrs1pEAD2O5hC8CtsKklU6IeuQ4u71IvJiIY6I8fbV623PV1ReUs3Q
 GjZ3RyBSP0aRe4EyFL4IQR79+KZo8YowWuTn6BMaPwtX4HkG6QKTrwB/blMKq8SHa/
 OPPZAW389PgkDNlgpKIfGwGV7kDhaUVUTOHZCZbr18KXPNVjV+fkb0pUghOZEOrCTZ
 dB7psHbrBgOkA==
Date: Tue, 19 Oct 2021 14:21:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] sound: soc: tlv320aic3x: Make aic3x_remove() return void
Message-ID: <YW7GZ5E8a6oFJk88@sirena.org.uk>
References: <20211019074125.3812513-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jQNrwv3AgDa8+rvQ"
Content-Disposition: inline
In-Reply-To: <20211019074125.3812513-1-u.kleine-koenig@pengutronix.de>
X-Cookie: I program, therefore I am.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de
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


--jQNrwv3AgDa8+rvQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 09:41:25AM +0200, Uwe Kleine-K=F6nig wrote:
> Up to now aic3x_remove() returns zero unconditionally. Make it return
> void instead which makes it easier to see in the callers that there is
> no error to handle.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.

--jQNrwv3AgDa8+rvQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFuxmYACgkQJNaLcl1U
h9AW9Af/TLSSokNc/j9/BxgIdhzcA6Z0KbE4eWBEhdjkYWFmV2B/CgKTAMKsTB1B
eKe2MifxoCMwDu+mjABczEn85v1h6cUvAe67e1RaY06rmYeSUj0/1ms9lr1MwJS1
M8klfCbsQGyKgMpzGzpSOWT4H7/5c5/rwpSfzmyQylecKPBlZhLHGYYY2u5Gacdi
wqQWxbP5cs1F8KsTSoBdKF8nnIyUFPXgOk3SRcecpMhBJMxKDfBt5etVLdJgR3Z0
Pvm7sgnFgG/vKL7asEWYRbIrw+PDtPN6WUskXoMvS3UmXaX8/ValQXqzAw4VHTAj
M3fOCjKA2OzciX3JscFxwKulDlZo4A==
=hEUK
-----END PGP SIGNATURE-----

--jQNrwv3AgDa8+rvQ--
