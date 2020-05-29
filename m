Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA361E7AFC
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 12:53:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 314CC17B4;
	Fri, 29 May 2020 12:52:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 314CC17B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590749592;
	bh=8U5a1MO/z+2ZYlwKk6XRLF8rVuKQjTLWUExCB3LYACU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hOThnJrh65WdaQTBVqD6JjwuUfmfdDTmj9bzxgXMNzvfI8vbvydZ2bFnIdmlhwujP
	 15yb5k1YIg2vmXXbQPSOjyV1xTYEZr60xVglmEQ6GC/prGBYHhr2xv8uiQPq8o7fdP
	 roODtrXtskhV24+Ej2O3B1verfLEZi+B+4eZsS5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6977EF8016F;
	Fri, 29 May 2020 12:51:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57D40F8014E; Fri, 29 May 2020 12:51:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D815FF80107
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 12:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D815FF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sFWxS1zt"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32FF12075A;
 Fri, 29 May 2020 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590749483;
 bh=8U5a1MO/z+2ZYlwKk6XRLF8rVuKQjTLWUExCB3LYACU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sFWxS1ztgF79SyVpUQemcY9sOvMWx3w6HJQdHEx1bdpMD5OZsd5mn7/PwlwJnJEDG
 frMwXDfE3HEbu80flevuCV7MI9KwVQPmilVIuKv14juyus32XuYXir8hUr2/1Zdmvd
 Ll9nzqBDCb03dLnFfDLWmTcRuBxC0LnfdZ4RcA8I=
Date: Fri, 29 May 2020 11:51:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] dt-bindings: sound: tlv320adcx140: Fix dt-binding-check
 issue
Message-ID: <20200529105120.GE4610@sirena.org.uk>
References: <20200528144711.18065-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Content-Disposition: inline
In-Reply-To: <20200528144711.18065-1-dmurphy@ti.com>
X-Cookie: The Killer Ducks are coming!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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


--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 28, 2020 at 09:47:11AM -0500, Dan Murphy wrote:

> Fix dt-binding-check issue

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Q6ScACgkQJNaLcl1U
h9Al+Qf/QviqRDpXTXjaVEBeM9WTzOiVI+TAiCq5U+WkWU9w/gz3bgkFgNvZzs8R
dK+hJsKzDojpzy/B7rewKyte5BjkUuoOBM+LNCkWn+Qiz9qEJ+XuL1Z+CA5gjUGa
dMtWxHnfgLJb14xcPJLH0BFkRu4aSqvOc7m8v6efre4tXJt7TAV5MaPG0nRHoMM/
9ASsWT2VUmMRpSzeCFGq+azL8NoZJLJpCtmGNSbsrAF5s98TAPibUpVbmvmchDW+
ZubEbXbfnhspEIbzRk/iFvC8SremBRme9Dsga7r3i7VcRRp/HVeU0RGnE/RUPSB+
P88zBO0iQmEjlYXnUZdtBSOdfc2b7w==
=STRG
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
