Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 991247AAD4
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 16:21:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CD8117C6;
	Tue, 30 Jul 2019 16:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CD8117C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564496509;
	bh=8SrmSe0gIohhKBAc9ELb7uUTS3XS3UlLozWZmJqXlTg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bo2+DmGypCEN5afbySbgtYHXUwSJ0zIzG0lipmCym1ijV9ApArWG8hIwrxkZq/G9c
	 ntr2sPnsZZy3tzq6kkDuOzmqk1tPc68aphSlO2DiAKolZ1rUgOyVCinCLlz5q5DzOe
	 yEq+QpU3BdifSwhnXMsaQ+Gxn9xAIczdfYYDhFgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41D40F80507;
	Tue, 30 Jul 2019 16:20:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D2DFF80508; Tue, 30 Jul 2019 16:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0ABE1F804CB
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 16:20:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ABE1F804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="t+j4Mj8F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8TKN5XccligETEieRmOY0uvOdDLyhkX/2OICv01x9vo=; b=t+j4Mj8FJicNpWJRqkQkRP2OJ
 Ugo7DZR2UEIA6W2yWIXmoySwvR+koae/Ch3yKZ00Ho0jmZqpVZbqv2BYyhhjO2mWBWi6QJxhNe/nl
 LNhhqycGI5O1NQ08xJG1O8whrq8WpRed0mg/AAmoNQ0fXHPYHqDBnYWjvzm524d7mNoTU=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsSz5-0007jD-Jf; Tue, 30 Jul 2019 14:20:11 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A007D2742CB5; Tue, 30 Jul 2019 15:20:10 +0100 (BST)
Date: Tue, 30 Jul 2019 15:20:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <20190730142010.GG4264@sirena.org.uk>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-4-thomas.preston@codethink.co.uk>
 <20190730124158.GH54126@ediswmail.ad.cirrus.com>
 <e7a879d3-36c2-2df8-97c0-3c4bbd2e7ea2@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <e7a879d3-36c2-2df8-97c0-3c4bbd2e7ea2@codethink.co.uk>
X-Cookie: Times approximate.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Annaliese McDermond <nh6z@nh6z.net>,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH v2 3/3] ASoC: TDA7802: Add turn-on
 diagnostic routine
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
Content-Type: multipart/mixed; boundary="===============0993005786645061901=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0993005786645061901==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8S1fMsFYqgBC+BN/"
Content-Disposition: inline


--8S1fMsFYqgBC+BN/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2019 at 03:04:19PM +0100, Thomas Preston wrote:
> On 30/07/2019 13:41, Charles Keepax wrote:

> > This could probably be removed using regmap_multi_reg_write.

> The problem is that I want to retain the state of the other bits in those
> registers. Maybe I should make a copy of the backed up state, set the bits
> I want to off-device, then either:

> 1. Write the changes with regmap_multi_reg_write
> 2. Write all six regs again (if my device doesn't support the multi_reg)

Or make this a regmap function, there's nothing device specific about
it.

--8S1fMsFYqgBC+BN/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1AUhkACgkQJNaLcl1U
h9BETgf7BOzHBpbnhWhg2mabB09TWYhaMWdG7DZWPeU+jTPkgFJuIroIGpBf3h/c
WIE9G2Zy55KDP7yf1wM1Ad7N18JCMzX+enceVyJ4ZlHhpA3wLhTleyaIdn6JGSHB
++DqO5maWG0iL698Um5bPFI6lvOF9Ewd1KanKCW0hEH93m5C9D5jY4sqItVgEPb1
9vwdUdMo/MqfcwpS3rzXUC98OXCrnC8o0pPDFZT4U5i7X9gNqSSbKIhnBqmCOY+d
P6aoGUTv9ZwcZSj1cU1Ty5NKiKAu7asJyWzBvZFc6T9NcAbX3ascLBMWgP5BxYPG
LuOQqsFxOiOi3H8N4WlvJk3bvvY1mQ==
=0sPL
-----END PGP SIGNATURE-----

--8S1fMsFYqgBC+BN/--

--===============0993005786645061901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0993005786645061901==--
