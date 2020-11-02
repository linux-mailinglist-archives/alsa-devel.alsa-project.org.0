Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 235A52A2C51
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 15:12:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 931EC1708;
	Mon,  2 Nov 2020 15:11:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 931EC1708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604326322;
	bh=UvNiVobPftYB2h5XnNf9Tms8YGGyyKqqr8et4AVouaA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eqQXeXMRORsZIeHyYuSL+FErSD05YXITV3nAoAHO30yDz8kGG0ooT55LvPMNeonRX
	 WiySnWEVuh8EMaFjwcl1EyXaTUiDdnF0Vvl37PmOk0Xo36w5VZUSKomAzj+N30R9Gd
	 ExMzn9p988O08VKZQNPtjAT53vFyN+Hd6vDGQvUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2191F80234;
	Mon,  2 Nov 2020 15:10:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8C7BF80232; Mon,  2 Nov 2020 15:10:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01B8BF8012B
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 15:10:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01B8BF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="NmIr3HRz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="n+eij2sm"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 11971E97;
 Mon,  2 Nov 2020 09:10:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 02 Nov 2020 09:10:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=dpGVrUN7sbNNdMBO00Igg8XQCXh
 zbGHZw4VAOKfwtSc=; b=NmIr3HRzYMgzYCEbdESzMfYJrU0Kj1SUWwCRnJtt5zR
 jfh8sWJSWn4TQuZ7pE7QHkuvOvueILyAfVVu2OS71kXvkth71JEZzBO9A19ZZyqC
 3CEAOmHWKwA5zqcJIQAVnRGJI7HPdlAXZnu9PH+PBe3E9+UzYOtkoFccnSyPAu2e
 0dNKwMEaNevi0N2kPWed3DxLJRTqHZ3K0c6H61Vi3jcHXVY/2p5gSBKn/JW4lYSU
 bTT24OyxdMPvFEOMrgzi9qT0WHQRUJF3JXaQu5NPDrx75JdeBYWf0/+pJ3Nfr3Ss
 be9kmWXbkGGgxhhwpGT2pNo+4kR4P7ngBSekV3u6gDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=dpGVrU
 N7sbNNdMBO00Igg8XQCXhzbGHZw4VAOKfwtSc=; b=n+eij2smEm+gpDH/36irax
 f4cxCovblUmCwqoUCVaTeyb9uVB0MKv13uX7/BQecurOhlTv0VBRkl9O9xgESpkS
 X3ADUHnF7K5yft2Liop4cajF1HQNV9CJt6FXxJycLoVF9KOSw4A6/Iw8ZRICt9WL
 5FQ5jSpB2l9UpQTteQcQ+ZRWZ04UcbwQ3DhlW1CQ08LkbzVdmGJA3TaIf/57t0FV
 C6x2PALBjaZdQmhz8SX9568mOndcX5KmtdcozCONCvkqprFFx7iKu52BJvgNAEMV
 PlhpraziMng6E0J/DS1QrupKTS5+U9K9mjbJ9ppqPVV4e7kLafJbxF2x1BC+kLsg
 ==
X-ME-Sender: <xms:SBOgX7PDFooeO1NL6btsjZAHTuk8UVh6hjszBojzxHxBJq5FBHfn0A>
 <xme:SBOgX19Bfir03GnNUyEiTF813ylJzQNN1cmcu1JsAdDqvfPvl9Ugck0-xu9xAtzwt
 jtEWH56lsdfQaBGkR4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtuddgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeekkefftdffhffhvedvudetgfdtleejveffvedvvdetgeeltdfggefhhedv
 ieffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SBOgX6SHcSPoY_wEJqU-NmcW6S1TtcgfKpalIuvY7QDswYVrBv0DUg>
 <xmx:SBOgX_uER5-XQGPo8b-LlXWy1orsnOiugPQEWQg4LtNaocbbB5ZsSw>
 <xmx:SBOgXzfllJDBGbHns1rKca56SrnffiyyLW00pxFlmjK4Xs11Jo8I2w>
 <xmx:ShOgX0Uz6-x_bCwi8N806SFF0Qp3WXlS84phQiXbpUV0vhKCA3syKm7ksiE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8CAE33064683;
 Mon,  2 Nov 2020 09:10:16 -0500 (EST)
Date: Mon, 2 Nov 2020 15:10:15 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v10 00/15] Add Allwinner H3/H5/H6/A64 HDMI audio
Message-ID: <20201102141015.dfxrkd3tultmmqij@gilmour.lan>
References: <20201030144648.397824-1-peron.clem@gmail.com>
 <160408688151.11950.1284919768798155829.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ubfn37nzngxzsnsr"
Content-Disposition: inline
In-Reply-To: <160408688151.11950.1284919768798155829.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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


--ubfn37nzngxzsnsr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 07:41:21PM +0000, Mark Brown wrote:
> On Fri, 30 Oct 2020 15:46:33 +0100, Cl=E9ment P=E9ron wrote:
> > This series add H6 I2S support and the I2S node missing to support
> > HDMI audio in different Allwinner SoC.
> >=20
> > As we first use some TDM property to make the I2S working with the
> > simple soundcard. We have now drop this simple sound card and a
> > proper dedicated soundcard will be introduce later.
> >=20
> > [...]
>=20
> Applied to
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next
>=20
> Thanks!
>=20
> [01/11] ASoC: sun4i-i2s: Fix lrck_period computation for I2S justified mo=
de
>         commit: 93c0210671d8f3ec2262da703fab93a1497158a8
> [02/11] ASoC: sun4i-i2s: Change set_chan_cfg() params
>         commit: c779e2de0ac6156bea63e759481ee383587336cc
> [03/11] ASoC: sun4i-i2s: Add support for H6 I2S
>         commit: 73adf87b7a5882408b0a17da59e69df4be12a968
> [04/11] ASoC: sun4i-i2s: Change get_sr() and get_wss() to be more explicit
>         commit: 9c2d255f0e63f8e54bd8345f9c59c4060cf4bbd4
> [05/11] ASoC: sun4i-i2s: Set sign extend sample
>         commit: d8659dd9a13ce7a92c017c352aea1c390f300937
> [06/11] ASoC: sun4i-i2s: Add 20 and 24 bit support
>         commit: 6ad7ca6297f8679162ee62ed672b603e8d004146
> [07/11] ASoC: sun4i-i2s: Fix sun8i volatile regs
>         commit: 64359246abe4421ad409be5b0bc9a534caa18b7d
> [08/11] ASoC: sun4i-i2s: Fix setting of FIFO modes
>         commit: 38d7adc0a003298013786cfffe5f4cc907009d30
> [09/11] ASoC: sun4i-i2s: fix coding-style for callback definition
>         commit: 08c7b7d546fddce76d500e5e5767aa08836f7cae
> [10/11] ASoC: sun4i-i2s: Add H6 compatible
>         commit: e84f44ba4604e55a51e7caf01464f220d0eabef4
> [11/11] ASoC: sun4i-i2s: Document H3 with missing RX channel possibility
>         commit: 0bc1bf241de551842535c3d0b080e0f38c11aed1

Applied the rest, thanks!
Maxime

--ubfn37nzngxzsnsr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX6ATRwAKCRDj7w1vZxhR
xSeUAP409mFvtehJOKw6zjbq/EI3VuiLjVcok4IzPRcqjtogAQEA98Jf5ouRTvsr
D9YlV4LZU6igTx7Wr3X/CXNsXsmHEgM=
=FLzW
-----END PGP SIGNATURE-----

--ubfn37nzngxzsnsr--
