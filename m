Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB72639481
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:13:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC2A318BA;
	Sat, 26 Nov 2022 09:12:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC2A318BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450383;
	bh=ZtsEDAGH6M1Hm2mKwIp+nkyl3EOfULlsa+PR5Jh+/yY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cn9bkirP/ZzIYA9jUaojUAPjYmU5OiPrBFHPnFgkGdQuBl2FJJckyrdxcwUxLIrvl
	 WDKsy7iJ66asSJ6FSTUjCtpcUpW2aFQC3xWK1BWdDxz0GHEzv1XE4Hgfa+G815b72I
	 lWjL6W61RWcpHfFelaz+KLjMhZJc5xgmetUIqDTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CBA5F8068A;
	Sat, 26 Nov 2022 08:59:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30C17F8025D; Wed, 23 Nov 2022 16:53:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83F8EF80115
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 16:52:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83F8EF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aCYae1ot"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 72D6861DD8;
 Wed, 23 Nov 2022 15:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5EEC43144;
 Wed, 23 Nov 2022 15:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669218776;
 bh=ZtsEDAGH6M1Hm2mKwIp+nkyl3EOfULlsa+PR5Jh+/yY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aCYae1otHmgUnvQhYydPYexYhzz0miYjM4zpf8c2mnxAms5CtVYUfAM7tWuXKgBlL
 NCzjlOivqXZ6UqIGFo6Q3BntqxLP3hoWG6T432NPpsWDwgRF2tNVlSSreyLi6w5epT
 5yRu6zDAJOHqLx2PKvtXWr2dbpMJrrYdASELSXDQ7oXGnQVROdJjqD20wCxJmK/TbF
 LxosEZjoFf2ROozxpxjVeaVFcuzQLwzX93rS2p4/AwotUvzWq5hYJvRgCJVOQBQ8wc
 Y+r3iBPxcrfDRitsbVrK4soZK4ULKoO7A7tHxHwHfbIwT8fluQgTwO6NOBHUOHbov+
 PWGuJ73a1veDQ==
Date: Wed, 23 Nov 2022 15:52:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 9/9] dt-bindings: drop redundant part of title (manual)
Message-ID: <Y35BzU80hf36eRyo@sirena.org.uk>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QAOhPtWQs4kr9fZE"
Content-Disposition: inline
In-Reply-To: <20221121110615.97962-10-krzysztof.kozlowski@linaro.org>
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


--QAOhPtWQs4kr9fZE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 21, 2022 at 12:06:15PM +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding" or a "schema", but instead just describe
> the hardware.

Acked-by: Mark Brown <broonie@kernel.org>

--QAOhPtWQs4kr9fZE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN+QcwACgkQJNaLcl1U
h9AXjAf8DK+4g+6i+PYcdDNKGnFY/1uo0vNGE7MKgsNgIAMn42Y9Tw++ts0ZwHYw
EDuQqMblUcsp9NKWMs1LVsvQ2YGAbZUXjgUzWpiImszGWwmUf6DZkjwNojGA5ngh
GAGhKyUYUGXRb0MKJ1X4O3pobituSQSnz8UWlDrpBOO2OiWnWvdbURWlhNYNqMSm
70ahwExSo8nv/Dxkvf+GV0FHLToE5K4JZxqRh/Gn0l0206IYzY4jvEbCq0DEuZPH
Jt7Az6phpVvce86sAHnvukNdIa0EQ/8pR+v9idvZiGVY5NJvdJA54BR+1AoXlMna
RQueknzjRrsbdQSr0xa/wr8lQW5rpw==
=Wum3
-----END PGP SIGNATURE-----

--QAOhPtWQs4kr9fZE--
