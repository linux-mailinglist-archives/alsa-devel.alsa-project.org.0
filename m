Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB55862718
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Feb 2024 20:49:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B98A1846;
	Sat, 24 Feb 2024 20:49:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B98A1846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708804165;
	bh=DrXEA5LfQtyiBzKY/GgIWRK6O4zFVc1tt6OpMvzP0T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gwgyNSydthg+13EZGZ0JyG1q8XE3K3eAsXiGuHfV/DlaS13Pa2EgQzKjjV5z0hNB7
	 512P/XUOOZb+wnuqdZk35AlYDRLNVJyGAjVfj501vAhrSBZOS7SaQmLU4rQj/GGkx4
	 UK4j3hgzziccejIEFvAccHX7gc06k7Qf7SYEfuh4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A237F805AC; Sat, 24 Feb 2024 20:48:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1BA2F80567;
	Sat, 24 Feb 2024 20:48:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37F34F80496; Sat, 24 Feb 2024 20:48:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61A34F800ED
	for <alsa-devel@alsa-project.org>; Sat, 24 Feb 2024 20:48:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61A34F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=duONKiU8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F02766023E;
	Sat, 24 Feb 2024 19:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B23BC433C7;
	Sat, 24 Feb 2024 19:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708804120;
	bh=DrXEA5LfQtyiBzKY/GgIWRK6O4zFVc1tt6OpMvzP0T4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=duONKiU8o2/aF9dShN9pM1Jt/VDiYdpOIKqD2ixaszIx5VxL4mL8dWCLESyqQiBbX
	 d9kiVBZCtakOUubpduacqMM7JSEGIsJcu189cLdzQVPhsegSn/mDUzeROeuZUcF23F
	 x8uperuvNzjLHdlfZTlrmd9c/rMlY390HkcqWsaP8jcqrPCuRYijG5YnjANiWFDGxc
	 i93QvOIh7kdJ13F3HcRAevT83jyMHf0+j4PnGRhzWlPnNIdLG6UUjQXeZZAOf3TCHi
	 EKwuuf4/G1pKLvtPd2AY7XpcFXppHKbkdj4+ftZeZNxqH7U5TTE5diTTpftudy62HH
	 PtlEqkSwrMqZg==
Date: Sat, 24 Feb 2024 19:48:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, broonie@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 13/39] ASoC: dt-bindings: atmel-classd: add sam9x7
 compatible
Message-ID: <20240224-vice-lunchtime-fd456448d41d@spud>
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
 <20240223172608.672190-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GCI4KyNPv+vKZusj"
Content-Disposition: inline
In-Reply-To: <20240223172608.672190-1-varshini.rajendran@microchip.com>
Message-ID-Hash: UOATIETSWILKPCJA2EVOMZUVDSWCM42N
X-Message-ID-Hash: UOATIETSWILKPCJA2EVOMZUVDSWCM42N
X-MailFrom: conor@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOATIETSWILKPCJA2EVOMZUVDSWCM42N/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--GCI4KyNPv+vKZusj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 10:56:08PM +0530, Varshini Rajendran wrote:
> Add sam9x7 compatible to DT bindings documentation.
>=20
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
> Changes in v4:
> - Changed the subject prefix matching the subsystem

> - Removed unwanted '-items' from the syntax

Did you? The diff looks identical to v3.

Thanks,
Conor.

> ---
>  .../devicetree/bindings/sound/atmel,sama5d2-classd.yaml    | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd=
=2Eyaml b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> index 43d04702ac2d..ae3162fcfe02 100644
> --- a/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> +++ b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
> @@ -18,7 +18,12 @@ description:
> =20
>  properties:
>    compatible:
> -    const: atmel,sama5d2-classd
> +    oneOf:
> +      - items:
> +          - const: atmel,sama5d2-classd
> +      - items:
> +          - const: microchip,sam9x7-classd
> +          - const: atmel,sama5d2-classd
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.25.1
>=20

--GCI4KyNPv+vKZusj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdpIEwAKCRB4tDGHoIJi
0rqeAP0T/vcukep+lXBA0E6SieaRS5/yTwFDjelCml6dZ9FuPAEAmcrwGIUWtiu9
CqsI65afkbEy4WSEXseZIFo6hs+MhA4=
=BpOz
-----END PGP SIGNATURE-----

--GCI4KyNPv+vKZusj--
