Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0EC16156F
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 16:03:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 111D7166E;
	Mon, 17 Feb 2020 16:03:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 111D7166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581951838;
	bh=VbUGRdIEz01tr2nLG+O9iQrLC2aN3QaX7pOIx0yMHuk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aLZ/AfLsBcGGe2wh8SlT5hTQsGErfP8cjLFLWBQFkhC3DQqmNqMhtcqAExhEkbZ6E
	 vBA7LZd1Sb9B4B/5Xxt60qa0ZAvWwHinBT0ecG5wv7Rv4MGMq9cbj9dzf5c5VfL+tr
	 NFliiEfpYu4wZP72UeArxOkDX072uIlHJeGoRGNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F45DF80096;
	Mon, 17 Feb 2020 16:02:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3130F80172; Mon, 17 Feb 2020 16:02:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 86E84F80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 16:02:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86E84F80096
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CD3730E;
 Mon, 17 Feb 2020 07:02:10 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FF8C3F703;
 Mon, 17 Feb 2020 07:02:09 -0800 (PST)
Date: Mon, 17 Feb 2020 15:02:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Message-ID: <20200217150208.GG9304@sirena.org.uk>
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-6-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20200217064250.15516-6-samuel@sholland.org>
X-Cookie: There was a phone call for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>,
 stable@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [RFC PATCH 05/34] ASoC: sun8i-codec: Remove
 incorrect SND_SOC_DAIFMT_DSP_B
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
Content-Type: multipart/mixed; boundary="===============4065884639701103138=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4065884639701103138==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xjyYRNSh/RebjC6o"
Content-Disposition: inline


--xjyYRNSh/RebjC6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2020 at 12:42:21AM -0600, Samuel Holland wrote:
> DSP_A and DSP_B are not interchangeable. The timing used by the codec in
> DSP mode is consistent with DSP_A. This is verified with an EG25-G modem
> connected to AIF2, as well as by comparing with the BSP driver.
>=20
> Remove the DSP_B option, as it is not supported by the hardware.
>=20
> Cc: stable@kernel.org
> Fixes: 36c684936fae ("ASoC: Add sun8i digital audio codec")

This can only break things for existing systems using stable, if they
haven't noticed a problem with DSP B they'll certainly notice failing to
set up the DAI at all without it.

--xjyYRNSh/RebjC6o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5Kqu8ACgkQJNaLcl1U
h9BrrQf8Cpji+kb3X7isTpniyau/SbCQwZlUb8Csww/ottxImXAngZtFxVJ223Tb
sRxaUEFcUFbKuAx1BOMaW70RQ6qQskiNlrtvd2GxnKYNpGcSk6TsMHY185iiTu2s
EeozYIThsqRXhDCrv0hRArGLf5kBFM1OaSm9idhJJgfY8gjO+aBsPJqz8mp0gxWN
3jGVVLz7aNTaOxwTl6CcTvMm+7xj4f1tsYTkC7jYTysRVrf6rXkV9KBL7euDjMrg
JTa3RdwK0VAKZus8KiAecYZfI5K+F8Kj8Stk4R9GtMpIbVDR4Sxy5giVnrY+XVoF
hq2TJ94ZfIBzhexsmd+tDPsvUDHHtQ==
=eNti
-----END PGP SIGNATURE-----

--xjyYRNSh/RebjC6o--

--===============4065884639701103138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4065884639701103138==--
