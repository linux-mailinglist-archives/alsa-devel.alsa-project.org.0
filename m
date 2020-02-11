Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C738158E67
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 13:25:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E189F1664;
	Tue, 11 Feb 2020 13:24:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E189F1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581423941;
	bh=MBJlQa69pENicuuBNBXgO+AQ7Py8oRIqPPBddzzXk0w=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ta+RVAYBt9T1prRJf+c6f2NhsXIMP3Y4MdXkZJ8lOiXcQhQndTcjpaV0UD9WCXlFO
	 7iGSLkRmTPcipOor2VOOIISD7acGGkq67yK8KpI56yumA+VhwpWal27tsomTeV+ZV1
	 aw5Hl6wZT/i3O3LoVRlP1tgXFbN/aqfBBZqo9Tf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 116A9F8013E;
	Tue, 11 Feb 2020 13:24:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BD71F80145; Tue, 11 Feb 2020 13:23:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id EA76FF8013D
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 13:23:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA76FF8013D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14B7D1FB;
 Tue, 11 Feb 2020 04:23:53 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DE723F6CF;
 Tue, 11 Feb 2020 04:23:52 -0800 (PST)
Date: Tue, 11 Feb 2020 12:23:51 +0000
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?amVmZl9jaGFuZyjlvLXkuJbkvbMp?= <jeff_chang@richtek.com>
Message-ID: <20200211122351.GJ4543@sirena.org.uk>
References: <1580787697-3041-1-git-send-email-richtek.jeff.chang@gmail.com>
 <20200210185121.GC14166@sirena.org.uk>
 <a9895e583c9b47608aeb3e29d7852f47@ex1.rt.l>
MIME-Version: 1.0
In-Reply-To: <a9895e583c9b47608aeb3e29d7852f47@ex1.rt.l>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Jeff Chang <richtek.jeff.chang@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: MT6660 update to 1.0.8_G
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
Content-Type: multipart/mixed; boundary="===============5580487451735756150=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5580487451735756150==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1ou9v+QBCNysIXaH"
Content-Disposition: inline


--1ou9v+QBCNysIXaH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 02:04:42AM +0000, jeff_chang(=E5=BC=B5=E4=B8=96=E4=
=BD=B3) wrote:

> What should I do is just apply them to be hard code into the driver? I ca=
nnot use event a table to descript it like below?
>=20
> static const struct codec_reg_val e4_reg_inits[] =3D {

Doing what you've got here is hard coding it in the driver.

--1ou9v+QBCNysIXaH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5CnNYACgkQJNaLcl1U
h9CmmAf/f2m+iY01h2zxveePh8kLV67hfAIacGMZXGLIzsnhrSXN/FwdW1get7dG
oG5R50Qosg/i9F2Ov0oqOGqJqtc039++uyXkbFR0gxSl5o7ixX5NlXLVRuqV/qWl
KSmiv4UWKiDVGLu3ITfwdwcLU/0mu1++10XgspK4ZDrexG2sXJAJ4rUN/ntD0nz0
utsW2B0LoZyU5bNQ7qoSPMWQaRWbzIoSYlupXIF9exiO6c+Qh3AL1NSHzwcrAOrp
px7Iu0pVaBC3lcaKw3IkDDcbSwzU+kGfl1WaMcQaHior5sQmZhrL1jlTXigvBLn0
8o8LXGIwL0xXh6O3XWKghL+taEW33w==
=twZR
-----END PGP SIGNATURE-----

--1ou9v+QBCNysIXaH--

--===============5580487451735756150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5580487451735756150==--
