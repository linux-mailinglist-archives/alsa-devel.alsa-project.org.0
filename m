Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEA2D9472
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 16:55:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B4D9857;
	Wed, 16 Oct 2019 16:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B4D9857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571237738;
	bh=SgEMkL0xRU7IND7xy0OvUeZKm1NZoC5L97aLvyBeIxs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mlg39zbi/lWP3ZDCdiNcVwTLsnYfcSPNottGn75f7SNKil7LXHSZMQLFmCV5GkPuC
	 WPLpFMysvlC8lwSHhLqaRvGMdVSU5fl+DEHZ0p5W4noLGk6Hndq/jWq2Z6rrp/c6lD
	 RGLFgghujT7fsquraRTYnXWAyUtb9/2BUYHw2hZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E93FCF8036C;
	Wed, 16 Oct 2019 16:53:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78129F80362; Wed, 16 Oct 2019 16:53:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4CAFF80322
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 16:53:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4CAFF80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="x7w7DZ/g"
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4985F2168B;
 Wed, 16 Oct 2019 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571237627;
 bh=uc/PYalgTjzCCWhp6PA2rkYtBpjEkTRPLPZjqrQyptI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=x7w7DZ/gRhixI5aXMMHU39O2Ro3sO/7sBmGkF+zzkpkPrptyR9+jc4MEcN7v509e9
 Zg5kAUqeRoB9qzys+P36C2PI+bAfPTelA9JfB1RJB/FGqDk57u3ph7ZaakwdFs7iRm
 2UxhvNWaIWWezJxjUZVD3w+9mEyjt/+qlNHsYyqY=
Date: Wed, 16 Oct 2019 16:53:45 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Code Kipper <codekipper@gmail.com>
Message-ID: <20191016145345.ll2igr2j5zttosjj@gilmour>
References: <20191016070740.121435-1-codekipper@gmail.com>
 <20191016070740.121435-3-codekipper@gmail.com>
 <20191016080653.3seixioa2xiaobd7@gilmour>
 <CAEKpxBmuYe-kHpa4cvo6iabTM_qNro2hXVAkjioBZFt9N4pHdA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEKpxBmuYe-kHpa4cvo6iabTM_qNro2hXVAkjioBZFt9N4pHdA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v6 2/7] ASoC: sun4i-i2s: Add functions for
 RX and TX channel offsets
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
Content-Type: multipart/mixed; boundary="===============7741116471127264195=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7741116471127264195==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jby4uz6cwklukmi6"
Content-Disposition: inline


--jby4uz6cwklukmi6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 16, 2019 at 10:25:29AM +0200, Code Kipper wrote:
> On Wed, 16 Oct 2019 at 10:06, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > Hi,
> >
> > On Wed, Oct 16, 2019 at 09:07:35AM +0200, codekipper@gmail.com wrote:
> > > From: Marcus Cooper <codekipper@gmail.com>
> > >
> > > Newer SoCs like the H6 have the channel offset bits in a different
> > > position to what is on the H3. As we will eventually add multi-
> > > channel support then create function calls as opposed to regmap
> > > fields to add support for different devices.
> > >
> > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > ---
> > >  sound/soc/sunxi/sun4i-i2s.c | 31 +++++++++++++++++++++++++------
> > >  1 file changed, 25 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > > index f1a80973c450..875567881f30 100644
> > > --- a/sound/soc/sunxi/sun4i-i2s.c
> > > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > > @@ -157,6 +157,8 @@ struct sun4i_i2s_quirks {
> > >       int     (*set_chan_cfg)(const struct sun4i_i2s *,
> > >                               const struct snd_pcm_hw_params *);
> > >       int     (*set_fmt)(struct sun4i_i2s *, unsigned int);
> > > +     void    (*set_txchanoffset)(const struct sun4i_i2s *, int);
> > > +     void    (*set_rxchanoffset)(const struct sun4i_i2s *);
> >
> > The point of removing the regmap_field was that because having a
> > one-size-fits-all function with regmap_field sort of making the
> > abstraction was becoming more and more of a burden to maintain.
> >
> > Having functions for each and every register access is exactly the
> > same as using regmap_field here, and the issue we adressed is not with
> > regmap_fields in itself.
> >
> > If the H6 has a different register layout, then so be it, create a new
> > set_chan_cfg or set_fmt function for the H6.
>
> The H3 and the H6 have a similar register layout but the issue here
> is that sooner rather than later we would want to be supporting
> multi-channel audio which requires the offset to be applied to each
> TX channel channel select register(8chan PCM for HDMI requires 4 Tx
> channels). Currently we're only using one.

So, as it turns out, they do not have the same register layout?

Maxime

--jby4uz6cwklukmi6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXacu+QAKCRDj7w1vZxhR
xbpWAQD9d7cqPH+6+SLdgcA51ULmYTV+ruv2fADxYhKJiST9+AD/UEhef7PZqkGw
6nq7Em4kSoD7ip5xtYFAHDOWzTFGUgk=
=IAvd
-----END PGP SIGNATURE-----

--jby4uz6cwklukmi6--

--===============7741116471127264195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7741116471127264195==--
