Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4746E1D7FAC
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:08:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0FBA1732;
	Mon, 18 May 2020 19:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0FBA1732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589821718;
	bh=ZP6YFfTVPZ9fM6oFqbpny2SZG9yGwtWKD5bkhalg6VE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pheFQKD+bqRD+PEx3UnJWDERKpHteGctBcAc0HHSchmlY1xj3Pq40dQvchVgw7bP2
	 H4AjbbDnFPOYf0EEf0fGDv1773Uhf+VR2Ua7P96f76ijepD0eE2MJtnustaahdm3Kz
	 WKPVefA9UHQoJZg6ORH8APQEkt4WUoBR6EYozIyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C91CAF80086;
	Mon, 18 May 2020 19:06:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 736B1F801DA; Mon, 18 May 2020 19:06:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FBA5F800C9
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FBA5F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xlUuojj/"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D9B720709;
 Mon, 18 May 2020 17:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589821609;
 bh=ZP6YFfTVPZ9fM6oFqbpny2SZG9yGwtWKD5bkhalg6VE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xlUuojj/pUB0pxhID/DrBfePm7eNiedweumMFRsdfTToGhdmaJZS5JLzMHCmY5jvC
 siJ1KLBMprixslKOnPnTcoLdEF1bPrX/ipvPmVdN9EM5d2AvMq5Ycr2Qp6iBCwRNkR
 u0hUnxis511rj4cWlKpI83Kkwijwwo4YU/KnVdSw=
Date: Mon, 18 May 2020 18:06:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Sia Jee Heng <jee.heng.sia@intel.com>
Subject: Re: [PATCH v2 1/4] ASoC: Intel: Add KeemBay platform driver
Message-ID: <20200518170647.GA28178@sirena.org.uk>
References: <1589768242-4594-1-git-send-email-jee.heng.sia@intel.com>
 <1589768242-4594-2-git-send-email-jee.heng.sia@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <1589768242-4594-2-git-send-email-jee.heng.sia@intel.com>
X-Cookie: Chess tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2020 at 10:17:19AM +0800, Sia Jee Heng wrote:

> +++ b/sound/soc/intel/keembay/kmb_platform.c
> @@ -0,0 +1,746 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + *  Intel KeemBay Platform driver
> + *
> + *  Copyright (C) 2020 Intel Corporation.

Please keep the entire header C++ style so things look more consistent.

> +static void pcm_operation(struct kmb_i2s_info *kmb_i2s, bool playback)

Please namespace this function, it looks like a core ALSA call.  It'd
probably be better to namespace a bunch of the other functions called
i2s_ as well.

> +static inline void i2s_irq_trigger(struct kmb_i2s_info *kmb_i2s, u32 stream,
> +				   int chan_nr, bool trigger)
> +{
> +	u32 i, irq;
> +	u32 flag;
> +
> +	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		flag = TX_INT_FLAG;
> +	else
> +		flag = RX_INT_FLAG;
> +
> +	for (i = 0; i < chan_nr / 2; i++) {
> +		irq = readl(kmb_i2s->i2s_base + IMR(i));
> +		irq = trigger ? irq & ~flag : irq | flag;

Please write this as a normal if statement to improve legibility.

> +static int kmb_configure_dai_by_dt(struct kmb_i2s_info *kmb_i2s,
> +				   struct snd_soc_dai_driver *kmb_i2s_dai)
> +{
> +	u32 comp1 = readl(kmb_i2s->i2s_base + I2S_COMP_PARAM_1);
> +
> +	if (COMP1_TX_ENABLED(comp1))
> +		kmb_i2s->capability |= DWC_I2S_PLAY;
> +
> +	if (COMP1_RX_ENABLED(comp1))
> +		kmb_i2s->capability |= DWC_I2S_RECORD;
> +
> +	return kmb_configure_dai(kmb_i2s, kmb_i2s_dai,
> +		I2S_SAMPLE_RATES);
> +}

This isn't actually reading the DT?

> +static void kmb_disable_clk(void *data)
> +{
> +	clk_disable_unprepare(data);
> +}

This function doesn't seem to be adding anything?

> +	ret = of_property_read_string(dev->of_node, "mode", &i2s_mode);
> +	if (ret < 0) {
> +		dev_err(dev, "Couldn't find the entry\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(kmb_i2s->dev, "Mode = %s", i2s_mode);
> +
> +	ret = match_string(i2s_mode_name, ARRAY_SIZE(i2s_mode_name), i2s_mode);

This property isn't defined in the DT binding and should be configured
by the machine driver through a set_fmt() operation anyway.

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7CwKYACgkQJNaLcl1U
h9BMmwf8D5KK7zGE6nuNTf9EOultZ+AxT2BTxRIknpRAmxw79i35yVmzEEx4sG6L
5eEvu0fYhwyTMsda1Kseh/NZ10w/7GExeFVRcdQGHHh5jkhMWNU6EN0auuz6lysK
2GkkuOtxQJr4rVVp17FO7J3b6kJi/ZVXiF6aiQsKscFPqjO8MiBXGBGIjFXHZ53r
TMji2YjYvLvskUxI4Pv3CvWFsHVulGhS9Dyd8knjWTpM3Ysyuqmlwm5r/V0uKqws
6fVqNuISTzKLJI7bfuIF2RFV/XkK0SKcMSe0kviE2tVPy0fP8phI+/Fyqcgklso0
H62tAATghHhQHfqHG6KAxt3GbFyOrA==
=qhdE
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
