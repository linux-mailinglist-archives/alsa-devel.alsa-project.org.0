Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3287298B1DB
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 03:42:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 690B583B;
	Tue,  1 Oct 2024 03:41:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 690B583B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727746928;
	bh=ALhqrd65SuVXb7aafbJ+b3Dw8tKpMD5/3rouNSlrXMw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jWWXJHYPvYCAf3zzEKPYrD89bOHeOyGQFAGemMQKmWOvi21DB3WbDJXayh3kjYN40
	 Xk450nP+d/LQQTltf83u9pKg6fmAUiuSbAD8TYhlTHRcrbVWUy2BtEq/WkS2naF3gS
	 TlvhV+c/l6eVb1dkYmR6lTCcKkBtLbJo70DrM3GI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51262F805D6; Tue,  1 Oct 2024 03:41:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E939DF805E3;
	Tue,  1 Oct 2024 03:41:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19827F805B4; Tue,  1 Oct 2024 03:41:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D665AF805C5
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 03:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D665AF805C5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jHDAb//y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHekD3aI9RYV7xSwagIA4qljxN6+VFZV3MjVAhRN0JUsyfPym+yc6ts6ylXyJPekTHexMBageKOiEemPm4DIotZx4AEIwZIEDOOqxe16tWLipFDJUC+vL8q6xUGbZ+zXfOer3mD+ZRmNTRk0w/syt2KFERr64aEO6b0IFw+G+Jvkt8nDaHvVR5dba6hN/KsJMsJmAPaYuAt3KJjWxMictOwAww+KaslFCQD+F/qYoqiewwS/r37uHIS/NaaWMHq3+nPUxbLfPg8T4uqAl7bLGicVTAovFvnxl6UsDhIAKYQyNIyKI/yKtatYEb5jGQ+PN69d40BpwwC2RRzdGhnv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5S5aFI6c4nSVcLcbE70zRaees1vSSlb6aG0QUAAGaM=;
 b=LaDR8gbSa7QiGGSkAu7a2cEAWjWFY1duL/Oy2RVjUICZl7UheyaBn9UFub/I5ORj8jlZbNJnQu9SaKEDdEUji9/vHVrUSVX+BZ7Rmxky7BnU6toEUBd0etfjRCQ8I/kf5iQNRjKwwWXswAp79W9HlN/3p48d1J/9/GsrbbnFHd/KQKmoNSZ6pcuYXHadV3Na/4O305ij/26dUMgolZIWT+LYc1u5/AdNiz4KfqSH9A8sxcgbQyq2RyuNQEBHpxXrj3Qyni7cZFM2JAH5xzXPkUFJ7LUpuCrk3iEXHCKeu1HCxd1Oa2uAwrOzzbXBarYZoZzgu01WFr3vS0qN4ImwYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5S5aFI6c4nSVcLcbE70zRaees1vSSlb6aG0QUAAGaM=;
 b=jHDAb//y3iZicMmt0KO6r4q65vG3AJCWB5+6fCvjURHxl64S9B3XZ2M4Uo8RHUM3JkQwBN4UazQzTde3uiqSxv7DGkXGGZ5jn9AjEECU7+VtK0LuIicUlRnIOhcltecwUYSXPCb2aCumKNaWyiFC9IV73lfWAMjklzfC2Md3AYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB13482.jpnprd01.prod.outlook.com
 (2603:1096:604:334::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 01:41:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 01:41:20 +0000
Message-ID: <87wmisvbun.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 01/13] ASoC: amd: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
References: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Oct 2024 01:41:20 +0000
X-ClientProxiedBy: TY2PR04CA0021.apcprd04.prod.outlook.com
 (2603:1096:404:f6::33) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB13482:EE_
X-MS-Office365-Filtering-Correlation-Id: d00d91ef-6c17-4bc0-dfb0-08dce1ba2684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?upJ6/uPljjlQk0eF7NV6PKHbGGPfr9c+OTp/YpRGmX+qqaLj0WiGzka7IJGp?=
 =?us-ascii?Q?lxTHU1cLJPZ865y4WtToDrScSnhdunzIEIEDeEBCO/Re2aaUrYt7IJomgBTI?=
 =?us-ascii?Q?/e/P8lqc9eJ+xrHVoPZsOj73lw7/2b/+7x2xv4n0LVLP8PbKFC/tUmZCby9i?=
 =?us-ascii?Q?S2muRyBs7V2DUkchVUX6JCi1sED3K+IK71vfrTBeBB++41/0+0+53ngX7RLT?=
 =?us-ascii?Q?DlmZAeuhKvVTgmUPfDcGMnZDU1oBlfij9COFYtaAZvw7nmQ1ui3Dq98Dqv84?=
 =?us-ascii?Q?p75duQxr8JIteGz+vQ1jRQRTWjiN7tVPti/y8KO/O6FQbIQpzlFejGIwRuPr?=
 =?us-ascii?Q?x02C+KY5KsZhpdiH46AdKci3MiDyTq2R5TL9KLQss0Ho05F3F+aGNN5toj28?=
 =?us-ascii?Q?fJSmKKtEAYlRokjRBRzu07oJ/12GCCeJbEObc8NcMAOkKBl9OqIPYgHZfxn8?=
 =?us-ascii?Q?9itv0ux2o8S3J+vpxibh24rxGkn+dzEZUme9RM9GKYO2Dpb5UcZIN/l3BW3d?=
 =?us-ascii?Q?HEx7WNA/6P+wLDjWoJqreHrGUJK7yuxC9dIsaM6GRe479V3YHz59gXOHut+P?=
 =?us-ascii?Q?7G0utAN9CzifKB5K8/zASfl6/srWNcWWyQ9ywOfu9DFrpdBteZ/X835jDWH+?=
 =?us-ascii?Q?4E4JaGqqKuw+7QSKjPFo/e42QqA0dJZqvsJ+0qV/1wySWi1h8jSx2N14xEFP?=
 =?us-ascii?Q?0o/GGUVN3AWBl4ZQ6dLnJyTkmmiMDtazRs0cXFFP1Vu2jmrWPvwNH7cjet8Z?=
 =?us-ascii?Q?j3fPjs5ovUve450zoY56BvrkzgQMLs350iMc1e+mpZ91W6nbluIxVfOTb++2?=
 =?us-ascii?Q?ptFD0gSEOSKrl/MFJda3AVKwGS7+2MZmEyJbul738XDlXzGDVgwUhaZMsFW8?=
 =?us-ascii?Q?swYqjaERPAZsmkeZX75MnGF1IRkjHfPZPZ2sMwBymlpiqKO1rUxUimAXqrtg?=
 =?us-ascii?Q?2KOTwgM8G2lQv7ApvS2mKx0XP0AoK+to8+Jt1kmG/jx2EBQCAuY+KKSM1qPq?=
 =?us-ascii?Q?8WqkVk3d+AsYu5W3am7AdCfLyeajkVTgVa+3kJuT1/nTBd+I4/c/ec9TjH4n?=
 =?us-ascii?Q?CqByoNmA2SvEnAXgRaZ9gOYAledyG/KC18q/jeIYo7Vpsdd5OhHR3jGXrVUp?=
 =?us-ascii?Q?HgelagYLvmJ9GViVCqP8u4Dn0fgS1JJgGb/5sSa17ltjfc5q2PcBUb3M1qGx?=
 =?us-ascii?Q?B+uS2hdp59Fnz3s8Kkl2A7qhfpij3OG7DN79xKC76NZkX4A8mVWfCwqlYc6T?=
 =?us-ascii?Q?fyHfkKTwU33jDne1FZ87ylfX4eOD+qvDFv1o+p2IE5ESZZ4d2ncZQvu6QQdI?=
 =?us-ascii?Q?q2MEX2B60qGK38lwKaVKAU0n2Y5gUkHxOBTsbuuWbqHELg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U1sQAt3KFGuAQLa7av8JRjsVPKwzzyVmMuZmbkUPl0pGuIxfbf/SxbLriNFo?=
 =?us-ascii?Q?07+OmsJmJen16FvTRNf2WyZT6IRxYyIHgQ7Ne3ndA8lV9Q3NynKq84f3KQH3?=
 =?us-ascii?Q?iM9Ti42IjJrGL5yVjrxtWsu2LyY1uAAUXaMqeKF4BBS9+Ho+lztCPy+35vG9?=
 =?us-ascii?Q?DevHTA+Q0AgQdTOUbzyTCYF5ncJciJ+ctnle5p8vxmDc0R23l3JGUrUecZGj?=
 =?us-ascii?Q?AlXCgM0r2MSverblyDMR4IqJuwA13oCXoWdUO11O9+t32XziqhWbRDRf0dts?=
 =?us-ascii?Q?j0Age5hNUxPMtPlLrcZfp+KCvEs/SH/AWNnneA1ZKFwPBh84W/MaYYHpE+pz?=
 =?us-ascii?Q?8JzLHxs1VkZRd3uRRUR7jgjx9Z/JIiix6udQSjPwPm6LRfLTziKR2yezt24T?=
 =?us-ascii?Q?1QcATQ/mOrXvYjVvg1vZLkFplOdACHclZgHRKbPmECNMXB5I3j5JgeUQ+toQ?=
 =?us-ascii?Q?iAAtHsL/CL9jCeUiYx5AT0yS5JfbmdrRlWbaH5yk+8xYC6Sa08yLDbqSQC5T?=
 =?us-ascii?Q?6Jipwm0pC6etDgdzg5fTG4r/URchpMNGLYbYoXAwYsPmlR1I9Z1L2orQbEE9?=
 =?us-ascii?Q?cqOCekNLchKU8QWeJe47mdXM44RMbPkq3TK6FXdn7ddeOpXMEXWVyQpMbHks?=
 =?us-ascii?Q?aHhf7i7WQBwty0IO/t3uwQ0L4w/cwFQf8m+vCA27EM+mHPMpw5VJncUH/YF/?=
 =?us-ascii?Q?FiWyCWqrRQQpZVtv0Ew9JJa+pK5SIPnesrz19oWOG6/W4zSet2NpUoRsrO1Z?=
 =?us-ascii?Q?uYpThtgilS1c2dA+gnJl1YB2kDDfvfQ+SoK4Qon6KFybEMw3BBpfdZeZMoCw?=
 =?us-ascii?Q?nNxxzIa9m1G38k5ZNU7tG07TvvkGl3XQewVFJyNdqRyxspsQVTAmQZeO84H1?=
 =?us-ascii?Q?QQwOUhZyvGXCxkYZC1xBEFyEOaxYZm/H0jH7nJdv+ANM9PwiRAO6ha1YcrAw?=
 =?us-ascii?Q?pkf2OOQ4e1dvZh00O7dL7/rYGAwK1t9UiMVVxLyuOhcCSK8fC+qVg/ZYvRok?=
 =?us-ascii?Q?5hzid//4ESmxyv+SW9g+8eaH57PsVNUx8+RYFJiyhAqu18KOc52yd1sGqkKG?=
 =?us-ascii?Q?iPOsw0jLU/gDvETguaRVizSiZY+GU4D3JCuuKOEM07torkB4lC5EO+v90FfP?=
 =?us-ascii?Q?s5B5RXm0vFKVPt1xOnDuX+z1hsM8+8fE3B14ky9jKGvOJFymrRNqVG0FnT+y?=
 =?us-ascii?Q?nrUw07GYmJgSYG3vGpDpvAf1NF0un7g+xN7NVHaYdYdXw8sTcMyp7znqijvG?=
 =?us-ascii?Q?AEosGbugvM7aaXTaBwWKHEDATnsoO92qCm3uqqmTrY/4SXc8KD+atp0nYT1A?=
 =?us-ascii?Q?S4KVmCp9w/8J/Z6BGdDv8XdGxrA/ADRCRl0zN4wMqwObEv/F2TxkAuRqo0um?=
 =?us-ascii?Q?pLTmThcW3xGeCsnd3PHqybtMDtN5rcEf+n6q7g++mxl0z0kN1ucRXQ9rjA/b?=
 =?us-ascii?Q?8o/cRoFmRrr2mK2k92nbuzJqonc7XiNamD4//meXn+N6OMNVCKKaMqOAuT8V?=
 =?us-ascii?Q?ADqf4/CIMaA5n7EantF9/qT1hf9OVfZkGspnM79/mC723pfPb3ptfXKSBYe3?=
 =?us-ascii?Q?13KybrpVeGQWpvEd5TYR/79yOZeerXMh9XxiTbHCa9/KmpyOSTvnXLng4AI6?=
 =?us-ascii?Q?LxdA/LnRZpLYMomOo33RgIs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d00d91ef-6c17-4bc0-dfb0-08dce1ba2684
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 01:41:20.6898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 868WAZfbyVbnez1IqLJh8dWVDxDdU1ElKhiHi5VvX3vbR1+E5gDqZfQtL7E+bcZeRCtRj6shb0J460DomzRZ3DNq/7jkc1DQwwQprR6q9l7JWdj9r7+8zb0Mj+Ai/zMU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13482
Message-ID-Hash: 7Y5G6TUQUGBLHOEIXXFHNAFN43HO6M5S
X-Message-ID-Hash: 7Y5G6TUQUGBLHOEIXXFHNAFN43HO6M5S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7Y5G6TUQUGBLHOEIXXFHNAFN43HO6M5S/>
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
index 77cf72082e73..02b04f355ca6 100644
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
index 3756b8bef17b..0193b3eae7a6 100644
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
index e9ff4815c12c..aa38104b2704 100644
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
index 357dfd016baf..4ca1978020a9 100644
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
index 7878e061ecb9..2ca904db82ab 100644
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

