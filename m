Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D86C8AF9D0
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Sep 2019 12:03:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55F89170D;
	Wed, 11 Sep 2019 12:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55F89170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568196215;
	bh=n8D0+3SNHVeZRp9fNIKySREvJscNZjxbu7naNhdjJZY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UHDtCB7f0DSMX0oklBT2i+Y3TJUGRC3cCjVb71m02v7d/Vhb2ohmIeA4B6KgJMs7I
	 yNiStK96s4kQnXEH113AMTa1sgmfJHZIXsnOkvfW9CHPUJknR6eiJhPqTVinap+AQO
	 pgNUtpvJkQ0r4hmE/S8S2Waloqfj1YZE2TrUcZ4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7A27F804AB;
	Wed, 11 Sep 2019 12:01:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13D0AF80323; Wed, 11 Sep 2019 12:01:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D913CF800A9
 for <alsa-devel@alsa-project.org>; Wed, 11 Sep 2019 12:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D913CF800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Hd2nqClD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pTbpqrHj7aQmZyZnA/6i489QjPmL7UgQI7j5Sr5hjvQ=; b=Hd2nqClDILTCI/MWaR0/7sM/+
 ugLX3v7McP1kab0kWucD8KZSi9h9FbVkYjH8N+w/jIC/ffHB3DeftjnI8FZhwp/tQ73OPqVfrt2Q7
 az6kmcvxKZBXa0/xp9yxkq61L+Hl4fQIQ8AgNQjguafKvg79y2I0BBNKT23yG6IYToVnQ=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7zRV-0007WE-3f; Wed, 11 Sep 2019 10:01:41 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 3F49DD02D76; Wed, 11 Sep 2019 11:01:40 +0100 (BST)
Date: Wed, 11 Sep 2019 11:01:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20190911100140.GQ2036@sirena.org.uk>
References: <1567753564-13699-1-git-send-email-shifu0704@thundersoft.com>
 <76759c2c-3f5d-5cf6-fc2b-feb1dc8c0e6a@ti.com>
MIME-Version: 1.0
In-Reply-To: <76759c2c-3f5d-5cf6-fc2b-feb1dc8c0e6a@ti.com>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, navada@ti.com, tiwai@suse.com,
 shifu0704@thundersoft.com
Subject: Re: [alsa-devel] [PATCH] tas2770: add tas2770 smart PA dt bindings
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
Content-Type: multipart/mixed; boundary="===============4626441334251091710=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4626441334251091710==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="movZSYdJ761vCHaE"
Content-Disposition: inline


--movZSYdJ761vCHaE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2019 at 08:21:25AM -0500, Dan Murphy wrote:
> Shi
>=20
> On 9/6/19 2:06 AM, shifu0704@thundersoft.com wrote:
> > From: Frank Shi <shifu0704@thundersoft.com>
>=20
> Subject should be
>=20
> dt-bindings: ASoC: Add tas2770 smart PA dt bindings

I do find it easier to use "ASoC: dt-bindings:", helps avoid
things being missed.

--movZSYdJ761vCHaE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl14xgEACgkQJNaLcl1U
h9CXjgf+JQRRVLHQoSSpOsqlLKQrEf6L37/E55LewVtk40xn8v7aNXy2CaKD7rw5
G2s81qVCi40CLuqGdGJkJNa7Iu8g9e7mD22MsbYagjRcsSQF0P2KNk40/RucW/xl
GmrAMqd5U8JiDeqd63+YpnrsECWTITr/4Tqa+ou++ps0HpWt5XNdjY6RPn47eoLm
GJhwK0pPoM0FFCwuk/78UQ/Tx/P2jXVYkPUXlTSorXC7nZFLOJFiy9QsZIy54CJv
QnEjfeZmAc1Dzz0+ddxF9bD9F4SIA59ejyJP3LFeS2LADc4fGipubl1ZM9uRTbaw
mdLuyZtqvi4imhiDcd84wOV6tL/ULQ==
=9/FT
-----END PGP SIGNATURE-----

--movZSYdJ761vCHaE--

--===============4626441334251091710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4626441334251091710==--
