Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C61F459C531
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 19:41:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1059D844;
	Mon, 22 Aug 2022 19:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1059D844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661190069;
	bh=6CmQdowko0m3VEWl0fKzK9C0KmgTv5BlYHbJQN96nP0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QT+CoKtRcx0sXHs98r/RRrP9fwfS27CxbEOqfqBXTx/YvGjTG2t3bhLU08QEl0BzS
	 nzySvwctaxdcJtr8AloaBbG/W9idctUekMV1yG0MmP5YOiZ/tsXfczWw8k9MWWSjTJ
	 rkScZxJj0fhkyfvl89tXtW/RlWtWYZ9wtOdb8p2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 699B5F8026D;
	Mon, 22 Aug 2022 19:40:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9C0EF8026A; Mon, 22 Aug 2022 19:40:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21CF9F80152
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 19:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21CF9F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Js2/6HWD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE25A61254;
 Mon, 22 Aug 2022 17:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0915C433D6;
 Mon, 22 Aug 2022 17:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661190000;
 bh=6CmQdowko0m3VEWl0fKzK9C0KmgTv5BlYHbJQN96nP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Js2/6HWDWg4NXMH8+tRxvjuUIGmcjy7run71WD6MSM/AxdIYKI24l4Ioagg88clJu
 2OzQ7ZBhMhpWBnwp/SZPh9w5cseL5P2hF97CMWTZgVA2ZE1MOnngKTyk7qjWTx7Bzn
 muUfo1KOOLzrLJuD6zJviWHZqgR18jy/i0xheu4oaLw6QWqIz0bRa+RusaLpDceMx3
 ppgHLAjtcNjQoe8fMxYi+VPx7eFoUbXWY3PvgVnf2ioweZ6w7Mvqg/4pZsVoiBi2er
 WYGY+r0QaqCUC9PyMSjr5JqJgrcLw9cisr2i5bCF+clJc+QQ62deyf/Z8sYERWKsZX
 FDQVzbkUemRDw==
Date: Mon, 22 Aug 2022 18:39:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [PATCH v2 3/4] ASoC: apple: mca: Start new platform driver
Message-ID: <YwO/aqs7eqZx07kS@sirena.org.uk>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
 <20220819125430.4920-4-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qCefvYX0tdeieUPa"
Content-Disposition: inline
In-Reply-To: <20220819125430.4920-4-povik+lin@cutebit.org>
X-Cookie: Do not write in this space.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, asahi@lists.linux.dev,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
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


--qCefvYX0tdeieUPa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2022 at 02:54:29PM +0200, Martin Povi=C5=A1er wrote:

This all looks good, one style nit and a couple of requests for
clarification below but basically this is fine.

> +++ b/sound/soc/apple/mca.c
> @@ -0,0 +1,1149 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Apple SoCs MCA driver
> + *
> + * Copyright (C) The Asahi Linux Contributors
> + *
> + * The MCA peripheral is made up of a number of identical units called c=
lusters.

Please make the entire comment block a C++ one so things look more
intentional.

> +#define USE_RXB_FOR_CAPTURE

What's this all about?

> +static int mca_fe_enable_clocks(struct mca_cluster *cl)
> +{
> +	struct mca_data *mca =3D cl->host;
> +	int ret;
> +
> +	ret =3D clk_prepare_enable(cl->clk_parent);
> +	if (ret) {
> +		dev_err(mca->dev,
> +			"cluster %d: unable to enable clock parent: %d\n",
> +			cl->no, ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * We can't power up the device earlier than this because
> +	 * the power state driver would error out on seeing the device
> +	 * as clock-gated.
> +	 */
> +	cl->pd_link =3D device_link_add(mca->dev, cl->pd_dev,
> +				      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
> +					      DL_FLAG_RPM_ACTIVE);

I'm not clear on this dynamically adding and removing device links stuff
- it looks like the main (only?) purpose is to take a runtime PM
reference to the target device which is fine but it's not clear why
device links are involved given that the links are created and destroyed
every time the DAI is used, AFAICT always in the same fixed
relationship.  It's not a problem, it's just unclear.

--qCefvYX0tdeieUPa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMDv2kACgkQJNaLcl1U
h9Apnwf8DfhwTXhkRk42QdwLlD8jY+ALJxnAnI9N0WL27+ro0ik9D4csIFZ0yyep
peioVGWLjZDtHb8hU/MA6iwVIjrGfFOaRzacALHikXMaknAqzNGAcY3iYt2PrivX
l6glTR9aQZ9wqdVYbHjSpStEu4D1Fb+QzdgtJyPTFiduuGhv13pAGscTUmpTHaiL
Oy80EJMZ1T/TUXevPew4EALeIZiT3dBch98K5VAEhpLpAQlyGjNAaJNMcHHBVyrB
0NRvDmrVO+pXfiXQb0Fb/NtDm3jT6VJuBvOE7tmIDXL9RTk1NAEJC0qm56IQv1hR
lDk432wlomyUxhOKnc6xZD51i5We8A==
=y4jf
-----END PGP SIGNATURE-----

--qCefvYX0tdeieUPa--
