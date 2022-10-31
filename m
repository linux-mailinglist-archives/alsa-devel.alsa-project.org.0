Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 393CF61359E
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 13:16:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEE01166A;
	Mon, 31 Oct 2022 13:15:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEE01166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667218609;
	bh=Ef0W9FuoGDPdO4zKMVlrGyTZfrkEq8UbTUD28FiKRag=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gjalKhHQWN7vGmP+d8UOIhfO60m3hquOnRtUsHH4igGxTuVKABdRE8XiahnsukT1w
	 IlLFi8NIi5TL95Mq4IEKG0kmADrU7ywz1pwBop6q0p/ZE8AcLl9Oenqc0eOIc04wPq
	 CUU6Kbjb54pTtZGRdtVOctCA/cTlYaTsR0UHiGhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0CCBF8021D;
	Mon, 31 Oct 2022 13:15:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3363F80163; Mon, 31 Oct 2022 13:15:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE74EF800E1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 13:15:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE74EF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P+iA4gyW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 77C0AB8159B;
 Mon, 31 Oct 2022 12:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A23E8C433D6;
 Mon, 31 Oct 2022 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667218545;
 bh=Ef0W9FuoGDPdO4zKMVlrGyTZfrkEq8UbTUD28FiKRag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P+iA4gyWU/jnn43e+kWoV4GiKk0s/JeKh7LlUD5I/laKaGMYT91w4GqbYLRBtJE7V
 Q0BUxSVHW53TryBbQHes16JEzqGW0rvbUbdbaS2nm4Zs+OZhVVM21Cmxh00L0r0LFs
 QdjrUTUSBLIMujDYupLOehoy7qdjM4G8d0KCemtBs4jOr3wWjFVKWiisVmQX1bdpGS
 2/riTQX+d2qnw2qiLKWwYuBM9TPgJeZV8hyFntv8YM8pQZO2dXVPQXK0ysBNpcOKMm
 2A3C3Brgoj2yiSVTPkyjzLwU8pOTUdPNJD1qs9MIRIgHQl8q+anWKIs9ioHFCh+oHM
 4i4Ek4kz1KFcQ==
Date: Mon, 31 Oct 2022 12:15:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: ingenic,aic: Remove unnecessary
 clocks from schema
Message-ID: <Y1+8a397G5jwOPmR@sirena.org.uk>
References: <20221028103418.17578-1-aidanmacdonald.0x0@gmail.com>
 <20221028103418.17578-2-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="N901two7N9pSy3Od"
Content-Disposition: inline
In-Reply-To: <20221028103418.17578-2-aidanmacdonald.0x0@gmail.com>
X-Cookie: Sign here without admitting guilt.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, paul@crapouillou.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-mips@vger.kernel.org
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


--N901two7N9pSy3Od
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 28, 2022 at 11:34:16AM +0100, Aidan MacDonald wrote:
> The AIC needs only the first two clocks: "aic" is a gate that's used
> for gating the I2S controller when it's suspended, and "i2s" is the
> system clock, from which the bit and frame clocks are derived. Both
> clocks are therefore reasonably part of the AIC and should be passed
> to the OS.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--N901two7N9pSy3Od
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNfvGoACgkQJNaLcl1U
h9Cnswf/ZAuU22Y9Yiq2KpvaB2q8KrqZ6K+ZSo62Ba4+8vTUklrQSWDDd6rRYhpg
a6wup56FbqCzhIhuL8sRf8SI1T21vM8uMluer89ww/q75rIfpll4Yub6fHhpi7b3
clsOwOE2BJrLONcfkPS5Ln8EfedsXF7JZRR6fTwgOONfkUGkRf4lUtSfIgTAHNjw
KgStQUCJ/ah5jCarlGQsB4PMq6QcbEJmjLlBI4RDb2fkSWUuoXFtKzRenRrafc7C
QEAi5knsfYKq3MOfZYjOQfvrYqlaUtlEsQUAzO39m/vxrMagIZcgFNZz8YOzRlfs
rbUJ4GaCQrVbBh3k/8atGG9LQRqLog==
=CzgJ
-----END PGP SIGNATURE-----

--N901two7N9pSy3Od--
