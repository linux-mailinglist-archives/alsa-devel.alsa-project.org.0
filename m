Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7400164B063
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 08:28:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0862717F7;
	Tue, 13 Dec 2022 08:27:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0862717F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670916495;
	bh=lYB8AqHkZfVN0cxOxBYwUyIcVxlp0EqUC2KOx5sBNGE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bCIejaNmIlKAU+rDfpUmX4H0DItxj78kjFlJGTmI5l7KLB/UFgy9o8QEBfkwZCXQX
	 kBLPSWRINI1O2idjY3BZJxz1til1KB0ghjPjoptSJh8sQEPI/RXb8i0ojvDUPrLaeY
	 XnF8hzSwT90MHKCdoyDwppSEGGo070tLgjwWZrk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DE33F803DD;
	Tue, 13 Dec 2022 08:27:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED616F8047D; Tue, 13 Dec 2022 08:27:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from out29-7.mail.aliyun.com (out29-7.mail.aliyun.com [115.124.29.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93809F80141
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 08:27:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93809F80141
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1133401|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.016597-0.000373216-0.98303;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047187; MF=wangweidong.a@awinic.com; NM=0;
 PH=DS; RN=16; RT=16; SR=0; TI=SMTPD_---.QUYqQ2e_1670916417; 
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QUYqQ2e_1670916417) by smtp.aliyun-inc.com;
 Tue, 13 Dec 2022 15:27:04 +0800
From: wangweidong.a@awinic.com
To: robh+dt@kernel.org
Subject: Re: [PATCH V6 5/5] ASoC: dt-bindings: Add schema for "awinic, aw883xx"
Date: Tue, 13 Dec 2022 15:26:56 +0800
Message-Id: <20221213072656.57312-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <CAL_JsqL8SScxB+TiML1joKKWQ_vZQ8+We+C-x84mYX0JsysSzA@mail.gmail.com>
References: <CAL_JsqL8SScxB+TiML1joKKWQ_vZQ8+We+C-x84mYX0JsysSzA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 wangweidong.a@awinic.com, tiwai@suse.com, duanyibo@awinic.com,
 zhaolei@awinic.com, liweilei@awinic.com, cy_huang@richtek.com,
 yijiangtao@awinic.com, broonie@kernel.org, zhangjianming@awinic.com,
 krzysztof.kozlowski+dt@linaro.org, quic_potturu@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Dec 8, 2022 at 6:28 AM <wangweidong.a@awinic.com> wrote:
>
> From: Weidong Wang <wangweidong.a@awinic.com>
>
> Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
> controlled using I2C.

> blank line

> Pretty sure I said this before, but resend to the DT list if you want
> this reviewed.

Thank you for your advice, but could you please tell me how to resend it to the DT list

> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  .../bindings/sound/awinic,aw883xx.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> new file mode 100644
> index 000000000000..b72c9177ebb7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> @@ -0,0 +1,49 @@
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

> I think this file has now been renamed upstream.

Thank you for your advice, but could you please describe why

Thanks again for your advice

best regards
Weidong Wang
