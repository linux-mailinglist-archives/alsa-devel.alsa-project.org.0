Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E258D42F3
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 03:31:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 896DF868;
	Thu, 30 May 2024 03:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 896DF868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717032708;
	bh=eZr89klWqLnEVlZq5LBW+pgLYBAYOUnN26Gj1EYlDlg=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=p1tymxqtYlSxA+/nK6c4JuNrTsCK9hmNwhNTOUeJ3ScXDAj6op2KMSGFSxXrDyhfo
	 Df6R9PJffs8K8LLZs6/NnfMqEKbR9UHF5ccAv19dHT88oPdvJ2ziiS0dw3uZUEJ0w0
	 d2nAn2mSBOb9XqXkxnft1NcjgMktCbEb7N2CfXH8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF89AF8069E; Thu, 30 May 2024 03:30:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65763F806A0;
	Thu, 30 May 2024 03:30:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7003F80682; Thu, 30 May 2024 03:29:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DBD9F80494
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 03:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DBD9F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VAbu7mt4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jM9hGCqbjSScUX1zlmfuEUqgwUd35LbBwTmbFE3UWPWT7Uj3SrNDrIKAlhVHTBptkeRGTptvvCkSYO2wQlTHoEPo5hSa0Fw+3RiwsyaWyRyZvLbNtb2kMTKePPvenje3ZHqcH0bA1sdFQUW8Dzc6dxGqSPQqrWmS/9CPJgSdsGp9rKvxNYe3Sxr/tO7v5E1xcMAQaSvTFSsEyGtPPzRzxbBvOVKDHebrDq4slbxpcpKAcCRmUugSz85z5so6iuEGAv1CyhUo1D8sq5sBC1Ghslxg5pbwEGngo2+eYmx7XhffTXVvsjgel/5D+ZAuPlOmHQh5merDdS59EYuvsXheTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOGSQCDlmmfUUHWZhj+W+lpRY2y6kf8s7usSZddtEwI=;
 b=Jx3ZZwmCOwuyrraTMnFTnGOuvvBcObbB49k/zEoGuSFs1GBw2vbtkIhiiFRSQwCYBqwOYMKuv+4Mf2s0TjPuQCVkMuuMA1+HggK40EWszLXOmkdf+SADaMvDO5mgoMIveqBYE/eurSHWj4Ook0HoPh63D5dAeMxenh5IqtfggzylF5gI/TncyAr65oC/W6liAf07+yXuZshnY66+q0QtVMxPctWR/W/siE+/zzZu1KLd/Dvn0hoDfLPXY2KXxbrS0Ret1GvX6hbkNtnWcRKTsJDCISOVkyiXQacKl+/6OjB5ZODRSZhkiGPXbzY9RYbNnuDkNgw2ATq5q6u9aZdGSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOGSQCDlmmfUUHWZhj+W+lpRY2y6kf8s7usSZddtEwI=;
 b=VAbu7mt4l6ko4piCeJb5JGuF6hzVl8zLp14J03QwyKBaliEYRZqKJ5jjGka0wWel49BsMdkmPjSWiT96/MalZhvPOZJzdukBDEmZOq+bT9qKI9w1DfO/eVDo2fHntp9kl81PPe7L8PhXRtYfmJgzRNKgskVVKcqfId64peRnCbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5524.jpnprd01.prod.outlook.com
 (2603:1096:604:a6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 01:29:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:29:42 +0000
Message-ID: <87r0dkozne.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC 09/12] ASoC: soc-topology: remove dpcm_xxx flags
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
Date: Thu, 30 May 2024 01:29:41 +0000
X-ClientProxiedBy: TY2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:404:42::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: fac5d0e6-49e7-4173-55e6-08dc8047fb2b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|7416005|366007|1800799015|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?C2Z9F2h4r2bcp8TfTD/fK1GL/oYhMZL+CxBhozm2224HmB652VFAwmuPlZy0?=
 =?us-ascii?Q?MAwAD174RQPfrfcEwPFo2FDkw3jZwDysHBCcbuxFCljuzBJXgPeGS9TZKXIr?=
 =?us-ascii?Q?whrTTyGVNHgXyloD3OXhwO1crX/k1YfiMWfZryaDUk7gcCj49ZwKTu8HZwB8?=
 =?us-ascii?Q?8ArljU2jRdg6dZjY1WOHp0zWHA1O2ah/z3MFeUsFxikn3sjT48LYzW6FXuix?=
 =?us-ascii?Q?h05Qpo5AZzai4sgRgc04f9Jj5/C5Cr8mG4442AZccbAfFG5RdswLLaEFjUAZ?=
 =?us-ascii?Q?Y7rQTyf9xplm3LughyZl5vOBSpzqIBxGH6ZyCv8pohS4qjtTowAALqd5hfIe?=
 =?us-ascii?Q?T9uQbfVmV77PpqhJE2KWd+1t+9Vqek0+yI+R+Ge5KGp9JJU/t+hf3iD9/VQf?=
 =?us-ascii?Q?B2IA2NIr9FQAZgdQlQWImXXblPEaet+aADux4JJT2GoSTPD4HaezcOwt0PD2?=
 =?us-ascii?Q?j3mSQIqRVtKDvLLY6+moTMdJN1aUvayVx14PE/BZ+nHiOvwIGpL6I4n3DjEL?=
 =?us-ascii?Q?EKYye1pKqSfpF/jSlCDQF8RoLts/SSln/RVAE6UTA5X4xRfTuSiJ26tT6e85?=
 =?us-ascii?Q?NicNHAvJk/TjRCg8YUd9ccWTzQpZacc0vnUGZnOqsBXgA7uzDGwUufJYLnsi?=
 =?us-ascii?Q?tYyNMOaic64R7xm0pHDmyr33/wxQt6Y716R+93In9MsSpmyJUyZyoWPCdJ2t?=
 =?us-ascii?Q?vU3Gz6r79W74HHoE+nJYdukvjx1aZsmGj9AY4hNJgf4DPUm8gAalkB0qOYD/?=
 =?us-ascii?Q?O1vh30GuXxRltV/9SdvapImgt/kry7hHWB9bdABn7BgJllUvUPzkm7yf6wKp?=
 =?us-ascii?Q?jyq+6ovjeUfAn3PWQChz943hMKJ04t1Mmy5YYDM5EH8qb/d+3kJjV2QUgaT6?=
 =?us-ascii?Q?NaGr0FL25IMl42ru8TMIjCKlcCH27NRBr1t9Iq5nmNGaaTP8Cs7OVsXQgDyH?=
 =?us-ascii?Q?DhvjYG4nhyJhtYhF/m92wkvspZL9EQIkxsJtxVLzXHXfjt6InZblZek9yKmd?=
 =?us-ascii?Q?UKBQfMn1A5UJELvNACoi86v+KYyq+iFD+woJcThO/nJjwIpyzGNOz9mqiz8e?=
 =?us-ascii?Q?urU5H5Fpz6cSV6E3D0DZ+1wf6DxjsLiWusK8YdLH8nmtfcf1guId0yGySriT?=
 =?us-ascii?Q?E2STzHzNvcZKR9UpxzSjLL7vqlrCkgWdPEbpSs4Z0Rtlv4pHEbWLb38B1nL9?=
 =?us-ascii?Q?yrGtxdHkehisUOPGU+s8S9i0wdvPZUXK99dx/OOrGrYgp/VgS9Muz9yYXnQ0?=
 =?us-ascii?Q?f4b8Dz5T9Dl1RGdX+1ALOMP9YIepRUCwS36F4k0dW60qISuPgtaLNPDEPkuE?=
 =?us-ascii?Q?KEH/iG0VMr9SrKVFUysoVDCo12UzrN/Kg8gHkT/boFboT0jwt9jmLA4+3Pip?=
 =?us-ascii?Q?EFTntgs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iWOUuRkFWa8+w4KQvwQ5XUiuazdQWg6XP9LCzdBqJjvZ1qQpuL7R9BmOwnIC?=
 =?us-ascii?Q?+62tOisbplMJ5vRnubj+skhiIbe5kBNhSsvwdxtPFmOpH0zNfziCzfeSzDyl?=
 =?us-ascii?Q?xfMlp2uKzMlYkXa34fryj/QOiBF+6EpTfmwM1Y25xWgvIHoBfFn9NTiQoDso?=
 =?us-ascii?Q?66OyD8Qvg3PEIFzjanR+5Uh4HB1iGrcMqjp+qCx/yMnoXSEu/tpLrxUGpVA6?=
 =?us-ascii?Q?QBYq0VwU/aui9LkYzKTdSOwvEs2YF5ARypsmPRjCBNsDs4Uapomd/2i9VEUk?=
 =?us-ascii?Q?z5S40ySfD2FYNaOwNsYEaJHZkqlqhqpB4sXdUiFGxsLWPpWCav2NUj40jCAB?=
 =?us-ascii?Q?K+RkMr3ldmVncxLwUPEa2vD1vXPdsBmetBbTt8f70QK/2GiwIzwyvBKeHUR+?=
 =?us-ascii?Q?1iYNv/A9viHhgggUl35/3StNuCQ7vashSo/fO2NGjX7nmK61nBbFbHgcyOzM?=
 =?us-ascii?Q?o+QFutZJTCCRoM8E04tYNLWqRrDjEZcDZk7ySc/OaEjoqHo6OarOwDjnk76a?=
 =?us-ascii?Q?aXHZ1JQHQLNjPZXWJZ7RdH3jakcr/c3EOVQl+ohowiSZnv9J5d4NprqzsaGh?=
 =?us-ascii?Q?GZ1/wlucPJY4O+nl0aHpIXRIvjOkVABDpZP/kaDwvHn7b7jR19A36ZfRtekA?=
 =?us-ascii?Q?J5NkqF5lmkxBy2Tl0miF8qn03C57vzX954TdoH5HuFHq0BD514XeaWYJXLPh?=
 =?us-ascii?Q?QXm9630sKN7F7l8Ow9jVA+I8owBhcPLxC+5AlY/Rsw8ZYUU575GstEbOVba7?=
 =?us-ascii?Q?N8Kde9lvH3WFzJOEUaKLTUTGAkZdihHhmFeus9BLpllK+MjLEQXloRjTUpvv?=
 =?us-ascii?Q?IPop9dN3xfK3Dy9+Uu+5V3ymV0durEVyb2iFy10VO2Ur+uxnOqf/vFirq7Uh?=
 =?us-ascii?Q?wOHASfH9vZ7oxnOhEWqJapCkijDxAWlYbG+L5MFEwUSN5LflGrHaLYFE/9o5?=
 =?us-ascii?Q?Pa37oPXjz6Abx4l/4x8d/Sw2cndsY4QjP3ltFNz3/59/PWR+fRFVWl/mTwD5?=
 =?us-ascii?Q?eF/P8YuAT/zRPV9Y5JYrbVfamF5wA6fIE1fTy+T0hkTVFJ8R6WYJYTwXNJHG?=
 =?us-ascii?Q?+Ien+IIQSQK0jQP87POCY8BxhIfd9x+Q9WiNnLaJMMIOzVefGlC7r71B0X5U?=
 =?us-ascii?Q?io0B1Ij/D/KOChUUhXc5QwzYK/ItH5FXwvnVZeK4mTIAKd+lCjIdG1PErrdh?=
 =?us-ascii?Q?CVK8CNQx3dmo5pjKSQRullH9ThbIPkrgFhos+jOE3b15zMnVD+63jJ42EHIT?=
 =?us-ascii?Q?fFz0Y/jB3y0duDyTdmIK1vO/j+hGILCsT5056ij23OsreSn0Z0yzCvpzToJK?=
 =?us-ascii?Q?o5XnSuDqUJuTFUteIje2ftOtTKT/a98YkncJZQfVqp20llBJk5IDzd6F35um?=
 =?us-ascii?Q?l1aIyM9KKLiwnBfdJVNCsORuWm7ZNSmN7pkvjtbwKL+owUJCN+LRkokQkMMO?=
 =?us-ascii?Q?2ohPPvSjDq8pXWQbakwsppub/+2gV71uPSSSBC6WN3Ho8ujAIQvR6B2Uh3JI?=
 =?us-ascii?Q?TNCnzIlCJ1RYvyv90soiEm0bmH1ukTRvPHxSl+jclrHbuF1Dpg8eikfPzSZv?=
 =?us-ascii?Q?ZIYP5upghym2YEMaKPhZUfuC/s7qfXYuP59EsJcHMfWDE3FSbFjNsKR3CLBM?=
 =?us-ascii?Q?eUHfdc8BFGeZ+ZN18EGi7tM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fac5d0e6-49e7-4173-55e6-08dc8047fb2b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:29:42.6147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Wg/5NRfSV1l6138PvBzZse1DnNlSynDF0ksKpT9xdoQT547pjk5sDPWe4Sc9/UaXbY39/VgzLY9ihYi+pXPbycT5utXhWUWByaXSG+ULNLJ928+XukEl9R15cx9CvNpT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5524
Message-ID-Hash: 3CASGA6J62FWHHSW3SSYCTL7J5TO3AXX
X-Message-ID-Hash: 3CASGA6J62FWHHSW3SSYCTL7J5TO3AXX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CASGA6J62FWHHSW3SSYCTL7J5TO3AXX/>
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
 sound/soc/soc-topology-test.c | 2 --
 sound/soc/soc-topology.c      | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index d62a02ec58963..be3c33e6a0163 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -88,8 +88,6 @@ static struct snd_soc_dai_link kunit_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(dummy, dummy, platform),
 	},
 };
diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index b00ec01361c20..21ef7f24305f9 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1727,8 +1727,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
 	/* enable DPCM */
 	link->dynamic = 1;
 	link->ignore_pmdown_time = 1;
-	link->dpcm_playback = le32_to_cpu(pcm->playback);
-	link->dpcm_capture = le32_to_cpu(pcm->capture);
+	link->playback_only =  le32_to_cpu(pcm->playback) && !le32_to_cpu(pcm->capture);
+	link->capture_only  = !le32_to_cpu(pcm->playback) &&  le32_to_cpu(pcm->capture);
 	if (pcm->flag_mask)
 		set_link_flags(link,
 			       le32_to_cpu(pcm->flag_mask),
-- 
2.43.0

