Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC4E3FE01C
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 18:40:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95B4F1785;
	Wed,  1 Sep 2021 18:39:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95B4F1785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630514401;
	bh=+kim1nFZJePhJG4VFojdXYu0OofkM0oqbRj11pLU5JY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fLA3xQHSmvVgyzqOoWi8mcCnFCAqseA0Q8mEfBPG9cjr35yZ2cbayXdQxuaZDgwvm
	 V1QvbCYfdXxOFy6U+k2RPKEZPUbibp3faAeb+h0XmBlcPdh2GzwQ/t957FkIxJOK3z
	 vzKsgNzYeJJVtlbTxWW3cgG3LCptFueT1Z73FZbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07265F80256;
	Wed,  1 Sep 2021 18:38:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A962FF80254; Wed,  1 Sep 2021 18:38:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41A7DF8020D
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 18:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41A7DF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rIR0a/H8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C8496108E;
 Wed,  1 Sep 2021 16:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630514308;
 bh=+kim1nFZJePhJG4VFojdXYu0OofkM0oqbRj11pLU5JY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rIR0a/H8v58z2ixHr4Ny9loVmOVLuwitSDpeVN25ZKm5G4vTfeIkSNOy6geW1nSML
 XumHo85nv6niaVp/UKQQCgxqi2XWZ4vL/qw3uiHOAJMGiBElwOqkx45LerHI1th+gK
 dxS8uZS34wLvLF9k6VPGFQLELhN2hi6yI02/dGSQ1o/LfzBxA2AHBjjt5EM0pbb0Gb
 FvB6OHpMBx46FEPVU1Ek+HxmRERpNmdnCfm1KfKmDdGcuLtgeBXU+tjyi4PawAIu1i
 5NbtC0h3oVKju4taHo8iXYjZ91gIB90RnsxbJdfUeQbEiD+FF5Hm/eDMAqh69dEBJV
 JTkqktiJL1hOw==
Date: Wed, 1 Sep 2021 17:37:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH v2 1/2] ASoC: rt5682s: Add driver for ALC5682I-VS codec
Message-ID: <20210901163755.GI5976@sirena.org.uk>
References: <20210831130258.19286-1-derek.fang@realtek.com>
 <ee3ba91ee5c24dda9db9d05622d1dfaf@realtek.com>
 <CAOCJVXxPFM4CZ88LPTRp10ExiB1YTvkGYU37aYPBUXcxD2=uyw@mail.gmail.com>
 <CAEy1m_CatKECNf=3-7qZD9OCECfAjaynZ4aoWrfzV518szTL=g@mail.gmail.com>
 <18b688bf0eda4a24ae9897a9b7420530@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tmoQ0UElFV5VgXgH"
Content-Disposition: inline
In-Reply-To: <18b688bf0eda4a24ae9897a9b7420530@realtek.com>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Yu-hsuan Hsu <yuhsuan@google.com>,
 Albert Chen <albertchen@realtek.com>,
 Mingjane Hsieh <mingjanehsieh@google.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 Albert Wang <albertwang@realtek.com>, "Flove\(HsinFu\)" <flove@realtek.com>
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


--tmoQ0UElFV5VgXgH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 06:40:41AM +0000, Derek [=E6=96=B9=E5=BE=B7=E7=BE=
=A9] wrote:

> Has uploaded the CL. Please help to check.
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/=
+/3135053

I'm not sure what this discussion is but I'm not sure you wanted to copy
in upstream here?

--tmoQ0UElFV5VgXgH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEvrGMACgkQJNaLcl1U
h9B1lQf9EExTxcb5qudlQUeN+5rNv7eUkb87hKxb087/m7pa+8rNVabtt4cJbYow
6AHV6iiMEDulgxxG4shbRmHzdc+9pZsxUGapEXZIi8eI7/hh100eTZK9zO/eUa2i
3qO8KZaEdZMKRfZc5E2AkZSPdqy5We67JthUdqkNI8qZF6RhT1pTR5/9wCL6v2Xl
7RJHcWv+hHGrHkThgzM0i3o+OCXn+tXv5Md9Wv51cTFVOyIYCkpTyBXpzJQMGgqI
ET1OdLPt7gt73WWAm3nUPRc+Ycz0gR6EKSKKCU2rGOq44Be+KFdH5EU20KWkjZ1b
CtjrOn0U8Fuqik7myv8SmcEqtwMJ3Q==
=qbRP
-----END PGP SIGNATURE-----

--tmoQ0UElFV5VgXgH--
