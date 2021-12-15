Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A6F476338
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 21:26:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D388017C5;
	Wed, 15 Dec 2021 21:25:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D388017C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639600003;
	bh=BVkzCzFwrOwCwYtYhefPQ6DcWed6QHqjelnD/Kl5z40=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t8YMnqgo+Qx2PjEEATXX0NVYj+Mevtbho82pn+RW1KtOByxwZ61PgMo4JkdaBf/LW
	 kUqAm2esowxgC1bWI8pdWNs3yfNXCuwWnCt3azqU/RXMggXDBYvzR4/eA5m8m1QA3w
	 7EShjG3USeJStsaoRHlQsCzy201hY/9M55nJLZ94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41190F8014C;
	Wed, 15 Dec 2021 21:25:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21D5AF8019D; Wed, 15 Dec 2021 21:25:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA971F80157
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 21:25:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA971F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RCtu/Roq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C438B61A94;
 Wed, 15 Dec 2021 20:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83D9C36AE3;
 Wed, 15 Dec 2021 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639599928;
 bh=BVkzCzFwrOwCwYtYhefPQ6DcWed6QHqjelnD/Kl5z40=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RCtu/RoqhecceDeymibV29/lFoWKyAgE74YOq7yR1BiJae8NrnLmXWA9FFLkFPlRf
 +Q/ouiPMkOUxU6ftt1lVERwV0rCU3/4IibMZBsMLhcGyLgEMcuNF+Onyg65ajMei4Z
 tecUOC5ZtXmrGgxM8JeRu08TTwok5kpLJNBcl4MRza+tMUI5hYDlZUt0T9szhtAJsp
 3R3guhftWuUcMpTwpZOKRSVLY18nWCmQQ5+bidm+tvRFYCCew9i7QX8IMlIaRYnFj2
 Q0R/Aei1HuaveFEPDLLEsVZiFdlT2ePSVr9VYbPdU+abMf94OZ7XQlJZZ8+SQZH3an
 bKDPtTVUWne2A==
Date: Wed, 15 Dec 2021 20:25:22 +0000
From: Mark Brown <broonie@kernel.org>
To: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v2] dt-bindings: sound: nvidia,tegra-audio: Convert
 multiple txt bindings to yaml
Message-ID: <YbpPModNbC1aLWvy@sirena.org.uk>
References: <20211211224946.79875-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lvwbvfwXnj48lQFC"
Content-Disposition: inline
In-Reply-To: <20211211224946.79875-1-david@ixit.cz>
X-Cookie: Void where prohibited by law.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, ~okias/devicetree@lists.sr.ht
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


--lvwbvfwXnj48lQFC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 11, 2021 at 11:49:44PM +0100, David Heidelberg wrote:
> Convert Tegra audio complex with the
>   * ALC5632
>   * MAX98090
>   * RT5640
>   * RT5677

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--lvwbvfwXnj48lQFC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG6TzEACgkQJNaLcl1U
h9AePAgAg6ul9yfOmKkMFgIJAAizLWOO5NqKi49ulaQFjkUkT6t369xEd3ypgnbX
+fdj6ae4ZqM7LHJFuyht8V+oJ74bdZ02bezUXvh4FrILkiibqFfR6OkIGNpIHemK
o1BpcH4wXGSy2qIbrUa6kVPwhzK40//o1pfskfzG9EN7FAmcCCnbwuOPZPKbrTt4
xOyNCP3kd6h4S0yt85jGY4T/czPvvAqM/0FpvqMtWbQNFxk5ULsvbZUESVhCICzl
8YTgGUpYnrbwJL/bXKTc4Kg3I0WYCoS5AcFNQJFI7tiruY5fDQxIDiafZ7EDk7RB
EnVAWBDelCmTSLxhwJamgK2+tTMzNg==
=/kfI
-----END PGP SIGNATURE-----

--lvwbvfwXnj48lQFC--
