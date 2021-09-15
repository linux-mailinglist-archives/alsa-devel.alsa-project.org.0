Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5090C40C710
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 16:07:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CED9417EE;
	Wed, 15 Sep 2021 16:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CED9417EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631714831;
	bh=Ws9yGIaeY4LwjCKo4SCOy48ayUoiS/Ue1HGfmbl/G/s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hkDxmx5/Na7kT6Cmyc52mdXMSGHgsWHqw5usUtiu3+oPKeqQzeymBZfG3NjNneuAm
	 gIwIe+zw23YG6QX/ztm4UpVql5QMvq+YfT//j8Qd/KXspBxy4/iSl4c6NBGxN2tgtl
	 ujBI87kbyCLj/3P3MXL96CAJRHbHZ36lPiZVANMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E494F80117;
	Wed, 15 Sep 2021 16:05:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9520DF8027C; Wed, 15 Sep 2021 16:05:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 565E8F80132
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 16:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 565E8F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AwCyOdY0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D18A9611C1;
 Wed, 15 Sep 2021 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631714743;
 bh=Ws9yGIaeY4LwjCKo4SCOy48ayUoiS/Ue1HGfmbl/G/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AwCyOdY0bug+kZb37qkxGrSn09F80r7jrtyHZoOvfS8WY9+KV6ZJ3vn/N01LXXRyo
 AE0/8tZE+ULn8n9nWNAfU8qdHwlrBx/9ySa+Chh96mA3HpaF5WxzF9Yq4yLOzOul8n
 u0wPrzEFzeFAGuQenmebT0HFDH+Bjl1nQ43JrWELInXP5MfO3hphSWkeWJyJAIiBB9
 VbdYpIB/5atHU23obtf9gc5oYdLoi5EV3umla/+DkQgPEtTfp7YP2874RE3UH5fjad
 JwPsSZwtOvhBMSKf+WBcO4s3X1BWHOXbEUoN9whm8+0NDJrPmhHLgV6PnCGU3S6k4U
 C4zKFMMbJiKKg==
Date: Wed, 15 Sep 2021 15:05:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH v4 1/4] ASoC: rockchip: add support for i2s-tdm controller
Message-ID: <20210915140502.GB12513@sirena.org.uk>
References: <20210903231536.225540-1-frattaroli.nicolas@gmail.com>
 <20210903231536.225540-2-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline
In-Reply-To: <20210903231536.225540-2-frattaroli.nicolas@gmail.com>
X-Cookie: The more the merrier.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-rockchip@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
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


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 04, 2021 at 01:15:33AM +0200, Nicolas Frattaroli wrote:

A few fairly small issues here, nothing too major:

> @@ -0,0 +1,1832 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * ALSA SoC Audio Layer - Rockchip I2S/TDM Controller driver

Please write the entire comment as a C++ one so it looks more
itentional. =20

> +	xfer_mask =3D (tx ? I2S_XFER_TXS_START : 0) |
> +		    (rx ? I2S_XFER_RXS_START : 0);
> +	xfer_val =3D (tx ? I2S_XFER_TXS_STOP : 0) |
> +		   (rx ? I2S_XFER_RXS_STOP : 0);

Please write normal conditional statements to improve legibility.

> +	spin_lock_irqsave(&i2s_tdm->lock, flags);
> +	if (on) {
> +		if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
> +			rockchip_enable_tde(i2s_tdm->regmap);
> +		else
> +			rockchip_enable_rde(i2s_tdm->regmap);
> +
> +		if (atomic_inc_return(&i2s_tdm->refcount) =3D=3D 1) {

Why do we need to use atomics here given that we're inside a spinlock?
Surely the spinlock is already providing adequate concurrency
protection.  I can't see any other points where we don't have the
spinlock already, and I'd be worried if we did.  This looks like it
could just be regular variables.

> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBS_CFS:

Please use the modern SOF_DAI_FMT_CBC_CFC defines.

> +	delta =3D (ppm < 0) ? -1 : 1;

Again, please write normal condiditional statements for legibility.

> +static int rockchip_i2s_tdm_clk_compensation_put(struct snd_kcontrol *kc=
ontrol,
> +						 struct snd_ctl_elem_value *ucontrol)
> +{

> +	return ret;
> +}

This should return 1 if the value changed.

> +static int __maybe_unused rockchip_i2s_tdm_resume(struct device *dev)
> +{
> +	struct rk_i2s_tdm_dev *i2s_tdm =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D pm_runtime_get_sync(dev);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D regcache_sync(i2s_tdm->regmap);
> +	pm_runtime_put(dev);

Runtime resume also does a regcache sync so why are we doing another one
here?

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFB/Y0ACgkQJNaLcl1U
h9Ayxgf+JrmINVP/kRYs9tAdJd1AAk2R/J6FzgsqYkoGs1jumY4BJKwqI6hCOlZP
1fl05QVBxFQwiYMCZpt4Rk/rCY43ZjcgmN78GEniVphrvsTMxBuU35HdFsmEehSp
CxSXwX9Uvza+9IHrMV/G/HFFUpoCpGj8DSvOXsgcfiRI4fZ0es0j7MPxftXt5uvs
dRzCtJDj/nXm5lcadR2TMJQ5GBQ9x8UyaEzG2E4bEJeKyARlx0NQAf2am3nArjWn
l97mreV2jf+77Jy3IA9Y2eyaCQQHLIbL5F5JoxyZc4IX5fWxXdW/PWUzTw6sWAwo
p2PZXOYxFwZY/TkFeZ9UkKROFucb4w==
=kat+
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
