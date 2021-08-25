Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA273F7D6C
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 22:57:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89E2D1681;
	Wed, 25 Aug 2021 22:56:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89E2D1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629925019;
	bh=gjZeZMGJIoheKp31xKi7pLwU9TfiEyPpquQWCgvZtE4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rix1uwU0TklBmPSpji2Psy/0HX3IgA/w+4unXw5ECCCOiD01w/OCnzUuHycK4+fgV
	 4XX1f67pCxS08f6886RQ0BpBTpl08r2RAlfK4gB/UOvIIaXHztIhzzC0OJmj3lHOQn
	 7zjbQ/6m/qchFO5BSZnPfzkAY0pGpq6eUHvKtU6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEFDEF800AE;
	Wed, 25 Aug 2021 22:55:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A34E8F8020C; Wed, 25 Aug 2021 22:55:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 600FCF800C9
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 22:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 600FCF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y9boM9pg"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 221C76108E;
 Wed, 25 Aug 2021 20:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629924926;
 bh=gjZeZMGJIoheKp31xKi7pLwU9TfiEyPpquQWCgvZtE4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y9boM9pg89jRKmwouT/QTKTfP6cnbbCCCS7xmR/j11WJTKQOoI8xp/F9tCG875w14
 t6ZHgrFxWueYM1Y92Rl7sM+t1APG8oB3pawMogJMmlk55scB1wpiiS9VEVKHn2TSfQ
 v6b9DHSD8GG1ExHf6HWDK/0ILsqf5kdC4LZvW8txDVi7va9/vzSeyJvT19soF4LTaO
 UhE+SSACe6K2tgwjuD324QiY1xyoXVmyl0z/7jdZ80aCjvvWDXLZHJ4EY3w0hYaMuh
 LCtCQKRsN60dvSDuUXJopL0P8Y23dbW9YmOT36artHj8pWjc7htojIylo/VltN2sRE
 hShhViV80NumQ==
Date: Wed, 25 Aug 2021 22:55:21 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Use 'enum' instead of 'oneOf' plus 'const'
 entries
Message-ID: <YSauOeE4lBfeDiGw@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Vignesh R <vigneshr@ti.com>,
 Marc Zyngier <maz@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-spi@vger.kernel.org
References: <20210824202014.978922-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="l25l+0aqVZr4EHUF"
Content-Disposition: inline
In-Reply-To: <20210824202014.978922-1-robh@kernel.org>
Cc: alsa-devel@alsa-project.org, Vignesh R <vigneshr@ti.com>,
 linux-pci@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-phy@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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


--l25l+0aqVZr4EHUF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 24, 2021 at 03:20:14PM -0500, Rob Herring wrote:
> 'enum' is equivalent to 'oneOf' with a list of 'const' entries, but 'enum'
> is more concise and yields better error messages.
>=20
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Vignesh R <vigneshr@ti.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: dmaengine@vger.kernel.org
> Cc: linux-i2c@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-serial@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C

Thanks!


--l25l+0aqVZr4EHUF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmEmrjQACgkQFA3kzBSg
KbZM6Q//Y9REdiq/zJ83ZpDra3byCGjog62qLvRAGT4bIWJksXDHZQIAI+VT4f6T
bcW/EdAoYI1thOwyeO0PFXFAocKX3YZqx8y3bUw/vQXhQmDi3lhbeA3nmGlGl5zF
DJoaMXH/hK7uuwmdyeoHFpedIP5M+gHnvDyC4ZarCzeWuZBWMf4fwFyOgVS4PtHw
nRqm4E9bfQNCveZ/YxIQdbJFg8x419pJ49q3xqnLPweEAPs0h27mIG45IrPwHw8A
aVOGhHDvGqA3HduEiFmcLZWL7Ud3ariS19SSiHwdcdTPXtYBI+JPJh+arDDaJ2JF
8sgn/OSkymL9JZa0mg5Y3O9+FczVUlHALdrC+eSxkOlfXNR3xOJzetBC12vBlH44
6gBxucO3QoyujUTd7gsfaVIn5XqssAsWn2BYD9iM5j0D74Quyb2t1m10e6wMRWVv
/wSiWLnsC6dSO2jpulphC/G/Fyw+YcPfmvm402PlgOY5tzsY6sVS6eqyegvMReUP
oc26QyGtdxBy9Ksr54/s3N8WV14vcJm/mjCLH3ejKPrtBvOyu9sXEFmyV6lhB9r2
pEr0igI5TSC1J9EHQyvT10B56KbKlz4ZLB44daIOAYCvAIrlVRd+Yn/Nnmvk0mbs
7bnP+mB18KKgKC6GdNtfMyyZFCetGmhPLp1n1JUeoTlACwJF++Q=
=9C1H
-----END PGP SIGNATURE-----

--l25l+0aqVZr4EHUF--
