Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0820A453931
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 19:09:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F5541887;
	Tue, 16 Nov 2021 19:08:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F5541887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637086180;
	bh=etpQTX48bmygiaYmk7wlzJSH1DuYnmgCAYBcwBzK3c0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b0BsFD8V6UhqNJzjSJ72UJv8oSByCeKfcJTaE8Dj5DqQsuX/kWQKiYvxXk7FY9LbA
	 DCoYAP3U0VpURQaElALFuVmeTfSFcE66BZqRyfK1IpTr0mh4YQoxVYWx0pPahpf1ax
	 /x71c6njrQyIqgXHdXULsdjviVjbcKiCPDqQ9y1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2844AF802C4;
	Tue, 16 Nov 2021 19:08:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8253DF80272; Tue, 16 Nov 2021 19:08:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAFBCF800FA
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 19:08:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAFBCF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S/WB0iFx"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48B1B61546;
 Tue, 16 Nov 2021 18:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637086086;
 bh=etpQTX48bmygiaYmk7wlzJSH1DuYnmgCAYBcwBzK3c0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S/WB0iFx6wMFITIedZY7XmCqWv4zYMLPXAi0GzzbejfXSMpH6pIC96gzCWdyQIcuO
 dmBu57jYyI14lNe2ltfFxgTr4WvghUaIoBBJ0sQGCI0rr5Qrc9niQ9ja/8J6uFWy/2
 OrqecN0c6qrHWUvb3icM2LhfQughwLSwKQHioR9qbnaRJSXaQ1QYtPXaq1kYAfss/t
 M1E7nkqlahyZ1rTt6/bahazd/jia5W/QDXKIvGzVHPHIiWlN1QVpxsrkjdVcA8a4+H
 MopZdaCdxCgGlsjL/Aj2O5lBQENON5vlU8eAmSuQ1N9qwiq4QW/+HQF4/NBIntF2Va
 16BLJ6XABEQrw==
Date: Tue, 16 Nov 2021 18:08:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 03/10] firmware: cs_dsp: Add version checks on
 coefficient loading
Message-ID: <YZPzgvB2+oXaCupw@sirena.org.uk>
References: <20211116161609.12223-1-ckeepax@opensource.cirrus.com>
 <20211116161609.12223-3-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="I4mzyHE60lWXyD8F"
Content-Disposition: inline
In-Reply-To: <20211116161609.12223-3-ckeepax@opensource.cirrus.com>
X-Cookie: UNIX enhancements aren't.
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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


--I4mzyHE60lWXyD8F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 16, 2021 at 04:16:02PM +0000, Charles Keepax wrote:
> The firmware coefficient files contain version information that is
> currently ignored by the cs_dsp code. This information specifies which
> version of the firmware the coefficient were generated for. Add a check
> into the code which prints a warning in the case the coefficient and
> firmware differ in version, in many cases this will be ok but it is not
> always, so best to let the user know there is a potential issue.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> ---

This has Simon's signoff after yours but no other indication of his
involvement?

--I4mzyHE60lWXyD8F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGT84EACgkQJNaLcl1U
h9Dybgf+IQYXZUqbI2ElORUCW7vtwWeAMjfyoMVXpkwx4ZKYe/OxxiTJXlzNqd/i
Pw2GgRO2ZNO7acdNElAEl/qjqlcmZuHupmP3opa+2WGyQa/foiCstHZS3tayeLi0
K1Zqz6my8Sc5TxpLeXgDk4wbwigfwOrd7ZZXXHBG4OgSI0pWEAy++IIa5DDGKOD6
OHUsTsg+x8QQrGHx2nRelyQLAceSbsrbxCS0O9WFhUBFyXNVu33Phgwt6gX+88Su
2CDweffxP4V5modqn7hDc8Lh53PeRbci4A7mcn8aU99+vpntZ9Xiy2YsSSGZ7A3M
59N2hCxir7UUshZhguVYYidRADJMPw==
=lr6Y
-----END PGP SIGNATURE-----

--I4mzyHE60lWXyD8F--
