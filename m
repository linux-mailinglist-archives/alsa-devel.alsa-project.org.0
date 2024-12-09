Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 434989E8C66
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2024 08:41:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F48A14DF;
	Mon,  9 Dec 2024 08:41:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F48A14DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733730106;
	bh=BDL3R9OJdgk1u3JUvkLiAC7cSVXg6yPRcZ5PxpP11Hk=;
	h=To:From:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ivQKlhS+x8Eb5MYBtX8Dwn4rm1um3N+UwdlpQUdcwmkKlQJGSRQDBQ5xODu0dlfv2
	 iguqEHPy2nGGR01V5N6K83dsgCZBmdmTbVWp/YiI16UFejT9DPHVJZahBURBc8L38F
	 AUk3LpDcEy6UiilGktV3UwWJWrQ0uSi2ZOlskncw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34D5EF805CB; Mon,  9 Dec 2024 08:40:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12F60F80635;
	Mon,  9 Dec 2024 08:40:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FE2FF80448; Mon,  9 Dec 2024 08:40:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42E25F805F8
	for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2024 08:40:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42E25F805F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=aaFRnjza
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7B3zJa6Jh0ssSMIDNLxFxMYl+lkbDxSyjUH9LK8rAHQaZfWRqJL1J55JbX80tgUnj9HVXkazHE6ZjURMDiEqxozZHS+x/EXyeOZ17c2OEezt8A18PY8HSaODpNUcA5nsO9qbJ3ur9MicvILyLG1zh4VHDkty37vj5N8BkT8sIRZP55KyEsj24xeGnuabU6J/SqD43KwwDXp7sAqP9mwPeukJWIH7Flt2D/Rzmnm/OzAdjE/S6pteUKqRNihZ/wLxoJ1fvfwmwPGtUnfguaWWeyNNr0uxX3wh2pG8v7Pvn0XcCZtQUELVd2tZbGBXD7ujcaYIzH9vAn/ro99jiTDtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75nfToXdBFWb9/bIN5Em9gy3MQ0A/ehuMKVfHasCd8Y=;
 b=y1KJjiez0EtDPyjkjNE+zFLDPq+YbdDhGQTb1GSUkJ03fqJ2ykE8PmIevgk5deCAOQfzxh3k9j26ptoGQEa8H3RLy6B5Iz3NcnbzBQuslPl+gwdAop5d+b/v6XWmNi0GR8Wl0dvBDraglWyolfqSFGWEX6mxCJbeFEiBSdqlgam5ybP+I4KIBCCykXIxmeSu+xi6ko9caeUP/XxgMEnyJ7G7+gwPswMU5ARXfHHJYH1PgVhya4mjXOBsQVx/qdQlk9hi+qoxhxzLn91hnYHK7kVauYqR/85jPV4HXBZO5Kz4vpAejPoxDVef1ox7K7d6QVNDt1aV1LsqhIpe7A+r7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75nfToXdBFWb9/bIN5Em9gy3MQ0A/ehuMKVfHasCd8Y=;
 b=aaFRnjzaQAZmjGHktEKWnN+O55dO97Lv5ogjL2AtSKn4f3dLxkph7qyg3JFM8+Q9Zs9gTbrchYNnA+Dcfof1ffYnd2+asYJ5d7T5dfGPTUCyBWA/saiWXTiLleOxjDbNT9ervyeCCGRI+N/ySxBpEVMjrCPUYJWtstK9B2q0l3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12968.jpnprd01.prod.outlook.com
 (2603:1096:604:32e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:39:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:39:57 +0000
Message-ID: <87plm1mhir.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?= <u.kleine-koenig@baylibre.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Daniel Mack
 <daniel@zonque.org>, David Rhodes <david.rhodes@cirrus.com>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Lars-Peter
 Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/17] ASoC: codecs: cs42l73: remove
 snd_soc_dai_set_tristate()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Dec 2024 07:39:56 +0000
X-ClientProxiedBy: TYCP286CA0257.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12968:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d34dec7-783e-4ba4-bff7-08dd1824adef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i5iRbAGs2oPguQ3RUHqi/AvwvO48ukhDtYJByLmnKIDewDB8VWEvVK7mdCn7?=
 =?us-ascii?Q?hSlNDnuxxOEgRtS27602F1pgTQereWZ+0Bs60mwixyEeMwBC+U2wUkWFbf8g?=
 =?us-ascii?Q?UQJXrE+7y9VwgFGkOs6LTMFLwSxQtUgP4Ow/MZFv3A27rU/ZLR8VWeIHd9p/?=
 =?us-ascii?Q?bkStalTsWb5m/czbzd7AAB0L3do4BI7Ixd06et6xOTMzED+JuME9/xsbKT9s?=
 =?us-ascii?Q?JTjli2Vx59SbI8TDQFYVqozy2+SUOvBMY0A7M/AkJcR/yktSK3Jcn4tCQyFM?=
 =?us-ascii?Q?l3+l4YEFx7Pe8SOwKqebk7tE3t29cihMpclQnT+/XBZHbdBwd5vvbjKKYIqO?=
 =?us-ascii?Q?K3WoiVN6XekVxhq8yOUFs04B29Co1nw3HUtDdFh9ysbPpfeu2bmuelQlXYeF?=
 =?us-ascii?Q?Pyu1PAM4yn9y4fJOk+kfnslyu4pljUBiZkVEUfcGwJi+90HXgBDJpRW2GNmj?=
 =?us-ascii?Q?h11TV+gi8eiiv0GGpkHvJXytjnZT5WqAVCJn3nLYYbuGfQU/XkPkusSMoCc3?=
 =?us-ascii?Q?QitM0YTTzd/U2Ucpl5gLxbKX2szYquryoM0X0FhYuG/okhBWdPvIAOJOadkf?=
 =?us-ascii?Q?Jy8u09JOWIPYiAQrhVeZK/zjj4XZnWqXIHKxj8twHV7oxzEyrDp49/k4r79h?=
 =?us-ascii?Q?t/S5PAgX1dpNH6nnfpLtPpDXR/i9fSS23jcNEyfkzDH8SKUDGAp5X6wBqpqK?=
 =?us-ascii?Q?XKX7WMO8AXHaA7db1NS5cV06wzwYQLpIUZ0hegot/gM5cmseCjCAizwB0ABX?=
 =?us-ascii?Q?XxZHmOVoh5mTHPpzOQxQRsLATxgzFpaUox/xQ+9f7Rw6jZpIoZXWe/T/gHne?=
 =?us-ascii?Q?bCY2m9w1fODj7DFmTotiaYRpwxbl+7dQIXXF4Elz8CfIBgR52RjotBjxsHzq?=
 =?us-ascii?Q?KmffzO5TE7wGzImdNJMIVKVq5WbxlO2Dwu0fQs+NciF7yGnHK6wLG7hnSVzv?=
 =?us-ascii?Q?sQVMBHCBUZ27ipHvZ02Ps7292X3ow0E0tjxHxP809G/RWVLkVhfnyYe9hZ3S?=
 =?us-ascii?Q?kNUamhVpAXx+ajC16PyrBtlJOMtXah6Mkatvw47tq101ZSyJIB3Yrh7gSFTK?=
 =?us-ascii?Q?PwdaklxsZh8gxp0VR+jjmgYLKUH8ap3fP8VapImufq3kHVqglG2mjfxD4wkT?=
 =?us-ascii?Q?JlWnFwQOH92GZbxfx7evh+T2frwV3SKpL9ob5HoUx77wdi2WGUHc8ZYZhRk8?=
 =?us-ascii?Q?//PTchaxAm5spm8YMQ9sgvtoX9r/dpH21uVGveR55tePrr+Sf54IVjank7Ag?=
 =?us-ascii?Q?0iLBcB+l+i9dibLA2QUJ+NaRPQpM2OlddIXguaLfZq1xhpduJVbGYJhhPcHp?=
 =?us-ascii?Q?EjKy148lSa87VGe/Y4tCrJDuu3tOtU5T67sgJzEVTL5EX3Eu4Zn+is4KR4o9?=
 =?us-ascii?Q?FaB/V8asb97RiE2lprjCMGPqLLVRMqo9KSwK78MbL6jPL4VLJDp4LqV7dk1Y?=
 =?us-ascii?Q?RhZJvCg1daH8Mz2EjBSyq9P5MPsuuWYd?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TcfWXasLUqlxgt46KfopsUUrfeYxzidatmglsIkQwH31Q/2/khzvtIgINwW9?=
 =?us-ascii?Q?E9TNarYAQszQGYenkVdeb+VcE2WQSX74Qw0ODcTfHt/ZyM4TDY4EeKyFYdr+?=
 =?us-ascii?Q?l0VC41XPoG5FSp1Xn0AiKyg3MpESH1m6oj71e6/duq4r4mRyyG7phZu5TIoC?=
 =?us-ascii?Q?7ybM8xOR0E5a4+NK8AcA4or6mcT0QwwhUfsjCGIE2mrI0kc+OyZSpog2DPO/?=
 =?us-ascii?Q?lA3rOAscP3H3S4pxc9Nh6Eww1bR5RanOSrUNJ0HzxY+yKSC30jMF+MORDYaV?=
 =?us-ascii?Q?3R5wt3Hey/qk3ZY9vXaONsez9AbIT1a7c23DMO6hw53fIOTjizOxXIWum4VN?=
 =?us-ascii?Q?KIftRmDh/4HQ4Cn+IozVhCRB+uIs9ZeHc+zE4NFwYci2YG+olPp3bWVLaTyz?=
 =?us-ascii?Q?F0d8eIS6ek+PsGTZ0UpeLmivC9/D1+U14DR//e7J5B72+0bUvlqE5NjE0UIw?=
 =?us-ascii?Q?bHxn07YdQZXMlb/DEJrtUZITUQGtImrEnZGU6Q+VvuFsr7kP4oojLuy0KSAC?=
 =?us-ascii?Q?xA/FoTG9wRs2WKIMzI4CE9UU8uMOR6ggpkkLGKJ9k6FBWOPJ4NZdIb8+JVoK?=
 =?us-ascii?Q?ggDbdeEYU1+K1TVgqbXcRGyyDAhg+pfYINr0Rqmqql8e8TWWSLLdK7wgqqCS?=
 =?us-ascii?Q?YB6Eey67Bicbq/Uu77SmzgvxCrxTSPr1no/xoYVkrop50wygck+QSoZS8tvI?=
 =?us-ascii?Q?LArWLlO//goDibdYwDXSreXo4ra25+iwC3HVE7eqeA6JZi86C2LRNI2jdb/E?=
 =?us-ascii?Q?amwLvV0stIU7p+PcRSbjunDKpqEIMJr7PiQ5ZtfLx4xLEbC2spJrieZ76TkN?=
 =?us-ascii?Q?ywKHYmR4SRrjQwfDSKQGBhULIXZNdMQDQ2glfeXCiGHrf17VuiLFzlVFnTG7?=
 =?us-ascii?Q?UtdDhFDgRV54byV4f4MXfmw+NK+/zRVRpjayrC/oTdWrAB8dswRyE56UDr24?=
 =?us-ascii?Q?os6m+sJo+5GXgMLmvNy2XtwsGvZtmzvPLT4KhiXnDjS4uXhC9xl44WhPg0zB?=
 =?us-ascii?Q?6n5L+SVV8t9nyyuz06YTPu+/F1oe1uQ+NaCxKxGlPUhb/FY51oIKMj53w0yk?=
 =?us-ascii?Q?pH/AIzJUOEZ3ARsuN+Gv4hlrSBro4dc64A2tdzowvGhA2QMkO6/bidC9Dbf+?=
 =?us-ascii?Q?oV0MbixQOeaYextSkXAlpCoEpL6sBw10N+IL5DZP0EfgxNLdJwvtncsf8UBA?=
 =?us-ascii?Q?SzRPNNmuj8XGXL82VdAeIPcI3pnLEFq5LZs+HhUP5U52Z9HPhIzyDheYfWJk?=
 =?us-ascii?Q?VWNndGzQqxuwLDpLg/G9D+M/vz9p+M6Atp9D5db9UCvOY/KDxJqfju0NTqYH?=
 =?us-ascii?Q?0H+QRRZHdTcNouA5VChuj35tuAQK/hXWyx+mgAwoHdrXmPmm7GphfU1l59Ha?=
 =?us-ascii?Q?Ru/UPSqAvpOT30bds6rzyDXW2zJRqiiDzYMK5gY3P0jVm3ZG7zWUX1pzFpwC?=
 =?us-ascii?Q?4DpWINM/f581kcjIQEYBviFYbC1Y7bzOChUpu6Iz9Bp+MH9BzrpHiQNz95Pf?=
 =?us-ascii?Q?VlgnXydSrHZvQH5hlxprsqQZ+xslgAh9ZGOaAKSDKr7vbaEDYUWeAAUUdbNI?=
 =?us-ascii?Q?gX9uQm+U2CnlT054GvAhmq6cooHQHcPVaZWX0E7ZoCckshD6QZLpxh8rIBI5?=
 =?us-ascii?Q?sv46zBMaXWjWCSxjVFX+3fQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8d34dec7-783e-4ba4-bff7-08dd1824adef
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:39:57.3682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NKTP4MwzTpEmOxEvdjGt17BUYbtmpYuuOdXJE9cTe943FmbWGqweNz+Xu4boLGumU9acB8Q/5eAWmTFg/yHGLDUpzRNPlamHVaIjY+AKZm6Qm4JYxDC6eElxMOkfHIB+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12968
Message-ID-Hash: YR2RAZ6V7JMKNXTEUTECLWZJENSDNIWK
X-Message-ID-Hash: YR2RAZ6V7JMKNXTEUTECLWZJENSDNIWK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YR2RAZ6V7JMKNXTEUTECLWZJENSDNIWK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_soc_dai_set_tristate() has never been used before.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs42l73.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index 21ba796a5cd93..23d5dc912e279 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -1128,15 +1128,6 @@ static int cs42l73_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
-static int cs42l73_set_tristate(struct snd_soc_dai *dai, int tristate)
-{
-	struct snd_soc_component *component = dai->component;
-	int id = dai->id;
-
-	return snd_soc_component_update_bits(component, CS42L73_SPC(id), CS42L73_SP_3ST,
-				   tristate << 7);
-}
-
 static const struct snd_pcm_hw_constraint_list constraints_12_24 = {
 	.count  = ARRAY_SIZE(cs42l73_asrc_rates),
 	.list   = cs42l73_asrc_rates,
@@ -1160,7 +1151,6 @@ static const struct snd_soc_dai_ops cs42l73_ops = {
 	.hw_params = cs42l73_pcm_hw_params,
 	.set_fmt = cs42l73_set_dai_fmt,
 	.set_sysclk = cs42l73_set_sysclk,
-	.set_tristate = cs42l73_set_tristate,
 };
 
 static struct snd_soc_dai_driver cs42l73_dai[] = {
-- 
2.43.0

