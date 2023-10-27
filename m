Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA537D9AE6
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 16:12:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B74DDEF;
	Fri, 27 Oct 2023 16:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B74DDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698415962;
	bh=qiPK2+5bbIvnFZbVVqos1S/u2AdHxbqykbMWZHHXeiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K6KVA4oC1BvR3ojXhalOUjLhk8dQUJtYWJRUSgPVS+8U1bkP404vDR8CGMKB3x1IQ
	 PV3ydHHd83Tew56yfuZKCX1ahh/WIIbklMp0QP7Y/ufo+X+ASG5C42A798UiKuU0D5
	 MRtUGTLJf4YZWfFp48NXzULhnFcnNIy+QQViooXM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65E93F80537; Fri, 27 Oct 2023 16:11:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29D9CF8020D;
	Fri, 27 Oct 2023 16:11:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3EF8F8020D; Fri, 27 Oct 2023 16:11:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE6C1F8014B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 16:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE6C1F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E+h2mAlT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32FA360F7E;
	Fri, 27 Oct 2023 14:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAD3C433C9;
	Fri, 27 Oct 2023 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698415900;
	bh=qiPK2+5bbIvnFZbVVqos1S/u2AdHxbqykbMWZHHXeiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E+h2mAlTeznQyw9FEZ6q7a/Yc4daSJLb373j7XfWgfwt4u6pT/QB7I7r26Uvy6l1v
	 jeLTaV9iB8eXeABbaFc78yp3zyZoVcYj3phgewglZpGrTZV2hg3WFPadlQ3Bv3XxgJ
	 mTaH6IWdx5I4wF6mskwkrrmp0Z3Li1M2m/48WkmYRzWtT8JYVM3xEZNnNiVNJ1Eq3B
	 xFWdWhVtkPTu0wVIEh/avYTQwxwtiiK7B5orqm0IGXzm4wHDfZLqc7jwwh/heSLTi1
	 Ry9ucEsKi1dPYYO4LiM80iGu5cH4sq5QMTt9juk96LdVv4uIHk/oKQhjGIxJXjTnYR
	 s7ukr0I9mrMSg==
Date: Fri, 27 Oct 2023 15:11:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
	KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
	scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: nau8821: Add DMIC slew rate
 selection
Message-ID: <20231027-pronto-prideful-2cf3415a9d87@spud>
References: <20231027082144.639369-1-wtli@nuvoton.com>
 <20231027082144.639369-2-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Utulr+me0/RPd4KV"
Content-Disposition: inline
In-Reply-To: <20231027082144.639369-2-wtli@nuvoton.com>
Message-ID-Hash: 763VZWIXMYJYNHYDD4ZBTNKWPKRRDZOR
X-Message-ID-Hash: 763VZWIXMYJYNHYDD4ZBTNKWPKRRDZOR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/763VZWIXMYJYNHYDD4ZBTNKWPKRRDZOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Utulr+me0/RPd4KV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Fri, Oct 27, 2023 at 04:21:43PM +0800, Seven Lee wrote:
> Add input with DMIC slew rate selection
>=20
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../devicetree/bindings/sound/nuvoton,nau8821.yaml        | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml=
 b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> index 3e54abd4ca74..01028b7ff85c 100644
> --- a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
> @@ -89,6 +89,13 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      default: 3072000
> =20
> +  nuvoton,dmic-slew-rate-selection:
> +    description: the number from 0 to 7 that sets the DMIC slew rate.
> +        The unit is mV/ns. 0 is the slowest, and 7 is the fastest.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 7
> +    default: 0

I meant make the property in terms of the unit, so
nuvoton,dmic-slew-rate-volt-per-sec (or similar, Rob would likely know
better how he likes the unit suffix for a more complex unit like this
one) and then make it an enum with possible values corresponding to
the real values that putting 0, 1, 2, 3 etc into the register produces.

Cheers,
Conor.

> +
>    nuvoton,left-input-single-end:
>      description: Enable left input with single-ended settings if set.
>          For the headset mic application, the single-ended control is
> @@ -127,6 +134,7 @@ examples:
>              nuvoton,jack-insert-debounce =3D <7>;
>              nuvoton,jack-eject-debounce =3D <0>;
>              nuvoton,dmic-clk-threshold =3D <3072000>;
> +            nuvoton,dmic-slew-rate-selection=3D <0>;
>              #sound-dai-cells =3D <0>;
>          };
>      };
> --=20
> 2.25.1
>=20

--Utulr+me0/RPd4KV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTvFFwAKCRB4tDGHoIJi
0oU8AQCj7pUfn9S1XRtqy6D5OsCQmxBVTCNuJ1c20C0wtxBy1AD+O3vJBYzE6iVc
BMhcpZ436Z5tHhcVPq+K0vt37JpUTwo=
=y/dP
-----END PGP SIGNATURE-----

--Utulr+me0/RPd4KV--
