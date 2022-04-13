Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A5E4FF8D9
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Apr 2022 16:21:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 171AE17C6;
	Wed, 13 Apr 2022 16:20:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 171AE17C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649859676;
	bh=06jUexXEXIPcXuMnv6oN4HswWmYRPTr9ZYD3lGJiT4c=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oNe38uO4HrPnzfrmK86tUr3M7zgSqdi/aqBBzgij4VCDkC+putWsGwJLkqgZZ5yzD
	 CRJXdxkf3a0eg2jB+og65uv7Gl7DiNYeIMzonbYOCuGfIzIF44gwObZBVXcB8aM96l
	 xJdCRmx3yhVsH957oCf+IQZYvCWY+w/8x2y1ZKjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61EADF8028B;
	Wed, 13 Apr 2022 16:20:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09040F80248; Wed, 13 Apr 2022 16:20:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7657F80124
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 16:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7657F80124
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nedqK-00064F-1C; Wed, 13 Apr 2022 16:19:36 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nedqH-002nds-0d; Wed, 13 Apr 2022 16:19:31 +0200
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nedqE-000Bdk-Kr; Wed, 13 Apr 2022 16:19:30 +0200
Message-ID: <03af79f89d80d985ebf9adacb77af7c128248d27.camel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: Fix array constraints on scalar properties
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Date: Wed, 13 Apr 2022 16:19:30 +0200
In-Reply-To: <20220413140121.3132837-1-robh@kernel.org>
References: <20220413140121.3132837-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-iio@vger.kernel.org, Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-hwmon@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Agathe Porte <agathe.porte@nokia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>
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

On Mi, 2022-04-13 at 09:01 -0500, Rob Herring wrote:
> Scalar properties shouldn't have array constraints (minItems, maxItems,
> items). These constraints can simply be dropped with any constraints unde=
r
> 'items' moved up a level.
>
> Cc: Agathe Porte <agathe.porte@nokia.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Olivier Moysan <olivier.moysan@foss.st.com>
> Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: linux-hwmon@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: linux-spi@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> =C2=A0Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml       | 5 ++=
---
> =C2=A0.../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 +-=
--
> =C2=A0Documentation/devicetree/bindings/media/coda.yaml            | 1 -
> =C2=A0.../devicetree/bindings/media/mediatek,vcodec-decoder.yaml   | 2 --
> =C2=A0.../devicetree/bindings/media/mediatek,vcodec-encoder.yaml   | 2 --
> =C2=A0.../bindings/media/mediatek,vcodec-subdev-decoder.yaml       | 1 -
> =C2=A0.../devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml | 4 +-=
--
> =C2=A0Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml  | 2 --
> =C2=A08 files changed, 4 insertions(+), 17 deletions(-)
>=20
[...]
> diff --git a/Documentation/devicetree/bindings/media/coda.yaml b/Document=
ation/devicetree/bindings/media/coda.yaml
> index 36781ee4617f..c9d5adbc8c4a 100644
> --- a/Documentation/devicetree/bindings/media/coda.yaml
> +++ b/Documentation/devicetree/bindings/media/coda.yaml
> @@ -65,7 +65,6 @@ properties:
> =C2=A0=C2=A0=C2=A0iram:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0$ref: /schemas/types.yaml#/definitions/phan=
dle
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0description: phandle pointing to the SRAM d=
evice node
> -    maxItems: 1

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
