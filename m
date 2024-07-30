Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D08E94031B
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 03:07:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63EA4EBE;
	Tue, 30 Jul 2024 03:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63EA4EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722301673;
	bh=Uz/kPhm+sBwzmYBtIrAWuxVrZiYDofB26JFdChMs134=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NH/IoZhEnul0jcXswwuY3BAox0Y8OvkuWgT+FBxewGtiyShY5F2cArh7y2thQQCLG
	 hZQBXaX8DlUhD726BVo56h0d24jAH11/cGa08xBFXnChTwBm94Ttl8ouEfvmAr0LPX
	 Ug+QIz0mSEyzG5JfnFD0lNvZbvlOhv5dwMpscAo8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED64CF80613; Tue, 30 Jul 2024 03:06:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10112F80631;
	Tue, 30 Jul 2024 03:06:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07DE2F802DB; Tue, 30 Jul 2024 03:03:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63708F800C9
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 03:03:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63708F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Y0l4oqQi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHNM4yw/4tpGy78Dm2088keqxeZRKvlSjUTTVDLIOFVflyDR9qeZohVQRLb9Pbxo3mYLxMib1mPhqmeIvmmIKFZHtSxRyig0DZX1RSu7aNl18ZTgUTfyBaRr+iX24Q1hc/wlLLbTDh5d5XrmMp+Bf1Eb4om989dGT6Mrmx12EyXkDaPJ3Ntprbt6JuAPpJ9j2LNEUER3Opx3AYekyKm972te3ZrxzthRYoh2eL3CD1sEUzkIs4LQaUtQzwtgJn8W6A/P1jioTh66Ay5Odl30EgJHlYVrZujSX0y2iz8a4D0cfGt063kUvvmS64BZXOO4Epe9cNpLwa+wyPSvzw+yuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d07BmDK5flRTcQ0+f2XxaGi76mesJGwHsriDAB1CJ1A=;
 b=qfCgpnH4UijxuZOMRZH+ERg1dF5VDEw+7pWMmpKdRiyFfqqlmP2RB9QjphZh7qs4wsBLChIVw7EO5b3TYGzG/nNlLQZ+HOdT8jXOXOeGzI3FT+0jH69Xv3qNvqwaFm3PgjGPoK3aD3+Cpu9hgDZgB8uDTm8hAP/Hmd18l7u3MC6flC4sBQ/hsV2yYpzGZX3+kt86Z1c6SuKwezX6Aq/8+bmXyhqbxfOpvCnKzyr8I0P6tnTvIfPRTOrBGhNFN/A+QDKnLHDAco/fWq/xtVWQ1+yihRd1F/rhAEU95A+9L552at5J+Zr/4v++fW00W9mjV4GNYPSH3RocoHZC9zVmtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d07BmDK5flRTcQ0+f2XxaGi76mesJGwHsriDAB1CJ1A=;
 b=Y0l4oqQiogsdFZQ7V/GyprTLPoCxbs36z1UqZjXV598Te68Vdg2T4w7joKXkjsSi2ZGfwkhkiInP4AwO7rxTXWYxNJrAY8Gy+Rafkk1OMa7PsLpzcstYAMAD7xzhrxHluxHcgeIBTnpWOLfOq37CqhB18p2K6LYiPBG+FeoMXDU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12484.jpnprd01.prod.outlook.com
 (2603:1096:604:2f6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 01:03:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 01:03:09 +0000
Message-ID: <877cd3lmid.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 4/4] ASoC: Intel: sof_sdw: use playback/capture_only flags
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
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org,
	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87cymvlmki.wl-kuninori.morimoto.gx@renesas.com>
References: <87cymvlmki.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 01:03:07 +0000
X-ClientProxiedBy: TYCP286CA0226.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12484:EE_
X-MS-Office365-Filtering-Correlation-Id: b35b8924-a2a2-4393-0867-08dcb0336069
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LzhuE6S7FTCY8JV4E3zNKQ+i5PS37TT3plLNTNimkd7129ry5xrm1KzKhsb7?=
 =?us-ascii?Q?31dy1ERfQWsb1JU08Df3XAYV9hjbbQxNYSmTBG4d9c22uo+RnSEpzfMPlxuD?=
 =?us-ascii?Q?n7mLzi83otz0YWcdG/VdS3VX27O9GgafUpuhTzAP7t5/g6/cP28OBXAySjR7?=
 =?us-ascii?Q?Y+YfbesBF55gBAkvVlF5Z1dKJKIEMjNA8oI2/rrkfJL6/Yp9FyW2RQYflxPU?=
 =?us-ascii?Q?x+uAylYHQvuSXmnknmgM3b4cEGqHkYVi6SEkrfq/8z1y6R5ts9w6+hbjnETA?=
 =?us-ascii?Q?RuSceVq5REtMHQ5oS+xGnae/G4WDxVb44t9DsyqULTOjD9xJah24tIIokpKh?=
 =?us-ascii?Q?6I4Yn3Os9c1GYejT9/TbKwoCqQNsdW0qn/85sn66bumEvvLJ2aJnTnYVeYFz?=
 =?us-ascii?Q?xHg5etZpTB2l827ReabcMxEAEj5bBnRtGMUE7DQ/Z6p0w4kebKo9/3Gbyrsn?=
 =?us-ascii?Q?ZC98/2Lu9KGgveBe3XF3lxCiN90qCN/4GKAhwM5eg+sKTKYm5BkVqT5oB64M?=
 =?us-ascii?Q?2FP+EL+Wlo5pbanRpiS/IAE1D6uHwIn7jH0i9m84FBHTBJlP1LNF4wcraiC2?=
 =?us-ascii?Q?jyo0ioWLFmhG7Ky72IGfSvX8S41aRWhREeJYl8lHm+n/A5fXQakI8xOa+NK1?=
 =?us-ascii?Q?2DnkQnCgFN2gJyz9lHph2voDEY/XrksCWFu2czvJkF1rPCtjmuh+5fcJrQeC?=
 =?us-ascii?Q?EdGzi56h5DI5UxgRMSGykd03E6rYdRoZlLqBfrW0r+cdZZ6MSPVVPuTex9Lg?=
 =?us-ascii?Q?vSWuqjAZElyLW8DfRbN2YKzHhVNl+r5ky89cna7N1HuCT3tycmXr6fP+GMZX?=
 =?us-ascii?Q?vRu6FKKU7lh22krideaOMSkB3cZMWJIR7U8CWv+qpK3MMFEum01WrEM41DET?=
 =?us-ascii?Q?QTVPRpNljaSRADATK/WIYpq3korsbpPmX8R1UoPeLFSYKlMUOSl2c2Sm2lQy?=
 =?us-ascii?Q?kBeeEqNv+6O4jgLRxhjNi29hpYZ7YfbcB+h4IdWUcwnXwDFikkSVUSSyNINp?=
 =?us-ascii?Q?vFoH1+6hFnd98/HsFuXxKm7lNveu1u+B4voL0cREJYHrhT0l13Dj8YjRtoVf?=
 =?us-ascii?Q?22i//VS0r0sgKG0FbRgsHf5rOHef31wHSxKcE1+cGLYvhqvprtAyb9UtcHnV?=
 =?us-ascii?Q?GxLFa+Rs5kO6fAYuSyouKatqHSchpZ2jNiNpabU8JxVb8uJ94cQDxDbxLVGB?=
 =?us-ascii?Q?Hldx3QEyZ9F3cr9TTppE+R2sskqBw7aGYCaqiaw3h1W67qvmrbLM3Ptsl8tV?=
 =?us-ascii?Q?TdG+RfQrInFhQLEMtZWDm8VG4n6VZBJ1gTKJtccHaKhAQmtPzC1QUxyfs/YQ?=
 =?us-ascii?Q?8Z+fUbJ/SD4JX+lxGwiZ9x8UsOtFPYw3xepbLlPSFLGNybHX2C+UoES1vYxO?=
 =?us-ascii?Q?mmH8YTfShmNfwrlx90dDDh3rC3hwl6YSRroWUX8PRAJbPx0tVxk+VFka1aET?=
 =?us-ascii?Q?jIZU1FuBtew=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MGQmcfyLZzR/5AP04xnEHxecs4D8H0AhKKnF0/GM2ohF30/tZ8wDJ007nl8T?=
 =?us-ascii?Q?o8PbYA1Er/XhsNf48FtH1KRRrg1FOpz8poihFU7SoiguzPkHFHiryP+PZDJW?=
 =?us-ascii?Q?uhHDYJhF/6NlX+qVk21QWBe3bqEgnjwjWDaVprL9+Y5xTs8wqSS4E2ztQEW/?=
 =?us-ascii?Q?ZEFotHlcPIGlQWoERO7DyCCsPhsk8QBry8KbeOC4qmi9lUsUvbE01BzeKbad?=
 =?us-ascii?Q?dPnV5cKpH5W2YsKW3Uzx3+YpqaLe6/YM/4eEbep7bizIvCChGN0VtxtXoawM?=
 =?us-ascii?Q?tZ8qDs8ntvHWOEltFTAJn7yvIg65/qD5kFejWF0Y/yZ0ou11/yq61TyjJzcl?=
 =?us-ascii?Q?MSMA5x95qjZ+QFJZ32jBvBSXPCHv3dmEzyfv+lqjYU1hLf+3Dhic2XWUjhjx?=
 =?us-ascii?Q?yxmXD8GTfnBdQREfqZLsRR71JyfjM12ImEqKgZfbKztSnQCjmRK6A/uF+4IJ?=
 =?us-ascii?Q?GNKswD9TZPPiwodI898Lk1m6MNxsF0EL2nhg0aC+nYcdDkBJAtLOPjkbjV76?=
 =?us-ascii?Q?BxF1MGczINInGhPe7re4MhQePrIm3vxSeTG4uMLtBERyhZLkP5BzrYVmVpqY?=
 =?us-ascii?Q?rwgZcJAYl2SyAKHXGpI35RF9g8ovF6VljOfGWYvl6Dxi2du97JHpyvCQIEjU?=
 =?us-ascii?Q?2aM5zwzYSMFv8SeyydfJkFU4Eys7q7ALUDSoFYt7cRbrFGmkRTcYHBWii5VW?=
 =?us-ascii?Q?uR4EyMYwJnXuO1fpqqGpwNcv3I5W51ShgDZ4yjNBuAjz2p5HSWcMpyE+mvNT?=
 =?us-ascii?Q?BrxGNzEbfBNHvpIG2+8yw31G1fU6qm2uDJlegaVCuTrXNglhj7q68aDeCyF7?=
 =?us-ascii?Q?a0+pUn1yZRO3dGnx9ZBdfVGpnJN9kmCnmYiqOv03kY+SpqPoASD5Nh2ViirO?=
 =?us-ascii?Q?m6roSqb+wuKu/ZCpYrxx75+O6mkWi9bXCxdS+rSUW+CDbZGH0Yi3X34WXwe5?=
 =?us-ascii?Q?lQYByEOC2mEodeGXUmuTPD9MYFQ8hovfSObCa6OrFGo2z6CzEvD1Sih/FJWt?=
 =?us-ascii?Q?fnVR+FiBZ38W701AYwQ5PLaZ+hM+W1WgdGZA9C6yn8gOdnBd6903qnzxma7U?=
 =?us-ascii?Q?oEvW2fH60x/Z6JMn8qUIqX6VpXtW92lJrUXS2kYxvxzGmicuAqq1J7ohJ16P?=
 =?us-ascii?Q?jEHQ6YfQzgo3dfHp5H+5oOour1vhp0zGsLBGhQU4xomkLDWqDrYB5yPsYy1+?=
 =?us-ascii?Q?1e91e/r5LhJOJ1LlPVCCbwB7lDC+47llq7BYwwSCk6kQ9i6XIVIlfnsr9cyo?=
 =?us-ascii?Q?d8XFCDsqov6q1F9O3IDETJUBwiKBUxK4hwTxT6jfXQ0P4bfLU/APGLGeMsre?=
 =?us-ascii?Q?Xkq6sKIVTQITEShwl/HafIV6y1+OV5b4kZXhMXDFb35zZ+5c/4t/wk2hjKfs?=
 =?us-ascii?Q?8agKUlsdolGAHpJ6hoKvGgOkuCcci2zgWBLsd3dYoShYhlVKyS9AMV+HfRvk?=
 =?us-ascii?Q?auEKSa44EzvgH7eoQBUXkfUWjRj2RG9SKCvykbHjXHNfhxhicexePVqYKju7?=
 =?us-ascii?Q?Qg3GB+Re9eLTmAarpSj4QL4apxMGlzAi3gggES2hfTU8gHzf0ZWjLKIgfBxV?=
 =?us-ascii?Q?x2HsaeMksIkQtp4N4fvA6jDrgRKsvvIKj8RjcXsTt59+ZZyiwv9kDQJWDx6O?=
 =?us-ascii?Q?0OVACVfnhkGgGMbxRZVqTUE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b35b8924-a2a2-4393-0867-08dcb0336069
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 01:03:08.9756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 q8EDUJ2BGlab+gfaviJXpGPcS2xLqxTblHsAl3Pax2ZzdDzfjEshquDy9Djs4jT2Uz7yowyrkk0uc0uSo6LpHMNejMbx6aMxFZ5/82vbtrw/H2hJyPSBMpwNJIqpi/Su
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12484
Message-ID-Hash: TROXLZ2HGPMJ3PA6XCNWUP2SRBHEK6ZH
X-Message-ID-Hash: TROXLZ2HGPMJ3PA6XCNWUP2SRBHEK6ZH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TROXLZ2HGPMJ3PA6XCNWUP2SRBHEK6ZH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Prepare for removal of dpcm_playback and dpcm_capture flags in
dailinks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/boards/sof_sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index e5feaef669d14..17581473343f3 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1289,8 +1289,8 @@ static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links
 	dai_links->num_cpus = cpus_num;
 	dai_links->codecs = codecs;
 	dai_links->num_codecs = codecs_num;
-	dai_links->dpcm_playback = playback;
-	dai_links->dpcm_capture = capture;
+	dai_links->playback_only = playback && !capture;
+	dai_links->capture_only = !playback && capture;
 	dai_links->init = init;
 	dai_links->ops = ops;
 }
-- 
2.43.0

