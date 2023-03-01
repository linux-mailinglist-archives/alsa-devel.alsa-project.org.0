Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCF36A75F2
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Mar 2023 22:10:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0361F10E;
	Wed,  1 Mar 2023 22:09:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0361F10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677705004;
	bh=rCPgKyY8pL4WsWbwal7/GnROcvnC0cplhyx7czzuBrI=;
	h=In-Reply-To:References:Subject:From:To:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LLAwsrKz24ir9BsgBHXpw187nUEVq17yKHpWOI9a6aqX+NBVAcV2UOGYcwta28IzQ
	 4ymmDmUfQ1ySC/9ObIRTnXkX8AV1wqyWj8UYt4v69dxdYXf7htg/9EQbQww6AUBxDL
	 eM3HZS5HqT0OoCyP1M49k5A8XYHWEkPoxjcIkxDE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A510AF80310;
	Wed,  1 Mar 2023 22:09:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EEB1F8049C; Wed,  1 Mar 2023 22:09:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04166F800DF
	for <alsa-devel@alsa-project.org>; Wed,  1 Mar 2023 22:09:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04166F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XPtEoCOK
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5C204B8111A;
	Wed,  1 Mar 2023 21:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074E4C433EF;
	Wed,  1 Mar 2023 21:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677704944;
	bh=rCPgKyY8pL4WsWbwal7/GnROcvnC0cplhyx7czzuBrI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XPtEoCOK0uCzDk5+9/F+HsvDisG6x30coh35MtKooxhGCdVLAujsC16RjuFJNeJSs
	 j7ciysEU7AIVDGDF0mVl0eCUtDQPZdCGf/LDWZa7s46dd2DQYHGUjBbGf6Ck8HIGfp
	 QaPDKylGnfmK/uLRTK7f5kJ4WEuHlXrjDJUcqkdMIUgs9xlO4K/9BBusrKlAGzSaFK
	 9bZOKQsXERsjEMkdZTHcBw9PEuUsfTHkY5vQ4UEhdVKlT6sTmtmkWE2uREh5ZQ3l4U
	 XeMOJhBFHPbU3QD2rS1Om+3BJzD9KFZ3Tb2gxhY/s7cVeRc2dMWj7kw3wy45x80er/
	 Aj12X7L3l1l0A==
Message-ID: <5d53f8abdaa50b19ac60c198252c5a5e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230228215433.3944508-1-robh@kernel.org>
References: <20230228215433.3944508-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix SPI and I2C bus node names in examples
From: Stephen Boyd <sboyd@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh@kernel.org>
Date: Wed, 01 Mar 2023 13:09:01 -0800
User-Agent: alot/0.10
Message-ID-Hash: Y22N2KIKWW4WUJO5NQWIUOUMKDR6A34F
X-Message-ID-Hash: Y22N2KIKWW4WUJO5NQWIUOUMKDR6A34F
X-MailFrom: sboyd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Wolfgang Grandegger <wg@grandegger.com>, Kalle Valo <kvalo@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-can@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y22N2KIKWW4WUJO5NQWIUOUMKDR6A34F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quoting Rob Herring (2023-02-28 13:54:33)
> SPI and I2C bus node names are expected to be "spi" or "i2c",
> respectively, with nothing else, a unit-address, or a '-N' index. A
> pattern of 'spi0' or 'i2c0' or similar has crept in. Fix all these
> cases. Mostly scripted with the following commands:
>=20
> git grep -l '\si2c[0-9] {' Documentation/devicetree/ | xargs sed -i -e 's=
/i2c[0-9] {/i2c {/'
> git grep -l '\sspi[0-9] {' Documentation/devicetree/ | xargs sed -i -e 's=
/spi[0-9] {/spi {/'
>=20
> With this, a few errors in examples were exposed and fixed.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

> diff --git a/Documentation/devicetree/bindings/clock/ti,lmk04832.yaml b/D=
ocumentation/devicetree/bindings/clock/ti,lmk04832.yaml
> index 73d17830f165..13d7b3d03d84 100644
> --- a/Documentation/devicetree/bindings/clock/ti,lmk04832.yaml
> +++ b/Documentation/devicetree/bindings/clock/ti,lmk04832.yaml
> @@ -160,7 +160,7 @@ examples:
>          };
>      };
> =20
> -    spi0 {
> +    spi {
>          #address-cells =3D <1>;
>          #size-cells =3D <0>;
>
