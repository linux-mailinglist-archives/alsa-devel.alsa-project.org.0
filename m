Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD14639446
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:03:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA81617DE;
	Sat, 26 Nov 2022 09:02:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA81617DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669449790;
	bh=qMUCJkHDKODpGOuGW51S9S+Wc9pKi7k3jRdHTL7atTY=;
	h=In-Reply-To:References:Subject:From:To:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fppRzsHuq7OONVnQAjubpsb655gnATc5eu8U6SV6RgixZXQyczaQpaTa45wtaPKin
	 ddizQGISr3kZ+8gEoqZNue8IuHCLEvML7DOyQfIsiYYk7W5rpMwhdqgN/aTGMtYGh/
	 430IN/L4IcewYVo+fjw9pNAZwyFKXtc4GQNPw6rY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4266DF805B5;
	Sat, 26 Nov 2022 08:59:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29989F80115; Wed, 23 Nov 2022 02:09:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 756B9F80115
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 02:09:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 756B9F80115
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=kernel.org header.i=@kernel.org header.b="kqxTAzpS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 392F561985;
 Wed, 23 Nov 2022 01:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4D2C433B5;
 Wed, 23 Nov 2022 01:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669165781;
 bh=qMUCJkHDKODpGOuGW51S9S+Wc9pKi7k3jRdHTL7atTY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=kqxTAzpSMsIFSOhKLHbuvGS3YhP4Ghan+L7rtN516xt08X55sIuaOEBB8Qbq4+rRi
 5CVzboyxCV2G+AU+PT1p5KRUronWwFHZjTrZUGaMUXsVjwYJAoXcbcwRcI2FU4Lgx9
 zL3uJIsO6hTYNQqNDUSNFjcUcJRpIdjWYeb+lIrhoMH65aVMlBoJ7veI4IQjIwBxX2
 R8eWvVLZRvpqSzNMXVd+0kyfJ1ypml1zqGvVGS0n4j52fenoMAMuYXNN45BuFZsRKb
 Bz9wCekpWMZk+m9CAyej743woVYbY2pYdM4eG5zWyoCH1UyEzuXxLmY3bhphXOw5Hk
 6lGfcIjp49aAA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221121110615.97962-5-krzysztof.kozlowski@linaro.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-5-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 4/9] dt-bindings: drop redundant part of title (end)
From: Stephen Boyd <sboyd@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.
 org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Date: Tue, 22 Nov 2022 17:09:39 -0800
User-Agent: alot/0.10
Message-Id: <20221123010941.7C4D2C433B5@smtp.kernel.org>
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:52 +0100
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
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

Quoting Krzysztof Kozlowski (2022-11-21 03:06:10)
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
>  Documentation/devicetree/bindings/clock/ingenic,cgu.yaml        | 2 +-
>  .../devicetree/bindings/clock/renesas,versaclock7.yaml          | 2 +-

> diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml b/D=
ocumentation/devicetree/bindings/clock/ingenic,cgu.yaml
> index df256ebcd366..9e733b10c392 100644
> --- a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
> +++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Ingenic SoCs CGU devicetree bindings
> +title: Ingenic SoCs CGU
> =20
>  description: |
>    The CGU in an Ingenic SoC provides all the clocks generated on-chip. It
> diff --git a/Documentation/devicetree/bindings/clock/renesas,versaclock7.=
yaml b/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
> index 8d4eb4475fc8..b339f1f9f072 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/clock/renesas,versaclock7.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Renesas Versaclock7 Programmable Clock Device Tree Bindings
> +title: Renesas Versaclock7 Programmable Clock
> =20
>  maintainers:
>    - Alex Helms <alexander.helms.jy@renesas.com>

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk
