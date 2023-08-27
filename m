Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A84E789DD8
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 14:21:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A834112;
	Sun, 27 Aug 2023 14:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A834112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693138863;
	bh=U6oncp/62KbVKV/+0RJgkny9X6hK/dhm6Fjvyy8daa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sq++yXgQXMQZatSnWxs1bFS53lmqDi7Tl48AzVRioeicD7T74GKOMGpwHi93jUDox
	 OyF6cnpQvDERhVSYLMfaUYxUbgmK468mee0XFrgvDmANahtOeJy0rehvkvu558dlD4
	 8bLKPpnnvNb6ZAU+nipUtEVMEXKTA7/tByO0lSoU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83359F8032D; Sun, 27 Aug 2023 14:19:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BD5FF80155;
	Sun, 27 Aug 2023 14:19:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C587AF80158; Sun, 27 Aug 2023 14:19:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2D44F800D1
	for <alsa-devel@alsa-project.org>; Sun, 27 Aug 2023 14:19:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2D44F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SiX9ewwV
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F292C6103B;
	Sun, 27 Aug 2023 12:19:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2446CC433C8;
	Sun, 27 Aug 2023 12:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693138772;
	bh=U6oncp/62KbVKV/+0RJgkny9X6hK/dhm6Fjvyy8daa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SiX9ewwVM8stjlc3yHy6qyMofFxpTWcdQLHShhUMpus91DfcAarz4CuOLVMjXG791
	 yF5+KueOpjXT3bPoggDkrw6EJqOl8sA1TOkeGl9naLY9AT2t7AeYACawEbX7a0HqE7
	 fKek9IyfRW+imHnLonYYde7pP/xcpDwn4EYo4prxYE+fxqTG97wh9V9BweT4gqBXBy
	 tWxJDMzRBX+B4Q4KezVdEkDndAnBxOSSqhRp+KGu5xMkoKSH2Qml3cy2qetH2B6UQQ
	 +LhnX9C0h75V4xCYBzd5NRIZh4PBqSSa61OPaN/PpCyiJoMMgPz4ETcr6O6+K6bKKQ
	 7XTq9Gxl22i9w==
Date: Sun, 27 Aug 2023 13:19:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/3] ASoC: dt-bindings: fsl_easrc: Add support for
 imx8mp-easrc
Message-ID: <20230827-cackle-unseated-089a2d61ad4b@spud>
References: <20230827023155.467807-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pLdAo1ePdGPvAelT"
Content-Disposition: inline
In-Reply-To: <20230827023155.467807-1-aford173@gmail.com>
Message-ID-Hash: XNCFLBPFPULW3D7TXPXJIC7GE3LNQ4N6
X-Message-ID-Hash: XNCFLBPFPULW3D7TXPXJIC7GE3LNQ4N6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XNCFLBPFPULW3D7TXPXJIC7GE3LNQ4N6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pLdAo1ePdGPvAelT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 26, 2023 at 09:31:53PM -0500, Adam Ford wrote:
> The i.MX8MP appears to have the same easrc support as the Nano, so
> add imx8mp as an option with a fallback to imx8mn.
>=20
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
> V2:  Fixed errors:
>      ['fsl,imx8mn-easrc'] is too short
>       'fsl,imx8mn-easrc' is not one of ['fsl,imx8mp-easrc']
>        =20
> diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Doc=
umentation/devicetree/bindings/sound/fsl,easrc.yaml
> index bdde68a1059c..a680d7aff237 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> @@ -14,7 +14,13 @@ properties:
>      pattern: "^easrc@.*"
> =20
>    compatible:
> -    const: fsl,imx8mn-easrc
> +    oneOf:
> +      - enum:
> +          - fsl,imx8mn-easrc

This one should probably stay const, no?
Either way,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +      - items:
> +          - enum:
> +              - fsl,imx8mp-easrc
> +          - const: fsl,imx8mn-easrc
> =20
>    reg:
>      maxItems: 1
> --=20
> 2.39.2
>=20

--pLdAo1ePdGPvAelT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZOs/TgAKCRB4tDGHoIJi
0jH9AQCC7Npm9ae30q6QfswRgEaeaCzWpth2K8fmNPeg0llAZgD/SpwyM8EKqToW
1FU3s1ZufKnuqW2q/m7hE+yXGXitfgw=
=PtcV
-----END PGP SIGNATURE-----

--pLdAo1ePdGPvAelT--
