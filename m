Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B659592A1
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 04:14:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD4E36C1;
	Wed, 21 Aug 2024 04:14:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD4E36C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724206459;
	bh=FwsoMJrDFws5PDEEAK6qRRexMxWLCb+u4OyJQxZwn/0=;
	h=To:Cc:From:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Lnoimp5dtkmAdQrzuJiCvEj9cNleVx1tD0AvNKD7YpagFl82FH3UxJo76H3Ge28mJ
	 oGDA959y7JavsxHTf5aOOTWzd5lzUrFSyh+EF2ToLEfnvWzx7YmWLZWUluwEaqzBKp
	 8SOrIUzpr25QgL2wOkyMuuwXQFMZg6TthOD9KL/Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53680F805B6; Wed, 21 Aug 2024 04:13:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27A3BF805AE;
	Wed, 21 Aug 2024 04:13:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E02F2F80494; Wed, 21 Aug 2024 04:13:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D20DF8014C
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 04:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D20DF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bybn7ed1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IoKowoDWz+tcCyHmK5kuzH1JLFR6NTpfKfMPTxPz2QKe/geb+z8qNzPDYZnjagKmWiCd5OmlLKiEj3wKbfL271g/Bmwey18GuX66HmWunx5SKCtIL61YxI1+Ts5fIGcRwAgTN/lmrTSJZ1RPWWdydqyZRb7qY7KsKQlHTJ4dTBgGpPrSinkh6bEpBdSELGXR5alZTWfQFnY6Z9wftus6nb1LVBPzwJrmJRBPqis9X1ZF/P+oa1NpVCCPTWerqOkNBbzgLF7xgLitZwd01BQ+AsVO1tIDphfRgQ0eKnqrYzuCqK0MzmdyDBZkNMORSkrSyvp+KSmChdNrd/KxhbtIxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JyQBwvqZxMvSCLy7+lk0ctUwgAejzgnDGcXo1Gv/DQE=;
 b=K062D2qioARPwVsBmTNz2l3TBDCNgnJHlKsTDS1WGdwDTVc1ugWpBWDRVoTbehK/45SWyo/oEe5lK//qCXs9SRjd99Hl1ly6GjB9on+u6z3YQARvtbsqGll58xjKbNCTbfeCgZrPMghumMXMv4Hs+zdyoNIkwcPioXjLJK0FwXcwPa3XKMKj39LcDLz0GKXwH4Y1btZHhPiaALpT5ClS7nQ+smghBqGV1VUNjWTV4k1XJDfBg/qVl74nDqzRdcw1nviC1qId3gmOMkDO1rPjzGafo33PTe61jvh0qVuPiG097CgorjXQ9nz86n9+mnL31G4yaPjfM6MHx3wSF6xd0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyQBwvqZxMvSCLy7+lk0ctUwgAejzgnDGcXo1Gv/DQE=;
 b=bybn7ed16ngbk8YVFbUqdh/GszOnXgzvPORsTKCJ/a0BDvJfKm3oszVKhD4AKquxZeBwU14Z5BVuFSrfwCgURKmsRKlyss1Jk1LhdiMN7zCnbI02Bd7iJheBQALv8BzkXjXpH03JIGIjDKOl9VC2ovuW5XkKn8eyLCRFbqr2Gp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11873.jpnprd01.prod.outlook.com
 (2603:1096:400:404::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 02:13:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 02:13:29 +0000
Message-ID: <87ttfeaaif.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>,Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Brent
 Lu <brent.lu@intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>, Jiawei Wang <me@jwang.link>, Jonathan
 Corbet <corbet@lwn.net>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, Vinod Koul
 <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v8 0/4] ASoC: grace time for DPCM cleanup
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Aug 2024 02:13:29 +0000
X-ClientProxiedBy: TY2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:404:56::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11873:EE_
X-MS-Office365-Filtering-Correlation-Id: b2659b92-d3bd-4593-e2d6-08dcc186d943
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yh7d4g/SumKr6woKtIQ0Acx0L6kiVtpNZfDUXaaaN3X4fUuJ0YMx5tBrGzp5?=
 =?us-ascii?Q?HGkpaeZUzBg2lf5okmnoFZApfQ7bJWLeadV29vzcqHCOa08iLgb5TSWpjy6G?=
 =?us-ascii?Q?aXQxIRzE8zh3cybew2vVNMB3lYbwyMhNACDwNE9VzycODIH/EdvfPLV4Jqto?=
 =?us-ascii?Q?smDmSINV8JFne2PimWwQEf1V18GSLJJkgL1wCd25SEExhbySg9JW8Kk709no?=
 =?us-ascii?Q?sfUF7FtzrvcpcvbysYRndIduSVm3nN4H2IrQKZmMThZWJEkBwRQ+2NCjKgjv?=
 =?us-ascii?Q?Jl2ae10b2iOQGJLcrOfCNVScppW1jWIl3KT+oeB24++gRJteoXyOsGfgrPeF?=
 =?us-ascii?Q?ahF2h8wZN9X7l/xb9ZlzIlvuqxbvSZStYq8yyK5n4+99TGnmGusOvZRB70G7?=
 =?us-ascii?Q?fQepVEljYgIRc5m5MG23NRooA9UKA5P+LetGYW3lrwuSw96L4QO3+Km9v1kL?=
 =?us-ascii?Q?jatq6P3Q7OJyorCVYVEJCI0hlQZyCjCiAyDxqfgzJKOI4q/Y4MC/jGheEn1D?=
 =?us-ascii?Q?HAIvLFaLOQuNxQXCJzfICYKGmKojPlfpqw1mBx5kgOiVsIFzMLCtZeqtUrOB?=
 =?us-ascii?Q?CB9a3kBD7DIxPLkpcFxdX4kT2ZeBzQl/DC1PvtRAcFCD6WDbGPGYN2kRbwgi?=
 =?us-ascii?Q?JrxjK8b0foBUVWrbeaTP2jhzr/9vSDCMB2labIwUX5VpxcOe6qco+Vp9nws6?=
 =?us-ascii?Q?3vTsIiaPvWCwvDMpzbKK9ThD5t2lusGIStNhSIc/Hnd9hSUBs4dtaYLkSbYJ?=
 =?us-ascii?Q?7DK0CEMOau/HSVAs+t+Qn8reXCP1KORTpLvQdE7Kl1vbh4IsgvwRp6XpVuBI?=
 =?us-ascii?Q?I6812QBGivSAZycW4sUnppQyO2FYEVP5b3qy6IHrbuZ+OU+eC104RfXTrMPR?=
 =?us-ascii?Q?B/f0XdbMN78IDFg7dKo9mfskLCFr6BP1c4uRsi/dfl2OfFSmpjvaG36lC3C6?=
 =?us-ascii?Q?o+ncHhMoQpX2FzQNBsalBojxDzGaCW+y2hJrz6zXtyGNvkidbB2B28JBEL4q?=
 =?us-ascii?Q?t+2PxpWzQzgSHgQX31u26d2mrs0GDmrxn1ktpmMGOqfWIapHFGD/jfIXyN/v?=
 =?us-ascii?Q?ghbUNDnytfqG7O8wpFup+AgrL7xiXfFs3FTkdBWtoUlyvrl+NLeIuFHCvAiH?=
 =?us-ascii?Q?0VSigR8BQSL1Bb0fo2VgvCnWkLyU2oqzHiyY/fh/fwBTI8dojsMoydlHay0L?=
 =?us-ascii?Q?BVQ5d0628bpaj3t9AyfQgYZHCbl7BhqcBbDy2ckjjPsvQJyYAYn7bZkiCG/b?=
 =?us-ascii?Q?f7upeUobywwVrh2t8f37f7JEMy7arstOkuili0WwR6APOSUvouuYDYTya6/f?=
 =?us-ascii?Q?WIsEk3Psvrqt8uN9wQ+zCY1rLGOC0fAWNY1syYjK9nwNld5QQiLbCRcPNVl4?=
 =?us-ascii?Q?ESisAdnX6k0l+L9XnuASAYf1d1BY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?knj9ypKREBCUzHk9+i4TaHUhIDedv8Mju6epmbJt1yYwoDgqmt49Crc6WnWX?=
 =?us-ascii?Q?Ie/kxL8WFx5DWUumzHBC1zY55mFokelkZz989kh7QR4F4v93r4iIr/zHLfJH?=
 =?us-ascii?Q?mK7lPwAYZYw5+ya+I5vuQvjexncCkrIW2liOr5o35X/WSsl/O2/mfKtYOeec?=
 =?us-ascii?Q?VwF78sjO+w9KuX/txaXA3FuYx+5qKWhnsjwv5XrXaStchC0lxG9jYKEklWo2?=
 =?us-ascii?Q?brGeW0yR6O1ZIZzYYHLm5v4IBcn3my02AlAxWBZ9DodFN/FKBSO9KjUixVZP?=
 =?us-ascii?Q?zZpssTIGncebhyzIEDdJhDAFZGo9LeBr4nrgQyq+NZt2vev2R/j6rMC2sm2u?=
 =?us-ascii?Q?80z1YDsL/FHkMRvAy2fw/oIFAap8MwreFgI4iFjp4g5G7c9y+urL9InvDjMG?=
 =?us-ascii?Q?fJsi8EF5gtrNzt1F1PhElE5hp78fXS8NCB3ti2IS/VjaEiq+u9QY4NB3ieF5?=
 =?us-ascii?Q?ENMQX9WID+Mlo1bWJn2QzOKwh4/TmEW2yLApiAkPTsg7jr99oEZjA8BSIgSI?=
 =?us-ascii?Q?6yJrLH9a+RfRm4io13yDxnKGy/p4+Wh/FZlSLKZiRn/OISiJ1RJPT6nR9MIJ?=
 =?us-ascii?Q?Xj/reQk+CVVyI2BuR5TykGgkuul1eU8TYmRsvE7Bm5hJLmXDYLK6UqCiXc0U?=
 =?us-ascii?Q?Do/C8kVW9XvIT1OjgKkt7MKJeVt0j62Fy1H2hDaewOVvEOtIm3oTNd0CBHsU?=
 =?us-ascii?Q?t2BD8wWZLKcakcSPKmOHStJvVx2e0qGBy2RLw7fd7DNHdb8koXzwmTZ3Yw0o?=
 =?us-ascii?Q?kGU9fITbF+cIGvKpz34dn54XbJ14ckRm3/LWCe59yoCDXukAqcTymzI4Arcn?=
 =?us-ascii?Q?8SjpDjfimCEz3bBA/B9GKnuXVOoWWukiMm54UPsAJHodakdhSaohYw58kZBl?=
 =?us-ascii?Q?mebdIFzz0wBsWtCLw3qEWLyZ7YFpqq3sOOG3wz8Lg+zkparIuYpHrZZUmA2u?=
 =?us-ascii?Q?enM/JlgW9mb6yRe5NKrGa0HjnuqKsf8MzuHd2QOYdEDfzhVV6XcSuZynrJbo?=
 =?us-ascii?Q?D7oeDTBRV8jUeO3yIvMUczvCNePhkm8+t0b1ZKslbvydJfCBfKGP90gjYWKf?=
 =?us-ascii?Q?L6c6d5byKcqX35LnYFyEjXmFOiqnVM/oNvB1jJR+TdEgujRJsRzCiW5hjX/h?=
 =?us-ascii?Q?1l5S1QA5pZ7JMZSS4nvMfLw8qEUqoqCwhXH99LN+vd+fW9Ys6gpGEazSuqaE?=
 =?us-ascii?Q?t5l1HnTcPDd7FSi1QGlaAVwec4Cx3yFDgosGmxX6H487zOKvK9i+SiVXgAAd?=
 =?us-ascii?Q?PpGm5feBjIuaHRfubzZ4N3GCsAW2S4VX2cdeLpdlnkXsexiwgFr698O1YlQq?=
 =?us-ascii?Q?A3M8nR6aBe5aZazBhxvhzloD37TGDyDVRgbVeKSSHdvpWqLfPWQu0rYxIZSA?=
 =?us-ascii?Q?QUTDVTNEFGXTGFf6SsSx9yp2iQk13nVdlLB6rBiWvKm8GRz2jyIo5TOEC9Nx?=
 =?us-ascii?Q?vRTIdF1D4tQdWyIeHXSRcmLfLm3+86FwBfE9L+Vj05g6Avpph7eADYWrkbhy?=
 =?us-ascii?Q?Jzr1EMyySmEVueHQZ/Hx2jScOZbxxj8DSPRYGlRxo6Tzcg7X3XIXq8r/QHjX?=
 =?us-ascii?Q?eEYnTfmAJZzVynonbyVpn0cftDoO4NDAb4wkfx2gnF6iVbiNFh8cY0Txjejr?=
 =?us-ascii?Q?A38AGYQjlMuc6SBhzBGlhQs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b2659b92-d3bd-4593-e2d6-08dcc186d943
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 02:13:29.5762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yWPLzgyaAPAOOhpEfRiLkXe0umgnGZ3YTq2I8wdUvb2DTSXuGmqSL5B5bt98tK4Q6VTIQYm1je2eBLqPyFc6+YX4Mukw1sN7slWGUbz3V7b9SzznQbo9XzpvNpvct/Ya
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11873
Message-ID-Hash: YUBDDCAL34SKLBTA553RQFREOPOVYPMW
X-Message-ID-Hash: YUBDDCAL34SKLBTA553RQFREOPOVYPMW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YUBDDCAL34SKLBTA553RQFREOPOVYPMW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Mark, Pierre-Louis, Jerome
Cc each ASoC driver maintainer

This is v8 of DPCM cleanup

As we discussed in [1], we don't need to use dpcm_playback/capture flag,
so we remove it. But we have been using it for 10 years, some driver might
get damage. The most likely case is that the device/driver can use both
playback/capture, but have only one flag, and not using xxx_only flag.
[1/3] patch indicates warning in such case.

These adds grace time for DPCM cleanup.
I'm not sure when dpcm_xxx will be removed, and Codec check bypass will be
error, but maybe v6.12 or v6.13 ?
Please check each driver by that time.

Previous patch-set try to check both CPU and Codec in DPCM, but we noticed
that there are some special DAI which we can't handle today [2]. So I will
escape it in this patch-set.

[1] https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
[2] https://lore.kernel.org/all/3e67d62d-fe08-4f55-ab5b-ece8a57154f9@linux.intel.com/

Link: https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87wmo6dyxg.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87msole5wc.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/871q5tnuok.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/8734pctmte.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87r0ctwzr4.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87cymvlmki.wl-kuninori.morimoto.gx@renesas.com

v8 -> v7
	- rebase to latest ASoC branch (for-6.12)

v6 -> v7
	- based on latest ASoC branch (for-6.12)

v5 -> v6
	- based on latest ASoC branch

v4 -> v5
	- typo fix: limition -> limitation
	- typo fix: catpure  -> capture
	- include Intel patch

v3 -> v4
	- don't check Codec on DPCM
	- include Jerome's dpcm_xxx update patch

v2 -> v3
	- tidyup typo (reuqsts -> requests)
	- add Tested-by on git-log

v1 -> v2
	- tidyup Codec check warning output condition

Jerome Brunet (1):
  ASoC: amlogic: do not use dpcm_playback/capture flags

Kuninori Morimoto (3):
  ASoC: soc-pcm: Indicate warning if dpcm_playback/capture were used for
    availability limition
  ASoC: remove snd_soc_dai_link_set_capabilities()
  ASoC: Intel: sof_sdw: use playback/capture_only flags

 include/sound/soc-dai.h               |  1 -
 include/sound/soc.h                   |  1 +
 sound/soc/fsl/imx-card.c              |  3 --
 sound/soc/generic/audio-graph-card.c  |  2 -
 sound/soc/generic/audio-graph-card2.c |  2 -
 sound/soc/generic/simple-card.c       |  2 -
 sound/soc/meson/axg-card.c            | 11 +++--
 sound/soc/meson/gx-card.c             |  1 -
 sound/soc/meson/meson-card-utils.c    |  4 +-
 sound/soc/qcom/common.c               |  1 -
 sound/soc/sdw_utils/soc_sdw_utils.c   |  4 +-
 sound/soc/soc-dai.c                   | 38 ----------------
 sound/soc/soc-pcm.c                   | 65 +++++++++++++++------------
 13 files changed, 47 insertions(+), 88 deletions(-)

-- 
2.43.0

