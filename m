Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBBA9472C9
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:03:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B52805701;
	Mon,  5 Aug 2024 03:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B52805701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819610;
	bh=Yp4xMGekwNxROV+Qe25e4LfJLZJF7rQdfRHuhAHnmo8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JmOcyC6TnIP2kQwppxKrN1PjlWIkg5HqI2hmpsTG7MaZoVeEGM1KoOMUCcV5BeIGY
	 oxkAEL0RrqHYDLKV7rTqBK6AqZPXwS9X1yy5eBDC1tquv/XmKuV7Wuzb9Q/+HSlBX7
	 ZP7pjZFlD77hNL721qZ9qm2V5dABejkaPeKQ0a9k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20B13F89CF9; Mon,  5 Aug 2024 02:41:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0880F89CF6;
	Mon,  5 Aug 2024 02:41:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2E8EF80709; Mon,  5 Aug 2024 02:41:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E995F80852
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E995F80852
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PhMivvB/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVj+JklJb0ei0xlX8eAJ4RYfvB7tESuLKniDL3XyrwACUXbE0EMY4rRCxmNHojT8Ut3JKQa+ifk9FCfaNLC0Q2onDrr9eif+/93hiZPvS02i63hGgD8tVn8xh3SBaJ5hkKq328iFldXk6lH5sVNSD1yLCtqruwALhLw4OsDSuxUl2NUoW6C6YBzlJ8boB0rdl8KzZTByVe1MCj8OesPXWD4+hFc9yUocZH9XW02bFfZATb7oQNiD5noO4uq+pJW2wxPAdP5Qk7JEqWoFVTKmpwRD8nAjjp6BT29dSc3gpt34DgCAIJtOYtgBQm0/gvKDaTNGRW8F/qNVT10vwHoMdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkJQcmzUII00v2DqKXCg3TSr4cN/9Yrc9HHtUggOspw=;
 b=sweA7+48dJ5S9qkBn8nEBfwpL6iMNUApkz90m9CCrMcdMEQnKrbM3Nij0p3qSpn+KRZ0ISWBchMEwzxMAhcarJSYJTSXlF5QYcrBtBt2MBn3rynK80W6DfADQdpYuBTsj6DSRbILXT8DDZeAtn85vEckx/EsKLhuwkaFxk+LMqvn8+Zlf4+yM4HlOBc4Ggc0q4IN7/VUM8Eqi9n12Doz1mXsrFsOOdOZ/N5iPutpYpb3zsAL8+8/ltzXhSRRGJqnDfC0pwt3IKj9uFLsQ4M6iWmPaRPs9wshO+pU+HZdFJny1cQecja2mMa1wgQmp7hlZioxMIayR93b2qdts7BBjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkJQcmzUII00v2DqKXCg3TSr4cN/9Yrc9HHtUggOspw=;
 b=PhMivvB/XCyRiJzQy+uz9pttMpwTpnualYt6Bh7s8dLEuB0XPmwzEe+r2Wkx5oqys7nO6mqbeUo+8HQAxjIXJAY53PV57hUXQBHmi3gxHDkOuDKmIsGkWZq5EGj0bBruDRAWIqN082zEwXg3zA6/cG9EtW0yzFjZc66QUMqaOyU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8678.jpnprd01.prod.outlook.com
 (2603:1096:400:15a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:41:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:41:35 +0000
Message-ID: <87zfprx0ld.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 078/113] ASoC: codecs: ad193x: use
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
Date: Mon, 5 Aug 2024 00:41:34 +0000
X-ClientProxiedBy: TYAPR01CA0142.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: 35bc20cb-8d00-4bfb-ca59-08dcb4e75bba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5Xv+47CLAaztOvC65YrcDvfGrShsWC5sk1+SXsM2EGOKmboVPxRQuL/TIYiS?=
 =?us-ascii?Q?hfNTf9HejNrYQwzpw4yCDQTtSD+ipeGVaP9/vsOHN5PVdIsCkuflN1X89Uz0?=
 =?us-ascii?Q?hNtdClZDccN0MPx28vE9/ej4i+JAxnHEqlDzIqC5IocM6BHfc7juSZeYe/Z+?=
 =?us-ascii?Q?YLPCSRyDrT/3HvEcgQT46D0NO7pxftv+eS0R5uwqjd450VdYAsB9I4ZAt0dl?=
 =?us-ascii?Q?KHY7ni6eC7E538YB5zIRFzdkGycKC0muhgLWwBHNIuRZhvNO8p7baNs6N+nH?=
 =?us-ascii?Q?SXNDBxPpDwMR3wWCwxOWeDVKR8X3+ltJh7Qyhech0QBUtLcxl3ZvxmrHG6r3?=
 =?us-ascii?Q?aOhAmN+g8O3LML3agLiYs97eOtRTlLduh6/Xz4z+yjpNKbTjCEVH2Twy2ZDV?=
 =?us-ascii?Q?ulrwEwZqaTSjmVeh+Dp2toeSdLtyFPKD9rv2fUF7fyejpllqCJ2mcM5RpZcE?=
 =?us-ascii?Q?4uomGgX1MIiRzObOoOcMyfWPZ56nJTP4v2JLE4vkV4QM0Ing+xll1ZAKIFhr?=
 =?us-ascii?Q?fK7UDERF+XSaUFmTWBsQst/a4unFioF/oxjN4Z7/4bHkdlvziAq+FU1Z5DGe?=
 =?us-ascii?Q?Qjp9tsjgAG25W5+brIkBbpuAxb1SbRUcMOEfERyvsJVydlZzhe1vsz3LRq+H?=
 =?us-ascii?Q?ONkdVcOR9NyZ33PLvP7C2r0VqkpTtU3p9wL9GoB9ZoSLBSBrvvGXLpdpcDgQ?=
 =?us-ascii?Q?zXrGsmAPTJfS9gnZIF9Rbxm2K5kwxkDNgknBuO46j4d0EVa6Jaf6J2JsDSg9?=
 =?us-ascii?Q?ulp373XkJaKMVJC9bFnRGG4M7EN0NPg+QGWO2+Gzgz8ZgEdorPc0i/jbdhRV?=
 =?us-ascii?Q?HjkJs+v+5dJ6wjn4sXDAsQ8uGQaJ9W2NPZgs3KzftrttzBgMb/fhkPaFIYYn?=
 =?us-ascii?Q?pXzuI/xsB5kuZGzFUyXUK9218LJnl/5fUBaCmvH0AiMYali34cYJfPwZHCdM?=
 =?us-ascii?Q?txlcYajk7K+0rufOGfATCHQvpuIqWeHt9DVXOB3/ekRyIJf3b7PvH0eQW7Qr?=
 =?us-ascii?Q?cVweiSP5bxyXib0X3vOtmBjx4piGTAY6dvZ8Z6ItDvQblRi4FxpcRLacaRop?=
 =?us-ascii?Q?1nFOAkTZI/K2iHxgfTpV6i076RkNvQj0pXI11NANLpvGtcRsoef0C/IAUR+u?=
 =?us-ascii?Q?GIps9JiRRc0b22poOw1dro0RCOtkFWtuHNiJNOSg5yVU+7fK+SqiIeXI2aGl?=
 =?us-ascii?Q?xPKLNxBfeCGJ/MGbf9VRyexqJBSnLTBUxNpdey0F7p7V8T3XPvc67qKIZ43d?=
 =?us-ascii?Q?Y07cBtooIOTR+twPw8v+tRS6HX78FSV1wRoPpod2HF+tW75Ddy/x4Wg/ts7y?=
 =?us-ascii?Q?7t2mbztCfYkFS9NFZ8G3eQVjgA+r3qdG1Vt0G46V2bcXZx023BlPRwVs0YAK?=
 =?us-ascii?Q?u8kooJ+HEOX4LDq8s+Z/JC1jeDfrEO7GpUgCy6cruDNJOzaMdA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VzSbs9X8TDGOOh4F32hi+N646K7EuplMexL2eGmg7IdW1LowhtAaSbnoUycQ?=
 =?us-ascii?Q?5FeBhcyUeZgV8jkxpSN/1KOBUMS8/kevE6eY7CWL2Zuw7LqVwNd4jQCerIiu?=
 =?us-ascii?Q?g5TbYqaZ7v3l2Jef5Tq1T7Xs8OETm8ssbQKqU7scXn/WPX60N7VYohWs+xTd?=
 =?us-ascii?Q?Uom6c/iu9BnlxhY5geoqxopPXQyk/ZCxciYN3qCLs6BIXchXOFcju6d4Nqpb?=
 =?us-ascii?Q?4gy+DbyIujxQXWHo7z4GAea0bZ6833SCyJ25bUhz3cteEHkwk5cANXQR2NpE?=
 =?us-ascii?Q?xbct1+nB2E7loGgQxU+d8xoKmRo4CCvsxSlpbcgdEdrr5k+sDuDdTUcbMFt2?=
 =?us-ascii?Q?+xCoDah6fw/LS9cyBv0IiT1H3aiBMo4NjOKPEtYWbmp94pQ9fui94S5dhieE?=
 =?us-ascii?Q?erM06B1X5S2hNxqWjzGK+BR+OdssQNmwFy9TNfjiwFmjevqDui/OfzxTN/g3?=
 =?us-ascii?Q?26zSi6P7a7OAXcf1vyzKDZgh9KanK8hbGQkYTZjLSjEZXi7dn8sLHJaHarFd?=
 =?us-ascii?Q?uiy4JYTTstIucqvAE8NM0imhX55/qajuGAk6qKWGU76ri+SVwpoQLkt9KfBZ?=
 =?us-ascii?Q?WRox2WxOpDwuWV/GR9vQc3GnR2wv7U0RZCRa3uMCpEg/zkSHDVhtEXCn8HAw?=
 =?us-ascii?Q?GXYb8eJ7436G/x05OgEKBIQoiyc707IRiNSpd5QN1oCm/8LtLhQ/9jgu0rkO?=
 =?us-ascii?Q?yigObYAPzDm/F5IVigVqURPTgFFITtpWG6QiaZajhjIFoCwBxVXIe7N6pJmX?=
 =?us-ascii?Q?mdrodEMJuY3tKBr90ZmKrlFIZech+LYreOlaeMDBcOL6dh/dGqj7EslHFLi7?=
 =?us-ascii?Q?EbmrVknuS1aIE/eiGSUTDv+wy53MLX6yVYciemBy9gVdjHhFfss24GyjqHSI?=
 =?us-ascii?Q?IJJBG7Rv6M6B4jKsXTb5OlhkPlhEB35Lkm3pDpWpwev7PrWG45zykORLuN5m?=
 =?us-ascii?Q?3NlRjQV15xTEyIMI2NR0uCj3rC3Fac8FWFHpE8803Zzvx4w2z4lpR34MI5LN?=
 =?us-ascii?Q?9QXYx13rbWiQXZMexkFDJC6PQpFOuWuWeHOfOuUxMj2HVmdwCnBUlPbPP+WP?=
 =?us-ascii?Q?n8lG5DZ7BMPYyWZRYR0/V0Y6moZm/4KcLA++k3L0qTRBYw7vyQfLeWTy1BCz?=
 =?us-ascii?Q?J0o9ZOgHz0jjvk3yxMZWkOekZhFrf15sVdY9i+ARf3zhwm9QFJhnASQj2rj3?=
 =?us-ascii?Q?nCNApBVr3J0g5Jp6yGRitXHgd8twyvl7YdiC2o1s4sFyhUAMjI15k7OO9zAA?=
 =?us-ascii?Q?POEMXMPSip7V3OHqlEIkaqOxc7ZMx9mXF4zshxChSMv7jHtTQNV/YRGyaxsv?=
 =?us-ascii?Q?/W27HPLnQv+MZmLNz73q+40kC6ewGZNU2TO+0cZh/e+Yvzfv0mW5ioxLIFRQ?=
 =?us-ascii?Q?QfRcONrJYiL3/1JCuGfaUChAbbo0bp6SmmeYHVp3LZFYNVfbbpjskeWULdsw?=
 =?us-ascii?Q?m7HLQuwQ78z+RxA9GrWa5fQ9VjBI47CRPsHNTbzcbXYC9Ix9hhefxKkpiOAJ?=
 =?us-ascii?Q?P9Fy55m68XinyW1+nWpigqrvTNd6KwZzMLVM93K61JNbsUyTOHCpzE/tnvEL?=
 =?us-ascii?Q?686rbxlQsAmyeDyqVQ11brlKLbASh2W9Krv9DTtJvckQKqHvkJ87gr5fzEAQ?=
 =?us-ascii?Q?6pwsZW1sDapaTvLcyXDuwjs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 35bc20cb-8d00-4bfb-ca59-08dcb4e75bba
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:41:35.0256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7QM2mQXDp+z89x28zi9Za4XRF7cbN+pbIVL0gBtwcr26t9LPkBxmowavAqBt+eyyCIoY98RKl0BZc9t3ZkYz7ehECc2DoQObjhodCJtOGMC1EU+1VgPWFipfQ0sxyMX/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8678
Message-ID-Hash: XHIPKIFRVMYSC37SY7RVADXXLSWZHPNR
X-Message-ID-Hash: XHIPKIFRVMYSC37SY7RVADXXLSWZHPNR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XHIPKIFRVMYSC37SY7RVADXXLSWZHPNR/>
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
 sound/soc/codecs/ad193x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index 1d3c4d94b4ae9..34c309c0d96ff 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -316,7 +316,7 @@ static int ad193x_hw_params(struct snd_pcm_substream *substream,
 	int word_len = 0, master_rate = 0;
 	struct snd_soc_component *component = dai->component;
 	struct ad193x_priv *ad193x = snd_soc_component_get_drvdata(component);
-	bool is_playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool is_playback = snd_pcm_is_playback(substream);
 	u8 dacc0;
 
 	dev_dbg(dai->dev, "%s() rate=%u format=%#x width=%u channels=%u\n",
-- 
2.43.0

