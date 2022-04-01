Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 826BD4EF41E
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 17:29:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19FF1185B;
	Fri,  1 Apr 2022 17:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19FF1185B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648826973;
	bh=0+Qy6DqL3DzylnNPp1BpGcwg8sHoEzTpg9tt+67cetk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BwaBpd5p/KCgddWpYT7wWb7uI9W0WT0OEGoI3idUOb+Ee0ZQwvImPDyg9Au6F2VyF
	 LLtRvM0fjATjm9f+ydh8dmFDeupRpFUsGJVJmIoueLfxTOD3o01xlgFJpcYCar+5vo
	 1VKOHwCiGZi9Uj4+9CNShicvrD4HAPdBTaqbxLjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 738D7F801D8;
	Fri,  1 Apr 2022 17:28:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6C3EF80279; Fri,  1 Apr 2022 17:28:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36492F80100
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 17:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36492F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="oaadmmE9"
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id CD6A51F47CE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648826893;
 bh=0+Qy6DqL3DzylnNPp1BpGcwg8sHoEzTpg9tt+67cetk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oaadmmE9l2jBobRHcuF+5apmP/oV1M+yQTgaQXh/490G5z2SvOZp7QLQgtzJgg9LJ
 kSSRoR/nvZ9CwLp45EzhG+gsEx3koHVUSuHt1JW59/t+bmT8pXUVS2QmnY9xmsUTpC
 X1WV89JttUN6+Th3tQeeGyVC1YwWsXUAEy4E+P0Xan4XfKtfPr4ZtwGN333euh6WrD
 N3loL42J+dcFCtia8Qc/ofLuqb3G3buKPaL9WdfbuFavNDoIIMZDK0K3IoFi0LcBXI
 AskMmI0jNnVIhTdrzAIT7CJxNibpnxmJUqkKLyDRo57zBD7XpsP3QwbD56h1ddTp85
 QH8WLFv/Q71Kg==
Received: by mercury (Postfix, from userid 1000)
 id 2CCD61060582; Fri,  1 Apr 2022 17:28:11 +0200 (CEST)
Date: Fri, 1 Apr 2022 17:28:11 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix 'enum' lists with duplicate entries
Message-ID: <20220401152811.uv3wm55byrmk4gqc@mercury.elektranox.org>
References: <20220401141247.2993925-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gjfd7i3tbgmmz62e"
Content-Disposition: inline
In-Reply-To: <20220401141247.2993925-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-pm@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, - <patches@opensource.cirrus.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
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


--gjfd7i3tbgmmz62e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 01, 2022 at 09:12:47AM -0500, Rob Herring wrote:
> There's no reason to list the same value twice in an 'enum'. Fix all the
> occurrences in the tree. A meta-schema change will catch future ones.
>=20
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> Cc: - <patches@opensource.cirrus.com>
> Cc: linux-media@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> There's also one other occurrence in snps,dwmac.yaml I didn't fix as=20
> there's a patch[1] for it which prompted this patch.
>=20
> Rob
>=20
> [1] https://lore.kernel.org/r/20220401030847epcms1p8cf7a8e1d8cd7d325dacf3=
0f78da36328@epcms1p8
>=20
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml        |  1 -
>  Documentation/devicetree/bindings/bus/ti-sysc.yaml    |  1 -
>  .../bindings/media/mediatek,vcodec-encoder.yaml       |  1 -
>  .../devicetree/bindings/pinctrl/cirrus,madera.yaml    | 11 +++++------
>  .../devicetree/bindings/power/supply/bq2415x.yaml     |  1 -
>  5 files changed, 5 insertions(+), 10 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-p=
mc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.ya=
ml
> index 0afec83cc723..564ae6aaccf7 100644
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> @@ -13,7 +13,6 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> -      - nvidia,tegra20-pmc
>        - nvidia,tegra20-pmc
>        - nvidia,tegra30-pmc
>        - nvidia,tegra114-pmc
> diff --git a/Documentation/devicetree/bindings/bus/ti-sysc.yaml b/Documen=
tation/devicetree/bindings/bus/ti-sysc.yaml
> index bd40213302da..fced4082b047 100644
> --- a/Documentation/devicetree/bindings/bus/ti-sysc.yaml
> +++ b/Documentation/devicetree/bindings/bus/ti-sysc.yaml
> @@ -34,7 +34,6 @@ properties:
>      oneOf:
>        - items:
>            - enum:
> -              - ti,sysc-omap2
>                - ti,sysc-omap2
>                - ti,sysc-omap4
>                - ti,sysc-omap4-simple
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-enco=
der.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.=
yaml
> index e7b65a91c92c..df7df06c378f 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -106,7 +106,6 @@ allOf:
>            enum:
>              - mediatek,mt8173-vcodec-enc
>              - mediatek,mt8192-vcodec-enc
> -            - mediatek,mt8173-vcodec-enc
> =20
>      then:
>        properties:
> diff --git a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml=
 b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
> index 8a90d8273767..6bd42e43cdab 100644
> --- a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
> @@ -48,13 +48,12 @@ properties:
>                Name of one pin group to configure.
>              enum: [ aif1, aif2, aif3, aif4, mif1, mif2, mif3, pdmspk1,
>                      pdmspk2, dmic4, dmic5, dmic6, gpio1, gpio2, gpio3,
> -                    gpio4, gpio5, gpio6, gpio7, gpio7, gpio8, gpio9,
> +                    gpio4, gpio5, gpio6, gpio7, gpio8, gpio9,
>                      gpio10, gpio11, gpio12, gpio13, gpio14, gpio15,
> -                    gpio16, gpio17, gpio17, gpio18, gpio19, gpio20,
> -                    gpio21, gpio22, gpio23, gpio24, gpio25, gpio26,
> -                    gpio27, gpio27, gpio28, gpio29, gpio30, gpio31,
> -                    gpio32, gpio33, gpio34, gpio35, gpio36, gpio37,
> -                    gpio37, gpio38, gpio39 ]
> +                    gpio16, gpio17, gpio18, gpio19, gpio20, gpio21,
> +                    gpio22, gpio23, gpio24, gpio25, gpio26, gpio27,
> +                    gpio28, gpio29, gpio30, gpio31, gpio32, gpio33,
> +                    gpio34, gpio35, gpio36, gpio37, gpio38, gpio39 ]
> =20
>            function:
>              description:
> diff --git a/Documentation/devicetree/bindings/power/supply/bq2415x.yaml =
b/Documentation/devicetree/bindings/power/supply/bq2415x.yaml
> index f8461f06e6f4..118cf484cc69 100644
> --- a/Documentation/devicetree/bindings/power/supply/bq2415x.yaml
> +++ b/Documentation/devicetree/bindings/power/supply/bq2415x.yaml
> @@ -16,7 +16,6 @@ allOf:
>  properties:
>    compatible:
>      enum:
> -      - ti,bq24150
>        - ti,bq24150
>        - ti,bq24150a
>        - ti,bq24151
> --=20
> 2.32.0
>=20

--gjfd7i3tbgmmz62e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmJHGggACgkQ2O7X88g7
+po2uA/+OS0hkCudE7TWE85KDv5+/Qb+6/JFLz20iy0f8rQr3U1VOufXZccdMBmV
lPY7v8Tzl+P3F2tHUdy1A6MSRvSrfxGQi32YeaSR/jNylRY7Lpmm73psjokmXsX/
FZZMXB7SvHvSLPqIdfKfs9sxuWjeZqw/YsYTDXHvubTSX5LkDuxx1p9KYYoTtZ5y
jDDUYqCdc1j8+z6u302ErkzZLLxowhYXlfy5I0D3I9VlVA42X6+gVT6j108fgLMw
ARg8mB8LrTwigl+qpW4E91pH0IOwwVbyIoUAJOUEQlj2qsAxfxAvNOaAbT5KbRZS
Tj+4TqPQYM+srE8e4dqKCQHB5GQFqHlgFa4r4ATqaqCddL04Zvl1MhaVqoXIuGL/
NH28aDPnRib2ZR7JkbAQ77NyLnBFtfEbJ7EU58YeTkD+QWJ41Xj9OzH4oEDdurCx
ggml7FuQj4LaC4uy4cR2MDyHlsrg2wS24+R9rFeXc47HchTboXS14r+a5fOLetpp
BydxRULRfek5NWLZZGaWLzZZmWwGgG3/hNeNFXDPazkECoHC6HtfpNGX5XAuR3dx
/PUycmAYpb2KfL3gVZksITrrAZ2qc3tGJgn//rsmCHcouG1w5Kf9NlvRsCzCUAAY
gbTebdGk0p0ilzuOB4jo1QTy5xJgR6pUMzCWXigh4jkRzJU2pYI=
=3CSB
-----END PGP SIGNATURE-----

--gjfd7i3tbgmmz62e--
