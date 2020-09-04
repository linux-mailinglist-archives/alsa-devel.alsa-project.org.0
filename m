Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1B925D486
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 11:19:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9040316EC;
	Fri,  4 Sep 2020 11:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9040316EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599211170;
	bh=nXtW0JM/wQOy2uCuK/dLlEM2S2hS3nRUa7pxa/yayMM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LPdlzFsbUeCr/HvgnYurlcYxzydJL4LRck0D03h0S+Gi6o+ImU7n2P14ZdT1F0eRJ
	 ig4hvn6kuWA9psZ8hmYfqYMqfkJ1SptrAEfvS2ShWv1PEmyhu5CG5wXDoFpSu9wiyb
	 nnl23b4BgcLfo+GRhxe/EoMUb5woBvgaa94E7QLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD8F7F80257;
	Fri,  4 Sep 2020 11:17:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B13FDF8024A; Fri,  4 Sep 2020 11:17:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80CEAF800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 11:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80CEAF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="FH98ECTw"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="rLUXQXeT"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E88665C00DE;
 Fri,  4 Sep 2020 05:17:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 04 Sep 2020 05:17:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=nXtW0JM/wQOy2uCuK/dLlEM2S2h
 S3nRUa7pxa/yayMM=; b=FH98ECTwp+ZqR17ouKPYsTMtCsO2SLRcmc6SgyiY2xy
 LlTj2b2lB5DzyLFXO6ojaooTN34kqtPfb69M8qvWm6pAinhm9vPN2hrMGEb3Agpi
 ar7/6KLeo9+zhZSImuVDybYxx5gM1z9Q8LsEf+6ANR+QG+IYHSoDlvvNX6Eu6YLT
 cb6T/tw1SkIdjPnWeLYutm77sIDnTeConEeG+p0qquZYehbSkd3ffsktHJm10wS7
 bkK31fE4nQyEYCYAR1V2dz4xv2RnHBW26bJFHdCqsw/YCYPnQ/fVjBjelwjoYArM
 /+iZI0AKPebf1kJJqR44svnLwMGc0nSsX9qhXcTPIXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nXtW0J
 M/wQOy2uCuK/dLlEM2S2hS3nRUa7pxa/yayMM=; b=rLUXQXeTj2tPZC28kPtwXx
 Pd3hXhLPAp3ArNXS5yxVtlC9An/rU54kGNWIzlxxSmP7WYtrOjPGGZMDSxBablWE
 GT1sPsCN/MfjenTjt4ulvAH5Tb1zX4hx83/5dm4TQiVOBwAyb2GtkTqnLwny/zpL
 ZnTLA1gxMlXdj4KBibufkYBao2xvBj5sm9vuzi7R/y9lTlBdh/XjTAih931mvsGt
 7Mn4dV8VdZsF5Zik+H7FX6lnXCAFgvjHuWF5XNRtQnGeJywcJ810AzuPVnVRCrRI
 kwatKMo3jc49WKkv9jCphDtOmi2DRkt8Pwl6h/SRCvNcnbAQCo2w9Bixr/dv9CEA
 ==
X-ME-Sender: <xms:MAZSX3nW7hAQSJOgWdc6UUqm6bRrKZpOOmnK4vqhv6F7vlJflMYjXw>
 <xme:MAZSX60j5LfGUuJ-TbfkjE_krS8R9gCo7ppZSGCmVt62fISjRk9geYCFoks4hiOMX
 M_y-N45UBc3t9zXf7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudegfedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MAZSX9r2DCVLoZfolNAbfSxqE-lIH-owYcGhbzbYe3IFUC4a1Y0QLA>
 <xmx:MAZSX_liKE4ZQjh9e4vB_gbggfTsLmvY3tOgv2oX-lxyAzFzQ7_hTg>
 <xmx:MAZSX12e7feZfJiEWd05hIki6UFlJp0Ym82jGwMrq_h5NSkjCBKOhA>
 <xmx:MQZSXynzAXYqlbeDnsXEIapb_-IZRtWVyBn_Ko67jCBRWh3ol_Hgww>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0A09B3280059;
 Fri,  4 Sep 2020 05:17:35 -0400 (EDT)
Date: Fri, 4 Sep 2020 11:17:35 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 8/9] ASoC: sun8i-codec: Attach the bus clock to the regmap
Message-ID: <20200904091735.vnb4u6l4t2iipe4t@gilmour.lan>
References: <20200831034852.18841-1-samuel@sholland.org>
 <20200831034852.18841-9-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kyjiehp5lg45epo2"
Content-Disposition: inline
In-Reply-To: <20200831034852.18841-9-samuel@sholland.org>
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


--kyjiehp5lg45epo2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2020 at 10:48:51PM -0500, Samuel Holland wrote:
> When attached to the regmap, the bus clock is automatically enabled as
> needed to access device registers. This avoids needing code to manage it
> separately in the driver.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--kyjiehp5lg45epo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1IGLwAKCRDj7w1vZxhR
xR3aAP9tr4i8/MgEGjzLOk1dppyp12G0jxAn27lU5ULr6DWEqwEAzhscJnmVVjny
GVBualf1cUKONE+QN1x9iktXD5HsGA0=
=1Dov
-----END PGP SIGNATURE-----

--kyjiehp5lg45epo2--
