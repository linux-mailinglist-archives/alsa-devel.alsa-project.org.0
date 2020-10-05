Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1F6283548
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 14:02:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C5EF17FD;
	Mon,  5 Oct 2020 14:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C5EF17FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601899327;
	bh=kspolKfGLPL9vwK8uayq4n9RrTz79nO891ONVG29v7M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SlpcgnzzXqgYyHEp0+16g4Tx6JhndZ3NUcwif1+W2d6dhpNb1rAVAuHlUwgs+BgIR
	 1AXJjhJjvO+qjE6KJX0fH8XlFb9uqp8acPlJK6qU3U1O0HuyLMV8d/sOMnvHLR2oRh
	 9ob9qHOt4Emk6xnpi8tTiGyJdkZTEP6T1k5D5sKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C143CF80269;
	Mon,  5 Oct 2020 14:01:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C2B8F8025A; Mon,  5 Oct 2020 14:01:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7698EF80260
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 14:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7698EF80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="pZhpYsC9"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lTDgPjX8"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3349F5C0003;
 Mon,  5 Oct 2020 08:01:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 08:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=yClYW72mCVb7r8vezxG52GbXOQY
 kiKyQUgHWZrqdOgc=; b=pZhpYsC9wGMgMbPIIN9yPgjDfQuLZffjUJyPF8v0NVd
 vhHD+2BhnPX4a1+gdoI4zqRVl4Zr8cG3xTSmHY6ecVlZCSVDzOkTtzUY084fI6/i
 kfYcMn8CdfxiPIg27zY89jauzcMaNlyeDpwG5yxrwsk1oPixJ1Sqogmm4BA7JReI
 99Stb0IFHZhnaD8vXYCklHeeCKxfk9xJHqS90fcMFuqIVQqjqbaQIVvNE/g5JXW+
 d1+WtOdQ9sRr6yBij/MkozLVG4dzE+w6Z2oW8h9lQFTVbnbRyhNxzS2eiI7go+GN
 yvzh4cAszxmBb4ce/0TJkbDgr/VhXpv14a6k+pwVC7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yClYW7
 2mCVb7r8vezxG52GbXOQYkiKyQUgHWZrqdOgc=; b=lTDgPjX81/mJHePBssDdOr
 SmzhOa/rJi2RrtFoJ700e7ofmIOoB5C9LqUk0UaACP4cKzCiR8IDk9XaGZOsLQJH
 h8NUzYSY30OJsBpdgyYXUJEhegt1ouQAld49pJ79gdUCBNSIf+lq1l1d+pZGE8ke
 pypQIU7Rdg1d9XeEVy9ZpGOts8u5sAOmOk7hnODGlPJPBqnOJhCQOxsyEJ40riCG
 tkW+oHGG/IWuPTZxqLtBqHKprqeb20KmpE0LfKJtLyCmQkVR9hW1JENTYeyeunxQ
 laeF4SxGR8BzP6JtT+CCwYdcELe34Cfixl7kkbLMpa5OcAlCumi0Sk8Q/aIjwwmg
 ==
X-ME-Sender: <xms:_wp7XzKh1Shab2R4fPfceQdpS4G-Gx-BKYPwMN9VW-3CdRLLBb6ukA>
 <xme:_wp7X3Kq1o8x0OhcCs1OVvgHHa03_-zADMP8GCwwfXUcv-Unaefluwd9vwWVWbpUY
 r9bMDIZ8LlC3JMMB7k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedvnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_wp7X7tWARBYIOrVuCnCcskAOnkYrqWkhhmC-A5h2TDLGBt0O7y3QA>
 <xmx:_wp7X8ZbxWcv5Yjkl06K0ei_274FN4Cci4pTBFOxh4HQG99ZbYok2A>
 <xmx:_wp7X6a7RwrH39INMpE26ubu15JjFmNtEV1XifBXfxS6q0K95Yq2Pg>
 <xmx:AQt7Xy615yAuVzZ07iG5TjZK1EBEAUBA54Im6pk2aByFR7N4pJf6Pw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DE751328005D;
 Mon,  5 Oct 2020 08:01:02 -0400 (EDT)
Date: Mon, 5 Oct 2020 14:01:01 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 20/25] ASoC: sun8i-codec: Protect the clock rate while
 streams are open
Message-ID: <20201005120101.igzzwosnq6bzbua6@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-21-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xow6snhlx3rrb7vu"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-21-samuel@sholland.org>
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


--xow6snhlx3rrb7vu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 09:11:43PM -0500, Samuel Holland wrote:
> The codec's clock input is shared among all AIFs, and shared with other
> audio-related hardware in the SoC, including I2S and SPDIF controllers.
> To ensure sample rates selected by userspace or by codec2codec DAI links
> are maintained, the clock rate must be protected while it is in use.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  sound/soc/sunxi/sun8i-codec.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>=20
> diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
> index 501af64d43a0..86065bee7cd3 100644
> --- a/sound/soc/sunxi/sun8i-codec.c
> +++ b/sound/soc/sunxi/sun8i-codec.c
> @@ -416,27 +416,32 @@ static int sun8i_codec_get_lrck_div_order(unsigned =
int slots,
>  	unsigned int div =3D slots * slot_width;
> =20
>  	if (div < 16 || div > 256)
>  		return -EINVAL;
> =20
>  	return order_base_2(div);
>  }
> =20
> +static unsigned int sun8i_codec_get_sysclk_rate(unsigned int sample_rate)
> +{
> +	return sample_rate % 4000 ? 22579200 : 24576000;
> +}
> +
>  static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
>  				 struct snd_pcm_hw_params *params,
>  				 struct snd_soc_dai *dai)
>  {
>  	struct sun8i_codec *scodec =3D snd_soc_dai_get_drvdata(dai);
>  	struct sun8i_codec_aif *aif =3D &scodec->aifs[dai->id];
>  	unsigned int sample_rate =3D params_rate(params);
>  	unsigned int slots =3D aif->slots ?: params_channels(params);
>  	unsigned int slot_width =3D aif->slot_width ?: params_width(params);
> -	unsigned int sysclk_rate =3D clk_get_rate(scodec->clk_module);
> -	int lrck_div_order, word_size;
> +	unsigned int sysclk_rate =3D sun8i_codec_get_sysclk_rate(sample_rate);
> +	int lrck_div_order, ret, word_size;
>  	u8 bclk_div;
> =20
>  	/* word size */
>  	switch (params_width(params)) {
>  	case 8:
>  		word_size =3D 0x0;
>  		break;
>  	case 16:
> @@ -466,17 +471,30 @@ static int sun8i_codec_hw_params(struct snd_pcm_sub=
stream *substream,
>  			   (lrck_div_order - 4) << SUN8I_AIF1CLK_CTRL_AIF1_LRCK_DIV);
> =20
>  	/* BCLK divider (SYSCLK/BCLK ratio) */
>  	bclk_div =3D sun8i_codec_get_bclk_div(sysclk_rate, lrck_div_order, samp=
le_rate);
>  	regmap_update_bits(scodec->regmap, SUN8I_AIF1CLK_CTRL,
>  			   SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV_MASK,
>  			   bclk_div << SUN8I_AIF1CLK_CTRL_AIF1_BCLK_DIV);
> =20
> -	if (!aif->open_streams) {
> +	/* SYSCLK rate */
> +	if (aif->open_streams) {
> +		ret =3D clk_set_rate(scodec->clk_module, sysclk_rate);
> +		if (ret < 0)
> +			return ret;
> +	} else {
> +		ret =3D clk_set_rate_exclusive(scodec->clk_module, sysclk_rate);

It's not really clear to me why we wouldn't want to always protect the
clock rate here?

> +		if (ret =3D=3D -EBUSY)
> +			dev_err(dai->dev, "%s: clock is busy! Sample rate %u Hz "
> +				"conflicts with other audio streams.\n",

This string creates a checkpatch warning.

Maxime

--xow6snhlx3rrb7vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3sK/QAKCRDj7w1vZxhR
xVLkAP4hIB2awoa9XnA3qw/e876lz55xD9JGfuLEcPapPmg7dwD9FAHKATibgz9D
69JXf5hJVoPQViTTUTiAEbh6FWdAYg4=
=BDeK
-----END PGP SIGNATURE-----

--xow6snhlx3rrb7vu--
