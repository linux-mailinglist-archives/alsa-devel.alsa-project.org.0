Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FD386B5D5
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 18:22:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B384868;
	Wed, 28 Feb 2024 18:22:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B384868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709140964;
	bh=IdzX1daifoNbsjtYDp3Q/p54xzf2vmD7Pd4A4jPXUVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ff11q+FlDu8EngyZv2h/+fJe7mUVMg9IzR9IU3f1muV6ui0uWZ9FSjU+tFdMq2l45
	 8CiUwotmpyxIeigxb4RB8B675LdYE6R7O5vkKGPCBFYIO+0ehm1H63xFJMiAX4Nazh
	 igGY6jU4KiHveUoU9BI2BgVNlw+qGoREqaPrrOww=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E79CF80587; Wed, 28 Feb 2024 18:22:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7EFEF8057C;
	Wed, 28 Feb 2024 18:22:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64CB6F801C0; Wed, 28 Feb 2024 18:22:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1C78F80087
	for <alsa-devel@alsa-project.org>; Wed, 28 Feb 2024 18:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1C78F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ms/GE9ra
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C058618FB;
	Wed, 28 Feb 2024 17:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DE0C433C7;
	Wed, 28 Feb 2024 17:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709140916;
	bh=IdzX1daifoNbsjtYDp3Q/p54xzf2vmD7Pd4A4jPXUVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ms/GE9rasK+9LhTcZthY7FTR1yQhhlpPZkFs9ZBMvGJ/CjHBYEwEEvlYNRWCnokBt
	 EYT+nZHQVAEsGo/sUgsKOYy78OoQQcYdLfoc/mL0bfVFsCmDp1STIaDfBfDZIcNGVW
	 3JttXvJElftsFg+MJ7Y9tuH5nRWhdnxXfj4SEFwiBHpETPajQ17cRI+2SpeCF4mAEe
	 5KyjaSrBWakzNJJOLQIdy07TW9pkMZSah0+fbFsXaqnTKwRRtxXUxIzK/rlAY+BBu4
	 caDsofjI0jI+sXSYPkIGMLbhdUr0ekO7xrDItTf8r2PcXWi+nZY/F0QX4GqM8Z6Vnv
	 mjVDoN5jOUT6w==
Date: Wed, 28 Feb 2024 17:21:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	tiwai@suse.com, perex@perex.cz, jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
	tvrtko.ursulin@linux.intel.com, intel-gfx@lists.freedesktop.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
Subject: Re: [PATCH v3 2/5] ASoC: codecs: hda: Skip HDMI/DP registration if
 i915 is missing
Message-ID: <d79e0336-58c7-4ad1-af5b-fc6934c2e921@sirena.org.uk>
References: <20240226124432.1203798-1-cezary.rojewski@intel.com>
 <20240226124432.1203798-3-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ai/7cep230enU383"
Content-Disposition: inline
In-Reply-To: <20240226124432.1203798-3-cezary.rojewski@intel.com>
X-Cookie: Function reject.
Message-ID-Hash: FVOQEHINCGRCDXIMVYWKDA6AZ5BEWGG7
X-Message-ID-Hash: FVOQEHINCGRCDXIMVYWKDA6AZ5BEWGG7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVOQEHINCGRCDXIMVYWKDA6AZ5BEWGG7/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ai/7cep230enU383
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 26, 2024 at 01:44:29PM +0100, Cezary Rojewski wrote:
> If i915 does not support given platform but the hardware i.e.: HDAudio
> codec is still there, the codec-probing procedure will succeed for such
> device but the follow up initialization will always end up with -ENODEV.

Acked-by: Mark Brown <broonie@kernel.org>

--ai/7cep230enU383
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXfa60ACgkQJNaLcl1U
h9AIxgf/aE9dWFzQfCG0Di32ndV0EqQxs1Nz2hFLNJ6P6zBxMvAzajZB3qDjJ3XI
xXw01xKmYAvK377Gp7p0LnR91wMO62ePladK4ECjIlgu8Ju2Frd5gdR/aRpuKWv+
aCcfrEVcwaz9aCuKA/5ZvbwKHRlvoyNMfCX2nfr9jTrbYA0oYF6HvpGJYvwaDwnp
7yS2ITem2+OoKrx4jDZ2cLBaZO6FE3TOAVeHBRr9B5DsFX9mK11VFaIfKCYKeYqS
czXdWiRwzujKV66cf8XxbUWHaqd52UOR+h2L1GvX56rVKcq3FkuCQqmb3VbCuImf
O6gbkzuB43qmtFANlYGaT1Q9EcXk9g==
=wTRz
-----END PGP SIGNATURE-----

--ai/7cep230enU383--
