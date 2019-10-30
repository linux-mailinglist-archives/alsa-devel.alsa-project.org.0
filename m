Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAACDE9D30
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 15:10:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7477F1FD7;
	Wed, 30 Oct 2019 15:09:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7477F1FD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572444649;
	bh=nhoSXGYtLxmNJnYXdwbwkgMkiY9mwqxohpS9t4fSxsw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ibsh8bVFytNggGvnqNt57pUdUOumXaWCJ7QZSHnFzndz4Zl6aiB9CKQjzB7t2/s2a
	 9RrWshaqGRdSZONfxBpHBx6G+w50bP56gwzcwtiqyuIfbGgqhh2lpp08FPdYzzY9PD
	 zaF0YmvAPBnCvgY7Dv33Ur9LzIBK8AwLNOHYwqG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9D4FF8048F;
	Wed, 30 Oct 2019 15:08:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 165FCF8044A; Wed, 30 Oct 2019 15:08:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D65BF8015A
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 15:08:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D65BF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vsHxYqQ0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rujyh9JDW5FAD76PsRiR0Mm8fHg2qDePSQnFFysCS+U=; b=vsHxYqQ0OLmnrZ6WyeDP28eTc
 Vpu5OICP0hMv52+CFx+TuoPmOicK1zKIDpzFwlBZetMgwajqOWpcIqygkGu6II9xzMraOY9dLAfdF
 UOWWDeBhYcuSz8TcWLO1vKYfxRJT5ROJoF6TE1IvVtzp/lLADf06azQSuPL0qfW87x3jY=;
Received: from [195.11.164.221] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iPoeY-000589-4G; Wed, 30 Oct 2019 14:08:50 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id A3B64D020A6; Wed, 30 Oct 2019 14:08:49 +0000 (GMT)
Date: Wed, 30 Oct 2019 14:08:49 +0000
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Message-ID: <20191030140849.GM4568@sirena.org.uk>
References: <20191030085617.14405-1-shumingf@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20191030085617.14405-1-shumingf@realtek.com>
X-Cookie: Keep out of the sunlight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, tzungbi@google.com,
 derek.fang@realtek.com, flove@realtek.com
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: rt1011: improve readability and
 remove redundant code
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
Content-Type: multipart/mixed; boundary="===============3634353222343673694=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3634353222343673694==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O8/n5iBOhiUtMkxf"
Content-Disposition: inline


--O8/n5iBOhiUtMkxf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2019 at 04:56:17PM +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>=20
> 1. remove !component->card->instantiated statement in kcontrol
> 2. goto the end of fucntion if "ret =3D -EINVAL" in rt1011_set_dai_fmt()
> 3. fix typo
> 4. add the range check for temperature_calib from device property
> 5. remove unnecessary tabs using spaces instead

These should all be separate changes rather than mixed up into a
single change, this makes it much easier to review the changes.

--O8/n5iBOhiUtMkxf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl25mXAACgkQJNaLcl1U
h9DE5Qf/UHKMlh4It+dTeiPuuOz1x2YL4wsxTDT32wTXUZ24u3JCLcQI4xZlT9cn
YVyeqQBOQT6LwzvOiqYRlzP+8IblkkNUgNeR/oN7YpBvznHVe06uAFAGZmydIQC9
IcFVD64C3vcnIIrpqmHHKTynGJVb4Yyeb10+iVsGdlXzPbakzjlT0GCUPS42jKgH
zqXR9r+eW/OEARSR3KkGg9fHyzUiyDdtCmPBSz0DTSOWhwsAdlzIhdgK3SMMv/cd
DQVST4XOqrFsUY3qnamtGJzj2Y8WT/Kf4k38Rie+6oDcEMJEOzXeEACM2cPfHjCp
+XZBPvSb6r6BJDVVjsvpO6VYEGs+TA==
=6LGJ
-----END PGP SIGNATURE-----

--O8/n5iBOhiUtMkxf--

--===============3634353222343673694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3634353222343673694==--
