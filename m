Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8D32833AE
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 11:55:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 941661809;
	Mon,  5 Oct 2020 11:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 941661809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601891738;
	bh=a3Kdh27qJh0L6hcJBNIfK8XDjWN1U92ZxA5pBLTQkNQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nWGHIU3sXxbwghIY0iSBX4CZZ/zBbv/pT+NowCk41HNFdECLGBY++KkArzLMpUTKU
	 RlRepvOyCbDGA4vxnWzm4GUTik4UQ8niZ7Qmu529twnYUoyCtRTZ5pMdS+9alM9oxk
	 nBXkN2KkXHCoagcdeMmM5CpZXFTbL0mxyw2LtIfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 258E2F800EF;
	Mon,  5 Oct 2020 11:53:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC2D0F8025A; Mon,  5 Oct 2020 11:53:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5851F800EF
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 11:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5851F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="RLVJ4IJR"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IfTt5C1E"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id BE5D75C00A8;
 Mon,  5 Oct 2020 05:53:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 05:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=a3Kdh27qJh0L6hcJBNIfK8XDjWN
 1U92ZxA5pBLTQkNQ=; b=RLVJ4IJRLOGpk+4jo7PUzRLm/3gU+V4Xxx6/IucSuD9
 zqeTc3ftNPpBKSNzX2wpv3C8hOg1fC6DK5ptPMf1bODUIWoU4Puch/9rTNxl11bD
 i6h3eIaX2WgdaVZPiIkYQCe/BDPakSBma85HkEXwpTVlvlXCqbWWl9p//y3ECsG5
 jNN4BEwX6xn5CgomnpYPVO+LJfOGdH5G0QseQ0DtDWGovyfdVJrp7UfdttdC5ANf
 uGrfwXaEENYUiKERnI02eYI/dGNoNV4U1wNqimwrZ3aJJNmWE4o3erz+VOkeiSkU
 x/OiTvVRM/0X6s+FjnTsa1oH0Zn5zGpJ5q5EJMXaIuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=a3Kdh2
 7qJh0L6hcJBNIfK8XDjWN1U92ZxA5pBLTQkNQ=; b=IfTt5C1EESiRAB5hH4okOj
 LyXyyL+xSwHo/9Rf2OO7VlMIyuyBeWSDWOTA8kUC1dCBGSLj18NFycLmWzl6nIPu
 PJs+xhCzNdCu5XCNL7YzhCPPWkzxTIv5I3AWobbU1KH1Gs+4azESwy1ozFBpEZK4
 kWBaFegYKW/NSRo9ThrpgOMpkSbGLq8fmlGh2TJOHuJfTPejESghM4GAafWFZCLV
 UulZHnffJs0ZqrSs/wUUj0lDEVjBbv2F8nHHNDoq3E4DzVlqSFE9dQxVYn9xkKQ9
 VfGSJD3oaArY/YLg/5zCH5MFRVSSjfYW4AdLRxx00vM80C3WcKNXXxgLt7j/rPHw
 ==
X-ME-Sender: <xms:Iu16X8fIFhhZXtXT1g18RAqsFdOWuIdmZMeA0KSFc8VtXEapHUqP8g>
 <xme:Iu16X-NigKuGwYkl2T7wEvc8T6NNq9H3H1Dy_pr8mmB-Om7usnljkm8vKpon3ovLe
 mJvXJEx3KLv6CK_4f0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Iu16X9hkJln9mreZ0CtghMaEIC0ib4qXENAa30kah66Mqeq-VZ7CFA>
 <xmx:Iu16Xx9s9v8tfXYKzhDcU3N8n9bI8upZ7QcWenJNV5msNwZ9VgGc5A>
 <xmx:Iu16X4un5ys88qxhXIXgpQUu8M3rWQb5RMhJMjt1i4m-xr9aeDZwMA>
 <xmx:JO16X99rpG3kxR5j6COCt-nKwhCxeWEG7yT1eHOIvK9kZR-l72wEzQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 68B80328005A;
 Mon,  5 Oct 2020 05:53:38 -0400 (EDT)
Date: Mon, 5 Oct 2020 11:53:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 01/25] ASoC: sun8i-codec: Set up clock tree at probe time
Message-ID: <20201005095336.wzvdfjg7tyipiblc@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bfbi64475avkiovi"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-2-samuel@sholland.org>
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


--bfbi64475avkiovi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 09:11:24PM -0500, Samuel Holland wrote:
> The sun8i codec is effectively an on-die variant of the X-Powers AC100
> codec. The AC100 can derive its clocks from either of two I2S master
> clocks or an internal PLL. For the on-die variant, Allwinner replaced
> the codec's own PLL with a connection to SoC's existing PLL_AUDIO, and
> they connected both I2S MCLK inputs to the same source -- which happens
> to be an integer divider from the same PLL_AUDIO.
>=20
> So there's actually no clocking flexibility. To run SYSCLK at the
> required rate, it must be run straight from the PLL. The only choice is
> whether it goes through AIF1CLK or AIF2CLK. Since both run at the same
> rate, the only effect of that choice is which field in SYS_SR_CTRL
> (AIF1_FS or AIF2_FS) controls the system sample rate.
>=20
> Since AIFnCLK is required to bring up the corresponding DAI, and AIF1
> (connected to the CPU) is used most often, let's use AIF1CLK as the
> SYSCLK parent. That means we no longer need to set AIF2_FS.
>=20
> Since this clock tree never changes, we can program it from the
> component probe function, instead of using DAPM widgets. The DAPM
> widgets unnecessarily change clock parents when the codec goes in/out
> of idle and the supply widgets are powered up/down.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--bfbi64475avkiovi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3rtIAAKCRDj7w1vZxhR
xc8eAP0bXlNFAgDQHOBfRxm3VEecjJXH/Mon6DpSnsh19/gbFQD/ef2AX40M1Qvg
8TTnjRMLXcsvCsCCrfP2ndB5hx0jjgU=
=i7U6
-----END PGP SIGNATURE-----

--bfbi64475avkiovi--
