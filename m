Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9312AB99
	for <lists+alsa-devel@lfdr.de>; Sun, 26 May 2019 20:24:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8D7F176B;
	Sun, 26 May 2019 20:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8D7F176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558895095;
	bh=a4Oo8+efEVVqz4h3h8QABWHfihZ6j4UhX5PvB7xfIbU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WN/gppSZoyDrnbaMhwnDb/X0oktwV3scAmep4K4PQshzrsWEHh1ikuuFehqc/HT5w
	 29MHc7n5cofHPQIhhQW9x+yynqITlgHHEH2eIoFrxE+oagm+ZHsOPhJugrSBmsluqi
	 BRv1MLf0mN2kCVS/W1M2ewQT4zABXYshuk7gc72E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E05D6F89725;
	Sun, 26 May 2019 20:23:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85A65F8971D; Sun, 26 May 2019 20:22:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B62EF8072E
 for <alsa-devel@alsa-project.org>; Sun, 26 May 2019 20:22:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B62EF8072E
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 7CA4DC0003;
 Sun, 26 May 2019 18:22:49 +0000 (UTC)
Date: Sun, 26 May 2019 20:22:49 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Message-ID: <20190526182249.nx7ql7bghzuah7rd@flea>
References: <20190525162323.20216-1-peron.clem@gmail.com>
 <20190525162323.20216-3-peron.clem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190525162323.20216-3-peron.clem@gmail.com>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v3 2/7] ASoC: sun4i-spdif: Move quirks to
	the top
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
Content-Type: multipart/mixed; boundary="===============6750797082093804926=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6750797082093804926==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6o7q3ljfvpuo6cyn"
Content-Disposition: inline


--6o7q3ljfvpuo6cyn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 25, 2019 at 06:23:18PM +0200, Cl=E9ment P=E9ron wrote:
> The quirks are actually defines in the middle of the file with
> short explanation.
>
> Move this at the top and add a section to have coherency with
> sun4i-i2s.
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--6o7q3ljfvpuo6cyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOrZeQAKCRDj7w1vZxhR
xYznAQCG1ejGnz0/Amek60TIzTGn7GCQXJ14lwLZt7fBCIsxdgD9FkDn/kl+sLzC
xhVYYDDY3qXuamvmvEtLHOuGs4SYgQM=
=+pbe
-----END PGP SIGNATURE-----

--6o7q3ljfvpuo6cyn--

--===============6750797082093804926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6750797082093804926==--
