Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3677E28B488
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 14:21:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D78B71681;
	Mon, 12 Oct 2020 14:21:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D78B71681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602505318;
	bh=B4t+KfWqSmCSHCEd0ufkA1rzFOgERXkshM93nNWrT0k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mMKADQGnaKqumCJDCCEagSY/f/FimobAsFj/YAQAcf0Jipf+Ed+pyRAmVvMZAGdAy
	 LuysBKIeDqHFSsIJIZRBJ3XhgWEe+PZ3+dx+Whjlz/rQzGdhe2yxcrGMyt9DeETC3r
	 ZdJQzJt0w7ncrJE0ZQUL5fyqGySx0or5gocAbdlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80143F80141;
	Mon, 12 Oct 2020 14:20:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C9EFF800F6; Mon, 12 Oct 2020 14:20:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB06DF800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 14:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB06DF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="Xy/zMa4d"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="lXopDwJa"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3AAFD5802DA;
 Mon, 12 Oct 2020 08:20:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 12 Oct 2020 08:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=fpCn2Eg+IK4oBYeSVSLlAMASPRL
 5vnQnK54Snb5HkKE=; b=Xy/zMa4dTp2NTIu6SMjGet9YyF1ed7XGtuJknevuSTn
 KFuVEGOSYbMpdmnamGget4U3Hl9O1H9uZhBrqlJ9SGd4IoaWqAMlUtywutKN+iCE
 MXA+fXurVVMyXjkWqp2IpA0VLJuKsOtIbih3y8nd/ywVGNij8zMFTcerb8bXEv64
 tS1vfUMoI0vp7aFdKD2TpO1TjjoimXAX0MwU+XFM+Z2Z3vM5N1yVfM/9/11Vm07c
 PvdnV2RSUB0k45aezLVk8MzHpMbdvoCx1JZBncVps21gwIYCeNAmAerxT6TjXpap
 5ZUQ4ZulbN6cn5bKWaMnBQUpQgYpBuA/YpC6AmlN0cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fpCn2E
 g+IK4oBYeSVSLlAMASPRL5vnQnK54Snb5HkKE=; b=lXopDwJaXUtkWNBvidP/m7
 dkSprpyIPFQmcE005zYdfhaqwHqKRl617ozfogeAl52Xw1AAHfn3oB8SkjU/6mBc
 /a41tz/sf4JbVH9vUXokTXC4enjUfoJi7c2gmocwKqd/vTQZYAKSqJxETVAOcDTC
 U6KUwclkg1E8wcb8w+Lr2B9+yJ0qu37jjNjNS4qVFWtHE76h+0GUuDEEtfEpoUWa
 fF9tC+ABT1/+FypW6LCFMyX59xbSrLA0F3ezjxuPRleslhwc5c2W+iv+gf6y8iaI
 8CUegT61JMIj7XUn4EqwKGNeeAK5tJEX/1jB5Rd4+GHlP+ZU53JozPKDfKJDT64Q
 ==
X-ME-Sender: <xms:G0qEX0rOpoTjgYMJ5yHaV-yUCceBA4Jk4W9lrwQZnM9kujoQSGSxYA>
 <xme:G0qEX6ptivggdWuZbHIkY_lESRVqai7zWmJwAlksw1f4eRWlG_ppcarn6xJrrXrkK
 UUG_SFlOXwbZFuZ4og>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrheejgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:G0qEX5PFj62TR6UJoVQmx4wxU8DcV2HyDUlBnziA1JtAR67caQe-IA>
 <xmx:G0qEX76dIPR7-U9lqVWo1CI6wCf6QtKIDFR6CTza3UIHqK1nuNUyDg>
 <xmx:G0qEXz6iB6s3OGE1k7DoALfSL9Aa_LZ8azI_YaP7Sjh1iys0hDjcfg>
 <xmx:HEqEX7x3TAlOMTUPSydChy7PI6IJVINREMQeMgxXov1SrfpCXyfi_Q>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CEBBA3280063;
 Mon, 12 Oct 2020 08:20:42 -0400 (EDT)
Date: Mon, 12 Oct 2020 14:20:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v6 02/14] ASoC: sun4i-i2s: Change set_chan_cfg() params
Message-ID: <20201012122041.nf6vrozeq3zq2kqj@gilmour.lan>
References: <20201003141950.455829-1-peron.clem@gmail.com>
 <20201003141950.455829-3-peron.clem@gmail.com>
 <20201005121307.v6jpyeyfi4kxc2cl@gilmour.lan>
 <fae04296-9865-3dcb-e02d-46062bf778a8@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z7kb5v5tpj7u77hs"
Content-Disposition: inline
In-Reply-To: <fae04296-9865-3dcb-e02d-46062bf778a8@sholland.org>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-sunxi@googlegroups.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
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


--z7kb5v5tpj7u77hs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 06, 2020 at 12:03:14AM -0500, Samuel Holland wrote:
> On 10/5/20 7:13 AM, Maxime Ripard wrote:
> > On Sat, Oct 03, 2020 at 04:19:38PM +0200, Cl=E9ment P=E9ron wrote:
> >> As slots and slot_width can be set manually using set_tdm().
> >> These values are then kept in sun4i_i2s struct.
> >> So we need to check if these values are setted or not
> >> in the struct.
> >>
> >> Avoid to check for this logic in set_chan_cfg(). This will
> >> duplicate the same check instead pass the required values
> >> as params to set_chan_cfg().
> >>
> >> This will also avoid a bug when we will enable 20/24bits support,
> >> i2s->slot_width is not actually used in the lrck_period computation.
> >>
> >> Suggested-by: Samuel Holland <samuel@sholland.org>
> >> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> >> ---
> >>  sound/soc/sunxi/sun4i-i2s.c | 36 ++++++++++++++----------------------
> >>  1 file changed, 14 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> >> index c5ccd423e6d3..1f577dbc20a6 100644
> >> --- a/sound/soc/sunxi/sun4i-i2s.c
> >> +++ b/sound/soc/sunxi/sun4i-i2s.c
> >> @@ -177,8 +177,9 @@ struct sun4i_i2s_quirks {
> >>  	unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
> >>  	s8	(*get_sr)(const struct sun4i_i2s *, int);
> >>  	s8	(*get_wss)(const struct sun4i_i2s *, int);
> >> -	int	(*set_chan_cfg)(const struct sun4i_i2s *,
> >> -				const struct snd_pcm_hw_params *);
> >> +	int	(*set_chan_cfg)(const struct sun4i_i2s *i2s,
> >> +				unsigned int channels,	unsigned int slots,
> >> +				unsigned int slot_width);
> >>  	int	(*set_fmt)(const struct sun4i_i2s *, unsigned int);
> >>  };
> >> =20
> >> @@ -414,10 +415,9 @@ static s8 sun8i_i2s_get_sr_wss(const struct sun4i=
_i2s *i2s, int width)
> >>  }
> >> =20
> >>  static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> >> -				  const struct snd_pcm_hw_params *params)
> >> +				  unsigned int channels, unsigned int slots,
> >> +				  unsigned int slot_width)
> >>  {
> >> -	unsigned int channels =3D params_channels(params);
> >> -
> >>  	/* Map the channels for playback and capture */
> >>  	regmap_write(i2s->regmap, SUN4I_I2S_TX_CHAN_MAP_REG, 0x76543210);
> >>  	regmap_write(i2s->regmap, SUN4I_I2S_RX_CHAN_MAP_REG, 0x00003210);
> >> @@ -434,15 +434,11 @@ static int sun4i_i2s_set_chan_cfg(const struct s=
un4i_i2s *i2s,
> >>  }
> >> =20
> >>  static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> >> -				  const struct snd_pcm_hw_params *params)
> >> +				  unsigned int channels, unsigned int slots,
> >> +				  unsigned int slot_width)
> >>  {
> >> -	unsigned int channels =3D params_channels(params);
> >> -	unsigned int slots =3D channels;
> >>  	unsigned int lrck_period;
> >> =20
> >> -	if (i2s->slots)
> >> -		slots =3D i2s->slots;
> >> -
> >>  	/* Map the channels for playback and capture */
> >>  	regmap_write(i2s->regmap, SUN8I_I2S_TX_CHAN_MAP_REG, 0x76543210);
> >>  	regmap_write(i2s->regmap, SUN8I_I2S_RX_CHAN_MAP_REG, 0x76543210);
> >> @@ -467,11 +463,11 @@ static int sun8i_i2s_set_chan_cfg(const struct s=
un4i_i2s *i2s,
> >>  	case SND_SOC_DAIFMT_DSP_B:
> >>  	case SND_SOC_DAIFMT_LEFT_J:
> >>  	case SND_SOC_DAIFMT_RIGHT_J:
> >> -		lrck_period =3D params_physical_width(params) * slots;
> >> +		lrck_period =3D slot_width * slots;
> >>  		break;
> >> =20
> >>  	case SND_SOC_DAIFMT_I2S:
> >> -		lrck_period =3D params_physical_width(params);
> >> +		lrck_period =3D slot_width;
> >>  		break;
> >> =20
> >>  	default:
> >> @@ -490,15 +486,11 @@ static int sun8i_i2s_set_chan_cfg(const struct s=
un4i_i2s *i2s,
> >>  }
> >> =20
> >>  static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> >> -				      const struct snd_pcm_hw_params *params)
> >> +				      unsigned int channels, unsigned int slots,
> >> +				      unsigned int slot_width)
> >>  {
> >> -	unsigned int channels =3D params_channels(params);
> >> -	unsigned int slots =3D channels;
> >>  	unsigned int lrck_period;
> >> =20
> >> -	if (i2s->slots)
> >> -		slots =3D i2s->slots;
> >> -
> >>  	/* Map the channels for playback and capture */
> >>  	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP0_REG, 0xFEDCBA98=
);
> >>  	regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x76543210=
);
> >> @@ -525,11 +517,11 @@ static int sun50i_h6_i2s_set_chan_cfg(const stru=
ct sun4i_i2s *i2s,
> >>  	case SND_SOC_DAIFMT_DSP_B:
> >>  	case SND_SOC_DAIFMT_LEFT_J:
> >>  	case SND_SOC_DAIFMT_RIGHT_J:
> >> -		lrck_period =3D params_physical_width(params) * slots;
> >> +		lrck_period =3D slot_width * slots;
> >>  		break;
> >> =20
> >>  	case SND_SOC_DAIFMT_I2S:
> >> -		lrck_period =3D params_physical_width(params);
> >> +		lrck_period =3D slot_width;
> >>  		break;
> >> =20
> >>  	default:
> >> @@ -565,7 +557,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_subs=
tream *substream,
> >>  	if (i2s->slot_width)
> >>  		slot_width =3D i2s->slot_width;
> >> =20
> >> -	ret =3D i2s->variant->set_chan_cfg(i2s, params);
> >> +	ret =3D i2s->variant->set_chan_cfg(i2s, channels, slots, slot_width);
> >=20
> > Isn't slots and slot_width set to 0 here ?
> >=20
> > And therefore, wouldn't we set lrck_period to 0 if we're using any
> > format but I2S?
> >=20
> > More importantly, I'm not really convinced this needs to be done, and it
> > introduces some side effects that are not explained.
>=20
> If I set dai-tdm-slot-width =3D <32> and start a stream using S16_LE,
> currently we would calculate BCLK for 32-bit slots, but program
> lrck_period for 16-bit slots, making the sample rate double what we
> expected. That sounds like a bug to me. (Because of that, as Chen-Yu
> mentioned in reply to v5, this should be the first patch in the series.)

I'm not denying that there's a bug though here :)

You've spent way more time than I did with this driver recently, so I
definitely take your word for it.

> Could you be more specific what side effects you are referring to?

I don't really like the change of semantics associated to the new
prototype, and it becomes less obvious what we're supposed to do with
slots and slot_width. Like, those are very TDM-y terms, are we supposed
to honour them when running in I2S, or should we just ignore them?

Maxime

--z7kb5v5tpj7u77hs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX4RKGAAKCRDj7w1vZxhR
xYi5AP4kX0Q+dHGX2Cx6jXMcXiMMTf3IKxRJD6Ia04QH56FSuwEA6XFXC0J1Wf0t
SdBHH14nRJv9tZbVyMLU+N67wO2mDAM=
=e1V4
-----END PGP SIGNATURE-----

--z7kb5v5tpj7u77hs--
