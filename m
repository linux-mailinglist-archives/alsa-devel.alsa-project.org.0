Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7567778FF
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 15:02:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55A79826;
	Thu, 10 Aug 2023 15:01:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55A79826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691672552;
	bh=9Sk8/ubTkfxJlZ3XNm/FO2LF14T3RBtttlgTMc2JjAs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=cDPHfm+wkhNULd+OZSU//GkJWEuYuPbHLu8BrmqyMppMwlMVmgs4J3ExCJqJsEuYy
	 6X0G1eXEt0Qey1DdgtlEdi1vlXAoR3RegTRoxUJtgeuGEPnfTacOn+4UIT8w9Dw5aa
	 nEO9Y87oDq7uE/rB0LZ6ZTPZEAlYnfn1t456hbr8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 866D9F800F4; Thu, 10 Aug 2023 15:01:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85A7BF80166;
	Thu, 10 Aug 2023 15:01:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FF8DF8016E; Wed,  9 Aug 2023 00:54:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AC12F800F4
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AC12F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ZCMKL1ej
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGAke4FsJCTBsphd61qAOmirJEKQk9IjGxSmRoAk3SIVNdTrAVm5c2oSgRxigS/l1Ns//tePTKRDTvngsTc42NIqlvICJWjGHLuVlOlmt20AQyzMEpUycXBSF1/1SdkYlWP/M+kXpRKRy1RPot3ShKn27VjptM/eoUMdAsv9AY2q8i/BKSFf5WOMepIupYs2wcEjZtmKPtv5H82xkNdJqGaXQSlTSXoCSeqptFMjEfbSKsBFcNvEA4rljPCZfqM+zkaHUTbtcFkguhi9JE5fhTgwKEtKansy2FyzwJsQ9i73Pk8mT2PtrgdWS6OwoNO5IZr0rUBXbmqjtVHzF8EK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/o9GL3JNeiFHbxj2Uu2fSmRnflywYjrgrN07GVtAnZY=;
 b=Yc1N7JAucmUXToCDWDtWOMT9N/VDpZt/EeLfNyHs/xN1oQX4cMT/f+VlG/C6wdFx4ejTasuLQQqgbeENKZZkMlD2iOxgTVLqOzn/ExY+N9nA20ga98h4U7TLClgIkaNIwoJRg4+gQbZlGZY1rrKl2iK/YAj8G4y8q1TkUfyt5Zo+rURVhW1h0Fp8CrdboHNIOCI9waiQ5GVyZ1xFX26i4nXTlmn6BrePkdebCy4cPOLXnbuVfsbv67HdaVP+onkydP1W7AaqG0i1YqzlZHd15Y7yFB4olFLrbam8WEvUgfPfOtIEzQsmE7At3tewwLzn6H/ZYKmsAOp95JibfMiDSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/o9GL3JNeiFHbxj2Uu2fSmRnflywYjrgrN07GVtAnZY=;
 b=ZCMKL1ej+zTfi1c6jUQ0JAgIeWiXKGM1VfP/TaczRovEok/IzqhYXqFlkPt5Zfa48gt7MSPa63glrIj9lMppNSVG2+ygraXctEjTN6ea2fy2CxiPvjog9rfybp1owPZ9wnDeb39kfNO3ZxmBijFPuxVobODjJkTBYIVjpu26HlI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9524.jpnprd01.prod.outlook.com (2603:1096:400:19b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:54:32 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:54:28 +0000
Message-ID: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3?=
 =?ISO-8859-1?Q?=B6nig=22?= <u.kleine-koenig@pengutronix.de>, Aidan
 MacDonald <aidanmacdonald.0x0@gmail.com>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Arnd Bergmann <arnd@arndb.de>, Ban Tao
 <fengzheng923@gmail.com>, Banajit Goswami <bgoswami@quicinc.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Chancel Liu <chancel.liu@nxp.com>, Charles
 Keepax <ckeepax@opensource.cirrus.com>, Chen-Yu Tsai <wens@csie.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Daniel Mack <daniel@zonque.org>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, David Rhodes
 <david.rhodes@cirrus.com>, Emma Anholt <emma@anholt.net>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, James Schulman
 <james.schulman@cirrus.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Jaroslav Kysela <perex@perex.cz>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Judy Hsiao <judyhsiao@chromium.org>, Jyri
 Sarha <jyri.sarha@intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Liam Girdwood <lgirdwood@gmail.com>, Liam
 Girdwood <liam.r.girdwood@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Paul Cercueil <paul@crapouillou.net>, Peter
 Ujfalusi <peter.ujfalusi@gmail.com>, Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Ray Jui <rjui@broadcom.com>, Richard
 Fitzgerald <rf@opensource.cirrus.com>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Samuel Holland <samuel@sholland.org>, Scott
 Branden <sbranden@broadcom.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Srinivasa Rao
 Mandadapu <quic_srivasam@quicinc.com>, Syed Saba Kareem
 <Syed.SabaKareem@amd.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Venkata Prasad Potturu
 <venkataprasad.potturu@amd.com>, Walker Chen
 <walker.chen@starfivetech.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Yingkun
 Meng <mengyingkun@loongson.cn>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabio Estevam <festevam@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Nicolin
 Chen <nicoleotsuka@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH v2 00/39] ASoC: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:54:27 +0000
X-ClientProxiedBy: TYAPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9524:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7c6528-cc87-4d16-e9a0-08db98626bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/MG99KvgHrC+xEdHRs+0Mw75Mn4FHinfnyO2DFS7b6WkFIgbPsJHHznsbe364kdM6NjiVnmkt5S0Vp74iMTcsNDK3F8CxAfrmVErlicenLuEWvEJ2E0iVMOrz+fRE5O+lCmlSZEr2SwjHBflVnJJ8VsVu5ufGeLTx6EZIhSXowI3+NnFjes0FLlYl/j0AdUiMjLV83NuYVskGJQOkV3NzkLpT5zLVKXh0WEBt9vLlyPToencbIwTeEtxvwOsATvCGFeNCrgEe8qdt/Cv/eThe4HEQx83nReIXaRqCkAMrz45d/uetPo2uAtOEMxm1WFDyNz0mtQ7dF+Ae2X3Xd140ulDcympQwEAGRnlk3gsvx7wfYYiZ7Ld2+4nmWrvwmSAEbn+Ho6PFCeMnvIrDIBWNEbH+d6HpA8vHtELIdlniHKUy2hGE/Ca/ABtT3wrydYFCb810dRSLEdH6I6Cs90OFewi679rNGL1+SOQEOdREIlXXtoBpRQGQX1IB6dUIAWh/4uPfTY3P4fzyM3wswyftfHH5yrpx/KoOSwMOgCCM8P63iLlQF/cYONQnSesSLZvwURJXuT52Lg+/Evu4IPdJUMVDuxT9d/CHd5jKAoyF5XZx3exVQROQrl01qJP7y+K2Mydze/CiRqNPSHRSO57NH9oyUxxhHt3ANUAmyU1Z35orl5lWav1taQzXvvQjLF5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199021)(1800799006)(186006)(316002)(66946007)(66556008)(66476007)(4326008)(8676002)(8936002)(41300700001)(1191002)(2616005)(83380400001)(86362001)(38350700002)(921005)(38100700002)(36756003)(52116002)(966005)(6512007)(6486002)(6506007)(26005)(478600001)(110136005)(54906003)(2906002)(7416002)(7366002)(7336002)(7406005)(5660300002)(41080700001)(357404004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8QWpq/ZJ9P8mvO5esq1f1Zl20iszPe9gbSvKldSFgl9+M9Ul2+zPArm5T2sE?=
 =?us-ascii?Q?hMqfb6hDdrURx50kRFqlRFxNp9nruz7V/+vdZiSf9FG/m1vlWG0cpC9cs1qE?=
 =?us-ascii?Q?UMgaGLkrrlZO0CqEKwOzjxGUlfw8DLPUyoDXD57OK6rMApOOo1/JrCju2fNb?=
 =?us-ascii?Q?gjgkFfNpKivcf6laKEMDqynokMB7ceCA9Ebhy0CqkLDu9z8/Yj0ZOQAbW6Lx?=
 =?us-ascii?Q?IZo7d/QfGAp/DVjg95SZQ0K/AxtXHIrznkRot4cYL+tVJ8gwoXzLnoAJ/Kfv?=
 =?us-ascii?Q?7pH4kLteoyw20AeubZnX15Gg9QAM1qrIdZ4we0xIWWUDQhJvHI55nOZjAsUM?=
 =?us-ascii?Q?5IvaogcZlunlBiFxX62Akk/4iM8wFFuASYATJkMPLT4nE/eYoysuAppiE9A3?=
 =?us-ascii?Q?C7UepGZ6a9OScsEFwQkAv2oc8B/EFeuOLrsjPob3GMSbljyZ4hWkvcNFZR33?=
 =?us-ascii?Q?TBkZOP7mzI8p/8C3iXss9RUzdeYJ+tlGUKSHhDYRRNyhyAB+u6bTuAdvwNZa?=
 =?us-ascii?Q?lzrCGFHj40TxAd4u6YdfEnvf6znq6Ev4pIF8QjrpjrK9fIPk1eZc1uvJKwh2?=
 =?us-ascii?Q?SkFbDJp3vIpTMGWOq0iCa8sAi10LZ/xiyrCJ8IZyitvytlle+lVIoaCXRWrp?=
 =?us-ascii?Q?9LstJ/F8bYgcnP23iK0DJ2sA3hR9nVvtXo6WnVbJlb/NYt9rhqTW8rqosKgo?=
 =?us-ascii?Q?puGc3Xj4PP/iZ33FPyTc0+bwQ6oEWsUUkHK+TbtvsSt+eS6wQij9MpZqAJZu?=
 =?us-ascii?Q?48DEZW2Rc8zo1aGfktwpe7PLheT+D0/c9ZwoG/P+fEmi6QijeLMyttATW40p?=
 =?us-ascii?Q?I5H7mg0dOFP8i5TCks0O2hqc09O2Iendtwr0eKPOxe7Zx4TTFqleUBCpldew?=
 =?us-ascii?Q?+aLeR3Fu9cktbIWL3iOV/6WUvrm6iIbLehWXVYF3TcZH6VPG/MNsUm9mYifN?=
 =?us-ascii?Q?SHL0zcVsGG1RoA+uWla5rxtCYKbl9VF1GuoJ9uZwaybJ9BV+PKOQWi+KJbGG?=
 =?us-ascii?Q?ukl4fMz4QTGykMVn9F62zv70MywsM9Cq4hBDAncsFDQlp8+OgwBXCebELoEk?=
 =?us-ascii?Q?NhnVgIGKjpfEycsOLe8B1cDYdNUOCmaUSIHb2cY6avjeoJaihpQd81sIL3lf?=
 =?us-ascii?Q?w6e99uRrY7mw9vXk2zikjjR3hLWLYMdxepPk/eG4XNG27gXqbySJ1TBNXhkq?=
 =?us-ascii?Q?DzJbiN6o/mIUqLexi06lTEHcvTCs4dieO3leFGMQRtF75cKC3tA8t1RBXNus?=
 =?us-ascii?Q?n8FkN6RtiiyMp5rq1ZjJz+8WluOWopHX1bTcrWQGRoWkMSBmEwaB+b4f1laD?=
 =?us-ascii?Q?SYlIfhGOeFVJo5yINS3ZYNjqBYlOaFizaIF4gsp0KvxCVzrkJn0JDC2RI7st?=
 =?us-ascii?Q?wHNC18/BbATevcfwrTd1LOfV+F+OZYVarinQdDFfTdX/XoPwCdp+NvfQm6hS?=
 =?us-ascii?Q?H0ouamdnG0fnmVS5NYg7O6lLhLqHOYudGnBBuZbbiRuqe2vYwjazWqtOwTTJ?=
 =?us-ascii?Q?DLIMRY4jMsPJOndjUQ+hGB5udE2FEnpPLCDNT0LiiU+miKKC4VXzQUhh/lIB?=
 =?us-ascii?Q?Q+ELiwOq5SVMlGXW6DZmBhoUH3YrVi5SuoZLjGw9vZazIFM6Zlw084WYeFOZ?=
 =?us-ascii?Q?QefHKwmV+CCnpF9ThZT6qVw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fe7c6528-cc87-4d16-e9a0-08db98626bd9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:54:28.8219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dXZqI9s3VFc1ggSGLHZlFJlhpbhBrYi5v5WOa6sGdni8q5bD5V7p/YvurjBzYoy9PDsic/PO1FwfzWF4k4IGXbW3RBdY4Cx4w5ASTgpqmwoS4kHsDTqfLo+XHHEGnMU1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9524
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: FZAH5MXLZW4IDGKIA4SLNYBNHGJWZZGX
X-Message-ID-Hash: FZAH5MXLZW4IDGKIA4SLNYBNHGJWZZGX
X-Mailman-Approved-At: Thu, 10 Aug 2023 13:01:15 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FZAH5MXLZW4IDGKIA4SLNYBNHGJWZZGX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark

snd_soc_dai_driver has .ops for call back functions (A), but it also
has other call back functions (B). It is duplicated and confusable.

	struct snd_soc_dai_driver {
		...
 ^		int (*probe)(...);
 |		int (*remove)(...);
(B)		int (*compress_new)(...);
 |		int (*pcm_new)(...);
 v		...
(A)		const struct snd_soc_dai_ops *ops;
		...
	}

This patch merges (B) into (A).

-------- 8< -------- 8< -------- 8< -------- 8< -------- 8< --------

v1 -> v2
	- add Reviewed-by on each patches.
	- fixup git-log typo (thesse -> there)
	- add missing patch for au1x

Link: https://lore.kernel.org/r/87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com


Kuninori Morimoto (39):
  ASoC: soc-dai.h: merge DAI call back functions into ops
  ASoC: ti: merge DAI call back functions into ops
  ASoC: adi: merge DAI call back functions into ops
  ASoC: adi: merge DAI call back functions into ops
  ASoC: amd: merge DAI call back functions into ops
  ASoC: dwc: merge DAI call back functions into ops
  ASoC: pxa: merge DAI call back functions into ops
  ASoC: bcm: merge DAI call back functions into ops
  ASoC: fsl: merge DAI call back functions into ops
  ASoC: img: merge DAI call back functions into ops
  ASoC: sof: merge DAI call back functions into ops
  ASoC: sti: merge DAI call back functions into ops
  ASoC: stm: merge DAI call back functions into ops
  ASoC: pxa: merge DAI call back functions into ops
  ASoC: rsnd: merge DAI call back functions into ops
  ASoC: qcom: merge DAI call back functions into ops
  ASoC: au1x: merge DAI call back functions into ops
  ASoC: ux500: merge DAI call back functions into ops
  ASoC: sunxi: merge DAI call back functions into ops
  ASoC: tegra: merge DAI call back functions into ops
  ASoC: atmel: merge DAI call back functions into ops
  ASoC: intel: merge DAI call back functions into ops
  ASoC: meson: merge DAI call back functions into ops
  ASoC: jz4740: merge DAI call back functions into ops
  ASoC: cirrus: merge DAI call back functions into ops
  ASoC: drm/vc4: merge DAI call back functions into ops
  ASoC: samsung: merge DAI call back functions into ops
  ASoC: mediatek: merge DAI call back functions into ops
  ASoC: rockchip: merge DAI call back functions into ops
  ASoC: uniphier: merge DAI call back functions into ops
  ASoC: loongson: merge DAI call back functions into ops
  ASoC: starfive: merge DAI call back functions into ops
  ASoC: hisilicon: merge DAI call back functions into ops
  ASoC: codecs/wm*: merge DAI call back functions into ops
  ASoC: soc-topology: merge DAI call back functions into ops
  ASoC: codecs/cs47lxx: merge DAI call back functions into ops
  ASoC: codecs/cx2072x: merge DAI call back functions into ops
  ASoC: codecs/hdmi-codec: merge DAI call back functions into ops
  ASoC: soc-dai.h: remove unused call back functions

 drivers/gpu/drm/vc4/vc4_hdmi.c               |   6 +-
 include/sound/soc-dai.h                      |  26 +--
 sound/soc/adi/axi-i2s.c                      |   2 +-
 sound/soc/adi/axi-spdif.c                    |   2 +-
 sound/soc/amd/acp/acp-i2s.c                  |  24 +--
 sound/soc/amd/acp/acp-rembrandt.c            |   3 -
 sound/soc/amd/acp/acp-renoir.c               |   2 -
 sound/soc/amd/acp/amd.h                      |   1 -
 sound/soc/atmel/atmel-i2s.c                  |  16 +-
 sound/soc/atmel/mchp-i2s-mcc.c               |  24 +--
 sound/soc/atmel/mchp-pdmc.c                  |  18 +--
 sound/soc/atmel/mchp-spdifrx.c               |  14 +-
 sound/soc/atmel/mchp-spdiftx.c               |  18 +--
 sound/soc/au1x/ac97c.c                       |  10 +-
 sound/soc/au1x/psc-ac97.c                    |   2 +-
 sound/soc/bcm/bcm2835-i2s.c                  |  24 +--
 sound/soc/cirrus/ep93xx-i2s.c                |   2 +-
 sound/soc/codecs/cs47l15.c                   |   6 +-
 sound/soc/codecs/cs47l24.c                   |   8 +-
 sound/soc/codecs/cs47l35.c                   |   8 +-
 sound/soc/codecs/cs47l85.c                   |   8 +-
 sound/soc/codecs/cs47l90.c                   |   8 +-
 sound/soc/codecs/cs47l92.c                   |   6 +-
 sound/soc/codecs/cx2072x.c                   |  11 +-
 sound/soc/codecs/hdmi-codec.c                |  44 ++---
 sound/soc/codecs/wm2200.c                    |  12 +-
 sound/soc/codecs/wm5102.c                    |   6 +-
 sound/soc/codecs/wm5110.c                    |   8 +-
 sound/soc/codecs/wm8994.c                    |   2 +-
 sound/soc/dwc/dwc-i2s.c                      |  18 +--
 sound/soc/fsl/fsl_asrc.c                     |  16 +-
 sound/soc/fsl/fsl_aud2htx.c                  |  10 +-
 sound/soc/fsl/fsl_easrc.c                    |  16 +-
 sound/soc/fsl/fsl_esai.c                     |  20 +--
 sound/soc/fsl/fsl_micfil.c                   |  14 +-
 sound/soc/fsl/fsl_sai.c                      |  24 +--
 sound/soc/fsl/fsl_spdif.c                    |  17 +-
 sound/soc/fsl/fsl_ssi.c                      |   3 +-
 sound/soc/fsl/fsl_xcvr.c                     |  16 +-
 sound/soc/generic/audio-graph-card.c         |   2 +-
 sound/soc/hisilicon/hi6210-i2s.c             |   2 +-
 sound/soc/img/img-i2s-in.c                   |  14 +-
 sound/soc/img/img-i2s-out.c                  |  14 +-
 sound/soc/img/img-parallel-out.c             |  14 +-
 sound/soc/img/img-spdif-in.c                 |  12 +-
 sound/soc/img/img-spdif-out.c                |  12 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |   2 +-
 sound/soc/intel/avs/probes.c                 |  10 +-
 sound/soc/intel/catpt/pcm.c                  |   8 +-
 sound/soc/intel/keembay/kmb_platform.c       |   4 +-
 sound/soc/jz4740/jz4740-i2s.c                |   3 +-
 sound/soc/loongson/loongson_i2s.c            |  16 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c  |  56 ++++---
 sound/soc/meson/aiu-acodec-ctrl.c            |   4 +-
 sound/soc/meson/aiu-codec-ctrl.c             |   4 +-
 sound/soc/meson/aiu-fifo-i2s.c               |   3 +
 sound/soc/meson/aiu-fifo-spdif.c             |   3 +
 sound/soc/meson/aiu.c                        |   6 -
 sound/soc/meson/axg-frddr.c                  |   4 +-
 sound/soc/meson/axg-pdm.c                    |  18 +--
 sound/soc/meson/axg-spdifin.c                |   4 +-
 sound/soc/meson/axg-tdm-interface.c          |   6 +-
 sound/soc/meson/axg-toddr.c                  |   4 +-
 sound/soc/meson/g12a-toacodec.c              |   4 +-
 sound/soc/meson/g12a-tohdmitx.c              |   4 +-
 sound/soc/pxa/mmp-sspa.c                     |   2 +-
 sound/soc/pxa/pxa-ssp.c                      |   4 +-
 sound/soc/qcom/lpass-apq8016.c               |   4 -
 sound/soc/qcom/lpass-cpu.c                   |  40 +++--
 sound/soc/qcom/lpass-ipq806x.c               |   1 -
 sound/soc/qcom/lpass-sc7180.c                |   5 +-
 sound/soc/qcom/lpass-sc7280.c                |   2 -
 sound/soc/qcom/lpass.h                       |   4 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c             |  88 +++++-----
 sound/soc/qcom/qdsp6/q6asm-dai.c             |   6 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c     |   3 -
 sound/soc/rockchip/rockchip_i2s.c            |   2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c        |   2 +-
 sound/soc/rockchip/rockchip_pdm.c            |   2 +-
 sound/soc/rockchip/rockchip_spdif.c          |   2 +-
 sound/soc/samsung/i2s.c                      |   5 +-
 sound/soc/samsung/pcm.c                      |  18 +--
 sound/soc/sh/rcar/core.c                     |  27 ++--
 sound/soc/soc-dai.c                          |  44 ++---
 sound/soc/soc-topology.c                     |   6 +-
 sound/soc/sof/sof-client-probes.c            |   6 +-
 sound/soc/starfive/jh7110_tdm.c              |  16 +-
 sound/soc/sti/sti_uniperif.c                 |   6 +-
 sound/soc/stm/stm32_i2s.c                    |   2 +-
 sound/soc/stm/stm32_sai_sub.c                |  18 ++-
 sound/soc/stm/stm32_spdifrx.c                |   2 +-
 sound/soc/sunxi/sun4i-codec.c                |   6 +-
 sound/soc/sunxi/sun4i-i2s.c                  |  18 +--
 sound/soc/sunxi/sun4i-spdif.c                |   2 +-
 sound/soc/sunxi/sun50i-dmic.c                |   2 +-
 sound/soc/tegra/tegra20_ac97.c               |  10 +-
 sound/soc/tegra/tegra20_i2s.c                |   2 +-
 sound/soc/tegra/tegra20_spdif.c              |   2 +-
 sound/soc/tegra/tegra210_admaif.c            |  12 +-
 sound/soc/tegra/tegra30_i2s.c                |   2 +-
 sound/soc/ti/davinci-i2s.c                   |  22 +--
 sound/soc/ti/davinci-mcasp.c                 |  27 ++--
 sound/soc/ti/omap-dmic.c                     |  22 +--
 sound/soc/ti/omap-mcbsp.c                    |  28 ++--
 sound/soc/ti/omap-mcpdm.c                    |  22 +--
 sound/soc/uniphier/aio-cpu.c                 | 161 +++++++++++++++----
 sound/soc/uniphier/aio-ld11.c                |  62 ++-----
 sound/soc/uniphier/aio-pxs2.c                |  55 +------
 sound/soc/uniphier/aio.h                     |  10 +-
 sound/soc/ux500/ux500_msp_dai.c              |   2 +-
 110 files changed, 798 insertions(+), 694 deletions(-)

-- 
2.25.1

