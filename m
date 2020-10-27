Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A909A29C3CE
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 18:51:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 301B71687;
	Tue, 27 Oct 2020 18:50:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 301B71687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603821067;
	bh=MlOe8J1DrS34+CcQ8+PDRc8VQ1TjW8TNpBn1dHf+8l8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gn7hcPqihPlrjhipQ4VGvPvEhJkv/ZqG7jkh4BNc3eMOFsVaJgsy301qax3R7paV6
	 7txi2VcrxY8CzMqHbu4KkMzBN6QKAtIfaQ22MrGE4svoPV1pdonT4dM3YklOd7OJMY
	 f5pZ/YtiB2/oZGySa4SYb0fuFoW0HkfVM7umbITk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82827F80217;
	Tue, 27 Oct 2020 18:49:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81B3AF8020D; Tue, 27 Oct 2020 18:49:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3D7EF80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 18:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3D7EF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="h7KV/WVi"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="XVv6/Yux"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id A9E4558042B;
 Tue, 27 Oct 2020 13:49:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 27 Oct 2020 13:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=MsmV9Z4JXukxzIFQdHmCny1TjoP
 05fwA8qrcsr9qy/s=; b=h7KV/WViQ0UiwMczpn6rH1EPG33wpRrwKzbH4KOzwh5
 3j9eYZeE3ZBPpYSN3c1Mx4Vch9p+LY69Pd9TPa/5z3ImXtlUOVS1pT0jTH9sFM7T
 g3F40yAhJaPifICvvIP4R4wF1VoVwI5wnQdVWlw5Hl5uSyWjkQtyUHkjZ31YhTy5
 YkX16oZ7vJ3EChuY/JwnYqNTt8qtnnsUyMuGW+fxq+PFbLdhGBuYY8qyJDLQ+gAs
 Yg5UwbzqXUeRuE9SOa/rUVFjgXS80ghVIyVJ9olGUPdSy9apIkVl6VnrFEDOKAHK
 67+iFLGg22ypLI6XDyIY19TwKK3+CnAiOJa5gA685Vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MsmV9Z
 4JXukxzIFQdHmCny1TjoP05fwA8qrcsr9qy/s=; b=XVv6/YuxVmo5v0OdaTrYAs
 XdO15ZsvwDxYhcHX2jCLuwRL1Ue0J3RzQg+43qvd9Z+iHGU6GKfkCWn2UkcZUI97
 xVZ2mR3kH26WQGmS335PFRv7HXo62N/9SeY/ZlkePbKa0gjXt3RaDxmmOMUO7WnE
 JuoDYo/EwfQvP0wRny6Zujxy9NrEsNmtl1NS3kCyN8COWvSqArpuSioV/OW3VGno
 qsB4I6kx3W3MNarb64BljE3130iRuT1Ay68LQ6E9S0wc14XwoPCAeqQVa3Yp2KJF
 TN4fNqmEZlCDQrxYqD5wey4O7b8P6/1IZ9qCtp+ru0IyosBbpVezOrU+1FwteYDg
 ==
X-ME-Sender: <xms:oF2YX-ygThuCjsYQTyiVDSuKFtAdZZbA0-sSpqI5YcgYCV5UfETYYA>
 <xme:oF2YX6SolI7gXgecm3Zb8liOSjx0w-N7I6fODULifSD-ZqFWMSh7TpqrYXk2Z3cmS
 qf378B67_tdBzu1zBo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeelgddutdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuddvudfhkeekhefgffetffelgffftdehffduffegveetffehueeivddvjedv
 gfevnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:oF2YXwV-X-ueLSQi83KIk-gZkYQWJ3OH6QiQKTsSv--w_I60NNujiQ>
 <xmx:oF2YX0iSYModQthJsG4hldDrZTOHibVnSUSOtRBJwBxbqLhRnds6eA>
 <xmx:oF2YXwC9LnWThwlecR8Iri87T0H05xvtoJYnMbMv4i_mAaSjZeYcwQ>
 <xmx:ol2YX86NyPFR8-QKGroZZJOYKR5JVcHoypDJKku_NBDqt_s95ZlD9Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DED77328005D;
 Tue, 27 Oct 2020 13:49:19 -0400 (EDT)
Date: Tue, 27 Oct 2020 18:49:17 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v8 01/14] ASoC: sun4i-i2s: Change set_chan_cfg() params
Message-ID: <20201027174917.xushgbmiohxwydnh@gilmour.lan>
References: <20201026185239.379417-1-peron.clem@gmail.com>
 <20201026185239.379417-2-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="67cr3wcl2dnlxsfd"
Content-Disposition: inline
In-Reply-To: <20201026185239.379417-2-peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-sunxi@googlegroups.com, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
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


--67cr3wcl2dnlxsfd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 07:52:26PM +0100, Cl=E9ment P=E9ron wrote:
> As slots and slot_width can be set manually using set_tdm().
> These values are then kept in sun4i_i2s struct.
> So we need to check if these values are set or not.
>=20
> This is not done actually and will trigger a bug.
> For example, if we set to the simple soundcard in the device-tree
> dai-tdm-slot-width =3D <32> and then start a stream using S16_LE,
> currently we would calculate BCLK for 32-bit slots, but program
> lrck_period for 16-bit slots, making the sample rate double what we
> expected.
>=20
> To fix this, we need to check if these values are set or not but as
> this logic is already done by the caller. Avoid duplicating this
> logic and just pass the required values as params to set_chan_cfg().
>=20
> Suggested-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 33 ++++++++++++++++++---------------
>  1 file changed, 18 insertions(+), 15 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index f23ff29e7c1d..6c10f810b114 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -162,8 +162,9 @@ struct sun4i_i2s_quirks {
>  	unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
>  	s8	(*get_sr)(const struct sun4i_i2s *, int);
>  	s8	(*get_wss)(const struct sun4i_i2s *, int);
> -	int	(*set_chan_cfg)(const struct sun4i_i2s *,
> -				const struct snd_pcm_hw_params *);
> +	int	(*set_chan_cfg)(const struct sun4i_i2s *i2s,
> +				unsigned int channels,	unsigned int slots,
> +				unsigned int slot_width);
>  	int	(*set_fmt)(const struct sun4i_i2s *, unsigned int);
>  };
> =20
> @@ -399,10 +400,9 @@ static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2=
s *i2s, int width)
>  }
> =20
>  static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> -				  const struct snd_pcm_hw_params *params)
> +				  unsigned int channels, unsigned int slots,
> +				  unsigned int slot_width)
>  {
> -	unsigned int channels =3D params_channels(params);
> -
>  	/* Map the channels for playback and capture */
>  	regmap_write(i2s->regmap, SUN4I_I2S_TX_CHAN_MAP_REG, 0x76543210);
>  	regmap_write(i2s->regmap, SUN4I_I2S_RX_CHAN_MAP_REG, 0x00003210);
> @@ -419,15 +419,11 @@ static int sun4i_i2s_set_chan_cfg(const struct sun4=
i_i2s *i2s,
>  }
> =20
>  static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> -				  const struct snd_pcm_hw_params *params)
> +				  unsigned int channels, unsigned int slots,
> +				  unsigned int slot_width)
>  {
> -	unsigned int channels =3D params_channels(params);
> -	unsigned int slots =3D channels;
>  	unsigned int lrck_period;
> =20
> -	if (i2s->slots)
> -		slots =3D i2s->slots;
> -
>  	/* Map the channels for playback and capture */
>  	regmap_write(i2s->regmap, SUN8I_I2S_TX_CHAN_MAP_REG, 0x76543210);
>  	regmap_write(i2s->regmap, SUN8I_I2S_RX_CHAN_MAP_REG, 0x76543210);
> @@ -452,11 +448,11 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4=
i_i2s *i2s,
>  	case SND_SOC_DAIFMT_DSP_B:
>  	case SND_SOC_DAIFMT_LEFT_J:
>  	case SND_SOC_DAIFMT_RIGHT_J:
> -		lrck_period =3D params_physical_width(params) * slots;
> +		lrck_period =3D slot_width * slots;
>  		break;
> =20
>  	case SND_SOC_DAIFMT_I2S:
> -		lrck_period =3D params_physical_width(params);
> +		lrck_period =3D slot_width;
>  		break;
> =20
>  	default:
> @@ -480,9 +476,16 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substr=
eam *substream,
>  {
>  	struct sun4i_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
>  	unsigned int word_size =3D params_width(params);
> -	unsigned int slot_width =3D params_physical_width(params);
>  	unsigned int channels =3D params_channels(params);
> +
> +	/*
> +	 * Here and in set_chan_cfg(), "slots" means channels per frame +
> +	 * padding slots, regardless of format. "slot_width" means bits
> +	 * per sample + padding bits, regardless of format.
> +	 */
>  	unsigned int slots =3D channels;
> +	unsigned int slot_width =3D params_physical_width(params);
> +

what I meant was to put that comment next to the function pointer in the
structure sun4i_i2s_quirks, it would be fairly easy to miss here.

With that fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--67cr3wcl2dnlxsfd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5hdnQAKCRDj7w1vZxhR
xbuKAP4qVFe78UXC3b9DvZpYUdWGUCY/VGZSLSXi3GdDuCMVQAEA3j/Z7cbXxoBR
i6RGE6IeueH9LlJHR8Nvh9ySsrcOQAk=
=h45Y
-----END PGP SIGNATURE-----

--67cr3wcl2dnlxsfd--
