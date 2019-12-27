Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6BC12BBAE
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 23:47:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDFCD175D;
	Fri, 27 Dec 2019 23:46:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDFCD175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577486855;
	bh=WEFGDlGSSfygsOK7qpF/heEbqT5PggWGVlb50+UrdaM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cGmoNrkdOS1Jew3KA6Un0aLPH1CCsxXs5dcsFHVwwCobtDI4Fg5ISdA6hl8v8SevM
	 xMkxVFDFEUvKHH69zfOK79cP2x1nfhpYSy35skW9XamNg/QA8MnbyO1GCzq4gE3M5H
	 aiekTyM+PV8wQuH9SrgeopO6cw2qI2iyjEsTOJBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B14ADF80265;
	Fri, 27 Dec 2019 23:44:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00061F80264; Fri, 27 Dec 2019 23:44:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B58FF800E3
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 23:44:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B58FF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Y4GGwVEe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tzJQU5CSSV92rINpY/mBKDQersZHZBVAVKXDHAdiH5U=; b=Y4GGwVEetsd9jF2EYMdVo/6g2
 tF4pFXNp7fct+mrZxeQYF2J1wA0CIvDnLXzVoYZ12n+BXqkcElhg9w7gMGgtW+2lXUozNLqDoN48U
 NCgA5kSLqNndH+oQWjlb70VizzVSFsMRViiSYtFy2Qx8cF3RSvpPeAn1P1PA4uYnc/fug=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ikyLO-0006aP-Sc; Fri, 27 Dec 2019 22:44:30 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 4557CD01A22; Fri, 27 Dec 2019 22:44:30 +0000 (GMT)
Date: Fri, 27 Dec 2019 22:44:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <20191227224430.GO27497@sirena.org.uk>
References: <20191227174055.4923-1-sashal@kernel.org>
 <20191227174055.4923-6-sashal@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191227174055.4923-6-sashal@kernel.org>
X-Cookie: I have many CHARTS and DIAGRAMS..
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Tzung-Bi Shih <tzungbi@google.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH AUTOSEL 5.4 006/187] ASoC: max98090: exit
 workaround earlier if PLL is locked
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
Content-Type: multipart/mixed; boundary="===============6902368087551506128=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6902368087551506128==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="keoAwTxaagou87Dg"
Content-Disposition: inline


--keoAwTxaagou87Dg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2019 at 12:37:54PM -0500, Sasha Levin wrote:
> From: Tzung-Bi Shih <tzungbi@google.com>
>=20
> [ Upstream commit 6f49919d11690a9b5614445ba30fde18083fdd63 ]
>=20
> According to the datasheet, PLL lock time typically takes 2 msec and
> at most takes 7 msec.

Same here and for the other max98090 patch - once things are
fixed it'll be OK.

--keoAwTxaagou87Dg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4GiU0ACgkQJNaLcl1U
h9BNywf+Mf20LwkW7rRkBz/u2G2iLzxF0Wo4sLcbhkGSwAPl7O28cPQetnnlSd5Y
jpB6WIuBihSRTrI6omXQKXJo7Iq/ROijkzZ96levBTz8gBZNr1qF4lEsDTd91UpA
fxvqXTmY4drZUTHEXg8oY3KhSsmqA5M0PwbgBZnqP2JwS3rxOOfVWe8QGRuy8m3L
G2rwkoSCW07Fv4O6uQRkcZWHPZCP+oZsaOet5JHPR2619m5qQmB1pM4sWoFeiTGS
tNSCYLP0WeFSqgXAS1s37OcFDMmter0Lu4ROAHNo+ezuRj8m7vwoID7iVetqL8u4
FfBUai/6Gp6ISvEUwTbRenV/T4CfZw==
=micy
-----END PGP SIGNATURE-----

--keoAwTxaagou87Dg--

--===============6902368087551506128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6902368087551506128==--
