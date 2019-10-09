Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 501C1D1101
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 16:17:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E17391661;
	Wed,  9 Oct 2019 16:16:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E17391661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570630636;
	bh=aY1kzboVe78xPXhjcmRhBdopKPNuo2SGQ3kqbDmuG+Q=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nUrDq4tctFPJH1B/rSsfIWbsiBJB5BgIaHWwOTrQshBr363GjTo44AKKmaj4OcA5H
	 WRec1cAi5tW5i6PliIBEwL5BpcwIN6AHNtIohx9V4Tjt1vz1HRJQXRmO8WLpk/EoWw
	 7Mde5bYc1+jZUZFOoYT0bKTt+EjV/IsXNK1z6XXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 123B5F802FB;
	Wed,  9 Oct 2019 16:15:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4E60F802BE; Wed,  9 Oct 2019 16:15:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0886F800AE
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 16:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0886F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cVvyCmy+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=POxETTBPmCjnYU0uMGoBV2RzCASmpLWvSLKtWWIJZwk=; b=cVvyCmy+tEAk+rcYenhPDEhdU
 TP4QTzDW5yls+FqwUrta/d0bE/AsGBuRSMeVUGfxtlhT75zq+4Yau6o36i3YvTqBuXVozNLMpse9z
 iMkMEtGbjZKwGzb2BCoC3YUmwD5iJsfPL5lRL3tD3mKzQTqJyISuq0r9CtnaItxDpGR9k=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iICkM-0004x2-TE; Wed, 09 Oct 2019 14:15:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 67E6B2741DF9; Wed,  9 Oct 2019 15:15:22 +0100 (BST)
Date: Wed, 9 Oct 2019 15:15:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Message-ID: <20191009141522.GD3929@sirena.co.uk>
References: <c0b01f37cdc241a596b12942c8c5172f@realtek.com>
MIME-Version: 1.0
In-Reply-To: <c0b01f37cdc241a596b12942c8c5172f@realtek.com>
X-Cookie: Every path has its puddle.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH RESEND] ASoC: rt1011: set tx/rx slots from
 tx/rx_mask in TDM case
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
Content-Type: multipart/mixed; boundary="===============5948272256627224798=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5948272256627224798==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IDYEmSnFhs3mNXr+"
Content-Disposition: inline


--IDYEmSnFhs3mNXr+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2019 at 09:32:05AM +0000, Shuming [=E8=8C=83=E6=9B=B8=E9=8A=
=98] wrote:

> +		if (first_bit =3D=3D 0 || first_bit =3D=3D 2 ||
> +			first_bit =3D=3D 4 || first_bit =3D=3D 6) {


> +		} else {
> +		}

This would be more idiomatically written as a switch statement, as would
the equivalent stuff on the TX side.

--IDYEmSnFhs3mNXr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2d63kACgkQJNaLcl1U
h9CdUwf/ZlJrXiP9kQBlJRSWU0taqVFsGDEHukkbW2JnmRPWzLfXDjznn19A2qiw
J1KrVFrk2KzftEQqUuhChKkW8wGiSgMUj3oam3aQxn2xVgQ7Oa9/simpt7yJzymJ
PfGowaeit1xzXY/g0/28rcbkgrpy3YPwCYmfTMw2uDt2WSuFwIXw8biAJ8j+p/ec
n4Ny7cQz2Gt/ApL8z7adu+NeEIC4bY8HDNPHO7d+zE+TDitRtwP/nmVzt9V49u8j
L1Y4Bw/zyz0LlTZo4fdFo7SKLlRgRer2a1y25MMaj46gbmZmJuGiMUulxplQ5ig0
TUQAtOoaaD8brvfcV9k5psitdSGHFQ==
=1q/q
-----END PGP SIGNATURE-----

--IDYEmSnFhs3mNXr+--

--===============5948272256627224798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5948272256627224798==--
