Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B711B4F97D7
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 16:18:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A52B1811;
	Fri,  8 Apr 2022 16:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A52B1811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649427536;
	bh=4kkFk4FeV2cQUpezVSuLmn1tArjBSTTIFKN+BJyZrqI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kzUsccT/WzyXP6z+f78n8j8G8WZcR1PCVr7tQ23oblWxl/cpgZ6kDiwkQNizWIqFX
	 +cerxaj6crKqvgBh7hKzhnIeMmRwaGqR0kJejczxDdTiAujdhY9uUY8UmQKKURxNur
	 7ujAx4GfTN9u74zQJXyebvOMWV/gq6sbjlSVOynI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D47C2F80054;
	Fri,  8 Apr 2022 16:17:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1141F80054; Fri,  8 Apr 2022 16:17:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DD9EF80054
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 16:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DD9EF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cBMJWas3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EEC7D61B77;
 Fri,  8 Apr 2022 14:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B94EC385A3;
 Fri,  8 Apr 2022 14:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649427465;
 bh=4kkFk4FeV2cQUpezVSuLmn1tArjBSTTIFKN+BJyZrqI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cBMJWas3QpUB/Buc5jr2T1frwGqmiUUqY2DMnRpnLr4GI1o/inVZffrvUcc8MLOFP
 wLn9UD5RuE3YGKJ/a03LNLlkD4lUDl8RR2w18I9zC6ZboearxGL0L1ddPDV5YDKDBM
 0lOx4Hg8XK+kKxs+9TCY3IBo3gaTJW7gTM0HMGT6bur5adN8F7bYqg/Cqj4vRGsudU
 0SImlQVnVaqOqb5pZk0szNKI1sQolSh9emKcjT8GsCgTJ/QChJh/BnD5IQ3eOVd5tb
 9aEwrO0wmEYVPvfxIbI1z3oMhrq6x/9vOWsX/v2+kR9XktTH54PLWsiX+0p7hPPLaK
 puG+BaIjifs8A==
Date: Fri, 8 Apr 2022 15:17:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v1 1/2] rename tas2764 to tas27xx
Message-ID: <YlBEBO5BFk7+txRU@sirena.org.uk>
References: <20220408141119.958-1-13691752556@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Uch6/VU9xlo2MkT3"
Content-Disposition: inline
In-Reply-To: <20220408141119.958-1-13691752556@139.com>
X-Cookie: Look ere ye leap.
Cc: navada@ti.com, alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 raphael-xu@ti.com
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


--Uch6/VU9xlo2MkT3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 08, 2022 at 10:11:18PM +0800, Raphael-Xu wrote:
> rename tas2764.yaml to tas27xx.yaml
>=20
> Signed-off-by: Raphael-Xu <13691752556@139.com>

This is fine but it's just the binding updates?

--Uch6/VU9xlo2MkT3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJQRAQACgkQJNaLcl1U
h9DgxQf/aZa9fef8khP4NM+WYZe5tf3BBow4usDvmWfTQkK55yZO+KkNyU8IhEww
vbdRgMclUk7xhaIeQgmtzrSxG8jE4KTt13ui+JOAiHI25cU2EyEPad6qkuEUCsd2
mKsTjb7lKS5jUe8C6M/zwisMdNnS3GPc2QZosdAy6VtPEQghQai7PdYFzGerWsHH
XjiKeZmZ9CQHi82s9RR30mAR5l2rzZi1x37szvCUgn1c/AWhfIPfWusealyQEBiA
zw+nyU7L7fh5WirgCIm+ueS/ZPTtksKIA0gqytgfDze0pgvR/0CkLvFHUA5EO1Ej
jrr5r1Ky4leq3Cy55VDopDncm7I/kA==
=sjuV
-----END PGP SIGNATURE-----

--Uch6/VU9xlo2MkT3--
