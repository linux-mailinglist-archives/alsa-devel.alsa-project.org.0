Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1771BB849
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 10:00:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3C5616A2;
	Tue, 28 Apr 2020 09:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3C5616A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588060802;
	bh=l9tMYpEpRsM3tTPXKRcy/GaLeXW8ktaIad3r641T/qc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ljbo0PSI8by6MLQNRFP3UWv8qq5QuQRYBODHcjXZ1vf6BC0BATNiIdce2phLMnbem
	 aWVWx3jouB/7TmL0kwh3oYb86Mtd7YQwB7yB0atusGEWtjitjD6E4XgXqTXGuuq7wC
	 yYYnTpeCLv9S71FO1yU/QWER4SF+8iY2OgGEAftk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA96CF8021C;
	Tue, 28 Apr 2020 09:58:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 607E0F801F7; Tue, 28 Apr 2020 09:58:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53710F801DB
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 09:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53710F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="e+s/MFO1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="G+Do9nny"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 53D78580139;
 Tue, 28 Apr 2020 03:58:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Apr 2020 03:58:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=E2zDRhRAXT59srKZrN/sdPOtf/1
 VxLhZFcu+n6RQ+70=; b=e+s/MFO1aKDyXc98fjOF6sGkjUtEDWkRrtpM1gXl59Y
 /4bEIjhRPD8pcErFk+EStYtKDaXCs3erk4Cifkz4VNoPzt7YcisKqsXB3oemRy9G
 jWXc95m9/dApLNcaJ78xwkS/aUmQ+3Gq2GS5OLevDuwMjFs+v4rWl2SFJ2l4r//M
 g8tXmawyEt7QgMxu2cKcvQA5dHWxVI7+HSSBhGxjD3QC9Rm6f1sedhccHvfZo9kN
 UCCGHR/QdLfbOW5j8iSpojFHZGXIFfM5RI2RE33GrhW+OZi5jv14ChIpm4OyV1IW
 vAxuwUvzNrz4V5a0+qrUIxfw3EzSJD/zAYqpSPNPRAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=E2zDRh
 RAXT59srKZrN/sdPOtf/1VxLhZFcu+n6RQ+70=; b=G+Do9nnyXMVKs+tVrfUW/x
 lPzV2CSYXrAZkSaVCBm8LxW0KlOHZVn9VpMs49KE4FlxhYhgJO/d/Q53fJcYnF+8
 6ls8hCtb2voX1zGPjVnPqdyhV4fv4uCxKDJPytvXJvJZkUS/JHqHG6WYheSXpFy5
 CxI/V1qdyujXz/Cdvy+bGl8wEk1XFGFB+jSqCug+MjESFUqjs3ZCKpcxNX3fBoYd
 z2NjTa32fi4kGAWZrUsom6+C5weSGcXrvjKADn6MhaUAzKqpxAgY+pcp+99oR4XY
 ST0uuaNKIQ07k83mmeCygu2IHyLZw7lw0z1bbJ7adAE1JAxPAwQ7w1ounSwPMseA
 ==
X-ME-Sender: <xms:GuKnXlQp9-TvG0uZNDh0JTcfGTyDVOWb_vI5cCDQ7sHPnzaPNX-U3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedriedtgdduvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:GuKnXpCuCThrunnZ6dFJYzWl3_95Qc-NEcGLy3N09_n9Nz8qtkDHdw>
 <xmx:GuKnXsmBtkjBZaH7hPWjH0_OynDP__2OulZYbSq882aHtQ-wCIC7tA>
 <xmx:GuKnXhkewsyxDRHdqfwjYNbJ49HYxCPwbj3_A4iYLuIMRF6pUtU41g>
 <xmx:G-KnXhewACw1mmiW1mKWwm47E5k5TAvNIRXUXQPs-9F1wK6umaOnwg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 025803280067;
 Tue, 28 Apr 2020 03:58:17 -0400 (EDT)
Date: Tue, 28 Apr 2020 09:58:16 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 2/7] arm: dts: sunxi: h3/h5: Add HDMI audio
Message-ID: <20200428075816.p46abv7rrnlg6my6@gilmour.lan>
References: <20200426120442.11560-1-peron.clem@gmail.com>
 <20200426120442.11560-3-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bats57frlj3pqipa"
Content-Disposition: inline
In-Reply-To: <20200426120442.11560-3-peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sunxi <linux-sunxi@googlegroups.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
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


--bats57frlj3pqipa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Apr 26, 2020 at 02:04:37PM +0200, Cl=E9ment P=E9ron wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>=20
> Add a simple-soundcard to link audio between HDMI and I2S.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  arch/arm/boot/dts/sunxi-h3-h5.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi=
-h3-h5.dtsi
> index 9be13378d4df..3a4262294950 100644
> --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> @@ -105,6 +105,25 @@
>  		status =3D "disabled";
>  	};
> =20
> +	hdmi_sound: hdmi-sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,name =3D "allwinner,hdmi";
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
>  	soc {
>  		compatible =3D "simple-bus";
>  		#address-cells =3D <1>;
> @@ -672,6 +691,7 @@
>  			dmas =3D <&dma 27>;
>  			resets =3D <&ccu RST_BUS_I2S2>;
>  			dma-names =3D "tx";
> +			allwinner,playback-channels =3D <8>;

This property doesn't exist in the binding

Maxime

--bats57frlj3pqipa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqfiGAAKCRDj7w1vZxhR
xXKlAQCv6MNWlrAX1U69XHGf0wvaL+nfygE1iVSzCRhMAp+wdAD/d9UJm7+SpDnw
YKDqJ4jLcBeUm3rEGjBnSLcIByUUNwI=
=l3WT
-----END PGP SIGNATURE-----

--bats57frlj3pqipa--
