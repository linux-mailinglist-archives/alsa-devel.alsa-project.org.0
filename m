Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F2F639445
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:02:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7B9217EC;
	Sat, 26 Nov 2022 09:02:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7B9217EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669449772;
	bh=VEr9KUTmQN7PdpRjdITbWK0f3twlzJs/jseGDOvy7aM=;
	h=In-Reply-To:References:Subject:From:To:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y1R6r+tdL0UGu7wUCQlVtT0LCCRZFmMoOjN8z3B/jhFCNZMH3qvKlaw354dctaO3J
	 RHSKN/NHIp7TY/0V4MCYPiLQbItnMn6KFzN3mzY0FQy1zBR1QMqaEKWfen8vTFrOGG
	 lgBV8gwuIwV5AUSjH208PevSaDhB5HE2LKCDshBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3A55F805AE;
	Sat, 26 Nov 2022 08:59:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85923F80272; Wed, 23 Nov 2022 02:09:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0BDCF80115
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 02:09:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0BDCF80115
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=kernel.org header.i=@kernel.org header.b="eFQro6Mp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0448261990;
 Wed, 23 Nov 2022 01:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AD44C43470;
 Wed, 23 Nov 2022 01:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669165741;
 bh=VEr9KUTmQN7PdpRjdITbWK0f3twlzJs/jseGDOvy7aM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=eFQro6Mp3EnLI+pFGzvy/XrJMzJ19D4lXaGC7D+sepB+3Ys4lIikBt1z0H945eajn
 m0gwo4bzLi1XYVKwHg2Osy5e538XrGq0w3K3n4++vzRj9kPhHoshbFU4zQ4iCH9VPZ
 1csPlhlxe6vmZQ8utXIoFGo5suTnincXwEOoh7MAKEnWVM1OyR0OaxH/CTCnGJ900J
 IAoadizYJel7a4w10cF/MjGJ4+xYr7gvX6wb5j6fHPX86NEoxhC/NVsOC+W1NmtBzi
 shR6pi7sPMy8AxgPzgofsIL5/GAeJz2LLGVkOfequakNbABM2CgeK14raKuFEq4C2Y
 SZiKz3tYDYQtg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221121110615.97962-2-krzysztof.kozlowski@linaro.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: drop redundant part of title of
 shared bindings
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
Date: Tue, 22 Nov 2022 17:08:59 -0800
User-Agent: alot/0.10
Message-Id: <20221123010901.4AD44C43470@smtp.kernel.org>
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

Quoting Krzysztof Kozlowski (2022-11-21 03:06:07)
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
>  Documentation/devicetree/bindings/clock/qcom,gcc.yaml           | 2 +-
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Docu=
mentation/devicetree/bindings/clock/qcom,gcc.yaml
> index 1ab416c83c8d..7129fbcf2b6c 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/clock/qcom,gcc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Qualcomm Global Clock & Reset Controller Common Bindings
> +title: Qualcomm Global Clock & Reset Controller Common Properties
> =20
>  maintainers:
>    - Stephen Boyd <sboyd@kernel.org>

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk
