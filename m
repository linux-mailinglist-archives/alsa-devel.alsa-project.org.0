Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A6B677C8A
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 14:31:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72741229D;
	Mon, 23 Jan 2023 14:30:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72741229D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674480707;
	bh=H47c8HUYIIRYyuaouniWJ5/NboG5OtgLOQZuID8sHhs=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kytI9EHB+0NAyLHz9BCXI+oArmkJ0xUgv/TNJJotZL3DgZGxxB+CmYiTwu2zrSjia
	 dg+Z4O9diibrnjM3Hu5KBJ3ZFcIODJG7/vW3UlvnZWlroGOUdkMdrGah/pHL4iyI+e
	 HGqGaLNEcB7u0keT8Fa2ZHfuX7zrm1vB2M10+/Xw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC94FF801D5;
	Mon, 23 Jan 2023 14:30:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88F9AF804C2; Mon, 23 Jan 2023 14:30:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 926D7F800FB
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 14:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 926D7F800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bkVU/M72
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 453E360EFF;
 Mon, 23 Jan 2023 13:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C710C433EF;
 Mon, 23 Jan 2023 13:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674480639;
 bh=H47c8HUYIIRYyuaouniWJ5/NboG5OtgLOQZuID8sHhs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bkVU/M72OArI5kNvF5i7BifV9Utn5f76pVJhL5VPgOkDHhKGbjTwmjODDecUV84ry
 aTxZaHU8OZFBIZKgZmJEyk7zilSR8C5CyMtflZvbWeMrhhvzejZFPWScamGjbWnM/0
 LgUwZXkyvvRr9qg6B520zFMWWUhmA/XsUQ9cuFlOKDdmcN7vvX2Suudt0H85g3kKe5
 0hg0+89g+Xu/0U74HnImsC2h97WA6pH0VBsyoKe+0dnKIjv0Be2Mg8JcwkTUuLXAgY
 PRSeS5Q4YfKe1Oob4jNZ8noXpbkzFNjmySfyVrl2FKwdd7wtBTb+AVm7J7/S/fk/Km
 XJPnslPYzHC3Q==
Date: Mon, 23 Jan 2023 13:30:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: amd: ps: Make acp63_fill_platform_dev_info static
Message-ID: <Y86L+y9SGRIYDQ5C@sirena.org.uk>
References: <20230106023116.117404-1-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6PicLiRO6Os7KYGm"
Content-Disposition: inline
In-Reply-To: <20230106023116.117404-1-jiapeng.chong@linux.alibaba.com>
X-Cookie: HELLO, everybody, I'm a HUMAN!!
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--6PicLiRO6Os7KYGm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2023 at 10:31:16AM +0800, Jiapeng Chong wrote:
> This symbol is not used outside of pci-ps.c, so marks it static.
>=20
> sound/soc/amd/ps/pci-ps.c:170:6: warning: no previous prototype for =E2=
=80=98acp63_fill_platform_dev_info=E2=80=99.

This doesn't apply against current code, please check and resend.

--6PicLiRO6Os7KYGm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPOi/oACgkQJNaLcl1U
h9A+vAf/XDBfdteQbAFU9vUuEt6MBgeIm28y1WLlxkLLi5KWmUr0D9EPKLCg2pC9
sIVqikWy9XibYeR+VDNyndvq9lzuXDpVAQ/qYd9AdXt87718JLoiufWYryPPnpKt
JZGgJ4I0UdSWEAZazEySaSdp3IAK6GXR2hQHVwpmHsFMoACVoTlVqzBT1+Go/Jbl
tE+gzbXloQnDVzCCgYDx/at/ESRJsCR6y0a11R9+Cy9mDotwLyiEVHsyQGGnIqjg
LZefclLx1hm1fWJsXM1hGkODhbQ1LPuCF9XKpzYYT1ArFjfE4dbHvbkA5jdfwIJZ
hVvYFlNS2OllRm3a9yXsKZKLMN6byQ==
=YYiC
-----END PGP SIGNATURE-----

--6PicLiRO6Os7KYGm--
