Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90841A91C48
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Apr 2025 14:32:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0B3C6E1ED;
	Thu, 17 Apr 2025 14:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0B3C6E1ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744893162;
	bh=+ACAu8sUqeQ0dOQtBFJqpjw2Dj9hZnB3LjLW9OKfxKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HhhN6tEVumSsBDkznSvYRFKwMzn9kW05TL2XSZDD0s+cdWZmGeDQwtgxjyt5GoLia
	 IYec6dW/U8i+iZXWK0XAfykbxnSTI0I5mktMjsHhzgwhvkbplQbXhXIhHgBUonKlsc
	 ilVVcEJhAyYQ1/BIK248VDOvSN4sDg7DpKUR04ho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E599F805C4; Thu, 17 Apr 2025 14:31:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23D2FF805C4;
	Thu, 17 Apr 2025 14:31:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 989A4F8052D; Thu, 17 Apr 2025 14:31:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9C0AF80027
	for <alsa-devel@alsa-project.org>; Thu, 17 Apr 2025 14:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9C0AF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lhfAj0yP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB2055C4B23;
	Thu, 17 Apr 2025 12:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D12C4CEE4;
	Thu, 17 Apr 2025 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744893102;
	bh=+ACAu8sUqeQ0dOQtBFJqpjw2Dj9hZnB3LjLW9OKfxKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhfAj0yPiPKImagQj8vSxXei499mlwfvBAZ9pEgHMI37NXULpBvkMjzlow1HATsTa
	 qKYz4wz5HrZx4UbLkS1abgZyVxq4C08gK58cLrH8vOL4Xdt/vvh0jLMhw8k/DPi2YD
	 EFowWTT3dS9tGNYX0yAr0xW1OJvb/WnQrtn0GkEe96DoyT3RAugIa7k3D7nw06gXeC
	 lhYyazgqh+jyc1gR/vgfI8YMnfNbHRcZrL9KV/5+WL06gIlwtoPQEMHFctAERfMNnH
	 pVpigDdzcemWnfMrcO4xAUBd4r0qmiya4bMCqSjtNCRGZuHYElUKfeChMWvGZfldqI
	 xr5Zifu8S/CMQ==
Date: Thu, 17 Apr 2025 13:31:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, tiwai@suse.de, 13916275206@139.com,
	13564923607@139.com, alsa-devel@alsa-project.org, baojun.xu@ti.com
Subject: Re: [PATCH v1] ASoC: tas2781: Add "Acoustic Tuning" kcontrol for
 acoustic application
Message-ID: <7bf02bdd-f4b9-4235-8d6e-e6e9acfc3273@sirena.org.uk>
References: <20250417104753.1471-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1B+WWLXiN5AT3cPq"
Content-Disposition: inline
In-Reply-To: <20250417104753.1471-1-shenghao-ding@ti.com>
X-Cookie: "Elvis is my copilot."
Message-ID-Hash: V4X54LR2PBPHYNAYJN3H4OGCRDW6DRUI
X-Message-ID-Hash: V4X54LR2PBPHYNAYJN3H4OGCRDW6DRUI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V4X54LR2PBPHYNAYJN3H4OGCRDW6DRUI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--1B+WWLXiN5AT3cPq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 17, 2025 at 06:47:53PM +0800, Shenghao Ding wrote:
> "Acoustic Tuning" kcontrol is a bridge to the acoustic tuning application
> tool which can tune the chips' acoustic effect.

> +	reg = TASDEVICE_REG(src[3], src[4], src[5]);
> +
> +	guard(mutex)(&priv->codec_lock);
> +
> +	if (src[1] == 'w') {
> +		if (len > 1)
> +			ret = tasdevice_dev_bulk_write(priv, chn, reg,
> +				 &src[6], len);
> +		else
> +			ret = tasdevice_dev_write(priv, chn, reg, src[6]);

So, this is basically just unrestricted register I/O to the device.
That's not a great interface - it just lets userspace do anything,
including conflicting with things that the driver is managing itself.
Usually a coefficient interface would just expose a specific set of
registers with the coefficient data as a control.

I know other CODEC vendors use the regmap debugfs interface for this, if
you change the kernel to define REGMAP_ALLOW_WRITE_DEBUGFS then you can
do both writes and reads for the tuning.  The tuning tool then produces
a file with just the coefficients which is loaded at runtime, with
anything that's normal routing or whatever being configured via the
control API.

--1B+WWLXiN5AT3cPq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgA9KkACgkQJNaLcl1U
h9DMKgf9Hr7cju+VJmaH5JDYrkKe+z+R3GB9yMCGPiVoleR/BtxLBbPted1/1BWl
9ILZZgmVtciAGJgNscVFQE55RKaJ25lOaZHGu8aVFLxl67HoJyLE92ICBmNdl/C7
cKnvRRY/GskZr6r1fEGRliEoZvCgzBwgrocfxcl5xMF+PzhZy1YhggsRcpGdxitl
l5sIaz+TmE84w9g2XLy91ruOMfewuDuOYyc1RfkKN82xFJe841WmcfvsDPf7518o
WhW+LlAFX97dJkEViZGfjVTHk0f5AYSdCjRvxG1zKg2eiFMUpvm+yISv0pm/Qetf
peSV6M7NIEUFrheYOMmGXKCGb8wJQg==
=v2cF
-----END PGP SIGNATURE-----

--1B+WWLXiN5AT3cPq--
