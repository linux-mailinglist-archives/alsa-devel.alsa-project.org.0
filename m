Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 659FA1AD9B9
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 11:24:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F14861662;
	Fri, 17 Apr 2020 11:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F14861662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587115455;
	bh=eYZf6ks0Ag4vWkdY+FBeNSBOYxZkZ9RWoI7L/wXDw/Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kweqEqM3p6/RJekV+OwUV3R5/Zt++fkwdxpq3vLM92eE5UNTqPkkq9Dkv1iu6n68N
	 7q6XQ+Yje9CcXOKaziA0spc/1/ECQ6XyTSDXrrnOWYJoVYieeaWzujbf2diTTph976
	 aR7f1C4bJAgPTmQ0Fvr9Y//KJEYnER1QOaUkbwHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60F32F802FD;
	Fri, 17 Apr 2020 11:16:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D3F2F8014E; Thu, 16 Apr 2020 08:43:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAD81F80115
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 08:43:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAD81F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="pG92PCpD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Ybg5/gOx"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id C15CD717;
 Thu, 16 Apr 2020 02:43:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 16 Apr 2020 02:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=eYZf6ks0Ag4vWkdY+FBeNSBOYxZ
 kZ9RWoI7L/wXDw/Q=; b=pG92PCpDKEaySEE6b3KK5owRlyOg6omtcBJRh6H2P9g
 A4+dSJ8ZhNWYumPEo8RSeGX3Y1ofqBKY5EwBKyaQ4uWCzw59hiXAUOxV0z1366xq
 iuHHZUldbuzXYDjsaxnBz0RsGbyN9Oo/wuSRdS/D5gtGdR/DOID4nUO++5rp07K7
 LG4gEmPTqHamlJRrP5V34H6lR2pNC4zXGMW/GSE2CyOUmLq5FhAQ7reYixyNSF9S
 Sk3l1mb29qIgPDMYY0/5m7I+DShBoF71j+C3gAVSuV2Nq12oir1/bimsDQytaFI9
 rw3mdDAsOxKY1bvJX6PjvfGpx+6c3IrKClpgJXpZ0wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=eYZf6k
 s0Ag4vWkdY+FBeNSBOYxZkZ9RWoI7L/wXDw/Q=; b=Ybg5/gOxzIy3RezsVgMA1k
 TNS1SpWdG/vSznxDhwvoLrldOuulzJrzOesiyd4OdIPHp7Pvdeido6VN49AZFJjX
 vpbJjlQnZcrl0XVEenAR8HUbxv1iPLz1X4h7y0gO3Y8YvGQ+Gxco5vWU8dTZpAOa
 BZauQ/RaI9M2F28kXPygdaAyXtkuoiRko9nhnLAnG7Fj/vpriF3MX/GnDqw3vD54
 E2nE7ygWUQnJK7D2pMU5A92RDAXmSDVWG2auXATUw58gux8Zcplt8XXxS8uZEPyq
 dwoVwWzcbh8nau5x1J4Tli8kmRSzPV5DdHht5f7hGV1AlT9ldV7F13ym9Jw80idw
 ==
X-ME-Sender: <xms:lv6XXlbZsjXCgRSobpV_OahNA0F2bAh_xQnNz30ENtpJCk6C2O5pKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrfeeggdduudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lv6XXtpOixejZqr7iO1LBzaErDc2trud85HnQReIvup6Nj_ECC1-ug>
 <xmx:lv6XXtQpwDnG3Phz4jTAefVSpE0PDruqeQW4tMGm8dv07y5H0bXPXQ>
 <xmx:lv6XXhnZDnOcsLKYGPwKo5ewvcFCHv464DpLD_f1alqPkiWElJ017g>
 <xmx:lv6XXk2v6et9oVVZCGJreRdM-Z9u-aFhl26_bHzMhmr4x9e7prVi_X54wQY>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id D7E56306005F;
 Thu, 16 Apr 2020 02:43:33 -0400 (EDT)
Date: Thu, 16 Apr 2020 08:43:32 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: Remove cases of 'allOf' containing a
 '$ref'
Message-ID: <20200416064332.cbtmgnbwjityninz@gilmour.lan>
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416005549.9683-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wl56qmwukpbi7dfb"
Content-Disposition: inline
In-Reply-To: <20200416005549.9683-2-robh@kernel.org>
X-Mailman-Approved-At: Fri, 17 Apr 2020 11:15:50 +0200
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-remoteproc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
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


--wl56qmwukpbi7dfb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 07:55:49PM -0500, Rob Herring wrote:
> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords. The json-schema library doesn't yet support this, but the
> tooling now does a fixup for this and either way works.
>
> This has been a constant source of review comments, so let's change this
> treewide so everyone copies the simpler syntax.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

For allwinner,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--wl56qmwukpbi7dfb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpf+lAAKCRDj7w1vZxhR
xfXZAP9GMb4mpNd2CMjZwk5BxMrLzEIpKJTiQ4orqceXOWVHrwEA79RK8mnQLFzA
6mFAQXdPtJjk58zdTQSSSDo30M+OtQk=
=foV0
-----END PGP SIGNATURE-----

--wl56qmwukpbi7dfb--
