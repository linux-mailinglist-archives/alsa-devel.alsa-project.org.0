Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D457E5636
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 13:29:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95789850;
	Wed,  8 Nov 2023 13:28:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95789850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699446562;
	bh=XB3yqrhkhxeT9M0N0X8n+emnTmZjtkm9F39I+mshKDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vAYql16dhC1D1Q+V/wql/M68PUHtdRO7mhu7r1lCHoFdEdJEj4EfCZPUwDa0cyAhE
	 A/zGokTLYk71myEs1OEyK41r/knCBL+ZgGcRDQxVxEoUyzwcHmCNElMNxqEB/eTxds
	 DPOQL6bQedGD2uh+FBRHhXVWWvIUtQCcdRMv2k7s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B96CF80549; Wed,  8 Nov 2023 13:28:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83E8DF80169;
	Wed,  8 Nov 2023 13:28:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 123DFF8016D; Wed,  8 Nov 2023 13:28:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AA98F80100
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 13:28:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AA98F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MvkHgjyl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9D5CECE1025;
	Wed,  8 Nov 2023 12:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9872C433C7;
	Wed,  8 Nov 2023 12:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699446490;
	bh=XB3yqrhkhxeT9M0N0X8n+emnTmZjtkm9F39I+mshKDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvkHgjyliiv31fmFx/H4c4rIscBXniiM2ppee2k8ZEHDPaZ4Q+UOGDC+SGcoVdbni
	 NW9SEEjp3TKRoFbk9VqTbEN3iBh5EHbmJwDK7UrdwXCq8IhcjDFieIh0gYBwyUQ+X2
	 Bl+fDoC85+fAY6LBRNdITZ/7wpGLi+zEgzSxXUXpNLXGbu4jad+5ki6oAEWdgmeXcA
	 +IWYk4tacmWnNLmHvO2Wq6gPWj6gmSLbm2AaD3FKL2tbUO9XD5JBttWmDvZce5GzbZ
	 4Rrd72OKCrebBj/erZTZ5+GFEZCb3OCvL1jTuhHo5IyZvfVn2RnlpPj3ZBFQYNulDC
	 +2x2QOfE0A/Sw==
Date: Wed, 8 Nov 2023 12:28:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
	KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
	scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: nau8821: Add DMIC slew rate.
Message-ID: <20231108-ungraded-paddle-93f2102e4f61@spud>
References: <20231107035230.1241683-1-wtli@nuvoton.com>
 <20231107035230.1241683-2-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m+wVLMrEzhVYOsBg"
Content-Disposition: inline
In-Reply-To: <20231107035230.1241683-2-wtli@nuvoton.com>
Message-ID-Hash: XXWFYDDWW2Y3XR35U3JFHGQQCNA2MGFV
X-Message-ID-Hash: XXWFYDDWW2Y3XR35U3JFHGQQCNA2MGFV
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XXWFYDDWW2Y3XR35U3JFHGQQCNA2MGFV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--m+wVLMrEzhVYOsBg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2023 at 11:52:29AM +0800, Seven Lee wrote:
> Add input with DMIC slew rate controls.
>=20
> Signed-off-by: Seven Lee <wtli@nuvoton.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  .../devicetree/bindings/sound/nuvoton,nau8821.yaml       | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml=
 b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> index 3e54abd4ca74..3380b6aa9542 100644
> --- a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> @@ -89,6 +89,14 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      default: 3072000
> =20
> +  nuvoton,dmic-slew-rate:
> +    description: The range 0 to 7 represents the speed of DMIC slew rate.
> +        The lowest value 0 means the slowest rate and the highest value
> +        7 means the fastest rate.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 7
> +    default: 0
> +
>    nuvoton,left-input-single-end:
>      description: Enable left input with single-ended settings if set.
>          For the headset mic application, the single-ended control is
> @@ -127,6 +135,7 @@ examples:
>              nuvoton,jack-insert-debounce =3D <7>;
>              nuvoton,jack-eject-debounce =3D <0>;
>              nuvoton,dmic-clk-threshold =3D <3072000>;
> +            nuvoton,dmic-slew-rate=3D <0>;
>              #sound-dai-cells =3D <0>;
>          };
>      };
> --=20
> 2.25.1
>=20

--m+wVLMrEzhVYOsBg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUt+1QAKCRB4tDGHoIJi
0utcAQCmLM7CTdSg8LB5s/+0Hp1lbmS88sg9SymaMSKjIRplmwEA0b08DRBNoeEJ
iDhhK2QtHSMpHWkckynXbj6qbZyzpAo=
=NnjE
-----END PGP SIGNATURE-----

--m+wVLMrEzhVYOsBg--
