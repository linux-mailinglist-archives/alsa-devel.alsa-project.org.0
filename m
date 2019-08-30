Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C8BA35F8
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 13:46:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E72A1658;
	Fri, 30 Aug 2019 13:46:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E72A1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567165613;
	bh=iHyQl6CvVt/Y+BX4MuYSlT0dTlInZgL6asmXGU+/BwU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sz/Mytyjd/VLmee/Iwzx0VSEn6cfVTvxX3FQtx15qu2w6lko+akVaipPJLkhXBsuA
	 5HDg5aqE3cS2BYGtUpE0mfP1yi0XCdMSjc2Z3G4T3SrCM8tM+hN4vYvm3GrDadexCC
	 RCA403u+eYeXA6zcdM30VdWkuKUSkmcviA2NkPVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36D4AF80376;
	Fri, 30 Aug 2019 13:45:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14FF2F80369; Fri, 30 Aug 2019 13:45:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B647F800AA
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 13:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B647F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="UGmbbQ88"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CadVpplwVADEGUMaV44Yr02WNCKjS5HQb+wLfMCybs8=; b=UGmbbQ88FNLbZfxFjM3A0cMHt
 TaIyi9zVfjiD4eA4fWwgul7Vt43hIahRefpwbkX96EUCZTFz4H3E3wT1SwxNmwK3aKENVVM+r53QH
 V3x2dAW8tbipYwEtRYz8JqCm3eHGyqR7cHjg267upTxE4j/WAA4vTlOO7vnCOcbVwgOUA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i3fKs-0006IC-Ir; Fri, 30 Aug 2019 11:44:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id AF78F2742B61; Fri, 30 Aug 2019 12:44:57 +0100 (BST)
Date: Fri, 30 Aug 2019 12:44:57 +0100
From: Mark Brown <broonie@kernel.org>
To: codekipper@gmail.com
Message-ID: <20190830114457.GB5182@sirena.co.uk>
References: <20190821162320.28653-1-codekipper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190821162320.28653-1-codekipper@gmail.com>
X-Cookie: Send some filthy mail.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, mripard@kernel.org, lgirdwood@gmail.com,
 be17068@iperbole.bo.it, wens@csie.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] ASoC: sun4i-i2s: incorrect regmap for A83t
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
Content-Type: multipart/mixed; boundary="===============4794173150830142561=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4794173150830142561==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2019 at 06:23:20PM +0200, codekipper@gmail.com wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>=20
> Fixes: 21faaea1343f ("ASoC: sun4i-i2s: Add support for A83T")
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> ---

This doesn't apply against current code, please check and resend.

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1pDDgACgkQJNaLcl1U
h9BCoQf/W0mCzcRW3NldO/WLGdATE7AdgyPsicKChjYVaeDuLtVqG9DYuWwozZci
YSfNIM3/lZh43VMgLDNxpnn5tpHFtt0EgdV/bDu/HyqVYU4c0ggzyDcLOP6WlMtP
fg/jqzCUNlhyFntMh/z9f7ucofEh0CmCHWiZNTSTz9Cd23HuNK4yqdqQGdpRDWSU
YB2NiAEFg3SAwqFie2W8m7kqy6oznKq4LPZZCK8lQwovwnV1ewsvjoAee+uv8i2/
kjIQzeRO10yai4eUwoM6uecsEV/uc7t30gGEbzXLjqeagtYA64bRSiXunO1hP65q
no0bDJN4bQSY79n4G3XxV47omRg40w==
=KsOX
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--

--===============4794173150830142561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4794173150830142561==--
