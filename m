Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9A84FFBDB
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Apr 2022 18:54:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7C4A1788;
	Wed, 13 Apr 2022 18:54:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7C4A1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649868895;
	bh=a+WQQED8ZlSK09ymixe8XBC6NNCTncyjwTDl3Y3G6Cw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pgCJ0A3xSYVqE0iHTpWV3WmhqedImPB6EfqxRaAPKzfyA1hOcEMZsVZ+TGX8ix0Qy
	 z+g3UBe18oKyd0684DE32U5iobqs+jQgu+sUpf60egC8AQAI2V3Tlesk1vgW7s0hrB
	 oomJMqc0nigLbhSPS10fq6lvFGz3FYfY7RtWfBTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E29DF8028B;
	Wed, 13 Apr 2022 18:53:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A31A8F80248; Wed, 13 Apr 2022 18:53:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1208F8011C
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 18:53:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1208F8011C
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KdpX609T6z67nHV;
 Thu, 14 Apr 2022 00:51:34 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Wed, 13 Apr 2022 18:53:46 +0200
Received: from localhost (10.81.205.148) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 13 Apr
 2022 17:53:44 +0100
Date: Wed, 13 Apr 2022 17:53:41 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix array constraints on scalar properties
Message-ID: <20220413175341.000030d9@Huawei.com>
In-Reply-To: <20220413140121.3132837-1-robh@kernel.org>
References: <20220413140121.3132837-1-robh@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.205.148]
X-ClientProxiedBy: lhreml743-chm.china.huawei.com (10.201.108.193) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, Geert
 Uytterhoeven <geert+renesas@glider.be>, linux-iio@vger.kernel.org,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Jean
 Delvare <jdelvare@suse.com>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-hwmon@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Agathe
 Porte <agathe.porte@nokia.com>, Philipp Zabel <p.zabel@pengutronix.de>,
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

On Wed, 13 Apr 2022 09:01:21 -0500
Rob Herring <robh@kernel.org> wrote:

> Scalar properties shouldn't have array constraints (minItems, maxItems,
> items). These constraints can simply be dropped with any constraints under
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
>  Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml       | 5 ++---
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 +---

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

>  Documentation/devicetree/bindings/media/coda.yaml            | 1 -
>  .../devicetree/bindings/media/mediatek,vcodec-decoder.yaml   | 2 --
>  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml   | 2 --
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml       | 1 -
>  .../devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml | 4 +---
>  Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml  | 2 --
>  8 files changed, 4 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
> index 801ca9ba7d34..e7493e25a7d2 100644
> --- a/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
> @@ -58,9 +58,8 @@ patternProperties:
>            The value (two's complement) to be programmed in the channel specific N correction register.
>            For remote channels only.
>          $ref: /schemas/types.yaml#/definitions/int32
> -        items:
> -          minimum: -128
> -          maximum: 127
> +        minimum: -128
> +        maximum: 127
>  
>      required:
>        - reg
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> index 7c260f209687..952bc900d0fa 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> @@ -108,9 +108,7 @@ patternProperties:
>            - [1-5]: order 1 to 5.
>            For audio purpose it is recommended to use order 3 to 5.
>          $ref: /schemas/types.yaml#/definitions/uint32
> -        items:
> -          minimum: 0
> -          maximum: 5
> +        maximum: 5
>  
>        "#io-channel-cells":
>          const: 1
> diff --git a/Documentation/devicetree/bindings/media/coda.yaml b/Documentation/devicetree/bindings/media/coda.yaml
> index 36781ee4617f..c9d5adbc8c4a 100644
> --- a/Documentation/devicetree/bindings/media/coda.yaml
> +++ b/Documentation/devicetree/bindings/media/coda.yaml
> @@ -65,7 +65,6 @@ properties:
>    iram:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: phandle pointing to the SRAM device node
> -    maxItems: 1
>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> index 9b179bb44dfb..aa55ca65d6ed 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> @@ -63,13 +63,11 @@ properties:
>  
>    mediatek,vpu:
>      $ref: /schemas/types.yaml#/definitions/phandle
> -    maxItems: 1
>      description:
>        Describes point to vpu.
>  
>    mediatek,scp:
>      $ref: /schemas/types.yaml#/definitions/phandle
> -    maxItems: 1
>      description:
>        Describes point to scp.
>  
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> index e7b65a91c92c..2746dea3ce79 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -55,13 +55,11 @@ properties:
>  
>    mediatek,vpu:
>      $ref: /schemas/types.yaml#/definitions/phandle
> -    maxItems: 1
>      description:
>        Describes point to vpu.
>  
>    mediatek,scp:
>      $ref: /schemas/types.yaml#/definitions/phandle
> -    maxItems: 1
>      description:
>        Describes point to scp.
>  
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index 7687be0f50aa..c73bf2352aca 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -61,7 +61,6 @@ properties:
>  
>    mediatek,scp:
>      $ref: /schemas/types.yaml#/definitions/phandle
> -    maxItems: 1
>      description: |
>        The node of system control processor (SCP), using
>        the remoteproc & rpmsg framework.
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
> index 2424de733ee4..d99a729d2710 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
> @@ -104,8 +104,7 @@ properties:
>    qcom,smem-state-names:
>      $ref: /schemas/types.yaml#/definitions/string
>      description: The names of the state bits used for SMP2P output
> -    items:
> -      - const: stop
> +    const: stop
>  
>    glink-edge:
>      type: object
> @@ -130,7 +129,6 @@ properties:
>        qcom,remote-pid:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          description: ID of the shared memory used by GLINK for communication with WPSS
> -        maxItems: 1
>  
>      required:
>        - interrupts
> diff --git a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
> index b104899205f6..5de710adfa63 100644
> --- a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
> +++ b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
> @@ -124,7 +124,6 @@ properties:
>      description: |
>        Override the default TX fifo size.  Unit is words.  Ignored if 0.
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    maxItems: 1
>      default: 64
>  
>    renesas,rx-fifo-size:
> @@ -132,7 +131,6 @@ properties:
>      description: |
>        Override the default RX fifo size.  Unit is words.  Ignored if 0.
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    maxItems: 1
>      default: 64
>  
>  required:

