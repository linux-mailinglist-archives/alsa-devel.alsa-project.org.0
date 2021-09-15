Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9FC40C720
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 16:12:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD9261833;
	Wed, 15 Sep 2021 16:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD9261833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631715137;
	bh=YbvuYcfAW5Fjwy98n/gQJCW044gac9hZzpuoydBe/dQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o3TaebY1cmFIkyKAYQIcqol7niM6xgFsD4PRGELT3qINTkvDeVyHvTY7b7ZqtrOeU
	 7vEXU5pSEgePx6gg5zgBiT71tzjjwnbnZBqa4+jpNUy0Id4enzWxgLpBSsEW49umoh
	 ik3zb1HzueSRVsdrPednlfHmwI6JoHEYj5XGKTvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8614FF802E8;
	Wed, 15 Sep 2021 16:11:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03DA0F8027C; Wed, 15 Sep 2021 16:10:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64A0CF80117
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 16:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64A0CF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NhHMNxjD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D688611C1;
 Wed, 15 Sep 2021 14:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631715053;
 bh=YbvuYcfAW5Fjwy98n/gQJCW044gac9hZzpuoydBe/dQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NhHMNxjD3PIagYWukAJT16WejQu1Dbiq44S2cQuGmDemU2s0PzXskS0Mb6Irn2nY0
 BvejqDNI6tgKrU1ojfMAGWva+cvxOeL1smppWSvCJUDTI7NVGjiBan1X2KNSHfm7Cv
 SSpy5IqfbXrxWkAx/ybCRQtL/d6EL853pp8VMM72yCXx3IQT/T5e6tI417NVsb0NcG
 apEMwbvZhpq0W4c93pt3BoeiITIqoc9OSZs4wJcnpAcw2hMTEjTT57GRqIozJsev+y
 lxg8x+/sbjcNbn/yBiGmplD1n/bTKDfkkMtprEac4uc6TZbXNEVB2zY8NoV8SVuzGK
 BaTvvFkw5hLng==
Date: Wed, 15 Sep 2021 15:10:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: sound: add rockchip i2s-tdm binding
Message-ID: <20210915141012.GC12513@sirena.org.uk>
References: <20210903231536.225540-1-frattaroli.nicolas@gmail.com>
 <20210903231536.225540-3-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XWOWbaMNXpFDWE00"
Content-Disposition: inline
In-Reply-To: <20210903231536.225540-3-frattaroli.nicolas@gmail.com>
X-Cookie: The more the merrier.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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


--XWOWbaMNXpFDWE00
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 04, 2021 at 01:15:34AM +0200, Nicolas Frattaroli wrote:

> +  rockchip,frame-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 64
> +    minimum: 32
> +    maximum: 512
> +    description:
> +      Width of a frame, usually slot width multiplied by number of slots.
> +      Must be even.

Why is this in the binding?  This is normally configured by the machine
driver setting the TDM slots, not through DT.

> +  rockchip,mclk-calibrate:
> +    description:
> +      Switch between two root clocks depending on the audio sample rate.
> +      For integer multiples of 8000 (e.g. 48000 Hz), mclk_root0 is used.
> +      For integer multiples of 11025 (e.g. 44100 Hz), mclk_root1 is used.
> +    type: boolean

Why would we not want to do this, and assuming it's to do with
availability can't we detect it simply through seeing if both MCLKs are
available?

> +  rockchip,tdm-fsync-half-frame:
> +    description: Whether to use half frame fsync.
> +    type: boolean
> +

Why is this not part of the normal bus format configuration?  I don't
know what this is but it sounds a lot like I2S mode...

--XWOWbaMNXpFDWE00
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFB/sMACgkQJNaLcl1U
h9AyVgf/R1hx+9U5odYrV/J4RA9uPRmhSRnrn3d9jvqBMcYWbZUVHv4dTKqn4SqK
QUkjtLocXUuai3S1P/4XuaoN0HvXjNaPsGxo7967IUUgfxrWbRiBIsG+DQJiAMWS
95KX7lNSNmjf8ZGDY5LTp78M8fhzUpB0zedTNQw5D9r8aCHTBAmIUw+fKOJFlucS
ndk/eJHrgcxpcvaVZX8nuRdgAfJpv/i4v4+K6I/dAHsiGOkbFwiJiOIZ+psy7wpr
lp5ioBhSuQQEH/sA62y0nSDVXggOJEPp+APhIqeiGDTmiZ9gabhBClhDHQ3aylpJ
9vmhvE2NT59s90BGBWMnFEQfyqdk4A==
=s91p
-----END PGP SIGNATURE-----

--XWOWbaMNXpFDWE00--
