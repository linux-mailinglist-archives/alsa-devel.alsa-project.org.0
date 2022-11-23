Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C40639467
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:08:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A85D21836;
	Sat, 26 Nov 2022 09:07:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A85D21836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450109;
	bh=yn6IQg9xUUV9CgWL40Zq6y52rg1mn5sa8oD03o5v7Xs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LlOydjFONgeFzKCAYF5RMWYZtwJmiJYQfpKFNRjLMi5bdsK7rY216I81deV+LOL5X
	 et/pxg9WKIW4JeUVVsF2EJVfAxgWbwPGzfsoanohVtLng8RB11+l+0feEKo6c9Xhf3
	 65mct2/z5LLnlPIHrf2LZ0Jm+tnjRfEV+aXQ1ar0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 143D8F80617;
	Sat, 26 Nov 2022 08:59:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F244F8025D; Wed, 23 Nov 2022 14:51:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA09FF800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 14:51:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA09FF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UKfpNKKU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8D4C061CB0;
 Wed, 23 Nov 2022 13:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70F3C433D6;
 Wed, 23 Nov 2022 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669211504;
 bh=yn6IQg9xUUV9CgWL40Zq6y52rg1mn5sa8oD03o5v7Xs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UKfpNKKUztgIyNLf4JyG/Wh9x1SnC70ZZ6CMkTeLD14mkOzGlAm4+qghDz9TTaJEY
 oavU1DO373ElaIHQhIEpVZi9OKHf+AB7y5AZ3a0QM4K6Mda5mlxZI6uj77Y+34o3+z
 tC1+zaqNCkF1IRGWjNnvY9xTloZLlUjIwvwDNzzHVs6iAjJgjo18LVCElB+Z+suDGy
 RWQBO44v5C47KQUPl5LJXsrQ6VqWTj1W9The96h2CM4sfIP1b0DOy3ZhTq1Wp6bXDL
 C50DRWElKcd6PEaRVrgU5hEWY/A3MmvIZ+aqD+I2bHVUKaydHWSJ+FVF1rDhM8vyJp
 Av8NqbWSqNyRA==
Date: Wed, 23 Nov 2022 13:51:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: drop redundant part of title of
 shared bindings
Message-ID: <Y34lZFSBEwuI6G+a@sirena.org.uk>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sez8m7aAndejrS5d"
Content-Disposition: inline
In-Reply-To: <20221121110615.97962-2-krzysztof.kozlowski@linaro.org>
X-Cookie: I'm rated PG-34!!
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:52 +0100
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mips@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
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


--sez8m7aAndejrS5d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 21, 2022 at 12:06:07PM +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "binding", but instead just describe the hardware.  For shared
> (re-usable) schemas, name them all as "common properties".

Acked-by: Mark Brown <broonie@kernel.org>

--sez8m7aAndejrS5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN+JWMACgkQJNaLcl1U
h9CJ0gf/ajSRpLgN3RoHR7wLxFr99y5vWRywVoOaKU+lLq3UY2O6a9ssY8wOblzx
J9LbUP4Acep2fofTZCX1Ks2sTUHXNBB95SaeCwpSD/MX2HltHr0QvTGh8Lc9EfRf
f4l/ayjov4DbVsOJ019O7MKSgyuKezLb6Rj/5S38OrqdREbbzDoFe2ah8rSxpA8m
OQPEsY4eAbVfELEo/JQ86QYXN8gT6p3qA0+8IxDb0D+iLi3JCIz3GTrn+ZCudWRS
DkbD00vhGbeEaAbI/ufYp/KUWT0wfIoONENSAdGhmGMd+deqbmOt1Ryt+YoEt49j
pRMeSDCxuBZIpBjQfw7H+5ofOT8jsg==
=hoZL
-----END PGP SIGNATURE-----

--sez8m7aAndejrS5d--
