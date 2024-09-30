Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E29989926
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 04:15:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61E5D162C;
	Mon, 30 Sep 2024 04:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61E5D162C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727662555;
	bh=+3iOY++1gWaDouYT9bhhdLFKqUAA/eCCpStrVxpCZ78=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=byzfQPDVjQzS67Rj2cerEj/VjTNUF82jArUqdiwmD5EMBjGE1ibbBSUMldB1SwGV5
	 krq0jsF5pe0tDKrAplXMVeOMmEtO2GdVtyHaMmnRhkXQCRm+3GNhVNXXvMEzA8P+oB
	 yhhvaUQc1codZsG4E3vc4gEHRUIyC3TgCilv2ehk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ABC7F80693; Mon, 30 Sep 2024 04:14:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5446FF80682;
	Mon, 30 Sep 2024 04:14:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6223F80676; Mon, 30 Sep 2024 04:14:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03402F80678
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 04:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03402F80678
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AbrsAwHS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEqEpE6VwipzVxhf2o+IsCIZsMxpPxdULWA/2R6kkIJ60kaLVP5r+InvCS/NHjmgPuAocaS27Dpw1dWljq2Ylrof2oLNF0ureLTqi7goeflEgR8b0tImeu+J6H9yKqMbSk6RcVgKxGwnLdVO19bZNdFayr1uez7PN2huq6JtscNky15jhQY/BGdfG/sYvyo1pE5fW3JkkoRnM5Puk54lEjTbwlmGBFScR38w+Uz6D05UaMmVNi5ey75teSttU26slqK4yZpOT2XOzEE3Mx420Itkq7YJaCxRZ9/Kr1wGbKaviu0BxWVRF/TGavbiv7gafbvTzx4s33OhkU1gBis76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMde+Gsewkg5yaN7cIsJHBgQ3crEs406DnvzH+HMtbk=;
 b=RnRscjEzmOATHLYxFMsd/NlQRxmOgKUsZLih9nF/6ZdPSYgE1Mc9g6lIjM2suQrnkrzhDFJUickw/SVePEEvPnbxgJMxBOrVg8VR49hv+QizNpifgPc5OpytS1XJBbub1Iw+ssY9hYfU1YANl1sMjPcJLhfSGLfzrAwEAm2tYpt44WkG/17/u+oC30DwRx5hi7fj4JhVsyRj2qexnptog7zqLcELyt8APPkh1Rq9tdK8YGj+7fFALVrfCpfjPMZL076ljyB6DpBoqwWEM2kJefoQhQ1gWWCRzBp9OW+Wdi5MuXQdQnuwRu9hMYArmW3YXEB2qDjYlUfCTgysCuboHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMde+Gsewkg5yaN7cIsJHBgQ3crEs406DnvzH+HMtbk=;
 b=AbrsAwHSBUCsEQXNfEbqLxqc/x4nozKGpVyDCf/HgwuxF34HEuQ1HqC3MZ1K/aWVU2PfRG/+s07ENiXDtMwcje1u4twxlPhn5wCUHIfG8cN9e9n1MLBQr3UUhjz0IzMUIgpf3hZnng2zjG8fEr1R42ftwc5DWkxF/5ReTkGhk5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5798.jpnprd01.prod.outlook.com
 (2603:1096:604:c3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 02:14:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 02:14:08 +0000
Message-ID: <87jzetlwgf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 05/13] ASoC: samsung: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 30 Sep 2024 02:14:08 +0000
X-ClientProxiedBy: TYAPR03CA0024.apcprd03.prod.outlook.com
 (2603:1096:404:14::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4d7d2b-700f-462d-63b2-08dce0f59123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QdI35MNTCLYkId5G2FaV9mHl0vBr9q9IoKvhsJ6zAOCkoKBqFXhMVBpbdRbo?=
 =?us-ascii?Q?S+QskdcW8dqJD+V5HU3Ib0t8oz4pA6JifgY8fFPE12/9l0cQWUWQESrVutPm?=
 =?us-ascii?Q?J6mIWoDJ15nLkSxc2voyzxQsXrxtxuWa6lloKBPEtMFWy6HAdjckrdHf4L4u?=
 =?us-ascii?Q?Fl6gFyQ8favw3Ibh6fHnV7bSVipqMyfiC61TD2IY5oPE/SfuL/NmPPult2yl?=
 =?us-ascii?Q?/MSDNoZJp9rS99Kb7N9svFXJ5ES5B2z4IVgjDste0LBAORG4hbzvG80DHwqL?=
 =?us-ascii?Q?MDtpqPln71M8Pi5gNXbgJ7v3nSkWGQUYu8ciDmS2AHPbCzjxPNgTWcjYQpnr?=
 =?us-ascii?Q?2HCsrcil4a7VZ+O813eTcg+N0wWMh+2vRMoGb+Hme+ILZVHnZun9hZl/Dqqz?=
 =?us-ascii?Q?5dBAmF+ieGhiYwIzGqSiVdQabLMmIja4K8vfXt87PcboQIMMudhMWLDPP6ZH?=
 =?us-ascii?Q?O1NqOMbpR/pL5G2tVxIIcKP4hYEriXV+jNVW1Sw2+BmEswUdM6sn/sgVV4wx?=
 =?us-ascii?Q?fWgQbbge2fnk55Jv5u7xBu5GR706UqpsBkV7gS3uupqULANiK/q87kpJuts2?=
 =?us-ascii?Q?ObQ9wHbmEsWkn8wKAh1hJBQboVyelQX5KLNKjV9zVsIe6tripu41qMLk50OW?=
 =?us-ascii?Q?hwc3ITIsIF8EN5p3KlJr+EX7bFBFNOT9Ga2u+7zTU3eld2OT9ybmGDkBCkPh?=
 =?us-ascii?Q?9b2XmafT5j2s6WojYKqjqfweIXZGx1YCXUZnTlkmVqk/nTY5Qj1j8K8y72dZ?=
 =?us-ascii?Q?ICtqHIx4hmnY9ynYHxjMLtpKg5Tm/FxACkpMuOB8RRTQd032p6/UWVgVkhN5?=
 =?us-ascii?Q?zeY+6Oenx8gGGHyaVYUqOJ19nHCN/ANhVMRVt1uzkExTdHlek+YYoSZ6oYKg?=
 =?us-ascii?Q?UtFngzuC11wZLVw822ZCaAW2mMiJJTF8cGA5GAm2frGL1YG7um4Q03KuBFJg?=
 =?us-ascii?Q?jtU2+6FdnPJ57MoQ9LVUqx2kUZ6xBzCOhLEkLlRCMA4tFFGfjpbTCcoBuRhP?=
 =?us-ascii?Q?VkjYnV/I0wh0N/8FY/T3iXzoV0+vXyoQ9e+oaokQw8wRT0ve5AMlvUHk9eCz?=
 =?us-ascii?Q?jLU48T5dzmZw0UiQS1nGAIUgL9i4SEmFu+ywiIECQCg8tEojLroJ6OlI+1Nq?=
 =?us-ascii?Q?UhVv6KzrXEkFAayZFs6s6r4/4cWW5SLKWIanAbbKZ/82CoYS3oRMDDNsGkTo?=
 =?us-ascii?Q?ZmTaWxBbTfICgU/YbiKAYNfs7HCr9fTCItlOIyegtKwIQKrGVBawrtw0LwvW?=
 =?us-ascii?Q?s3X2k4KyMSrbr2sFJSeRtxsZ5dC9aSEyfq8ts9u/57eJGnB9wZkTMGfimeTu?=
 =?us-ascii?Q?S4t+aqOV3DLgx8EC6gW9Y+I4fcrDbb0C3qTQyIe2ivYZQ9DHLRzQ8Rjcqi03?=
 =?us-ascii?Q?wDmYS2KLEzZrFjts1YaWEeWsnbLNM/e+y3WuJbkSPIkb3VfkAg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YukRzQFNHAgjw9HSds4+t16CNLcW3b0zQpVMOx/mwQFKOdtdyQg/qC23xUha?=
 =?us-ascii?Q?+KOsxu+IRK8Jn3s9p0hd3wI5ruqnGPfsoNi/3wgjx0XAcjancYPLZQ6XSOYc?=
 =?us-ascii?Q?BgwPvoUUS0I1HndguNmHmT24vEAwudjtg9V2ngvl/wZHTg1Zmiv3AIURKIz4?=
 =?us-ascii?Q?oJkToUsCfwwMphCQBk37DwmH8X1KLQqeqGz8yCjKse9rtnMVQqkDhBR446/c?=
 =?us-ascii?Q?3g/uhyOETETC87yXOgz8LdPa7EbjIACKzkZYMjTiYCilyjyd5TYD2XElqat4?=
 =?us-ascii?Q?8YMbHk9j41huUVVEDqSJLcloUhxnC8nV0dwyRuoTEWzXT3pevy55xTBBLlxa?=
 =?us-ascii?Q?Hg46rDEBtrz/ia9kLU61xwTP5j/q76GzdTUCAm8OA/PhTwBpftX5OK6FuGMj?=
 =?us-ascii?Q?HtXTl73lQzStUf6JRNRnN3UUXv5NJ5Kpo0nQ8b0MADlduzzR/eKNuIkPNOb5?=
 =?us-ascii?Q?HuEG+d9awXRVKWofwDdxFcQ85AaRPQPJGogBnO5XIQHm9Khvl8t/myjKICbj?=
 =?us-ascii?Q?wBkXbQFxCBF9T6rpcOIflb1s+NNcjKFn39UGWt/zD8T4xLtlGPpNuontrGY+?=
 =?us-ascii?Q?/VLwWqp8LgL7rShAIkxrPlGiuI6OFOUoMkCoxlfkWQzSsSBOx8qhGtQqmaSN?=
 =?us-ascii?Q?DSb8aRsY1f4UTXlTumyDiool2uId5FOoD9g8ItWMh1OtTDKiX5aVMkP6t1fF?=
 =?us-ascii?Q?zs9axPepTiJSEUP+8sokiTgPExk3NXaqvV5b1lz4z7iHpnWVkYe3+6DyHdeN?=
 =?us-ascii?Q?Ast+vpYi+MZ0z/JYwkCtgTnwcIXs6/bsHThcNF+nKqwdvIm47WV9Z/2zVYwO?=
 =?us-ascii?Q?cM3mgDnKABu8rZ3SUmM8S3Yywlf5UwPQtyh34rTR2zY6u4Ct/gt0TpQIOiHm?=
 =?us-ascii?Q?YW2J9yrDb7yphRwwTYmQqL2MTBj8ug/lzozzqcJUqzGEil7FZCdUmqFPStNN?=
 =?us-ascii?Q?69ZupRbn+l0zWHcFPlYTKtfxsoO1E2ZhJgA5dR0pgH9Q3jhrwhLeQD2T3JOY?=
 =?us-ascii?Q?dQB9FU3dfwT38kbEp2KADNCqtwj/0tx+dyqVh2LRhds+PBNyu9SYLzqvFPSZ?=
 =?us-ascii?Q?tqg9OCgS8B1Nmsbf34Es7ZgBT3gZdQ6vI0Wd0mXZOpAiDKgZTpBVCpkRFm+k?=
 =?us-ascii?Q?wRj3PPRlrMjGuKRz0NKYdBWrLmeegPS3EcCyMSUT/0stn+H+5g6JPF/46UPe?=
 =?us-ascii?Q?2ux1Fi2z2MAXKCnzcf6GGEpBJuU4BC5d0GbzhNbf0i65qAaPb9AU4ExQNz6U?=
 =?us-ascii?Q?6cszmePQaj6zZolLFlo/21eNs+gq7KTTxMGRdbn4HK8pI+dNH5l0yQHkDzcd?=
 =?us-ascii?Q?+IWKOL/ICP5tY7loePib/MleHvsf9SOK4uuDvmXjJj3puJug10aJrEPmP3ZE?=
 =?us-ascii?Q?z/qG7E76gdPxSJVCzjzOlidcvU6We4pTDBf4+flpljIpN4ZxLzwf6nBPVN39?=
 =?us-ascii?Q?LssKZkIo7vv9MzNXF3PwUTQakqpReQikA6pLw6nbTeYLh12QfM5uQl2pTP2C?=
 =?us-ascii?Q?TDqebtlGz31dCrECLq9Z3WLZsTcLdLJoQPxTkAei2LCH0tzjY1TQDDpuEo/9?=
 =?us-ascii?Q?sBRHTWHXlyQFxxbIbxT9hwGOBh8O/+EY76mXWLujxv8TgI9R7WWZW4FhlBhQ?=
 =?us-ascii?Q?xIU3Qf9reMbGS02gbtlLF0c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0e4d7d2b-700f-462d-63b2-08dce0f59123
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 02:14:08.7132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wVkYMMsjbaNdV5DIJ3yWbC7MPa/jOHiR0lds1EdLS/d56AGupXrdyuK+mbCmXEi+x3K+btufBf0R8vmCHw7VaR9e8juQrw/zi52qlqq7vTpFdiLju54BMn34w8V+OA9T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5798
Message-ID-Hash: 5YVMZJZWQ3J447HYGXLXS4NFD4WN5KVL
X-Message-ID-Hash: 5YVMZJZWQ3J447HYGXLXS4NFD4WN5KVL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YVMZJZWQ3J447HYGXLXS4NFD4WN5KVL/>
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
 sound/soc/samsung/odroid.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index ed865cc07e2ef..20e17d0610301 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -171,14 +171,14 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Primary",
 		.stream_name = "Primary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(primary),
 	}, {
 		/* BE <-> CODECs link */
 		.name = "I2S Mixer",
 		.ops = &odroid_card_be_ops,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_CBS_CFS,
 		SND_SOC_DAILINK_REG(mixer),
@@ -189,7 +189,7 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Secondary",
 		.stream_name = "Secondary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(secondary),
 	}
 };
@@ -278,8 +278,8 @@ static int odroid_audio_probe(struct platform_device *pdev)
 
 	/* Set capture capability only for boards with the MAX98090 CODEC */
 	if (codec_link->num_codecs > 1) {
-		card->dai_link[0].dpcm_capture = 1;
-		card->dai_link[1].dpcm_capture = 1;
+		card->dai_link[0].playback_only = 0;
+		card->dai_link[1].playback_only = 0;
 	}
 
 	priv->sclk_i2s = of_clk_get_by_name(cpu_dai, "i2s_opclk1");
-- 
2.43.0

