Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 900CE686901
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 15:54:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A3FB9F6;
	Wed,  1 Feb 2023 15:53:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A3FB9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675263276;
	bh=IIIAwVilRWbK/VxJ9R07BpYKGovKnA/g9pkFp6lqOE0=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MF/5cQ/17QpA5cAxbYKTuOKw0U13imSiyXpMABj8JP1q5vmUQ9nLT9BzGKf/5+eu1
	 QrR1T2g1gOdGfgg69AGzjX25WokoXbVY7+Jlj8VMIHfLtro3Dfph5aVSQIBSL8jIWR
	 8TR0L8Q0mS392SQseiWrsCMgkdzP/m+t05Ffv0fk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87801F80543;
	Wed,  1 Feb 2023 15:52:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09028F804B2; Mon, 30 Jan 2023 00:51:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A495F80155
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 00:51:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A495F80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=BqkFNT0Z
Received: from mercury (unknown [185.209.196.162])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: sre)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 64034660086E;
 Sun, 29 Jan 2023 23:51:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675036296;
 bh=IIIAwVilRWbK/VxJ9R07BpYKGovKnA/g9pkFp6lqOE0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BqkFNT0Zs/lQ4ZAdZec7R7noK9RCNBkqilV/t1bQhOMZbIlDsCTR8QIJkJbNxvyOU
 VbE7ue6VTg0M3DdOWcJ6aGjsAcjTr2+ZxqzGv8a4wgAiwvMHBZJQ6DDXAkuexFJSWl
 X/R91K3+3QzQ9ulj8z1XnphRoMblYCn+zpF9EVSp+xN1/FLHdO8Hkm6XRWqdErQRuJ
 XeOTeXAI9WSIaEqngDpgSjhUg3RwspINiAkv6i7zlzWrTopqAX91YHvKTxV3bw79iu
 MRFOyiLlAzyqG/4UwvkFeNkVVuel8NH5rRpODeuULeaiH/bQDGOlXtMZ5C14IPTwFL
 k7BwaWsFHnZdQ==
Received: by mercury (Postfix, from userid 1000)
 id 44F4B1060A24; Mon, 30 Jan 2023 00:51:34 +0100 (CET)
Date: Mon, 30 Jan 2023 00:51:34 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Message-ID: <20230129235134.bmlr33mmxkges22h@mercury.elektranox.org>
References: <20230124230228.372305-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gicruapujo3hf3sv"
Content-Disposition: inline
In-Reply-To: <20230124230228.372305-1-robh@kernel.org>
X-Mailman-Approved-At: Wed, 01 Feb 2023 15:52:51 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>,
 openbmc@lists.ozlabs.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--gicruapujo3hf3sv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jan 24, 2023 at 05:02:28PM -0600, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present.
>=20
> Add unevaluatedProperties or additionalProperties as appropriate, and
> then add any missing properties flagged by the addition.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> [...]
> diff --git a/Documentation/devicetree/bindings/power/supply/ti,lp8727.yam=
l b/Documentation/devicetree/bindings/power/supply/ti,lp8727.yaml
> index ce6fbdba8f6b..0542d4126cf5 100644
> --- a/Documentation/devicetree/bindings/power/supply/ti,lp8727.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/ti,lp8727.yaml
> @@ -28,6 +28,7 @@ properties:
>  patternProperties:
>    '^(ac|usb)$':
>      type: object
> +    additionalProperties: false
>      description: USB/AC charging parameters
>      properties:
>        charger-type:

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--gicruapujo3hf3sv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmPXBoUACgkQ2O7X88g7
+ppJ7Q/9G9KiN17FVwYLLs8SnUjgqv/kYKrPVShDKerSSX6M0f7jyOVMBZz/QMpm
Qzn0tl5laK3KtKo8zTuT/nHHQrwIyURSi8k3pEYUNc4KW8lTxLA4gLOCNjU+mA3r
hFuUUvRcrmDnS9e+du/tWzYg8mSp0eucjWzURwTq+OA2qeUlEfH+1YAb+8LWHxWP
O1pnLG9pGJMA1D3WDQzfXB0YfKpOkPYhxczD3VK0xqO77Z/PFANzD0Us/1XKtoFn
NcsoPPSPBA/KpyjVWi94Rgy7zCXxKTeodChRqTVNUpms71aK75cO7z13ZOSYj3Kh
5ZDpVLxWk2Yp5UujqxsMBYkJ31nQHS63CirMS84oPRR6WKbWzl9Qavl9VdPLMDe5
9lwmcjlHoe0MSwwwuBDuwJRuO2Yr6KcOYvepEbv0/aes6hCB0e4IGq716JG2clLQ
ZDVV5R3dmZk3KR3Ctu5twKz22MXyzqmoemtciqIsHkrLePBXwK6ylrLJfadUpgc1
9hvsiNNTMntVlLI3gIQvsqw3W89s8UmTQAV02ykLZ19yAXhSQW34aslkoG204Dbk
JRW+Mp6cXkXwNoMyqq1rCt4yFIG3ys3ELjFNGRX4we4+XJ7ZVU6agwxNMbyrFuUt
UKXHATWoGucDR6hd83W0A7eREcm/GZzUnBKCAMTu4FUu1UBEOqM=
=p8Fr
-----END PGP SIGNATURE-----

--gicruapujo3hf3sv--
