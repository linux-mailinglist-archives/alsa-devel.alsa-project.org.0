Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6DC42BF4B
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 13:57:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD21B166A;
	Wed, 13 Oct 2021 13:56:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD21B166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634126247;
	bh=cAN+tog71qOFvOetsmSk0T5LVIdrumWHX3E93X1jboI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V61NbRB3XVUSJEbqUWxLnUrVeKfKvXOHofnu/d5tOE4X9CbYKjUfQLI/KqCIzvZk7
	 LC35S851k9o7Bcl1C3HocVNmZxz1ooFxQjggiwUvmb5ImWdvOaihlFeTejdw8UHmJ7
	 rKyKseZ+6GpGCct+5ZrKcmNDvckEVqZ1mqUuRQik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47A00F80088;
	Wed, 13 Oct 2021 13:56:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F5B1F80269; Wed, 13 Oct 2021 13:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CBA3F800C0
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 13:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CBA3F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uENrnGTW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBB6761040;
 Wed, 13 Oct 2021 11:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634126160;
 bh=cAN+tog71qOFvOetsmSk0T5LVIdrumWHX3E93X1jboI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uENrnGTWu3ftPzGh0aLTpbD7KfE6hC6rXGQrCX5a/cbvuH2SyGDwsgPic7o21nPRL
 JB5QhvWH6o44Rtn217XNNuYWKw4uHXFbWZMpdH+Z2AjIyZJ3R/MLMZQeEvYL56z++1
 GMw5ub7OCX6dR0Wr94s1PnXu0Im9/NsCaPaHZ/YhRDD0KA6l1vmExkDHT0Ig9ESYYB
 69Bapo5b5rdtGDUaCbVUrz46W+Bz+S7SSOJB8rOoYTevHFBNrCH5D9zv6VxmCugC9W
 IeEof/s//iYWw+4ifaCzNULLBxYCDd/sKWuZ1F7xuERBtm/OBHTBTKjTCtdElOqNAg
 xgf0yzVl60JWA==
Date: Wed, 13 Oct 2021 12:55:58 +0100
From: Mark Brown <broonie@kernel.org>
To: George Song <george.song@maximintegrated.com>
Subject: Re: [v2 2/2] ASoC : max98520 : Added AMplifier Driver Signed-off-by:
 George Song <george.song@maximintegrated.com>
Message-ID: <YWbJTgI3Jpo7LiJp@sirena.org.uk>
References: <20211013071616.18592-1-george.song@maximintegrated.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ku/5dXV8PYOYncmB"
Content-Disposition: inline
In-Reply-To: <20211013071616.18592-1-george.song@maximintegrated.com>
X-Cookie: Where do you think you're going today?
Cc: alsa-devel@alsa-project.org, jack.yu@realtek.com,
 alexandre.belloni@bootlin.com, lars@metafoo.de, jiri.prchal@aksignal.cz,
 arnd@arndb.de, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 "george.song" <george.song@analog.com>, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, paul@crapouillou.net, hdegoede@redhat.com,
 pbrobinson@gmail.com, shumingf@realtek.com, geert@linux-m68k.org
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


--ku/5dXV8PYOYncmB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 04:16:16PM +0900, George Song wrote:
> From: "george.song" <george.song@analog.com>
>=20
> ---
>  sound/soc/codecs/Kconfig    |   5 +

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

You've also sent two different versions of patch 2 but only one version
of patch 1, please don't do this - if you need to send a new version
please resend the whole thread otherwise it gets very hard to follow
what's going on.

--ku/5dXV8PYOYncmB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFmyU0ACgkQJNaLcl1U
h9Dd+Qf+PlCO66assozKLwJoeEHfTSPv5V5u5jCgEhW1MBZHV42rMIXPsghW524P
yl14RiN5BS5zoD6OupGuKLns4Cq/egs5U4FG7qM3QpxdhKVGt0828pl/IiokebTV
ZwEe0IgORmE+0VhuF4mx8/gVqX+DVsDQTsXH1lBbKvMt8W81ahLmec78B9Mut3UV
fh+V7h6DtneIUNbwJOyGvmx0mEQymqhtM+JhtUcopkx+iD2KMUvBQ6IM2s9+CZm/
P9Ka0Fwsf5Xo5iSQBpy3FnYt4i6mCN+oKORQKztP77UxNfWbNjOH8aFiafFYBfJ2
pisCrGEBwbm8cpehNinbcbYqZ3DsHw==
=c71Z
-----END PGP SIGNATURE-----

--ku/5dXV8PYOYncmB--
