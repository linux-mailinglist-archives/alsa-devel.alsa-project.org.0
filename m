Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E409B8D42E9
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 03:29:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 543D484D;
	Thu, 30 May 2024 03:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 543D484D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717032596;
	bh=RXHw0bWwdazeYfIzE8TIzSEFQiFDvvPclo6OUZPs8CE=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kpidGEwbB3siHA1dOXnDQQLjAUtMPe4q+IS4dIgU36LeKvlFI3dTvtxId1sor4zk0
	 TsP4CuOK/A8ioe2mx98DdDyUUnRolCAb8rE7GdyF24CS10yrq3Sz9ilKZQeiV5ObC7
	 bJKvbkaaVWfbzhyEfg7pO3X9LSe4+koqhJ1q16pw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22132F805E3; Thu, 30 May 2024 03:29:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1612F805D6;
	Thu, 30 May 2024 03:29:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1C17F805BD; Thu, 30 May 2024 03:29:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C2FCF80149
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 03:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C2FCF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Uybn2dP8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1igNCf2gexkz5M5df6Wfc10LF+/qJOsNpm945fwpLBul1QIzul0ZrnH2dAMox6YD6JITBdVg7AJ4ehyDQ6Af4oxTJUhSgFGRSTS9Z5gocyTmyhHhI9DVvLeR5XK0E7BEJ8K7ycJSwIXhG3afAEwT5tu/qL+XWAlybK9QeTe3WUE2BkLxAy9LE5MiEK00G8+XZFdwVAYh4nrsRymZ3fQSeemb92CnoMmBeK7KrHXIjL0860/Ti3Iw2+tBitrkiI1M090duhJz4QOIr3rvJil8RB069HijyO1/+jCAhp9BJ5rgi0k1rHKLRJEsAFyAkmOPXJE8KMnEp98lZG04rlIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tLkaEgdWmAHv7t2EHwbzIhchQhVsXuUC5KxYya9Hdw=;
 b=QQNlBmS0/TqA+R05KQvhEDLa47q6qVEUrqQ20V6SjGn5J2ePm0HzTSp68Bg4XJuX+stzHrvDYL0kv8irUotYZCEciUuph0qH6Fi7ZScOZKh7g8Tde8v4mmo+gG0K1eBEbbjdAiy6CQQalwVau0Fja1nIVQSaU1A1OE7EedpgGP0U6mAoldscyC6/N9g4ltWe3VxBtaVR3MDqCiTovuxBUYVirkCCm6c5s0XH9afAKhJMN8209pZ/UfV9S/Abe4knc8UcuE3EbNkjzXYNLIL0voaTRc2ODpLIsbH8AavRLCilmHY208KR2DNqaPyqah5q23I6TqE7A9uiYEmot34rcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tLkaEgdWmAHv7t2EHwbzIhchQhVsXuUC5KxYya9Hdw=;
 b=Uybn2dP812Y3RFRDDYb0yjRxhzmfrzhVjM/KdJbA5i4m+Z6uWp4YStMnvbVMb71Ot2yLLzgQFkl9pjbcz24AtkXT0hF0vt0tl8Rqt6CZ6M8zRm6oJyET0x7fexee5wgF4bGY2yuNuh0X7b+PVFmYQ6coyVh9zTYrOfU79osvtcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5524.jpnprd01.prod.outlook.com
 (2603:1096:604:a6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 01:28:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:28:57 +0000
Message-ID: <871q5kqe94.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC 02/12] ASoC: fsl: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
In-Reply-To: <874jagqe9w.wl-kuninori.morimoto.gx@renesas.com>
References: <874jagqe9w.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 01:28:55 +0000
X-ClientProxiedBy: TY1PR01CA0187.jpnprd01.prod.outlook.com (2603:1096:403::17)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: afdf9972-2311-4472-16f5-08dc8047e01c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|7416005|366007|1800799015|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zZugTvt/GhVq18LW4vQtijDRHN6CZTvPW95MNXjOyvjkW53NyxHaG6+M5qj/?=
 =?us-ascii?Q?yY6M/5l7ERkPwUj6X2g+mO0zqTeQVaMSMKL3aVnOFhXBL3YjH2DJNde8ZjYJ?=
 =?us-ascii?Q?77qyOpvAEg3XMXDoNxAzO4S3baRYfZKJ25pOVGI173JLJzKz4f336m0hne3K?=
 =?us-ascii?Q?/IVTQ9NjmWeRHTcGTktUxoLcUQh8f3jeZ2e5k3y+ES93D1AAw6+QrhUhqk4E?=
 =?us-ascii?Q?i8AvJ7zSkqvFvEV/ZCTVFsm2oWsdMvCBCeJx9mOvzs3n/yGdORjSyIKSPFT2?=
 =?us-ascii?Q?fUw9bMaXRZwTrm2/tYXkUbk+n8Gw0fRKyCZxAmardar23cjePIF3hhCe23XU?=
 =?us-ascii?Q?ZR1kdA/oHVfT2EpZRLwQAsLncEsvDEz2/mfD5qnqLlkO9dUCUAPMnvWJMiTp?=
 =?us-ascii?Q?MxzJNNZTa63oUCjg8yu6dJXPHhWhmrwMxaMeWIgC2jyjbY6wlUtjPybXWlXh?=
 =?us-ascii?Q?pzjvu+3c9SKHC/XYMznWZJqSPYjovfU2NSsxbajDiTMOYYPtSrRbiUAU1o7P?=
 =?us-ascii?Q?RLSmeWAMG8Q56WtDCKkbPv5qFK/iFGSxnDVOOwufVNxpIXgoZzTtbRa5/sCG?=
 =?us-ascii?Q?X1/gLtiOKYaNOx5GmiE1CN6hq+X6ErcCE4YdVfXiU5+OcR5mfgI44F0vhCxe?=
 =?us-ascii?Q?QfLxskeV9RqdMWInGw7CAVDj0ZdIdditKYUPY+9pxetZk+xxzpjCggwWyjTl?=
 =?us-ascii?Q?ReqHzlhZQJkNlHqT5doq7MEZYVKG5kJISlcleIp+3fdkhayUL/0LHo5nY/7i?=
 =?us-ascii?Q?BwdmANta4400ga5eghKjsZhnvIbiEsWCt5qcXBoK4nekRTRkghVE/G5Y2tOy?=
 =?us-ascii?Q?U5PbA+L0ALl8cgDKXgOkcTpn+l+cQ+oz1xS33K7uNKjTwUTEALvtbJWhH0C+?=
 =?us-ascii?Q?VpKXjvCvSGdWUcJbJXIg/twFSTb7mt+gXXOXAe+Xb021vjYf0i4F+2InpcRt?=
 =?us-ascii?Q?BNLoz6BSzlswvW8f4UMh2kcTgOSJ6+/DYrFfbDE/m8uoPmTWzdhV3/zgeeZ6?=
 =?us-ascii?Q?oNP/o25OuPDBhI94wEE+zfKgzOXDywrlv0q97Y63k9FiWKm9pzUbYQPZj139?=
 =?us-ascii?Q?YmX8HBGtJnOfWzbQAm+YUJIOJogKXPyUjIjim4H/kJF1m+iNt4W9ECCuhINv?=
 =?us-ascii?Q?+grxBH1IzDWQWQL6AorfyRMT3272vbUDDTp7eOYjgsWyVyC+zDgoM5keRa2+?=
 =?us-ascii?Q?bHcCA+rWAxC7PEf/eBXDDmkE0aR11shoYreCSyHpDRUmcNtrV1RHzvlrCc07?=
 =?us-ascii?Q?r10g+GbCCgEQFMNDvHSmYFkLNZvYPxGHNqQu8Xkl2xmwfFPBgRuMyh2SwG7p?=
 =?us-ascii?Q?KmQrK/ahH4shW8I10F53WB8rRr+O+smELwWx5RvF/tg+lEQh6niASNCOIFlL?=
 =?us-ascii?Q?qI56Q2Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qrxJyYrBfTcpHG2aOl4xRmfizdU4TODCP2btQTocRHm0vsdl8GnZ3l1G+gSX?=
 =?us-ascii?Q?UiFWzrCvBSgQobSLuxRQrxH1rb3dDEqO7SOb+Lvglb8itA5qOwCzXioPoqUC?=
 =?us-ascii?Q?4GqtzhFFg9bVGJfd5Ed0tWLazXLcsGO9fuLuA7vfHK41mAqoFU6ZzxCPMaYu?=
 =?us-ascii?Q?GnODRr6OnqNR7D+Mt7KpkIG4vcYysGo9QIJMTR7UjXf+DqKpXsjWk5pYsLcQ?=
 =?us-ascii?Q?Vpf/BZiyD8Gb3NvJPQF2hkcmvRm4NKLvA9yG0u1qopMTTiHGt6nUQRRtv70x?=
 =?us-ascii?Q?CoiygKceP1FgBNCXShX+VOnuMUdY8kb5PKu8u8u8zW1Kxl7CcOn9sIi7dNFv?=
 =?us-ascii?Q?64K8RuGAlxJa5L6hug+/VIEW00upotdRbRgz0SfrDexd450AYTWids1Txqer?=
 =?us-ascii?Q?NXuTgodKf6wd8uwBywwLJWPO0OgnBc2OoFTfLhHR2ZIZYG3xgjL9zpGQRDUt?=
 =?us-ascii?Q?Fuj/HntWyAvhtKZ+zQFqws8HnBZWwGdn90AIVrX3QR6m++Mx7C8H8Zdj+GuR?=
 =?us-ascii?Q?cN4B+wGPd29+S5ebxlmx59YNsR/Z2IFSIbiPDL0rBbyKZlzkBLLLKB0zw5Va?=
 =?us-ascii?Q?0P2ubkptfc1Ae6rMNAdsA2ffUTWNiDE2iT7u/Gk2qhbrVqd1CAduf0dp8Qu2?=
 =?us-ascii?Q?bMZj+jWwrXv5XwpattuzUkxJb+kWumDczyhGYQKKkJfqQns1Sa8r2pthfaik?=
 =?us-ascii?Q?F5qhWehDDk+XinlrnVdoBv3s3u3C/WJxz4ma94nA9onpH5+ypwRP4bmBNluk?=
 =?us-ascii?Q?uMQwe0tzAEGA2oB+cTKnLVISzN//XKnB9eZg1Uz5OtUIwYcZ9l2pv/Rlz9Sw?=
 =?us-ascii?Q?W1B+EGgfvZi9vVY9kFZQ/2R1n3a0zax9Lc70X9lCUKuFnpKVTZ0Sc4JCLwtm?=
 =?us-ascii?Q?5jcD7T0Prr14zYfIaPX+s21ZHdkiSbcgA5EWvzH2jrbPM58NeQ4InrZPquQW?=
 =?us-ascii?Q?woKMf5IIDKrfIZc7ggWEN2/xKhFaHLGDrLVkUHa9zj6Fv4Xho2rFM79dNJ65?=
 =?us-ascii?Q?F1k0iUGY8wQw177eJbBG3h9vm0jNkQJcowBLm7dWHek4DrqxV0V43nKz5kyw?=
 =?us-ascii?Q?lHhyYSm97pcaP8fO6kDP+udqw99okvT/XG0fJjIZ5DfEoG40nwfPLsk3BP+9?=
 =?us-ascii?Q?jaoq1VjGz/XHHWoHripMjAgcfnFJ8FOj/yggucpy5DwmvnH+H521x1IJPFao?=
 =?us-ascii?Q?DL7D34PNXxhbTxKtaYY8xMQR69h8O1ypPtmdAqqYWs4rHadKrDvc0K+huqo0?=
 =?us-ascii?Q?vPBhztscevrH4NYusv6TJJHSEoGwsbQY6wY80T1qjdWWWUjK8x5+ubmZK/z4?=
 =?us-ascii?Q?d3cZ3FHe8XzDXyPHKxz7HsvsuEDmFvCC0fgpe+RibicUdJ0peTfjxWs+1Z74?=
 =?us-ascii?Q?j7ppz6sd8eScNaAoljjfFbcIlXDrMh6diBkOGRCXGe0CGPgl5HtCBXIU8KEy?=
 =?us-ascii?Q?vGoR57QKyPAPU2HrqJfhz5Zyu6Pg5bXs4jj4s+ARXEvo5EDYPxXjyce+eAMD?=
 =?us-ascii?Q?xMl2xecvtdVubePfcUAiZcT23SY7lP8fnnvLTexfj9BJwvxzQECJzy7Lkfdi?=
 =?us-ascii?Q?zi60YlP+N3I9Wjj6QkuUgR+vMjyo+qzPreR/kZc66zKyz1/gRB8xEx8D6Pgq?=
 =?us-ascii?Q?xCC+u4DiE6V/KXyNlhs8ls4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 afdf9972-2311-4472-16f5-08dc8047e01c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:28:57.1903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zcS7ar2uBINEWipbZFTrrgMzC+EelQrYkvWkYCf2gw80g3e5J9VJT2jNSjWv30v56tzquoTp1YabYWgAu/MlUFmiVD6Tiu1DmTWJJsjjg4FhH40o/ttyu7bj0GwndV73
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5524
Message-ID-Hash: 466JIQZ3N67MF2IJYWCOPL2YBOWSC53V
X-Message-ID-Hash: 466JIQZ3N67MF2IJYWCOPL2YBOWSC53V
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/466JIQZ3N67MF2IJYWCOPL2YBOWSC53V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 16 ++++++----------
 sound/soc/fsl/imx-audmix.c    |  6 ++----
 sound/soc/fsl/imx-card.c      |  4 ++--
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 5ddc0c2fe53ff..0b15f89c7bb8a 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -320,8 +320,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 	{
 		.name = "HiFi-ASRC-FE",
 		.stream_name = "HiFi-ASRC-FE",
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.dynamic = 1,
 		SND_SOC_DAILINK_REG(hifi_fe),
 	},
@@ -330,8 +328,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 		.stream_name = "HiFi-ASRC-BE",
 		.be_hw_params_fixup = be_hw_params_fixup,
 		.ops = &fsl_asoc_card_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(hifi_be),
 	},
@@ -649,8 +645,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic31xx")) {
 		codec_dai_name = "tlv320dac31xx-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.sysclk_dir[RX] = SND_SOC_CLOCK_OUT;
 		priv->card.dapm_routes = audio_map_tx;
@@ -676,15 +672,15 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
 				SND_SOC_DAIFMT_CBC_CFC |
 				SND_SOC_DAIFMT_NB_NF;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8524")) {
 		codec_dai_name = "wm8524-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.slot_width = 32;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 2aeb18397bcb2..8fbd6fc8af76c 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -258,10 +258,10 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[i].cpus->of_node = args.np;
 		priv->dai[i].cpus->dai_name = dev_name(&cpu_pdev->dev);
 		priv->dai[i].dynamic = 1;
-		priv->dai[i].dpcm_playback = 1;
-		priv->dai[i].dpcm_capture = (i == 0 ? 1 : 0);
 		priv->dai[i].ignore_pmdown_time = 1;
 		priv->dai[i].ops = &imx_audmix_fe_ops;
+		if (i)
+			priv->dai[i].playback_only = 1;
 
 		/* Add AUDMIX Backend */
 		be_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
@@ -283,8 +283,6 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
 		priv->dai[num_dai + i].no_pcm = 1;
-		priv->dai[num_dai + i].dpcm_playback = 1;
-		priv->dai[num_dai + i].dpcm_capture  = 1;
 		priv->dai[num_dai + i].ignore_pmdown_time = 1;
 		priv->dai[num_dai + i].ops = &imx_audmix_be_ops;
 
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 98b37dd2b9013..c4647ba912a63 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -814,8 +814,8 @@ static int imx_card_probe(struct platform_device *pdev)
 		}
 		for_each_card_prelinks(&data->card, i, link) {
 			if (link->dynamic == 1 && link_be) {
-				link->dpcm_playback = link_be->dpcm_playback;
-				link->dpcm_capture = link_be->dpcm_capture;
+				link->playback_only = link_be->playback_only;
+				link->capture_only  = link_be->capture_only;
 			}
 		}
 	}
-- 
2.43.0

