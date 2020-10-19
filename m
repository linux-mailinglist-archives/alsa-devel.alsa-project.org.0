Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DBD292414
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Oct 2020 10:58:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D07916AB;
	Mon, 19 Oct 2020 10:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D07916AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603097922;
	bh=dbXPhf6D9YBCsQEA1lOPXVP5qhrrI0CBgP3BP9BoDp0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=crW2AYQt84HtAsYqbzf9Uwm3KxTYxDlifzeYc1WwwkbGLvJE18aU7v9Q7LVfYAWaC
	 PCGFIWl0j61NhoVblL+dmbEL/gQgyVp9cR3yt+Hv1iio5Q/2mCG6F3pbU7QazXlwhZ
	 VosND7ZeDobkhZcjVbXdqNLohH4GG5rtz0wOHvI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5505F800AD;
	Mon, 19 Oct 2020 10:57:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E612AF80247; Mon, 19 Oct 2020 10:56:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9271CF80121
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 10:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9271CF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="t9CcQOM4"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="jCTTN2sB"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3EACB5C00BD;
 Mon, 19 Oct 2020 04:56:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 19 Oct 2020 04:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=dbXPhf6D9YBCsQEA1lOPXVP5qhr
 rI0CBgP3BP9BoDp0=; b=t9CcQOM4ZCqacWFp7SnhhO5eWqcwb0CtXrs8P4SCJEn
 UxFYqT+7MhQcQIkhUGkI87cEXO8q86H4vQ60Qr8EJWusx9qJGkUaBT1k+Ryhjr//
 VDsYwGrkoP2EY1eOFvOh2aYSck7YxA/emlvtIUFpLNQ3VxLFWXRXre2hf0w02nzH
 gSywlR5ZDQFlos+ebfeASzjHE51P87TBoBzVakxjdDv9Ue2oMD8TbKwCWiDWKN4+
 gbjHFcLiSeaTxkZuKBvvt7G37X17exRR6WgargAjUWg5nz+8/H54huCnlc/DQh7I
 4ErbHNEW0Bxj94vuQeEJ3xlOrO5cNOTp/lUAmBVhIqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dbXPhf
 6D9YBCsQEA1lOPXVP5qhrrI0CBgP3BP9BoDp0=; b=jCTTN2sBiE8CclsQoBIvSv
 s433uUth8sHIHG+xpX2Gq+CbA94PQt55SctxTTQ4V/XDlZSac9kcnFftjsonZKsF
 q/MGKM2gSuKUe32U3ZyGu8tx7GF7+fdCiSQB4qBMvp6Ve2R3Ye5CWeiYZhCi5r66
 ar/K16Tp46FFgLxRwKmH1UF8qpOd/p03AeUmIJ4loYHougNh7GV7SVQjyc3Fefyo
 S7+SxxkU1rsddnAvEzO2Lk3donU/mjNhO+RP1eNx8Gsc6JUsMuYORVeVcCcxqbOc
 vAlT0TFT2i8qpUJVgvn9imum50RnG/3N3JfyitWxSJv/tOlEjn1xa5C+XNtVpwUQ
 ==
X-ME-Sender: <xms:0VSNX4CDj09kpCTY2lQhK1ECqeBPxBHR0eFLQXXBMqKhdPMV0pjYrg>
 <xme:0VSNX6gZNlLgGfmc4Be_JbDJL6XzLUgrmWVAo9UoJUQ5q85ewBveqbI1Muc3JGQtP
 _XsRlH8mj1oCm8mmyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjedugdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:0VSNX7k0VuqFvtrvDlaTRU_kxQI3KSpfL4V_pehr8WZ52qkExKPEXw>
 <xmx:0VSNX-wUgoeDhvrr62emgZFEhXE54n4wZ_UWe12jVAydo5u8hxMW7A>
 <xmx:0VSNX9S0Ar86_TocqgzQl9u8UXiN19BWVudKTpLaGmS_06QI3daepg>
 <xmx:01SNX-Rded7JWGmOagi_KAkfaypveCFgHoktLq_xbRXJKdJZQsYg9A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 88E613280060;
 Mon, 19 Oct 2020 04:56:49 -0400 (EDT)
Date: Mon, 19 Oct 2020 10:56:48 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 15/17] ASoC: sun8i-codec: Generalize AIF clock control
Message-ID: <20201019085648.hju7xyqky3vdzqna@gilmour.lan>
References: <20201014061941.4306-1-samuel@sholland.org>
 <20201014061941.4306-16-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="72zig4tnx5pbsnz3"
Content-Disposition: inline
In-Reply-To: <20201014061941.4306-16-samuel@sholland.org>
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


--72zig4tnx5pbsnz3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 01:19:39AM -0500, Samuel Holland wrote:
> The AIF clock control register has the same layout for all three AIFs.
> The only difference between them is that AIF3 is missing some fields. We
> can reuse the same register field definitions for all three registers,
> and use the DAI ID to select the correct register address.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--72zig4tnx5pbsnz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX41U0AAKCRDj7w1vZxhR
xWNpAP9ceuFMkQ+PyI9ZceRsiV206vMG/ImuZF8HRn78z7d5CgD+KE73Xpl87Tgx
nH8iJnTnRVlcV9EfITGlav5daBtjagk=
=gjlX
-----END PGP SIGNATURE-----

--72zig4tnx5pbsnz3--
