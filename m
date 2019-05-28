Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B074C2C2DE
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 11:14:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A00E17DC;
	Tue, 28 May 2019 11:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A00E17DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559034899;
	bh=9vZ7kqNah+iW1KcombkR9gbyT/JfBF6LlqaudZDvGGE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p3tumsZ0c6nrMdd+yyIKhMc8pMDeJBtLCzD8C4+fvxEhX3qv34Dt/05F3Exdr4NNF
	 3UKyIWnJv9gNFf3gJdDpIKI49HXsf/ZSuGpc//eV3RZZ0a/2za7KtFMC/YCKlJ1jEi
	 8CvOz2KbX2WPV5bQHhTxeQUiy0ireJ9ksPFup86U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79E4CF8970A;
	Tue, 28 May 2019 11:13:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0636AF89706; Tue, 28 May 2019 11:13:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C037EF8072E
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 11:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C037EF8072E
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 75A91FF808;
 Tue, 28 May 2019 09:13:00 +0000 (UTC)
Date: Tue, 28 May 2019 11:12:59 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Message-ID: <20190528091259.qrzegazyilviuy2n@flea>
References: <20190527200627.8635-1-peron.clem@gmail.com>
 <20190527200627.8635-4-peron.clem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190527200627.8635-4-peron.clem@gmail.com>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v4 3/7] ASoC: sun4i-spdif: Add TX fifo bit
	flush quirks
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
Content-Type: multipart/mixed; boundary="===============3138163631505705030=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3138163631505705030==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zi3crwvz5dqqoqhp"
Content-Disposition: inline


--zi3crwvz5dqqoqhp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2019 at 10:06:23PM +0200, Cl=E9ment P=E9ron wrote:
> Allwinner H6 has a different bit to flush the TX FIFO.
>
> Add a quirks to prepare introduction of H6 SoC.
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--zi3crwvz5dqqoqhp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOz7mwAKCRDj7w1vZxhR
xYHnAQCF0T/LyvPDLxyjIVgapteJRIIteH2cyprro9XfsXCZKAEA/Jy3TK1gXH37
KQ0w0ZON8xPR32fd/FxWTsrhVYDGswU=
=xOqB
-----END PGP SIGNATURE-----

--zi3crwvz5dqqoqhp--

--===============3138163631505705030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3138163631505705030==--
