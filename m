Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBB811CD16
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 13:25:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD74016D3;
	Thu, 12 Dec 2019 13:24:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD74016D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576153512;
	bh=jtHTyZ1UqO9DqgYyu/386VvUJqZoFowdGefDm8pR7uU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lfFYSaTtbZVTGk/zd+xFBIGTNs4XNIpM3x3W0StnzotLeC/CuirsrGF0UIwdoo/LH
	 nK/DPWfakGvUBUGFkGJCkJeFpzBJQXwvpZBcuvqeSE0+v+r2QQIxbu74RGetxcHBPm
	 yNFaPHgw4Nty068QRzCGNY6DuMBK1EhdEtdk7NeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A5BF8020C;
	Thu, 12 Dec 2019 13:23:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 955E1F8020C; Thu, 12 Dec 2019 13:23:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 32223F80139
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 13:23:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32223F80139
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D9DA30E;
 Thu, 12 Dec 2019 04:23:22 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09DAF3F718;
 Thu, 12 Dec 2019 04:23:20 -0800 (PST)
Date: Thu, 12 Dec 2019 12:23:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Alison Wang <alison.wang@nxp.com>
Message-ID: <20191212122318.GB4310@sirena.org.uk>
References: <20191212071847.45561-1-alison.wang@nxp.com>
 <CAGgjyvHHzPWjRTqxYmGCmk3qa6=kOezHywVDFomgD6UNj-zwpQ@mail.gmail.com>
 <VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <VI1PR04MB4062C67906888DA8142C17E1F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <CAGgjyvGAjx1SV=K66AM24DxMTA_sAF2uhhDw5gXCFTGNZi8E7Q@mail.gmail.com>
 <VI1PR04MB40620DD55D5ED0FDC3E94C2BF4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB40620DD55D5ED0FDC3E94C2BF4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
X-Cookie: We have DIFFERENT amounts of HAIR --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC:
 sgtl5000: Fix of unmute outputs on probe"
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
Content-Type: multipart/mixed; boundary="===============2899575492870557401=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2899575492870557401==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 12, 2019 at 10:46:31AM +0000, Alison Wang wrote:

> We tested this standard solution using gstreamer and standard ALSA
> tools like aplay, arecord and all these tools unmute needed blocks
> successfully.

> [Alison Wang] I am using aplay. Do you mean I need to add some parameters for aplay or others to unmute the outputs?

Use amixer.

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3yMTUACgkQJNaLcl1U
h9DfQgf/UmK1hCqXQ85LvYqgXxbKAXGRaIWJQyk8azVa0DIaUG4sgOjQFvfpKX8P
r94b8kOksV/gWPash/q1AALZ//I78/lV4+0FPABth+o6k5f3XEWYiUkHuzCubsdE
RUNiZCQzCyZdASR3lK0utcaowMt+ME8UsOShQD2h5kvwiA8MmbSdoRs12UP2BXE7
LafeLJJXlf+CsKc/ut2ql8YerxereMdmHYqd4zM0Xx0W9csLJTdDEdvp2cX0tFK+
2ZXI/o+8ntVZ2fDbkG3zwTmS5SOfryA3iwhwSJDNfO8CfOaIfOJD7vFjDz8BhQPq
TpnqW1d4Z9+IuEuiWykpI5NWLEJaRg==
=2Ya4
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--

--===============2899575492870557401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2899575492870557401==--
