Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1F62925BB
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Oct 2020 12:26:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D8FC171C;
	Mon, 19 Oct 2020 12:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D8FC171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603103198;
	bh=CcZkRzv51fQUJdjdNzY/ybRV6AAPgmo9C0jJDQ7LIVU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o6LUAiyZSHyFFo8DtO5uGdgscOL90kz7eD6NatVS8GnlTWldZ0s/8Lmd+7iVm/3yE
	 2nX5GkVxX96BMFszd7vi/KIu90mG4jFt1Bb3FfR3jk7gZhyoy+k+MJpwQaAby5XJe4
	 ZWvFlA7VrEpSUo3vBbNWkRoBeZgVGfpKEXlWECo8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFEBCF80264;
	Mon, 19 Oct 2020 12:24:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5202DF80121; Mon, 19 Oct 2020 12:24:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D62CF80121
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 12:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D62CF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="tLvxFNdE"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="aUGDBfbV"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 38166580558;
 Mon, 19 Oct 2020 06:24:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 19 Oct 2020 06:24:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Td6tAGmJFIbrreS4S0VbmmmyOxu
 q1F5FXo5CYCYTRrU=; b=tLvxFNdEHvCoy1VNz055wzFMI1uNlL1JXvy9gp+bzPE
 TpFX7yCLwpr0kfy0wbC6x8eYyC9+c6+S9mWYZZlqleboZJHg4RsV12dulh3WyDpQ
 XYm0jR/v2w1wiem7dVs6Q5xsh8yD3k9TaeMeN2eLJaloOA8+V/RCFuKh6MheixPR
 Xzkgjs2M87ZBpm3pqTOdZws3Rmu/JmnnQ0ygd9uob0WgR9CbWB0uqlH+xmsyozue
 KIr/rYmL3TRuIz8mddfT+qxJFQHAonKtWpxGdOkMg+Siyqs6RTpVsZV8PMN2mpA7
 0SsbDjmhbwT3daFLc4/+L0nJ2QnnxVdTvdumzyAGexQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Td6tAG
 mJFIbrreS4S0VbmmmyOxuq1F5FXo5CYCYTRrU=; b=aUGDBfbVD6+IYzxw3fpDfU
 tTmMvGQNagv6IC7KmRUYN87zCx8MtinmQe2i6kIxmVT3ywhnoM2jSyWinQHqd9xT
 06YJq/RMjN99/bnijz1UskLoH8fOov9gKdloDVb78tO5zxK9f3Kdq1cSUc7dLrf/
 WZci/WLDtVFFOUEyJe7Gvaw4BB6f9BrKmKt46FkNLivX1kvpk4WMTAlryK3xOHRg
 ZPO6wzB1a78GxaIxnVs+w9irmoL//FfCsx6MZjS1K7EiEHreSidNUcxCNXLN1TF2
 dckufScOwdog0mYIrCkk825s8akN1OwoRoR4kdgm4U7zqVXbPWBwelmag+8IU3wg
 ==
X-ME-Sender: <xms:bGmNXzf3R2fEqFfFDNOe_V3kvIdwQqdjuIKCSTmOXfTZgPcKLDlfkw>
 <xme:bGmNX5PIaYIs-Fc87ZYpJbguO5Sn80sEI9rsmVSS1DadXdnI49OoU1n7bnXIRyWbP
 osZJo0v6o3DY0a2jzo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjedugddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bGmNX8jQIurR8RYJbjDho-dL_giZeln_ecHe2tw50Wy7MTfw7pVsbA>
 <xmx:bGmNX08BqiVxdp2pgo8Xtv5bLNZ9KYFtPkyHvd6efmVhhyfU7UfS8g>
 <xmx:bGmNX_tMp7lzYO8dd5DZSWPTGUyHTv0AgwocgL9eSIous9IYDNvWEg>
 <xmx:bmmNX4FMhrM3gmHXxgyWcQD4jbB3CsH2_li18NtmLBSOoabOHXFuKQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 60A3C3064682;
 Mon, 19 Oct 2020 06:24:44 -0400 (EDT)
Date: Mon, 19 Oct 2020 12:24:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v6 02/14] ASoC: sun4i-i2s: Change set_chan_cfg() params
Message-ID: <20201019102443.uk3t2jcqc7x7rxdi@gilmour.lan>
References: <20201003141950.455829-1-peron.clem@gmail.com>
 <20201003141950.455829-3-peron.clem@gmail.com>
 <20201005121307.v6jpyeyfi4kxc2cl@gilmour.lan>
 <CAJiuCcdd6_kzsxEERZbj2Budjmuyv6gV_sPG8LjLY=fk+MO8zQ@mail.gmail.com>
 <20201012121536.z5d7kecdxaabw35n@gilmour.lan>
 <0d6f0693-5ca9-9b48-4d33-a969bd5b1b1b@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="urhrplc5wjap7cxi"
Content-Disposition: inline
In-Reply-To: <0d6f0693-5ca9-9b48-4d33-a969bd5b1b1b@sholland.org>
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
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


--urhrplc5wjap7cxi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Mon, Oct 12, 2020 at 08:15:30PM -0500, Samuel Holland wrote:
> On 10/12/20 7:15 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Oct 05, 2020 at 03:23:12PM +0200, Cl=E9ment P=E9ron wrote:
> >> On Mon, 5 Oct 2020 at 14:13, Maxime Ripard <maxime@cerno.tech> wrote:
> >>>
> >>> On Sat, Oct 03, 2020 at 04:19:38PM +0200, Cl=E9ment P=E9ron wrote:
> >>>> As slots and slot_width can be set manually using set_tdm().
> >>>> These values are then kept in sun4i_i2s struct.
> >>>> So we need to check if these values are setted or not
> >>>> in the struct.
> >>>>
> >>>> Avoid to check for this logic in set_chan_cfg(). This will
> >>>> duplicate the same check instead pass the required values
> >>>> as params to set_chan_cfg().
> >>>>
> >>>> This will also avoid a bug when we will enable 20/24bits support,
> >>>> i2s->slot_width is not actually used in the lrck_period computation.
> >>>>
> >>>> Suggested-by: Samuel Holland <samuel@sholland.org>
> >>>> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> >>>> ---
> >>>>  sound/soc/sunxi/sun4i-i2s.c | 36 ++++++++++++++--------------------=
--
> >>>>  1 file changed, 14 insertions(+), 22 deletions(-)
> >>>>
> >>>> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s=
=2Ec
> >>>> index c5ccd423e6d3..1f577dbc20a6 100644
> >>>> --- a/sound/soc/sunxi/sun4i-i2s.c
> >>>> +++ b/sound/soc/sunxi/sun4i-i2s.c
> >>>> @@ -177,8 +177,9 @@ struct sun4i_i2s_quirks {
> >>>>       unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *=
);
> >>>>       s8      (*get_sr)(const struct sun4i_i2s *, int);
> >>>>       s8      (*get_wss)(const struct sun4i_i2s *, int);
> >>>> -     int     (*set_chan_cfg)(const struct sun4i_i2s *,
> >>>> -                             const struct snd_pcm_hw_params *);
> >>>> +     int     (*set_chan_cfg)(const struct sun4i_i2s *i2s,
> >>>> +                             unsigned int channels,  unsigned int s=
lots,
> >>>> +                             unsigned int slot_width);
> >>>>       int     (*set_fmt)(const struct sun4i_i2s *, unsigned int);
> >>>>  };
> >>>>
> >>>> @@ -414,10 +415,9 @@ static s8 sun8i_i2s_get_sr_wss(const struct sun=
4i_i2s *i2s, int width)
> >>>>  }
> >>>>
> >>>>  static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> >>>> -                               const struct snd_pcm_hw_params *para=
ms)
> >>>> +                               unsigned int channels, unsigned int =
slots,
> >>>> +                               unsigned int slot_width)
> >>>>  {
> >>>> -     unsigned int channels =3D params_channels(params);
> >>>> -
> >>>>       /* Map the channels for playback and capture */
> >>>>       regmap_write(i2s->regmap, SUN4I_I2S_TX_CHAN_MAP_REG, 0x7654321=
0);
> >>>>       regmap_write(i2s->regmap, SUN4I_I2S_RX_CHAN_MAP_REG, 0x0000321=
0);
> >>>> @@ -434,15 +434,11 @@ static int sun4i_i2s_set_chan_cfg(const struct=
 sun4i_i2s *i2s,
> >>>>  }
> >>>>
> >>>>  static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> >>>> -                               const struct snd_pcm_hw_params *para=
ms)
> >>>> +                               unsigned int channels, unsigned int =
slots,
> >>>> +                               unsigned int slot_width)
> >>>>  {
> >>>> -     unsigned int channels =3D params_channels(params);
> >>>> -     unsigned int slots =3D channels;
> >>>>       unsigned int lrck_period;
> >>>>
> >>>> -     if (i2s->slots)
> >>>> -             slots =3D i2s->slots;
> >>>> -
> >>>>       /* Map the channels for playback and capture */
> >>>>       regmap_write(i2s->regmap, SUN8I_I2S_TX_CHAN_MAP_REG, 0x7654321=
0);
> >>>>       regmap_write(i2s->regmap, SUN8I_I2S_RX_CHAN_MAP_REG, 0x7654321=
0);
> >>>> @@ -467,11 +463,11 @@ static int sun8i_i2s_set_chan_cfg(const struct=
 sun4i_i2s *i2s,
> >>>>       case SND_SOC_DAIFMT_DSP_B:
> >>>>       case SND_SOC_DAIFMT_LEFT_J:
> >>>>       case SND_SOC_DAIFMT_RIGHT_J:
> >>>> -             lrck_period =3D params_physical_width(params) * slots;
> >>>> +             lrck_period =3D slot_width * slots;
> >>>>               break;
> >>>>
> >>>>       case SND_SOC_DAIFMT_I2S:
> >>>> -             lrck_period =3D params_physical_width(params);
> >>>> +             lrck_period =3D slot_width;
> >>>>               break;
> >>>>
> >>>>       default:
> >>>> @@ -490,15 +486,11 @@ static int sun8i_i2s_set_chan_cfg(const struct=
 sun4i_i2s *i2s,
> >>>>  }
> >>>>
> >>>>  static int sun50i_h6_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> >>>> -                                   const struct snd_pcm_hw_params *=
params)
> >>>> +                                   unsigned int channels, unsigned =
int slots,
> >>>> +                                   unsigned int slot_width)
> >>>>  {
> >>>> -     unsigned int channels =3D params_channels(params);
> >>>> -     unsigned int slots =3D channels;
> >>>>       unsigned int lrck_period;
> >>>>
> >>>> -     if (i2s->slots)
> >>>> -             slots =3D i2s->slots;
> >>>> -
> >>>>       /* Map the channels for playback and capture */
> >>>>       regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP0_REG, 0xFE=
DCBA98);
> >>>>       regmap_write(i2s->regmap, SUN50I_H6_I2S_TX_CHAN_MAP1_REG, 0x76=
543210);
> >>>> @@ -525,11 +517,11 @@ static int sun50i_h6_i2s_set_chan_cfg(const st=
ruct sun4i_i2s *i2s,
> >>>>       case SND_SOC_DAIFMT_DSP_B:
> >>>>       case SND_SOC_DAIFMT_LEFT_J:
> >>>>       case SND_SOC_DAIFMT_RIGHT_J:
> >>>> -             lrck_period =3D params_physical_width(params) * slots;
> >>>> +             lrck_period =3D slot_width * slots;
> >>>>               break;
> >>>>
> >>>>       case SND_SOC_DAIFMT_I2S:
> >>>> -             lrck_period =3D params_physical_width(params);
> >>>> +             lrck_period =3D slot_width;
> >>>>               break;
> >>>>
> >>>>       default:
> >>>> @@ -565,7 +557,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_su=
bstream *substream,
> >>>>       if (i2s->slot_width)
> >>>>               slot_width =3D i2s->slot_width;
> >>>>
> >>>> -     ret =3D i2s->variant->set_chan_cfg(i2s, params);
> >>>> +     ret =3D i2s->variant->set_chan_cfg(i2s, channels, slots, slot_=
width);
> >>>
> >>> Isn't slots and slot_width set to 0 here ?
> >>
> >> No, there is still a check before calling the set_cfg function.
> >>
> >>   unsigned int slot_width =3D params_physical_width(params);
> >>   unsigned int channels =3D params_channels(params);
> >>   unsigned int slots =3D channels;
> >>
> >>   if (i2s->slots)
> >>   slots =3D i2s->slots;
> >>
> >>   if (i2s->slot_width)
> >>   slot_width =3D i2s->slot_width;
> >>
> >> ret =3D i2s->variant->set_chan_cfg(i2s, channels, slots, slot_width);
> >>
> >> So slot_width will be equal to params_physical_width(params);
> >> like before
> >=20
> > Still, it's not obvious what slots and slot_width are going to be set to
> > in a non-TDM setup where that doesn't really make much sense.
>=20
> My understanding is:
>=20
> "slots" is channels per frame + padding slots, regardless of format.
> "slot_width" is bits per sample + padding bits, regardless of format.
>=20
> Some formats may require or prohibit certain padding, but that has no
> effect on the definitions.
>=20
> That seems clear to me? At least that's what I implemented (and you
> acked) in sun8i-codec.

Yeah I guess you're right. I'd still like at least a comment on top of
the function making that clear so that no-one's confused

Maxime

--urhrplc5wjap7cxi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX41pawAKCRDj7w1vZxhR
xYUgAP0fS7UeBMbxq9TXFjjdmI4nhIkUjidFQu6rAq5B7fp2dAEAuuQOWfOG/d5x
iCm5/7j2TfRmAZ0Ztp4lqlRorX0uZgw=
=qa21
-----END PGP SIGNATURE-----

--urhrplc5wjap7cxi--
