Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AF284CE12
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 16:31:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5743E83E;
	Wed,  7 Feb 2024 16:30:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5743E83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707319868;
	bh=UgPWixAo3eAKaq+jYQ5o0vmRE5lLNZA4whjgz2D5js8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rbxw3Says/b2dxodKhL92545pm8jZw25qTBgG5Lx0j4hKf2zfHkixDd6NdN/l428v
	 zY6eDQHF55E2c2m7UVJO5ilnDO8znHepQGwMk9/BBiF0e5zUrk7LakXb2FRx/2EfRd
	 XnXGHOoTvF70ujB2fJOV8Et7kWgCXxkIbL6h2ZvE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9024F805A1; Wed,  7 Feb 2024 16:30:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14328F805A1;
	Wed,  7 Feb 2024 16:30:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95486F801EB; Wed,  7 Feb 2024 16:30:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46BABF800E3
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 16:30:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46BABF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oVipaoMH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 410DC618F4;
	Wed,  7 Feb 2024 15:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D262C433F1;
	Wed,  7 Feb 2024 15:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707319819;
	bh=UgPWixAo3eAKaq+jYQ5o0vmRE5lLNZA4whjgz2D5js8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oVipaoMHyx9WnbIjLYzyXphOQf+W8hyIdhhwHFjN/ge/T09Yv2iFGcWr61HU9O2j7
	 Vu1BzAg81apdTGQwJQNr2rmG69kwBT8YYCGJCaxzh34HN2QzubCWOE/9WTt+FpaKHK
	 eHjZT9zLkQ59y1UPNbrdS6bTMNa/KFKtsosOFq7o4YawthN1D/cCRG2eEWcU4EVvht
	 LuJgB7mMKdaZqAELSZ3eqjjB+8ucTuXTOaD3oemKWYsIpbtEwEU1PdHcdSMSA8ci6G
	 Dogo9TEyZqD3R1kyfqNhiYsuvtmbMgQBbyThZNgKm0+w+O7LvssopRg1ijDd4xxB7g
	 sGclDkZSSZM4Q==
Date: Wed, 7 Feb 2024 15:30:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, lgirdwood@gmail.com,
	perex@perex.cz, pierre-louis.bossart@linux.intel.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	bard.liao@intel.com, mengdong.lin@intel.com,
	yung-chuan.liao@linux.intel.com, baojun.xu@ti.com, kevin-lu@ti.com,
	navada@ti.com, tiwai@suse.de, soyer@irl.hu
Subject: Re: [PATCH v7] ASoc: tas2783: Add tas2783 codec driver
Message-ID: <ZcOiCFlqsnyAEgl3@finisterre.sirena.org.uk>
References: <20240207054743.1504-1-shenghao-ding@ti.com>
 <ZcOWZlXu1fL_haFU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vE1mhbGjFNiuNYDa"
Content-Disposition: inline
In-Reply-To: <ZcOWZlXu1fL_haFU@smile.fi.intel.com>
X-Cookie: You might have mail.
Message-ID-Hash: IAE6U3QGV4KXCUNSRIRFLDMXGVDWXQ3P
X-Message-ID-Hash: IAE6U3QGV4KXCUNSRIRFLDMXGVDWXQ3P
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IAE6U3QGV4KXCUNSRIRFLDMXGVDWXQ3P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--vE1mhbGjFNiuNYDa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 07, 2024 at 04:40:38PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 07, 2024 at 01:47:42PM +0800, Shenghao Ding wrote:

> > +static const struct regmap_config tasdevice_regmap = {
> > +	.reg_bits = 32,
> > +	.val_bits = 8,
> > +	.readable_reg = tas2783_readable_register,
> > +	.volatile_reg = tas2783_volatile_register,

> > +	.max_register = 0x44ffffff,

> I'm always wondering how this can work in debugfs when one tries to dump all
> registers...

regmap will filter out non-readable registers from what it shows in
debugfs so sparse regmaps will end up much smaller than they might look.
The debugfs code also has support for seeking into the output (since
each register is a fixed size) so we'll only actually render whatever is
being read in an individual read().

> > +static const struct dev_pm_ops tas2783_sdca_pm = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(tas2783_sdca_dev_suspend,
> > +		tas2783_sdca_dev_resume)
> > +	SET_RUNTIME_PM_OPS(tas2783_sdca_dev_suspend,
> > +		tas2783_sdca_dev_resume, NULL)
> > +};

> Use new PM macros.

...which are?

--vE1mhbGjFNiuNYDa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXDoggACgkQJNaLcl1U
h9C60gf1GOfWTgnrzFxR9xa5hmkPBPAi1Ojd3JfrzPlUXJfieLeZWc2wwlEbDLsA
yNTO21FqNRRdtrRAay4kRZBBFuam/4RwDef616jFc6lY61hkvPz/CeUSZ9X4Oqa1
nFnGaVmNNKxEdhM/J4cDsxjdhIpsUa/ib+rhwZGv2vXWxMlQhAbfQneSIKuedTfz
z+kXD1kegP9QWiqQzHsko8X/qBQjk/TfPYhjOSZni8hgKAmb5xY35jgcba3qZj0b
ndwz0c749lcBm7ojhrV14jeGmZwH2RmvHHxy76Csw9cKnRoOUuKs5eU6Wvh+yqOZ
FueTF3iS+xTteyTeDrGeO3T2+w16
=rb8K
-----END PGP SIGNATURE-----

--vE1mhbGjFNiuNYDa--
