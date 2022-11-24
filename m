Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C6963949E
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:19:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0315418E1;
	Sat, 26 Nov 2022 09:18:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0315418E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450784;
	bh=S3xYwGQuP1zkeAOUdEdt9aQxCaHG1tpwe3PTQbwPO30=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G7/5I2X2bYD0espz0dV7aHDy0zE5lKoUTappFu4ZaAvHUdb7Zma/jVHrXw7Et77Fp
	 aqovF7RmQ/4OQV3jeD7yteHoDS8wMF6vDKGNV2ZmwxUfWvSJsBAtrCVCY0HfwqUD0h
	 /8PRR/+r3rs61AQ7cqGz+luRcl2I9sAUMfhqsva0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEADFF808C9;
	Sat, 26 Nov 2022 09:00:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48013F80431; Thu, 24 Nov 2022 15:55:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 095E7F80149
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 15:55:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 095E7F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r0tfM3KX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8EAEE6219D;
 Thu, 24 Nov 2022 14:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C289BC433C1;
 Thu, 24 Nov 2022 14:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669301706;
 bh=S3xYwGQuP1zkeAOUdEdt9aQxCaHG1tpwe3PTQbwPO30=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r0tfM3KXFq8k8dKdKgCyfe0VqkbG+aSVkOzM9rQig5SJnlW4pG8A9wbar7Uad2Eer
 erd/sBiYLcZdK67QfsCyxaKSBLZhO58ulwkqoCk28Ny9GnxH61LQVZFc5HueoQogaE
 CS+Q6cLAOrlQPiuOBYeFpv5HPB0bJs0s7iEKHQs7qqSRZ//HsO1qoC2lyHDuTAn9+D
 o035g2hgwLpT2kmGykDx2rMhldFJ7UN7ULem4MSTcVezL0KlrMkmXz5Ovl5KidGrtn
 JOl8xhddKpDWye2PFI5/wXspCDb0bNhouFBGvmHqJjokfG04TYCDIju1kP9KMHfZyZ
 ZAJfdZyFaAkCw==
Received: by mercury (Postfix, from userid 1000)
 id 82F7D106092A; Thu, 24 Nov 2022 15:55:03 +0100 (CET)
Date: Thu, 24 Nov 2022 15:55:03 +0100
From: Sebastian Reichel <sre@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 4/9] dt-bindings: drop redundant part of title (end)
Message-ID: <20221124145503.ir4n5qjonowpyhdz@mercury.elektranox.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ksnzyadj7qk2pape"
Content-Disposition: inline
In-Reply-To: <20221121110615.97962-5-krzysztof.kozlowski@linaro.org>
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


--ksnzyadj7qk2pape
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 21, 2022 at 12:06:10PM +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding", but instead just describe the hardware.
>=20
> Drop trailing "Devicetree bindings" in various forms (also with
> trailling full stop):
>=20
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [dD]evice[ -]\?[tT]ree [bB]indings\=
?\.\?$/title: \1/' {} \;
>=20
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [dD]evice[ -]\?[nN]ode [bB]indings\=
?\.\?$/title: \1/' {} \;
>=20
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [dD][tT] [bB]indings\?\.\?$/title: =
\1/' {} \;
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> # IIO
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---

=2E..

>  .../devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml      | 2 +-
>  .../devicetree/bindings/power/supply/maxim,ds2760.yaml          | 2 +-
>  .../devicetree/bindings/power/supply/maxim,max14656.yaml        | 2 +-

=2E..

> diff --git a/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-po=
wer.yaml b/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.=
yaml
> index 46de35861738..11f1f98c1cdc 100644
> --- a/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/power/reset/xlnx,zynqmp-power.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Xilinx Zynq MPSoC Power Management Device Tree Bindings
> +title: Xilinx Zynq MPSoC Power Management
> =20
>  maintainers:
>    - Michal Simek <michal.simek@xilinx.com>
> diff --git a/Documentation/devicetree/bindings/power/supply/maxim,ds2760.=
yaml b/Documentation/devicetree/bindings/power/supply/maxim,ds2760.yaml
> index c838efcf7e16..5faa2418fe2f 100644
> --- a/Documentation/devicetree/bindings/power/supply/maxim,ds2760.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/maxim,ds2760.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/power/supply/maxim,ds2760.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Maxim DS2760 DT bindings
> +title: Maxim DS2760
> =20
>  maintainers:
>    - Sebastian Reichel <sre@kernel.org>
> diff --git a/Documentation/devicetree/bindings/power/supply/maxim,max1465=
6.yaml b/Documentation/devicetree/bindings/power/supply/maxim,max14656.yaml
> index 070ef6f96e60..711066b8cdb9 100644
> --- a/Documentation/devicetree/bindings/power/supply/maxim,max14656.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/maxim,max14656.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/power/supply/maxim,max14656.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Maxim MAX14656 DT bindings
> +title: Maxim MAX14656
> =20
>  maintainers:
>    - Sebastian Reichel <sre@kernel.org>

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

--ksnzyadj7qk2pape
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmN/hccACgkQ2O7X88g7
+ppHEw/+Ofnx5vLl+V2sXB4VCd7c5T9abMJs0VA3LSQVJMpmCEWW5XvhGEnmu2bA
pe/8cmzFUNEal3JsF6Pun9+s8oVlQbtbXgQqqxocYGD0uNtePzX3IGizBN9mod8c
SB1U/oUlAw3ixwqcW5ZtbvPG1lAAc++86GtlPhulX7wCUFqbSMlbHXO2x8N1pa2+
cpOUmML55ELsk9srGIh7D88sV+n7hQQ8fMBI3HJt8gpZp1vpSG4mO941XAamkGgQ
hxEH9NP7AZl0ACiU1hRr3snxA+Yt3zg0mqyvk7OEwZnH85a/rlUqW74AlYeI2htX
+lSqy5fLCEAUifNJqotbU0xNOsiYKoFAcZAcfe89ePJYQoyg/wzPbptF8WK6uPQn
+k6HAHgIKHEd9h8o8LtU5MexYnGJix6nm6nkTOyq9u0PiHfsi75epi6lfw1xXX6Z
XYXxos+ohbeTUt/yW44aGw3jQ940mpr0f0gnVkudCiqfh4pV8gvWX8YoZH+K2BJa
C4natf1/bbwe0fTrA92dFqc3iwZB6FdCmdhE/cJ69GAW8araN8PelXTe2WgjmSOi
GZ6VtLaEi+lDktvqKCb/mw2GvrHW0y/EpRAvctJqNTR2uknOLyncBS9PiseoklUj
zmMw9e8xCv0ZXkroHdPqE8sDSQSB7gBINlSYEKk6wubHJwWdiyM=
=rY9T
-----END PGP SIGNATURE-----

--ksnzyadj7qk2pape--
