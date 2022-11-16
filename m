Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0460662B8F5
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 11:37:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2A81699;
	Wed, 16 Nov 2022 11:36:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2A81699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668595052;
	bh=xr0ZFEuvOSQiO5wfiC76J58bkTvGiFrjjH6PQxaZO5k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E3xxCXOirhR+sJqM4P0he+sHN4yxeT1SRDA6DNd+OUpQkfo59hQAMM639QQ2IeNEZ
	 d4km1Be0egR51ZAWMsNn1jA4MmLawDtUXcbrk7qRYk+zcWhyt+DiY3q3fye50SuOQI
	 rlAej7QGb1uOmuHGLuSGkcCltvRE4VyQZNYArNx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2401BF80238;
	Wed, 16 Nov 2022 11:36:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61875F80163; Wed, 16 Nov 2022 11:36:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 209D3F800B5
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 11:36:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 209D3F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UFTePH/M"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 07871B81C68;
 Wed, 16 Nov 2022 10:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DAAC433D6;
 Wed, 16 Nov 2022 10:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668594990;
 bh=xr0ZFEuvOSQiO5wfiC76J58bkTvGiFrjjH6PQxaZO5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UFTePH/MoPTDEWRX890cVPfR1MHcHAFjHWdVyL5MoJaD4MEBi7RzIlCRQubyY6fCm
 XsYIu6buhSd/nmDTfe3ImvLeugaSKTDlYBdDOtKtEKoPW/E//Epgaw5AtFrHdYAaqP
 ce45TaGoBq3l/Mx7SXDFeti2ZCeKETfgTMysX7yUqkYPDGd6ykQ3ZX/xgW6tKuFWa7
 TbT9mCKMREtDuoyne8wJHsLc31hoNOCdjyn7NILrforZ90PXG2F8QU2Ilg3xR+TqOQ
 hblaWN0OYX5cfLMhlK8fUJGFR1X980yYUgkECbsox0GCjoBxIxAJo+kw9xHcScr+YK
 j/IWUIGJpVX5g==
Date: Wed, 16 Nov 2022 10:36:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 01/11] ASoC: ak5386: switch to using gpiod API
Message-ID: <Y3S9KzTE1/UQDmJl@sirena.org.uk>
References: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h7qtd7ThTgGLXAiT"
Content-Disposition: inline
In-Reply-To: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
X-Cookie: Ego sum ens omnipotens.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
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


--h7qtd7ThTgGLXAiT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 15, 2022 at 09:38:07PM -0800, Dmitry Torokhov wrote:

> Switch the driver from legacy gpio API that is deprecated to the newer
> gpiod API that respects line polarities described in ACPI/DT.

> -	if (gpio_is_valid(priv->reset_gpio))
> -		gpio_set_value(priv->reset_gpio, 1);
> +	if (priv->reset_gpio)
> +		gpiod_set_value(priv->reset_gpio, 0);

How are we ensuring that people have described signals as active
low/high in existing DTs, and are we positive that the signal is
described as active low for all devices?  In particular if the
signal is described as a reset signal then it's active high even
if we want it low while the device is actually in use.

--h7qtd7ThTgGLXAiT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN0vRkACgkQJNaLcl1U
h9D1rgf/VLoZNVdVmRG2xIS1Qw17P/t1wYsB8UVBspaMvTjSNSnjGcwv5z+bOOpF
WgMWL7VxfEBieL54y6eF3uKjxqj/2RbHVuFazbkfr47QTTIpzECfPe978XbGdsop
FA9NZ58iFXc/4HhB5bTzFsPMt5qSm/5U6+fvsc94ZQzqkHibUx1oTcKWcvlY+Mqo
VRNl4x9SCsmgLWpHPxictCmvqom2ihFK8qVZuZ/DZ+8p7FS6htHSfQ5+w7pidevq
hzZRm8phlVdEMmWAUdYmpMIg4KnJyl13S4WeG5Px2ooSzJ36ERfpVdUrNzbgdlsT
qshHayqjcdk5o0yIMlQ8bKHYN+SFTA==
=uraK
-----END PGP SIGNATURE-----

--h7qtd7ThTgGLXAiT--
