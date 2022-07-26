Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB5C581637
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jul 2022 17:15:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B39915C3;
	Tue, 26 Jul 2022 17:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B39915C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658848551;
	bh=sMJjpFtvcZ1d3JoM3fkgHxvGrOlTVUanuXCpaM9lMig=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dAa+lceqC2IfePGRxndtmR1YFVqwZplA57TWMBbEj49AIP3QFVjeLZo2yB01d9btt
	 SHD/tjfwz4KX1IL5Of+j4DrfcdwCTulZ+P2A95xl5x8TjqaItNBJ493ufi3e6/8Gw1
	 Us66JIWR0dnmRsXor+yvv56BgemJozfvv9ygW3BM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BF56F800FA;
	Tue, 26 Jul 2022 17:14:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77777F8025A; Tue, 26 Jul 2022 17:14:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5771EF800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Jul 2022 17:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5771EF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BHuo20fV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E793DCE0C2E;
 Tue, 26 Jul 2022 15:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C2DC433C1;
 Tue, 26 Jul 2022 15:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658848475;
 bh=sMJjpFtvcZ1d3JoM3fkgHxvGrOlTVUanuXCpaM9lMig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BHuo20fVr3c0KIG7xsekmyhlfM7mW+kKUUDmdJbK7uMxwdr7O2d8yosVs1gZZPuVb
 lgAzcuh04tpFIcio8KVAssblan2boJCuLVLeDtZSELhc5qk/yABPxpIpBQIuTzWaax
 sXD+T6NUvZqvRftFjX8gV629iNqvv8KwY0PJ5MRDclXTg7e14FbL/RJ9QVVYaoYV0k
 idtMJDyuBXzHSHkX8oMh7+2ubZ+V+4fe4Sr+Hp1GGzNZti1a4EBSLH/wRWPNRxZjZB
 Bib0YTwY03lNznwHnj0HH0SXeFlhb4dE58zax1GWQdqLfpB2ndJo6BYDhEbljVOEDH
 yT7R26mMfj+mw==
Date: Tue, 26 Jul 2022 16:14:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v7] ASoc: dt-bindings: tas2780: remove tas2780 and will
 merge it to tas27xx
Message-ID: <YuAE1vDHE4NzSu+w@sirena.org.uk>
References: <20220722105345.175-1-13691752556@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Dp0z/n5tZgqICNdS"
Content-Disposition: inline
In-Reply-To: <20220722105345.175-1-13691752556@139.com>
X-Cookie: All rights reserved.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 shenghao-ding@ti.com, kevin-lu@ti.com, robh+dt@kernel.org, raphael-xu@ti.com
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


--Dp0z/n5tZgqICNdS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 22, 2022 at 06:53:45PM +0800, Raphael-Xu wrote:
> remove tas2780
>=20
> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>  .../devicetree/bindings/sound/tas2780.yaml    | 75 -------------------
>  1 file changed, 75 deletions(-)

The file upstream is 72 lines long...  I fixed things up this time but
in general please make sure you're submitting patches that can be
applied to the tree you want them applying to.

--Dp0z/n5tZgqICNdS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLgBNUACgkQJNaLcl1U
h9DZcwgAg35cOeqRgyKQ4zu3voVpk5g2RNHF1H+vN55Hgth6hel29SswQnl2Djz8
k2HJ6GnGU6k1Ly5xICm4/CyBzfVEP2Ks4sXSclsbjJx1oz5JulekGvHsn8KIm5HT
KCH0ahdp9okfqCB1/H9ddUyu0xsMzHyBgzVGuVtO7cAmBH36axVpfJ5dsY1J6h0Z
wpCN2MIYwCKInzvRLnGrBI+XZIAr6KeWqIIhmJqgAokFl1RYJoBjm3C7yecg+5bb
QVkEa3by/bI3LAiZDiF2KYsiaWgsEhLivMuK6KNEbeDZK33J70+JxgVkAddSn/GG
8/zpvCz4QlgmDi8xGMazOzPdV6K+Qw==
=RrqS
-----END PGP SIGNATURE-----

--Dp0z/n5tZgqICNdS--
