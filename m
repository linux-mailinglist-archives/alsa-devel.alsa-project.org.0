Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAD990A0FC
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 02:51:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA89ADFA;
	Mon, 17 Jun 2024 02:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA89ADFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718585515;
	bh=HcR3Z/effrP1FZUPqig3Zvj7l0KDHU6Suc98FZZqaxU=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pafQUa12L4NhcnbKEoVxPAuHKv3qRIAF3ttkiKdoGmAB89zXbC4wvq/zsgRPUEnTe
	 BeWr8uywiz6BOa9DDp6i44Nogjk1hHwZXo2Bcj3vGFkByi9X5CmsjVH+nge2CZV/Fh
	 t4ZfvjtKiBu/kL2JGN+Mqb1j/lt7XVRqbvfcPyG4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAC2FF805DA; Mon, 17 Jun 2024 02:51:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6468FF805C7;
	Mon, 17 Jun 2024 02:51:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 379EDF8023A; Mon, 17 Jun 2024 02:50:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A932F800ED
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 02:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A932F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Hpcnl8Hx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sd20TUWJQSgTDrtn/dXoyK+1CSMvaSydB6GBMIRh3K3cLrVC7QPRCd5nivcrIo3OWNyMjSh8CJtv1gV6VQid6ttuW7LD04oQhDBLtZbAh9U5Bp8fjz1WDSJbvX2sOnrn0JvWsAfPSZur4fFjWgVoBWRyCPaYioruuI8tKteMdSivHbUPiSZIDJqBpomgPhfE50Wc5/ZQ46BT0abndWZ2AvxY1sldaT4g8XmvHHUImZQHftKdEfuOY80P8Ki4qKyw3Izmv6/4AdfA1alKcYgWpmXDmUJZKS1K0gOfLFx2bhwXj3KbCPWK07KP0RZXHQK8WEYpxRWv5eNIOFPXJx0tNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vonKr3xCTVsyBVxO7nQoUW2nAXyiCWU2/z8amjUQWY=;
 b=M3K+YrmeFOxD/pPWdCvgNaV883gADE6UcheUUa8m37ecfAKwwZwb3QQr6GlZyDeMUcSgr63c8+dlwLH0zMkW7nMjHE3pzOId2Pu0nE15Zr8WN+0ynPOv0j0Q0wW0NMt9k/k4w4uowPRMSK3oeGeDkVhPXNKX+vPPPbh28Qk2FeX63H+ucGDlCNRh73dTTHvnN9u3Yw9Tor8plkHI7hlFf/Rho/Yq/clk97c8u7USppG6+xxJQ7cSHdLduJEloZh4DjzAb0IhB/cAvlLgiyKM1fbNdo42vEpSbahd227muzt2RZwlqBE799IJSyY0gYNrozp6CHLlRmkhLCn4hFYbHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vonKr3xCTVsyBVxO7nQoUW2nAXyiCWU2/z8amjUQWY=;
 b=Hpcnl8HxUVIp0l0nA3p13VaXR6kaGEshbc6QjrCCukQawwjod5e2d20yoPARLX/Ibl4ZrcYHbLlBUHxI7W5XH2lxpEJHTWQ02Qmg0myc90nmV8VKAxDhbsoVV75cVZP6NdUNdiMV9oinwiuyjqBuNuKCzyhFic/NJQVz0+sgOmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB11229.jpnprd01.prod.outlook.com
 (2603:1096:400:36c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 00:50:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:50:32 +0000
Message-ID: <871q4wtmsp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 resend 1/4] ASoC: soc-pcm: Indicate warning if
 dpcm_playback/capture were used for availability limition
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
In-Reply-To: <8734pctmte.wl-kuninori.morimoto.gx@renesas.com>
References: <8734pctmte.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 00:50:30 +0000
X-ClientProxiedBy: TYAPR01CA0197.jpnprd01.prod.outlook.com
 (2603:1096:404:29::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB11229:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ebcdd8b-c3ee-4b62-1412-08dc8e677d86
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|52116011|7416011|376011|1800799021|38350700011|921017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?g7qSACBt1QQDHT5x72dHhTItDA9u3RNNr+jyLZVHLS/HQooCn22cMu6ODK0y?=
 =?us-ascii?Q?2rc2PN/cDajBeYC/dEMRA1uldfeGec35PA5T2JPNjadgFJYB7P7PvpGeW2cl?=
 =?us-ascii?Q?7bbImS7Agmqs5iguNbcmI9/57bj4dTJ4eXzadcpoCHzUc1Msv9bNu6aRHuHR?=
 =?us-ascii?Q?iHAOfJHoXA3gtTwDtC0jEeJMFXPAmmNPkzWsTlvdXHp2PN1smT40vzwm6/mE?=
 =?us-ascii?Q?FzxNmoowzl4KOD6PGT9mcZpvnsUtx7fDW68S/+/t7gHtscJmVJUFMdY861VN?=
 =?us-ascii?Q?pHBhcOITc8T7fK22CAUPmUs23V3CxUKME3LfvZk7iaADJsAaobrCCX7Oy3tZ?=
 =?us-ascii?Q?Svj2u1DzXsWhvhmV1SBRuUIrdjlowpMI9mmygmEJrgwaN9WkpPVL0JJMLYh2?=
 =?us-ascii?Q?NmJlf58zupW0wICA0FTkUlajltu3nwpKEBnz6nSNm0bhxwmIavS1KTqBwz6p?=
 =?us-ascii?Q?VmsvAu1ivdN5DFFLMvQi0zRzjyd6vZFAynNwLi+jdpuFxgDI26sZ7mO6NTqN?=
 =?us-ascii?Q?OKcXoCOGYFI1yAGSMKQVpoZ8ucF7mYWLmGilraMkv+S+Kw2TNP+Wl8nKr42E?=
 =?us-ascii?Q?5cy6lJLq8Dr2fRyL/2TrOj93sAceZAtpxtlKbQeCeu3+V9CCWAPcoMpuCKWi?=
 =?us-ascii?Q?ZxsiinyoUcJzb5+1QzEHAZcxtHp9E7v9GqX10qsHLZtXmuUT+ylSXj6uk7fz?=
 =?us-ascii?Q?IOmNpvgBvQLz8WWh+G2s72bJMJs9V1wRezuA8MWbucKMPcItk1QdtPEaio3m?=
 =?us-ascii?Q?swOLSBfUgRa+KYKAsi2PkmLP0G/XcF7S8w0ZtrJ4+H8nHRBU9snrE0qQOQkq?=
 =?us-ascii?Q?+61cjwK6J1/xGC30Q3BzGIjcbKNaM4wBL139hxRiz9U2B1JBnMhsDredc41R?=
 =?us-ascii?Q?FhwtWQ/eqRWNoo2FnksLrueKR19Hmy7V4e7YZhhdGg1+8sd7hqosZ8bB/Pe9?=
 =?us-ascii?Q?SS71cTrszgpGwLU6ZHkVnSVySt1hbVI5URKyHnpV7UXLHK28rHO0fZxZ6yS4?=
 =?us-ascii?Q?t/6CU4/qlm2lOAZr4Cq4zL9Ikn9mFFDP4c9qL+iKYnR5vLztSdbKO/Obmy6s?=
 =?us-ascii?Q?p/ZGn74irGn1/YdhjwS9/1MaYj5KIdsn1fLIHYAafigPdAbm5fdBfVuK5mLG?=
 =?us-ascii?Q?B51pviJB//iVDoYbOrru62eCeovweNf3Q2OVhxJ1ultFkb2aOQHwxRzifkmZ?=
 =?us-ascii?Q?oHL8zaSHzp9LmKgRdC35VzzaqUU+wgLshcI6iYw2DTfbMtQRxUn9I+FM7Kv5?=
 =?us-ascii?Q?BfChBUPShVnCGQdxzW8Ifgb0ngzLR+wx/t9420p7wjIUXgWrrAZwCSVzVACI?=
 =?us-ascii?Q?zz6f8WKNOQucg4qO3mhPN1Fi1xtx9b+l5awOXRwpBuIutA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(52116011)(7416011)(376011)(1800799021)(38350700011)(921017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7bQ0Sm8MwW4R9lK3kt5vxeAEQ9FkEeDO9fAf1q8XswclQG+BH5lbnyIiJ16L?=
 =?us-ascii?Q?S3WVLpqMxMvYmeR+h0EzvQHWc4GraMReClaD4Uvts4E+/3j6M7qiWwDs3fnv?=
 =?us-ascii?Q?LPLc664jc7EP7D6yst/jKFOHeSrq1qab/nREzxQDCyLOJODA9D049uBKZqeg?=
 =?us-ascii?Q?ys+lvw1YWFpcusz10H7/kYr43Uy9UxwyaKEPEFQDiXiOquOAiLhCkyYcvIc5?=
 =?us-ascii?Q?1Jc5m2gSP4kkXkgt+N4MWA5xbjdIbGS8ja6ZazBhrz49SodaMZbgsKT+KizH?=
 =?us-ascii?Q?EtN7GwdIwFKV120iBCBlaAUYW24CEVDU/bpKoOlEjNzi/5AF7xye/zgrKsRc?=
 =?us-ascii?Q?1wbui6SB8ztViIDeJoyO3qqHBwQLFyDakKy/WUKYvbeIhwzC/5wzlCmelWh3?=
 =?us-ascii?Q?xrHLKgSa5bLJnxHl6q32SbGNnQqKm4nXBCI7nGmaPfZZCEpZ4TOYAAFuH/P+?=
 =?us-ascii?Q?sqlm5aNDnT/s7LXkLt5xfpxlDuMtbGWvsqow/fRAELSfOkM9J6gAv4+7xms/?=
 =?us-ascii?Q?h0+I29mq+aP6vk7OTnrXJgXEUstLsrSFBivRdJAbho0WmVRQhwhMxoXUwROS?=
 =?us-ascii?Q?J9Jz+8lp0/B4GSSXNWes+IaD2+ujv8c9NV1RcD0eGx5iveLMfcDqSX4dd1ad?=
 =?us-ascii?Q?EFb1bFRL13CqDYYQEZ45s6fKmcOqgsU90k5FaPWb5j+3cR4nrPN2vlEEJSrx?=
 =?us-ascii?Q?ZL91NXfs1hTMIJ59T1HqJrBhI5SRma18Nam3NAzG3wtiKOL2HurM8TpD+5rM?=
 =?us-ascii?Q?ao8imJHB9A1zhayV3BIKVfQzPNmgAWDHrUuZ5bEjGC90q9foBv90ZkuRNbYr?=
 =?us-ascii?Q?62nY/UdKvWTSQ7jboHH0ueCEqZNFpb+Ln5cmL852uti3VsS1CNMGILT+KwRo?=
 =?us-ascii?Q?TfQuQQ2Afd9PmHtnZSRPpq0/S6pp/cA0pY+qsP0b0LJpn++1cy8RaQFE7WM0?=
 =?us-ascii?Q?eDD9fIdnTVq8Lx23A43pqaXhGTjckhnfE6kgK/vRdsegruyk5GgEfrmX2Utp?=
 =?us-ascii?Q?FUUDV5yiwO9VSgOT9dPFeI+fAtpFvF1tQYj7Eb6cEuSoZJ3d+waevmBuQINI?=
 =?us-ascii?Q?6XhqQAYlUG8svR6j3BcBoQzv1YerRvwaD9HtYKy887gp7zS1taX8ZzeeMk/n?=
 =?us-ascii?Q?mZ9s/IIfA/UWICZyPpRHDRb3MCD9MoK6asC0DqN+U58qNpJ6R4AmrymD/7id?=
 =?us-ascii?Q?9nlYQRrXgoV0s7NEd+g1U6ZKt18bzY/4UuDUGMbI1ww3731HX2AiQ3x2dlmg?=
 =?us-ascii?Q?wLPCHaH1KqWmHvMuhEu3ZGOCftC3YxnKZY4dgXxgVR5RzmoDEJB9LWlCTY6j?=
 =?us-ascii?Q?uvSIFG7+WElcgUjTAQH9hrn7qXYNTFLIgTuoyztP9+N+W+NIB1zLB91LyhOs?=
 =?us-ascii?Q?CScPtlcdy0yyK9ML2RyI7XbpmpS3+iDHOIhmIXpHpyWtR2VngXqz+7+xFueH?=
 =?us-ascii?Q?x6HNUTkVL55H7EZJcoOEzvib+9/lgQPt6IZwuu8AQaZiZpaxtABaTj3RWrdC?=
 =?us-ascii?Q?aguPQ/ws+YU9TSHM3e7jLi8mA+InWldeMge3+nc86eH1mYZhxV72Ie+b/Rji?=
 =?us-ascii?Q?70xda+2dxxIIXd9Y1M5xYiWkFfFWh4vaELHxpXNz+ywUwmEQsW4uOAMJf3Iy?=
 =?us-ascii?Q?gljAr0xXbe/eDnWAOm0upmw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6ebcdd8b-c3ee-4b62-1412-08dc8e677d86
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:50:32.0111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 H2QZtwtf6oicnXsRIeklNAruAGc4r9MXt3gQKjvqC3ddY88kNGzDjX9suSi8LVJAXK6sJDOdndNj5C46YZ4WfWGYdE/C7pViJ7VMYMP/tV7TwfqtRuAFbeqfa+gzQ7T8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11229
Message-ID-Hash: UXF7GNDAJNQCU5I5A6XT2XHA26VIS2RY
X-Message-ID-Hash: UXF7GNDAJNQCU5I5A6XT2XHA26VIS2RY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXF7GNDAJNQCU5I5A6XT2XHA26VIS2RY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I have been wondering why DPCM needs special flag (= dpcm_playback/capture)
to use it. Below is the history why it was added to ASoC.

(A) In beginning, there was no dpcm_xxx flag on ASoC.
    It checks channels_min for DPCM, same as current non-DPCM.
    Let's name it as "validation check" here.

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		if (cpu_dai->driver->playback.channels_min)
			playback = 1;
		if (cpu_dai->driver->capture.channels_min)
			capture = 1;

(B) commit 1e9de42f4324 ("ASoC: dpcm: Explicitly set BE DAI link supported
    stream directions") force to use dpcm_xxx flag on DPCM. According to
    this commit log, this is because "Some BE dummy DAI doesn't set
    channels_min for playback/capture". But we don't know which DAI is it,
    and not know why it can't/don't have channels_min. Let's name it as
    "no_chan_DAI" here. According to the code and git-log, it is used as
    DCPM-BE and is CPU DAI. I think the correct solution was set
    channels_min on "no_chan_DAI" side, not update ASoC framework side. But
    everything is under smoke today.

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		playback = rtd->dai_link->dpcm_playback;
		capture  = rtd->dai_link->dpcm_capture;

(C) commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow playback/capture
    if supported") checks channels_min (= validation check) again. Because
    DPCM availability was handled by dpcm_xxx flag at that time, but some
    Sound Card set it even though it wasn't available. Clearly there's
    a contradiction here. I think correct solution was update Sound Card
    side instead of ASoC framework. Sound Card side will be updated to
    handle this issue later (commit 25612477d20b ("ASoC: soc-dai: set
    dai_link dpcm_ flags with a helper"))

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		...
		playback = rtd->dai_link->dpcm_playback &&
			   snd_soc_dai_stream_valid(cpu_dai, ...);
		capture = rtd->dai_link->dpcm_capture &&
			   snd_soc_dai_stream_valid(cpu_dai, ...);

This (C) patch should have broken "no_chan_DAI" which doesn't have
channels_min, but there was no such report during this 4 years.
Possibilities case are as follows
	- No one is using "no_chan_DAI"
	- "no_chan_DAI" is no longer exist : was removed ?
	- "no_chan_DAI" is no longer exist : has channels_min ?

Because of these history, this dpcm_xxx is unneeded flag today. But because
we have been used it for 10 years since (B), it may have been used
differently. For example some DAI available both playback/capture, but it
set dpcm_playback flag only, in this case dpcm_xxx flag is used as
availability limitation. We can use playback_only flag instead in this
case, but it is very difficult to find such DAI today.

Let's add grace time to remove dpcm_playback/capture flag.

This patch don't use dpcm_xxx flag anymore, and indicates warning to use
xxx_only flag if both playback/capture were available but using only
one of dpcm_xxx flag, and not using xxx_only flag.

Link: https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/sound/soc.h |  1 +
 sound/soc/soc-pcm.c | 65 ++++++++++++++++++++++++++-------------------
 2 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 33671437ee896..2a3da1d913776 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -815,6 +815,7 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
 
+	/* REMOVE ME */
 	/* DPCM capture and Playback support */
 	unsigned int dpcm_capture:1;
 	unsigned int dpcm_playback:1;
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 711b2f49ed88d..7fe5ee3bcfd4e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2795,6 +2795,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	int has_playback = 0;
 	int has_capture  = 0;
 	int i;
@@ -2805,43 +2806,51 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	if (dai_link->dynamic || dai_link->no_pcm) {
-		int stream;
 
-		if (dai_link->dpcm_playback) {
-			stream = SNDRV_PCM_STREAM_PLAYBACK;
+		for_each_rtd_ch_maps(rtd, i, ch_maps) {
+			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
 
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_playback = 1;
-					break;
-				}
-			}
-			if (!has_playback) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support playback for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
-			}
+			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK))
+				has_playback = 1;
+
+			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE))
+				has_capture = 1;
 		}
-		if (dai_link->dpcm_capture) {
-			stream = SNDRV_PCM_STREAM_CAPTURE;
 
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_capture = 1;
-					break;
-				}
+		/*
+		 * REMOVE ME
+		 *
+		 * dpcm_xxx flag will be removed soon, Indicates warning if dpcm_xxx flag was used
+		 * as availability limitation
+		 */
+		if (has_playback && has_capture) {
+			if ( dai_link->dpcm_playback &&
+			    !dai_link->dpcm_capture  &&
+			    !dai_link->playback_only) {
+				dev_warn(rtd->card->dev,
+					 "both playback/capture are available,"
+					 " but not using playback_only flag (%s)\n",
+					 dai_link->stream_name);
+				dev_warn(rtd->card->dev,
+					 "dpcm_playback/capture are no longer needed,"
+					 " please use playback/capture_only instead\n");
+				has_capture = 0;
 			}
 
-			if (!has_capture) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support capture for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
+			if (!dai_link->dpcm_playback &&
+			     dai_link->dpcm_capture  &&
+			    !dai_link->capture_only) {
+				dev_warn(rtd->card->dev,
+					 "both playback/capture are available,"
+					 " but not using capture_only flag (%s)\n",
+					 dai_link->stream_name);
+				dev_warn(rtd->card->dev,
+					 "dpcm_playback/capture are no longer needed,"
+					 " please use playback/capture_only instead\n");
+				has_playback = 0;
 			}
 		}
 	} else {
-		struct snd_soc_dai_link_ch_map *ch_maps;
 		struct snd_soc_dai *codec_dai;
 
 		/* Adapt stream for codec2codec links */
-- 
2.43.0

