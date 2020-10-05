Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1447283513
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 13:37:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323F0181A;
	Mon,  5 Oct 2020 13:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323F0181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601897820;
	bh=ifyO2YZqYLdft9YmvXovOZ4UH+MlmzTcMafQ82WJ5Fc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TpebtrBdC8Kc6cEzFYsOG1yY9AjkkA9Bvalkjg9WBl2XpUVfxSoGEOiq+2TmIqJSy
	 4t2hH73+fBmoUXVUETXcbyiCmx1V8sdDjDaZjyPXoRUhAlQ2vYsghc08Z25RK+a6Gc
	 /2Mwf3C6NkAdEnYzskepgnDMsggRvJlwrdqZy5zQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85AB6F802DB;
	Mon,  5 Oct 2020 13:34:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09283F802D2; Mon,  5 Oct 2020 13:34:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76134F8027B
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 13:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76134F8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="sDt7exSI"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="T5Q/l2Ag"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 26F275C0118;
 Mon,  5 Oct 2020 07:34:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 07:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ifyO2YZqYLdft9YmvXovOZ4UH+M
 lmzTcMafQ82WJ5Fc=; b=sDt7exSIpv1iOp18EMCKRgVkYIH25NOOg7+8zY5/zOc
 0bs0JGtb68EXcKQ01jHG0qv6FmGfk3Sk6PIQPbmkzJEb6KVJI8YJ8cpYtXvWGfIi
 9X7b+M1WJVrDeFc0WKtXcFVRgjC6gxBfZFkewFWp2o/xLzRDGHhTMY+NNEWmrsZt
 DB4GQJ07vRpdOlD6nW8g1CyzIn0yExvolOtbQdjmtQnW9cPs2XMnZYR4OB4UoQTE
 aifYJWbFr72jdC1D+Hi3TRHBCJrJvVzn9vL0tQ6vzfbsqZMwyw+QFulthYh/2e2j
 Ze1Eu0Px1/PfliZ4SZWveiIr7mb54Y7IgHUuOl/LYpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ifyO2Y
 ZqYLdft9YmvXovOZ4UH+MlmzTcMafQ82WJ5Fc=; b=T5Q/l2AgLEz5SkUe7GsL7D
 Hll1HhaJz6VrSa1JcKdkaxEJswCghi1Io+oBMjg9JYmVJID1mPhbJC8CesefEnWZ
 F7VD62IngxgI5aCztdlQnphmC4MrF1eFOwoo9CcMP/xcowydY7Y+w6puRfq2HpIG
 /Terwq9llJkLhlX0BOarw2osEX+zYIf7UIyVWqrguPshr7QM/uZZ/2d+tbiwzWiO
 tonIacAXEo8ca+T4S0ybmeexRlNXMCKuD+clpCARToZFaj5n5jP2/BddsWiJo70S
 FYzl2lHj9lGxQwl+MHGMka9H334cT7eFPr5wvaXPvFTRC/HHG/Ceg7v6SihdcRnA
 ==
X-ME-Sender: <xms:2QR7X26yNSOBV7PSwqB9tJWZWHBnNAKH5TRSq72JXigPHTxjdZT1CA>
 <xme:2QR7X_7oiWXYv_2QavIAtfW8grrrQKxpU_d9-WuC0b2dWy1DeCj-pzwl3kE-lYYbt
 IOsLRV6KscV8HTckqU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2QR7X1fAlCjlgaxpZd1mU0HLG0eFPYhc-kzXh9Lxfp3MEpUIRBggIQ>
 <xmx:2QR7XzJ7O_O2w9Pg99DXmauIgojCEwCCkpOW9FMFzGuGXId6gj1Oxg>
 <xmx:2QR7X6IkXiu1GpEY6pWbvQsQ-g9w0lqQ-wHqv_JNEaE3muqojm4l7A>
 <xmx:2gR7X7quV6HfJdgxtOyXBIpy2aUG1tJ-BVGmDAi6bMrH3gSeaen_Zw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A8DDC328005E;
 Mon,  5 Oct 2020 07:34:49 -0400 (EDT)
Date: Mon, 5 Oct 2020 13:34:48 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 15/25] ASoC: sun8i-codec: Support the TDM slot binding
Message-ID: <20201005113448.4v3llw57q2eucmj4@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-16-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z4w6bfh7n4zwz26m"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-16-samuel@sholland.org>
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


--z4w6bfh7n4zwz26m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 09:11:38PM -0500, Samuel Holland wrote:
> Now that BCLK and LRCK rate calculations can handle any
> hardware-supported slot width and number of slots, enable
> support for overriding these parameters from the device tree.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--z4w6bfh7n4zwz26m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3sE2AAKCRDj7w1vZxhR
xYTIAP4xF3dpNPqtQmWgzulksPMnq3M+hJMpVypcETqDyTo4GQEAoKZ82DgAudDt
EfED7ceftvG9034QICEpQOhxpKNaZQ4=
=+Iyx
-----END PGP SIGNATURE-----

--z4w6bfh7n4zwz26m--
