Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9633F5599EF
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 14:55:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 377EA184D;
	Fri, 24 Jun 2022 14:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 377EA184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656075316;
	bh=Blt4WEdyJt5CXJdrRZBIXF6qj7NFonfG6LIluE7tSFg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I2SOe/w4vzXRvAtkLiS0cdon84RW8k1eyTydbkQvPO7BEgxCsmtIVfxgI3KMS5VdM
	 aQEp0DbyIZyyxemBhN6mWvtlYmRxKQTJiOaZiloc9dlqH614Ij7vkflH189w+xn8ZN
	 l10azyrHBJWvuudBu48Y+zgnl8hp1xHP5nD6V0ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1090F80165;
	Fri, 24 Jun 2022 14:54:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A029F80139; Fri, 24 Jun 2022 14:54:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A8EEF800CB
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 14:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A8EEF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MeASBDJA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B856DB826A7;
 Fri, 24 Jun 2022 12:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FD5C34114;
 Fri, 24 Jun 2022 12:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656075251;
 bh=Blt4WEdyJt5CXJdrRZBIXF6qj7NFonfG6LIluE7tSFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MeASBDJAVnnuFDoHp7vJDt3TTspKDX0bPowRJJaWEP5hxDiiMxmbukGld+7XWuOAd
 xRO/lZ7LERdtjIYOHD5carhu49TJhppBxWfLeF9mhi1SPyItJEbNVKnda8F5T6ErGk
 roC0rR6TLY5rGF18Houl2Ra6LT/vNCQ+xbTxdmTWlcPii8gsveKwAX24EGnHOyFKM1
 MXH8Uj2+YbK+IQb1tOMDNuaYhvClGRKz6LLyZ+79wAyx7agfKZLwGfkHYoG+91VR33
 CRoIyMDF9JLTEeK26oeZJoMrRb2TPsGQVCGsStkhK01uXopAMT+ls5+U5a0fyEJhTY
 o6X1BvLeH2neA==
Date: Fri, 24 Jun 2022 13:54:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH 8/8] ASoC: max98396: Fix TDM mode BSEL settings
Message-ID: <YrWz7lNdI63xT0R/@sirena.org.uk>
References: <20220624104712.1934484-1-daniel@zonque.org>
 <20220624104712.1934484-9-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ueqfVGDcT7oSKScO"
Content-Disposition: inline
In-Reply-To: <20220624104712.1934484-9-daniel@zonque.org>
X-Cookie: Help!  I'm trapped in a PDP 11/70!
Cc: devicetree@vger.kernel.org, ryan.lee.analog@gmail.com, robh+dt@kernel.org,
 alsa-devel@alsa-project.org
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


--ueqfVGDcT7oSKScO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 24, 2022 at 12:47:12PM +0200, Daniel Mack wrote:
> In TDM mode, the BSEL register value must be set according to table 5 in the
> datasheet. This patch adds a lookup function and uses it in
> max98396_dai_tdm_slot().

Similar issue here with fixes.

--ueqfVGDcT7oSKScO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK1s+0ACgkQJNaLcl1U
h9Bkfgf/aPjvZgbz6nuHlsuAtJ0UyrQwbMImuGt8tVBiB4YyxPeA0+5feSk4jFO5
OgDyrBUukAMqaKkXys8Bvm5Jm49j99WhsnPCuYDg1K1i1+i7m3PkgfT0pxS6oYdx
W+iUYSWb/BI0cA8lyI5f+AlzzQ1EflJAF8q11BzPGBUC61pC9uxOQbUmKYHx6G2R
2++nnsB50uOI9nfNs8Ji41grG3ZKrjsOBJnbrEUUjmUnWjDeFsnY8e050HZsxgsQ
YXWH1hzG+am3myAJ8JvkeWvc2LbXIS3ASKQl/Z5/uJucFE9PnEagK3Meq/Q4Hjx5
9jCmMj8ESeIjetIE1b0/RcoOOy1nrg==
=jFL6
-----END PGP SIGNATURE-----

--ueqfVGDcT7oSKScO--
