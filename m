Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBF81E4FB8
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 22:58:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFF5317BE;
	Wed, 27 May 2020 22:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFF5317BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590613129;
	bh=PJaX6a/wG4EogZDDlFWqXVNgTe80YNLiDmSRl+38vz4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tidMYkfC1W8bg286jsTsKRoxYolAU8Q+5IQR2ZISfs+s1QAHj9LlpANgA1tFJ7072
	 TZijj1dwLQZkwjlhhrKsq5FPF88bDaFggEKOaASIHTLN2cXleArfwubFUrHiL4LgGk
	 dtG8OEzjuJAC1zAifqbhn8Ory6dq1fB1Em0ONw3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 174FFF80146;
	Wed, 27 May 2020 22:57:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5908F8014E; Wed, 27 May 2020 22:57:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C98F0F80146
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 22:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C98F0F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tEierfJl"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5111320899;
 Wed, 27 May 2020 20:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590613020;
 bh=PJaX6a/wG4EogZDDlFWqXVNgTe80YNLiDmSRl+38vz4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tEierfJlg9cjxL5kZCo+ruC44RyQE9GccF6rbeEjdIDkyVyxkl5iLTG1UeskiTz1U
 qsGoFAK/Rr0QPGHHpdbKOB0cjCpARvKOAYI6QPlfg4KVgAKiXLXeUjyusnJ2OuzyJB
 wVoerKThgLwGnz4i9g5oRhiduWKlCufSs35IGBtc=
Date: Wed, 27 May 2020 21:56:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ASoC: rt5682: split i2c driver into separate module
Message-ID: <20200527205658.GM5308@sirena.org.uk>
References: <20200527193730.930412-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="37nyS7qXrnu4wN2o"
Content-Disposition: inline
In-Reply-To: <20200527193730.930412-1-arnd@arndb.de>
X-Cookie: Drop in any mailbox.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Akshu Agrawal <akshu.agrawal@amd.com>
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


--37nyS7qXrnu4wN2o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2020 at 09:34:13PM +0200, Arnd Bergmann wrote:

> index 000000000000..c891aa80757f
> --- /dev/null
> +++ b/sound/soc/codecs/rt5682-i2c.c
> @@ -0,0 +1,341 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * rt5682.c  --  RT5682 ALSA SoC audio component driver
> + *

Please keep the entire comment C++ so things look more intentional.

> +static const char *rt5682_supply_names[RT5682_NUM_SUPPLIES] = {
> +	"AVDD",
> +	"MICVDD",
> +	"VBAT",
> +};

I'm *fairly* sure the device needs power even with Soundwire?

> +static void rt5682_jd_check_handler(struct work_struct *work)
> +{
> +	struct rt5682_priv *rt5682 = container_of(work, struct rt5682_priv,
> +		jd_check_work.work);

> +static int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
> +{
> +
> +	device_property_read_u32(dev, "realtek,dmic1-data-pin",
> +		&rt5682->pdata.dmic1_data_pin);
> +	device_property_read_u32(dev, "realtek,dmic1-clk-pin",
> +		&rt5682->pdata.dmic1_clk_pin);

This doesn't look very I2C specific either, nor do chunks of the rest of
the code.  The usual pattern with this stuff is to have the bus specific
code do bus specific stuff like setting up the regmap and then call into
a common init function for the shared parts of the chip.  I'd expect a
bit more unshared code here but not this much.

--37nyS7qXrnu4wN2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7O1BkACgkQJNaLcl1U
h9A0nwf8D3oDJJ7yA5/9c9tZA3Ugn5+YbfRc5KWxk7tChsSTmOaXja9l3B3yoHEh
FB0bDc5yyUL6+iQxUkNzGe9Q//DhUeJTnDYH+FaBS+YyG3NNSqaTlD1JCjC0de6g
JMqaRXuOohN2sW2IX3fVcOnCUUfuJl0c7J6g64mxi/pv5LQTiUuuRWPz7DuIFSr7
ZlqkxNLBnt/U5/kiCZY3RGu1Ol7vPXFQYCOeWnlx5G0q2yrng4/bxpeWxkS0tNUy
SZY4IyOiT++Vqyj6JnPm/B7NQaWjs/xnl7JLKecmXDHmbPMNQUifdJw3+FzsvJwW
4RD1aq7FoWTMXR/LdkmkSw+QhT3MMA==
=1e2i
-----END PGP SIGNATURE-----

--37nyS7qXrnu4wN2o--
