Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E011215193A
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 12:06:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C44A1696;
	Tue,  4 Feb 2020 12:05:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C44A1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580814381;
	bh=91AquUzVW6V0V2n/b5e+tkWC9M+xZOfVpVAV8U53wdY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ws1GOEWjfZ9jiUWzu8SGKtM4R+nahkDXD7Cj6CjqWF+AcLYziH94rjeFRLtEnJli1
	 tdK3RMUXIDUYjLOG57LDYU5DO7rOUEg2pItoyMsnu9X/70umQpH+Aag7B3EXNvZoEb
	 BSVcXbGUzYf7vjOeJOZX4hRYxw0pSVGb7vSt3FNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78536F801DB;
	Tue,  4 Feb 2020 12:04:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9DE7F80162; Tue,  4 Feb 2020 12:04:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80255F800F4
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 12:04:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80255F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="MOxQIAQi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vY3Qq+U7Jn5c6tt2grI3S9+S5kIDQYwY4zy6sNCZABs=; b=MOxQIAQicikK15Kj0qop8iY1C
 g5bDWw+WyvmkNNXYQWpVnXHKpJEIwDQ6I3XgKA3rkOAXFL3vmkmU8huVXdo1mghxMVl4cQmb4SiDZ
 Hh3CphlWzl3rDRmIPIUNYmR308WNmMF4KJTQafrd3OOTXo8qhBQXJw0qnU4Val6hZH09c=;
Received: from fw-tnat-cam2.arm.com ([217.140.106.50]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iyw0O-0007Ky-Je; Tue, 04 Feb 2020 11:04:32 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id EE06DD01A54; Tue,  4 Feb 2020 11:04:31 +0000 (GMT)
Date: Tue, 4 Feb 2020 11:04:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20200204110431.GC3897@sirena.org.uk>
References: <20200204102428.26021-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200204102428.26021-1-srinivas.kandagatla@linaro.org>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: sfr@canb.auug.org.au, alsa-devel@alsa-project.org, lee.jones@linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: wcd934x: Add missing COMMON_CLK
	dependency
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
Content-Type: multipart/mixed; boundary="===============1734064704706657214=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1734064704706657214==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3m6ZAtymzEdXvUYk"
Content-Disposition: inline


--3m6ZAtymzEdXvUYk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2020 at 10:24:28AM +0000, Srinivas Kandagatla wrote:
> Looks like some platforms are not yet using COMMON CLK.
>=20
> PowerPC allyesconfig failed with below error in next

This doesn't apply against current code, please check and resend.

--3m6ZAtymzEdXvUYk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl45T78ACgkQJNaLcl1U
h9CV4gf8DoN1L+3ztg3WWNOFL83oV1ry1PG0ADTcRk9kGu6Bvgko4UJq906Df5Or
eptXPYaalkBhWiCTSb8BVHB4zyOCgMRqdOIBa6II2emQStrWOtbP5PEdMuPxuuie
1jMV5D3Tio6GZ/RWQmNhSEZrmizFtKqF9iLFGl21FIu3NtCvrPR7+8V1G8GUsoR8
UntEZCkHvy+QKycJgrZHrAlbRi7fguvG/dVHV7GsKLg9PKkobU1NGVXYfa5hqDTf
oi8gg1xK0Sparvh223uvCYST/QX/w3a+/dvWAJIqPcG0ke9hjtTUPfIxkZMT7W5U
GbzCVPWpVOvL3xQB2yyd5h+h3zH/5g==
=42ud
-----END PGP SIGNATURE-----

--3m6ZAtymzEdXvUYk--

--===============1734064704706657214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1734064704706657214==--
