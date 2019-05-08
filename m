Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 654A5171E9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 08:48:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD76B1821;
	Wed,  8 May 2019 08:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD76B1821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557298108;
	bh=WShvjHJWfzyNI1V3HZznii7GXyL/PUhTXLzVIs1y6LE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LNAm63wQyJVUhJGoNNYeEoOgneJJk/nSOOubHXaRld7Ou6DlS4KmOBEjIzJD9dGJM
	 6+LLrkI7hJOOk8lsGZuPtAjQek2qN4T1PJxmZnaUeQr+wiZDcpTieupe0pJy8Oj/Bn
	 ov7I6wjM5MBZjA/VI1CjcpTzJQTDcj062CyZnDT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EB60F896FF;
	Wed,  8 May 2019 08:47:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBC15F896FF; Wed,  8 May 2019 08:47:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73132F80796
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 08:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73132F80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Qsn5PZyA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JL+LbvhP4oFaheRjv1trtE6LxKEuCxpw/hxnybibOFo=; b=Qsn5PZyAJb85n6FqIXoq1Doyz
 kbkc0hHAcXtVzfw/JBOHJ69xaPfVn45wJxDEG19KUWUmYVOuKaJm8+O/G4lI6RgJHEyV7mMo9XBML
 nw1V6KwivS4K8ciuY109zuFeuteox5h4x87lY42q0sp6+Qg2/6EqKtAKh6XybsTrQeNYk=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOGM0-0007Ah-RD; Wed, 08 May 2019 06:47:01 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 19A1744000C; Wed,  8 May 2019 07:46:51 +0100 (BST)
Date: Wed, 8 May 2019 15:46:51 +0900
From: Mark Brown <broonie@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <20190508064651.GO14916@sirena.org.uk>
References: <a2c4e289d292ac0e691131784962305f8207a4d8.1554971930.git.shengjiu.wang@nxp.com>
 <dc58fb7a-dab8-2ee0-43e0-76da75ca2e0d@embeddedor.com>
MIME-Version: 1.0
In-Reply-To: <dc58fb7a-dab8-2ee0-43e0-76da75ca2e0d@embeddedor.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH V5] ASoC: fsl_esai: Fix missing break in
	switch statement
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
Content-Type: multipart/mixed; boundary="===============1631198378484830166=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1631198378484830166==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lBnNT+4yy4PYvQEb"
Content-Disposition: inline


--lBnNT+4yy4PYvQEb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2019 at 10:59:00PM -0500, Gustavo A. R. Silva wrote:
> Mark,
>=20
> I wonder if you are going to take this patch.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--lBnNT+4yy4PYvQEb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSe1oACgkQJNaLcl1U
h9CRVwf+J9kZp0ZGivYa2xRG/gV/6+6GHD70rFDgUlJM6lyD5Sr264ngHIIHZt27
YTxbrddXS+2NIcXwPl9j4eedxLJAXhjpoXMmRl2GyESUp1RS9GJpe4c8HfY4fkRn
TO7sDDFXMnFzXfI16ITdJFcrH8RXhPYkh1rYqLXkVwSYwImRLe4nbPsvmSQkG9a4
0x9yMs3yEAC6jCN0HF90Zq973JpS0yopSjEHwMCgmWo0oop4myuowyxhdE+fGP+g
kBs9soUAjBx8kAPvfXQoDJ5eszn+jX6uYuwb0OPzmo1TxM4JyzEFb4mgdR0yIaoC
Gp7eTnQ86sEao0Ju9pY+yfmZp9fz1w==
=wKTe
-----END PGP SIGNATURE-----

--lBnNT+4yy4PYvQEb--

--===============1631198378484830166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1631198378484830166==--
