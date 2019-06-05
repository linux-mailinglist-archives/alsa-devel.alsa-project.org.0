Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3067235A42
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2019 12:10:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2CE3167E;
	Wed,  5 Jun 2019 12:09:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2CE3167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559729437;
	bh=ruZ37PT2dCMzKN6UNmfY/AGdh0TWzhK8oeqpDt1iA14=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=moqvEEZyU8pvSp3HMTRfocFD5fesLsbCjudGM9BExNwmys5/CW5JvuoCobZ0C8BgW
	 T1+D5NU2yISgM4mz3ViU6yndy2c7GfZrskCbe0str5WnUINhSC74yXPwYQLr+mmg6m
	 1P8XvB5kLVwgAhrcizeUNPiFthfqD2AU2y/t+oSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26593F8971F;
	Wed,  5 Jun 2019 12:08:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAA20F896EE; Wed,  5 Jun 2019 12:08:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69347F896CE
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 12:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69347F896CE
X-Originating-IP: 90.88.144.139
Received: from localhost (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr
 [90.88.144.139]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 74011240005;
 Wed,  5 Jun 2019 10:08:45 +0000 (UTC)
Date: Wed, 5 Jun 2019 12:08:44 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190605100844.kzaw7r3zasfqhnuu@flea>
References: <20190604085449.13195-1-maxime.ripard@bootlin.com>
 <20190604144517.GF2456@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20190604144517.GF2456@sirena.org.uk>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] ASoC: sun4i-i2s: Change SR and WSS
	computation
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
Content-Type: multipart/mixed; boundary="===============6233201580420330762=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6233201580420330762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qhomvzhpyiavwpcf"
Content-Disposition: inline


--qhomvzhpyiavwpcf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 04, 2019 at 03:45:17PM +0100, Mark Brown wrote:
> On Tue, Jun 04, 2019 at 10:54:49AM +0200, Maxime Ripard wrote:
> > The current computation for the SR (sample resolution) and the WSS (word
> > slot size) register parameters is based on a switch returning the match=
ing
> > parameters for a given params width.
>
> This doesn't build for me with current code:
>
>   CC      sound/soc/sunxi/sun4i-i2s.o
> sound/soc/sunxi/sun4i-i2s.c:169:28: warning: =E2=80=98struct sun4i_i2s=E2=
=80=99 declared inside parameter list will not be visible outside of this d=
efinition or declaration
>   s8 (*get_sr)(const struct sun4i_i2s *, int);
>                             ^~~~~~~~~
> sound/soc/sunxi/sun4i-i2s.c:170:29: warning: =E2=80=98struct sun4i_i2s=E2=
=80=99 declared inside parameter list will not be visible outside of this d=
efinition or declaration
>   s8 (*get_wss)(const struct sun4i_i2s *, int);
>                              ^~~~~~~~~
>
> and lots of similar stuff.

Sigh, so much for sending a patch part of a branch...

Sorry for wasting your time on this, I've sent a v2 with this fixed.

Maxime


--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--qhomvzhpyiavwpcf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXPeUrAAKCRDj7w1vZxhR
xScXAPwN8ypur7UlU8bNKMKWbFc0f1dSEHVT5ZDOnsRZQKzswwEAi27OmMmw2FeN
7aj+QHjqrk9psWgk+O/LHTS3NFkUcAM=
=vzYH
-----END PGP SIGNATURE-----

--qhomvzhpyiavwpcf--

--===============6233201580420330762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6233201580420330762==--
