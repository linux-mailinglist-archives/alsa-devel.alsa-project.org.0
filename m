Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C20062B1E0
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 04:39:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3064B82C;
	Wed, 16 Nov 2022 04:38:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3064B82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668569968;
	bh=OPiT4onmdV4m2kto0xHOp5f4lcXkwoJ4/THT9TAUizA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RGoeJ62luzVpfdDiYdlQoDb408BEs0Q1cfVd7sWrt+8PpjbCt5dhslzPDQb7oehrX
	 89swdUogaPmVu8n1jCJQoba91SBTNpyJPQN95FLJGnQdso2Zz8HfLkld8wjkKSUpOc
	 f6MB+IQ/EEFHHHJOrs3rzV+qD4YITdi17Murp0oI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0551F80238;
	Wed, 16 Nov 2022 04:38:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A6EEF80169; Wed, 16 Nov 2022 04:38:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS,URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled
 version=3.4.0
Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com
 [115.124.28.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E097F800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 04:38:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E097F800B8
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08146343|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00647618-0.000127971-0.993396;
 FP=14237481233704288666|1|1|9|0|-1|-1|-1; HT=ay29a033018047209;
 MF=wangweidong.a@awinic.com; NM=1; PH=DS; RN=18; RT=18; SR=0;
 TI=SMTPD_---.Q8P7XPd_1668569888; 
Received: from localhost.localdomain(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Q8P7XPd_1668569888) by smtp.aliyun-inc.com;
 Wed, 16 Nov 2022 11:38:18 +0800
From: wangweidong.a@awinic.com
To: krzysztof.kozlowski@linaro.org
Subject: Thanks to [PATCH V4 5/6] ASoC: dt-bindings: Add schema for "awinic,
 aw883xx"
Date: Wed, 16 Nov 2022 11:38:07 +0800
Message-Id: <20221116033807.4567-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <2e4224e8-fb03-7316-92df-c6654755aa9b@linaro.org>
References: <2e4224e8-fb03-7316-92df-c6654755aa9b@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: zhaolei@awinic.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, quic_potturu@quicinc.com,
 wangweidong.a@awinic.com, tiwai@suse.com, duanyibo@awinic.com,
 robh+dt@kernel.org, liweilei@awinic.com, cy_huang@richtek.com,
 yijiangtao@awinic.com, broonie@kernel.org, zhangjianming@awinic.com,
 krzysztof.kozlowski+dt@linaro.org
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

> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
> controlled using I2C.
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  .../bindings/sound/awinic,aw883xx.yaml        | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> new file mode 100644
> index 000000000000..04cdcf25a6d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/awinic,aw883xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Awinic AW883xx Smart Audio Amplifier
> +
> +maintainers:
> +  - Stephan Gerhold <stephan@gerhold.net>
> +
> +description:
> +  The Awinic AW883XX is an I2S/TDM input, high efficiency
> +  digital Smart K audio amplifier with an integrated 10.25V
> +  smart boost convert.
> +
> +allOf:
> +  - $ref: name-prefix.yaml#
> +
> +properties:
> +  compatible:
> +    const: awinic,aw883xx_smartpa
> +
> +  reg:
> +    description:
> +      The I2C address of the device for I2C

> What happened here? This was not present before. Drop description.

I will delete this description in patch v5

> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      Reset pin of aw883xx chip

> The same case. Drop description.

> I commented only for irq-gpios that they need description.

I will delete this description in patch v5

> +    maxItems: 1
> +
> +  sound-channel:
> +    description:
> +      Number of sound channels of the aw883xx chip

> Your description does not explain me much. Number of supported sound
> channels is usually fixed in the hardware, thus coming from compatible.
> Therefore this might mean something else... but anyway your driver does
> not use it really, so just drop it.

I will delete this property node in patch v5

Thank you very much for your advice

Best regards,
Weidong Wang
