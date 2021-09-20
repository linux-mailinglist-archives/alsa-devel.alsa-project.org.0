Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6FE4113CD
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 13:51:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 324C3169B;
	Mon, 20 Sep 2021 13:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 324C3169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632138690;
	bh=V6kgYgogW976xpByhMqKFGsk3ORwS5VxWZ+29DRMxHY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FJ70sHDcW+wnRlmf/YsAJbzTqRDBLnTt+wjbn9BQYC/aAornwQAgfyxNysAN9TxIB
	 Ib4lZALO152AUf8owQPHxh35cuAaDdLenh8dWygggj5Y1iOl6cq6osz++8uRjIQ8NG
	 8u2Jja83F1NQ4g9CeefjsS9gxrICR9taj4mYVF1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76C8FF80129;
	Mon, 20 Sep 2021 13:50:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E430FF8025D; Mon, 20 Sep 2021 13:50:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D013F80152
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 13:50:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D013F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AlaozWlW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AAE1E6108C;
 Mon, 20 Sep 2021 11:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632138598;
 bh=V6kgYgogW976xpByhMqKFGsk3ORwS5VxWZ+29DRMxHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AlaozWlWlARDWspL5oZTclqYkhokylGOFqWGYdLdB02cO47tSDd7L0tudUYAx3dFf
 txoMY4xg7OH8bq+ztj99ZgC8Kdaa4BeMHN2IR+8LKff3V/XnyRCOiX3nIr8n4WYsgO
 wPii8/jg2yFfALwoeAkHFdW2J1A3Z82epJbqEX5sJZFIhoddEzzQt1xlAkrU8N+6JV
 ALX+HYfiiIK9wg6jAUHh3l0F8m8maKsuO4amRpPX+xwq3B2TL58aWCkXlXsG0eYDQq
 m3wPWMWnrVgQPWVMX+2NRvsUwSf6peLFQBTpbbfn2715FyElDuxOSeuoHl2dFob08F
 Zz2N0RgiGWezg==
Date: Mon, 20 Sep 2021 12:49:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: sound: add rockchip i2s-tdm binding
Message-ID: <20210920114914.GC4192@sirena.org.uk>
References: <20210903231536.225540-1-frattaroli.nicolas@gmail.com>
 <42974939.Tn3hggVSkZ@archbook>
 <20210916122549.GF5048@sirena.org.uk> <2435067.tOv7cHfTnj@archbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline
In-Reply-To: <2435067.tOv7cHfTnj@archbook>
X-Cookie: diplomacy, n:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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


--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 19, 2021 at 07:38:47PM +0200, Nicolas Frattaroli wrote:

> Going forward, what would be a solution that is acceptable for upstream? =
As=20
> far as I understand, the obvious route here is to drop the rockchip,fsync-
> half-frame property and just always set this mode when we're using a TDM =
bus=20
> format. Is this correct?

Yes.

> According to the TRM, the register bit this sets only affects TDM modes.=
=20
> Though since TDM is not standardised in any way from what I've read onlin=
e, it=20
> is possible that there is hardware out there which expects the non-fsync-=
half-
> frame mode, but I am completely fine with only thinking about this hardwa=
re=20
> when it actually surfaces.

Right, we can figure it out later.

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFIdToACgkQJNaLcl1U
h9BGIAgAgRW0++RxUFblbEgs7rujuZ+mmldKzxR18cC+Os/498LvNXyA+iEO49w8
uKcqHbz77yNSnVJj8aJhhLin6Xie6m755h+PFnlZ2IbjCRrfHT1QPP3sPmfJn3xW
RrZHrQX3kKPb3Tbm8s9tdz0E1HgjkqnrlETHnGbXYL5RUv2/SzDQlAD40i153a1T
vcaIhIvmIH5un/jbFoJSPlp11EQWsMN1dz1CvWaT4m+3AsU/oht57XdVeJHk53h1
HjXefXq9ZE6bjHSwudceZtHvM4aFf+3IVmRM4i9ZKHF046mOYWxw+49Z3dTtA7Bi
ipwsNPQOMZGPIfZTgZ8+ST/F4aJTlA==
=xhRq
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
