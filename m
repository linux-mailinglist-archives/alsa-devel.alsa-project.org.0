Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F287B3DF397
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 19:10:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80EEC822;
	Tue,  3 Aug 2021 19:09:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80EEC822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628010610;
	bh=+LKKiI1JV00lrTwHMho5wocCtWGVV0fIOWNcJuHlHa4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LAEkSaIuCivATtEGABc5n/Ao3EZ0fNz6N1dIrN946P9gDuR0D4lbrQbDEMjh7KIJm
	 pkcB/hfc1Ydjr2oUxttlTs00NoQ2bVR66GclKOr52pXPtGr+kbgHCN+mYIOWGJdaIK
	 9tvBpcJSxLq/ldSAde+BoEmfLBX7gQITcP0KGmAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8CFAF80082;
	Tue,  3 Aug 2021 19:08:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAF3EF802E8; Tue,  3 Aug 2021 19:08:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58D70F8014D
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 19:08:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58D70F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JDlYAx0v"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2065560230;
 Tue,  3 Aug 2021 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628010512;
 bh=+LKKiI1JV00lrTwHMho5wocCtWGVV0fIOWNcJuHlHa4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JDlYAx0vsZ/++deZmft1gx1C5nBFmCAEfo5FJAkYI8YwuA4VO/jC1jTsFoLXiQILV
 +icTUjBevOsNxyDugtBnb8zIMviq8kjb3etux6BvwlhV79a2ZUNg56nL9oo/VQfQWA
 t34P61zzGGV8Zjk8PetjwQiQR3gXLcQP5KT1f0tHs11EyFkOVtfZc4RWaQTEnsKFpO
 Y60OQQDmGH5w7qGxGTLfkusENXcHSt/RAvcdzB+xmSVUOpOoCUOy4h+sLus80CTcap
 7t1zQ4CmimJVyke/DEXlyqihlTbCJd1jLUJvSLpq06cw1O5NCSUDIDKp5101mKNpUB
 wwk9PBQtxc5Mg==
Date: Tue, 3 Aug 2021 18:08:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 02/14] ASoC: test-component: add Test Component for
 Sound debug/test
Message-ID: <20210803170817.GP4668@sirena.org.uk>
References: <87a6mhwyqn.wl-kuninori.morimoto.gx@renesas.com>
 <877dhlwyoz.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YyxzkC/DtE3JUx8+"
Content-Disposition: inline
In-Reply-To: <877dhlwyoz.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: There's only one everything.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, robh+dt@kernel.org
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


--YyxzkC/DtE3JUx8+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 20, 2021 at 10:39:42AM +0900, Kuninori Morimoto wrote:

> for example,
> 	test-cpu    : silent  Component, silent  DAI
> 	test-cpu-vn : verbose Component, silent  DAI
> 	test-cpu-nv : silent  Component, verbose DAI
> 	test-cpu-vv : verbose Component, verbose DAI

Should these be runtime rather than binding options?  Or at least
properties rather than something that's part of the compatible.  It
doesn't feel right to have flags like that in the compatible at any
rate, and if we're making fixed DTs for test purposes (eg, to run in
qemu as part of a testsuite) it's no more difficult to use properties.

I'm not sure if Rob has thoughts on the base concept of such virtual for
test bindings but they do seem like something that might be useful.

--YyxzkC/DtE3JUx8+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEJeAAACgkQJNaLcl1U
h9BXRwf/Xqce8sMfEFt2/j366pXYg6pdrJwZVmaZzzIcPBSrUrlwF90udc1VgktL
RKqyH/dxG9a1rLip4zyPH78h7E+S2N1ZfAh9RT8+Gt//Uy/x+AJ8PUCNuS5eqiky
7zTFHrzMRnzp37dBKHGtvinrx1Mi/mK7i4Uls61sKlFGfO8BVBYmkUDzt7mup7f4
NesORJpdQMUDow8tzxxbhh4w0a4z3M2HLvhn9kQ/eqHgPuJjzkWvJjczGF/yhk+W
3xf5+SDfuxgE+asHMN24OOBO7MljUq99k+8uk/lyHPKpoUXwDUDzntN3Zl9wl+Es
j0ijsi7uKCg1WgVpLyfvauA5NI/UZw==
=HmGH
-----END PGP SIGNATURE-----

--YyxzkC/DtE3JUx8+--
