Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 195941B09F4
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 14:46:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BA4B1691;
	Mon, 20 Apr 2020 14:45:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BA4B1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587386762;
	bh=0CzKDTDIdmIKbJ2GPrHU2bCObWaHM+e8HgIBiH4sL5E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fbr+pt6/GoIeqgFi2Lt5xvQN/zMEKvRrjWEEUIgnUC7cp6eq6VECuWbRUxu/iM/bV
	 oB+q6LxFjtXnP+CfyxGJkYAH9A/jT6BmXge+yCHp1yaid+o9ysxWqtcM5WsiLw1yDb
	 snm+nrglXDydTBM3v97aYwIK08gg4uq896YRfQ4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ABA3F800E7;
	Mon, 20 Apr 2020 14:45:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D537F8013E; Mon, 20 Apr 2020 14:45:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FE6BF8013E
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 14:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FE6BF8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="BIJcY8dM"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="1dE5TdF/"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 52D074C5;
 Mon, 20 Apr 2020 08:44:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 20 Apr 2020 08:44:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=MqLfkwpdNL7mp3m1F9XwsIzRecE
 hB8iVnMkOo+tYlvE=; b=BIJcY8dMYlT/pUxxe3Wgbu8vn7Ba8supxZGHJXCIRVg
 Bdq6cDK+35jxQCL6BMSu0aTPwB69OCLgYt057uvCejkVnYxdWEiHOZiTg7G5aVtk
 Am0N2yQJmkgl1Y/J5bwb1a57fKa3xnyAyTvb4wj0SLmy4EGlfjY2Xn8tPDY8O23G
 7ANketaYsuIN0XiE8hqk+V5MKLyhTbL+z7BhVZIK3vidN7YskBTbhT1fszJhkvr0
 BeJkL5+kQq2z0EOxZxRidgcXX4bdzszafZLuYoDJPCaUwAV+Y05VS3PEIP0hFU6V
 SrjXgpQvhxIKHdlRjEecBR2eLfga/peAwrfjrjT2psw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MqLfkw
 pdNL7mp3m1F9XwsIzRecEhB8iVnMkOo+tYlvE=; b=1dE5TdF/oSc5fkO9xP13n3
 Icezf4EMu2Xmxm51rIU5+1L/DXFNwRBLEvK2klQzJ7KsoaBbu699V7rUdX8aQm7i
 VQxrsCwWaePBJ2OT/7KPHIjoIhCGD8cQcEUMe+jpYERrxljm2jpnzUZL+6Od9MNQ
 HXUDXkvfZEuu+uv9cRbTNGqkA3rmwMG/8Kc6D1wULh54HHEmP4U/rkBlHACxWC8H
 Nd20HpX5HX5cyWi0EDngOw+XQAy8XemaHj/UvEEyXO1KOkcVSC/kBYOQ6lT+oAkr
 EiJOLljyDpPNa67mgz9ae5OBKKFYr+HAhUc8UQa9wGGDEq53N15I7no3WvZPDDDQ
 ==
X-ME-Sender: <xms:RZmdXrl8WX44p-xNd5hAZAh1sasqxaHvTwDHID0Bdiut568CXoGIhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrgeefgdehiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RpmdXvi3q8kvqD35TX9GkqngpnyIKjjAFvVtUc7mY4U6TiZtormUEg>
 <xmx:RpmdXmL21jAJap1tflUbPdnmC-sxW0g07LZE4OTbnZcHCiCWIg3Guw>
 <xmx:RpmdXkF9jR09dwtQy8JObWOtjmKrOfhCw8yEE0s80NpsO1L3tGMLgg>
 <xmx:R5mdXpSRezKvumAUViK6s6pl-JX8sOXCPZm15XmFiAXs6DyM6oB_SYWifss>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id ADEA03065C0C;
 Mon, 20 Apr 2020 08:44:53 -0400 (EDT)
Date: Mon, 20 Apr 2020 14:44:52 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v2 4/7] ASoC: sun4i-i2s: Set sign extend sample
Message-ID: <20200420124452.5vaoyw73n76jwmey@gilmour.lan>
References: <20200418224435.23672-1-peron.clem@gmail.com>
 <20200418224435.23672-5-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rrhtfkb63mjeypmw"
Content-Disposition: inline
In-Reply-To: <20200418224435.23672-5-peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
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


--rrhtfkb63mjeypmw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2020 at 12:44:32AM +0200, Cl=E9ment P=E9ron wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>=20
> On the newer SoCs such as the H3 and A64 this is set by default
> to transfer a 0 after each sample in each slot. However the A10
> and A20 SoCs that this driver was developed on had a default
> setting where it padded the audio gain with zeros.
>=20
> This isn't a problem whilst we have only support for 16bit audio
> but with larger sample resolution rates in the pipeline then SEXT
> bits should be cleared so that they also pad at the LSB. Without
> this the audio gets distorted.
>=20
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index a23c9f2a3f8c..618bbc5156f1 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -48,6 +48,9 @@
>  #define SUN4I_I2S_FMT0_FMT_I2S				(0 << 0)
> =20
>  #define SUN4I_I2S_FMT1_REG		0x08
> +#define SUN4I_I2S_FMT1_REG_SEXT_MASK		BIT(8)
> +#define SUN4I_I2S_FMT1_REG_SEXT(sext)			((sext) << 8)
> +
>  #define SUN4I_I2S_FIFO_TX_REG		0x0c
>  #define SUN4I_I2S_FIFO_RX_REG		0x10
> =20
> @@ -105,6 +108,9 @@
>  #define SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED		(1 << 7)
>  #define SUN8I_I2S_FMT0_BCLK_POLARITY_NORMAL		(0 << 7)
> =20
> +#define SUN8I_I2S_FMT1_REG_SEXT_MASK		GENMASK(5,4)
> +#define SUN8I_I2S_FMT1_REG_SEXT(sext)			((sext) << 4)
> +
>  #define SUN8I_I2S_INT_STA_REG		0x0c
>  #define SUN8I_I2S_FIFO_TX_REG		0x20
> =20
> @@ -663,6 +669,12 @@ static int sun4i_i2s_set_soc_fmt(const struct sun4i_=
i2s *i2s,
>  	}
>  	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
>  			   SUN4I_I2S_CTRL_MODE_MASK, val);
> +
> +	/* Set sign extension to pad out LSB with 0 */
> +	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
> +			   SUN4I_I2S_FMT1_REG_SEXT_MASK,
> +			   SUN4I_I2S_FMT1_REG_SEXT(0));
> +
>  	return 0;
>  }
> =20
> @@ -765,6 +777,11 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_=
i2s *i2s,
>  			   SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_OUT,
>  			   val);
> =20
> +	/* Set sign extension to pad out LSB with 0 */
> +	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
> +			   SUN8I_I2S_FMT1_REG_SEXT_MASK,
> +			   SUN8I_I2S_FMT1_REG_SEXT(0));
> +
>  	return 0;
>  }
> =20
> @@ -867,6 +884,11 @@ static int sun50i_i2s_set_soc_fmt(const struct sun4i=
_i2s *i2s,
>  			   SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_OUT,
>  			   val);
> =20
> +	/* Set sign extension to pad out LSB with 0 */
> +	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
> +			   SUN8I_I2S_FMT1_REG_SEXT_MASK,
> +			   SUN8I_I2S_FMT1_REG_SEXT(0));
> +

If this is an issue only on the A10 / A20, why are you setting it up on the
other generations too?

Maxime

--rrhtfkb63mjeypmw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXp2ZRAAKCRDj7w1vZxhR
xd2KAQDAdGFkpNxxWDH2yNhAsQfitBlOB1UiMnXX7HRIiSxsGAEAikvadyrGtuaM
MfXY74N8vHWHTDr8hd6svx6Kpc/dNQg=
=7wY5
-----END PGP SIGNATURE-----

--rrhtfkb63mjeypmw--
