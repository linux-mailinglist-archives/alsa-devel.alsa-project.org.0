Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B31B5770028
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 14:24:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4B037F8;
	Fri,  4 Aug 2023 14:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4B037F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691151879;
	bh=QppzQhsRlg4qPDIGbiHxaRS4WDCRfQmv3ibRAOj0YdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NXzLMs7SyFr8vw1H4pj7MiRJXZhBPEocMbZ/iSjb5+NkSVJuB7Ki0J08VypjB30nm
	 ee6sUVPXZ+Kp9oW/+8DriBG78IED9lbWoM8bJwp2l3SKyX68tyLFOsOAa62r7vB9p/
	 iH27YU+Ix26WQqGjuDLg2k1zW09rXwvy5+z8TQuI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 205C3F8053B; Fri,  4 Aug 2023 14:23:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9A30F801D5;
	Fri,  4 Aug 2023 14:23:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2941F8025A; Fri,  4 Aug 2023 14:23:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F15D7F8015B
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 14:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F15D7F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cSvgSbgB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B75F61FB6;
	Fri,  4 Aug 2023 12:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73A3FC433C7;
	Fri,  4 Aug 2023 12:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691151812;
	bh=QppzQhsRlg4qPDIGbiHxaRS4WDCRfQmv3ibRAOj0YdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cSvgSbgBUMcktZ54wPo/skPThBHzsKTN0GaE0ctMtuybUqP1A85EUCZYhi6JPqKpT
	 93FzryH5cLPf88Kvxu8RZRfvp+FPgbbZd20HTAywQ6xQU+L8Mn9ZqwiShkJnSFBr6R
	 pTPcNjpVH8wN1rN34MF4EG5uizJkMwBOMn+9yK9QAYWG6L11A0sV4Sj2ZzEtQY9btY
	 mr5UZYIk7YbWhtsV/E6N0qA+FEMYrcH9U/wlmmlZr6zseaW3lIHxRBzk7bG2GDDMb8
	 +RascKFz6fBXMpmBewbeuKzdkuthZoHi1JK67FjWKe54kXxiB6Ov0ghl8/6z9ZgmIG
	 UY3U50xHvbkKg==
Received: by mercury (Postfix, from userid 1000)
	id B92A71061B1F; Fri,  4 Aug 2023 14:23:29 +0200 (CEST)
Date: Fri, 4 Aug 2023 14:23:29 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: nicolas.ferre@microchip.com, conor.dooley@microchip.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, maz@kernel.org,
	srinivas.kandagatla@linaro.org, thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, alsa-devel@alsa-project.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: update Claudiu Beznea's email address
Message-ID: <20230804122329.l6wytey6tlt4zjub@mercury.elektranox.org>
References: <20230804050007.235799-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ayavysskzyo2pjbe"
Content-Disposition: inline
In-Reply-To: <20230804050007.235799-1-claudiu.beznea@tuxon.dev>
Message-ID-Hash: CE2LAM67PQKK5A43OR5HZWUMWX3VM3D3
X-Message-ID-Hash: CE2LAM67PQKK5A43OR5HZWUMWX3VM3D3
X-MailFrom: sre@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CE2LAM67PQKK5A43OR5HZWUMWX3VM3D3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ayavysskzyo2pjbe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 04, 2023 at 08:00:07AM +0300, Claudiu Beznea wrote:
> Update MAINTAINERS entries with a valid email address as the Microchip
> one is no longer valid.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> ---

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

> Changes in v2:
> - collected tags
> - extended the recipients list to include individual subsystem
>   maintainers and lists instead using only linux-kernel@vger.kernel.org
>   as suggested initially by get_maintainers.pl
>=20
>  MAINTAINERS | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 128fd295f86f..d48d8e857f57 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2351,7 +2351,7 @@ F:	drivers/phy/mediatek/
>  ARM/MICROCHIP (ARM64) SoC support
>  M:	Conor Dooley <conor@kernel.org>
>  M:	Nicolas Ferre <nicolas.ferre@microchip.com>
> -M:	Claudiu Beznea <claudiu.beznea@microchip.com>
> +M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Supported
>  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git
> @@ -2360,7 +2360,7 @@ F:	arch/arm64/boot/dts/microchip/
>  ARM/Microchip (AT91) SoC support
>  M:	Nicolas Ferre <nicolas.ferre@microchip.com>
>  M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
> -M:	Claudiu Beznea <claudiu.beznea@microchip.com>
> +M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Supported
>  W:	http://www.linux4sam.org
> @@ -3265,7 +3265,7 @@ F:	include/uapi/linux/atm*
> =20
>  ATMEL MACB ETHERNET DRIVER
>  M:	Nicolas Ferre <nicolas.ferre@microchip.com>
> -M:	Claudiu Beznea <claudiu.beznea@microchip.com>
> +M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
>  S:	Supported
>  F:	drivers/net/ethernet/cadence/
> =20
> @@ -13880,7 +13880,7 @@ F:	Documentation/devicetree/bindings/serial/atmel=
,at91-usart.yaml
>  F:	drivers/spi/spi-at91-usart.c
> =20
>  MICROCHIP AUDIO ASOC DRIVERS
> -M:	Claudiu Beznea <claudiu.beznea@microchip.com>
> +M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>  S:	Supported
>  F:	Documentation/devicetree/bindings/sound/atmel*
> @@ -13903,7 +13903,7 @@ S:	Maintained
>  F:	drivers/crypto/atmel-ecc.*
> =20
>  MICROCHIP EIC DRIVER
> -M:	Claudiu Beznea <claudiu.beznea@microchip.com>
> +M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Supported
>  F:	Documentation/devicetree/bindings/interrupt-controller/microchip,sama=
7g5-eic.yaml
> @@ -13976,7 +13976,7 @@ F:	drivers/video/fbdev/atmel_lcdfb.c
>  F:	include/video/atmel_lcdc.h
> =20
>  MICROCHIP MCP16502 PMIC DRIVER
> -M:	Claudiu Beznea <claudiu.beznea@microchip.com>
> +M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Supported
>  F:	Documentation/devicetree/bindings/regulator/mcp16502-regulator.txt
> @@ -14003,7 +14003,7 @@ F:	Documentation/devicetree/bindings/mtd/atmel-na=
nd.txt
>  F:	drivers/mtd/nand/raw/atmel/*
> =20
>  MICROCHIP OTPC DRIVER
> -M:	Claudiu Beznea <claudiu.beznea@microchip.com>
> +M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Supported
>  F:	Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
> @@ -14042,7 +14042,7 @@ F:	Documentation/devicetree/bindings/fpga/microch=
ip,mpf-spi-fpga-mgr.yaml
>  F:	drivers/fpga/microchip-spi.c
> =20
>  MICROCHIP PWM DRIVER
> -M:	Claudiu Beznea <claudiu.beznea@microchip.com>
> +M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-pwm@vger.kernel.org
>  S:	Supported
> @@ -14058,7 +14058,7 @@ F:	drivers/iio/adc/at91-sama5d2_adc.c
>  F:	include/dt-bindings/iio/adc/at91-sama5d2_adc.h
> =20
>  MICROCHIP SAMA5D2-COMPATIBLE SHUTDOWN CONTROLLER
> -M:	Claudiu Beznea <claudiu.beznea@microchip.com>
> +M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
>  S:	Supported
>  F:	Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
>  F:	drivers/power/reset/at91-sama5d2_shdwc.c
> @@ -14075,7 +14075,7 @@ S:	Supported
>  F:	drivers/spi/spi-atmel.*
> =20
>  MICROCHIP SSC DRIVER
> -M:	Claudiu Beznea <claudiu.beznea@microchip.com>
> +M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Supported
>  F:	Documentation/devicetree/bindings/misc/atmel-ssc.txt
> @@ -14104,7 +14104,7 @@ F:	drivers/usb/gadget/udc/atmel_usba_udc.*
> =20
>  MICROCHIP WILC1000 WIFI DRIVER
>  M:	Ajay Singh <ajay.kathat@microchip.com>
> -M:	Claudiu Beznea <claudiu.beznea@microchip.com>
> +M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
>  L:	linux-wireless@vger.kernel.org
>  S:	Supported
>  F:	drivers/net/wireless/microchip/wilc1000/
> --=20
> 2.39.2
>=20

--ayavysskzyo2pjbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmTM7akACgkQ2O7X88g7
+prINg//RcuW5D688+v0Q2OnYj7jCRdH2H+xmYorC7m7Z6DH3pjUQWl4b2PS2aQz
iQWEtRsBEMiGgiYIhmwYMqUAClPdGRFyJFilrupoQQezDwvwdgmKMDX652VjH+F8
InoIfuPaXfJPxscO2FXX6A0HM+8Qy14zH/Sf8Tyjc5TYFTdwWqsJMdYXYX2S/Gk9
Uu1KL5ZUWvSooN127dgAC3EijnxV7T8y12gXd2gSrWu1moOYGEc3CJG61rTSa31u
WzD00rEvPVUq9KX5r+uQWP4tub9hGSoy6E/u6K7NKjXWqn6rOjHaz2aw0FEU1/tp
AtGDCOslPmvqFEmJs0bbHo51VlvHEpvDNU7EdKFsOXRIfij72l6SF8pD3Wj5ramA
LrbV+A3kPZRlAudfxBc7ufzdP6wgyR6jgD394Ovhe5XDB+fANTMwCf38Gx62lsUD
x4HnCksQoEZfkLsLtavbHqEpBmwgEHEX8TuZ68HxSDZIAgts8K86zNOnPZvpstak
hLU0Bz0LVJiIz2DWIqE5gxNAaPSAUpT9KflPUiQISAHC7NB+yuNP8UbkOU4DoDQW
K19om2Id4TjnyR7MDk1xb56uIPh9pj9I1sYmvsUkHmhxqh74gq7acYCntwapIyqb
ebwZctmSOe18RQBGJzWciIJsgqDQRpm+9rY+sqRaSALim4llvbM=
=ciPO
-----END PGP SIGNATURE-----

--ayavysskzyo2pjbe--
