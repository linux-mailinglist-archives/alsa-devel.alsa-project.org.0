Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7DF6297AC
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 12:43:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BCDC1638;
	Tue, 15 Nov 2022 12:42:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BCDC1638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668512602;
	bh=2jSII43gh2Sa5abJw6ieioeNmCQ9TdL7JmtDkMmLSyk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jDLThdNs+JuYOmo1Qe1aMe0tgaAywAtOe8kwJevZEBRkmHR80QLATZOWcGSl48xXc
	 kJNw2NIptaF2pBE3Ov7A7NbM1AZ6B2R3s6ghvuTHxingLMDLDXgm/mOyvl/GCFm8F+
	 rEDU1gcZv/6CtjBulHwCJOq0186SM3nn1RcKOGrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDDEFF80557;
	Tue, 15 Nov 2022 12:42:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17B5CF804DA; Tue, 15 Nov 2022 12:42:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out28-123.mail.aliyun.com (out28-123.mail.aliyun.com
 [115.124.28.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E3FFF80171
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 12:42:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E3FFF80171
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08365638|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00921753-0.00014771-0.990635;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.Q7t4PW4_1668512528; 
Received: from AEPW014EEK(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Q7t4PW4_1668512528) by smtp.aliyun-inc.com;
 Tue, 15 Nov 2022 19:42:13 +0800
From: <wangweidong.a@awinic.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>,
 <broonie@kernel.org>, <perex@perex.cz>, <alsa-devel@alsa-project.org>,
 <tiwai@suse.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <ckeepax@opensource.cirrus.com>,
 <tanureal@opensource.cirrus.com>, <quic_potturu@quicinc.com>,
 <pierre-louis.bossart@linux.intel.com>, <cy_huang@richtek.com>
Subject: Thanks to [PATCH V4 5/6] ASoC: dt-bindings: Add schema for "awinic,
 aw883xx"
Date: Tue, 15 Nov 2022 19:42:08 +0800
Message-ID: <000701d8f8e7$4e01bc20$ea053460$@awinic.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adj45qhxO4GD6WWMRjmSs2fEmpZDqA==
Content-Language: zh-cn
Cc: duanyibo@awinic.com, yijiangtao@awinic.com, zhangjianming@awinic.com,
 zhaolei@awinic.com, liweilei@awinic.com
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

Hi Krzysztof Kozlowski:

Thank you for your advice, I will change these questions

> Add a DT schema for describing Awinic AW883xx audio amplifiers. They=20
> are controlled using I2C.
>=20
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  .../bindings/sound/awinic,aw883xx.yaml        | 62 =
+++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644=20
> Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
>=20
> diff --git=20
> a/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml=20
> b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> new file mode 100644
> index 000000000000..04cdcf25a6d4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
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

> Your description does not explain me much. Number of supported sound =
channels is usually fixed in the hardware, thus coming from compatible.
> Therefore this might mean something else... but anyway your driver =
does not use it really, so just drop it.


I will delete this description in patch v5



