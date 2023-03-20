Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD146C1EB9
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 18:58:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AD341DF;
	Mon, 20 Mar 2023 18:57:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AD341DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679335126;
	bh=7IR/66YRnGI2mXnpiMpYOl4b/9Ys4I1kAfmZMSKsRIw=;
	h=To:References:In-Reply-To:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=NNMRATWhRgO9QmGOJPagD38xpF1/pEA7bpaH+5hJSJ9ogP2CSZt0361RDfEdcHaO0
	 JGBKB/uSYxRYJZFuoHLSubHJq9Sjt0VgHTSvkgoTSD2euE6o3cNdsjg3Kec78d5mqI
	 /vNkwLbIiexp1qFojfyiwTE9F3Sw9L24OquCuv2w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECB6EF80544;
	Mon, 20 Mar 2023 18:57:02 +0100 (CET)
To: 'Amit Kumar Mahapatra' <amit.kumar-mahapatra@amd.com>,
        <broonie@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
        <pratyush@kernel.org>, <Sanju.Mehta@amd.com>,
        <chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>,
 <kdasu.kdev@gmail.com>,
        <f.fainelli@gmail.com>, <rjui@broadcom.com>, <sbranden@broadcom.com>,
        <eajames@linux.ibm.com>, <olteanv@gmail.com>, <han.xu@nxp.com>,
        <john.garry@huawei.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <narmstrong@baylibre.com>,
        <khilman@baylibre.com>, <matthias.bgg@gmail.com>,
 <haibo.chen@nxp.com>,
        <linus.walleij@linaro.org>, <daniel@zonque.org>,
        <haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>,
        <agross@kernel.org>, <bjorn.andersson@linaro.org>, <heiko@sntech.de>,
        <krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
        <masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
        <rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <alex.aring@gmail.com>,
        <stefan@datenfreihafen.org>, <kvalo@kernel.org>,
        <james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
        <tanureal@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <npiggin@gmail.com>,
        <christophe.leroy@csgroup.eu>, <mpe@ellerman.id.au>,
        <oss@buserror.net>, <windhl@126.com>, <yangyingliang@huawei.com>,
        <william.zhang@broadcom.com>, <kursad.oney@broadcom.com>,
        <jonas.gorski@gmail.com>, <anand.gore@broadcom.com>,
        <rafal@milecki.pl>
References: <20230310173217.3429788-1-amit.kumar-mahapatra@amd.com>
 <20230310173217.3429788-10-amit.kumar-mahapatra@amd.com>
In-Reply-To: <20230310173217.3429788-10-amit.kumar-mahapatra@amd.com>
Subject: RE: [PATCH V6 09/15] spi: Add stacked and parallel memories support
 in SPI core
Date: Mon, 13 Mar 2023 17:15:24 +0000
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
X-Mailman-Approved-At: Mon, 20 Mar 2023 17:56:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SM2YA7UAE74KMR4H56HDBKSBHN3QQLW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167933502244.26.17961995129436653161@mailman-core.alsa-project.org>
From: Stefan Binding via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com,
 fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org,
 alim.akhtar@samsung.com, ldewangan@nvidia.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, michal.simek@amd.com, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
 linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org,
 lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org,
 michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linuxppc-dev@lists.ozlabs.org, amitrkcian2002@gmail.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DC56F80423; Mon, 13 Mar 2023 18:16:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B136F8016C
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 18:15:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B136F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=piE2nikk
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DH4lP4006582;
	Mon, 13 Mar 2023 12:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 references : in-reply-to : subject : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=8fBHeyw5bQP/z7k6Vn/utUOab2TmzpDhKUvzbkOF3/0=;
 b=piE2nikkI1yWqF2z8FACr8QXUEETBafumy6JGyAvhmhazu0+U4LwK0G20kUP+qCENoyI
 ofpAKD9L4c8+WP4wfL7j3t0fVKgQZ7Lx9ZzfH4GRsNyUfJ2pQ/TWMphEUBjOTZbhFBh8
 ODmK5zhSDvEdOVSog2k17T4/VOAzJU0Su5we7yd2DYlMiYv5Xb3Z7RLRD0fCCL0Shrqm
 XE6pBlXLmYRbgY6zKMSju8OPFBvzcWeB7RWJfa55kJQlpLqWS0UZPq7THDV6vYKWC60L
 pkmtPXOAuaFmKqpHtjutE+a55p+QNjwUYHej2XkwiFh9eCr9LPEBOZI51IdPiSAXk1Er zA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3p8qx7b7bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 12:15:31 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 13 Mar
 2023 12:15:27 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 13 Mar 2023 12:15:27 -0500
Received: from LONN2DGDQ73 (unknown [198.90.238.129])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E067FB06;
	Mon, 13 Mar 2023 17:15:24 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: 'Amit Kumar Mahapatra' <amit.kumar-mahapatra@amd.com>,
        <broonie@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <jic23@kernel.org>, <tudor.ambarus@microchip.com>,
        <pratyush@kernel.org>, <Sanju.Mehta@amd.com>,
        <chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>,
 <kdasu.kdev@gmail.com>,
        <f.fainelli@gmail.com>, <rjui@broadcom.com>, <sbranden@broadcom.com>,
        <eajames@linux.ibm.com>, <olteanv@gmail.com>, <han.xu@nxp.com>,
        <john.garry@huawei.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <narmstrong@baylibre.com>,
        <khilman@baylibre.com>, <matthias.bgg@gmail.com>,
 <haibo.chen@nxp.com>,
        <linus.walleij@linaro.org>, <daniel@zonque.org>,
        <haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>,
        <agross@kernel.org>, <bjorn.andersson@linaro.org>, <heiko@sntech.de>,
        <krzysztof.kozlowski@linaro.org>, <andi@etezian.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <wens@csie.org>, <jernej.skrabec@gmail.com>, <samuel@sholland.org>,
        <masahisa.kojima@linaro.org>, <jaswinder.singh@linaro.org>,
        <rostedt@goodmis.org>, <mingo@redhat.com>, <l.stelmach@samsung.com>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <alex.aring@gmail.com>,
        <stefan@datenfreihafen.org>, <kvalo@kernel.org>,
        <james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
        <tanureal@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
        <perex@perex.cz>, <tiwai@suse.com>, <npiggin@gmail.com>,
        <christophe.leroy@csgroup.eu>, <mpe@ellerman.id.au>,
        <oss@buserror.net>, <windhl@126.com>, <yangyingliang@huawei.com>,
        <william.zhang@broadcom.com>, <kursad.oney@broadcom.com>,
        <jonas.gorski@gmail.com>, <anand.gore@broadcom.com>,
        <rafal@milecki.pl>
References: <20230310173217.3429788-1-amit.kumar-mahapatra@amd.com>
 <20230310173217.3429788-10-amit.kumar-mahapatra@amd.com>
In-Reply-To: <20230310173217.3429788-10-amit.kumar-mahapatra@amd.com>
Subject: RE: [PATCH V6 09/15] spi: Add stacked and parallel memories support
 in SPI core
Date: Mon, 13 Mar 2023 17:15:24 +0000
Message-ID: <000001d955cf$67e96300$37bc2900$@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQDIpqAVbrqiWV0KFJ1wbuwYQjJiLAJ1loHLsQakKTA=
Content-Language: en-gb
X-Proofpoint-ORIG-GUID: zk1wcvJDSQoA0mc8PGvJisX66LsL_MKC
X-Proofpoint-GUID: zk1wcvJDSQoA0mc8PGvJisX66LsL_MKC
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=8436d688f0=sbinding@opensource.cirrus.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 6SM2YA7UAE74KMR4H56HDBKSBHN3QQLW
X-Message-ID-Hash: 6SM2YA7UAE74KMR4H56HDBKSBHN3QQLW
X-Mailman-Approved-At: Mon, 20 Mar 2023 17:56:58 +0000
CC: git@amd.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 joel@jms.id.au, andrew@aj.id.au, radu_nicolae.pirea@upb.ro,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, bcm-kernel-feedback-list@broadcom.com,
 fancer.lancer@gmail.com, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 yogeshgaur.83@gmail.com, konrad.dybcio@somainline.org,
 alim.akhtar@samsung.com, ldewangan@nvidia.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, michal.simek@amd.com, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
 linux-wpan@vger.kernel.org, libertas-dev@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-mtd@lists.infradead.org,
 lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org,
 michael@walle.cc, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linuxppc-dev@lists.ozlabs.org, amitrkcian2002@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SM2YA7UAE74KMR4H56HDBKSBHN3QQLW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I tested this patch on an existing laptop which uses SPI with a GPIO
Chipselect,
(HP EliteBook 860 G9), and I get the error:

[    2.671655] pxa2xx-spi pxa2xx-spi.2: chipselect 1 already in use
[    2.671711] spi_master spi0: error -EBUSY: failed to add SPI device
CSC3551:00 from ACPI
[    2.690903] Serial bus multi instantiate pseudo device driver:
probe of CSC3551:00 failed with error -16

Please don't merge this until we have fully investigated.

Thanks,
Stefan Binding

> -----Original Message-----
> From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> Sent: 10 March 2023 17:32
> To: broonie@kernel.org; miquel.raynal@bootlin.com; richard@nod.at;
> vigneshr@ti.com; jic23@kernel.org; tudor.ambarus@microchip.com;
> pratyush@kernel.org; Sanju.Mehta@amd.com; chin-
> ting_kuo@aspeedtech.com; clg@kaod.org; kdasu.kdev@gmail.com;
> f.fainelli@gmail.com; rjui@broadcom.com; sbranden@broadcom.com;
> eajames@linux.ibm.com; olteanv@gmail.com; han.xu@nxp.com;
> john.garry@huawei.com; shawnguo@kernel.org;
> s.hauer@pengutronix.de; narmstrong@baylibre.com;
> khilman@baylibre.com; matthias.bgg@gmail.com;
> haibo.chen@nxp.com; linus.walleij@linaro.org; daniel@zonque.org;
> haojian.zhuang@gmail.com; robert.jarzmik@free.fr;
> agross@kernel.org; bjorn.andersson@linaro.org; heiko@sntech.de;
> krzysztof.kozlowski@linaro.org; andi@etezian.org;
> mcoquelin.stm32@gmail.com; alexandre.torgue@foss.st.com;
> wens@csie.org; jernej.skrabec@gmail.com; samuel@sholland.org;
> masahisa.kojima@linaro.org; jaswinder.singh@linaro.org;
> rostedt@goodmis.org; mingo@redhat.com;
> l.stelmach@samsung.com; davem@davemloft.net;
> edumazet@google.com; kuba@kernel.org; pabeni@redhat.com;
> alex.aring@gmail.com; stefan@datenfreihafen.org; kvalo@kernel.org;
> james.schulman@cirrus.com; david.rhodes@cirrus.com;
> tanureal@opensource.cirrus.com; rf@opensource.cirrus.com;
> perex@perex.cz; tiwai@suse.com; npiggin@gmail.com;
> christophe.leroy@csgroup.eu; mpe@ellerman.id.au;
> oss@buserror.net; windhl@126.com; yangyingliang@huawei.com;
> william.zhang@broadcom.com; kursad.oney@broadcom.com;
> jonas.gorski@gmail.com; anand.gore@broadcom.com;
> rafal@milecki.pl
> Cc: git@amd.com; linux-spi@vger.kernel.org; linux-
> kernel@vger.kernel.org; joel@jms.id.au; andrew@aj.id.au;
> radu_nicolae.pirea@upb.ro; nicolas.ferre@microchip.com;
> alexandre.belloni@bootlin.com; claudiu.beznea@microchip.com; bcm-
> kernel-feedback-list@broadcom.com; fancer.lancer@gmail.com;
> kernel@pengutronix.de; festevam@gmail.com; linux-imx@nxp.com;
> jbrunet@baylibre.com; martin.blumenstingl@googlemail.com;
> avifishman70@gmail.com; tmaimon77@gmail.com;
> tali.perry1@gmail.com; venture@google.com; yuenn@google.com;
> benjaminfair@google.com; yogeshgaur.83@gmail.com;
> konrad.dybcio@somainline.org; alim.akhtar@samsung.com;
> ldewangan@nvidia.com; thierry.reding@gmail.com;
> jonathanh@nvidia.com; michal.simek@amd.com; linux-
> aspeed@lists.ozlabs.org; openbmc@lists.ozlabs.org; linux-arm-
> kernel@lists.infradead.org; linux-rpi-kernel@lists.infradead.org;
linux-
> amlogic@lists.infradead.org; linux-mediatek@lists.infradead.org;
linux-
> arm-msm@vger.kernel.org; linux-rockchip@lists.infradead.org; linux-
> samsung-soc@vger.kernel.org; linux-stm32@st-md-
> mailman.stormreply.com; linux-sunxi@lists.linux.dev; linux-
> tegra@vger.kernel.org; netdev@vger.kernel.org; linux-
> wpan@vger.kernel.org; libertas-dev@lists.infradead.org; linux-
> wireless@vger.kernel.org; linux-mtd@lists.infradead.org;
> lars@metafoo.de; Michael.Hennerich@analog.com; linux-
> iio@vger.kernel.org; michael@walle.cc; palmer@dabbelt.com; linux-
> riscv@lists.infradead.org; alsa-devel@alsa-project.org;
> patches@opensource.cirrus.com; linuxppc-dev@lists.ozlabs.org;
> amitrkcian2002@gmail.com; amit.kumar-mahapatra@amd.com
> Subject: [PATCH V6 09/15] spi: Add stacked and parallel memories
> support in SPI core
> 
> For supporting multiple CS the SPI device need to be aware of all
the
> CS
> values. So, the "chip_select" member in the spi_device structure is
> now an
> array that holds all the CS values.
> 
> spi_device structure now has a "cs_index_mask" member. This acts as
> an
> index to the chip_select array. If nth bit of spi->cs_index_mask is
set
> then the driver would assert spi->chip_select[n].
> 
> In parallel mode all the chip selects are asserted/de-asserted
> simultaneously and each byte of data is stored in both devices, the
> even
> bits in one, the odd bits in the other. The split is automatically
handled
> by the GQSPI controller. The GQSPI controller supports a maximum of
> two
> flashes connected in parallel mode. A "multi-cs-cap" flag is added
in
> the
> spi controntroller data, through ctlr->multi-cs-cap the spi core
will
> make
> sure that the controller is capable of handling multiple chip
selects at
> once.
> 
> For supporting multiple CS via GPIO the cs_gpiod member of the
> spi_device
> structure is now an array that holds the gpio descriptor for each
> chipselect.
> 
> Multi CS support using GPIO is not tested due to unavailability of
> necessary hardware setup.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-
> mahapatra@amd.com>
> ---
>  drivers/spi/spi.c       | 225
+++++++++++++++++++++++++++------------
> -
>  include/linux/spi/spi.h |  34 ++++--
>  2 files changed, 182 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> index c725b4bab7af..742bd688381c 100644
> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -612,10 +612,17 @@ static int spi_dev_check(struct device *dev,
> void *data)
>  {
>  	struct spi_device *spi = to_spi_device(dev);
>  	struct spi_device *new_spi = data;
> -
> -	if (spi->controller == new_spi->controller &&
> -	    spi_get_chipselect(spi, 0) == spi_get_chipselect(new_spi,
0))
> -		return -EBUSY;
> +	int idx, nw_idx;
> +
> +	if (spi->controller == new_spi->controller) {
> +		for (idx = 0; idx < SPI_CS_CNT_MAX; idx++) {
> +			for (nw_idx = 0; nw_idx < SPI_CS_CNT_MAX;
> nw_idx++) {
> +				if (spi_get_chipselect(spi, idx) ==
> +				    spi_get_chipselect(new_spi,
> nw_idx))
> +					return -EBUSY;
> +			}
> +		}
> +	}
>  	return 0;
>  }
> 
> @@ -629,7 +636,7 @@ static int __spi_add_device(struct spi_device
> *spi)
>  {
>  	struct spi_controller *ctlr = spi->controller;
>  	struct device *dev = ctlr->dev.parent;
> -	int status;
> +	int status, idx;
> 
>  	/*
>  	 * We need to make sure there's no other device with this
> @@ -638,8 +645,7 @@ static int __spi_add_device(struct spi_device
> *spi)
>  	 */
>  	status = bus_for_each_dev(&spi_bus_type, NULL, spi,
> spi_dev_check);
>  	if (status) {
> -		dev_err(dev, "chipselect %d already in use\n",
> -				spi_get_chipselect(spi, 0));
> +		dev_err(dev, "chipselect %d already in use\n",
> spi_get_chipselect(spi, 0));
>  		return status;
>  	}
> 
> @@ -649,8 +655,10 @@ static int __spi_add_device(struct spi_device
> *spi)
>  		return -ENODEV;
>  	}
> 
> -	if (ctlr->cs_gpiods)
> -		spi_set_csgpiod(spi, 0, ctlr-
> >cs_gpiods[spi_get_chipselect(spi, 0)]);
> +	if (ctlr->cs_gpiods) {
> +		for (idx = 0; idx < SPI_CS_CNT_MAX; idx++)
> +			spi_set_csgpiod(spi, idx, ctlr-
> >cs_gpiods[spi_get_chipselect(spi, idx)]);
> +	}
> 
>  	/*
>  	 * Drivers may modify this initial i/o setup, but will
> @@ -690,13 +698,15 @@ int spi_add_device(struct spi_device *spi)
>  {
>  	struct spi_controller *ctlr = spi->controller;
>  	struct device *dev = ctlr->dev.parent;
> -	int status;
> +	int status, idx;
> 
> -	/* Chipselects are numbered 0..max; validate. */
> -	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
> -		dev_err(dev, "cs%d >= max %d\n",
> spi_get_chipselect(spi, 0),
> -			ctlr->num_chipselect);
> -		return -EINVAL;
> +	for (idx = 0; idx < SPI_CS_CNT_MAX; idx++) {
> +		/* Chipselects are numbered 0..max; validate. */
> +		if (spi_get_chipselect(spi, idx) >= ctlr-
> >num_chipselect) {
> +			dev_err(dev, "cs%d >= max %d\n",
> spi_get_chipselect(spi, idx),
> +				ctlr->num_chipselect);
> +			return -EINVAL;
> +		}
>  	}
> 
>  	/* Set the bus ID string */
> @@ -713,12 +723,15 @@ static int spi_add_device_locked(struct
> spi_device *spi)
>  {
>  	struct spi_controller *ctlr = spi->controller;
>  	struct device *dev = ctlr->dev.parent;
> +	int idx;
> 
> -	/* Chipselects are numbered 0..max; validate. */
> -	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
> -		dev_err(dev, "cs%d >= max %d\n",
> spi_get_chipselect(spi, 0),
> -			ctlr->num_chipselect);
> -		return -EINVAL;
> +	for (idx = 0; idx < SPI_CS_CNT_MAX; idx++) {
> +		/* Chipselects are numbered 0..max; validate. */
> +		if (spi_get_chipselect(spi, idx) >= ctlr-
> >num_chipselect) {
> +			dev_err(dev, "cs%d >= max %d\n",
> spi_get_chipselect(spi, idx),
> +				ctlr->num_chipselect);
> +			return -EINVAL;
> +		}
>  	}
> 
>  	/* Set the bus ID string */
> @@ -966,58 +979,119 @@ static void spi_res_release(struct
> spi_controller *ctlr, struct spi_message *mes
>  static void spi_set_cs(struct spi_device *spi, bool enable, bool
force)
>  {
>  	bool activate = enable;
> +	u32 cs_num = __ffs(spi->cs_index_mask);
> +	int idx;
> 
>  	/*
> -	 * Avoid calling into the driver (or doing delays) if the chip
> select
> -	 * isn't actually changing from the last time this was called.
> +	 * In parallel mode all the chip selects are
asserted/de-asserted
> +	 * at once
>  	 */
> -	if (!force && ((enable && spi->controller->last_cs ==
> spi_get_chipselect(spi, 0)) ||
> -		       (!enable && spi->controller->last_cs !=
> spi_get_chipselect(spi, 0))) &&
> -	    (spi->controller->last_cs_mode_high == (spi->mode &
> SPI_CS_HIGH)))
> -		return;
> -
> -	trace_spi_set_cs(spi, activate);
> -
> -	spi->controller->last_cs = enable ? spi_get_chipselect(spi, 0)
: -
> 1;
> -	spi->controller->last_cs_mode_high = spi->mode &
> SPI_CS_HIGH;
> -
> -	if ((spi_get_csgpiod(spi, 0) ||
!spi->controller->set_cs_timing)
> && !activate)
> -		spi_delay_exec(&spi->cs_hold, NULL);
> -
> -	if (spi->mode & SPI_CS_HIGH)
> -		enable = !enable;
> +	if ((spi->cs_index_mask & SPI_PARALLEL_CS_MASK) ==
> SPI_PARALLEL_CS_MASK) {
> +		spi->controller->last_cs_mode_high = spi->mode &
> SPI_CS_HIGH;
> +
> +		if ((spi_get_csgpiod(spi, 0) || !spi->controller-
> >set_cs_timing) && !activate)
> +			spi_delay_exec(&spi->cs_hold, NULL);
> +
> +		if (spi->mode & SPI_CS_HIGH)
> +			enable = !enable;
> +
> +		if (spi_get_csgpiod(spi, 0) && spi_get_csgpiod(spi,
1)) {
> +			if (!(spi->mode & SPI_NO_CS)) {
> +				/*
> +				 * Historically ACPI has no means of
the
> GPIO polarity and
> +				 * thus the SPISerialBus() resource
> defines it on the per-chip
> +				 * basis. In order to avoid a chain of
> negations, the GPIO
> +				 * polarity is considered being Active
> High. Even for the cases
> +				 * when _DSD() is involved (in the
> updated versions of ACPI)
> +				 * the GPIO CS polarity must be
> defined Active High to avoid
> +				 * ambiguity. That's why we use
> enable, that takes SPI_CS_HIGH
> +				 * into account.
> +				 */
> +				if (has_acpi_companion(&spi->dev)) {
> +					for (idx = 0; idx <
> SPI_CS_CNT_MAX; idx++)
> +
> 	gpiod_set_value_cansleep(spi_get_csgpiod(spi, idx),
> +
> !enable);
> +				} else {
> +					for (idx = 0; idx <
> SPI_CS_CNT_MAX; idx++)
> +						/* Polarity handled by
> GPIO library */
> +
> 	gpiod_set_value_cansleep(spi_get_csgpiod(spi, idx),
> +
> activate);
> +				}
> +			}
> +			/* Some SPI masters need both GPIO CS &
> slave_select */
> +			if ((spi->controller->flags &
> SPI_MASTER_GPIO_SS) &&
> +			    spi->controller->set_cs)
> +				spi->controller->set_cs(spi, !enable);
> +			else if (spi->controller->set_cs)
> +				spi->controller->set_cs(spi, !enable);
> +		}
> 
> -	if (spi_get_csgpiod(spi, 0)) {
> -		if (!(spi->mode & SPI_NO_CS)) {
> -			/*
> -			 * Historically ACPI has no means of the GPIO
> polarity and
> -			 * thus the SPISerialBus() resource defines it
on
> the per-chip
> -			 * basis. In order to avoid a chain of
negations,
> the GPIO
> -			 * polarity is considered being Active High.
Even
> for the cases
> -			 * when _DSD() is involved (in the updated
> versions of ACPI)
> -			 * the GPIO CS polarity must be defined Active
> High to avoid
> -			 * ambiguity. That's why we use enable, that
> takes SPI_CS_HIGH
> -			 * into account.
> -			 */
> -			if (has_acpi_companion(&spi->dev))
> -
> 	gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), !enable);
> -			else
> -				/* Polarity handled by GPIO library */
> -
> 	gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), activate);
> +		for (idx = 0; idx < SPI_CS_CNT_MAX; idx++) {
> +			if (spi_get_csgpiod(spi, idx) ||
!spi->controller-
> >set_cs_timing) {
> +				if (activate)
> +					spi_delay_exec(&spi-
> >cs_setup, NULL);
> +				else
> +					spi_delay_exec(&spi-
> >cs_inactive, NULL);
> +			}
>  		}
> -		/* Some SPI masters need both GPIO CS &
> slave_select */
> -		if ((spi->controller->flags & SPI_MASTER_GPIO_SS) &&
> -		    spi->controller->set_cs)
> +	} else {
> +		/*
> +		 * Avoid calling into the driver (or doing delays) if
the
> chip select
> +		 * isn't actually changing from the last time this was
> called.
> +		 */
> +		if (!force && ((enable && spi->controller->last_cs ==
> +				spi_get_chipselect(spi, cs_num)) ||
> +				(!enable && spi->controller->last_cs
!=
> +				 spi_get_chipselect(spi, cs_num))) &&
> +		    (spi->controller->last_cs_mode_high ==
> +		     (spi->mode & SPI_CS_HIGH)))
> +			return;
> +
> +		trace_spi_set_cs(spi, activate);
> +
> +		spi->controller->last_cs = enable ?
> spi_get_chipselect(spi, cs_num) : -1;
> +		spi->controller->last_cs_mode_high = spi->mode &
> SPI_CS_HIGH;
> +
> +		if ((spi_get_csgpiod(spi, cs_num) || !spi->controller-
> >set_cs_timing) && !activate)
> +			spi_delay_exec(&spi->cs_hold, NULL);
> +
> +		if (spi->mode & SPI_CS_HIGH)
> +			enable = !enable;
> +
> +		if (spi_get_csgpiod(spi, cs_num)) {
> +			if (!(spi->mode & SPI_NO_CS)) {
> +				/*
> +				 * Historically ACPI has no means of
the
> GPIO polarity and
> +				 * thus the SPISerialBus() resource
> defines it on the per-chip
> +				 * basis. In order to avoid a chain of
> negations, the GPIO
> +				 * polarity is considered being Active
> High. Even for the cases
> +				 * when _DSD() is involved (in the
> updated versions of ACPI)
> +				 * the GPIO CS polarity must be
> defined Active High to avoid
> +				 * ambiguity. That's why we use
> enable, that takes SPI_CS_HIGH
> +				 * into account.
> +				 */
> +				if (has_acpi_companion(&spi->dev))
> +
> 	gpiod_set_value_cansleep(spi_get_csgpiod(spi, cs_num),
> +
> !enable);
> +				else
> +					/* Polarity handled by GPIO
> library */
> +
> 	gpiod_set_value_cansleep(spi_get_csgpiod(spi, cs_num),
> +
> activate);
> +			}
> +			/* Some SPI masters need both GPIO CS &
> slave_select */
> +			if ((spi->controller->flags &
> SPI_MASTER_GPIO_SS) &&
> +			    spi->controller->set_cs)
> +				spi->controller->set_cs(spi, !enable);
> +		} else if (spi->controller->set_cs) {
>  			spi->controller->set_cs(spi, !enable);
> -	} else if (spi->controller->set_cs) {
> -		spi->controller->set_cs(spi, !enable);
> -	}
> +		}
> 
> -	if (spi_get_csgpiod(spi, 0) ||
!spi->controller->set_cs_timing) {
> -		if (activate)
> -			spi_delay_exec(&spi->cs_setup, NULL);
> -		else
> -			spi_delay_exec(&spi->cs_inactive, NULL);
> +		if (spi_get_csgpiod(spi, cs_num) || !spi->controller-
> >set_cs_timing) {
> +			if (activate)
> +				spi_delay_exec(&spi->cs_setup,
> NULL);
> +			else
> +				spi_delay_exec(&spi->cs_inactive,
> NULL);
> +		}
>  	}
>  }
> 
> @@ -2246,8 +2320,8 @@ static void of_spi_parse_dt_cs_delay(struct
> device_node *nc,
>  static int of_spi_parse_dt(struct spi_controller *ctlr, struct
spi_device
> *spi,
>  			   struct device_node *nc)
>  {
> -	u32 value;
> -	int rc;
> +	u32 value, cs[SPI_CS_CNT_MAX] = {0};
> +	int rc, idx;
> 
>  	/* Mode (clock phase/polarity/etc.) */
>  	if (of_property_read_bool(nc, "spi-cpha"))
> @@ -2320,13 +2394,21 @@ static int of_spi_parse_dt(struct
> spi_controller *ctlr, struct spi_device *spi,
>  	}
> 
>  	/* Device address */
> -	rc = of_property_read_u32(nc, "reg", &value);
> -	if (rc) {
> +	rc = of_property_read_variable_u32_array(nc, "reg", &cs[0], 1,
> +						 SPI_CS_CNT_MAX);
> +	if (rc < 0 || rc > ctlr->num_chipselect) {
>  		dev_err(&ctlr->dev, "%pOF has no valid 'reg' property
> (%d)\n",
>  			nc, rc);
>  		return rc;
> +	} else if ((of_property_read_bool(nc, "parallel-memories"))
> &&
> +		   (!ctlr->multi_cs_cap)) {
> +		dev_err(&ctlr->dev, "SPI controller doesn't support
> multi CS\n");
> +		return -EINVAL;
>  	}
> -	spi_set_chipselect(spi, 0, value);
> +	for (idx = 0; idx < rc; idx++)
> +		spi_set_chipselect(spi, idx, cs[idx]);
> +	/* By default set the spi->cs_index_mask as 1 */
> +	spi->cs_index_mask = 0x01;
> 
>  	/* Device speed */
>  	if (!of_property_read_u32(nc, "spi-max-frequency", &value))
> @@ -3846,6 +3928,7 @@ static int __spi_validate(struct spi_device
> *spi, struct spi_message *message)
>  	struct spi_controller *ctlr = spi->controller;
>  	struct spi_transfer *xfer;
>  	int w_size;
> +	u32 cs_num = __ffs(spi->cs_index_mask);
> 
>  	if (list_empty(&message->transfers))
>  		return -EINVAL;
> @@ -3858,7 +3941,7 @@ static int __spi_validate(struct spi_device
> *spi, struct spi_message *message)
>  	 * cs_change is set for each transfer.
>  	 */
>  	if ((spi->mode & SPI_CS_WORD) && (!(ctlr->mode_bits &
> SPI_CS_WORD) ||
> -					  spi_get_csgpiod(spi, 0))) {
> +					  spi_get_csgpiod(spi,
> cs_num))) {
>  		size_t maxsize;
>  		int ret;
> 
> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
> index bdb35a91b4bf..452682aa1a39 100644
> --- a/include/linux/spi/spi.h
> +++ b/include/linux/spi/spi.h
> @@ -19,6 +19,11 @@
>  #include <linux/acpi.h>
>  #include <linux/u64_stats_sync.h>
> 
> +/* Max no. of CS supported per spi device */
> +#define SPI_CS_CNT_MAX 2
> +
> +/* chip select mask */
> +#define SPI_PARALLEL_CS_MASK	(BIT(0) | BIT(1))
>  struct dma_chan;
>  struct software_node;
>  struct ptp_system_timestamp;
> @@ -166,6 +171,7 @@ extern void
> spi_transfer_cs_change_delay_exec(struct spi_message *msg,
>   *	deasserted. If @cs_change_delay is used from @spi_transfer,
> then the
>   *	two delays will be added up.
>   * @pcpu_statistics: statistics for the spi_device
> + * @cs_index_mask: Bit mask of the active chipselect(s) in the
> chipselect array
>   *
>   * A @spi_device is used to interchange data between an SPI slave
>   * (usually a discrete chip) and CPU memory.
> @@ -181,7 +187,7 @@ struct spi_device {
>  	struct spi_controller	*controller;
>  	struct spi_controller	*master;	/* Compatibility layer
> */
>  	u32			max_speed_hz;
> -	u8			chip_select;
> +	u8			chip_select[SPI_CS_CNT_MAX];
>  	u8			bits_per_word;
>  	bool			rt;
>  #define SPI_NO_TX	BIT(31)		/* No transmit wire */
> @@ -202,7 +208,7 @@ struct spi_device {
>  	void			*controller_data;
>  	char			modalias[SPI_NAME_SIZE];
>  	const char		*driver_override;
> -	struct gpio_desc	*cs_gpiod;	/* Chip select gpio
desc
> */
> +	struct gpio_desc	*cs_gpiod[SPI_CS_CNT_MAX];	/*
Chip
> select gpio desc */
>  	struct spi_delay	word_delay; /* Inter-word delay */
>  	/* CS delays */
>  	struct spi_delay	cs_setup;
> @@ -212,6 +218,13 @@ struct spi_device {
>  	/* The statistics */
>  	struct spi_statistics __percpu	*pcpu_statistics;
> 
> +	/* Bit mask of the chipselect(s) that the driver need to use
> from
> +	 * the chipselect array.When the controller is capable to
handle
> +	 * multiple chip selects & memories are connected in parallel
> +	 * then more than one bit need to be set in cs_index_mask.
> +	 */
> +	u32			cs_index_mask : 2;
> +
>  	/*
>  	 * likely need more hooks for more protocol options affecting
> how
>  	 * the controller talks to each chip, like:
> @@ -268,22 +281,22 @@ static inline void *spi_get_drvdata(struct
> spi_device *spi)
> 
>  static inline u8 spi_get_chipselect(struct spi_device *spi, u8 idx)
>  {
> -	return spi->chip_select;
> +	return spi->chip_select[idx];
>  }
> 
>  static inline void spi_set_chipselect(struct spi_device *spi, u8
idx, u8
> chipselect)
>  {
> -	spi->chip_select = chipselect;
> +	spi->chip_select[idx] = chipselect;
>  }
> 
>  static inline struct gpio_desc *spi_get_csgpiod(struct spi_device
*spi,
> u8 idx)
>  {
> -	return spi->cs_gpiod;
> +	return spi->cs_gpiod[idx];
>  }
> 
>  static inline void spi_set_csgpiod(struct spi_device *spi, u8 idx,
struct
> gpio_desc *csgpiod)
>  {
> -	spi->cs_gpiod = csgpiod;
> +	spi->cs_gpiod[idx] = csgpiod;
>  }
> 
>  /**
> @@ -388,6 +401,8 @@ extern struct spi_device
> *spi_new_ancillary_device(struct spi_device *spi, u8 ch
>   * @bus_lock_spinlock: spinlock for SPI bus locking
>   * @bus_lock_mutex: mutex for exclusion of multiple callers
>   * @bus_lock_flag: indicates that the SPI bus is locked for
exclusive
> use
> + * @multi_cs_cap: indicates that the SPI Controller can assert/de-
> assert
> + *	more than one chip select at once.
>   * @setup: updates the device mode and clocking records used by a
>   *	device's SPI controller; protocol code may call this.  This
>   *	must fail if an unrecognized or unsupported mode is
> requested.
> @@ -585,6 +600,13 @@ struct spi_controller {
>  	/* Flag indicating that the SPI bus is locked for exclusive
use */
>  	bool			bus_lock_flag;
> 
> +	/*
> +	 * Flag indicating that the spi-controller has multi chip
select
> +	 * capability and can assert/de-assert more than one chip
> select
> +	 * at once.
> +	 */
> +	bool			multi_cs_cap;
> +
>  	/* Setup mode and clock, etc (spi driver may call many times).
>  	 *
>  	 * IMPORTANT:  this may be called when transfers to another
> --
> 2.25.1


