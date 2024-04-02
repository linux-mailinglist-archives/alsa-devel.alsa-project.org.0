Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AC2895B46
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 20:00:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D34EC2C53;
	Tue,  2 Apr 2024 20:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D34EC2C53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712080836;
	bh=aAnQ8NHRy23MYWdUWIRo2R/tt6TJTrY0OJtZc6tId9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ohz0Fg+G1gQQeiawjjejy9fSXeOVtXFsBHdbrnLlO8wQRFeN1LP4JbD1faKQ7YKw9
	 UE1atktd5ugF/5y/k/9kIbP9LUteVn+Mcer6996JPnJn3sT3UVRbqV+9MmwKsZIYWu
	 MCXuQdDimKDRsb+n+UxSBbUuJmSl+7JtfBVXpcbk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20628F8057F; Tue,  2 Apr 2024 20:00:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 066BDF8057E;
	Tue,  2 Apr 2024 20:00:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EA1EF8020D; Tue,  2 Apr 2024 19:59:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F575F80114
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 19:59:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F575F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fiZ5/jmj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C55D8CE12BA;
	Tue,  2 Apr 2024 17:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8878EC433F1;
	Tue,  2 Apr 2024 17:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712080780;
	bh=aAnQ8NHRy23MYWdUWIRo2R/tt6TJTrY0OJtZc6tId9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fiZ5/jmjXQAWqskmJrA1pJgb8EgneHP6L7h29nZDOit53zR/4YUizKApVrErLwl2E
	 L3XKwmSYXzdUzkzBLx7s/UKDO22g5AcaeVwK2+TIdwyzYMfvZaQo2+kM71tm74CW10
	 cQ2rKA+xKcFsCIIn8Te/BBagrSAaEBhg81bBsVrT22dIRTlq9Ct2/vQnCkGCecjPUk
	 BwsuCR7dZTYXeVgwUG/ylsYBThyVxlnSC1YQL5dYm3hNcXjOcxqtX+OsCPoZIfTUD/
	 6Rc7NHljYOeC/7yWGd726z+f3AO831VqlEH9wDeWZxLK7Ds4PywdiisI799tlpTEPb
	 jOibQxo2ds58Q==
Date: Tue, 2 Apr 2024 18:59:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, andriy.shevchenko@linux.intel.com,
	lgirdwood@gmail.com, perex@perex.cz, 13916275206@139.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, bard.liao@intel.com,
	yung-chuan.liao@linux.intel.com, kevin-lu@ti.com, tiwai@suse.de,
	baojun.xu@ti.com, soyer@irl.hu, Baojun.Xu@fpt.com, navada@ti.com,
	v-po@ti.com
Subject: Re: [PATCH v12] ASoc: tas2783: Add tas2783 codec driver
Message-ID: <630746e4-1172-4dbd-90c8-314cbab684b3@sirena.org.uk>
References: <20240331021458.1418-1-shenghao-ding@ti.com>
 <df80758b-f3d6-4456-8600-1a19fab75407@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ijEPnn0yQQxdDGiq"
Content-Disposition: inline
In-Reply-To: <df80758b-f3d6-4456-8600-1a19fab75407@linux.intel.com>
X-Cookie: Knowledge is power.
Message-ID-Hash: 4CRUSKUTJHUKOEPGJE2CWJBYIATTCX7T
X-Message-ID-Hash: 4CRUSKUTJHUKOEPGJE2CWJBYIATTCX7T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CRUSKUTJHUKOEPGJE2CWJBYIATTCX7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ijEPnn0yQQxdDGiq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 01, 2024 at 08:50:24AM -0500, Pierre-Louis Bossart wrote:

> > +static int tasdevice_comp_probe(struct snd_soc_component *comp)
> > +{

> > +	ret = request_firmware(&fw_entry, dspfw_binaryname, tas_dev->dev);
> > +	if (ret) {
> > +		dev_err(tas_dev->dev,
> > +			"%s: request_firmware %x open status: %d.\n", __func__,
> > +			tas_dev->sdw_peripheral->id.unique_id, ret);
> > +		goto out;
> > +	}
> > +
> > +	tasdevice_dspfw_ready(fw_entry, tas_dev);

> Question: is there a specific reason why all this functionality needs to
> be done in a component probe instead of when the device reports as ATTACHED?

> Since you have an interaction with userspace for the firmware, and
> firmware download takes time, you would want to do this as early as
> possible.

> Usually the component probe is part of the card creation, so you could
> add card-related or control related things. Downloading firmware does
> not strike me as a card-related activity?

This does have the effect of ensuring that the card won't instantiate
without firmware.  Given how utterly dependent on firmware this device
seems to be I can see a case for blocking card registration until the
firmware is ready, there's a usability thing there but it feels like
there's a usability issue with any error handling for missing firmware
on these devices and not registering the card does seem like a valid
choice.  That said it would still be nicer to initiate the firmware
process earlier in order to minimise latency and then either defer
registration of the component until we've managed to load firmware or
have a check at component probe to make sure that the firmware is ready.

> Another question is whether the firmware needs to be downloaded again
> during system/pm_runtime resume? That may depend on how power is managed
> at the hardware level, but in theory an SDCA device should report to the
> host whether the firmware is still valid or needs to be downloaded.

That does seem like a concern too.

--ijEPnn0yQQxdDGiq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYMR4UACgkQJNaLcl1U
h9DdZwf/f+U4X2SixedyA3/BS/eEc9tIpJ2U5ZcUAdK+826kYfmYWJskaqRJvDxk
DD09WbjBKkyTg28Hs5fko/1e0SnTe+5GrjVmtbhWymSb5xE0W8m8jIupWbG0gbog
YdikYvfq2GxPiECJy18gr2qPXyO18/jLqX1zQfy886Ojg4drx+ZnMOWtFkrnM0am
c8JUsei9LDgPqAMY8fSS5f7G7DpdYd4g++6dPPZKtiOfbi0cTMn9tShwenNF+/10
YP72eG40tWXAXG3YspH4/DSvT+oAeyud3SBIqV3qnmf3sOx/b54iNGmZI0tQp9If
PxkXX+odn9YUP5taCJGf1yOCVqSlHQ==
=fLjV
-----END PGP SIGNATURE-----

--ijEPnn0yQQxdDGiq--
