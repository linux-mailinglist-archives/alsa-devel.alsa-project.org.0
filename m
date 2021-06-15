Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD613A7F21
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 15:24:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61A7A1696;
	Tue, 15 Jun 2021 15:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61A7A1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623763457;
	bh=gEckdQ1fONPY0GbSS0QNPbmgrAH5DwXuznd4hNS52tE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hNf1egnAhmCxtNDXCuD7I1yQ6YY0L8ODNJZafS7LWlgfBThZtfK6luAcv+uxGOjgr
	 a8uUnOycWGrABARY3Onawl/roqVGGOKFmpTsOSHTQfsDCNOuafFkvfHQs2mm0dmx7u
	 +ODOmg4Va1mZOeKEvQqh+mVzMflHljh9klBcDxbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C283EF80113;
	Tue, 15 Jun 2021 15:22:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BC85F80171; Tue, 15 Jun 2021 15:22:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A741F80165
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 15:22:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A741F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B9/fxC+x"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E83DE6145D;
 Tue, 15 Jun 2021 13:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623763357;
 bh=gEckdQ1fONPY0GbSS0QNPbmgrAH5DwXuznd4hNS52tE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B9/fxC+xANRpAHRXgng3cAOOBxa1PwWHSbfVjGlfAEA3M4uPI8U4B/1wxV73oyaB0
 zeXyCIBUrdHFwf2j2FoGKtTvftVQYWlenq/RplHaAWbimVQ5PeD3aVKEVVnano1m2D
 7fl5panuQIw00osH8J/CLKBGcTibRmv6EJoVMbkXbQwNcZo3frdCCFUGpKpDpFQc6S
 TsJeUXqHO/z2tcl6VTNA0BMb8gXacIxsSoZNVB7HL4PyqmQOfRQaNJwwhzCdUWsRql
 J3cpQGM6bXWwI8JgySNLdRj7j4b3EPjmCG2osaPHbYciASLL5TSPeshsS3tV5Smi+g
 g+eZK9IcZcQ5g==
Date: Tue, 15 Jun 2021 14:22:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Ban Tao <fengzheng923@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
Message-ID: <20210615132207.GG5149@sirena.org.uk>
References: <20210615130326.2044-1-fengzheng923@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+sHJum3is6Tsg7/J"
Content-Disposition: inline
In-Reply-To: <20210615130326.2044-1-fengzheng923@gmail.com>
X-Cookie: See store for details.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, krzk@kernel.org, samuel@sholland.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, jernej.skrabec@gmail.com,
 lgirdwood@gmail.com, wens@csie.org, mripard@kernel.org, p.zabel@pengutronix.de,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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


--+sHJum3is6Tsg7/J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 15, 2021 at 09:03:26PM +0800, Ban Tao wrote:

Other than a few small things this looks good:

> +M:	Ban Tao <fengzheng923@gmail.com>
> +L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> +F:	sound/soc/sunxi/sun50i-dmic.c

Not the binding document?

> @@ -0,0 +1,408 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * ALSA SoC DMIC Audio Layer
> + *
> + * Copyright 2021 Ban Tao <fengzheng923@gmail.com>
> + *

Please make the entire comment a C++ one so things look more
intentional.

> +static void sun50i_snd_rxctrl_enable(struct snd_pcm_substream *substream,
> +				    struct sun50i_dmic_dev *host, bool enable)
> +{
> +	if (enable) {

> +	} else {

> +static int sun50i_dmic_trigger(struct snd_pcm_substream *substream, int cmd,
> +			       struct snd_soc_dai *dai)
> +{
> +	int ret = 0;
> +	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(dai);
> +
> +	if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
> +		return -EINVAL;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		sun50i_snd_rxctrl_enable(substream, host, true);
> +		break;
> +
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		sun50i_snd_rxctrl_enable(substream, host, false);
> +		break;

This is the only caller of _rxctrl_enable() and _rxctrl_enable() shares
no code between the two cases - just inline _rxctrl_enable() here, it's
clearer what's going on.

> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	base = devm_ioremap_resource(&pdev->dev, res);

devm_platform_ioremap_resource()

--+sHJum3is6Tsg7/J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDIqX4ACgkQJNaLcl1U
h9BFogf/Tnpp6hX2cq5N3NCHguSmWr1ckDT5UzZ3tO6YlJxdzXVMe22vxaLJDy4q
Zlm/Gl8BtlPgD3JaDGanLEd/hgmKWnYa0wPL4Xiun7ETkZtDpUBn2vsn/18zj/Vi
NvetwyxxDuh8SKNZi/mDlBzOWwzESHPvdsb9fYm9vNKJq39+/qlrGdjhnfzk5cSe
MxHNaRf6/DuZ7aWWlKFMUa8RNg8lokH/9glCEVfo7U0mqBIdwJE3ihP9HgLGnKOx
QDwWn7mdiF1BUehsZ7Q0NFd8POMl0CWFMv3x5Lg5qQ2VJ8XfvNvLQA6Rb1/tz69C
TVUrQ9PedgJniopAz/WN57nQwApKng==
=fxZ7
-----END PGP SIGNATURE-----

--+sHJum3is6Tsg7/J--
