Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2CB215236
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 07:33:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACA611677;
	Mon,  6 Jul 2020 07:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACA611677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594013596;
	bh=dxQJ2I7Li8aHfOzifKIbpqQPsp9RebeP4uA/l1UJS/o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YFUympF01NjRHD4OplsUucXLoNHJHKrV5DJ5O0bOB9DBsRZiQiS0RzD00f/19gava
	 JYwyoIKNXAcLN1Q3pfdpnAseWbhhyS0zzNpevsWXmAiUNwOCWH323NmEUuKy5EA5Oy
	 ZY70YRDmUe858DM3SYoQ2Jpa125jPRzBnIZHgHMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 001FEF8015A;
	Mon,  6 Jul 2020 07:31:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC23FF8015C; Mon,  6 Jul 2020 07:31:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74E35F80150
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 07:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74E35F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="GyDU8QU/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="pDpLaGQG"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5124458051B;
 Mon,  6 Jul 2020 01:31:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 06 Jul 2020 01:31:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=WKyQCL1ic+iC6Uc1+65VueAxHLF
 Mh0dPBP5e4GWcnGs=; b=GyDU8QU/z7cxgfHZiIPPvULXoGTAqGZkqWusgkAa15E
 cTErUycNQExN4pf/rfnRAErLlcMPWLv6SK9gaousOBpCDIBPdD56ATDg9Ka1ET38
 o+s+LlCAqZYMo6nXsJZU9YBKwA2X4B48D9iPU2B8aaSFOotpYHxW2bakjmOm8ZF+
 Pyc8OMj5mBmencafRx8WSmdmmhgyTFGB/E8cGSApPVNV0d8ue3ZgKNNmDVDS9j0P
 r0cuSK1mnubxxagDSPNvA+464P8IUVhHTWi4u4P32EYdJCpOUKI+m5qtmQJtssP5
 9kE7ZsFHhC2D2xUWGdg5QU2FOapRH+X8iubQwFfdRIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=WKyQCL
 1ic+iC6Uc1+65VueAxHLFMh0dPBP5e4GWcnGs=; b=pDpLaGQGpdL9nUt2M4RZCo
 HMKGeLzoDqp++2dKS55uTuRNSO7YvWTjj/MomaEsDSpHDAa3Dcdq5wfqJcQcPY+s
 D3QbIoBDKY7oi4wGLv6giD00zP/Cnajh3oWb/V0u9nJXIm2lrMLPyoQ4um/7PcHD
 ZXkL4+bgReq2ZivDqxQnZsdeUk0bYe4i4HqQzK3paWzGLmIju44BINH82kH5DyTb
 kMo+LLwq+QVkDq1W9RyvYAgwpEenSej8wHH74L/s7GCF2Nfk/pAKT6MDynvA5XU3
 uIqLe0DFF4EXVPyYFsUsmtjJLr66bn02FyJdUkaAvrzk80taZ75N1mCIlOHJItjg
 ==
X-ME-Sender: <xms:LLcCX22MaQPKnxDX7jZwLd2K7G4C0HVgPYSJpAj88yDXTmESd1qVHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LLcCX5HUjIopOW31gQaPlCc3NMOr9SrMuSwjXYAJa9WEWfe7tBP8GQ>
 <xmx:LLcCX-4f_S-dnLZ3uT5lP_PXpvbHahrPJte1uF9i1tbHI_wdMJcnOw>
 <xmx:LLcCX33YwfGtcMHMg6mMKdEih2R_6kynmFi58Et8hL1pBin3ZrbL9A>
 <xmx:LrcCXx_YcoAP3BCYjTJLq92D4z_MGH5umNWRGL_uGS7hQYuXDkvNsg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6A35F30653ED;
 Mon,  6 Jul 2020 01:31:24 -0400 (EDT)
Date: Mon, 6 Jul 2020 07:31:23 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 13/16] arm64: dts: allwinner: a64: Add HDMI audio
Message-ID: <20200706053123.uenb3nrdrckdvao7@gilmour.lan>
References: <20200704113902.336911-1-peron.clem@gmail.com>
 <20200704113902.336911-14-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uyy6f6byomhmdood"
Content-Disposition: inline
In-Reply-To: <20200704113902.336911-14-peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-sunxi@googlegroups.com, Takashi Iwai <tiwai@suse.com>,
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


--uyy6f6byomhmdood
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 04, 2020 at 01:38:59PM +0200, Cl=E9ment P=E9ron wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>=20
> Add a simple-soundcard to link audio between HDMI and I2S.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/b=
oot/dts/allwinner/sun50i-a64.dtsi
> index c662f6a170ce..6a321fdc8e90 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -102,6 +102,25 @@ de: display-engine {
>  		status =3D "disabled";
>  	};
> =20
> +	hdmi_sound: hdmi-sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,name =3D "sun50i-a64-hdmi";
> +		simple-audio-card,mclk-fs =3D <128>;
> +		simple-audio-card,frame-inversion;
> +		status =3D "disabled";
> +
> +		simple-audio-card,codec {
> +			sound-dai =3D <&hdmi>;
> +		};
> +
> +		simple-audio-card,cpu {
> +			sound-dai =3D <&i2s2>;
> +			dai-tdm-slot-num =3D <2>;
> +			dai-tdm-slot-width =3D <32>;
> +		};
> +	};
> +
>  	osc24M: osc24M_clk {
>  		#clock-cells =3D <0>;
>  		compatible =3D "fixed-clock";
> @@ -856,6 +875,7 @@ i2s2: i2s@1c22800 {
>  			resets =3D <&ccu RST_BUS_I2S2>;
>  			dma-names =3D "tx";
>  			dmas =3D <&dma 27>;
> +			allwinner,playback-channels =3D <8>;

This isn't documented anywhere

Maxime

--uyy6f6byomhmdood
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXwK3KwAKCRDj7w1vZxhR
xerOAQDJKnS9jqfb9I6HEIiwk9owTLZ5YOI48O1UfvR91KSL5wD/eqv9UZ1V230I
0ozBROi+ZprQ2l9brT8puh88zJF1RAA=
=3Ow7
-----END PGP SIGNATURE-----

--uyy6f6byomhmdood--
