Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DF02923A0
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Oct 2020 10:30:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BFD7172D;
	Mon, 19 Oct 2020 10:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BFD7172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603096201;
	bh=N6bobR5afs/+y/1Qm36eXrl1vLYjqCAzZwFSPIPV5og=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mLgKlSWiWdO8GnzFAJjrLdShZOQ2w/HIxvGKyT7Ot8Rtt1hFR9VDON6IjcqRf6TsI
	 CDWMvNsVGlhgKxvYT5KV3JUobYcJzV87YZmYLWomk6+Cw7QvmIOn0PaUeuBs+5as/X
	 6k4U8p1Mbz+mAoqyh/UcI46RvHyaXelFztfk+f3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43F38F80121;
	Mon, 19 Oct 2020 10:28:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2402DF801D5; Mon, 19 Oct 2020 10:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1185DF8010F
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 10:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1185DF8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="DmkQ7Yiw"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="a773T+Jy"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 2848E5C0130;
 Mon, 19 Oct 2020 04:28:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 19 Oct 2020 04:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=hvPud9xYcTtOWwv0mvRc3kappZB
 DFlvPQqKJCgiHFTo=; b=DmkQ7YiwbycXprZ0Ty4hqHn5N3ZT0u5r2JsS/i03nlT
 JuLhSyEPTBqO5SMgBbMLPCwdeCtwB73YNJaIuQuNQCtxvoAOASnJurs/r09vZAKo
 WkMFL5Gw7Oa3VWjVGUha3Rv0s7XiUb7LNtbKCDcE7fZG8qyYNyII2vRmyQrAl3qX
 6ObMCTgPj/KxhqlOE+yyATKVzCN+iafCJMXN4g4otpTQdBG8F4oXBWwKh5MZkF0s
 VSzT+aToPxOVBqF1o4cXLBqCoGWm8MgDLV5Guw7GaBIUhKtshvQiZR6BmKMK78n1
 NfTs0F6juFu82f/Yb8SB4OpjEtjvLJa/xc23bhaELGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hvPud9
 xYcTtOWwv0mvRc3kappZBDFlvPQqKJCgiHFTo=; b=a773T+JyU+0AYy4E3yIkTy
 AZtkKA/MgksnjHOZaAOlwjffy3hiSbG59ClcCLulSAJQViP43y9wXTiyBkDS5CrE
 otSEkV25kBzvFVJ/kdBzecFFu+4j6wVje+JAJP2PE7ZA+l/u18zE6gP91wGdpW1A
 GxRMtw7GwEFzNa7pqXBT+8PdDCGYJejSKHcY3tx1FEvB2hiFk0LafdS6nX6NCzhh
 x7KUjeL9y9iQ6ShQACTtp4Zp72hmU9UJSWS030K/GeEeJBx1icCyT54AHS6YXikI
 zjNfxmI11OspZk8xinki3gNOoEzTp/zQSs/TxCmA9NreWEkLUe9ENMcNDeUEjZdw
 ==
X-ME-Sender: <xms:GU6NX5u3uYyERTNmuBJDrWoNUOTPJLSalCPBwCCcC0t73S44925A0Q>
 <xme:GU6NXyeL4rpc6FMXG2efDab8acwkR3XVBL5A8BC5-4VKSRvPrBb-GbtCn7amutZ7n
 96GTmvh-2T2csHtQ3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjedugddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GU6NX8yhzizyLmF4Cd-CFNBfWe0EdVmR_lq5o6i1tvrPKyemz-gH7w>
 <xmx:GU6NXwOYSw6O1hQsxrnFVFU7SpWnp1dcZT8gnj4xPgkYwfyxLKrJlA>
 <xmx:GU6NX58vyvmv6K-saDBFIuh4XmDdWrtSa3Zce6D5ncli8GIzvIlR2A>
 <xmx:Gk6NXyMtsdj6_1SbimQnQO2iaiwAvpOi9_OzVj2wZ6Zj1G-5QPyslQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8D2523280069;
 Mon, 19 Oct 2020 04:28:09 -0400 (EDT)
Date: Mon, 19 Oct 2020 10:28:08 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 12/17] ASoC: sun8i-codec: Protect the clock rate while
 streams are open
Message-ID: <20201019082808.rg3xvo3yjg5g4xpa@gilmour.lan>
References: <20201014061941.4306-1-samuel@sholland.org>
 <20201014061941.4306-13-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v4z4ql2j7u3o4bzk"
Content-Disposition: inline
In-Reply-To: <20201014061941.4306-13-samuel@sholland.org>
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


--v4z4ql2j7u3o4bzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 01:19:36AM -0500, Samuel Holland wrote:
> The codec's clock input is shared among all AIFs, and shared with other
> audio-related hardware in the SoC, including I2S and SPDIF controllers.
> To ensure sample rates selected by userspace or by codec2codec DAI links
> are maintained, the clock rate must be protected while it is in use.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  sound/soc/sunxi/Kconfig       |  1 +
>  sound/soc/sunxi/sun8i-codec.c | 29 +++++++++++++++++++++++++++--
>  2 files changed, 28 insertions(+), 2 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
> index 9cd7009cb570..69b9d8515335 100644
> --- a/sound/soc/sunxi/Kconfig
> +++ b/sound/soc/sunxi/Kconfig
> @@ -9,16 +9,17 @@ config SND_SUN4I_CODEC
>  	help
>  	  Select Y or M to add support for the Codec embedded in the Allwinner
>  	  A10 and affiliated SoCs.
> =20
>  config SND_SUN8I_CODEC
>  	tristate "Allwinner SUN8I audio codec"
>  	depends on OF
>  	depends on MACH_SUN8I || (ARM64 && ARCH_SUNXI) || COMPILE_TEST
> +	select COMMON_CLK

Wouldn't a depends on make more sense here? It's kind of weird to pull
it from a driver when the platform that would run it has no CCF support.

With this changed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--v4z4ql2j7u3o4bzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX41OGAAKCRDj7w1vZxhR
xQhOAPwOUwuCKg39NXFLVb2FZToE1sU0iiqk/p9JBsaPJ9LthwD/QQh2z9ZfLgOY
cdUSIOR2DvfhcRU4bILpVGNxfQ910gI=
=UebJ
-----END PGP SIGNATURE-----

--v4z4ql2j7u3o4bzk--
