Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 070086C2169
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 20:30:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8632E741;
	Mon, 20 Mar 2023 20:29:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8632E741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679340628;
	bh=eHLRAiSOvkaAtF6dttRA8mtBcE/ByEmhZRYX3LaKfkQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dYbWv+8L4c3NfQcUNWnaC9JIRDXS7JDALZkND7fI7yqV3VbKN859fr19+Ou8PsSiS
	 HtlOC879FSpt3/wyCXfQAERqZzlSLENZ+N4rvf2xzRtgQrZPC+oKdkZZQYesbu9Bxo
	 khBqHz5ht7v3FncODcVa7dJudNymTLxkkhJSjDO8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0288F8052D;
	Mon, 20 Mar 2023 20:28:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51A49F80423; Sat, 18 Mar 2023 08:59:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06DF7F80272
	for <alsa-devel@alsa-project.org>; Sat, 18 Mar 2023 08:59:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06DF7F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MIo4Fysq
Received: by mail-ed1-x52d.google.com with SMTP id x3so28528288edb.10
        for <alsa-devel@alsa-project.org>;
 Sat, 18 Mar 2023 00:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679126348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GezqDX/ePqvpjZIuKIvbpmkWxRTWWY79otLLtVmi4uI=;
        b=MIo4FysqEObPhPrO5ovWEj/Y+fjZ+JHzDeLwvK2p1XLlCl43vYotPoQU5pTbqrDxfO
         cRK5WXQ9/E6U9BOSrRCKrVesqIQxIokI8jXR4Pie7uaeBDSBqAznP6Q64if4WSxEJ2/Q
         uaVGKBSsK5sOOnPS9sxtLbC2d64pZEN5w6OdRlSecJd620C0phrsybcJEqvTR1GIeGXH
         jrvrrIxlcw8pcjROtkJdwn3pzJYizNDhLUUSwmK3KPW2B3ro+jym3U4lB+XNUqHSJAyJ
         jrjd4OKlrIikF7TcfJa3H13regSRB3FGldUrSL21tPAIM7UO29D1CGM30oEb9xKHwwoV
         S1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679126348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GezqDX/ePqvpjZIuKIvbpmkWxRTWWY79otLLtVmi4uI=;
        b=pu/2dzG92SPFBvtKRLOVYT2KcVbjAX9p8noJw4BCOkdmlUX1/N2RbEYdDO685O/kaH
         ihkqfumFFEzoVf/HFp23CLMQRG/s21uwP8iccjGyix1AmAGABndX5H7iZwXStY3WYu2y
         AGD4W9NiAiG9SbnNf+ANftfWwp5Zu6XSsD5StM0m5lKAs8pGbNBvK3CcpgshAJEtVOo3
         GsnMDCOSZGdpi3oM66LEubTojimZVwaid73weYpuBKSVx4j3Ab/s79Y/+2MOlLHSGT+L
         nt4gOz95FaGbOJtMj3RDhoWaOawmR1s5ahlJRQHnnLUVmwENwSOBCqyaYX8Q9uGQSQ+A
         PRpg==
X-Gm-Message-State: AO0yUKXo7oNUcBT+zQDONS2v0B0ZRxBzxBb4cRG5FM9H2f8ysRZ7YBIP
	IXZ7IWglNpdHUzGbyaIASoU=
X-Google-Smtp-Source: 
 AK7set9nT9qNsfgktXgC9t9HagqTbjcAEspAFTOqh7EcN3bos4Xtz1AewsGVVMnDSG+mVDFOgXgh3g==
X-Received: by 2002:a17:907:20e3:b0:926:8992:4310 with SMTP id
 rh3-20020a17090720e300b0092689924310mr2058754ejb.38.1679126348548;
        Sat, 18 Mar 2023 00:59:08 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id
 i6-20020a170906250600b009306be6bed7sm1842624ejb.190.2023.03.18.00.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 00:59:08 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Damien Le Moal <damien.lemoal@wdc.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
Date: Sat, 18 Mar 2023 08:59:04 +0100
Message-ID: <1846135.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
References: <20230317233623.3968172-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-MailFrom: jernej.skrabec@gmail.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: CDISRGJXYPKPAZLF4YAGVBMAX7U3KLAK
X-Message-ID-Hash: CDISRGJXYPKPAZLF4YAGVBMAX7U3KLAK
X-Mailman-Approved-At: Mon, 20 Mar 2023 19:28:22 +0000
CC: linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CDISRGJXYPKPAZLF4YAGVBMAX7U3KLAK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dne sobota, 18. marec 2023 ob 00:36:18 CET je Rob Herring napisal(a):
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/pinctrl/actions,s500-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml  |  2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  .../devicetree/bindings/pinctrl/apple,pinctrl.yaml     |  2 +-
>  .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml       |  4 ++--
>  .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml       |  4 ++--
>  .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml       |  6 +++---
>  .../bindings/pinctrl/brcm,bcm6318-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/brcm,bcm63268-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/brcm,bcm6328-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/brcm,bcm6358-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/brcm,bcm6362-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/brcm,bcm6368-pinctrl.yaml         |  2 +-
>  .../devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml    |  2 +-
>  .../devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml |  2 +-
>  .../devicetree/bindings/pinctrl/cirrus,lochnagar.yaml  |  2 +-
>  .../devicetree/bindings/pinctrl/cirrus,madera.yaml     |  4 ++--
>  .../devicetree/bindings/pinctrl/cypress,cy8c95x0.yaml  |  2 +-
>  .../devicetree/bindings/pinctrl/fsl,imx7d-pinctrl.yaml |  2 +-
>  .../devicetree/bindings/pinctrl/fsl,imx8m-pinctrl.yaml |  2 +-
>  .../bindings/pinctrl/fsl,imx8ulp-pinctrl.yaml          |  2 +-
>  .../devicetree/bindings/pinctrl/fsl,imx93-pinctrl.yaml |  2 +-
>  .../devicetree/bindings/pinctrl/ingenic,pinctrl.yaml   |  2 +-
>  .../devicetree/bindings/pinctrl/intel,lgm-io.yaml      |  2 +-
>  .../bindings/pinctrl/marvell,ac5-pinctrl.yaml          |  4 ++--
>  .../bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml      |  4 ++--
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml      |  4 ++--
>  .../bindings/pinctrl/mediatek,mt7622-pinctrl.yaml      |  6 +++---
>  .../bindings/pinctrl/mediatek,mt7986-pinctrl.yaml      |  6 +++---
>  .../bindings/pinctrl/mediatek,mt8183-pinctrl.yaml      |  4 ++--
>  .../bindings/pinctrl/mediatek,mt8188-pinctrl.yaml      |  2 +-
>  .../bindings/pinctrl/mediatek,pinctrl-mt6795.yaml      |  4 ++--
>  .../bindings/pinctrl/mscc,ocelot-pinctrl.yaml          |  6 +++---
>  .../devicetree/bindings/pinctrl/pinctrl-mt8186.yaml    |  2 +-
>  .../devicetree/bindings/pinctrl/pinctrl-mt8192.yaml    |  4 ++--
>  .../devicetree/bindings/pinctrl/pinctrl-mt8195.yaml    |  4 ++--
>  .../devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml    |  4 ++--
>  .../devicetree/bindings/pinctrl/qcom,pmic-mpp.yaml     |  4 ++--
>  .../pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml         |  2 +-
>  .../pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml         |  2 +-
>  .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml  |  2 +-
>  .../bindings/pinctrl/ralink,mt7620-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/ralink,mt7621-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/ralink,rt2880-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/ralink,rt305x-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/ralink,rt3883-pinctrl.yaml        |  2 +-
>  .../devicetree/bindings/pinctrl/renesas,pfc.yaml       |  2 +-
>  .../bindings/pinctrl/renesas,rza1-ports.yaml           |  2 +-
>  .../bindings/pinctrl/renesas,rza2-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/renesas,rzn1-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/renesas,rzv2m-pinctrl.yaml        |  2 +-
>  .../devicetree/bindings/pinctrl/rockchip,pinctrl.yaml  | 10 +++++-----
>  .../devicetree/bindings/pinctrl/samsung,pinctrl.yaml   |  2 +-
>  .../devicetree/bindings/pinctrl/semtech,sx1501q.yaml   |  6 +++---
>  .../bindings/pinctrl/socionext,uniphier-pinctrl.yaml   |  2 +-
>  .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml  | 10 +++++-----
>  .../bindings/pinctrl/starfive,jh7100-pinctrl.yaml      |  6 +++---
>  .../bindings/pinctrl/sunplus,sp7021-pinctrl.yaml       |  6 +++---
>  .../bindings/pinctrl/toshiba,visconti-pinctrl.yaml     |  8 ++++----
>  .../devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml |  2 +-
>  60 files changed, 97 insertions(+), 97 deletions(-)



