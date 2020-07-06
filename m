Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FED2215233
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 07:31:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACE1A1663;
	Mon,  6 Jul 2020 07:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACE1A1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594013489;
	bh=Z1FPK15FXARPfrsJWpktl5NuYvqJCEyVSX3zdI4h0fI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CA2ad40EhG8tzrw9KDmyxjBUZEbJyscfsk/0SSV2aMT+ouBXHbdZNK7uRU4t/2VML
	 UmBpGKay1O12OHHLq4tKiEbfSwmvDa9omCCaH32oHVoc3GTlOH/Xd6nDPkl+5tytpu
	 x8EEt5dnlpgEPrkcN7SylGgcBc4fQfw8Ptchnm7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D06CAF8011F;
	Mon,  6 Jul 2020 07:29:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67FD3F8015A; Mon,  6 Jul 2020 07:29:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11509F8011F
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 07:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11509F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="Jeh0GA+y"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="LycLHK9w"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6533B580518;
 Mon,  6 Jul 2020 01:29:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 06 Jul 2020 01:29:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=pwom6EhByiguzZVplfbjBnBP65w
 atD/Qn4Iq6UPhCSk=; b=Jeh0GA+ypz8EHMTRzL76IUGJl29Rnm+e0X53z/B/7C+
 WZ5CpKOIR3zzyFU98bkX8gWeghJyXRPCG3l/0+v5y5RVY10rdLVfPB/fP2AwsArW
 /G6OZuS1vuQlJlGGtfKOJLNlyPnJQ3/lYfMnWgEg5X1+Gk93pRCrhrenKGUTpSMF
 T5Lc63S05GDs4rnqD10C8fpZDfMNvN1JBuRHA/n9gmRuOjQnn3VwGY8i0jt3TaAO
 BHbN+SvAlAfTvcDzHFf2/oQZqsHghmWyhFh5yAITDdu+0AdKULZ6z27olBg8Jlpq
 dK7EcaHH5n46tuRNWxZRbyPvVFF519g2DDkPJ9PexVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pwom6E
 hByiguzZVplfbjBnBP65watD/Qn4Iq6UPhCSk=; b=LycLHK9wRLe6SwSvULlPnX
 vLHEZUbyZlpky8x2c4hqRFXxThr/VFW67+8QV3oDqOCdSrdBCrWxJT27XSEhPPiI
 qhchhUD/46dJlK07hX+LjCKmUu6+prtCqAtBy4EsPcqdhS4SIaDBDqCZF+H3pkIj
 TXt+niEn5v+Nws8b7PeV1O3510JSYSHs38pnQgrkgHcr+gVFAY88g2WPZ/B7LT4e
 4jr9Qf5AD+bmUZbBKD+jeDZu9VMBxblatZj34BVsd90GMg/GbITnQvoGeEB1M8d9
 bt+/Bj52XMd3zdLroU1yhDum3WyIu1f6R8gbuM9FRkc4p8ijjNCFId9NX0aZbvCw
 ==
X-ME-Sender: <xms:wrYCX2oQdaez2-1MdZQ8RRa-F7XjLuqbwf4q_EWZ9So-qQGjflOXJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wrYCX0pVRc-oOakKcXYdCzBzdqhSpX0HGfEUrJlwWeMiZL56LooRLA>
 <xmx:wrYCX7Mkvk7_u-VkWxEjGOLqVZhFhioCNP1LMBuHIZx5S8i2eErSHQ>
 <xmx:wrYCX17e1a-ZaoRFLR-BCWWBpRT2GXiXP5lt-rku6EP0yLj6-9FrcA>
 <xmx:xLYCXyzMiC6b5Hgi2yPOxwVvyJzvnkGvIxm1vbl_EE9vq6JTfOaM0A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7AADD328005E;
 Mon,  6 Jul 2020 01:29:38 -0400 (EDT)
Date: Mon, 6 Jul 2020 07:29:37 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 08/16] arm64: dts: allwinner: h6: Add HDMI audio node
Message-ID: <20200706052937.ygjjllrsj7rvynkq@gilmour.lan>
References: <20200704113902.336911-1-peron.clem@gmail.com>
 <20200704113902.336911-9-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zabvcj3d4ofdrekw"
Content-Disposition: inline
In-Reply-To: <20200704113902.336911-9-peron.clem@gmail.com>
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


--zabvcj3d4ofdrekw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jul 04, 2020 at 01:38:54PM +0200, Cl=E9ment P=E9ron wrote:
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>=20
> Add a simple-soundcard to link audio between HDMI and I2S.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/bo=
ot/dts/allwinner/sun50i-h6.dtsi
> index 78b1361dfbb9..ae169d07b939 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> @@ -67,6 +67,25 @@ de: display-engine {
>  		status =3D "disabled";
>  	};
> =20
> +	hdmi_sound: hdmi-sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,name =3D "sun50i-h6-hdmi";
> +		simple-audio-card,mclk-fs =3D <128>;
> +		simple-audio-card,frame-inversion;

Have you figured that one out?

> +		status =3D "disabled";
> +
> +		simple-audio-card,codec {
> +			sound-dai =3D <&hdmi>;
> +		};
> +
> +		simple-audio-card,cpu {
> +			sound-dai =3D <&i2s1>;
> +			dai-tdm-slot-num =3D <2>;
> +			dai-tdm-slot-width =3D <32>;

I'm not sure why you need to use the TDM stuff here. IIRC the HDMI
controller can output on up to 6 channels, so how would that work out?

Maxime

--zabvcj3d4ofdrekw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXwK2wAAKCRDj7w1vZxhR
xZM5AP48KiovnrBuDrRSfzXBBjVfHTI9Y+xsX21MeZsf8aYsBQEA8lBvXN/W6RPo
OtYiNKW1d7/qBWi5EkuPxGrsxT7PYQU=
=A3Kc
-----END PGP SIGNATURE-----

--zabvcj3d4ofdrekw--
