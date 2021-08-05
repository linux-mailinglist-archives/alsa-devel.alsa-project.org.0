Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AA23E181F
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Aug 2021 17:36:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17C9B1683;
	Thu,  5 Aug 2021 17:35:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17C9B1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628177774;
	bh=FMZKr/KFT+VimHSBq67dJBliXzA9cWOYESblfOOwgiM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D2boZPfOBpwUttS+kA5OqCb8Wh6g+Gi4PFNwrBvsSm1y6rA+Vgb56pi4Ot9iaJQyO
	 AUWIl7kreL5YJIPZoXrCZsgDyB6BSZRK4IJ9lRZS/disLmmyiM4YY0vSiFIDxOJ1gh
	 jvHmkLto6aJZpjoPxyV13RmwLUCmYWZ081JG03OQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95BB0F8032C;
	Thu,  5 Aug 2021 17:34:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD2F9F802E8; Thu,  5 Aug 2021 17:34:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC058F8010A
 for <alsa-devel@alsa-project.org>; Thu,  5 Aug 2021 17:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC058F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lLckpamQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82B6C60F35;
 Thu,  5 Aug 2021 15:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628177675;
 bh=FMZKr/KFT+VimHSBq67dJBliXzA9cWOYESblfOOwgiM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lLckpamQ9/9P8u24pAXto1YLgGIMkDXWJoIiLY8v1DWc+VVs8habQITcM3jG+t1Bz
 kcT6dY0aY4Fs2OgqiXsMdl44iV+e6ILAc3D7teX1l5xbeNnx3WkKcubYotm9xKWu6y
 pKQeUiv1XXbdL4+fuiEAr7hplfTiIUYoAwpEY6WUrDGh4oYpMi+y61CixOasNh4MsZ
 ooPqY5tB4Z6I+/nwxk5p94KNdlum1qXuiLAbK2OxRXsHNT2mARhwaYfZG2a8zHlHlz
 gdNbffT/2o3d3pbQifB8NQalgLw7onTyAh22JkkT+OrwTtzZFvBogl9OMYTaKYTI0y
 7sILAG92wjPkw==
Date: Thu, 5 Aug 2021 16:34:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 2/3] sound: soc: sh: Add RZ/G2L SSIF-2 driver
Message-ID: <20210805153420.GQ26252@sirena.org.uk>
References: <20210729172311.31111-1-biju.das.jz@bp.renesas.com>
 <20210729172311.31111-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4dIe/AmYstFUGHTF"
Content-Disposition: inline
In-Reply-To: <20210729172311.31111-3-biju.das.jz@bp.renesas.com>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das@bp.renesas.com>
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


--4dIe/AmYstFUGHTF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 29, 2021 at 06:23:10PM +0100, Biju Das wrote:

> +config SND_SOC_RZ
> +	tristate "RZ/G2L series SSIF-2 support"
> +	depends on ARCH_R9A07G044 || COMPILE_TEST
> +	select SND_SIMPLE_CARD
> +	help

Why is the DAI selecting a specific sound card, and if it must then why
would it use simple-card and not the more modern audio-graph-card?  The
select should almost certainly just be removed entirely, this is not
something DAI drivers do - cards use DAIs, not the other way around.

> +++ b/sound/soc/sh/rz-ssi.c
> @@ -0,0 +1,871 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G2L ASoC Serial Sound Interface (SSIF-2) Driver
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.

Please make the entire comment a C++ one so things look more
intentional.

> +static int rz_ssi_stream_init(struct rz_ssi_priv *ssi,
> +			      struct rz_ssi_stream *strm,
> +			      struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +
> +	strm->substream = substream;

> +	if (runtime->sample_bits != 16) {
> +		dev_err(ssi->dev, "Unsupported sample width: %d\n",
> +			runtime->sample_bits);
> +		strm->substream = NULL;
> +		return -EINVAL;
> +	}
> +
> +	if (runtime->frame_bits != 32) {
> +		dev_err(ssi->dev, "Unsupported frame width: %d\n",
> +			runtime->sample_bits);
> +		strm->substream = NULL;
> +		return -EINVAL;
> +	}
> +
> +	if (runtime->channels != 2) {
> +		dev_err(ssi->dev, "Number of channels not matched\n");
> +		strm->substream = NULL;
> +		return -EINVAL;
> +	}

Why are we only validating these here which is called from...

> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +		/* Soft Reset */
> +		rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_SSIRST);
> +		rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_SSIRST, 0);
> +		udelay(5);
> +
> +		ret = rz_ssi_stream_init(ssi, strm, substream);
> +		if (ret)
> +			goto done;

...trigger.  This stuff should be being validated when we set
parameters in hw_params() and can usefully report the error.

> +static int rz_ssi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
> +
> +	/* set master/slave audio interface */
> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBS_CFS:
> +		asm("nop"); /* codec is slave */
> +		break;

That asm("nop") looks interesting...  I can't think why that'd be
needed?  Please also use the modern versions of these defines, consumer
and provider rather than slave and master.

--4dIe/AmYstFUGHTF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEMBPsACgkQJNaLcl1U
h9DnBwf/XKjZA/9gCQVpfhG/eH/xV2Nqi/mU+S/Uyy8BhUXMa76mOR6wzTyd2kWD
n2j0dV78dzujccTdXriDVsmqQNknlGUGXa/tZrTiraGOqGw3kqy0f5NIGdzhPCZM
7Ip0mcl7VQKUm9VBZgjHkVjLRaB17ak9uQ1X6przneydtabW0mftK1W0K6xflHYP
Zy8RO2z539VBnys7irkKC8fITqVMkhqr4oeWSE/sXAwTQ6Yj/KsnFUqoF8FqyU0r
bZ+fLOstqIwg7zSBmeJHVcxqAImoanivIK3s8aVERiVc6xlhAeZAEKIvWb0Vo8GQ
e9rNcmQGr8Z3OWsrkbxcRefF1r2OdQ==
=hOBs
-----END PGP SIGNATURE-----

--4dIe/AmYstFUGHTF--
