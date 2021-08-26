Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 703C03F8C6F
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 18:48:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0527F16C7;
	Thu, 26 Aug 2021 18:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0527F16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629996507;
	bh=5BkR5bF0zGZlx7J9T0gycIg/KuDBuU99UT630BXNBAI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=keUq18XkgaIKQNMvMEfgFgqBwbrz2LG2wRdsEK7eb3HgQj9zFoqPV156DjFeYbTvq
	 dS5IxbBGFl4I11XvwbH1x6jvuGJokqB1XUGZIFrsSYX+T8BJ/eWNv026bDWbZ/mzkR
	 iCmSX59hmokHsug+0fjeStdCBsNj+3RCY45kyW3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55C05F800FD;
	Thu, 26 Aug 2021 18:47:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE484F801D8; Thu, 26 Aug 2021 18:47:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 756B1F8013F
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 18:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 756B1F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="IWO/WE20"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4iePUfVCoqQTU+Jkn94t4cw64850bMiYuuSedSykd+o=; b=IWO/WE20Q/eE06wvl1XfiRgbYO
 GI6iHwGJE+BJFdsRSgVjxM5O0oA6OHTn5DflXEPoDcNcEWiETt6hMGxE3eslL/jX0/qiZ0ggQhcPJ
 QsPkVfttesRFH+jWF3GztZg/wS4Ypua1j9Qv2asYvPE+L0yDNp4uOLDuGcXjM1Ym9f64=;
Received: from 94.196.104.219.threembb.co.uk ([94.196.104.219]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1mJIWs-00FVed-Vn; Thu, 26 Aug 2021 16:47:03 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 203C3D123A5; Thu, 26 Aug 2021 17:46:45 +0100 (BST)
Date: Thu, 26 Aug 2021 17:46:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: mediatek: mt8192: re-add audio afe
 document
Message-ID: <YSfFdQLzZkZ4Inxf@sirena.org.uk>
References: <20210826163329.3903340-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LUR/zvNV20WmbNxR"
Content-Disposition: inline
In-Reply-To: <20210826163329.3903340-1-tzungbi@google.com>
X-Cookie: I can relate to that.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 jiaxin.yu@mediatek.com
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


--LUR/zvNV20WmbNxR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 27, 2021 at 12:33:29AM +0800, Tzung-Bi Shih wrote:

> dt-bindings/clock/mt8192-clk.h now can be found in linux-next per [4],
> re-adds the document back.

OK, so that means we need to wait until after -rc1 to apply this
- it needs to be in mainline or otherwise cross merged with the
ASoC tree to avoid bisection issues.  I'll queue it up for -rc1.

--LUR/zvNV20WmbNxR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEnxXQACgkQJNaLcl1U
h9C5qQf+IUkLO9vzpKVDHaBOp7ERntEwOmwTLhF7FfUq26hlDK+Z3++0N1gaMGK5
x+cQtwLw64YMbGNL70rGMJAdQaDAiNvssB3De2uNTrugXkD0Jtfsk+C7GvVYDiNh
nDBn03GrDIdvOOLKbqCt4+TmHdXe2+gOIbBcanp0V9auvjiuGDys1blzcEefxQ+T
oLxnVtjyF5fJmgr9RfS3/Wsf3rLk0PGdISy0e9fgvmzGoPIJsmi/VUbik4ohUr4t
CAZGrJ5nYa42qCwEfwop7OyRs5OOSVydXCMhjKBSBBblAD6ddKoLrbhqOUX9NlQm
9J3Oau3mVbIDPNXm/YJeGtnXvp+09A==
=U92Y
-----END PGP SIGNATURE-----

--LUR/zvNV20WmbNxR--
