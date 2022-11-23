Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F87B63944B
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:04:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA7CA17F9;
	Sat, 26 Nov 2022 09:03:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA7CA17F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669449867;
	bh=zTIEHGwbmaOUDyrFquKdXCAjwyHAbKSqMbl1KSejD2g=;
	h=In-Reply-To:References:Subject:From:To:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LEa/W7lgPwA5wvAfNG349o45XtHKO8EUUnAIvQHhQ2P7S2hWkMmnikMw/uqNjFebF
	 VZYkbjK9M9Tq8ZqosO+4yBidoxWc1kCUAEhdVutxOi3U1tGE6UGSOWidDuN1lMsirg
	 tYEzaKzQCG3/Me/4xfERLtpO6OXGe5sOcCzPsKMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B371F805CB;
	Sat, 26 Nov 2022 08:59:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3647F80272; Wed, 23 Nov 2022 02:14:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65F00F80115
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 02:14:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65F00F80115
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=kernel.org header.i=@kernel.org header.b="eaqRSV6g"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1FF92B81CBD;
 Wed, 23 Nov 2022 01:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4865C433C1;
 Wed, 23 Nov 2022 01:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669166047;
 bh=zTIEHGwbmaOUDyrFquKdXCAjwyHAbKSqMbl1KSejD2g=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=eaqRSV6gh2g8+WVKDH/rSd6EIzEqzis9/feCSBijzsbchaDY16DVRXkr5SjQuLDxC
 7fFsAiTlHOtbCQobJA9rIus3yeEH05iQ5b+/eWR8Cy/6qg0a6USR5sTCYd3kvCn8em
 qT8U9JmY/0vhbBd5HDBe8OI/firQwaWsAvppdD+im72NdeZS2tjv2zaJ6cI9JBkgim
 j8qGtcznNz9LDH6vGVds1wI6vrnqGGvZ3NT10jY/uiOdHiWLqyF5Nh/64+3Tp7RqMo
 SItZwvNGid1/Zq1R/Mvtl11rtcOt1bTpsEe5A+U+frR0T4LcVH9Is4s6YqT0uz48or
 Xm/gSZNYXPrpw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221121110615.97962-10-krzysztof.kozlowski@linaro.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-10-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 9/9] dt-bindings: drop redundant part of title (manual)
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
Date: Tue, 22 Nov 2022 17:14:05 -0800
User-Agent: alot/0.10
Message-Id: <20221123011407.C4865C433C1@smtp.kernel.org>
X-Mailman-Approved-At: Sat, 26 Nov 2022 08:58:53 +0100
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

Quoting Krzysztof Kozlowski (2022-11-21 03:06:15)
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding" or a "schema", but instead just describe
> the hardware.
>=20
> Manual updates to various binding titles, including capitalizing them.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml   | 2 +-
>  Documentation/devicetree/bindings/clock/fsl,scu-clk.yaml        | 2 +-
>  .../devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml         | 2 +-

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk
