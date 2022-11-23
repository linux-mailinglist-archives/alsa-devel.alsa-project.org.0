Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 952E5639450
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:05:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D51C17DB;
	Sat, 26 Nov 2022 09:04:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D51C17DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669449943;
	bh=QqrDbDLRcAQr4MUv+oZ9PutfTqVkNXwAFQlJXbN9odk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CnjcKfUwYlEAnbRNuVoTkBw2RPdF6qFE1+8RDckEIkIWE5moPHdhCvDFctH/GQ3Gs
	 ykSSPM4SmfovFzkRlBJmrXemn9Tm4zUV7bAm3Rn9tr+KjYDxULq4YlTgM3E83xpKyQ
	 PRbb23slaAN9ks+oS+ajQ/M748r9Z3BTHZ9yVqHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F1BBF805E8;
	Sat, 26 Nov 2022 08:59:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47C43F8025D; Wed, 23 Nov 2022 05:39:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80A45F800BB
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 05:38:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80A45F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e//Q0Igg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC96461990;
 Wed, 23 Nov 2022 04:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DBDC433C1;
 Wed, 23 Nov 2022 04:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669178332;
 bh=QqrDbDLRcAQr4MUv+oZ9PutfTqVkNXwAFQlJXbN9odk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e//Q0Igg0hWRrSaEgwdgmlRQd6QUnoz7COLqfkBnj6LOQdy+G730Ld4a0mtbj4mXF
 2Ns0fWlqq5UDuwlf9gZi0p759DWrC6wlC8ge0bN3ZHQX7ihQg5stNciFtDWoi+LjF+
 jWzWEBluurxmktSYXewY3T9nYOayIZyWy4v5xTekb99HPZYHOBbHZT0xSp18BLpDTb
 NaAioF2pMRU0zHtAQ3RqHqTT9WvlSrvbvq0f834SNj6byw1vq/7zTaiB7b45SOLdS0
 ZrrsM+AKFkbmsFDsQ5lzS4sSEz1POrgSXaqhxXHOGYxGm3acH0ikOnG+UML9Urblga
 OhyWc3tcT/vgQ==
Date: Wed, 23 Nov 2022 10:08:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/9] dt-bindings: drop redundant part of title of
 shared bindings
Message-ID: <Y32j1+T3bBVTEDxO@matsya>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
 Mark Brown <broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>,
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

On 21-11-22, 12:06, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "binding", but instead just describe the hardware.  For shared
> (re-usable) schemas, name them all as "common properties".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Guenter Roeck <linux@roeck-us.net> # watchdog
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> # IIO
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/dma/dma-common.yaml           | 2 +-
>  Documentation/devicetree/bindings/dma/dma-controller.yaml       | 2 +-
>  Documentation/devicetree/bindings/dma/dma-router.yaml           | 2 +-

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
