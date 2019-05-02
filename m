Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C76811119
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:11:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F7DA1724;
	Thu,  2 May 2019 04:10:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F7DA1724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556763079;
	bh=GxAsbsPR60mM+RhvOXRL8RjmNDZlnRmODjnupzNzS6s=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kCUEMqcnpJL0q7fDoxX+NiTI2oEr6j4FHnggPdjCQAgWTHKfVSfMEKseAhrl1mCbj
	 vPybq5p75+aWE4rAvwqpJOzIS7VjKyGVvYwVkA+jM3z/SjFyoDCC+dQtscDKkORHAo
	 Pc5tJRZLxjjR1ymEk/kfwDYY7mTcChDbhG8IEQCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D00A2F896C7;
	Thu,  2 May 2019 04:09:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA61DF896C7; Thu,  2 May 2019 04:09:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8682F80722
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8682F80722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="k1j3roMB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9qrOjXUAzoL3QukZfNxj9Z2f6/cNNtJl5gF/8qMJ/nM=; b=k1j3roMBI641G/c+bxN1yEEbF
 cAlY0SqS8Mkq1cFSLFGCTq3yFmYeHaZUzF+yDjSGElj/2zbti6J/jbLMR8rD4C+ANsOblUq1HUBiJ
 sdX5THxIJTjsQ49Jrk4cJ4+11L0oj+lbLFdK43+oVHWAQ13zQ+M4xwPgc+1sZJB1PtFHY=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1A5-0005ng-Jg; Thu, 02 May 2019 02:09:25 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 2D2DA441D3B; Thu,  2 May 2019 03:09:22 +0100 (BST)
Date: Thu, 2 May 2019 11:09:22 +0900
From: Mark Brown <broonie@kernel.org>
To: Saravanan Sekar <sravanhome@gmail.com>
Message-ID: <20190502020922.GA1602@sirena.org.uk>
References: <20190430200118.13014-1-sravanhome@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190430200118.13014-1-sravanhome@gmail.com>
X-Cookie: Do YOU have redeeming social value?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH v2] ASoC: tlv320aic3x: Add support for high
 power analog output
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
Content-Type: multipart/mixed; boundary="===============8184520938771679889=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8184520938771679889==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2019 at 10:01:18PM +0200, Saravanan Sekar wrote:
> Add support to output level control for the analog high power output
> drivers HPOUT and HPCOM.
>=20
> Signed-off-by: Saravanan Sekar <sravanhome@gmail.com>

This doesn't build with current code:

  CC      sound/soc/codecs/tlv320aic3x.o
sound/soc/codecs/tlv320aic3x.c:428:20: error: expected =E2=80=98}=E2=80=99 =
before =E2=80=98;=E2=80=99 token
    4, 9, 0, hp_tlv);
                    ^
sound/soc/codecs/tlv320aic3x.c:330:61: note: to match this =E2=80=98{=E2=80=
=99
 static const struct snd_kcontrol_new aic3x_snd_controls[] =3D {
                                                             ^

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzKUVEACgkQJNaLcl1U
h9COAgf/bEXTHlf3176QpGpGHCWyhIp2dGCP6gMgr0PXVEVWSMHxsgsy+VoB9x/n
lApLY1dU5su1ZFAIfrgKw50lYRcplng82rn9ucAWXaU/mRh5siPAvHoNajCauI8n
6mjjlv4gngHg8ctQQ2y0vNyzs96MlMcs9aYnIBYnLDOthFBbcai8IBRcgxw2pWp7
dqJK+je2hIFMyJN3ChvgU0h9/C0OFWraSShvMEZRmQJJQ04IxjjuCUXKqHUYoqcZ
QkGa/zyYw/rrD4XlTp0dQF3aVwe+b4SuytbQ6Hf0bd6Z8G2ze70jSXuArQpLa/Tq
jx6FAB963mIStEewayY4z0zmNbQqzQ==
=WLwu
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--

--===============8184520938771679889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8184520938771679889==--
