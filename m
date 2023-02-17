Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A7A69BDF0
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Feb 2023 00:28:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D577DF0F;
	Sun, 19 Feb 2023 00:28:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D577DF0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676762934;
	bh=XzA+HUh410081Cjfy9F+DFjPlovam52jVT0jhn8Y4IA=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uh9Kc9k3Y1B4ViAp1vLJh8MzZpql3JIJh2wV6bXBdwVpST9JHaaYoaSBw0WGFUc3U
	 dzMp58lzw4kEZOzEi0Ccp/sgl89Ye+3b75rBLa9KJXbLklcC45xpUc6Mt59phMPSlK
	 su4yZmqWf+o/F73fHyPX6Qcas3dw64Q3YHJpgYD4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C48B0F80496;
	Sun, 19 Feb 2023 00:27:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E83CF80171; Fri, 17 Feb 2023 22:48:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02olkn2080e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::80e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CB79F80083
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 22:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CB79F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=fYtnqeEY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIcXh7fj30Lg2oasEGrd0VEV9/hIXUpS2kTIGpGFovvOQQe73PVhd8qVEcdt49TI+xudSN30M/CK2kU1l7pl9lnkBsll2Uq/g6hHnSGfa3vaF4hGEhHmAkmzNCBNgyjPVu76lE2LHLgtlBGAIfeVJbOFHn6g3AO/qQzoIqLNdO8NrIAloxej023MGi0mQ9KW+HnsRFJOBJjBT8dqXnDbFZCOprzjncdWxwhRS/3c9rirQoHDgOZvxKV7g18ZeljLaPGfUXs44q1EdesaUlx+UGeqtl2c3eTK9daOktM8mqtPcffMEhTWsDGApTHhIlEZK7m/JqYp4+pK7uMgGqMPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcCt0RNdQ+QgQUBydQYz6qHD68bospGPw02oPff/cNA=;
 b=gr855oexN+QDGlr09KL5yvKReytzqlM8Tn62uGyR8vkKhYncP5Np6XZuP+mLUGnqR7BsgnvcIXJQHhWMBhCNNQVFckPjFUikwEBDEO0NHULTEcLnSKBqNkSOZFDL8EKr1lrvQIoqOecc9FeRIy/BOqzQ/ShYbsoot3dN/9TyccZZRYnMV+I/oHgMqS6u4R+e5ExtZSuyUx3TP0VCVtM4meTOj0GzkP6P6H0Rm+4RCEUzNEMtw2heGIZTzbDoeLZ/GmOc0NWaPDhlqh4rjJv8iFU/VLRamebRTlxfbA268F0XrAFVUEAxam8jfSFMK/hvD/5RIroBmnrHEopTvO83Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcCt0RNdQ+QgQUBydQYz6qHD68bospGPw02oPff/cNA=;
 b=fYtnqeEYco65mZd3FQI7S+CVAnOfZxmcd7Ndc4gGpwljKZc+4ofxBOakq8lSlxE4cBGT1T0iHiAztiiThAn1XZpTkGRPf1rMUoKLLtXuQHMQvgA4vOOIVqfnfAIbO11wzMCSLkRZCAnUa4m2kyG6zY9lDVuoF7QmaaX/BiQkHyYxiYFZwyW9AqG2tgDH4ug0g/eqjjyA7nlrfhQG5GOR0YQALqSfuKyqfowohzUrikZEn4tj13UwANEu/XSqmJYKCiHdRyQnEDgd9z1UTC3OvCsLDA8YO8957YjHCcojWYs4OH4+3y/l8I7PSrZtJ9ygkzumd4XPn9OPT28eeRMrZg==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by SJ0PR17MB5576.namprd17.prod.outlook.com (2603:10b6:a03:389::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Fri, 17 Feb
 2023 21:48:02 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::7cfd:d28f:fec7:beff%4]) with mapi id 15.20.6086.024; Fri, 17 Feb 2023
 21:48:02 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: Mark Brown <broonie@kernel.org>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v4 01/15] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Thread-Topic: [PATCH v4 01/15] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Thread-Index: AQHZPYeQkHeD5G7xAkKb48PQ8b+JNq7QFekAgAOiB+E=
Date: Fri, 17 Feb 2023 21:48:02 +0000
Message-ID: 
 <MN2PR17MB337562A2EA2B0622F2943893B8A19@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <20230210193647.4159467-1-amit.kumar-mahapatra@amd.com>
 <20230210193647.4159467-2-amit.kumar-mahapatra@amd.com>
 <Y+zp5F2l8pffEEvN@sirena.org.uk>
In-Reply-To: <Y+zp5F2l8pffEEvN@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [9kVqeb50chAWbUIzN7Hz6lJ2MWVQZ78y]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|SJ0PR17MB5576:EE_
x-ms-office365-filtering-correlation-id: bb91410f-6944-4c43-2e59-08db1130a4f9
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bY164nOCuWrKM7rLyh37ubHZfd6aU9/XOmq+XCCZwt4ynDgWAuO7Bwf95u/hOQVhZvZuNACyY2IgFwP3vi6SjJlLzSFeN+zCkLnrtG4l9lsu65SSclMG6i/5WdLYglaeFNy/WAX/hCU0Be97dPbZIOletdqN2y5mEwXz6XrUJZiUCMbA0N6ETfU/Mfn9VbXl9eqd/jQOcPtjooZBUrrm/O+7/xzEAKZQZMShFavjlsZTRWcnxhoWt/fyVjbD3aAsZrqg2BTtHdfLqHAO4HBTFylmxE/irkWuP7p8wi0dvrgKg0c+qOPdli56OsmdxgT6J9JCX2Lev97TP4K5s1ZkPJzGF3dANZ6ePsPG/b3r8jdGjxgz+NtNAXVhjJ705bWb5bOEPlSap9A0I8QPhESpx5YQ4EgIQYB3l44Oq4SLWjW3bxU2Bk38OuqbmiR3yZEFQz7uycodVL23nrFq+yx39fSC9azqkhUJAEsuwFmsUqy0DtG7LNSe1xWjecRaseqb06F6w2MVq41iAdCSJk9+oah8Ed4RY1qepdmNKYzMiVDfax504C8Oea6ZNa/FmyGUoG6ThKnHtcPwU4S0buzu5qKfeKMa+4FYdcQaxAOeaqaY7mlejk8YzsnSbrcARJeww9SpwNN14P6jEbGBWb3W0w==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Sm/TJo6hzC9xuYp3Il9O/mEdu+ZARkq/jxCZ9QwzkwMWSnxpgGB2edk3iU?=
 =?iso-8859-1?Q?RHmr+x2us4ahjCEkts/0CdSBIpyad5zKvRHi+yETMw8g4GsCY+HCG4eEs5?=
 =?iso-8859-1?Q?3MNjoS/nKRZSpiGfdEOFSFbbkkNIGFcg19OO3HJw/b6XWgv3AhepN6POt+?=
 =?iso-8859-1?Q?z1BYfuUnyL8W3oQbcz9k8ioUth1TH+pfR/+ETBE1JJdKSijG5EkdZEsYSq?=
 =?iso-8859-1?Q?cCrTQ4G5Fgy9fgU13Ki/beZ9bFqK/hDyeElxmsIc0P1jFYJUqp4nuW0hBM?=
 =?iso-8859-1?Q?qA0H4v9wmoa9rvV/XXKSN/arAv16X2WpGIVukMSjL1po7vKI8B6Gtx0Aef?=
 =?iso-8859-1?Q?JRiCtcuAOCAr2fUkmcBRST5kkSbOJX6He4APZ5+WuJZG5GXzcowNN6/79G?=
 =?iso-8859-1?Q?4qg/y/bSCIoGeC52R/wm6pcScZ/2L6+s+HQGr3aI862HJWbejATGR221hU?=
 =?iso-8859-1?Q?0/C6iNb2T2G99f6cX0+llCpaJ2aQbRjeTXqGvvBEe+dc8+TKM7NmbkyzP+?=
 =?iso-8859-1?Q?hhOfeRicai8K3fSthxgx738isWBbMzwy4fgT+f5LHNeze1ySRp46JO5UJa?=
 =?iso-8859-1?Q?LqcLcPq7mdcFPgtDjKWXAhL5wUXZ9woLZRflUiCFXHjGVQUiz6HzbEki3v?=
 =?iso-8859-1?Q?7hyTq3pVTaAyvxdylO6Q/As+cOAv1WYHUYrpfesSor7IJoLAhlcGhlgCUR?=
 =?iso-8859-1?Q?kLA8inscINbYYwhU6lpZFbZW29X9DDcRjofvjBEHkjNag9XOQK+/wG9438?=
 =?iso-8859-1?Q?/yYVSH5vERfvo+iFLM6yx2wD8ylGiI7quBSKVk8SEpkRCCDmfNIaUerDYi?=
 =?iso-8859-1?Q?quHecCLmiR/hxxhak2GZqlMWuNmbchLU6UAz7Joe1SBeDrnsNpoS3ezy9u?=
 =?iso-8859-1?Q?eY8a6H7OJLhDYgS0DQBq5S4LffAl7eths9mM20vzGAFbiA3TF6sDIRHtPL?=
 =?iso-8859-1?Q?1OzsKL5aQ5h45nOcPMEX/3jbmsGTEoQWp9b7FQbspb4O1dysTpxFuGOj4q?=
 =?iso-8859-1?Q?g0C7w5cfMevNhoDDEe20g0bmWFxcgkJgslECG9Ke6/NOcg5mz4YD1BivEf?=
 =?iso-8859-1?Q?fpk2ee9jevRd803bvzX/192bS2IgVUcraZiRyFsxzsChy7docZfZaKZ1wt?=
 =?iso-8859-1?Q?osuX26PgMVHvR2rbEtnm7XLO5VhVRUCkcUwenwkfeT41GrA0VNRvpk+Sbx?=
 =?iso-8859-1?Q?zz7wwscAUjJDzn6R4ZmcBgP2V2QVAYSGHTJ+xeOxRebMBRGxjrqVUGYki7?=
 =?iso-8859-1?Q?/eQoDOLb6TNAq4PQQi9MkNZ3mWvwKd38Kvix2EA0v3nFzYkoLF7HE4g9Qu?=
 =?iso-8859-1?Q?xqvd?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bb91410f-6944-4c43-2e59-08db1130a4f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2023 21:48:02.6797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 
 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR17MB5576
X-MailFrom: Vebpe@outlook.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: Q6VIGEE3DX77QBV4BGZ2PSB5V3MLM2V4
X-Message-ID-Hash: Q6VIGEE3DX77QBV4BGZ2PSB5V3MLM2V4
X-Mailman-Approved-At: Sat, 18 Feb 2023 23:26:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "jic23@kernel.org" <jic23@kernel.org>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "pratyush@kernel.org" <pratyush@kernel.org>,
 "sanju.mehta@amd.com" <sanju.mehta@amd.com>,
 "chin-ting_kuo@aspeedtech.com" <chin-ting_kuo@aspeedtech.com>,
 "clg@kaod.org" <clg@kaod.org>, "kdasu.kdev@gmail.com" <kdasu.kdev@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "rjui@broadcom.com" <rjui@broadcom.com>,
 "sbranden@broadcom.com" <sbranden@broadcom.com>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "olteanv@gmail.com" <olteanv@gmail.com>, "han.xu@nxp.com" <han.xu@nxp.com>,
 "john.garry@huawei.com" <john.garry@huawei.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "khilman@baylibre.com" <khilman@baylibre.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "haibo.chen@nxp.com" <haibo.chen@nxp.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "daniel@zonque.org" <daniel@zonque.org>,
 "haojian.zhuang@gmail.com" <haojian.zhuang@gmail.com>,
 "robert.jarzmik@free.fr" <robert.jarzmik@free.fr>,
 "agross@kernel.org" <agross@kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "andi@etezian.org" <andi@etezian.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "wens@csie.org" <wens@csie.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "samuel@sholland.org" <samuel@sholland.org>,
 "masahisa.kojima@linaro.org" <masahisa.kojima@linaro.org>,
 "jaswinder.singh@linaro.org" <jaswinder.singh@linaro.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "mingo@redhat.com" <mingo@redhat.com>,
 "l.stelmach@samsung.com" <l.stelmach@samsung.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "alex.aring@gmail.com" <alex.aring@gmail.com>,
 "stefan@datenfreihafen.org" <stefan@datenfreihafen.org>,
 "kvalo@kernel.org" <kvalo@kernel.org>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "david.rhodes@cirrus.com" <david.rhodes@cirrus.com>,
 "tanureal@opensource.cirrus.com" <tanureal@opensource.cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "npiggin@gmail.com" <npiggin@gmail.com>,
 "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "oss@buserror.net" <oss@buserror.net>, "windhl@126.com" <windhl@126.com>,
 "yangyingliang@huawei.com" <yangyingliang@huawei.com>,
 "git@amd.com" <git@amd.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "radu_nicolae.pirea@upb.ro" <radu_nicolae.pirea@upb.ro>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "claudiu.beznea@microchip.com" <claudiu.beznea@microchip.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "fancer.lancer@gmail.com" <fancer.lancer@gmail.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "yuenn@google.com" <yuenn@google.com>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "yogeshgaur.83@gmail.com" <yogeshgaur.83@gmail.com>,
 "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "ldewangan@nvidia.com" <ldewangan@nvidia.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rpi-kernel@lists.infradead.org"
 <linux-rpi-kernel@lists.infradead.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-wpan@vger.kernel.org" <linux-wpan@vger.kernel.org>,
 "libertas-dev@lists.infradead.org" <libertas-dev@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "Michael.Hennerich@analog.com" <Michael.Hennerich@analog.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "michael@walle.cc" <michael@walle.cc>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "amitrkcian2002@gmail.com" <amitrkcian2002@gmail.com>,
 Dhruva Gole <d-gole@ti.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
 William Zhang <william.zhang@broadcom.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2KQVMPOYLY6TZWGVMEJWRPVFP23F6ZAD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The police came to my house you dumb motherfucker.
________________________________
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> on behalf of Mark B=
rown <broonie@kernel.org>
Sent: Wednesday, February 15, 2023 9:19 AM
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: miquel.raynal@bootlin.com <miquel.raynal@bootlin.com>; richard@nod.at <=
richard@nod.at>; vigneshr@ti.com <vigneshr@ti.com>; jic23@kernel.org <jic23=
@kernel.org>; tudor.ambarus@microchip.com <tudor.ambarus@microchip.com>; pr=
atyush@kernel.org <pratyush@kernel.org>; sanju.mehta@amd.com <sanju.mehta@a=
md.com>; chin-ting_kuo@aspeedtech.com <chin-ting_kuo@aspeedtech.com>; clg@k=
aod.org <clg@kaod.org>; kdasu.kdev@gmail.com <kdasu.kdev@gmail.com>; f.fain=
elli@gmail.com <f.fainelli@gmail.com>; rjui@broadcom.com <rjui@broadcom.com=
>; sbranden@broadcom.com <sbranden@broadcom.com>; eajames@linux.ibm.com <ea=
james@linux.ibm.com>; olteanv@gmail.com <olteanv@gmail.com>; han.xu@nxp.com=
 <han.xu@nxp.com>; john.garry@huawei.com <john.garry@huawei.com>; shawnguo@=
kernel.org <shawnguo@kernel.org>; s.hauer@pengutronix.de <s.hauer@pengutron=
ix.de>; narmstrong@baylibre.com <narmstrong@baylibre.com>; khilman@baylibre=
.com <khilman@baylibre.com>; matthias.bgg@gmail.com <matthias.bgg@gmail.com=
>; haibo.chen@nxp.com <haibo.chen@nxp.com>; linus.walleij@linaro.org <linus=
.walleij@linaro.org>; daniel@zonque.org <daniel@zonque.org>; haojian.zhuang=
@gmail.com <haojian.zhuang@gmail.com>; robert.jarzmik@free.fr <robert.jarzm=
ik@free.fr>; agross@kernel.org <agross@kernel.org>; bjorn.andersson@linaro.=
org <bjorn.andersson@linaro.org>; heiko@sntech.de <heiko@sntech.de>; krzysz=
tof.kozlowski@linaro.org <krzysztof.kozlowski@linaro.org>; andi@etezian.org=
 <andi@etezian.org>; mcoquelin.stm32@gmail.com <mcoquelin.stm32@gmail.com>;=
 alexandre.torgue@foss.st.com <alexandre.torgue@foss.st.com>; wens@csie.org=
 <wens@csie.org>; jernej.skrabec@gmail.com <jernej.skrabec@gmail.com>; samu=
el@sholland.org <samuel@sholland.org>; masahisa.kojima@linaro.org <masahisa=
.kojima@linaro.org>; jaswinder.singh@linaro.org <jaswinder.singh@linaro.org=
>; rostedt@goodmis.org <rostedt@goodmis.org>; mingo@redhat.com <mingo@redha=
t.com>; l.stelmach@samsung.com <l.stelmach@samsung.com>; davem@davemloft.ne=
t <davem@davemloft.net>; edumazet@google.com <edumazet@google.com>; kuba@ke=
rnel.org <kuba@kernel.org>; pabeni@redhat.com <pabeni@redhat.com>; alex.ari=
ng@gmail.com <alex.aring@gmail.com>; stefan@datenfreihafen.org <stefan@date=
nfreihafen.org>; kvalo@kernel.org <kvalo@kernel.org>; james.schulman@cirrus=
.com <james.schulman@cirrus.com>; david.rhodes@cirrus.com <david.rhodes@cir=
rus.com>; tanureal@opensource.cirrus.com <tanureal@opensource.cirrus.com>; =
rf@opensource.cirrus.com <rf@opensource.cirrus.com>; perex@perex.cz <perex@=
perex.cz>; tiwai@suse.com <tiwai@suse.com>; npiggin@gmail.com <npiggin@gmai=
l.com>; christophe.leroy@csgroup.eu <christophe.leroy@csgroup.eu>; mpe@elle=
rman.id.au <mpe@ellerman.id.au>; oss@buserror.net <oss@buserror.net>; windh=
l@126.com <windhl@126.com>; yangyingliang@huawei.com <yangyingliang@huawei.=
com>; git@amd.com <git@amd.com>; linux-spi@vger.kernel.org <linux-spi@vger.=
kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; j=
oel@jms.id.au <joel@jms.id.au>; andrew@aj.id.au <andrew@aj.id.au>; radu_nic=
olae.pirea@upb.ro <radu_nicolae.pirea@upb.ro>; nicolas.ferre@microchip.com =
<nicolas.ferre@microchip.com>; alexandre.belloni@bootlin.com <alexandre.bel=
loni@bootlin.com>; claudiu.beznea@microchip.com <claudiu.beznea@microchip.c=
om>; bcm-kernel-feedback-list@broadcom.com <bcm-kernel-feedback-list@broadc=
om.com>; fancer.lancer@gmail.com <fancer.lancer@gmail.com>; kernel@pengutro=
nix.de <kernel@pengutronix.de>; festevam@gmail.com <festevam@gmail.com>; li=
nux-imx@nxp.com <linux-imx@nxp.com>; jbrunet@baylibre.com <jbrunet@baylibre=
.com>; martin.blumenstingl@googlemail.com <martin.blumenstingl@googlemail.c=
om>; avifishman70@gmail.com <avifishman70@gmail.com>; tmaimon77@gmail.com <=
tmaimon77@gmail.com>; tali.perry1@gmail.com <tali.perry1@gmail.com>; ventur=
e@google.com <venture@google.com>; yuenn@google.com <yuenn@google.com>; ben=
jaminfair@google.com <benjaminfair@google.com>; yogeshgaur.83@gmail.com <yo=
geshgaur.83@gmail.com>; konrad.dybcio@somainline.org <konrad.dybcio@somainl=
ine.org>; alim.akhtar@samsung.com <alim.akhtar@samsung.com>; ldewangan@nvid=
ia.com <ldewangan@nvidia.com>; thierry.reding@gmail.com <thierry.reding@gma=
il.com>; jonathanh@nvidia.com <jonathanh@nvidia.com>; michal.simek@amd.com =
<michal.simek@amd.com>; linux-aspeed@lists.ozlabs.org <linux-aspeed@lists.o=
zlabs.org>; openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; linux-arm-=
kernel@lists.infradead.org <linux-arm-kernel@lists.infradead.org>; linux-rp=
i-kernel@lists.infradead.org <linux-rpi-kernel@lists.infradead.org>; linux-=
amlogic@lists.infradead.org <linux-amlogic@lists.infradead.org>; linux-medi=
atek@lists.infradead.org <linux-mediatek@lists.infradead.org>; linux-arm-ms=
m@vger.kernel.org <linux-arm-msm@vger.kernel.org>; linux-rockchip@lists.inf=
radead.org <linux-rockchip@lists.infradead.org>; linux-samsung-soc@vger.ker=
nel.org <linux-samsung-soc@vger.kernel.org>; linux-stm32@st-md-mailman.stor=
mreply.com <linux-stm32@st-md-mailman.stormreply.com>; linux-sunxi@lists.li=
nux.dev <linux-sunxi@lists.linux.dev>; linux-tegra@vger.kernel.org <linux-t=
egra@vger.kernel.org>; netdev@vger.kernel.org <netdev@vger.kernel.org>; lin=
ux-wpan@vger.kernel.org <linux-wpan@vger.kernel.org>; libertas-dev@lists.in=
fradead.org <libertas-dev@lists.infradead.org>; linux-wireless@vger.kernel.=
org <linux-wireless@vger.kernel.org>; linux-mtd@lists.infradead.org <linux-=
mtd@lists.infradead.org>; lars@metafoo.de <lars@metafoo.de>; Michael.Henner=
ich@analog.com <Michael.Hennerich@analog.com>; linux-iio@vger.kernel.org <l=
inux-iio@vger.kernel.org>; michael@walle.cc <michael@walle.cc>; palmer@dabb=
elt.com <palmer@dabbelt.com>; linux-riscv@lists.infradead.org <linux-riscv@=
lists.infradead.org>; alsa-devel@alsa-project.org <alsa-devel@alsa-project.=
org>; patches@opensource.cirrus.com <patches@opensource.cirrus.com>; linuxp=
pc-dev@lists.ozlabs.org <linuxppc-dev@lists.ozlabs.org>; amitrkcian2002@gma=
il.com <amitrkcian2002@gmail.com>; Dhruva Gole <d-gole@ti.com>; Patrice Cho=
tard <patrice.chotard@foss.st.com>; William Zhang <william.zhang@broadcom.c=
om>
Subject: Re: [PATCH v4 01/15] spi: Replace all spi->chip_select and spi->cs=
_gpiod references with function call

On Sat, Feb 11, 2023 at 01:06:32AM +0530, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpi=
od
> members of struct spi_device to be an array. But changing the type of the=
se
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and

This again doesn't apply against my current code - I think the
best thing to do here is going to be to rebase against -rc1 when
it comes out and resend then, that will also make the issues
integrating with other trees easier as then I can make a clean
branch against -rc1 that other trees will be able to merge as
needed.
