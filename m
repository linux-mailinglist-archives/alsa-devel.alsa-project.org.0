Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B638C139A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 19:15:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41C6EE76;
	Thu,  9 May 2024 19:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41C6EE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715274921;
	bh=YwUKTYOpoxA/NOjHV7A/q7cg5e41+QOvCr4wGh3um4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d9HUq1SmkHsyaDrzYM9GOMdOijEFI8cg7WCItUI6rPl5aHUl2k11a5Oss2opcOhr3
	 akB3WvDRv1heuRvzuq6b3IUxqwCM9XQDy3WeOIehBjTtRoDxQ4RTYuixq4tJvRvOg5
	 4kRNQI8jF9OolONCT305C9bOzNvd+Gvvw5//o/kQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51C42F80152; Thu,  9 May 2024 19:14:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C70C7F805A0;
	Thu,  9 May 2024 19:14:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A40F4F8049C; Thu,  9 May 2024 19:14:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10F6DF8024C
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 19:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10F6DF8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qNltURwB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C33661D5A;
	Thu,  9 May 2024 17:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D799FC116B1;
	Thu,  9 May 2024 17:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715274878;
	bh=YwUKTYOpoxA/NOjHV7A/q7cg5e41+QOvCr4wGh3um4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qNltURwBHZ0ugcWbLrUYJc6RkDUcNQgiYSfZKjEwL9+mHhuhW146bkl+HHiyqOY7D
	 wNNuItMLZg9XcI1JEb6/M6vYSge5p3d/Jqj/OmYtbmVYnvKDIu/qETs5sRmCps6IOQ
	 4LZSSh8xcEqDzkYGMQlizUe3dBHJGeJ27fyMc2GPvTmQUB2fR1FDljGOCifTUgm44z
	 tODVfJsI9WuQ5oCQ1S/mdwWcfvfMNNaHEiYnNaps8KLZaGtfuR9Xjg2wUSON1ihOC1
	 qDjHDw8Jt0BWhP/UqDK3LVzv0+Cy99DGUte0fmFAja8ZXPpS+oNlfndpyWeqf3uBUo
	 7ppc6G/TeWG3A==
Date: Thu, 9 May 2024 18:14:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shengjiu.wang@gmail.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: fsl,xcvr: Add two PLL clock
 sources
Message-ID: <20240509-repurpose-dumping-156b57c25960@spud>
References: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
 <1715223460-32662-3-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9OB7iJL8uyGYmSbm"
Content-Disposition: inline
In-Reply-To: <1715223460-32662-3-git-send-email-shengjiu.wang@nxp.com>
Message-ID-Hash: 3HTHME76Y566YDI4WL4Y2QJB6O2HAIK5
X-Message-ID-Hash: 3HTHME76Y566YDI4WL4Y2QJB6O2HAIK5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3HTHME76Y566YDI4WL4Y2QJB6O2HAIK5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--9OB7iJL8uyGYmSbm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 10:57:38AM +0800, Shengjiu Wang wrote:
> Add two PLL clock sources, they are the parent clocks of the root clock
> one is for 8kHz series rates, named as 'pll8k', another one is for
> 11kHz series rates, named as 'pll11k'. They are optional clocks,
> if there are such clocks, then the driver can switch between them to
> support more accurate sample rates.
>=20
> As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
> clocks and clock-names properties.

Despite the detail given here in the commit message, the series this is
appearing in and one of the driver patches makes me a bit "suspicious"
of this patch. Are these newly added clocks available on all devices, or
just on the imx95, or?

Thanks,
Conor.

>=20
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,xcvr.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Docu=
mentation/devicetree/bindings/sound/fsl,xcvr.yaml
> index 1c74a32def09..c4660faed404 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> @@ -50,6 +50,9 @@ properties:
>        - description: PHY clock
>        - description: SPBA clock
>        - description: PLL clock
> +      - description: PLL clock source for 8kHz series
> +      - description: PLL clock source for 11kHz series
> +    minItems: 4
> =20
>    clock-names:
>      items:
> @@ -57,6 +60,9 @@ properties:
>        - const: phy
>        - const: spba
>        - const: pll_ipg
> +      - const: pll8k
> +      - const: pll11k
> +    minItems: 4
> =20
>    dmas:
>      items:
> --=20
> 2.34.1
>=20

--9OB7iJL8uyGYmSbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj0EeAAKCRB4tDGHoIJi
0kPzAP43Zn5AesCX1kKOSIjtrW5Vpt8hIHrIlOUZhE9kMqS8CgD+MljoXShCv6Tw
G/iLAeB3RppsSsV+7vuOr03Tr0FXKAw=
=oPv2
-----END PGP SIGNATURE-----

--9OB7iJL8uyGYmSbm--
