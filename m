Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB181951A8D
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 14:07:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C39F2BA4;
	Wed, 14 Aug 2024 14:07:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C39F2BA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723637277;
	bh=Do+vRqFk3k2SU3SkNGODxn8srvn9XYlrm53yrCnGCYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eHfbaY0kg1iR7171Rs+SFVavQ8gNjdbPJ9vqKFrr0bAqXDcNkgHrwR/yCUJ8MV2sJ
	 BIiC+wOzfJDKn+rBWBoIvNl9KFAT2CVUBwbqs9yVLecy/kB02L0owR0Mej+rLMZ+7P
	 cCRyKMRgubiBHHHBtmCButWRHNIis1GZqwtu6J3A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB764F80301; Wed, 14 Aug 2024 14:07:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FD04F805AE;
	Wed, 14 Aug 2024 14:07:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E656AF805BF; Wed, 14 Aug 2024 14:02:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F296F8016E
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 14:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F296F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xdrgwd6z
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E8F92611BB;
	Wed, 14 Aug 2024 12:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513C3C4AF0E;
	Wed, 14 Aug 2024 12:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723636922;
	bh=Do+vRqFk3k2SU3SkNGODxn8srvn9XYlrm53yrCnGCYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xdrgwd6zr79yfP4OByUaHduLcIvB3bdIICl9FbDrag03yrzRMnwdkn7r1Uyol6uwm
	 v3jPydlL9du1u1OLjWgjKLILO59DLhG+gwp5YbkumAEJ26HboOTdyY8y+tcWQOEcYR
	 NdfQQYWqynAXHKi4nLiXB2QKcw+oXluACYXjJZ7ULfs2COFDG94Y50f+k5Y6UQOikf
	 5jslKifX0nKNs89yg3hDdgAxlBqJyoRk9xx/f1i2rrKrUFQG9mnMUicawoFCtRM1Ge
	 RdW0xUDyAoCQ5VJeUL1xP0Z5idh/K8lcLXY15/BBlqA7lo9eSYlJ6rmzg20TKIlvDV
	 3qvZ6zZkIPr/w==
Date: Wed, 14 Aug 2024 13:01:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com, yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com
Subject: Re: [PATCH v1] ASoC: codecs: ES8326: Adjust buttons
Message-ID: <ab3067b0-ac75-46e6-9761-f69fa9bf0482@sirena.org.uk>
References: <20240814060921.2521-1-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TIYwVcJFUGUDFnue"
Content-Disposition: inline
In-Reply-To: <20240814060921.2521-1-zhangyi@everest-semi.com>
X-Cookie: The second best policy is dishonesty.
Message-ID-Hash: MHQ2WB23FGNLNNZLR43RQQVSEDPLGQTH
X-Message-ID-Hash: MHQ2WB23FGNLNNZLR43RQQVSEDPLGQTH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MHQ2WB23FGNLNNZLR43RQQVSEDPLGQTH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--TIYwVcJFUGUDFnue
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2024 at 02:09:21PM +0800, Zhang Yi wrote:

> To adapt to chrome, we have adjusted the buttons to match the system.

This needs a bit more of a commit log explaining what's going on.

> +#if IS_ENABLED(CONFIG_SND_SOC_MT8188_MT6359)
> +	const int hs_keys[] = {
> +		SND_JACK_BTN_0, SND_JACK_BTN_2, SND_JACK_BTN_3
> +	};
> +#else
> +	const int hs_keys[] = {
> +		SND_JACK_BTN_0, SND_JACK_BTN_1, SND_JACK_BTN_2
> +	};
> +#endif

This will remap the buttons no matter what system we're running on so
while it's a bit better it's still going to cause issues.  We could use
a per board approach like this but it needs to be at runtime, based on
the machine compatible rather than a build time selection.

The support for this device was added in e794a894427b1d ("ASoC:
mediatek: mt8188-mt6359: add es8326 support") which was added in v6.8
so this would also be a potential issue in mainline, given that this is
likely only used by Chromebooks and didn't make it to a LTS yet we could
possibly give it a go but we might have to revert.

--TIYwVcJFUGUDFnue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma8nLUACgkQJNaLcl1U
h9CIBQf+NR4j93SkZs8iU+hbVLOQ9+qlGp5LoJOOBWFQ2w69EszdTGgFbERSMJj2
Qzzmdicurmrh1N3pDHBfjakwttxiZRBjR6YCT6eW9Rb5cZQ26AJZCeQwjldqY5mW
v+DGjy3Ql5x0c0q3OXtFycasatfzvvNZayzCytzuUvifRelpNb+J6Yg2bz1aBpMQ
bw7CilHIehfNgb7ipG7aEj1S4bwHjwgqRAPo6yyaeRWjYU+Dqm4DpN88Tc/mZ0uV
ddZ7xpPZ49epopEAB9Mt1k4Bz/ZHo5yV1o4SjELjgHr0jA6u+TaGVtmwfre4miYB
r3IhnlCdoOyrEq2WZ7DfGS5Yl/uV3A==
=y2+5
-----END PGP SIGNATURE-----

--TIYwVcJFUGUDFnue--
