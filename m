Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB60E8D42F5
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 03:32:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07FBCA4D;
	Thu, 30 May 2024 03:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07FBCA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717032739;
	bh=gb8047m6aUcDhBvJPYS6TSjIVhl4bb/0b9SN+1QCZQc=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=dZrUyfJhmiwpdiKc3BQAEnADsPuM6CyZzGR76ZBilGLn/+sxK5VXAScz1yHvlUrwN
	 R5jbOWkdpY+nZaMC3LqYyY1G+4oyLKnm1S0sjeKmmYvpg2GaOHzBTUerEm5MvGDYcd
	 nDV1yF5lx+9rQAhMW1oDxfiA4HhLxLyvA+v33u5g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E4FAF806B3; Thu, 30 May 2024 03:30:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E78CF806B5;
	Thu, 30 May 2024 03:30:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F08DF80600; Thu, 30 May 2024 03:30:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AB07F805EB
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 03:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AB07F805EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Y4pNtfkS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMiLw+bY9DTuPkrwNk/KKR27uLp4SsUZGf7vvFc1kUDil1LI+J8WhXeF2F+py4zfaYWpRIY4qzNfdEC+7zHoDQGVoxoW14nssBDJsLqYZcRE0MnyqBEC20IWeC8xA4CyuSQQN+mKkw0X7EO9KYSIlct57C32XsRAgdekr05WxwnstvaeoBh8tQpgsEk3ttd5meSex+wpljkBaf8rCeSucVTUkmp3tz+0J/53/wuX/yIFiKIibSX/U2q7FTvDvV6PU3CgJNrVqgx64JWbSIlW2bJG94DO9nLtOOOvBNHaJ12VRySLHWXY0ksrt1dyywxafHjHU32nGz7/a6Y8t+hItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zF9L7c8BWVpiszPzAdAnNL/OjGbbyqG4WtEn5uBwTt8=;
 b=A5PYpk7tkhmFTYRbLnNJKmUxx1nBChLrAzjRVlM5fNQJRTH1uHnkgAm51rNLLBmOs/o1NRQs3kghQ4P41cL6baQbNwhOsOK2AiYjI+oCsmTYI7nYk18JAHSKoGHoX75jwfhzv9rc+E2JkaYihh7nAlKE42PD2nKw8wsnCaIcA3slcNfdBxDE/kz6hQHj2HxjSOeUXyV9z2oNSn4+d78hERNpCBrsdGefPba8t9WpZwBU+SO0bZSzu61qr1dGiBK5uxvGgsCEBeXmcOhmxZu4SxLGvju5STuoxXocrSm2q4B+/o3DKCwyPTikqE/HcPLwoKGmlrc1VQWgf5puV8nB7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF9L7c8BWVpiszPzAdAnNL/OjGbbyqG4WtEn5uBwTt8=;
 b=Y4pNtfkS003u2C2NmWMSEDcxnxbMh2d47syKTiGk3ci83+Kxl0wwiGKStZ7ngku6SGGwshoI+ploDcktLmw7PaIKTCMjrznKJUbOUnIVNAyq2mAPbKrv/7kq0KlDRIpati5N4eykS+0CQKQXvsA/heyOoQ7w2ICmqGDe8Hm5aI0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5524.jpnprd01.prod.outlook.com
 (2603:1096:604:a6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 01:30:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:30:02 +0000
Message-ID: <87mso8ozmv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC 12/12] ASoC: doc: remove dpcm_xxx flags
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
Date: Thu, 30 May 2024 01:30:01 +0000
X-ClientProxiedBy: TYCP286CA0062.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b70210-3470-4b8b-75fb-08dc804806e3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|7416005|366007|1800799015|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JhGh0vN6zwXbmcAoFSQ64g5hIpYwJgzFsPg4kWGQjDMquuEUfVbFlF4oi+1/?=
 =?us-ascii?Q?lqTZZsQNSheDXO0b1e7mQu8BZR2TflGXMXdfe0X8UzJp7tI82AluluTO+86A?=
 =?us-ascii?Q?8YmfX2kp7+aWyAenzVIa8QzK0sXTX4cSKSp306b2pFT1NVhc3tFdSNLhx92a?=
 =?us-ascii?Q?fFB06YzrJr+6/OVhoOrBNR8qQzBCt38/BmoYoguO+8TnCe/V/UjQotBka6Xv?=
 =?us-ascii?Q?Jlv7arJNe7wtmavDEbjsSDwUakb5nSHp82ceaFz+LiMYwLcGgBsQmiOtHv9j?=
 =?us-ascii?Q?gxanuILKQg1EIquocKWog9hyC68HVb1fBQBWphY82YlOWE1V9siI4ppSbx8r?=
 =?us-ascii?Q?HIWpp0v0nO6oynvDAcDHe9kqpf4PG6ojgxkXa5byjXLkPrUerTBrnmJs7FEh?=
 =?us-ascii?Q?AzGf8E9Cibtl9rozumgtAnlvKiHGldjCnjjQJ0sZ0FXUaFL21LS3tZeFVpsE?=
 =?us-ascii?Q?84lcRQLf6Kv98IgP71u+UIBUhtuqcqG1+o3PB1OAm3g0yq1WI5axRqsPpt7F?=
 =?us-ascii?Q?jBwZFckpvrTk3krVBxyfCbBYfdLxWSp5Cf1+mG/KTI6NWEHUq3PtGXgrG+A7?=
 =?us-ascii?Q?+REm8uoCWWtKlOtZmGCLcSOKJPHKbk1/0/Sgb/qrBpNAmTQugSnkQ7Dc3VEu?=
 =?us-ascii?Q?5eYZRS9xX05qPyfjFGyRKNE9kt+nrfyjglWoF4Wq5SZ6jzSrkTz2YKKFSqTj?=
 =?us-ascii?Q?TWXOl+NxfMHM7BpxY/LCyW8tDchFnTCCadlfUUy49KDBmQEjTBJ+i8Ky6Kin?=
 =?us-ascii?Q?rm48zarw0hXXuD0/TAPb2VTEsakROm31fOCmKa5TNyzDkreXzBY5K3cDJqhz?=
 =?us-ascii?Q?lIMOWtNTmeMBLG9bFCcAzu7hlTVB06va+OgBpAHQcWguQkcM+W/ja3PVnEq3?=
 =?us-ascii?Q?JFIjdO/a4//yTQykckEbTB+XxotHwb//P26DUbVgjQxv/0okA9eU9wW0eut/?=
 =?us-ascii?Q?4vrd08tGcnP5pQFOsDXkiENrEMOWvG/GWfUDEPCUhivxupfpMtvIm5QeV8s4?=
 =?us-ascii?Q?jL7ctxnB8Edhnz2iOT9o4SOy2rl9HDdiAvTgF1forwXgeg7SLu7mKW1vG6CJ?=
 =?us-ascii?Q?d97npPGITQEUFeINXbufhdeAEDiVrARr9xoXvx4SphjbQ4b2prf8mdgVAf3H?=
 =?us-ascii?Q?0Aog9/bDfPj+X7KxwPm3WZ3eVPKoSaxkHyr8iHl7XND/Ho8j50J6h42PdK+R?=
 =?us-ascii?Q?ag148jCqhQFrqOa3u7RItDYcPE5D4RnYcUpDNXLwL6bNj2vmuaW4cyVwQjJU?=
 =?us-ascii?Q?9BWpvqfduVpdpk0J1ofWUkZ25t/Q549VSlWcXWsCYkMLAP/n61EybN5k0IXO?=
 =?us-ascii?Q?uZiEqS2q/72kVmCQq9OzjStmfyfvXP2mMKTZqpsjhv2ppE/CW+ga7EgnK6md?=
 =?us-ascii?Q?9cH4cgg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c7dKLCvnKJ0cmGcQCzeNE8guQyKlKR9uD/8XBHvyp9kPq2wXNAJUDgIndtEt?=
 =?us-ascii?Q?oh9lNgkZ0QXqI+TJELtrTT1Qqt9zYRjcBG4d01PlmUwvDi8PGTWjEwzyhnDd?=
 =?us-ascii?Q?sCpX1m22bIJzfUBJ55UE6kt6mg4ftfkwfnmPfEPuJzjKcJINU4POZ63xBgnq?=
 =?us-ascii?Q?gJBhnUSF6NaphPYo9yy8+r/0d9ODmh9nJqAVvhbH/dlZUYiexyYjLi/qgQk/?=
 =?us-ascii?Q?Yj29wHCSVwtiIvA2YHmSqXiYY8FN0zjkBd0E9ke9JxcFUTD+aF0NrzOs1pac?=
 =?us-ascii?Q?2kcH3KwWd5C9C+SuLoKTEbIsz89FFHppi+ZAg/rH2tBdv1HnrPaUm33M9uvC?=
 =?us-ascii?Q?BRziKarLpZRN3jrIy8IykUGqDcLsqooSsBlxdnnar7xYMixvdtu+DPduGFRm?=
 =?us-ascii?Q?QD7A8W6trAcDqGXof1NuI07K3SyLDWDVZvdSFIaiHOwGDLFw9PTkwsdirPO2?=
 =?us-ascii?Q?UsIgUTIVhaOlWmb6ONjIN5HJG/+ZvBnI6OpnfzJU8VvvcOcIiJOAk8bN5wqp?=
 =?us-ascii?Q?YjjjAnRCOnLIfOnEiBIt8l4p1Zi+eR81oQCYLPjxf8nfQcfwHra2zMPWJz0c?=
 =?us-ascii?Q?D4AoUfJu33EO4m6+ewTYchCFB3aIrt7Upui1T0tErHVwbUHWos9/mWHllwGB?=
 =?us-ascii?Q?d6I5mJolz4Lw3uGOIiOYDnWzGlErIj7D/lXN5e0krpg53AzLErTeNJCSWmmM?=
 =?us-ascii?Q?RfBLTqahb00wjE+BfZiSjxguouv+G0MhKu2diTFFx15kNLE8XjGaqJT/cRoh?=
 =?us-ascii?Q?5RkuVGQCO+T22v63c2YoeUQ5EXUQtr6EwgglwP1Goijxq7yxWHgRP5MJF3uQ?=
 =?us-ascii?Q?yRFGkh+qhcR3UaTun7I3oNG85VXuMzeEvyiqkc0NuwF0dTH5vVr+b8bFoeoh?=
 =?us-ascii?Q?uw8yIrLORHzXKyWZD1TFk0XHm1cOE5TQISq8S1ybnvsQFDrtkPKAfQj3jLZh?=
 =?us-ascii?Q?mTZX3YI7jSfUHEBhExpt6XKPYxRo5AF6KJx/0SFRB5zZ0qO5yFYS4xnpGyBY?=
 =?us-ascii?Q?IZn86469p4LKuwUsp0Gd9rQIBNgkJyp/uIejgdOiPOvkedoqSfSGG7kSEoIB?=
 =?us-ascii?Q?QBidfotsb0T6goVEDDnJbUWFlL7KE+S0m095xyDqN2cdFDwtpmAjH7fHPG0X?=
 =?us-ascii?Q?bByndZ1W/XEQchulUbbLFCKIcWNzy1KBgoJQN4F8d++9Kqy78Ji0rrttAa4o?=
 =?us-ascii?Q?4I7skmCDLVJvwkTgCpOtCFHZJ+3X+ZqPyQChKOXgv81uhfLXcJo5KFOQhfhI?=
 =?us-ascii?Q?GsvFcASdfW5TMyKtjfLuwRHcxzYTIdqDGz+cqUHcwhhUivTXRUrCJXXfjHVa?=
 =?us-ascii?Q?QWP7m+qCOotnSbxhStAmKfAH+ZFOpE+RIMIZNELP4g80unTM0KBnHpArYLOM?=
 =?us-ascii?Q?w8bPsQYLvM5xxBnhSz2LCQd9loZRlE298dqRgcCPLIvDQl7/U0pmbVpQQRDl?=
 =?us-ascii?Q?sS2V+VHyNtoV00QTZTE1s2scnUvIM2YKuT/F9p0FG7m4oidrD0EwRRzKGKxi?=
 =?us-ascii?Q?fRJlYMDqKfwesNJ9k/VgIJnYEJ6P0eap7JVcU6RultQf7KedRSOczHnfF+Pn?=
 =?us-ascii?Q?Yy9bACAoloe17CrAR3AkRltWm9PTtPdu4zoOov8g03j0mgdBpO2CpJjNaa+N?=
 =?us-ascii?Q?IkflT1fFct3lg0ZiChmT7MY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e3b70210-3470-4b8b-75fb-08dc804806e3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:30:02.2611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JD6HhrfAQUfdVDUCjAjQF7UHXOTt4IEO+5a0r5VPW6/Qjt05LpYbXab6tSF6qqSzWnPCec3WMuN3Uj4nvYTnBFHXvQdGb7rPIqcR6VB+LTrUtwMZtmE2Y9L+2zJI8Abf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5524
Message-ID-Hash: N6AVHQUYHFZMTZSSD4FLW3C2TSRD7A7B
X-Message-ID-Hash: N6AVHQUYHFZMTZSSD4FLW3C2TSRD7A7B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N6AVHQUYHFZMTZSSD4FLW3C2TSRD7A7B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/sound/soc/dpcm.rst | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
index 2d7ad1d915043..02419a6f82132 100644
--- a/Documentation/sound/soc/dpcm.rst
+++ b/Documentation/sound/soc/dpcm.rst
@@ -157,15 +157,13 @@ FE DAI links are defined as follows :-
 		.codec_dai_name = "snd-soc-dummy-dai",
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
 	},
 	.....< other FE and BE DAI links here >
   };
 
 This FE DAI link is pretty similar to a regular DAI link except that we also
-set the DAI link to a DPCM FE with the ``dynamic = 1``. The supported FE stream
-directions should also be set with the ``dpcm_playback`` and ``dpcm_capture``
-flags. There is also an option to specify the ordering of the trigger call for
+set the DAI link to a DPCM FE with the ``dynamic = 1``.
+There is also an option to specify the ordering of the trigger call for
 each FE. This allows the ASoC core to trigger the DSP before or after the other
 components (as some DSPs have strong requirements for the ordering DAI/DSP
 start and stop sequences).
@@ -189,15 +187,12 @@ The BE DAIs are configured as follows :-
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = hswult_ssp0_fixup,
 		.ops = &haswell_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 	},
 	.....< other BE DAI links here >
   };
 
 This BE DAI link connects DAI0 to the codec (in this case RT5460 AIF1). It sets
-the ``no_pcm`` flag to mark it has a BE and sets flags for supported stream
-directions using ``dpcm_playback`` and ``dpcm_capture`` above.
+the ``no_pcm`` flag to mark it has a BE.
 
 The BE has also flags set for ignoring suspend and PM down time. This allows
 the BE to work in a hostless mode where the host CPU is not transferring data
-- 
2.43.0

