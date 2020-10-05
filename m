Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 017BB283503
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 13:33:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ACA7181A;
	Mon,  5 Oct 2020 13:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ACA7181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601897587;
	bh=ZIQmHdb/ZtkJpXvL4aNPLntGSaV8oOLW2+hwiNNW+yQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DUkKE5IK8IAKjG/axtdF4FsrOlty7bo2xUGLUnPKRKNK+cuUq44YQEWKgRqag8B9D
	 RLHazSjM6YNdrEKMHtdbA2b/a9FnrctdNzCEFQwHhYPjs2aolPdz6jXhPkPbu0IX7F
	 RqJoRxdlep97AQxVVmAihvUmLvmSeQecuinbLxsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ABCBF80121;
	Mon,  5 Oct 2020 13:31:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B344F8027B; Mon,  5 Oct 2020 13:31:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D50D0F80260
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 13:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D50D0F80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="cPUt+IEI"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="eIqwday2"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id E255C5C00D0;
 Mon,  5 Oct 2020 07:31:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 07:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ZIQmHdb/ZtkJpXvL4aNPLntGSaV
 8oOLW2+hwiNNW+yQ=; b=cPUt+IEIUBnnrbU1fcJM3em4UWoMW3+YJhb2VMMPMY/
 4FWf0iefoGz8Qxttz4WcXJ/3GIYcZVTcLxFDIHeY5IfilBSyud0r6pV7iDZKZLTX
 N5oGlZdGDwgs0U87Egdea31wy8i5Nmy0ULzQOX+DtqTN2mmI9FIdRXh8k/8H/mHy
 qvgIvLhBoA+3TA6fLt7RcYtfg8MHkGhe3g/eOt/I9QiCBbvClGwcC86EFAnYXwnd
 vBUHopOcrDSJVAIWO6k8gML9zcp9RJuW2CgC3b47cPaeCzG3c46vZc+gXqSfGdaw
 BHCdtuBUXimisUBo1EfWUQim9a/kwCFknpuFE5SYjiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ZIQmHd
 b/ZtkJpXvL4aNPLntGSaV8oOLW2+hwiNNW+yQ=; b=eIqwday2T1qbW2tZmsFpXn
 VEXdLzcXiTp69kmYJs+zeK8PdABcexL2hBr5Nbnk1/f+decWSXPbJiTRqDrLQvb8
 X0iaYuaS6uv29TMc87eQtyMCj/J/fj07V1n0ZlNUF9aD9YliuHf79R9TyTS5HQNM
 X+3W7fC0/TgvzxRXYXaGUFBSPYNamB8pv4q4C+LMTQcO+BjEZIqhXLWL95WJsgU1
 50xSpHzhFMn94HE+FqY8wB61HyzyNmLNWnbKeI+oaeJvu7TTPE4q286/NM7spe0w
 xnHB1yDmkORcWw1NljvtwoBL0krmREM0cnj6QDqsn2FF2E5zuKjyexyem3Pm/tBQ
 ==
X-ME-Sender: <xms:FgR7X3gazs2SINpDUNy27biQpcllfLHk6yQ2alcMchCt3pAmd1OUJg>
 <xme:FgR7X0AxH4s5srbXESHwSU3Kr8aFSsDyvcQPetpo1ETf-V-n3N8o_GteFICulZF68
 X9qNGkCh77Vxy3o4U0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FgR7X3HQ5yDcuhmRZP0sjRz-4vIMsKJvMnFmOvOSR1xT9uFCyKkwkQ>
 <xmx:FgR7X0SyCLOXCfu_CuicQx3jt7OrIyg6szx_7UzuXtHMQJ5XTbJGmA>
 <xmx:FgR7X0zD0JXr-WFFXJWzruqvjYC55MmYvYuwKCYXYPYBs4-R321f3A>
 <xmx:FgR7X3yLt9Qx3uMrPJnGhwZXvOLxfrywy5lFqarDyKtcxXqdlJdARg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 631E83280059;
 Mon,  5 Oct 2020 07:31:34 -0400 (EDT)
Date: Mon, 5 Oct 2020 13:31:33 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 13/25] ASoC: sun8i-codec: Round up the LRCK divisor
Message-ID: <20201005113133.vftzhf45ctzzmbdq@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-14-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j7tj6ihkcu4iiffd"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-14-samuel@sholland.org>
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


--j7tj6ihkcu4iiffd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 09:11:36PM -0500, Samuel Holland wrote:
> The codec supports only power-of-two BCLK/LRCK divisors. If either the
> slot width or the number of slots is not a power of two, the LRCK
> divisor must be rounded up to provide enough space. To do that, use
> order_base_2 (instead of ilog2, which rounds down).
>=20
> Since the rounded divisor is also needed for setting the SYSCLK/BCLK
> divisor, return the order base 2 instead of fully calculating the
> hardware register encoding.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--j7tj6ihkcu4iiffd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3sEFQAKCRDj7w1vZxhR
xRC4AP9cMQdx9DuUE6bytBFkzj2hACb3LUETn/mRypWtZtB3egEAk3UyKIzvUWNB
U8VvDTubU4PKI/UIlKt28CTY5znGdA8=
=ases
-----END PGP SIGNATURE-----

--j7tj6ihkcu4iiffd--
