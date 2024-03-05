Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E2187276D
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Mar 2024 20:19:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21789836;
	Tue,  5 Mar 2024 20:19:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21789836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709666397;
	bh=2pqmwWhbDFE9fj+oSo/K14hkY0EiMePV9mlnbLNSnOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pyykyrGtK/BhX/SLnY4L7Ce4j2wCLUkPiFvCanI1ZfUTtB5cII+N9KXZ14OT2D4ln
	 p/db26qrwY1exp4WaAovwA3+uY7+bfS6L85D4Z4QUamOQtT37is8dOxdmbtsp9vYiQ
	 54546gXHFb4eiAyKzaMIQ2Asbj4heoFcLtTSJPWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF3EAF804B0; Tue,  5 Mar 2024 20:19:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E8ECF80571;
	Tue,  5 Mar 2024 20:19:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D82DF8024E; Tue,  5 Mar 2024 20:19:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C07E4F80088
	for <alsa-devel@alsa-project.org>; Tue,  5 Mar 2024 20:19:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C07E4F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Hcl428/B
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F98661731;
	Tue,  5 Mar 2024 19:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB75C433F1;
	Tue,  5 Mar 2024 19:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709666346;
	bh=2pqmwWhbDFE9fj+oSo/K14hkY0EiMePV9mlnbLNSnOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hcl428/BsZzuIg6UQk4pgNZoTOJsi1mRK4HHj1BB72P80J1S4WoU54FXPGT/hUR8w
	 o7ALKyUyMbgaIzXBN/KrlHXa/USc/TpK7udlPk4btiJrhwV/3YC/aJ8nFKO4aWYyiL
	 JWznQa825tVcNxzL5b19Zh3cSczptdWhVpG28JmCIBhDpyLJVcvEzDhlgY/SBA77oW
	 60PCN8zQJfV14lJGYpRR1onn++/9jU6rR8Wp3ysOJjmSMBS+NY9rSuWosCZHZtUs//
	 89i2G290+/R1JCUAYu+yywH9CrtX6zgBdKLU1f3rJmkoZH2ihTKPrZDYIYVx5ucBBy
	 jMFUsejn6VUqw==
Date: Tue, 5 Mar 2024 19:18:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, bard.liao@intel.com,
	mengdong.lin@intel.com, yung-chuan.liao@linux.intel.com,
	baojun.xu@ti.com, kevin-lu@ti.com, tiwai@suse.de, soyer@irl.hu,
	Baojun.Xu@fpt.com, navada@ti.com
Subject: Re: [PATCH v10] The tas2783 is a smart audio amplifier with
 integrated MIPI SoundWire interface (Version 1.2.1 compliant), I2C, and
 I2S/TDM interfaces designed for portable applications. An on-chip DSP
 supports Texas Instruments SmartAmp speaker protection algorithm. The
 integrated speaker voltage and current sense provides for real-time
 monitoring of loudspeakers.
Message-ID: <5637d141-d619-4910-bbe7-b30d3a7e7b97@sirena.org.uk>
References: <20240305084336.606-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oKtf0G+iFmy3C6u7"
Content-Disposition: inline
In-Reply-To: <20240305084336.606-1-shenghao-ding@ti.com>
X-Cookie: Ahead warp factor one, Mr. Sulu.
Message-ID-Hash: 6JIZGZCA2B55LHYWBH64DTOOOTK46ORN
X-Message-ID-Hash: 6JIZGZCA2B55LHYWBH64DTOOOTK46ORN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6JIZGZCA2B55LHYWBH64DTOOOTK46ORN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--oKtf0G+iFmy3C6u7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 05, 2024 at 04:43:35PM +0800, Shenghao Ding wrote:
> The ASoC component provides the majority of the functionality of the
> device, all the audio functions.

> +static const struct reg_default tas2783_reg_defaults[] = {
> +	/* Default values for ROM mode. Activated. */
> +	{ 0x8002, 0x1a },	/* AMP inactive. */
> +	{ 0x8097, 0xc8 },
> +	{ 0x80b5, 0x74 },
> +	{ 0x8099, 0x20 },
> +	{ 0xfe8d, 0x0d },
> +	{ 0xfebe, 0x4a },
> +	{ 0x8230, 0x00 },
> +	{ 0x8231, 0x00 },
> +	{ 0x8232, 0x00 },
> +	{ 0x8233, 0x01 },
> +	{ 0x8418, 0x00 },	/* Set volume to 0 dB. */
> +	{ 0x8419, 0x00 },
> +	{ 0x841a, 0x00 },
> +	{ 0x841b, 0x00 },
> +	{ 0x8428, 0x40 },	/* Unmute channel */
> +	{ 0x8429, 0x00 },
> +	{ 0x842a, 0x00 },
> +	{ 0x842b, 0x00 },
> +	{ 0x8548, 0x00 },	/* Set volume to 0 dB. */
> +	{ 0x8549, 0x00 },
> +	{ 0x854a, 0x00 },
> +	{ 0x854b, 0x00 },
> +	{ 0x8558, 0x40 },	/* Unmute channel */
> +	{ 0x8559, 0x00 },
> +	{ 0x855a, 0x00 },
> +	{ 0x855b, 0x00 },
> +	{ 0x800a, 0x3a },	/* Enable both channel */

These comments sound like this register default table is not actually
the physical default register values that the chip has...

> +static const struct regmap_config tasdevice_regmap = {
> +	.reg_bits = 32,
> +	.val_bits = 8,
> +	.readable_reg = tas2783_readable_register,
> +	.volatile_reg = tas2783_volatile_register,
> +	.max_register = 0x44ffffff,
> +	.reg_defaults = tas2783_reg_defaults,
> +	.num_reg_defaults = ARRAY_SIZE(tas2783_reg_defaults),

...but this is set as the register defaults.  This will cause problems
with things like cache sync where we don't write values out if they're
not the defaults.  We also try to keep default settings from the silicon
except in the most obvious cases, it avoids issues with trying to work
out what to set and accomodate different use cases for different systems.

If you do need to set non-default values then either just regular writes
during probe or a regmap patch would do it.

> +	.cache_type = REGCACHE_RBTREE,
> +	.use_single_read = true,
> +	.use_single_write = true,

REGCACHE_MAPLE is generally the most sensible choice for modern devices
- it's a newer and fancier data structure underlying it and there's only
a few cases with low end devices, mostly doing block I/O which this
doesn't support, where the RBTREE cache is still better.

> +	u16 dev_info;
> +	int ret;
> +
> +	if (!tas_dev->sdw_peripheral) {
> +		dev_err(tas_dev->dev, "%s: peripheral doesn't exist.\n",
> +			__func__);
> +		return;
> +	}
> +
> +	dev_info = tas_dev->sdw_peripheral->bus->link_id |
> +		tas_dev->sdw_peripheral->id.unique_id << 16;

I'm kind of surprised dev_info works as a variable name without
something getting upset that it aliases the function of the same name.

--oKtf0G+iFmy3C6u7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXncCIACgkQJNaLcl1U
h9DlHwf/Xq+Guwgm78pQq6+8ERCajDkI2IbMJmvrL73zEB29/YvshNpE1wFd0VXZ
VVcz2IWrVhrBlaxUiDv+ByHSJp/jndWlYys6LwuczhXIXsWtV4v17ugHUYjBTXaP
W9mSGzcNFIO0IJmupeEuwjWD1ijHBwuc+fDROf2q+gS+NfVLO/S3h7M0TmyqneLE
k5GM4ZnNFPxNE2F6gDo4gs6PbQFomynEOFDDAtJGAoh1lFhc1RX13+1mDwwE8bYj
NTYBv7aMWKcgAcyxY6jIShRnm/zQgz8QmPNN6qNVdU80fc74WfOffCQea6zGs6It
As0BsfHOKypJ30EMKGyJ6f948zbXFA==
=WXwt
-----END PGP SIGNATURE-----

--oKtf0G+iFmy3C6u7--
