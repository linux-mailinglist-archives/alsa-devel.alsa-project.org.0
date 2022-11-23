Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D57639476
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Nov 2022 09:11:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC40A1856;
	Sat, 26 Nov 2022 09:10:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC40A1856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669450308;
	bh=pCgyV6URGkswg9KKfkXhBda5Iki1k2lO8qrKykFSEt8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f6YxZK/0mcVzFmy9hcg89ssF8IDS3CIhdSu99rcIiFi/o2/rlrpfuNdGfrycRHdNp
	 rPF84Jis5ZC9q3w3jrEGo+h1v8Rh4hw79HUthyJ7GB5xMoRJ0eZBtGbPJhqPf0RRxA
	 q/BWcurLXKCDLbaqkqinTryf8fuUMmqVx4YD5xfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 058A8F80676;
	Sat, 26 Nov 2022 08:59:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8490AF80559; Wed, 23 Nov 2022 16:39:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B948F80557
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 16:39:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B948F80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F3k9sXYZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D3C161D96;
 Wed, 23 Nov 2022 15:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9DFC433D7;
 Wed, 23 Nov 2022 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669217954;
 bh=pCgyV6URGkswg9KKfkXhBda5Iki1k2lO8qrKykFSEt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F3k9sXYZXMZbJL2KgSGmWiPRXMvHRdfTCIP9VQmjXd650/uUYXwTHEqUWxxttSOWT
 hB9b2sL956S0bUti6tuHTy2XEt5HjAbHeCo+axvVAD2rZcRJx2sPwnWchFDK3MrGxa
 yAlYOmKN8Mg4CXN+fkDD7QVG2+Cel0JnNA0akTveOPTARV97+qqsyEi6hpO6vdCsSE
 LSyr4JBajkK5pYVRAYm5iecBZGybtYAXBVbkB+5aKcTmslEywj8Jzp0bx/0VpZMrY2
 D5rI9GA2AAWuXzKpflAIq18/MHA6MmSTayBSrTtAwCYcKH0rMZJiTAzR77dwqComaB
 rsQQ9HVyYiq1w==
Date: Wed, 23 Nov 2022 15:39:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/9] dt-bindings: drop redundant part of title (end,
 part two)
Message-ID: <Y34+lGKAxewL8B1w@sirena.org.uk>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3A/ckh57FM2wa6K8"
Content-Disposition: inline
In-Reply-To: <20221121110615.97962-6-krzysztof.kozlowski@linaro.org>
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


--3A/ckh57FM2wa6K8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 21, 2022 at 12:06:11PM +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "binding", but instead just describe the hardware.

Acked-by: Mark Brown <broonie@kernel.org>

--3A/ckh57FM2wa6K8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN+PpQACgkQJNaLcl1U
h9D31gf/diT1M+7KeH7O9XMaZE9GvQx7EpNfWPd6EPxvzUkePN6w8u24ztB2s1gn
LKqFnrfx5FQwvbCsjmuHqePIJ6kdBJHpd8zn0XYx/cJQJlR/lFm5FPbdjhDnfcCC
lH4+dPqm7Tms/Dmlw8z49shzkjbAkN5O81QNFCdqvgYfp94E6kUVysgHobbu7DzT
8dtk4IMR8dgd1gsVYd3RlfLDv7zlhti06pOwAYvL7I/+ELvcFRXtGgOq8p8EMd//
e9dFGh61GX0//8+cYUSUG2Qb/npn7nA2mFko17JRUU21NrTgMn1qbJvntYvhfKqj
AqDREqKbfhSeQVkKulAfyfkiBA4hNg==
=SxY0
-----END PGP SIGNATURE-----

--3A/ckh57FM2wa6K8--
