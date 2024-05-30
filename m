Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADFC8D42CD
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 03:21:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5656AA4D;
	Thu, 30 May 2024 03:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5656AA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717032094;
	bh=iSU3JJsNU5z33Am48uwyctCzLsp+FdUOPoHqbrUbFKY=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WkA5/xC108JJzYsG7BHfphMsQIOIUhrYlaqkgq175nSb7w6lLZB0h7MelLMzxNhpu
	 tCG+OKpn9ZGz5T4U+PtZ3UTrPnVT2szzP9gHl9m3WJAWMQIpJVbnJWSabIL7rS0CH8
	 FiDU5G+khz20DezlWPDBgNkmRsK27XnoltqR+3f4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2E44F805FA; Thu, 30 May 2024 03:20:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 053BFF805EF;
	Thu, 30 May 2024 03:20:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FA9BF8026D; Thu, 30 May 2024 03:18:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170110000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DB8DF80051
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 03:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DB8DF80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UBb3v1hH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAdp6IPGXT15QR62rO8A7XFGkmmQxiB1OgoCNAbEC4hSvKURyPA55CKGU3M7VuUKXouo1h5G18g3HOvNRB2ebbffYV7Wi/5RZuHoSkDn1Qy7iihfb23qv7buq8UcfCbQoVNQDCyppy+lgZgJ3wozcvQNSO7VBcV2pJqFRLEaWO6F6qImUDrvXrVJLjFdDVDmbIsPonWlmv2El2dECuzfyqHjkxkMcabl6M1wmh3I9h5MjajX+84VjLUzZjEeCythWPdtumAM4iMyLj7Yv5bFB7kcTvpsr+e/lCp6nkU7fi7l/rVckY4ELPjMVAgi7Xgxvfz/ebmlH/dKSdFw0ol0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W38nidIvKGQqFNX3kjmn0/hAzSh3plyKNuEVs3DX0iE=;
 b=iWDosUTxi6RpSAVl1eTkGLABEUW3S2JDlYlUggL0cV432cpLIXLAAbYymrGiHN4yAbMChN5u/bXLdXmF4nuYdeIhzXqIrKpXYQH3xhSxp8AB+Bycbeg+s2tuHmsvby0uAlc6N6N1K5p8UM3O3Mm88PbherL+w+nhy7z/1xUSfoQVLL0ywO8aSKrEO5sJGCmjutW9zLjD+a74iSUfgT9NXNGSWDe5xuixpOXSi/b905wHOVxJ1VgquC9CC4spCJuMLe/4GhZPVBMdQ30KT1dp+D4ryWDagZla6mzTrmokECSifQMTKY7NkLVANuTeQXgBPDbU4WdBey6yBj5rXayStQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W38nidIvKGQqFNX3kjmn0/hAzSh3plyKNuEVs3DX0iE=;
 b=UBb3v1hHfNTddciawW244WwSTslTXftjRHcYHHftf2CPwzc8bM1UWbTPWm7TcV332N9klDRL0po4ZEp4IfqXhxmg0lgeEwNDqHDUyCazrrfWt0EwpRip6Orsj0lJqt23+c1FPIol1Q4HzaWG5V5Z7oPyN/Rgqtq1W1Pi7eV5QTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6933.jpnprd01.prod.outlook.com
 (2603:1096:604:12c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Thu, 30 May
 2024 01:18:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:18:12 +0000
Message-ID: <877cfcqer0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 3/4] ASoC: amlogic: do not use dpcm_playback/capture flags
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
In-Reply-To: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 01:18:11 +0000
X-ClientProxiedBy: TYAPR01CA0013.jpnprd01.prod.outlook.com (2603:1096:404::25)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b96f8af-032b-406c-c7ca-08dc80465fba
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|7416005|1800799015|376005|366007|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?44ceqGNiq8c4Ie2L+0HU4P8yYvD87PHZ0mBZwTrh96GvWNjA3Gl/GqpnHIGt?=
 =?us-ascii?Q?2ob4/4D6/7OJYt4FmYCn9fSY8QHrXhhr5NITdYCzr1Utn63gdN4PEjfdX3Nm?=
 =?us-ascii?Q?5SC5fLB2IWPEvlZXOna7MxzGqOMu2eWmgM4aMAP0eRNJABRBcCa/SVLGshXl?=
 =?us-ascii?Q?hNK3CZHUDnmjplTO0bE1LFzE1k25hch31IAVp1LLCcAx8n1WK66/EzwDj2mR?=
 =?us-ascii?Q?VXbHEnDUfnslAuj3bsHp48+4gtBj7p4lmJGjiIO6CVEJp4b0d+IrA2rSAV+p?=
 =?us-ascii?Q?4ko+saOFEzVUVAjf5VjfLW6GmxUll7AFWMzRwpHoS3A4nH4hCXlTiYssRf8/?=
 =?us-ascii?Q?HwiA6ZKvJQVmzN3S4ujZ2wBL0CE4UlCXrcf5R4XWAshcybzidMK/DRQnP40I?=
 =?us-ascii?Q?jv9o4seuabOQYBCc7LvDQienSJyJ7EeavesV2KsPT2UH64LI9Ibh7ot5kz7k?=
 =?us-ascii?Q?ZuuYj7mi/026AwhS2YjPEmFqvhR3joWyjXKfXNk1vAQbDnFukdsTsDzFFI8w?=
 =?us-ascii?Q?y0dLc0t0iWM0tK3FHrj1jKDHhelJMiAAJj4Zy6czlLu8+2FCFAFSgXE37bTG?=
 =?us-ascii?Q?xkghgIK+vJ24eApsQi9/+d/Sm80JNwwluIS3hX8ITTSkMK2DKwX88Xns9BWK?=
 =?us-ascii?Q?HzhEj+1XXqIs5r4WGkOB553TW7YjgoG1Ape2jf0fSDB5njdqVTHg+E41pXSh?=
 =?us-ascii?Q?mAljukk2IuFvcv4OKZH7JpYX1N1hPTuoyzkI6ROyghIz4/jOuax4UMncb2wG?=
 =?us-ascii?Q?K7r9Zc/F7DVg+oor4YAJDx9Po8lPztPi52uFKLm6vV9cJ2p2ubZ5oOJcKHBt?=
 =?us-ascii?Q?0g1vsZ6ZJhAVsGaay/pwb9D+IC5ovUgTzXUMgG2jKGCuXST97FsnqPfkthQH?=
 =?us-ascii?Q?L3NOK941LiIKkb/d5yrRu10JtMcBPf5WAt4DlaMy61AKonn+4UIDQM1yXy8f?=
 =?us-ascii?Q?E0mrwmmxZT7GoZMoV0rQoseldSxOC0r3I7eP6ZfHuOAIyAf8xkYfCFYc3yuG?=
 =?us-ascii?Q?606UXeaz4UR2Ex4oJnFgODgpN/NTrNi7Nj0K0iFoSlxlWTegAx70N4hvsyG1?=
 =?us-ascii?Q?pqqyQ/G6qAY1nAeSrFZWG0L1SwXO3FucpIT0ayOzfaJwq2YyWMSsvwSPPrkX?=
 =?us-ascii?Q?HkhLRwuPyXF4KvM4Qwm77H0YdfXXTi/Jj+jTmf8Bf7xJYpoNtO5qgyURrdGy?=
 =?us-ascii?Q?yj6hnoICI9npMBp2sRlq7I0bLrBcDoloM2/CZlTpiO0bLPWNodXzrG2FfSdT?=
 =?us-ascii?Q?Ymq0YX5qdTy/3ialm8cn/sslWQk5rXS6RSiJyCi4Z1dMp8Qnc24FUlFR9h1v?=
 =?us-ascii?Q?uGBaPCifKr8G/MhK+Fng3GopjufbjpLSimliwslZyRWhmZKPbHG4sz13p8zI?=
 =?us-ascii?Q?AB67oGs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Yguk8nQtsMPF0CrMSGsCtqVd4jDVfAgVSAUClK1n4z5BWPCqPpg7MpehgXdz?=
 =?us-ascii?Q?ULnirSU98h010Hte4VFEA1s+HkNd1cAUn6xMK931mCBTTXyW2BIOvJxyOS4j?=
 =?us-ascii?Q?+tb2qkT9rW2RFdaPoby2h3dr+hzYKYavNa90dWoFbT1RXK0EJ7AQLZrbQ2E6?=
 =?us-ascii?Q?+VU1eFURV1q2oTECu8bgPB44pi3kfrYObaESZsKocU2IMRmeA9YO+8fkosES?=
 =?us-ascii?Q?8+7ZWsAqzUTLoAnk4iCTCHum6f4OIqFJDWzOGJnjOH5od+SZ1DkmDJh41Yiq?=
 =?us-ascii?Q?sDR+mp7sdtaoFtmMfR/8u7tw2LfBJwGCyZmC95APFZn4oL8p4N1rFceKoFYR?=
 =?us-ascii?Q?PUpfhCNDMigRpY3IAqAZcx7f45RSkhOf+4lZPmxextku1d0xekIRg8ZCgwBu?=
 =?us-ascii?Q?SJEeC7oqBjqMJ17mXxffZvHHwvZjpk5ODVJIldDIM5m/CetWG14CGv+8wQsy?=
 =?us-ascii?Q?ENT+PDAZYwMX6AY4liojGk9YtAztcmH2aVKi3XYJ5wZJCPCTYXl1P1ZR1w47?=
 =?us-ascii?Q?gS4Y6H61S/K688ocaXtqf/Oa51V/980itmYthbtkNCshXEZZvcROkX0RZPIc?=
 =?us-ascii?Q?cAWvTkE0Mfg/0ZBb6kZsXb2jRZ+Fu5QUF6GXz0BERQWeSoiv0/pAdGT+nAyF?=
 =?us-ascii?Q?spb9tV/We6iAJ/Aexk0vf+N+OfdnekmPqIN8R13KRNIqMdI0QD5ca4aV5xmr?=
 =?us-ascii?Q?shtgD3jQZFgP2rjzHjjtOcJiFXD3sMFBQa0N6+6AcNT8JrbCe7Mr+TzynTyF?=
 =?us-ascii?Q?4APdCMJ09eL4aHCGuDm1LpYeHTLTqRIEEw8YCOcTOT8tCz2+nMmgQJut+Et2?=
 =?us-ascii?Q?DxNFbyWfWbNfK56myMFFTBFpdRapWM2p0gmQ2eFQQM9d9ZUxEgGl0hhQsOUe?=
 =?us-ascii?Q?fFmTmgjHe6Up7AmfSnWKd3Hi3FNLT2+7/HtYmz6v6+Ou1+aq1gln1BzyOPXQ?=
 =?us-ascii?Q?pwOCUg/tW26W+LEyl31/YW53KfciQRpUwEF4P29ttc7900dB4S9Z1QDqaPBN?=
 =?us-ascii?Q?qlqf3q+i1+TBqGSGdWF08E61GvJ4aLIHqVDyc3FxzjTlxJf9sjcdn8F8Ziic?=
 =?us-ascii?Q?BtKVJcjk4MMJ1FQhUezhc+9+FA66aU7E69G18bufev/3G4cmaiJFHtvD3oFl?=
 =?us-ascii?Q?4CwzcBtUA/Us1wFrXQJYPhyRCcOxMJyaYcZqyNUgRQT0yU3RpJil0DWW8fMW?=
 =?us-ascii?Q?3VIiFNpTZKakX2vDwOoesuQF5sQ7+PA3pluYDz6D+OXFV5VxQN0KjiYbjDGG?=
 =?us-ascii?Q?AjrE47YJASz+Z9T/hpFdtDm7DsLOsP7I6tjEJsOVJlghzCcxrtOn/Pmsryya?=
 =?us-ascii?Q?5nWwMmSvl2INyzlIAtZrPlhQoe07dPzCdIbFNs3OLau35YQdLNlrZ221LTUj?=
 =?us-ascii?Q?ODB31ZscPdOUcHlICRWks/y4kV3ar2Dng8QrN0/h8IpKYP/4MBZFxwKlqOhe?=
 =?us-ascii?Q?Lp8AV3y8fpEMXXKEZWhDD4lxCmGI1xw62UsrdEIu9Ax11CJ9w1kZk7dDk6R1?=
 =?us-ascii?Q?/x+lbQ0BNbJyj1XmaOtYBo1KweAsrERB55AFPrOVVKk3eTBZmxadw60Orovf?=
 =?us-ascii?Q?KiJHSG6qEyOQSFsEQYHf6Nuvf0VG+C99Kbd+VkYQomn2UtpoAc7JnU4NUCCR?=
 =?us-ascii?Q?4pL5A6eEcVtlqdOLR0Mf1+Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b96f8af-032b-406c-c7ca-08dc80465fba
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:18:12.3340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zIi0b+n8wVv4q4vvpbgklXxQLZZuk5k6A5OUpecjEDVyFkE2O/O1rebf2701U1g3XuutCixqlSMeGg5ZqsIz+v4Ua9Wkg5RtWzB9rLMv5B57iTv6nucqEp5QK6AZlodX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6933
Message-ID-Hash: QTMQOOBHN44DFVP4475BHE3W6O7IV5MV
X-Message-ID-Hash: QTMQOOBHN44DFVP4475BHE3W6O7IV5MV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QTMQOOBHN44DFVP4475BHE3W6O7IV5MV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jerome Brunet <jbrunet@baylibre.com>

dpcm_playback/capture flags are being deprecated in ASoC.
Use playback/capture_only flags instead

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/axg-card.c         | 10 +++++-----
 sound/soc/meson/meson-card-utils.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 09aa36e94c85b..646ab87afac24 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -132,7 +132,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	lb->stream_name = lb->name;
 	lb->cpus->of_node = pad->cpus->of_node;
 	lb->cpus->dai_name = "TDM Loopback";
-	lb->dpcm_capture = 1;
+	lb->capture_only = 1;
 	lb->no_pcm = 1;
 	lb->ops = &axg_card_tdm_be_ops;
 	lb->init = axg_card_tdm_dai_lb_init;
@@ -176,7 +176,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable playback is the interface has no tx slots */
 	if (!tx)
-		link->dpcm_playback = 0;
+		link->capture_only = 1;
 
 	for (i = 0, rx = 0; i < AXG_TDM_NUM_LANES; i++) {
 		snprintf(propname, 32, "dai-tdm-slot-rx-mask-%d", i);
@@ -186,9 +186,9 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable capture is the interface has no rx slots */
 	if (!rx)
-		link->dpcm_capture = 0;
+		link->playback_only = 1;
 
-	/* ... but the interface should at least have one of them */
+	/* ... but the interface should at least have one direction */
 	if (!tx && !rx) {
 		dev_err(card->dev, "tdm link has no cpu slots\n");
 		return -EINVAL;
@@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 		return ret;
 
 	/* Add loopback if the pad dai has playback */
-	if (link->dpcm_playback) {
+	if (!link->capture_only) {
 		ret = axg_card_add_tdm_loopback(card, index);
 		if (ret)
 			return ret;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index ed6c7e2f609c9..1a4ef124e4e25 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -186,9 +186,9 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 	link->dpcm_merged_rate = 1;
 
 	if (is_playback)
-		link->dpcm_playback = 1;
+		link->playback_only = 1;
 	else
-		link->dpcm_capture = 1;
+		link->capture_only = 1;
 
 	return meson_card_set_link_name(card, link, node, "fe");
 }
-- 
2.43.0

