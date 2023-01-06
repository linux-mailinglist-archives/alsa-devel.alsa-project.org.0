Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D54F65FDA6
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 10:21:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C4D0B20E;
	Fri,  6 Jan 2023 10:20:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C4D0B20E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672996905;
	bh=+NxdQKb80GnJRw8Y+BZBN9LyMhakpUpArnXaGQsw2gg=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gSr+/6BzSuuVcuuJs0B+Fqwc/yM9BevD/1cEknRzj3lUmSD9pzHDuH3Kz56iJUVFm
	 D3UQSlWfK4j0GrRclKeUnJxpaYHZ8X9RWMSjIr2xjN0dwU3Gz47VX+yDvV1iE3nj9y
	 B7hjA66bHsRRbopFEQAoFMyNs1P9IPk9EyelS9oE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9C9CF8057B;
	Fri,  6 Jan 2023 10:19:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFBD4F8057A; Fri,  6 Jan 2023 10:19:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BBBAF80579
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 10:19:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BBBAF80579
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pDisH-0007GO-F3; Fri, 06 Jan 2023 10:18:53 +0100
Message-ID: <5c2f0bba0a3a9d846cdfbcf7529759327d895810.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] ARM: dts: vfxxx: Swap SAI DMA order
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
 <robh+dt@kernel.org>
Date: Fri, 06 Jan 2023 10:18:49 +0100
In-Reply-To: <20230105144145.165010-2-marex@denx.de>
References: <20230105144145.165010-1-marex@denx.de>
 <20230105144145.165010-2-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
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
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>,
 Richard Zhu <hongxing.zhu@nxp.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, Alexander Stein <alexander.stein@ew.tq-group.com>,
 Adam Ford <aford173@gmail.com>, Richard Cochran <richardcochran@gmail.com>,
 Paul Elder <paul.elder@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Joakim Zhang <qiangqing.zhang@nxp.com>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Tim Harvey <tharvey@gateworks.com>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Am Donnerstag, dem 05.01.2023 um 15:41 +0100 schrieb Marek Vasut:
> Swap the SAI dmas and dma-names to match the order documented in
> Documentation/devicetree/bindings/sound/fsl,sai.yaml
> No functional change.
>=20
While I'm not opposing this patch, I find this class of changes a bit
odd. The *-names properties are there so the properties they are naming
can be in any order in the DT without impacting the lookup. Enforcing a
fixed order for named properties just feels odd.

Not sure if the schema validation could take this into account or if
there is any policy in place already by the DT maintainer that we still
want to enforce the same order in the DTs as in the bindings.

Regards,
Lucas

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Joakim Zhang <qiangqing.zhang@nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Paul Elder <paul.elder@ideasonboard.com>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: Richard Zhu <hongxing.zhu@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Tim Harvey <tharvey@gateworks.com>
> Cc: alsa-devel@alsa-project.org
> Cc: devicetree@vger.kernel.org
> To: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm/boot/dts/vfxxx.dtsi | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
> index d53f9c9db8bfd..ff4479994b600 100644
> --- a/arch/arm/boot/dts/vfxxx.dtsi
> +++ b/arch/arm/boot/dts/vfxxx.dtsi
> @@ -191,9 +191,8 @@ sai0: sai@4002f000 {
>  					<&clks VF610_CLK_SAI0_DIV>,
>  					<&clks 0>, <&clks 0>;
>  				clock-names =3D "bus", "mclk1", "mclk2", "mclk3";
> -				dma-names =3D "tx", "rx";
> -				dmas =3D <&edma0 0 17>,
> -					<&edma0 0 16>;
> +				dma-names =3D "rx", "tx";
> +				dmas =3D <&edma0 0 16>, <&edma0 0 17>;
>  				status =3D "disabled";
>  			};
> =20
> @@ -205,9 +204,8 @@ sai1: sai@40030000 {
>  					<&clks VF610_CLK_SAI1_DIV>,
>  					<&clks 0>, <&clks 0>;
>  				clock-names =3D "bus", "mclk1", "mclk2", "mclk3";
> -				dma-names =3D "tx", "rx";
> -				dmas =3D <&edma0 0 19>,
> -					<&edma0 0 18>;
> +				dma-names =3D "rx", "tx";
> +				dmas =3D <&edma0 0 18>, <&edma0 0 19>;
>  				status =3D "disabled";
>  			};
> =20
> @@ -219,9 +217,8 @@ sai2: sai@40031000 {
>  					<&clks VF610_CLK_SAI2_DIV>,
>  					<&clks 0>, <&clks 0>;
>  				clock-names =3D "bus", "mclk1", "mclk2", "mclk3";
> -				dma-names =3D "tx", "rx";
> -				dmas =3D <&edma0 0 21>,
> -					<&edma0 0 20>;
> +				dma-names =3D "rx", "tx";
> +				dmas =3D <&edma0 0 20>, <&edma0 0 21>;
>  				status =3D "disabled";
>  			};
> =20
> @@ -233,9 +230,8 @@ sai3: sai@40032000 {
>  					<&clks VF610_CLK_SAI3_DIV>,
>  					<&clks 0>, <&clks 0>;
>  				clock-names =3D "bus", "mclk1", "mclk2", "mclk3";
> -				dma-names =3D "tx", "rx";
> -				dmas =3D <&edma0 1 9>,
> -					<&edma0 1 8>;
> +				dma-names =3D "rx", "tx";
> +				dmas =3D <&edma0 1 8>, <&edma0 1 9>;
>  				status =3D "disabled";
>  			};
> =20

