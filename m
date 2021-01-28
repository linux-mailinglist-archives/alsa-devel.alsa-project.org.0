Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 478A4307A4E
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 17:09:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDEC616AC;
	Thu, 28 Jan 2021 17:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDEC616AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611850190;
	bh=f8GLUX9YcE853ykBbDiOgwGp7UCy2pk/Y9+Dy4Hy9YI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L7Bi3g89FFUkupFsr9I8Rj4pTmXTJYaWc9urHguxas1JUkBj318RaqXufuSzd5BwM
	 HRBYwRrZwXajn3rn79Da44rc6taiiBR284c8gPzCCqM5wYQ0pFvC0S1+sd9Tmnb9DF
	 Rk2r8jQ/5jYpTSYsczqJ++T72dRg7tQyW+HGrnC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D7F3F801D8;
	Thu, 28 Jan 2021 17:08:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01D68F8015B; Thu, 28 Jan 2021 17:08:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2DECF800D1
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 17:08:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2DECF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="glvpdFdX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67D5264DEE;
 Thu, 28 Jan 2021 16:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611850082;
 bh=f8GLUX9YcE853ykBbDiOgwGp7UCy2pk/Y9+Dy4Hy9YI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=glvpdFdXpIOCqgK9e6YCZ2gU1a2xssaxczL0ZO+ofkR1aPfm90httgE9mKllYV3XK
 5bDyszaZF3E3bu/8Bs3rzk/VCsfrXM7PhzbWdIlfx7V3HcHuDJbbgDZrtTrdKS/Hx1
 UqdwBERVNarehBJht4W/Tu8ymOf/LGZAHgmcpXrLdR5WnMIHvE/yCFP2mxHAuHU+Zh
 u9/253u/roZI4Xtx08ThEnasBWQTrj04KUxewgzCXJ67GkT9jpc9o7OpzmhG0DbAz7
 JCThUsQtk95FYYTJqJ4/9U+xa44aCkzIZzxHRKHCPVa+3TAieoij3oOe3RdlNJhAnY
 nlY/IGIL5uKfA==
Date: Thu, 28 Jan 2021 16:07:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/7] ASoC: codec: lpass-rx-macro: add support for lpass
 rx macro
Message-ID: <20210128160718.GE4537@sirena.org.uk>
References: <20210128141929.26573-1-srinivas.kandagatla@linaro.org>
 <20210128141929.26573-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="47eKBCiAZYFK5l32"
Content-Disposition: inline
In-Reply-To: <20210128141929.26573-3-srinivas.kandagatla@linaro.org>
X-Cookie: Do not pick the flowers.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
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


--47eKBCiAZYFK5l32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 28, 2021 at 02:19:24PM +0000, Srinivas Kandagatla wrote:

>  snd-soc-lpass-wsa-macro-objs := lpass-wsa-macro.o
>  snd-soc-lpass-va-macro-objs := lpass-va-macro.o
> +snd-soc-lpass-rx-macro-objs := lpass-rx-macro.o

Please keep things sorted.

> @@ -0,0 +1,2020 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> + */

Please make the entire comment a C++ one so things look more
intentional.

> +static const char *const rx_macro_ear_mode_text[] = {"OFF", "ON"};
> +static const struct soc_enum rx_macro_ear_mode_enum =
> +	SOC_ENUM_SINGLE_EXT(2, rx_macro_ear_mode_text);

On/off controls should be standard Switch controls.

> +		if (rx->rx_mclk_users == 0) {
> +			regcache_mark_dirty(regmap);
> +			regcache_sync(regmap);

I'd expect this to be joined up with whatever caused the register state
to become invalid, this looks like it's inviting bugs.  This also seems
to have only one caller...

> +	SOC_ENUM_EXT("RX_HPH HD2 Mode", rx_macro_hph_hd2_mode_enum,
> +		rx_macro_get_hph_hd2_mode, rx_macro_put_hph_hd2_mode),
> +
> +	SOC_ENUM_EXT("RX_HPH_PWR_MODE", rx_macro_hph_pwr_mode_enum,
> +		rx_macro_get_hph_pwr_mode, rx_macro_put_hph_pwr_mode),

The naming seems a bit random here.

> +static int rx_swrm_clock(struct rx_macro *rx, bool enable)
> +{

> +static int swclk_gate_enable(struct clk_hw *hw)
> +{
> +	return rx_swrm_clock(to_rx_macro(hw), true);
> +}
> +
> +static void swclk_gate_disable(struct clk_hw *hw)
> +{
> +	rx_swrm_clock(to_rx_macro(hw), false);
> +}

This all seems very redundant and like it'll get in the way of grepping
for users.  It would be better to just inline the operation into the clk
API functions.

--47eKBCiAZYFK5l32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAS4TYACgkQJNaLcl1U
h9DVMgf8CNncjtmenKkWuUzw+4DKk079Rn9qycb/n+yUSOw+6bmBvtD88CgTQvou
TyZqwo/C5pQXGk2QBkSHchzgaVm+zgEOHDkPeQQ3T1XqhiIn8WqpC3eW3qN1mxKV
3dsJScO2WpssIh+5YjTvRbah0Ab+niH6o3HCjoehDVeEATmQYFdx3Wv3ZYxTptss
/RHcRf6Mh4G4IvpNzDaJHogA1swXHBvRYH6Kokc+nLo2alrthL/xTfbUBjIMROg/
e6zNdf/LmLbdi9Xq1IL4hrt2s3+ZD4wJEkCsVFzZKPL5x3KNq7tcfg6WKP70z3OP
TU2guB+XTuRYvcJm/b+Iw/uWT8pVFw==
=7Eh9
-----END PGP SIGNATURE-----

--47eKBCiAZYFK5l32--
