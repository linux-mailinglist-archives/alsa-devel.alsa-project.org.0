Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A82F128B476
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 14:17:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E0E5168D;
	Mon, 12 Oct 2020 14:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E0E5168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602505051;
	bh=Wnjst1aCa4mjnpb5ai20uIjEs8mQfDngZQAZs8y0/2c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y0E4aJfvCs9URCk9LEsiSrUe6Fvd7pq2XdiogADNhI2YbHFYJee/R8hF+tIIMLJ+5
	 Mbyoy9IRC6JXy1Kre4XSU/BvbF4o5GKzVXc2kvleiTeGnHgyiRnU5XvkZMwecVgrrb
	 MNyrgpEDNdnUzs/OLvhOGKCIbFbFujYOn3hk9tls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96BD3F800F6;
	Mon, 12 Oct 2020 14:15:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C799FF800F6; Mon, 12 Oct 2020 14:15:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 725CFF800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 14:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 725CFF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="ZsikuYpn"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Tq2O1ndJ"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id D95E05802D4;
 Mon, 12 Oct 2020 08:15:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 12 Oct 2020 08:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=IjmSkHG+RebQZ02RSsHtc/0Z3Iz
 8rbb2V+2upqrHWA0=; b=ZsikuYpnUfe/BcAE9hGG/bNtDltimbdoyEBcKt7oNpW
 up2AkMvGRClxsHuqleg0SN/UeBbvrFb4lLiIRdyNSggri8DO+PirdJZutbq/dKQ8
 gWaCmgMd59xknXxSEVH44DBve9zlpUA/+56L3GeryUXf7n+NypcLGoaMguscrMi/
 fcl2WA2nFNk+CzUcua0A742dU24gJyM0O5AfuIHo0jBbHNPUxcFvMwU8JQPA277K
 8qr9RCfbHQW1kalJ2+kEXzYjSyF+lVJyH6LcH42O+0r4XukcGU0Kf4te049aN3+v
 meWbLUFdNx7PEUCs88/dy2duzkPH9VB1uwKzXPWC91Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IjmSkH
 G+RebQZ02RSsHtc/0Z3Iz8rbb2V+2upqrHWA0=; b=Tq2O1ndJd8ICA9oWGdBruv
 zdIsy+vShHuiQkUBE1AZXBKPoFXwQJabmdHOkfX0JfGry8sdjePTISV43HsoKm0b
 5WYAIaCg2TYOLQD5Of63L7xTBsuDYC2ObbOALwBuyJMR2Mi2XgtKvEhEpkS8YiDa
 54wPyV5qtN9UNXZbrQ4abHGszxMeA5J5Vmy32uzEz9xxWo9ebwyQ1EMfzpQ0/4dV
 FyHxX2TA7SVlOlaAPGs/UlNodXJHeU7++8p0ScvC+B8tN0km6xdgo74y8BHfbqny
 3y6q5KFrrz9UtB3fFvgoFuLoRDSJd1ync6SGYok12whDerxd+KgNCoX9Rzo4jnqg
 ==
X-ME-Sender: <xms:6kiEX76_RIMqtvFagEOCsaA_HACioAiUTxle2mBwxYHqecQZDhIQvw>
 <xme:6kiEXw50qHeheJUB9rEvJfVAuCwfjevwwk8MJ9JpobXZlsB4UVfauirXCGFRQ7ofo
 _N3dyOuQvdIdamro_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrheejgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6kiEXydWRmObeY4odSoNSzicL44Pm28eCRjYuAREftK34zsOOl7SCQ>
 <xmx:6kiEX8IkMfnwblPlRAGsPC7ypK0qhabIadAe9GWzsiQ__zdxxAleDg>
 <xmx:6kiEX_K2DpzlfKa3zsfn1KQR12iTq-M2OCh8z0VeXn3E4zjInQshYg>
 <xmx:60iEX5AaQJ7zY5yXbovLQ3zaq5nEHK1Be7cXpkL135C3dHGr_TQvOA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D8154328005A;
 Mon, 12 Oct 2020 08:15:37 -0400 (EDT)
Date: Mon, 12 Oct 2020 14:15:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v6 02/14] ASoC: sun4i-i2s: Change set_chan_cfg() params
Message-ID: <20201012121536.z5d7kecdxaabw35n@gilmour.lan>
References: <20201003141950.455829-1-peron.clem@gmail.com>
 <20201003141950.455829-3-peron.clem@gmail.com>
 <20201005121307.v6jpyeyfi4kxc2cl@gilmour.lan>
 <CAJiuCcdd6_kzsxEERZbj2Budjmuyv6gV_sPG8LjLY=fk+MO8zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="phliouq6fvfyh5hw"
Content-Disposition: inline
In-Reply-To: <CAJiuCcdd6_kzsxEERZbj2Budjmuyv6gV_sPG8LjLY=fk+MO8zQ@mail.gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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


--phliouq6fvfyh5hw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 05, 2020 at 03:23:12PM +0200, Cl=E9ment P=E9ron wrote:
> On Mon, 5 Oct 2020 at 14:13, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Sat, Oct 03, 2020 at 04:19:38PM +0200, Cl=E9ment P=E9ron wrote:
> > > As slots and slot_width can be set manually using set_tdm().
> > > These values are then kept in sun4i_i2s struct.
> > > So we need to check if these values are setted or not
> > > in the struct.
> > >
> > > Avoid to check for this logic in set_chan_cfg(). This will
> > > duplicate the same check instead pass the required values
> > > as params to set_chan_cfg().
> > >
> > > This will also avoid a bug when we will enable 20/24bits support,
> > > i2s->slot_width is not actually used in the lrck_period computation.
> > >
> > > Suggested-by: Samuel Holland <samuel@sholland.org>
> > > Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> > > ---
> > >  sound/soc/sunxi/sun4i-i2s.c | 36 ++++++++++++++----------------------
> > >  1 file changed, 14 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > > index c5ccd423e6d3..1f577dbc20a6 100644
> > > --- a/sound/soc/sunxi/sun4i-i2s.c
> > > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > > @@ -177,8 +177,9 @@ struct sun4i_i2s_quirks {
> > >       unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
> > >       s8      (*get_sr)(const struct sun4i_i2s *, int);
> > >       s8      (*get_wss)(const struct sun4i_i2s *, int);
> > > -     int     (*set_chan_cfg)(const struct sun4i_i2s *,
> > > -                             const struct snd_pcm_hw_params *);
> > > +     int     (*set_chan_cfg)(const struct sun4i_i2s *i2s,
> > > +                             unsigned int channels,  unsigned int sl=
ots,
> > > +                             unsigned int slot_width);
> > >       int     (*set_fmt)(const struct sun4i_i2s *, unsigned int);
> > >  };
> > >
> > > @@ -414,10 +415,9 @@ static s8 sun8i_i2s_get_sr_wss(const struct sun4=
i_i2s *i2s, int width)
> > >  }
> > >
> > >  static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> > > -                               const struct snd_pcm_hw_params *param=
s)
> > > +                               unsigned int channels, unsigned int s=
lots,
> > > +                               unsigned int slot_width)
> > >  {
> > > -     unsigned int channels =3D params_channels(params);
> > > -
> > >       /* Map the channels for playback and capture */
> > >       regmap_write(i2s->regmap, SUN4I_I2S_TX_CHAN_MAP_REG, 0x76543210=
);
> > >       regmap_write(i2s->regmap, SUN4I_I2S_RX_CHAN_MAP_REG, 0x00003210=
);
> > > @@ -434,15 +434,11 @@ static int sun4i_i2s_set_chan_cfg(const struct =
sun4i_i2s *i2s,
> > >  }
> > >
> > >  static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> > > -                               const struct snd_pcm_hw_params *param=
s)
> > > +                               unsigned int channels, unsigned int s=
lots,
> > > +                               unsigned int slot_width)
> > >  {
> > > -     unsigned int channels =3D params_channels(params);
> > > -     unsigned int slots =3D channels;
> > >       unsigned int lrck_period;
> > >
> > > -     if (i2s->slots)
> > > -             slots =3D i2s->slots;
> > > -
> > >       /* Map the channels for playback and capture */
> > >       regmap_write(i2s->regmap, SUN8I_I2S_TX_CHAN_MAP_REG, 0x76543210=
);
> > >       regmap_write(i2s->regmap, SUN8I_I2S_RX_CHAN_MAP_REG, 0x76543210=
);
> > > @@ -467,11 +463,11 @@ static int sun8i_i2s_set_chan_cfg(const struct =
sun4i_i2s *i2s,
> > >       case SND_SOC_DAIFMT_DSP_B:
> > >       case SND_SOC_DAIFMT_LEFT_J:
> > >       case SND_SOC_DAIFMT_RIGHT_J:
> > > -             lrck_period =3D params_physical_width(params) * slots;
> > > +             lrck_period =3D slot_width * slots;
> > >               break;
> > >
> > >       case SND_SOC_DAIFMT_I2S:
> > > -             lrck_period =3D params_physical_width(params);
> > > +             lrck_period =3D slot_width;
> > >               break;
> > >
> > >       default:
> > > @@ -490,15 +486,11 @@ static int sun8i_i2s_set_chan_cfg(const struct =
sun4i_i2s *i2s,
> > >  }
> > >
> > >  static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> > > -                                   const struct snd_pcm_hw_params *p=
arams)
> > > +                                   unsigned int channels, unsigned i=
nt slots,
> > > +                                   unsigned int slot_width)
> > >  {
> > > -     unsigned int channels =3D params_channels(params);
> > > -     unsigned int slots =3D channels;
> > >       unsigned int lrck_period;
> > >
> > > -     if (i2s->slots)
> > > -             slots =3D i2s->slots;
> > > -
> > >       /* Map the channels for playback and capture */
> > >       regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP0_REG, 0xFED=
CBA98);
> > >       regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x765=
43210);
> > > @@ -525,11 +517,11 @@ static int sun50i_h6_i2s_set_chan_cfg(const str=
uct sun4i_i2s *i2s,
> > >       case SND_SOC_DAIFMT_DSP_B:
> > >       case SND_SOC_DAIFMT_LEFT_J:
> > >       case SND_SOC_DAIFMT_RIGHT_J:
> > > -             lrck_period =3D params_physical_width(params) * slots;
> > > +             lrck_period =3D slot_width * slots;
> > >               break;
> > >
> > >       case SND_SOC_DAIFMT_I2S:
> > > -             lrck_period =3D params_physical_width(params);
> > > +             lrck_period =3D slot_width;
> > >               break;
> > >
> > >       default:
> > > @@ -565,7 +557,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_sub=
stream *substream,
> > >       if (i2s->slot_width)
> > >               slot_width =3D i2s->slot_width;
> > >
> > > -     ret =3D i2s->variant->set_chan_cfg(i2s, params);
> > > +     ret =3D i2s->variant->set_chan_cfg(i2s, channels, slots, slot_w=
idth);
> >
> > Isn't slots and slot_width set to 0 here ?
>=20
> No, there is still a check before calling the set_cfg function.
>=20
>   unsigned int slot_width =3D params_physical_width(params);
>   unsigned int channels =3D params_channels(params);
>   unsigned int slots =3D channels;
>=20
>   if (i2s->slots)
>   slots =3D i2s->slots;
>=20
>   if (i2s->slot_width)
>   slot_width =3D i2s->slot_width;
>=20
> ret =3D i2s->variant->set_chan_cfg(i2s, channels, slots, slot_width);
>=20
> So slot_width will be equal to params_physical_width(params);
> like before

Still, it's not obvious what slots and slot_width are going to be set to
in a non-TDM setup where that doesn't really make much sense.

I assume you want to reduce the boilerplate, then we can make an helper
to get the frame size and the number of channels / slots if needed

Maxime

--phliouq6fvfyh5hw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX4RI6AAKCRDj7w1vZxhR
xWZ/AQCPwhn7X1Jytz5VV8NHRQXexz4dJIIusxesiha4X1AN/gEAr9v/2MjG2Wpg
A9g0xJSWTrZ3btCSWB5slUokdWcv9Q4=
=cLEy
-----END PGP SIGNATURE-----

--phliouq6fvfyh5hw--
