Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9CB11545
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 10:22:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0C0E1798;
	Thu,  2 May 2019 10:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0C0E1798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556785374;
	bh=x34uJaHzgW/egMywGWxEA9pYFQHDqsudYnkfa3ndcDk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oYvDjzRl8z1n4ecr63vRw5IkkIzUB3eWsHEFRpBr1QTB2p+YUEW/8lTBcnlD/M1g3
	 fPLyQz1vz7hambdvuJIV4U1AloKJM8NkSppYIUtyhjocPC+/UXvMtnXc6Q/qXinw4U
	 TsxovMJlB0MrVOebz76S6NR+XOkDMflgcMZ+MxDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97E83F896AA;
	Thu,  2 May 2019 10:21:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE7A8F896C7; Thu,  2 May 2019 10:21:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7EEDF8075A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 10:21:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7EEDF8075A
X-Originating-IP: 90.88.149.145
Received: from localhost (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CFEBE2000F;
 Thu,  2 May 2019 08:20:59 +0000 (UTC)
Date: Thu, 2 May 2019 10:20:59 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Message-ID: <20190502082059.sbiw7vl3bvf3xvr6@flea>
References: <20190419191730.9437-1-peron.clem@gmail.com>
 <20190419191730.9437-2-peron.clem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190419191730.9437-2-peron.clem@gmail.com>
User-Agent: NeoMutt/20180716
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v2 1/5] dt-bindings: sound: sun4i-spdif:
 Add Allwinner H6 compatible
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
Content-Type: multipart/mixed; boundary="===============6189388091915516920=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6189388091915516920==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="btd22iz6kqkiqcoh"
Content-Disposition: inline


--btd22iz6kqkiqcoh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2019 at 09:17:26PM +0200, Cl=E9ment P=E9ron wrote:
> Allwinner H6 has a SPDIF controller with an increase of the fifo
> size and a sligher difference in memory mapping compare which
> make it not compatible with the previous generation H3/A64.
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--btd22iz6kqkiqcoh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXMqoawAKCRDj7w1vZxhR
xcVsAQCt3jq7c3aizsX9xzRHvkmOdi3AtdWVtL94AlsRVGoqcQEAi55aqZK17qkg
nWGnMmiLHXpuFjy2/+lwez2xEcVcQAU=
=Dtk+
-----END PGP SIGNATURE-----

--btd22iz6kqkiqcoh--

--===============6189388091915516920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6189388091915516920==--
