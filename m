Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E473B339132
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 16:24:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68A18175E;
	Fri, 12 Mar 2021 16:23:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68A18175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615562681;
	bh=AMf6zMSzhPREXhU/v6XQo1ZUt0g8P00iHzAJO7Byljg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K+uGOnEFiWGhcKRe5Sy1RuiGrQUW8dpARgEUhxD3wGAV/sP6+wiVTi28PuWzmaURi
	 raVY6sROW7xzN0qNhOKJacACuESit9l9D3QzLpptWzVQoujDuQYv67x6xuae+XWXld
	 vXzOIW7DjqIXTuzO0mRSkdyztnUaTEJyoUChbuXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BA6FF800AB;
	Fri, 12 Mar 2021 16:23:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89C91F801D8; Fri, 12 Mar 2021 16:23:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A83A1F800AB
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 16:22:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A83A1F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="faezP91f"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F4EF64FEE;
 Fri, 12 Mar 2021 15:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615562576;
 bh=AMf6zMSzhPREXhU/v6XQo1ZUt0g8P00iHzAJO7Byljg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=faezP91fqurYft+SrFRsjkHWj6RCo+ZPtBfbVj8KWXo/7O65fhiWMB0++W1DMIahc
 YJhzxpVvB0c/QHY3nQGKVPb6GLdz5Km0En5Wc3C2N1HCFMY8E2FXM69j1muZoMgn87
 O5fg8wBcw35BYogj7XrNlZZcebJtBLHQLrRY1XR2mUXpIFV9vmJiubv6mzslwXhUcA
 ofF8ewXHmCeafcy4HVQuGwjtGFb73MW6uO+/stRsFXGy21H7pMC0O9s44CJX8Prljx
 3WXvCeGPtjkhjkVLnbl0mOVYrh9tkgx5eZFua4m/f47pa79V9ULslPOYtv04eSKJG0
 4edz0+rZ5+QXQ==
Date: Fri, 12 Mar 2021 15:21:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/7] ASoC: dt-bindings: wcd938x: add bindings for wcd938x
Message-ID: <20210312152143.GH5348@sirena.org.uk>
References: <20210311173416.25219-1-srinivas.kandagatla@linaro.org>
 <20210311173416.25219-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rCwQ2Y43eQY6RBgR"
Content-Disposition: inline
In-Reply-To: <20210311173416.25219-2-srinivas.kandagatla@linaro.org>
X-Cookie: Lake Erie died for your sins.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
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


--rCwQ2Y43eQY6RBgR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 11, 2021 at 05:34:10PM +0000, Srinivas Kandagatla wrote:

> +  qcom,mbhc-hphl-switch:
> +    description: Indicates that HPHL switch type is normally closed!
> +    type: boolean
> +
> +  qcom,mbhc-ground-switch:
> +    description: Indicates that Headset Gound switch type is normally closed!
> +    type: boolean

Why do these descriptions have exclamation marks?

--rCwQ2Y43eQY6RBgR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBLhwYACgkQJNaLcl1U
h9AYyAf/a+HKOx2YyKI9UX8A/9i8G3AdZdyJCOvJrDKwriB9VXplLK03qknmy6f0
3cwUy0x8cIfzCHZK569wSDUKCms2D8JSbDzLw9MDTlhxHChK7LMS/w92b6LiPwsN
6/4oQwEmnk9Uk9ln3tFf/+1r2aqq3Gpk1Y1ZUzeG92QWw2c7IcoVGAWzO8GDa29B
6oU/ufn6DWt3DWFhWMljZoE4phnBTWyfjxzd5Np6EkH2CgCZ6hBY7FwNjGOkyH9H
xvghPGfsi3MV37f9jRWLkgkGrM8ArwUQYSFunqICsCKbesG/PcfWhIrgT1LLmzMl
4ozsGGApVF0FAlwsbRPjQUp77isR6g==
=UBpv
-----END PGP SIGNATURE-----

--rCwQ2Y43eQY6RBgR--
