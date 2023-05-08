Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 390A06FBB98
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 01:52:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 832B81191;
	Tue,  9 May 2023 01:51:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 832B81191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683589931;
	bh=iuviG98mQtMk2I0/s2+dnAtLs7NODkQ/scaRQd1RWa4=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hJMpzqAdJi6yR+wT/wZ7gsLIOKGV2FpzYpbcrQUGa9rWhIkAkOtD0nVqZlJv94qdk
	 qgaJSXa69kijR0Up6Eflpa9VWiyFKzPLWi2nq9X0VAZvNa0rXeT6OA0t90i2DyM7wT
	 KoB6atXt4clkuVSRPja9kjH7oJESV44ancF3j6SY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D05EF80217;
	Tue,  9 May 2023 01:51:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED27EF80548; Tue,  9 May 2023 01:50:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93607F8053D
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 01:50:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93607F8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dtXFle+u
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQ5R89vTqOEX0ef0rIvqUMrQpPjpZLZscfjej3fmAkk4BiLGD7cGXibCb3B8pPXhqPP80zwbkCbw8bETTCrCeQ1905DEGDLWGHYcGYv2BsFoj5RGsIUH48q/BEXI2vB+VbX7mP/ym9QVrvLHKfw0qJEBSspw5tnI2iEjXNUM5gEF0EeHpRa1uhNRJ5IZf+JKWFD/6vZ6iD8GwztiGYv6bSEr5LWslu2UMozcc7jdKmz4yX8IbXHdhlJl7oGao/VZTxdA0r9rNGSr4VhlJU54o4t+b9qGQbKbQYjthG/CN6MwQ+ffR58E6h3jb87h2u6FSoSOlh/hpA4WNNqgFpPQBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4j6tL+6IPA1jE55WJqPVoiUo39FMLd9is3K4Ivq8dI=;
 b=TwgDlgDfb1jiaMZLnMZbZZBtYawzVfpZNo8ZgX7UELQgPzTcHbUFPssXQ5vjte+ZU0kB7iGXazcG1aIRB6QyXM0meMIUwwMT/CccgORtUBYYWahFBfpGHtCIg/Die/CwmyetWWS+ah35KJAuoxznWGCK4K3UOE9WCbe1k4hTdGZU4WvmLGcARBiA1u6gDehEg0pzlfK7PFQb5WuWKVGAwQP7gIOD4JnE+hTl5odXv9SZLgd195QDsoAu1ISt7c+4F5eamvT6wPUlAm+b6z8HQfNrb7TzUBge4mh7E1Fcaf6nX/mcirtvB0hLKvfeOwRYQVbpdYq/0tS7L+lNS39Q7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4j6tL+6IPA1jE55WJqPVoiUo39FMLd9is3K4Ivq8dI=;
 b=dtXFle+uYnrtNEUyXvjF1euwd8mwWtDQELPvgUplgXtVQwxuGKU0SqmniYP6uSVigfH2qZT3P4BrxRlYD/7WB5C6HsTXbwPnIZx0fnUebxqv8l6huPQ1eUBbiyx+ZU89bVeBVMzWqogKaQRrTJSrmG9C2/8QkQ0NfpOwlrKDZFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10226.jpnprd01.prod.outlook.com (2603:1096:400:1e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 23:50:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 23:50:47 +0000
Message-ID: <87cz3al6w9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH v2 02/13] ASoC: ti: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 May 2023 23:50:46 +0000
X-ClientProxiedBy: TY2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:404:42::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10226:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e93b9f-7368-46fb-afa5-08db501f0b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wWZ5uQZ95TvO/PCBAbm3NC8Ru0eH7Zjek2UZZfC02LTooWimf7o3q4B3Af14gTM/ggBlJ3/NFarHbfJ3/LQmu/q/mBE6ulhGIozaurQtxUIm3v7LPbqH5gRwxwgS1lshZIrxo7ORvc1/KQIScqV5Se3O6MWsoQfNG5nFjwy2zdlrEvWxLjJ1lzq6droV/8Me60ewrU+OJVjgy71rMexCqraoFuUkxtYU4MZ0vJiJ0Dk15co1trNSfCZxBouuJ9Hgit/6t17/l4VQIjv7mmQ//p9T8eRxUVMxXYFTuF7n4/lOArsGA3QcRxc+ERZwauBdBPW8ZfhzMU/bMi2kqg4jBFnUHiMDBW+N5fwUCmngjOC6ubrLJ61U750/z8w90zF9/kubhR9LqJFM5btV4M648xavw28PnDpQm7gUcWdN3ikPykQ1TcTcnuccOSMI5Wb7JWfwjwINIP+vKwoSpqhPxABV1epVMDN80U2JaK6WfBicSJQQngEmZCfflzfI6dpb7o6fTNARgRM/XNOUBbz0zP2u1HScjgsXw0dx4fU4XGYBb8h5unx4SIq/2ss0RnUrX+lMRmOIpnlRMZMwTxwWXhV4TUYf/MxRhY3CencsxyFZXx92f8y1nXRfj8hDjNKv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(451199021)(36756003)(41300700001)(86362001)(2906002)(38350700002)(38100700002)(8676002)(8936002)(6486002)(5660300002)(4326008)(66476007)(66556008)(66946007)(478600001)(83380400001)(316002)(186003)(110136005)(6512007)(6506007)(26005)(2616005)(52116002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rlyT/jOSx8Eko7ZbdDy2WMzn+lkI6H3pvNZU/ss3Poga54XK/TZWW+UFKggn?=
 =?us-ascii?Q?PE17SHmSF2d7qKm+oxMybMtXPfKxcYWjfZfStvfomgSJPwFPzwz6cDfDzyJa?=
 =?us-ascii?Q?P7B4x89MiHmkatQlk+3ZzWPMCZ/L/SaleRVx+ItkknVSAT64A4hs0/P75EtF?=
 =?us-ascii?Q?IROJyLiE0gKprJGUmINR8mG9W81ZzBr9TmJtuT3tMcb5R5KheN6oATBFGo5k?=
 =?us-ascii?Q?Y3Pu+baqH1L8dNJm/wme0ysQS25fwmzKex6llempyD5j+RrV6uX9I8Gnh5ZA?=
 =?us-ascii?Q?aHeSfPhv3QUWRHB3mdwirCPMwAc86R4+ssO+pqYbENlETMHdTZcJ7RX96+k+?=
 =?us-ascii?Q?86SDfaDaHNsFB8ZVZRcWxOHFql/fYqeNuK0WoDIyysmh/Zy2v0g+VUneaj2H?=
 =?us-ascii?Q?UmQSAUUqJkDrcIdi5lV5L0K9PQXZ86YhPkuQCAOTw/ad1eKe6lrLtoRVRbKN?=
 =?us-ascii?Q?xvO7lezvn3fEhWGpoNGrIde4WJLuSHoEaajU0RSNvubG332KDrtU4cQ7mPkA?=
 =?us-ascii?Q?PAFDGKCpzcL/GAp3jjW/saoK4TtrJPnVsKt9Nk4GcFVTxcwqy9Ik8c4foPRD?=
 =?us-ascii?Q?MdOSUawwJwld2B59oJlYYJW1H2JbTY9sxPkSK5wdcoBK5FnFjdYaWroiYPbw?=
 =?us-ascii?Q?e3rXvpWy5N8tGJMS9AoD6Ua7bVl8hWlh13HtZY1AIb4WV2m/4N+2x4SE32Fq?=
 =?us-ascii?Q?cOs0nJXOE2BSE4AB1iYzm7Srq7PVoPhOESeNd8w/hJb4Vs2QVmy5GZ0D4AqA?=
 =?us-ascii?Q?i+sEHFUvgdvPc3u65nTuLg3UvRPzJsKr3FqbjP8NlBJDdJgqszTYdzhcuyzo?=
 =?us-ascii?Q?rQdHbT8U3AuLgF3uxefUEidwnU96sCCWIkxIhVc9DUOBunKaw7KyJh3Fqb7S?=
 =?us-ascii?Q?rH8WFH7NtFRXov6kvhiACjM58pjVNko/FXNVOrUML+HyWdBZy7Pav6VGUH1K?=
 =?us-ascii?Q?ii/qCia8GrtGI9/YeKz0+RtkoSiq8myFaWYx1EpBX9WuH98ywOQfRTj04qg9?=
 =?us-ascii?Q?O1EIdHJYMusStIt13hLaFQaopVakR19W1aDGxCQoGw4Jgq51K30e/jeyL0og?=
 =?us-ascii?Q?gLuGhHyL6dko+4vpc2DTtIQ5cTroqTq/WP+o1l9R+A0uKC9jOlTgiIqeLhcM?=
 =?us-ascii?Q?rbbkKbgZsXfNHjMfhclvvZJS1ARVnahbkd5Y0bDSsx5U0GXI7/nLW3s9mCNJ?=
 =?us-ascii?Q?ShQ1A3P1Mah5r2AHpLb94L7Hh+ZfnuRIAhZKkqZGPzzfIzVP+GmuxTFqnddE?=
 =?us-ascii?Q?5vTTmBAkSpNdf4RgOS5Ocbguqc0xG48hsgHZijALHt0RhaT1DZxduTnb0BYy?=
 =?us-ascii?Q?yETxSTa2Gr+4DBdFCSAuMkRUWjr5o45JNWQQzS2lHF4LXv1wLkHe8tWMwp0f?=
 =?us-ascii?Q?a2VbXIY8BzDMJb/QIWLICOn20Y/GrjhhuI5cmtIf3BOimAqMqWjjpKF/X31O?=
 =?us-ascii?Q?tQC/joMw17/jSY+nq9d0jqQ7z3MobpGw8dT5VgVt/SeuSs6Xn00ipcNurEjY?=
 =?us-ascii?Q?Gd4ULZ4TZsarTgyTOzIV52jm1ZHvNKcYabP1P8L1BiWuCkmkhAMZxqVyzC3L?=
 =?us-ascii?Q?2tBuJSaMIrUgRM+CAsjH7hCg990eoblfWgwkCja3TRj9k8o5/e5MjzDwQMji?=
 =?us-ascii?Q?KZmssbFp96RHQvuSSTl99qk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b8e93b9f-7368-46fb-afa5-08db501f0b94
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 23:50:47.2808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /hvwIQgz7unbetgxuaUPgDuwHq8SGX2n7oRvkE/WCCiXnKA3LO8EQevfwqfo2KfhiYDBRoP3MMywM/OlZZWKXcHGw/1bQgbozR8Lsfh505u0BpixYLIUcD7ON4hWyW0i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10226
Message-ID-Hash: WHFAZFG3H3C5P43ONLL4U4RRV3LW2EO4
X-Message-ID-Hash: WHFAZFG3H3C5P43ONLL4U4RRV3LW2EO4
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/omap-hdmi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 96c3569d7643..a3663ab065ac 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -365,19 +365,17 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	if (!card->dai_link)
 		return -ENOMEM;
 
-	compnent = devm_kzalloc(dev, 2 * sizeof(*compnent), GFP_KERNEL);
+	compnent = devm_kzalloc(dev, sizeof(*compnent), GFP_KERNEL);
 	if (!compnent)
 		return -ENOMEM;
-	card->dai_link->cpus		= &compnent[0];
+	card->dai_link->cpus		= compnent;
 	card->dai_link->num_cpus	= 1;
-	card->dai_link->codecs		= &compnent[1];
+	card->dai_link->codecs		= &asoc_dummy_dlc;
 	card->dai_link->num_codecs	= 1;
 
 	card->dai_link->name = card->name;
 	card->dai_link->stream_name = card->name;
 	card->dai_link->cpus->dai_name = dev_name(ad->dssdev);
-	card->dai_link->codecs->name = "snd-soc-dummy";
-	card->dai_link->codecs->dai_name = "snd-soc-dummy-dai";
 	card->num_links = 1;
 	card->dev = dev;
 
-- 
2.25.1

