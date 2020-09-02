Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BC825B369
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 20:08:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB4601885;
	Wed,  2 Sep 2020 20:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB4601885
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599070089;
	bh=aIo1BugXyYCiERDipcprFtdX21woMAMjZXxJiBWKQAM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q64e1i21lYz8kYmKf4UuWRN4k4f6M05+9L3SiiH/0dibk7N4a18Se1TFdjXZHTp9H
	 38K8GKJjXfygRfjYjVKGm2wP9QoMxSA1W1vDQcwgAg91iDWPfj0f2Z8KgKylVxzonS
	 zO54ygV9DpWOAQQ3F7tPN41Mfga+xUJQZZaiRjfo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5909F801DA;
	Wed,  2 Sep 2020 20:06:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0E28F8024A; Wed,  2 Sep 2020 20:06:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.siol.net (mailoutvs48.siol.net [185.57.226.239])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C468EF801DA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 20:06:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C468EF801DA
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id DC7AB526A96;
 Wed,  2 Sep 2020 20:06:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id JLXQv0_kZthx; Wed,  2 Sep 2020 20:06:13 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 5A4CB526A97;
 Wed,  2 Sep 2020 20:06:13 +0200 (CEST)
Received: from kista.localnet (cpe1-5-97.cable.triera.net [213.161.5.97])
 (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 8177A526A92;
 Wed,  2 Sep 2020 20:06:12 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: peron.clem@gmail.com, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [linux-sunxi] [PATCH 05/16] ASoc: sun4i-i2s: Add 20 and 24 bit
 support
Date: Wed, 02 Sep 2020 20:10:47 +0200
Message-ID: <9148679.oVN3Z7rve9@kista>
In-Reply-To: <1e320dfd-9388-54b2-dba9-7def0bf4bbad@sholland.org>
References: <20200704113902.336911-1-peron.clem@gmail.com>
 <20200704113902.336911-6-peron.clem@gmail.com>
 <1e320dfd-9388-54b2-dba9-7def0bf4bbad@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, linux-sunxi@googlegroups.com,
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

Hi Samuel!

Dne petek, 10. julij 2020 ob 07:44:51 CEST je Samuel Holland napisal(a):
> On 7/4/20 6:38 AM, Cl=E9ment P=E9ron wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> >=20
> > Extend the functionality of the driver to include support of 20 and
> > 24 bits per sample.
> >=20
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> > ---
> >=20
> >  sound/soc/sunxi/sun4i-i2s.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index f78167e152ce..bc7f9343bc7a 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -577,6 +577,9 @@ static int sun4i_i2s_hw_params(struct
> > snd_pcm_substream *substream,>=20
> >  	case 16:
> >  		width =3D DMA_SLAVE_BUSWIDTH_2_BYTES;
> >  		break;
> >=20
> > +	case 32:
> > +		width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> > +		break;
>=20
> This breaks the sun4i variants, because sun4i_i2s_get_wss returns 4 for a=
 32
> bit width, but it needs to return 3.

I'm not sure what has WSS with physical width and DMA?

>=20
> As a side note, I wonder why we use the physical width (the spacing betwe=
en
> samples in RAM) to drive the slot width. S24_LE takes up 4 bytes per samp=
le
> in RAM, which we need for DMA. But I don't see why we would want to
> transmit the padding over the wire. I would expect it to be transmitted t=
he
> same as S24_3LE (which has no padding). It did not matter before, because
> the only supported format had no padding.

Allwinner DMA engines support only 1, 2, 4 and sometimes 8 bytes for bus=20
width, so if sample is 24 bits in size, we have no other way but to transmi=
t=20
padding too.

Best regards,
Jernej

>=20
> Regards,
> Samuel
>=20
> >  	default:
> >  		dev_err(dai->dev, "Unsupported physical sample width:=20
%d\n",
> >  	=09
> >  			params_physical_width(params));
> >=20
> > @@ -1063,6 +1066,10 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai
> > *dai)>=20
> >  	return 0;
> > =20
> >  }
> >=20
> > +#define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
> > +			 SNDRV_PCM_FMTBIT_S20_LE | \
> > +			 SNDRV_PCM_FMTBIT_S24_LE)
> > +
> >=20
> >  static struct snd_soc_dai_driver sun4i_i2s_dai =3D {
> > =20
> >  	.probe =3D sun4i_i2s_dai_probe,
> >  	.capture =3D {
> >=20
> > @@ -1070,14 +1077,14 @@ static struct snd_soc_dai_driver sun4i_i2s_dai =
=3D {
> >=20
> >  		.channels_min =3D 1,
> >  		.channels_max =3D 8,
> >  		.rates =3D SNDRV_PCM_RATE_8000_192000,
> >=20
> > -		.formats =3D SNDRV_PCM_FMTBIT_S16_LE,
> > +		.formats =3D SUN4I_FORMATS,
> >=20
> >  	},
> >  	.playback =3D {
> >  =09
> >  		.stream_name =3D "Playback",
> >  		.channels_min =3D 1,
> >  		.channels_max =3D 8,
> >  		.rates =3D SNDRV_PCM_RATE_8000_192000,
> >=20
> > -		.formats =3D SNDRV_PCM_FMTBIT_S16_LE,
> > +		.formats =3D SUN4I_FORMATS,
> >=20
> >  	},
> >  	.ops =3D &sun4i_i2s_dai_ops,
> >  	.symmetric_rates =3D 1,




