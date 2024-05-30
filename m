Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D04E8D42E6
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 03:29:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 030E893A;
	Thu, 30 May 2024 03:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 030E893A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717032582;
	bh=/rqr3RXrzsY0MEtN1uPNIst2O1A3/Doh5YFHxh/YX98=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UE3IBPZvwQscfCnLDZ278Ve/4a2ADQOCw+nCyk4DFURcDL+l3Sl2cDxS9u50oloD3
	 mscyUCqKeCGaQnABDiGJ5GxwFjDVS4CdiEj7/31Wst0uzmtU2KPffX9b8JXYXS3j+i
	 SXtAS2blJGP2+RvhABFEcxHC5CNwdrh2UZv+x4XA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D8FCF805C4; Thu, 30 May 2024 03:29:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CF2CF805C1;
	Thu, 30 May 2024 03:29:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CE01F80494; Thu, 30 May 2024 03:29:03 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 0ED1FF804E5
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 03:28:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ED1FF804E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dIdiLveE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFDEnUH0yMAzpyatPwcUL53FNLaHpGZUc5rZ8dOTRQCYlk65TPzVYuKG5P8fSTq9qYz5csHEFg9j6qcNLRt3kaqcz+lnRzHkdMQuSfUMOqdqI2MRstA1OzmupjK2WH5G6tQuS96WDKiyUstbv7VWE5ut4AraPONme5sFlz8DnEYRfAQizjKP1fFMmYZiKd3YdDtyIlkgx6Fdl12LlxxdezYiq2l9em80cIfPsoCTh0q3MiBiA64jjhveJuFz+trQvMv+20oR/k2t8tkicZNkmICV2gJkF8g4Z1e9k8+t0DdEokRNcZrnc75b5x9AXUze+xMDJj92FvILN6HSTd/c3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2fs1TdLV0HIWZEiHV6zAkAg4CdhnKxrdlB5gkwc4iY=;
 b=lscbX82WR8q+zHSnsO1iB+kW67Fs3acIFiImmR7uYM+zUBzoh+/hFXe2YfO0+v2Y/9id12Qfdw9+byeUHq3URPg3HT/FPYaaCouDCOXaRFFCQR9N9D5FTOUuN9Kg0eidZiWQpauv/2MqBZDTO2rBwSSbivBHBuh1dmrzLb6w/AHrfatA9y0TPGr0WOWM+bPW4JXMEW2Fyj6neQxThotRtYJDKgJlKQmNKnbxwrDXC50qlKCBZM4Q5Rc4NkQD/8gNdSri2/cy4k1CUGp/TpYyiYazT9FsGpYOo0jUw/rruVq+ggZlHQpLBh4svWGZku+b0jy0bxyBcYPQwPloUX8grg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2fs1TdLV0HIWZEiHV6zAkAg4CdhnKxrdlB5gkwc4iY=;
 b=dIdiLveEgGCa5VEAREoLjcOUei8BWw7m1v7qpbG5t/uPtHLoinVuir8iwUONA0XyHufxKQG/kK6wJp8HIDZbg6sohYyXitJtqYCCH+NQWNslxAWbApDHT61lIuKukWpzCsdFVAo5scxxoxYwaPM9QxxPKqoz7V0b3iZ43yjsdGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5524.jpnprd01.prod.outlook.com
 (2603:1096:604:a6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 01:28:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:28:49 +0000
Message-ID: <8734q0qe9c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC 01/12] ASoC: amd: remove dpcm_xxx flags
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
Date: Thu, 30 May 2024 01:28:48 +0000
X-ClientProxiedBy: TY1PR01CA0188.jpnprd01.prod.outlook.com (2603:1096:403::18)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: fdbfd386-ce87-4eff-4d80-08dc8047db68
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|7416005|366007|1800799015|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Vs2/2WcN3OJksAqH4VIoLJBD5nTIPuHSD0SvbhPK0ReA6m/PDda7d0o5scM4?=
 =?us-ascii?Q?Q8153kdM3yM/JcmFSuAFyaA5UEznk0W9Bvo7vWUeMZQB8veq1nTGtIP1iVXd?=
 =?us-ascii?Q?uKhcJSWE8r7zo/gPkGA0ViEReoz5Ae0SzhRIJAWAYY4cQvFEsD9fayEbI6UZ?=
 =?us-ascii?Q?Q/RjSq3rCgff01imDY+cOQifJkMpDgLYKVbKKInBXvtyphTwruomfSvUGcvq?=
 =?us-ascii?Q?b/5dLAZeTj6U8Ez3mwN/oi/46k9zgjtfNU35TkRUDvqczXbldp//HURvlkg5?=
 =?us-ascii?Q?RUIOFUjRztrWTjzs2cSvigejfFw22EpRLW0rmNm1ls4hXIWgbbUzB7Em/q5u?=
 =?us-ascii?Q?wOAo9wmJ7RzBKVE6bm2SOtBY7oyIqdEpoXtpHgn8/8Y8g5NfOgfG0+EH5tA0?=
 =?us-ascii?Q?I18rLIimSykgEKJPwrqhunht13hUFkIfzn9zvkKE7UJrT7Hfl9D9LPtmOYSq?=
 =?us-ascii?Q?mesBiYYS4fB9nXEGE2jYlIN10qcvg7E2OJwp3Et+cfOFS7RuD+2V60sVvVe6?=
 =?us-ascii?Q?e5MoiXPKZ1G3r6fydVlqRS/FB3M3e5q6WRGcsUEZkTA4nXQpL/tXejbyslCd?=
 =?us-ascii?Q?eEvKgSHdfjW3xmSAhEUKpS7cahoSUXWBJmwbHeuXfC01zd+hsH+fyha0EBVJ?=
 =?us-ascii?Q?UIARY1Zkxou0r7No7ew+408AZghSr7NQhJdcPiLxO5Raij2925mJ2+uiOyW5?=
 =?us-ascii?Q?hm2ZE+LkS7+UDmAbwaPW5MPLYXDnF6SRm+qgIK0kCKR/eOIR1v9//PNKmXPs?=
 =?us-ascii?Q?XmJcylh90P5RmtUECsj41Q3q+QYEPZg5Y84HlvjawwA51pFizDo7JQnJF55R?=
 =?us-ascii?Q?OIWFVxlbalch7/jzrx/WaHYJy3DATaTNrHRicoTdHCNmlIZy7D1x0ySGNLsM?=
 =?us-ascii?Q?5dVN/CKIpdH9H36ef7Tl7LN9iS3m8+MNgGWxt7vA9ACkLdOQOtU5PDE8uKsw?=
 =?us-ascii?Q?G69weWkwEA5l9B27AhkFU1HV9PqzddAE/CAaLq9DSQxQfxDeIaGY0O3XehDc?=
 =?us-ascii?Q?r8L0IIKZKZqtWZC8TGdeY3W/mfiyq3vi7ExkOSJvuI3TnPktsc/MN1FyxEkd?=
 =?us-ascii?Q?x1xzxx1b7y8lSgqw08waUlqcxgQNkN7c3CQq+bNIMci6B9Q7jF4dnyrnzbDN?=
 =?us-ascii?Q?IetfdQHsG/7pKJRldOWpsdHHebVKtkWRhrv+LcEz4nr4UJnGx2oCipt2EP42?=
 =?us-ascii?Q?uw5Ml7PiovPzaO5p3/lqFisOLOlsEH8rsr+7exLh1a7fE8FzQQbqD0FpIJ16?=
 =?us-ascii?Q?VgdAfaf2Wbbx6SJuPM9NFEeSVyUXtCH1wb+4ydfHM6hoT0W42B5Ou2vQtsTZ?=
 =?us-ascii?Q?rUQl4rHOz+1p/XqN/RNvMIvfz77d5Bi32y22YmPGf0PYP9K6Nm6JuTqq3Kyg?=
 =?us-ascii?Q?26/UjdU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mGDfNP2DroMmYkhnpTqYU6NtlH8TlQ2fK07essg90M3NANe7AtNk9dC8+FLy?=
 =?us-ascii?Q?kaZshPk0+UvMw429q6+KsaDhvODipIb8Ce8towaJqLkN2me8W4E7SdW8O+W/?=
 =?us-ascii?Q?uOPIQYfT7OHhtf3hy1PXnLIldALoIvTgemsb575lMMs8/7koPcFY+JKg7IVx?=
 =?us-ascii?Q?4JCDLmJdFY79pKQw7AqOB9oKRwDF0FxDflUr3eDkPFjG+fR4hio8uLmw1ZgY?=
 =?us-ascii?Q?3GHBR0RdO/9ThD9cObGPdZYW8mb4yGbULF5rdQl3up+gN7A4ctoPsc783dul?=
 =?us-ascii?Q?rOVbmzrj03rUD6TA+/Kz6AaCbc44h6RLWft2i8GKe6wit1tVupJhscputzC0?=
 =?us-ascii?Q?TfFIL8F11O4MHPmOjYcI329DkTMIs+jhiNDGC6KI1EwrBXIYFxolevmrH2/E?=
 =?us-ascii?Q?ecIe8N1XYwYJz/QyDhfxOAWe6mhQm1kBy+HAdFde9+ysQKOF7+HnizoNK0Yw?=
 =?us-ascii?Q?9Rgg6JvHXtr/XtB5GntOr5SPRWb6Iqpg1/GNbBpRixFrkLNMGXELJW3Rlcki?=
 =?us-ascii?Q?ZjtTvIopAvjEu4TEglwNKlFIqbYLf70q31JibjNOGpZ7B7SNED3Yp+0Jpkoi?=
 =?us-ascii?Q?iZitofjXqt5nnWljMVwJ3jNgT3Uvt0TW4ArTqw2RY9wXRTviSabnIB3RGz/r?=
 =?us-ascii?Q?ZX5M5IS2RtKsxL1k9gzoz7U+q9nsX0uST1jkz8AvRC8zJwihC0h+jqCpYRq/?=
 =?us-ascii?Q?/C1CZxVoyNyba42icc8eI77E7A4blA9Hfu79IQxIYpOuEcC0EoR6djo/JCG5?=
 =?us-ascii?Q?qgY52gSR7VB5h4ipBFVjmlQvynNulbffYS2NQ3NogYK43Nz0W8dJrhnRO/eO?=
 =?us-ascii?Q?Hpkyhz97ToTvz8NDQ2XH6PtE4IFyJ/64NMvhYJB5S/JHP6Q0s1BYNHQtSyes?=
 =?us-ascii?Q?vKtXiWmRbw8yNe9eD9q3PSydGFifPZ8x3dbYnXYBexoZAPM7zFjaVi4C9wCi?=
 =?us-ascii?Q?RDf+xCmT+rcv78Vl9r1a4t6Y0pB5pQtChIXL74EsxncFcC1XmUMUFtRjGJS0?=
 =?us-ascii?Q?t3v5WQEDr+t2NLl/RnBce9jvro/hFNcf2a5JSzaYqfRfmtmn3D81ztc0J5kq?=
 =?us-ascii?Q?HY9MmHLqp6R6G5L+ZTlkig5hwL8HlnHZX1kCWF5lElh8JOLz/ftbhH71pfps?=
 =?us-ascii?Q?OFslIH+PodredoLI3gx6mPeOA48Uac4g4+DcUXVPtvlUlx5NUm84RljTDEnH?=
 =?us-ascii?Q?VCDYKntYKg6cU1IzfZlinv0tYBgzgogBo7KQAt85cprIHr+wnvDLPQ+d1SWk?=
 =?us-ascii?Q?FCEjhMjY+ijGcsfmiLHc2DCX8DxVKw8wTdYfdIRMsLgspJ1GlP3PO2CcnWDG?=
 =?us-ascii?Q?lrYl5+2U6TOxsLe9MYISuFZX5fxxxFtRel0lF+rBVfk0FRwpIPM+Wu4aKZQ6?=
 =?us-ascii?Q?5bFmuuCLeB8+ww9E4LCaHFJPf2JgDjGm+cEkfQd5hmHlt/KETmo1ZSUKyLSY?=
 =?us-ascii?Q?cc2qgw95S1e0HR1yo6OZ0/00jla7RViwOKtzyTMO3R5KmheAkeNc0vFVDhvg?=
 =?us-ascii?Q?4G0PlBYx6HolWuaLa5TPwUbr3echG0kt9HymiJKW6SaiIZQwVJ4rrJI2kLgC?=
 =?us-ascii?Q?9rR56F027ElKsRcq1j5YyzC5aD/Mmumjp1WPHoBsSNKsu3rVS/Gvq/7+S6Fq?=
 =?us-ascii?Q?4po3IdOoqCpIOUOq1eiTul0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fdbfd386-ce87-4eff-4d80-08dc8047db68
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:28:49.3190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 H7IK/LTgpcA3xH0fZ7vP5qPWQJtuEtfNf0o5UKVgtmw6F4icE0eqOkeropkfP7noppintCSM2L8wMVhgCI1RAqh/h1OeYR4vMU9TQeDYSts+FmxAbU3vy+hyLNwdu9G1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5524
Message-ID-Hash: AYZZEY4RY52OENQOJ5RML7DVQP5CMSLS
X-Message-ID-Hash: AYZZEY4RY52OENQOJ5RML7DVQP5CMSLS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AYZZEY4RY52OENQOJ5RML7DVQP5CMSLS/>
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
 sound/soc/amd/acp-da7219-max98357a.c | 20 ++++++++++----------
 sound/soc/amd/acp-es8336.c           |  2 --
 sound/soc/amd/acp/acp-mach-common.c  | 24 +++++++-----------------
 sound/soc/amd/acp3x-rt5682-max9836.c |  6 ++----
 sound/soc/amd/vangogh/acp5x-mach.c   |  6 ------
 5 files changed, 19 insertions(+), 39 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 77cf72082e73d..02b04f355ca66 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -542,7 +542,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_da7219_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_play_ops,
 		SND_SOC_DAILINK_REG(designware1, dlgs, platform),
@@ -552,7 +552,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, dlgs, platform),
@@ -562,7 +562,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -573,7 +573,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -584,7 +584,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
@@ -598,7 +598,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_rt5682_init,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_play_ops,
 		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
@@ -608,7 +608,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
@@ -618,7 +618,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
@@ -629,7 +629,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC0 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
@@ -640,7 +640,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.stream_name = "DMIC1 Capture",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index e079b3218c6f4..785d34127a033 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -150,8 +150,6 @@ static struct snd_soc_dai_link st_dai_es8336[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
-		.dpcm_capture = 1,
-		.dpcm_playback = 1,
 		.init = st_es8336_init,
 		.ops = &st_es8336_ops,
 		SND_SOC_DAILINK_REG(designware1, codec, platform),
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index a36300a4ed8a6..e40691b219af6 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1407,8 +1407,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_sp);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -1444,8 +1442,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
@@ -1480,7 +1476,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		}
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1512,7 +1508,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_hs_virtual);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
@@ -1527,7 +1523,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 			links[i].init = acp_card_maxim_init;
 		}
 		if (drv_data->amp_codec_id == MAX98388) {
-			links[i].dpcm_capture = 1;
+			links[i].playback_only = 0;
 			links[i].codecs = max98388;
 			links[i].num_codecs = ARRAY_SIZE(max98388);
 			links[i].ops = &acp_max98388_ops;
@@ -1553,8 +1549,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_bt);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 		if (!drv_data->bt_codec_id) {
@@ -1574,7 +1568,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(sof_dmic);
 		links[i].platforms = sof_component;
 		links[i].num_platforms = ARRAY_SIZE(sof_component);
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 		links[i].nonatomic = true;
 		links[i].no_pcm = 1;
 	}
@@ -1613,8 +1607,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1657,8 +1649,6 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
-		links[i].dpcm_playback = 1;
-		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1686,7 +1676,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].num_cpus = ARRAY_SIZE(i2s_sp);
 		links[i].platforms = platform_component;
 		links[i].num_platforms = ARRAY_SIZE(platform_component);
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1724,7 +1714,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].platforms = platform_component;
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
-		links[i].dpcm_playback = 1;
+		links[i].playback_only = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
 			links[i].codecs = &snd_soc_dummy_dlc;
@@ -1774,7 +1764,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].num_platforms = ARRAY_SIZE(platform_component);
 		}
 		links[i].ops = &acp_card_dmic_ops;
-		links[i].dpcm_capture = 1;
+		links[i].capture_only = 1;
 	}
 
 	card->dai_link = links;
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 357dfd016bafd..4ca1978020a96 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -317,8 +317,6 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = acp3x_5682_init,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp3x_5682_ops,
 		SND_SOC_DAILINK_REG(acp3x_i2s, rt5682, platform),
 	},
@@ -327,7 +325,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "HiFi Playback",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.ops = &acp3x_max_play_ops,
 		.cpus = acp3x_bt,
 		.num_cpus = ARRAY_SIZE(acp3x_bt),
@@ -339,7 +337,7 @@ static struct snd_soc_dai_link acp3x_dai[] = {
 		.stream_name = "Capture DMIC0",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.ops = &acp3x_ec_cap0_ops,
 		SND_SOC_DAILINK_REG(acp3x_bt, cros_ec, platform),
 	},
diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index 7878e061ecb98..2ca904db82abe 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -276,8 +276,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -288,7 +286,6 @@ static struct snd_soc_dai_link acp5x_8821_35l41_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_cs35l41_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, cs35l41, platform),
@@ -375,8 +372,6 @@ static struct snd_soc_dai_link acp5x_8821_98388_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &acp5x_8821_ops,
 		.init = acp5x_8821_init,
 		SND_SOC_DAILINK_REG(acp5x_i2s, nau8821, platform),
@@ -387,7 +382,6 @@ static struct snd_soc_dai_link acp5x_8821_98388_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			   SND_SOC_DAIFMT_NB_NF |
 			   SND_SOC_DAIFMT_CBC_CFC,
-		.dpcm_playback = 1,
 		.playback_only = 1,
 		.ops = &acp5x_max98388_play_ops,
 		SND_SOC_DAILINK_REG(acp5x_bt, max98388, platform),
-- 
2.43.0

