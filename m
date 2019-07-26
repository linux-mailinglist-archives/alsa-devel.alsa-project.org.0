Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FFE76445
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 13:19:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CF5C201D;
	Fri, 26 Jul 2019 13:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CF5C201D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564139952;
	bh=vDYVCmncw9xtsl4tvcGQA9fqq2x/2fkW78bMvqtZ2A8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YOZawPwmpoYQKeI8YKEqYCUNUV7+1PEPiZyxp5NiMVuuoMxUr/UZUBoIMZALl6pvh
	 4LrX3zb4v6B1TXDK7ZSWXTIYCPRM0I+IenBMX7WdNdtvkXnpLgEdNQPX7wwi1tpS30
	 goPLx7gPQvACMgCWbnxCqC/cphoHrxN3LPu90+WM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 679EDF80368;
	Fri, 26 Jul 2019 13:17:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48321F80393; Fri, 26 Jul 2019 13:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4243F800BE
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 13:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4243F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="K2KQcfiP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jm4OpSGofOUA5dqIvnMduxBbq6NaNOEvIczSvNy1Q0U=; b=K2KQcfiPjs6rgnZatJ0kUxrdK
 cpwlYJ5DdwUBS06TZWBTp08lIZAQLcwK5czEc/6yJdS+KIvG296bNLUjvfJSRQ2xgyn/zcp3DDFqZ
 iGhVj8B8GaJfmuLs7bJRXPejoee46BgPX3HXB9ERe6C/fXfYDCvexHCGzH6jgLCataL4M=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqyDv-0001I1-8I; Fri, 26 Jul 2019 11:17:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 13D6D2742B63; Fri, 26 Jul 2019 12:17:18 +0100 (BST)
Date: Fri, 26 Jul 2019 12:17:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Message-ID: <20190726111717.GB4902@sirena.org.uk>
References: <20190726044202.26866-1-cychiang@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20190726044202.26866-1-cychiang@chromium.org>
X-Cookie: List at least two alternate dates.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tzungbi@chromium.org,
 Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, dianders@chromium.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 mka@chromium.org, dgreid@chromium.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] Revert "ASoC: rockchip: i2s: Support mono
	capture"
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
Content-Type: multipart/mixed; boundary="===============1705948325789413820=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1705948325789413820==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Content-Disposition: inline


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2019 at 12:42:02PM +0800, Cheng-Yi Chiang wrote:
> This reverts commit db51707b9c9aeedd310ebce60f15d5bb006567e0.
>=20
> Previous discussion in

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl064T0ACgkQJNaLcl1U
h9DmAAf9FDy70YAEs1yPd9vLXET+RkMVfd/1yiLlweWPaqgu5WqZDjmBFBOQBj98
CnVVDFj3X1Fv6bQs6Q/+jRMuP5ckxiGPCFO2n0dV70pXNj0m/iGUHtj4ly/zOqsH
hwNNbmOpHphNoz87TaPFdPCj6XWPcNUOIa9b+mv/g8sxzR+9AdhzP0xLaDY7ixN9
0sZ+5QRGFuPsu/WscetgXtdTlhxFnEYpm6HxgvmZIrdKW0hYKVM7rSj4wKxiaP9T
ZyYlSmH/oA1OATb8LuDUPE3TTCEmMnyZUSyEAHeXAeWNFZzNn4bG0XYBeQoNZE8C
HZeFqmHV3qj2cU3rejJ2g1P3zqrKyA==
=4GTC
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--

--===============1705948325789413820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1705948325789413820==--
