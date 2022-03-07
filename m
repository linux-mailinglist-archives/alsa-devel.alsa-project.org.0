Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E71254D0286
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 16:14:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 710B016A2;
	Mon,  7 Mar 2022 16:13:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 710B016A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646666073;
	bh=QRW2RyTSOhboFthSYoyDRc4nKPsN9M47AoNVFFmLTzQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OxQTtWz7Z1jl+2FdPydRMm690SJB47+py7bwUXTSMv+Knt/kZG6diMgotKVNzegM1
	 6gvvXXUfzUVJmwNz8QbZDsegVjEUJRRjHv1r8OVRqOS/+VkBiZYu0Sl/nqfrnthopK
	 34bN2zeTYaXT/yqWU4GtPJEYnG/XyBtWmfqVUNU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0CA9F80159;
	Mon,  7 Mar 2022 16:13:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74128F8013F; Mon,  7 Mar 2022 16:13:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3650CF80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 16:13:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3650CF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sTTg8qiF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8CF99612BB;
 Mon,  7 Mar 2022 15:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B68C340EB;
 Mon,  7 Mar 2022 15:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646665998;
 bh=QRW2RyTSOhboFthSYoyDRc4nKPsN9M47AoNVFFmLTzQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sTTg8qiFESfVb3+Dtnxu+MSTKtwVEAo6cIs+ry6615RmrhGucYmGEVKVBDkaiQxZC
 I+afnOArHT1cxt7dYjW1CAaQJQKn7UlLBtYH/ybR/Pj2YbMCCTTXdimMt/w6u9hzFc
 8uHUwavMgd7k1LPoGjHMj0dXp9WoHFNc2bIyA555hxo/F9Yq76VRmXe/xfDRZT7UYG
 +soacU/X2yFL/xtmiVh47VC4E7GgH/JIQFaGXQWzyDPxwPZovCH/QunLY+tgwYFCMf
 SdzNaYWqjnjl+xtl3ez2OxZEvKHcrxTaoTT4i85rQvSYDaRC/BEDAuQYoH77un21qZ
 akZ8w/p6o7Z9w==
Date: Mon, 7 Mar 2022 15:13:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Alifer Moraes <alifer.m@variscite.com>
Subject: Re: [PATCH] ASoC: simple-card: add bindings for amplifier support
Message-ID: <YiYhCEgHILYoDH4H@sirena.org.uk>
References: <20220307142923.28365-1-alifer.m@variscite.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OHnuGjMM4wK2ZTjf"
Content-Disposition: inline
In-Reply-To: <20220307142923.28365-1-alifer.m@variscite.com>
X-Cookie: Whatever became of eternal truth?
Cc: pierluigi.p@variscite.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, alsa-devel@alsa-project.org,
 eran.m@variscite.com
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


--OHnuGjMM4wK2ZTjf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 07, 2022 at 11:29:23AM -0300, Alifer Moraes wrote:

> +	priv->pa_gpio = devm_gpiod_get_optional(dev, "pa", GPIOD_OUT_LOW);
> +	if (IS_ERR(priv->pa_gpio)) {
> +		ret = PTR_ERR(priv->pa_gpio);
> +		dev_err(dev, "failed to get amplifier gpio: %d\n", ret);
> +		return ret;
> +	}

This would need to update the DT binding document.  It is not clear that
we can't just use the existing simple-amplifier binding here though?

--OHnuGjMM4wK2ZTjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmImIQcACgkQJNaLcl1U
h9CPwAf9HbpzVhWhChyQy+Fwd0TYD3iOOJ1H6RF/w62+TZlyS43sN2gaXswUiWhL
mf5lJSl26f7a2i+ZmC6WTZI9IAcmws5GzZ8btqzwCbq8P1//5OOi6j3oB50a7pBg
DK6xFxdv2xs9jdBeHAnvhR5UH81T41BQKBg2CexHPfmBjwAZi8wY315hOpG/rb5m
IxXZWw7mSy1VzAjBIYkDuULoNizQtdwTAdsEuAykAWRb5H9VtjLvyRdkWL65Es2U
Y4djQ20MFT4Ie1VbHIJyAoItBAtbbDl6CeaPVtMs7dVjZ9X5iSg+FH9GWCzfXXSc
Rr1GGoZ5cU6G8TbD5kxS2av/ncCIKw==
=Yhyl
-----END PGP SIGNATURE-----

--OHnuGjMM4wK2ZTjf--
