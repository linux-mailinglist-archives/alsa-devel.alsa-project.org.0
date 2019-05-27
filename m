Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E56A2B54A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 14:32:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A87C1795;
	Mon, 27 May 2019 14:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A87C1795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558960325;
	bh=JrkPkwiQwajf/pfvWa7DAAeSry7yXVnBa8N/2/nYQrA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pL0CngWbFz4ASUP1sLVBquz9MlzC0D69eVJMeBGTBAbcmm5A4YtyeyyUW+TdYlxW7
	 ndQfcTCoIVMvW/IHA4wc3HEnDmEM2TMHHkj+S64B8vrk3HXIvEpZHLbn6AbRkhh7m+
	 q+hsRjuXb+AZfu9Nj9UOFR9Y7RmBQpSuE88XtZO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DFEEF80730;
	Mon, 27 May 2019 14:30:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46663F896E4; Mon, 27 May 2019 14:29:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=PRX_BODY_26, RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C68A2F8065A
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 14:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C68A2F8065A
X-Originating-IP: 90.88.147.134
Received: from localhost (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr
 [90.88.147.134]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B5136C0003;
 Mon, 27 May 2019 12:28:57 +0000 (UTC)
Date: Mon, 27 May 2019 14:28:57 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Message-ID: <20190527122857.lphlgr7dc5z4f5o3@flea>
References: <20190525162323.20216-1-peron.clem@gmail.com>
 <20190525162323.20216-4-peron.clem@gmail.com>
 <20190526182410.soqb6bne6w66d5j6@flea>
 <CAJiuCce8UNbA+Ljkbw92ZJu3Ni6N9ciFKGsLtBYJ0_J8E1Gi2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJiuCce8UNbA+Ljkbw92ZJu3Ni6N9ciFKGsLtBYJ0_J8E1Gi2g@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v3 3/7] ASoC: sun4i-spdif: Add TX fifo bit
	flush quirks
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
Content-Type: multipart/mixed; boundary="===============6288939068418559135=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6288939068418559135==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5fgdhizk55u3fsr6"
Content-Disposition: inline


--5fgdhizk55u3fsr6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 26, 2019 at 09:00:30PM +0200, Cl=E9ment P=E9ron wrote:
> Hi Maxime,
>
> On Sun, 26 May 2019 at 20:24, Maxime Ripard <maxime.ripard@bootlin.com> w=
rote:
> >
> > On Sat, May 25, 2019 at 06:23:19PM +0200, Cl=E9ment P=E9ron wrote:
> > > Allwinner H6 has a different bit to flush the TX FIFO.
> > >
> > > Add a quirks to prepare introduction of H6 SoC.
> > >
> > > Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> > > ---
> > >  sound/soc/sunxi/sun4i-spdif.c | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-sp=
dif.c
> > > index b6c66a62e915..8317bbee0712 100644
> > > --- a/sound/soc/sunxi/sun4i-spdif.c
> > > +++ b/sound/soc/sunxi/sun4i-spdif.c
> > > @@ -166,10 +166,12 @@
> > >   *
> > >   * @reg_dac_tx_data: TX FIFO offset for DMA config.
> > >   * @has_reset: SoC needs reset deasserted.
> > > + * @reg_fctl_ftx: TX FIFO flush bitmask.
> >
> > It's a bit weird to use the same prefix for a register offset
> > (reg_dac_tx_data) and a value (reg_fctl_ftx).
>
> I just look at sun4i-codec and they use a regmap, But I think it's a
> bit overkill no?

For a single value, yeah

> What do you think about val_fctl_ftx ?

Looks good, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--5fgdhizk55u3fsr6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOvYCQAKCRDj7w1vZxhR
xWpYAQDonSAGR8IIIJfCwN6P7pyQ5D2rskJl7lfFfD4Mo5WZ8QD/aAaog6/za5ta
r3GfRL559CHukEIi7he29P416ycIjw0=
=3d9d
-----END PGP SIGNATURE-----

--5fgdhizk55u3fsr6--

--===============6288939068418559135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6288939068418559135==--
