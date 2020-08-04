Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D1C23C140
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 23:15:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD88F1666;
	Tue,  4 Aug 2020 23:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD88F1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596575737;
	bh=uk5OeUUr1ieBJElxnAxLjVqIv4SwKI9/mcluVt3vAlY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fCwRKXM6MsON8Bd/pS6FT9s4Vpv3+5Lc/90Gw169I5wt+TuWJ91Q+lo8VsMmFPab2
	 zgq9ckTzsumtzjJv/coFgz/cF1GAVyQ08QR0qmG9FoCgnpLZoebovsmvGA4K5dTnCH
	 aGpw0k7SHJJG9eaBJYkOHd85dCX7DkA1gaESV25M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E401AF8015A;
	Tue,  4 Aug 2020 23:13:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6094BF80150; Tue,  4 Aug 2020 23:13:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68ABBF80148
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 23:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68ABBF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="obbwlw1V"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D25C02075A;
 Tue,  4 Aug 2020 21:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596575625;
 bh=uk5OeUUr1ieBJElxnAxLjVqIv4SwKI9/mcluVt3vAlY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=obbwlw1Vo4tD8WT5CqWYTHsadkq51Kguo/EfJ45EksZfoBHS0cbeKpHSaVjwpARNU
 tJWIlKzQCIcAuoox7dXePPGUDH3X+rXHyann1Xj43LJX5Nk4ieHMcvJpD5+QYrpyvt
 PV7R8zsWittgGth2N7M/ES8TCcr97jDRpTXcrF6U=
Date: Tue, 4 Aug 2020 22:13:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Codrin.Ciubotariu@microchip.com
Subject: Re: [PATCH v3 2/2] ASoC: mchp-spdiftx: add driver for S/PDIF TX
 Controller
Message-ID: <20200804211323.GD5249@sirena.org.uk>
References: <20200803081851.102570-1-codrin.ciubotariu@microchip.com>
 <20200803081851.102570-2-codrin.ciubotariu@microchip.com>
 <4d009743-733a-9578-71b2-d320fdca9331@microchip.com>
 <d415817f-d32c-07bb-4d9a-41649290a559@microchip.com>
 <8a0cb78d-d22d-eb29-8650-67c033b57446@microchip.com>
 <d0606eb7-e706-577d-abc4-f994c56a53e9@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline
In-Reply-To: <d0606eb7-e706-577d-abc4-f994c56a53e9@microchip.com>
X-Cookie: Every solution breeds new problems.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, Ludovic.Desroches@microchip.com,
 robh+dt@kernel.org, Claudiu.Beznea@microchip.com,
 linux-arm-kernel@lists.infradead.org
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


--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 04, 2020 at 04:37:07PM +0000, Codrin.Ciubotariu@microchip.com w=
rote:
> On 03.08.2020 20:11, Claudiu Beznea - M18063 wrote:
> >=20
> >=20
> > On 03.08.2020 19:11, Codrin Ciubotariu - M19940 wrote:
> >> On 03.08.2020 16:06, Claudiu Beznea - M18063 wrote:

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8pz3IACgkQJNaLcl1U
h9AN3gf+Im9uNemS0G3msHEIRBtq1WKsAVCYHYB2jwTa3q69/6U09UO5z17KzUj9
O4u1+8m8Ygx9GKcz19npSmeLqSTjwkiluiitkW4kiUxZdCXAyK1XOHeJKnGV+ejA
YSfBcdbXNawuUQ7ndfzNnbFj6roRW2gJ9RtkapHiGJDu5BZRKDB7e+m1MVy2BWQt
P3bsop0ig4nWtUsdv0dbFbL0PQQr10UZxtHVHoEkteA4vP94/o0avMS01aWMkQBp
kvzL20QwB+GKcUzOyqmZtGfoKextK9Aev+bJK9kmBT2+0n34Va30iK+SKZHszZ6A
Mu1bEHxVXF2jCBDPoXRmmRW1ZYsVnA==
=z17q
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--
