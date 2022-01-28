Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1105E49F9B9
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 13:43:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99D9D176D;
	Fri, 28 Jan 2022 13:42:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99D9D176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643373802;
	bh=wUt7Lpv1ipKqJDvhHGWAjln9cnXm1I4jIhfmigOT+f0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0yqFXMq0CuDaTy975nnSVNUqJf/86ZK2J+5e7qtFs4TBLzA3Cty6Y/jz2p3Mi6X/
	 Ou5MknDOaIPhmTtz75Nj+mKG/I4+b9B/+02qS/3YsRwE62Y1nHXM8+gtiMHjfrxQk5
	 dZaH4quEM4cszeHd7NYZkUKt3beCS0sgPY5EYEoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2250FF8014B;
	Fri, 28 Jan 2022 13:42:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2799F80240; Fri, 28 Jan 2022 13:42:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C457F8014B
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 13:42:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C457F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XXx0fuch"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E321B61B47;
 Fri, 28 Jan 2022 12:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020FDC340E0;
 Fri, 28 Jan 2022 12:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643373730;
 bh=wUt7Lpv1ipKqJDvhHGWAjln9cnXm1I4jIhfmigOT+f0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XXx0fuchgarQKfN1TwtXWoLv0qRHQG9XgBqVx2cCrIGnPPBz5e6GzXpYfRXjsPcrZ
 sMFDj+ismMZ+Cr33Wji66LdLve8fFwBIe/GX7uqFLSP5B9bBFNnVxwREnjwdmH12/N
 9/YoNapQS6dPuFvPfZhu0BJn5LF+V2cgYs8zuYiVjqtP4tu2x2U/VMeAgMOuplbNs3
 MGHK9HdOcZ8YvX01wfEeNUmafmB2y4d4crzETAU+5sq0idbr8FW9SqP2671RzG4SFb
 6+lKTEWq67rhdmS+NrlLYYZZAox2U8avBWj4d6Oop+mxOMmDkFJj4wAc+FWHESLsm2
 HsAkGhksydPEQ==
Date: Fri, 28 Jan 2022 12:42:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 1/2] ASoC: ops: fix signedness bug in snd_soc_put_volsw()
Message-ID: <YfPknO6si9CpotgS@sirena.org.uk>
References: <20220128112007.GA24806@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jOCcIIG5A6qPTuKn"
Content-Disposition: inline
In-Reply-To: <20220128112007.GA24806@kili>
X-Cookie: Torque is cheap.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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


--jOCcIIG5A6qPTuKn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 28, 2022 at 02:20:07PM +0300, Dan Carpenter wrote:
> The "val" and "val2" variables need to signed for the checking to work
> as intended.

This means that the helpers won't support controls that use the top bit
of a 32 bit register.

--jOCcIIG5A6qPTuKn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHz5JsACgkQJNaLcl1U
h9DaKgf/cTmyNoSTqkw9Z3Ey0dOvYM7t57pbtbOZ0g5wy0D/1tX/fClL/peSKXGU
60vA83fZ9RnX561xmKWv3E5Tqwj0+DK589nth2LcuJcSaZn0jyPgETF19uaXkACU
aJ8QkIIlNT3OkVDgbAN0QYqSuL9TCBhsOGR6eaBwbG8NsoPrphIPae/RBBn/z1Jv
IQGG1dcjervKJPw3bK7tzrdytvLnn8jqwMEkycxcxzrO7kw5vk2Dfu7vOzBLi2bt
y3cDSD+87ybKxsEt92XZZrSOey79pKIj7kCDB1k0LuLNB5hlSdiQfbfXt/PTB3ws
op+pdqiC8o5GDfLooYthOkZYHU/rSQ==
=2D81
-----END PGP SIGNATURE-----

--jOCcIIG5A6qPTuKn--
