Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A556E99C
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 18:48:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 910C716C2;
	Fri, 19 Jul 2019 18:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 910C716C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563554895;
	bh=clPNcHv0u+VwJvJlrFViV656CGvQ5J+oyH4SOyGELrw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tZl2gaiBhESEilfqM1qDFYP3nkbPr2nbnsnlJQaScVRimatoF5FZuGm/fs54QiIwO
	 Oi0+PPWaJWxW/WUj5a1T4qFIX7/smpvIC6UPDZ6ajy7+1OIIZ2IPJ2hFDm59BNCzhn
	 YkdUIMd4GQO1QXVPdgTKYK8kG2WUOi/9qGCpRpVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD071F80272;
	Fri, 19 Jul 2019 18:46:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3471F80272; Fri, 19 Jul 2019 18:46:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAEADF800B2
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 18:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAEADF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FBxUUBnW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XI87xspE1PvZpYcwoihyCxykF8lrpNRhSNgy8MKnC30=; b=FBxUUBnWqnBMRJRMOx/dIuORT
 BxhQIOd7UvA+VwPOJNfPBS7/rLyirSJ26vUz4YmS6bQp4/PrrCMu83Ka6y42kAwYjaHchTTSo5Xm1
 kIiFOa6HIJ4Lm1vBVGowl9HgBe5eW3XLeRFrkQYmZgiWHC+PrOLveYe5fczrIT7Hg3Obg=;
Received: from [2001:470:1f1d:6b5:45d5:3055:7a1f:9468]
 (helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hoW1Y-000576-C9; Fri, 19 Jul 2019 16:46:24 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5918027429BD; Fri, 19 Jul 2019 17:46:23 +0100 (BST)
Date: Fri, 19 Jul 2019 17:46:23 +0100
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com
Message-ID: <20190719164623.GA14800@sirena.org.uk>
References: <20190719063302.18858-1-shumingf@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20190719063302.18858-1-shumingf@realtek.com>
X-Cookie: In specially marked packages only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, derek.fang@realtek.com,
 flove@realtek.com
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: rt1308: Convert headers to SPDX
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
Content-Type: multipart/mixed; boundary="===============1864013101081493516=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1864013101081493516==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 19, 2019 at 02:33:02PM +0800, shumingf@realtek.com wrote:

> @@ -1,12 +1,10 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * rt1308.c  --  RT1308 ALSA SoC amplifier component driver
>   *

Please convert the entire comment block to a C++ one so this looks more
intentional.

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0x89wACgkQJNaLcl1U
h9B+AAf9E9BZcbSfTKdxzyf7U+gjcQSaWg2uf7g1ap+OsTkiRMcxzywh5/mUuE1g
e5VpDIbswG5vepQ6zmPhnuWogz/iq60G10FDXCPdORI3zZbEVm7vpk8DwbiHzpUZ
TclouP43BaUTT09mXnYuJlsWQAgpSh6e7T83CN3sMuiLae0ZP38eeIWIpDximNaL
qgGy88/auxbXHzPRzb2+au43tgRcGRpMu1Jx1Yzvlrme/QRktbzMFjeEfWVWpgQm
Rt3VA1Kx0xlTL2MRuG8Pl3Byj38uQIc3clt4gHTKrV/wM45L6CAUbhEiN/mipBXI
zUHo3L9ZRhpiXkfSaQi7tCjojxXSqg==
=HupK
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--

--===============1864013101081493516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1864013101081493516==--
