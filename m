Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A953C9472D8
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:08:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B693057A7;
	Mon,  5 Aug 2024 03:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B693057A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819847;
	bh=DyB72PZQquq6/TIyhC3bDsoGs4NsNv6sFQSLzRSylrM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sNPW2IZZqQuZ2YB7e5rxpJz5s/FVcDfvlz+scNyYJzhtrnNpjxywNsZc5kY5LBfZa
	 FNFLxwR8JUFETDLH6Z+3gqtHz+A+qyFnXyTwAdtFW9480QDEEShAn9pTpIonHjkIR/
	 RFoleSrAq6F6TMKOKeDZjcAgzYxxrYY+UlzIsq2g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC527F89E20; Mon,  5 Aug 2024 02:43:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D430F896F8;
	Mon,  5 Aug 2024 02:43:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86646F896E2; Mon,  5 Aug 2024 02:43:17 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B7B7CF8962A
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:43:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7B7CF8962A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fYzAvyHS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPR5h+gmHOVrF4vRlAiAF+E1jRhQLhsrURBxiGpLiKZNPAZJNyCqJ55xAnIUAI7pAlemd/LgVCybbX1EnBtsDJ+aywH00pgv5aJA1ff71TYkQ/jhWOIo0Gh87JGDDT+aUD92+JoftX7AOK39PSMrQAofNMj+K98eOpcAn+57hybuA2QMPKD4hl3bM2cfZG/hNmE6uBCuQ//uJAWc27UjHZ4O5pNXLg736BL6IBEgeKeMUpAKNzwKGhkQn3dEQ5e1YsSPckkGWJzbyIp+x8HGbsMlR7aKbLpkIg3pfYv/mLmLNOlJ2HvcK8qylYhaWDhmXO3EcGTqPmrFpYCYnkFUuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63Ycz6sYFGLrY5mF+DGmuYvhiRv4Z3bOUMDnQFuy5b0=;
 b=kk6ZsgPP58Ulj20cV68a7z6S93sqkjimHFKjLRUMicAGx3uII9m9+zcpZNCppmvjD9Q/YNNwUJpnglSt5OQ3AAHAZA+cgHnbpdxLaKNf4PfsFIoJwEFrnUlgsgDrwgQkGiFus+Oh2aZs4WbZGhR22ZwyNJzGH9LJJ1s0oVBd1WC+rWRtlhE1UXjUEQ1DMDJWeoskSSeKFrtl2u+0XmmOOL44st59GSH2lvWsu6XHvf8/lRBgvjHMwEmCsKWws5Bav26yL5lyA001Vf1oOVCocgbIoy/7PeHgEZqAGeHkMB4TX5JNp+mNZDFHo2yNlT1tkr8++b1dhwzXCBflqQscjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63Ycz6sYFGLrY5mF+DGmuYvhiRv4Z3bOUMDnQFuy5b0=;
 b=fYzAvyHSvDutrEMLrmdTV4syXWHSukeT/GsT1ApWhUMAAcffg6FdcxfRdR3tIog+0HyGxzP8bgXwXnnda3MG3+4OKRDn9dc86pkUQpV7TBQEcNo8vNfDAb7t5JqFXEZBhqq7dgAV3ANpeiRGHNiIYu605OVKZX/qds6/UrglD24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:43:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:43:10 +0000
Message-ID: <87ed73x0iq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 093/113] ASoC: codecs: zl38060: use
 snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:43:09 +0000
X-ClientProxiedBy: TYAPR01CA0099.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c84c0ef-5bbd-4bb4-0cc1-08dcb4e7945f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Fy5YXpWABAWuHA53xFqFvLd8WHkf1ke2EiSkc19ayS2SGbljMcP9M1e6RHyB?=
 =?us-ascii?Q?9riacE8NMDlm9GY5vmtk/CT/n+OIhQBFemL6RZBMZsaAW3ujbtsOewBEJ46B?=
 =?us-ascii?Q?/FLZG12OTrKUt4bF6/v74FP0D7y5ynZMwr+acoOU+RRjOaTZPvqUbezqOXTn?=
 =?us-ascii?Q?yzK8gjRzRN8J+tZp0+YVQ5GYfQ5XiOo2Y8Jf8AEMyzH117x2DPTFeMzKCJYS?=
 =?us-ascii?Q?YHlMtqVma0s1Loq/EWxJXiMnjiS3GAvYJvPmJTSCtfRXP7NB4nLPO9bwd25V?=
 =?us-ascii?Q?vNl34mx2LK3uITtyukDvFrg17Q3FYGcwm18GNMwqG4WgeafuvOJkRbjts8zx?=
 =?us-ascii?Q?SOzob4/XfWBec4AizkcQa2dlZvlsON76ONVmambR6V3M9+AvHLuiK/QqoP4W?=
 =?us-ascii?Q?CaAKvkgltP1oRtbUjl5IDscrVB5Uw8F3ekMlc7a8JA5YVn4qHlVpQhoUXQQ4?=
 =?us-ascii?Q?uxD+CLY1UtFdD2u3fVI1xejDiUpe/xmtofOi3i5Xd6kkBa+lV/cO5+slSoUb?=
 =?us-ascii?Q?BFND6a14IXtLaJO7Ue0sSmZRX+ppqgeav+M/e/0jzovDAya+qYy15D4pOSK8?=
 =?us-ascii?Q?S7IJAal0S10sI3DGXJth0OqqFt2DR5kHEDTNg115Vauvq6aykSnHUwYUHkbu?=
 =?us-ascii?Q?m519FsMEl+D4SjPZbRH1eil80sBQyozZMBjLhvlvxsdqT+R2vrWRta9Ubvhd?=
 =?us-ascii?Q?qTnOfSNZiRXj0bkZg1va1gq2J1dXhbdqSYCkg2w3AA9OCcGkBzsUInASG4Xf?=
 =?us-ascii?Q?oFILylpnMQ9wpcQBEKSSrHwAhpY6s06HNk+zKUuPAOCUFCMfF8KkiNX+906X?=
 =?us-ascii?Q?F/OUEjorD2ehHG3KnGAWmPpmGkp6Hl7d8vFw24PVaCEKSUmx0WZVw5sxclMi?=
 =?us-ascii?Q?o/KYX0VvxLnTxqln+PUwpyylwXD+qSGLD7XiObgHSf9NnkAU3PGvG+dSgl46?=
 =?us-ascii?Q?I+DIvdCtN+B/OyGaKIr2MAE5RJdrKBcBEmZwRSAND7P02pN7Qizo+vG8Ogq+?=
 =?us-ascii?Q?3ty/Ug7op+aj/8ldFX6LV8v8p6+ZheE59kGylnzdOQfYYRwYbvr8LzOKu7FR?=
 =?us-ascii?Q?+Z1Q+JhmFwYpuaRfMkdfmj4x7F+laAS2H7AnsoleXWw2jwsRCDM03920fza2?=
 =?us-ascii?Q?yDlO8hn5KH0cZfCDmHtxKi1tKu3N0BA1fHxomkTP8TcZeukUZ2w1K9l4hBV2?=
 =?us-ascii?Q?F8eJ/GwVO1m45Lc+/9W0V6RIyimO3R5bCU9tN9iwGl4FNaiygoPGM9T5qgHd?=
 =?us-ascii?Q?C2HefFCVgCQ0lrMhF00jYegH/XB5h7RLpj6SIglohJRYUeIPBNQ8m/1aeQNz?=
 =?us-ascii?Q?bKEngSII8YvsHCK1Um6fUAv2KG37OFIUfoB4ys0uvhO7phtxfb3xT3MDD8eQ?=
 =?us-ascii?Q?tjsvA/xw9xafbgx4qdZIyWZ7FG9vfmixQCxOJ12ugwpmeQS0ZA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TU3I7yqGodbjXs3/xLjb7uZmIroaw8Adq0xwbTt4oV5tYRTWUA0pHp4sljTR?=
 =?us-ascii?Q?88g3VszwZLCeoHjnULarh2kNeER8oGH/Wd7SF8xrvDwfX6JAxgvVl6JKvGQJ?=
 =?us-ascii?Q?jtTxMYTcaoS2q1x09H41iWai9EN9dYDuUoiVOXTG3yda31qDXvsq/MUgVDmf?=
 =?us-ascii?Q?VnjXFeAwFgPALoB1H5YFBkMKijgqTguaEJmGpmNPPMZB2XSnbW1YuEaKTygG?=
 =?us-ascii?Q?MK/X7NznJXWxbFp+d/WG2Swb8pkz0vidWTCVhWZE3/rBkwfdXSQqDqGnsNYq?=
 =?us-ascii?Q?38/035BCYkJIiYWL8P/InEwsZg8+Py/DLvZXErcj0gTrnFsoo4yE22K2hiky?=
 =?us-ascii?Q?E9bixEDdVFE/lyvzDXI1+qWqAp44r1O5kdMSXg+wqzwB0czMtLlo9+HuxSvi?=
 =?us-ascii?Q?/kE24xbHNSvAYn8pLNtfpKUK5usjGDunWyGCaOx+nigBzc+UJzg2DyeJk0Ex?=
 =?us-ascii?Q?KcVWZ5RvFHHG79YiHC54kV4XOLxbM5VHZN7dSnU58lzAxJVR7qL3IU+2EJ7w?=
 =?us-ascii?Q?2w04gs/dtzBeyJRPoWmVppdPofeICjr2YW3VVT/v5oUv+V2puuWg7MJqUy4w?=
 =?us-ascii?Q?6soB6wpuH/eOnyJ+914Khqllzk2RfjowV9HVS0iM8y/+aGIf9ErjFVL1RQ92?=
 =?us-ascii?Q?20/crqwDlBhXul62y+qizxYqUXYNhA8qT37hsTtmFV8JERZxLQ8SRZmblC4V?=
 =?us-ascii?Q?Hqppm2R3GWbCJmPGihcw5D4kiStjFEsn6U/cwFe3x7Ujh5b/DOBdOI1vqAER?=
 =?us-ascii?Q?TI3Su4UZ3ofIw/1UGeNozh4gCk+/k6ZjOQh9jMjjKpDG5BqffJcS8lBOY5JL?=
 =?us-ascii?Q?lLK7DncKYABQWZJUUZP72MPlXKPsedAMHJhHJq1cq43u+cxs0YqK35ME+EGD?=
 =?us-ascii?Q?TwpbyV784/ezJXVAg9ZJCe0kFl1OU1Ipu5PVMwAOb+3YahaUDoqolTgyfZI6?=
 =?us-ascii?Q?JeorSr6mqBi/pOSt1Qmtr2dVzOH/L4FSgKrHgpCLx7BP/ObasQISOccJa/gk?=
 =?us-ascii?Q?j6xL1mIqzbW9WZ7EtKL27c7cnYekYmHVhqjvDVMlXahBHCrTUlLzAX9xbPhe?=
 =?us-ascii?Q?aFks3Z/6LFNQRk8DY2POHm7zgc1Fmw0e2Yxv/SDuVxhZrP3zmLnibmJ9S1V4?=
 =?us-ascii?Q?GU/yCYF3b/h8pG768Oi0nXUzvVd1zEqJW5/SIHwQAQPUX8ZxRuydbCEj9HGW?=
 =?us-ascii?Q?o8c/TzDyyPcFF4EoL593PX9HPBVVw/l9ydQROGNEbBKulXRNCOkhlqPfYkVg?=
 =?us-ascii?Q?lsptDf1GiM+M+cpgn+/FUSz53cDNGflrquFsXpTQdztju/Js4adTnTAHYNIs?=
 =?us-ascii?Q?7F9VYMl4ljtZX/hJOavOQn9dk5LYEQXIWQycaGhoWpB6NYEW40Ryki1Ikc2m?=
 =?us-ascii?Q?4pCAFynm2eWgCq6hEyK6nRZeSVECtUn2J9yLk2N0XOdXiBuyuINe4/qf2sO7?=
 =?us-ascii?Q?/Olb8Uv1CvSaAAHcvotQFTYSzXWvOoEj6T+4b0673BosWMhr2gDD9gNj8TBF?=
 =?us-ascii?Q?+TGWCYA0s8D9UyawOJM5nXwST0MzSwydLekGrMcigFJV5SKa5OT8zPOs48Wt?=
 =?us-ascii?Q?tfpYY6AL7Od2FHWPcIZTZGx/gEuun7+WkjS6sWtjYA6FY/jEz6AHqGBa9Ie5?=
 =?us-ascii?Q?pvEx85xI6/R2qOa+hFE+kfQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7c84c0ef-5bbd-4bb4-0cc1-08dcb4e7945f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:43:10.0569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HSLoJnrSJ9UbM7W0H7UxprQOfo4rk9wALpSDq+OJ6WnbJKbf31sVJEBoYn/WPkg6nx5y3ylQAc1/nEqK8DUL95zqIQb3PgpZT3DejU0Fne0fd/TDNS0scL1UaCsM8z0/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: QYJBZ42S7EN3MK67Q6SKRGBZRHVMEKYY
X-Message-ID-Hash: QYJBZ42S7EN3MK67Q6SKRGBZRHVMEKYY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QYJBZ42S7EN3MK67Q6SKRGBZRHVMEKYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/zl38060.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/zl38060.c b/sound/soc/codecs/zl38060.c
index 28c92d90299e9..8650c9ca0cefd 100644
--- a/sound/soc/codecs/zl38060.c
+++ b/sound/soc/codecs/zl38060.c
@@ -271,7 +271,7 @@ static int zl38_hw_params(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {
 	struct zl38_codec_priv *priv = snd_soc_dai_get_drvdata(dai);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	unsigned int fsrate;
 	int err;
 
@@ -317,7 +317,7 @@ static int zl38_hw_free(struct snd_pcm_substream *substream,
 			struct snd_soc_dai *dai)
 {
 	struct zl38_codec_priv *priv = snd_soc_dai_get_drvdata(dai);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 
 	priv->is_stream_in_use[tx] = false;
 
-- 
2.43.0

