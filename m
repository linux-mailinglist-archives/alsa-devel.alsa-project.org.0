Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7DC829826
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 11:58:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F236E9D;
	Wed, 10 Jan 2024 11:58:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F236E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704884309;
	bh=xkaWrvfIfP7fZ7XhBOMVv7Q1Juvm5n5GKRa8e8j5ynQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IYLrOFe3I8QbQhsFvkGWJ12U4fh1HWU9AUD3mZfewn9oQ8pMRuG1l3sqFqR+j8EBF
	 VRtnIOMotPBPs6n6NedKM+oQgA/Wyy7LsYwJKY4G78w9XwtM+OtEMjEzJEiBpiHHYs
	 S3H0w4GLA5SlmnB7Tl3ZioOfcTQ0iv4W+qULvMQg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB892F80548; Wed, 10 Jan 2024 11:57:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C097F8057F;
	Wed, 10 Jan 2024 11:57:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B249F80254; Wed, 10 Jan 2024 11:56:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 931C0F8014B
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 11:56:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 931C0F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KAUNf7aJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 443C2CE1C0C;
	Wed, 10 Jan 2024 10:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CE8C433C7;
	Wed, 10 Jan 2024 10:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704884180;
	bh=xkaWrvfIfP7fZ7XhBOMVv7Q1Juvm5n5GKRa8e8j5ynQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KAUNf7aJLFZZQ90MjJVa5wr0odvvVCP5rWR+DTYfKeWU38ePHYogD6u6vEMzXM+pU
	 PVHcAr3qi6SBD4pN8ssWUab2Ap1A2A/3vMgDMtSQvBVYcVMlMFz9hayZ9r9C6Fdp0q
	 vpLRh4m99k2bMFdc4NkhQijRAkcUeuv4ojSEX8vN2jvk4D7iJAkaFWejbtMIaJW2Cb
	 EfjdbwC9LpctUoW6EoXHkVB0YvfbqF8pNJ12lxbEfcfOVlU5SL/vXc3HqhRWF99Mug
	 4Ne4eKP57irYVyFcgPjgbZ8n3/ZfSXSUQXHx7GuB5C2CHNw231DBMmVFvHZHMWhH+D
	 XE036xOJQDtoQ==
Date: Wed, 10 Jan 2024 10:56:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: fsl,micfil: Add compatible string
 for i.MX95 platform
Message-ID: <20240110-petty-tabasco-e8d86a751dea@spud>
References: <20240109075551.870001-1-chancel.liu@nxp.com>
 <20240109075551.870001-4-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uKeeFUVPvFzJGMuc"
Content-Disposition: inline
In-Reply-To: <20240109075551.870001-4-chancel.liu@nxp.com>
Message-ID-Hash: LHO5BI4I2SKSOKZ47VDAVC2JSO2SXASX
X-Message-ID-Hash: LHO5BI4I2SKSOKZ47VDAVC2JSO2SXASX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LHO5BI4I2SKSOKZ47VDAVC2JSO2SXASX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--uKeeFUVPvFzJGMuc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2024 at 04:55:51PM +0900, Chancel Liu wrote:
> Add compatible string "fsl,imx95-micfil" for i.MX95 platform.
>=20
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,micfil.yaml     | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Do=
cumentation/devicetree/bindings/sound/fsl,micfil.yaml
> index b7e605835639..f0d3d11d07d2 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> @@ -15,10 +15,17 @@ description: |
> =20
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx8mm-micfil
> -      - fsl,imx8mp-micfil
> -      - fsl,imx93-micfil
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx95-micfil
> +          - const: fsl,imx93-micfil
> +

> +      - items:

This items is not needed, as the only item in the list is the enum.
You can just do
properties:
  compatible:
    oneOf:
      - items:
          - enum:
              - fsl,imx95-micfil
          - const: fsl,imx93-micfil

      - enum:
          - fsl,imx8mm-micfil
          - fsl,imx8mp-micfil
          - fsl,imx93-micfil

Cheers,
Conor.

> +          - enum:
> +              - fsl,imx8mm-micfil
> +              - fsl,imx8mp-micfil
> +              - fsl,imx93-micfil
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.42.0
>=20

--uKeeFUVPvFzJGMuc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ53zgAKCRB4tDGHoIJi
0tn/AP9dcugakMRKRZG/ezh4tXsqNC4Q32/3HPFQMtSa/xVWlwD+JAQQ5q83Q6Xt
RFG9B3BLubQbp2zSeeMNkMv2QI2Hiwg=
=JTpT
-----END PGP SIGNATURE-----

--uKeeFUVPvFzJGMuc--
