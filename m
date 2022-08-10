Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C450D58EC96
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 14:59:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E39B161E;
	Wed, 10 Aug 2022 14:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E39B161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660136345;
	bh=AXUViYjkfsjlWnyiLgWqWN9MZttYpnjGIynZu5rUAaw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o3oqEZGgMPOePdwBr8GrFwqVIM1t5ITQDRoB/8deaOoww93kblq2L0koifjRyPdng
	 9+22y2v+k2RZpFM8TgHhund+CBbEQDBKn6mQjEs19WIAJIJEBaAHVJtQF++eZ0DxUH
	 fQG2liNbpQQzyImldTF4tI8JaDrMBFCylCNsBhiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B00ABF80240;
	Wed, 10 Aug 2022 14:58:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09E4EF801F5; Wed, 10 Aug 2022 14:58:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0275DF8012A
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 14:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0275DF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="jDXgdsOi"
Received: from mercury (dyndsl-095-033-155-153.ewe-ip-backbone.de
 [95.33.155.153])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sre)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 968926601C2A;
 Wed, 10 Aug 2022 13:57:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1660136277;
 bh=AXUViYjkfsjlWnyiLgWqWN9MZttYpnjGIynZu5rUAaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jDXgdsOidzYTu2oNC1erHn44vbS2vts5ReWdZHenahU9BENWCkA4038OA+Nwkkb+4
 /kUOsqVguBjz/1jC3F/3t7A+gXlSVVaUyNWk07nXB7dJANymSbUxRqRYy/NimPHiiS
 8TexTLunA86QqT9HLoeMK639uFUaEd+QyFrVsOa8lUvBsCK6Y53MhOqGIF8FJ/oDvL
 0jPcOgPamgd6afMYuUC20rxuBlJHdk02soJI8TezMQTsf0BgCoubktSvLhHNq9SOpi
 tgbaI3K6qgahfLujBtUwX+9h/7FcziktKvhn7YNwpMiqeyYQmJGwfD5r9CrDeT5NAS
 42j7pvI156W/A==
Received: by mercury (Postfix, from userid 1000)
 id E7D8A1060840; Wed, 10 Aug 2022 14:57:55 +0200 (CEST)
Date: Wed, 10 Aug 2022 14:57:55 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: Drop Dan Murphy and Ricardo
 Rivera-Matos
Message-ID: <20220810125755.l6ou6imgbeuj37ir@mercury.elektranox.org>
References: <20220809162752.10186-1-krzysztof.kozlowski@linaro.org>
 <20220809162752.10186-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qodvu6jzbg5jdb43"
Content-Disposition: inline
In-Reply-To: <20220809162752.10186-6-krzysztof.kozlowski@linaro.org>
Cc: linux-fbdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-pm@vger.kernel.org,
 Tim Harvey <tharvey@gateworks.com>, Rob Herring <robh+dt@kernel.org>,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>,
 Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>,
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


--qodvu6jzbg5jdb43
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 09, 2022 at 07:27:52PM +0300, Krzysztof Kozlowski wrote:
> Emails to Dan Murphy and Ricardo Rivera-Matos bounce ("550 Invalid
> recipient").  Andrew Davis agreed to take over the bindings.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> Changes since v1:
> 1. Add Andrew Davis instead.
> 2. Not adding accumulated ack due to change above.
> ---
=2E..
>  Documentation/devicetree/bindings/power/supply/bq2515x.yaml    | 3 +--
>  Documentation/devicetree/bindings/power/supply/bq256xx.yaml    | 2 +-
>  Documentation/devicetree/bindings/power/supply/bq25980.yaml    | 3 +--

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> [...]
> diff --git a/Documentation/devicetree/bindings/power/supply/bq2515x.yaml =
b/Documentation/devicetree/bindings/power/supply/bq2515x.yaml
> index 27db38577822..1a1b240034ef 100644
> --- a/Documentation/devicetree/bindings/power/supply/bq2515x.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/bq2515x.yaml
> @@ -8,8 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: TI bq2515x 500-mA Linear charger family
> =20
>  maintainers:
> -  - Dan Murphy <dmurphy@ti.com>
> -  - Ricardo Rivera-Matos <r-rivera-matos@ti.com>
> +  - Andrew Davis <afd@ti.com>
> =20
>  description: |
>    The BQ2515x family is a highly integrated battery charge management IC=
 that
> diff --git a/Documentation/devicetree/bindings/power/supply/bq256xx.yaml =
b/Documentation/devicetree/bindings/power/supply/bq256xx.yaml
> index 91abe5733c41..82f382a7ffb3 100644
> --- a/Documentation/devicetree/bindings/power/supply/bq256xx.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/bq256xx.yaml
> @@ -8,7 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: TI bq256xx Switch Mode Buck Charger
> =20
>  maintainers:
> -  - Ricardo Rivera-Matos <r-rivera-matos@ti.com>
> +  - Andrew Davis <afd@ti.com>
> =20
>  description: |
>    The bq256xx devices are a family of highly-integrated battery charge
> diff --git a/Documentation/devicetree/bindings/power/supply/bq25980.yaml =
b/Documentation/devicetree/bindings/power/supply/bq25980.yaml
> index 4883527ab5c7..b687b8bcd705 100644
> --- a/Documentation/devicetree/bindings/power/supply/bq25980.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/bq25980.yaml
> @@ -8,8 +8,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: TI BQ25980 Flash Charger
> =20
>  maintainers:
> -  - Dan Murphy <dmurphy@ti.com>
> -  - Ricardo Rivera-Matos <r-rivera-matos@ti.com>
> +  - Andrew Davis <afd@ti.com>
> =20
>  description: |
>    The BQ25980, BQ25975, and BQ25960 are a series of flash chargers inten=
ded
> [...]

--qodvu6jzbg5jdb43
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmLzq1MACgkQ2O7X88g7
+prR3RAAguNXBrOMU277Ao4ijuGi+QU6SzrNjySRdOiRVoG9Jn3Zo3D6969KokAP
JfuYQLSClNfcDgaNVQPpXT5TG377q5ZerWaqfEFCXAy+cp0RIZWXdpDhb+2A5gCU
gISuq5p61V0AQM6xyU+E9q+q9ZzQ8Qjjo2ckVFCqfcxe3pX4YUUXYu39ieKJqX7G
juQsf03XgmKXT9PfPpBvMpPe7PqYlFzZqkuvfpNILNtksDBasHS2Tm998RXq3OTe
hTlItrD65Mb4EEkhtuhj4Xkm6VbW6PXMAJiTCWraJsBZV+aZMdPWeoC5RsnhEDjM
XcwnQGGy7VZYotwFMBYv1AtxiP6YNim1aYyReT/LA/+HBcIBGmD8Q0v3tgO9ruou
Gx3DlkUgoo+q1cOLP0dzb+BWxSEx1VlNwONhIv/5bciur7BLTgVPt/1Vt2qLle0V
1oEq90rdpUTv2poZn3cTd7+Qt99Eld3cVZ/JUFxrXywZkDuKMXB0Krnbg+sOeLfn
dCWCe7fKeqgEIL71rna2j5BwCGFazcU3JeB2WdncDLqpFQaeb/0OPB8zw6RnC+oM
PA+3qhtyhYYbcRMP7enDBV4skvpNTlJMD+tYQdzFWkcotVCvXho+7mI/Us+KZwBC
+CQWd+WnX+l91INLir3KpF7b3yR5BZeo5MYQND5yD7ZKylUXcRo=
=yGj8
-----END PGP SIGNATURE-----

--qodvu6jzbg5jdb43--
