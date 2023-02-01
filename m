Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2621A685CF9
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:03:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 330B31ED;
	Wed,  1 Feb 2023 03:02:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 330B31ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675216984;
	bh=OKfkUkasitwgxBr6wSs6c3kyR2rLITGRguHh40JAERA=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gmHQuboFU0yG9vwjKy4DCkcfrOS16p04yKYBG4k3dtFrMHKvYqkUWO9Lcnlq6XdLp
	 pxdSTU4ywjfqfGetd5TBpioqMUQpLQYflR6PUbV+VRC6huW/Q8FjrGB4um63b558aK
	 qogXOhOULr0B6qv727q48Rtw5URnBcDUqLwOK3U4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEB6EF805A0;
	Wed,  1 Feb 2023 03:00:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2E58F80571; Wed,  1 Feb 2023 03:00:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::72d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5AF0F80571
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 03:00:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5AF0F80571
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WQaj2bVw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQ1YMqzDgR6YOJYn2EndLSDwTVjgZOyAor9MWRp2IAOHvTq887Vtb/5trh4FUmpwsryU83ZQcBaCtkSbWXWlwj6gd1cgWctDND0VzoxjYf/aQxylHp60IRwGeADgiFgESHg5F6Gv+eS1M+9myFtiedR7rHQ0Z4ELPzDEVGMdvcJsfuyn/QBIOU6I81K0Re4Zp4vTCT569JociFnWSfIXp0n5jHUfcBERhMqvlHjJ5ZGtCd+ja8T5oXojHeubtqMcqfsU3PUrx8MVPnJ+Oopi/UAhRPUC/GxQ6B7LNSnU2evXUL+Ex+v9N5P0reFVPkTY8L/LDypSS5WEXu5HqVC86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsPBqGsp04wRUzVTD0jI47Vz1kDF4lLi6P44wKw6cGw=;
 b=nOLiaCm5TPk1X+5S0q+aiIPZtkKHl/a04hIsVWKaGrsjcoICwYGOyFBLVKu929259QRUiq0HtCjTVH0OIisemO7weg0q8IIq6cqYqlo89AM0mQ6MswBJ60gV8KiVabb2TEzcnZmD6/9iJzpadomJQfc9FBYMWovwxPED6IaYYBo7AHp0KUeV8kAVWspoEBUd1Ib46+vUNNozFlVPovDXqamzxxE03+7um6SPPqabT708hb9EE5PBFNcemkYEZbCO9lia6FwuJBSDZdiGLkpue7UbUpU/L5lbqSC7ZRu88LV0wJ/4tytxBL9zMBZYadgr377n6ilCOYHveNHGYFekjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsPBqGsp04wRUzVTD0jI47Vz1kDF4lLi6P44wKw6cGw=;
 b=WQaj2bVwG8U10Jw0fDsDMdWwKRKDlQJcLkandDiN+RC8ckR69NWXdrSsssg5LAuaoUQ5+W+urKqt6R5L2lSqZllIYSAYVeTdaCy0HM4Jaxt2tMTYgS3dUuNpRV4HWZA3skxrk0Te+C0rY2iLLtL2KV9HlgAdq3J8VB6hRu9ANvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB5600.jpnprd01.prod.outlook.com (2603:1096:400:43::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 02:00:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 02:00:23 +0000
Message-ID: <87y1pi5emh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/15] ASoC: rsnd: rename clk to clkin
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 02:00:22 +0000
X-ClientProxiedBy: TYCP286CA0040.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: 651b825a-a539-4111-3cee-08db03f81440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xH2cjxtXUozE5lcGrLMxH7MI2OIEL7X/4AyF/TyorhEalj7+kUZbhaYr8i3Ojc4zOqHJmRzViE+nh9MDLcCN7aFtiK+sUER87QsuUbdLalQxw40jXwbf9trjBKMWVZ6x2QjbVoaY++L1gCPDgnT+d6MSuWTcKXqd9SFBv7nO4qVBAeUlLMkqro413dM7t18OdpD6v8yFq6mPhixAmxNp4ZL1/XViLuhKRmwbvgnF1dfHHfzZ+rWfQEtpAdpH6Ig8oN1w5Owl6g/ZRsTdWkaJ3M7pNnc84DfpaqNCmoFmuRbBLtth6K2FenlLB3doyoCI+YCOaZeM/uqPYcG+JgZJbGA+e7gbgajSPT3vyDcMxCb91rSS1X6D0O7XqGaXVd4aI0HyXxEg3S4u7MpyZhk70IliF7PQMj9cE7CEEapFbSnw7zG/mg+hWDWtMjrRh1BYWxFXsCjJkrCdk3UHx/sFf+/j0Uv6777N051xoroRwSTRVXSCZkm1xB1Lgy1KMf5fFb2hUPhP4mQF9c3NVEIIy8O1qd4S+O06fTo2pADRIO9oLLYttrkZ26451e5QjzwqijYvwgJ2RSsZnilAQN1KGU/XSHQv5prLVz+uuO+2XMSfhdtsrAd1pR9GxxnLHft7feLrZF9YSgVBKqzf7ZvXBmrl2GiYuZ2yeYTK0fbT+sy5Nh//QO57d8MAMt1Mv4wlzO2a91IpKhB5n/wAmrVsNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199018)(186003)(83380400001)(316002)(41300700001)(8936002)(6916009)(8676002)(66476007)(4326008)(66556008)(66946007)(6506007)(6512007)(478600001)(26005)(2616005)(52116002)(6486002)(86362001)(2906002)(5660300002)(38350700002)(38100700002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XjOeWjc6oB5yevSkW45AKT5IcHNFY1UmK4yuTihqkmhyARm29XlcJv8yKJYe?=
 =?us-ascii?Q?Exv347Vz32ZWrTTYH6SJ7ZtWBlcExHp+Px4Ioy6h5jrAebA7q/W48iuw8pXM?=
 =?us-ascii?Q?L13Na7yyw0nivpxaEsoR9wk/trDf/Fe83P62war0U74po7wOIInPG7TL+n+2?=
 =?us-ascii?Q?X7BdHP3YrWiXjHjyoO7SKdBVIypseWuEuzp0z1Qrm4eilwITh6/v+7HnID+x?=
 =?us-ascii?Q?gxpVu4l9RT280vztFisqIc3tr7Z/vw7wQS+HckP/jAOu00eObqeOcXO6ztLL?=
 =?us-ascii?Q?ao9ho4ER2PuvVA/Bn0yPmFX4LOqHbp1aoUhooYx39/uTEyEix4VD/I4/YLzG?=
 =?us-ascii?Q?Imi0QWaBXJkIPpqDhGHoUfZIoO/cT4LiWGVAc77bUMHh/N/eQkt+946UvQXi?=
 =?us-ascii?Q?814U+aYM2WH1gUSBJy/RZzTJqfLTpkdl6RtJjfz9o9cnRVMxS765vlWEVeSG?=
 =?us-ascii?Q?rmUQ91VGXozFoP4QOTaCM3E9d8Q0vQMlba1CeL/CExmVrbOZCUPwLRf6zHDA?=
 =?us-ascii?Q?xl4XRnuMCeXLYcGXUfpMnZGzAHaH6ZUc0sDHxqv3JBFrJbdxc7v7t0+hpZDn?=
 =?us-ascii?Q?2kVCt2PwCKwU2v2HHCWF3q5O7aj1Dwn0pqSIaFU3NgeXK60WVxRNWyV3Xz+m?=
 =?us-ascii?Q?CptHZhVz+95Y4PNvBNaI0qYVkmJwpONfijwAsSHJjtLIAFxRR6NREP1tuVkJ?=
 =?us-ascii?Q?NHYnuXMUIA+8FuNcVzediG4JCHfytETJqN6L57OyzSvV5Jr8CMNwchR2NwwD?=
 =?us-ascii?Q?6Y85WAJNtM94NF2p1Q3BaEamUJQVATVq1iV1RIdYDU1wpjdWvMkRCIA4UsDu?=
 =?us-ascii?Q?Jqygf0N3O5P7fA45PjLSGduQJRfEZFc1HIW/WBhHTR+2qZvfnHIlTq2esJIP?=
 =?us-ascii?Q?nUKtwtXhDbfVQ0xTg2kQV2fohA/yZ/V05SIUcmNgzDx93GF5/BCfY8+75dze?=
 =?us-ascii?Q?Y3To0Qho0x0XOGZry+htKijo0HT17y0DMc8AxLoJ9RGH4/296YBG1hVBbUen?=
 =?us-ascii?Q?U9R6NAZrQKOXjhI3RRbzJZhOwAaGx1bSmaTNokwMbiiQmgdT7R6u75ure8Hr?=
 =?us-ascii?Q?Xj2KlwXhq5fSbZPBTq6SMB8lkJMxYRZs0oGD/cwPoIRldkfaG5eYH68OdJDR?=
 =?us-ascii?Q?/Gkd5TvOwuZgvaX5FF0U0QaTJV0Nc//FCY66yhS2D8YW8EX76n+dwdyOeT2R?=
 =?us-ascii?Q?6so2R58OnQDAL37XDPjJhl66+uPNgBVkvP1ZIW2nfPXwoOk92RdWOF9cAT+T?=
 =?us-ascii?Q?/1yxByTH76kqwGf/EDYE1n5oFixQo96Au9Q6JUaeehK2nzfrv2CS3vVs8ZfW?=
 =?us-ascii?Q?q2AFZxOvEK8Xh0x/hxSOvcW32PKdm0Ye3niJBtXoehfNCIEjUAxiilha+XkS?=
 =?us-ascii?Q?1cN4NNN6edaV2rJmfYbsp8UkqcC8AdG/W8QoYQymdpJ+nJQkD4Me1Ns5oZDB?=
 =?us-ascii?Q?FGY3mdo99bbGppS7LquUstZ7D8efRzFVqLkmeNz5HKlHdEUBKs3jbv+ScmK3?=
 =?us-ascii?Q?meFctHv20JPksh84OkX8t2qyR57Cku5WTFKmTMxjHWT89VX9V8PpzKtBkTjC?=
 =?us-ascii?Q?F9EjII5XodgCqTIEW/FTkE674mO+swfYhxL/qgenih2cbYtq6JD4NQTfpn7F?=
 =?us-ascii?Q?ZnBO1v/aZhh5Xt4hdCL3AcE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 651b825a-a539-4111-3cee-08db03f81440
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 02:00:23.1146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ijzsJ/avsHJ3JJPnEMdf07uafBVj7xFC7snJFnAsLfvpRU3ZI8K5g4KJWPuEfJv1kjRpr/PEyJ6WMLIp6zInWGU3S4qy4SqbWCAzeEmvNJ/FBVP/HESXYQUA24QcmsZV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5600
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current adg.c is usig "clk" as clock IN, but is using "clkout" for
clock OUT. This patch arranges "clk" to "clkin".

This is prepare for R-Car Gen4 support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/adg.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index 776dfff8016b..6392d20ad4a3 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -11,7 +11,7 @@
 #define CLKB	1
 #define CLKC	2
 #define CLKI	3
-#define CLKMAX	4
+#define CLKINMAX 4
 
 #define CLKOUT	0
 #define CLKOUT1	1
@@ -26,12 +26,12 @@ static struct rsnd_mod_ops adg_ops = {
 };
 
 struct rsnd_adg {
-	struct clk *clk[CLKMAX];
+	struct clk *clkin[CLKINMAX];
 	struct clk *clkout[CLKOUTMAX];
 	struct clk *null_clk;
 	struct clk_onecell_data onecell;
 	struct rsnd_mod mod;
-	int clk_rate[CLKMAX];
+	int clkin_rate[CLKINMAX];
 	u32 ckr;
 	u32 rbga;
 	u32 rbgb;
@@ -40,10 +40,10 @@ struct rsnd_adg {
 	int rbgb_rate_for_48khz;  /* RBGB */
 };
 
-#define for_each_rsnd_clk(pos, adg, i)		\
+#define for_each_rsnd_clkin(pos, adg, i)	\
 	for (i = 0;				\
-	     (i < CLKMAX) &&			\
-	     ((pos) = adg->clk[i]);		\
+	     (i < CLKINMAX) &&			\
+	     ((pos) = adg->clkin[i]);		\
 	     i++)
 #define for_each_rsnd_clkout(pos, adg, i)	\
 	for (i = 0;				\
@@ -52,7 +52,7 @@ struct rsnd_adg {
 	     i++)
 #define rsnd_priv_to_adg(priv) ((struct rsnd_adg *)(priv)->adg)
 
-static const char * const clk_name[] = {
+static const char * const clkin_name[] = {
 	[CLKA]	= "clk_a",
 	[CLKB]	= "clk_b",
 	[CLKC]	= "clk_c",
@@ -112,9 +112,9 @@ static void __rsnd_adg_get_timesel_ratio(struct rsnd_priv *priv,
 	unsigned int val, en;
 	unsigned int min, diff;
 	unsigned int sel_rate[] = {
-		adg->clk_rate[CLKA],	/* 0000: CLKA */
-		adg->clk_rate[CLKB],	/* 0001: CLKB */
-		adg->clk_rate[CLKC],	/* 0010: CLKC */
+		adg->clkin_rate[CLKA],	/* 0000: CLKA */
+		adg->clkin_rate[CLKB],	/* 0001: CLKB */
+		adg->clkin_rate[CLKC],	/* 0010: CLKC */
 		adg->rbga_rate_for_441khz,	/* 0011: RBGA */
 		adg->rbgb_rate_for_48khz,	/* 0100: RBGB */
 	};
@@ -287,6 +287,7 @@ static void rsnd_adg_set_ssi_clk(struct rsnd_mod *ssi_mod, u32 val)
 int rsnd_adg_clk_query(struct rsnd_priv *priv, unsigned int rate)
 {
 	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+	struct clk *clk;
 	int i;
 	int sel_table[] = {
 		[CLKA] = 0x1,
@@ -299,8 +300,8 @@ int rsnd_adg_clk_query(struct rsnd_priv *priv, unsigned int rate)
 	 * find suitable clock from
 	 * AUDIO_CLKA/AUDIO_CLKB/AUDIO_CLKC/AUDIO_CLKI.
 	 */
-	for (i = 0; i < CLKMAX; i++)
-		if (rate == adg->clk_rate[i])
+	for_each_rsnd_clkin(clk, adg, i)
+		if (rate == adg->clkin_rate[i])
 			return sel_table[i];
 
 	/*
@@ -358,7 +359,7 @@ void rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
 	struct clk *clk;
 	int i;
 
-	for_each_rsnd_clk(clk, adg, i) {
+	for_each_rsnd_clkin(clk, adg, i) {
 		if (enable) {
 			clk_prepare_enable(clk);
 
@@ -367,7 +368,7 @@ void rsnd_adg_clk_control(struct rsnd_priv *priv, int enable)
 			 * atomic context. Let's keep it when
 			 * rsnd_adg_clk_enable() was called
 			 */
-			adg->clk_rate[i] = clk_get_rate(clk);
+			adg->clkin_rate[i] = clk_get_rate(clk);
 		} else {
 			clk_disable_unprepare(clk);
 		}
@@ -418,15 +419,15 @@ static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
 	struct clk *clk;
 	int i;
 
-	for (i = 0; i < CLKMAX; i++) {
-		clk = devm_clk_get(dev, clk_name[i]);
+	for (i = 0; i < CLKINMAX; i++) {
+		clk = devm_clk_get(dev, clkin_name[i]);
 
 		if (IS_ERR_OR_NULL(clk))
 			clk = rsnd_adg_null_clk_get(priv);
 		if (IS_ERR_OR_NULL(clk))
 			goto err;
 
-		adg->clk[i] = clk;
+		adg->clkin[i] = clk;
 	}
 
 	return 0;
@@ -516,7 +517,7 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 	 */
 	adg->rbga_rate_for_441khz	= 0;
 	adg->rbgb_rate_for_48khz	= 0;
-	for_each_rsnd_clk(clk, adg, i) {
+	for_each_rsnd_clkin(clk, adg, i) {
 		rate = clk_get_rate(clk);
 
 		if (0 == rate) /* not used */
@@ -630,7 +631,7 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m)
 	struct clk *clk;
 	int i;
 
-	for_each_rsnd_clk(clk, adg, i)
+	for_each_rsnd_clkin(clk, adg, i)
 		dbg_msg(dev, m, "%-18s : %pa : %ld\n",
 			__clk_get_name(clk), clk, clk_get_rate(clk));
 
-- 
2.25.1

