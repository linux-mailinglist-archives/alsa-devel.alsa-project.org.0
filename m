Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFB363949D
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:19:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29ABB1910;
	Sat, 26 Nov 2022 09:18:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29ABB1910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450765;
	bh=unIV7Ik3dkhviLx7pqEUl7Hj+P8gzwLYsPUrycbdr2U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Js4NuopsUAGTkuM738nU/oS8Eu+F1vc487lSugopIq4gwr71wt8Pxb5fjApsmPSij
	 +hA/tzSKt1l78fqi5KB2+he7Pp3hYD7JrlrjFZ7oorCtSROMUVQefatnXJVOMyPXZN
	 zN4mp2dS9LkYYwmVQBlzKbVM/GOcLzylhhm0SiWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D68AF808C5;
	Sat, 26 Nov 2022 09:00:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD3E0F80431; Thu, 24 Nov 2022 15:53:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66E0BF80149
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 15:53:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66E0BF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Bjiga38Q"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73DBC62171;
 Thu, 24 Nov 2022 14:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F372C433C1;
 Thu, 24 Nov 2022 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669301606;
 bh=unIV7Ik3dkhviLx7pqEUl7Hj+P8gzwLYsPUrycbdr2U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bjiga38QWyzLlfhROr4+WaCyo1J6wcTkIZj/mwam3dWvx1Hx5xajOxzVB7myXCa9N
 WNBAdzWlxBlBs+KppJLdJyV66PPHOF5WPs6Mou2/YQUFWDhxzmXFlw/QhsRkqhAbvM
 IKZb4468eQJJDEnwbqI3IOZWGOuAGFvAZoZxBeBNa28SexV/3o2GKds11UG+j34jMn
 qFVJwi+/7WO3rd5ejlO/fFF8/Xvu1SgSJacWq2/ZXhnbl5m/YnXscTIWOW5JF6sv2/
 7AIFZSfR+8FP0gVVdcX2vRVTsiUKBtO1qb0RumfwgoMEoegx4yHbgmeuc5IR3fUnJ3
 WdioSmYng4A7g==
Received: by mercury (Postfix, from userid 1000)
 id E481A106092A; Thu, 24 Nov 2022 15:53:23 +0100 (CET)
Date: Thu, 24 Nov 2022 15:53:23 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: drop redundant part of title of
 shared bindings
Message-ID: <20221124145323.tevilddtr7ajdd7l@mercury.elektranox.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kmrqy5oh67vgmowj"
Content-Disposition: inline
In-Reply-To: <20221121110615.97962-2-krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:53 +0100
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
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
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


--kmrqy5oh67vgmowj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 21, 2022 at 12:06:07PM +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "binding", but instead just describe the hardware.  For shared
> (re-usable) schemas, name them all as "common properties".
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Guenter Roeck <linux@roeck-us.net> # watchdog
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> # IIO
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/power/reset/restart-handler.yaml        | 2 +-

=2E..

> diff --git a/Documentation/devicetree/bindings/power/reset/restart-handle=
r.yaml b/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
> index 1f9a2aac53c0..378b404af7fd 100644
> --- a/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/power/reset/restart-handler.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Restart and shutdown handler generic binding
> +title: Restart and Shutdown Handler Common Properties
> =20
>  maintainers:
>    - Sebastian Reichel <sre@kernel.org>

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

--kmrqy5oh67vgmowj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmN/hVMACgkQ2O7X88g7
+pqhwA/+M2Nr4azK150ufJYwasgPUHr+IvgiGG6zZbVydz4jcsik67ma/TlLQV0F
e576CX8Tqzz90OcmpIPWvWr/+Ev0QWetfOvG+4+Io9Zh+w7Er6dnLWZuv3DbPDD8
b5KbXY0fKBBc30RQVk7T0uhq0Qd/gJ38fOALFl7nymMSzekfDuYm+HNn9gURaxuK
C3EKJDXCLhT05/DBQK4rx+CVy6tMk8oiQOrrESyGeHRrRv/7va6TjIKRqXoekdAx
GEA6CF1jXwzX0TnUppKNjGdVeBw8UkflkU8lJrBozSSpo+IzaaT333jOhsX2ROKB
uDDWkC4CAOVIXnLhUBSNJGm9ifZm906c/zyoZ77EzYNtsFESq5znEyTryuOfzjiS
ykyxB/WkNLxxJf5Wcu4gqGks0KrnM7aE+pfV+cqViSgGi8ykIUwEjrbY15w34I4M
1etdToVgbUEaL+ThZaymJ9xWhcWq2NHBTTHIgL2AA34rSqaJe1f990424jUT/SYZ
7N4jCoDiJPK56gJJe5NRPSvz4LjlFa8bTB3rXioMA4Ep21+e4VrBT6TqERx/Jkaa
RdEjPVIF6pkxOepaBigKGkjvwDj4AvwdIglKaIXcccH+I55OxMOyPj3FXgaOLB+5
o6kJsJkqqpyU0tWJqBmeQED3yqn/Zz7XZZ4SunfkjJLBqxop5Ec=
=r+Zg
-----END PGP SIGNATURE-----

--kmrqy5oh67vgmowj--
