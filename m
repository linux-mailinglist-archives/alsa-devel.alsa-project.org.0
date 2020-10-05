Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C15E283502
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 13:32:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18B6017F0;
	Mon,  5 Oct 2020 13:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18B6017F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601897572;
	bh=0w88DBGKAhgLFUf7eu3Tu2FkzP257wGCxMP8hGv9EwQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n4W3sSKllgcrqIJsHkOHRV4WEoFrkPtcs1w5Be+1SDrO2finX4B2AlwNKc1E5hs3y
	 q40FBpvNmpTTREmgSQXUkl2Z35dVdE8npQMxFnHHOAN39YkxSaNAJfw50UCAYbSQX1
	 AeHIJLwPU80DiPoMpWQlivRZM2hPVCWWGyBE32oc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F075FF802DD;
	Mon,  5 Oct 2020 13:30:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9135F802DC; Mon,  5 Oct 2020 13:30:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B05BF800C9
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 13:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B05BF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="UVNK0mlY"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="dJfWV7IL"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A329C5C0161;
 Mon,  5 Oct 2020 07:30:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 07:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=0w88DBGKAhgLFUf7eu3Tu2FkzP2
 57wGCxMP8hGv9EwQ=; b=UVNK0mlYtiN8t95SYZUsnyteeOVjOpYz7SMPpY1AQ2W
 lRKuD73AKAbmxpKD4FdVO8S7AthaIdQ2IL58jE00bhDg+T1llnbi66sB1lq+Q27R
 53y0EiuxjERMbcGSUlMbc8RHcgWbmywVuCpog0vqE39X4H+RwlJ9EZhTwvWg1Qvc
 E3StfSOEfLXYjKiATmD882UmiLCE0j2e56H6IFdMqH4WDXuKypLurjGU6Gkvp2ET
 yh0dI8X8YSo36RrIUsjVhhAW6uK/X+RLbdPI1C7poRcd0QhpaANtsE5l0I0O11Eg
 z8vbgPsfaoRgZX+yLglpP5zwIvnuSCnj0Pgv3x6Cmzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0w88DB
 GKAhgLFUf7eu3Tu2FkzP257wGCxMP8hGv9EwQ=; b=dJfWV7ILT/7BqLfAADzBIP
 Jnox/SHJwZP9IZew1IyTdtbfk4JuUA4zViqYzRdpAQWtJ6NVirksLCIF0aMhG12g
 pFeihPXEdDzco9KQzAnHK9Qd4WkxxgGiP8mZb4SSO6Ue8b/B+tU3yyygnbR9mgKd
 35kGr9ieEjsAXNtlasvJVP6uVg9V/aOKumiELxCKL2pQwTKaGtEidivBgqOiyEE3
 Y/kFT3E4Pgob0wBhpRc0furLv9XPQjmdef8nVosg/NospNvAGmvRgcFiMI3+LrFw
 1OO8NvaMPajzgEqw0AAfBmDMMVdXUIZ2gUQVcHB9rE8W9nlSou1rY1zDCI7W8x7g
 ==
X-ME-Sender: <xms:4wN7XwuMBG86z9VNIngA4TKtw0kgMMGqeM2w0xtHT5CAaJBFUtrOkg>
 <xme:4wN7X9ee20ZTkA6ebJsarord9ZTah2bwrR7aAMmnakB6W1zyBpGYa_0oFqirOFyL_
 05OnCbcBmZr2AYcNs0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4wN7X7wjzFNYkcVtJmaZi2dDMSjUxQ6SOqNjBoJTxpjKwdpubpiOuA>
 <xmx:4wN7XzOLOVTeoFGMXukW4CzEkH-sWWdF4LA4qMyu1HN__kS52B7lKg>
 <xmx:4wN7Xw_b11g1FZQbXoALGZJYHPFoJhmmd4X_0krnaImnAFDu43vlFw>
 <xmx:4wN7X9OM1kAu1GBtoNYuimA1JQX710hjdNqL7aZiRFwc_SVQ7m93sg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1F5353064680;
 Mon,  5 Oct 2020 07:30:43 -0400 (EDT)
Date: Mon, 5 Oct 2020 13:30:42 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 12/25] ASoC: sun8i-codec: Program the correct word size
Message-ID: <20201005113042.whe7rbwbn577mjp5@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-13-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mcqs7d2akjb4wh2q"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-13-samuel@sholland.org>
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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


--mcqs7d2akjb4wh2q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 09:11:35PM -0500, Samuel Holland wrote:
> The hardware supports 8 to 24-bit word sizes on all three of its DAIs,
> only one of which is connected to the CPU DAI. Program the word size
> based on the actual selected format, instead of relying on limitations
> in another driver (which, incedentally, has patches pending to remove
> that limitation).
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--mcqs7d2akjb4wh2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3sD4gAKCRDj7w1vZxhR
xVb5AP9WzBxZUrtowllJ0MIvYjPWOg2h5mKh/KXskSb4AcQOFwEAtiPmv0wor2UW
3m/4VT/7vIAc7wlp5VO6G+LxXSuzlAA=
=+rHz
-----END PGP SIGNATURE-----

--mcqs7d2akjb4wh2q--
