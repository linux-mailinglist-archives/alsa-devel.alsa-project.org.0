Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B21AC1F9536
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 13:21:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F0DF166F;
	Mon, 15 Jun 2020 13:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F0DF166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592220082;
	bh=09YCLJTSpwXYksfyCYSJl2k+cwsJ7qFx3Cq3UzjbGyI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GbUF5m4zua2ACzwoRAzH7jDx1UZPeO7Bg+4elCOSIB7q7IANbM0ZNgg3ikGdDG2r/
	 kTDBUS5iLnfYA5bf/lJJmnyDjNJy9gNrVjHdAjEa0JMN6+w7CQSOz2TzD5klxRmzji
	 QlGtj81Cq2kAl7Yvrjc7R8g+5TCCgyJH4tP5AFP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 543E3F800CD;
	Mon, 15 Jun 2020 13:19:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6E01F80171; Mon, 15 Jun 2020 13:19:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82983F800CD
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 13:19:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82983F800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y9XD9p0M"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 058D020679;
 Mon, 15 Jun 2020 11:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592219969;
 bh=09YCLJTSpwXYksfyCYSJl2k+cwsJ7qFx3Cq3UzjbGyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y9XD9p0MeL4taa2ELATHmZjnxuB2Qwom8k1ILpzM+ZKmgHncRSrZRkWHzXJoKUZYG
 RVzFdcjhfF4+7tviRu0Z7J7pql7QVnbcy5lmyaFqXh1wKUMpINf6iGMDn+vhj+ObwV
 iv9FZnGvAGdOWuUFB1fqKEZG7JlfMHbBDSJzRm08=
Date: Mon, 15 Jun 2020 12:19:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 13/29] dt: fix broken links due to txt->yaml renames
Message-ID: <20200615111927.GC4447@sirena.org.uk>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
 <0e4a7f0b7efcc8109c8a41a2e13c8adde4d9c6b9.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline
In-Reply-To: <0e4a7f0b7efcc8109c8a41a2e13c8adde4d9c6b9.1592203542.git.mchehab+huawei@kernel.org>
X-Cookie: Offer may end without notice.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, netdev@vger.kernel.org,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-bluetooth@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, "David S. Miller" <davem@davemloft.net>
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


--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 15, 2020 at 08:46:52AM +0200, Mauro Carvalho Chehab wrote:
> There are some new broken doc links due to yaml renames
> at DT. Developers should really run:

I also previously acked this one in 20200504100822.GA5491@sirena.org.uk.
Has anything changed here to cause the ack to be dropped?

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7nWT4ACgkQJNaLcl1U
h9BSJQf9FR8Vke3pe9Gs5pnWmw6vzxds7jfidCUpXIKPoosgfYfzYQrN1G9m2fSm
pLlYWjhQBEAU+w9oq7WktfEZ8r736noKsRW4hd5a+Zf2koBr0M9O7ull4h7WlHvr
asCHlWuqJvpVevxf1ag9x0dAA9NRMqh8xxd8ah/ENWTbXmzZPir0Pa6Q+9lzG2Ld
aqgHcA+WbonAUk4BqLRSasRy6AkO3zUbYWqVecAV8xRPcVjiWd/PkhEQ/BV67wG9
Kh/sFCs6+PalKQu5PDZP70apmaRPYHwPZmkNu5Y8rAUsjsQradS2JB1zFlWDSxZk
0qIWVDJdY+FIcxlqt8Rda5akpjL2SQ==
=51fv
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
