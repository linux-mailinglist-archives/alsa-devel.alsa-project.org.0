Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDC925CBA4
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:59:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95B2A1AB9;
	Thu,  3 Sep 2020 22:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95B2A1AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599166774;
	bh=7xx2c+sURY2BGLNN4PINqRBclr9XFzFHQ6iOqlHyL/E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p7vXem0iPqFb3N5aQuDQeXCKyroWzQEAWvdfp0nKdyblHFYWbIFHbeHRhcK36nqwC
	 SgQ4uXn+1VrJF/vDr9lrwKuPNTkL85zckHINe9o3JN80zPswbNZP3Kl/aKnbF2A8gF
	 z5zqzND4bjZYxhunQwNnduBgsB2UeWCAMkkG/Tjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6449F8020D;
	Thu,  3 Sep 2020 22:57:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC1CCF80217; Thu,  3 Sep 2020 22:57:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98271F801DA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98271F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="Aa5DMMRr"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="b2QNltio"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A9C25EBC;
 Thu,  3 Sep 2020 16:57:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 16:57:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=7xx2c+sURY2BGLNN4PINqRBclr9
 XFzFHQ6iOqlHyL/E=; b=Aa5DMMRrbjGVB7O78paeHjAcMcuE3VSjemEERDLYO8m
 6um7dmOKlNqWoVzfXLgP6aRQ/nL26kK7PtNYQ4Xy6zoqDcvRYaCEdGwcgmw9dPLr
 VTgWwg7kgbtP3oel2lU1s6uqH5K2xoQ/n2cURuHL6rS3o/XO+ZpMpIE7bN6GZbMn
 MVhN1k+xThBbA5GD1VGI63Eu/ayGD9IKjjDxSLM3KnumRWovxtYkwcieHksCy/Oe
 ws9C8/Z8VTMwOol64EmSUDN0QB3uhPmdiV7QQIwDVyFhkOwBf+FxghY0TqNV02LI
 01gF4juWRM03K7r080Wq3Bv11OzvbRbjSq9hBHBvNpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7xx2c+
 sURY2BGLNN4PINqRBclr9XFzFHQ6iOqlHyL/E=; b=b2QNltio4/RPP3JKHAkMrp
 wrIS3Qp35QbrpaCiS38VD+1OBiCZX0CSgDuNMfWn1hvvbbRaxRFjx5vNYnbSv6HJ
 xj4/fxOywREePlYj/T9uVOAzM4+1Cwk2M1eQymJnWr36w0jGbeZ699sHKQ8Ngfb7
 +ZEZt1lnDWrtZJgiRGUF7tcdhzoe2naW3Svrt46kriNPZQCqZqprzVtu5MXhwaUy
 sUlbQhFjdLZ/2orkAj7nKKltSmJl9jaw+xbPFOdJtiKFWD2YRwTOgqeUYI20ZC12
 +298NjS4IxOgDDyGYxKjjNE+SwjxkLBnc8Zc5CmMffD8RIm9DH60JH1dskx+MvpQ
 ==
X-ME-Sender: <xms:xVhRXxjCm6r1tCIN1HtYKG7k_qtkIKI9k7rpAusVr8OMvSWLKv4nMA>
 <xme:xVhRX2BQyZqqFejYyfukF74HDH8WqayTVExiXIrDPHOaRVSOOVoVj_xc4n3kRgaL-
 PSk2E8iFB7aMeb5l-0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeguddgudehjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdej
 vdfgveenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:xVhRXxHRzRXNCI0aMtcKIBktnk3ChjEHqZIwJlfJkx3RiAD-y-uzmg>
 <xmx:xVhRX2S2BvHIgUnn9IpWfTupyg_A__TT3BnBsP3wVXa76k6X0KLD5Q>
 <xmx:xVhRX-xELcAVnIE3LwDwq9nyaibYrlrJvIvNeaMjZBRnAgXSAk4dUg>
 <xmx:x1hRXzrqXnGkVGSfM5_915DTstig_aeLw-XMgvLtvSbJAxdmpC8QArpXB-s>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A19873280063;
 Thu,  3 Sep 2020 16:57:41 -0400 (EDT)
Date: Thu, 3 Sep 2020 22:57:39 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v2 01/20] Revert "ASoC: sun4i-i2s: Fix the LRCK polarity"
Message-ID: <20200903205739.43dnsu7du6m44u5c@gilmour.lan>
References: <20200903203034.1057334-1-peron.clem@gmail.com>
 <20200903203034.1057334-2-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="p6v5j2ugxblige7u"
Content-Disposition: inline
In-Reply-To: <20200903203034.1057334-2-peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-sunxi@googlegroups.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--p6v5j2ugxblige7u
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Sep 03, 2020 at 10:30:15PM +0200, Cl=E9ment P=E9ron wrote:
> This reverts commit dd657eae8164f7e4bafe8b875031a7c6c50646a9.
>=20
> There was a misinterpretation of the analysis using a scope.
> After rechecking this using a logical analyzer the LRCK polarity is
> fine.

Yes, it's fine indeed, so there's no need to change anything?

Maxime

--p6v5j2ugxblige7u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1FYwwAKCRDj7w1vZxhR
xbBKAQCBV+rE9UZoCrdpdAa3jQ9KOPalRBYJ5WnRoj1MUDwpXwEAi95nCcuHlPwE
O/UMdDgPQbAc4AnYf7asF/A+X7ZbSg4=
=kbla
-----END PGP SIGNATURE-----

--p6v5j2ugxblige7u--
