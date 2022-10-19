Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9860960372B
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 02:37:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E693A860;
	Wed, 19 Oct 2022 02:36:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E693A860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666139854;
	bh=I5G02RjgMCidsQZkbTBCklj0B3k+nYhlPWYxJx0trTA=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GcAXPr57a5EJT+cPO39NR9N1Zx8FAKq+P+T2WJ8hn9F8PUhasV3MIknfwJMtHq8ly
	 797T9qB7Yk22TrQSEllTHCUNtWWVsKXA/GGrVENx+FSzKvOnWzVLeMhjXJJTTMOyck
	 9Krq13N36q6w42C4PeAGGj10x4U/SyuIpxnOysk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B190F80551;
	Wed, 19 Oct 2022 02:36:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 561D2F80542; Wed, 19 Oct 2022 02:36:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86880F80535
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 02:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86880F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="jJxwR2Af"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIXRaidOYP1p8dG58XC+hRLhBVYT/a1xLjuj7hGhkuMg3K2vN6F6ucaO1XhfsN4l4fWQWmv7OW1xQWFA7WjTBGLLSAUbI7QSOlNVsBH+uzepKtfCkGPKEfn4n9L6FbyHEPA9jKwPiTJHIpNnMR6Dqfq7CUfL0ZN584CvuVuRgc4sHTOCOgQTgG+6kxOGAn2ANXd0VEI3DHy+62VU6yIY0YQQeF90jGMulQnwJy1eUQZUN5ZoENOKHPgCZS8Yi3TLQ81vkh/jVLEq04rV9YX3cDrpGGSEvvLkm36NzgiveVVZTMzRPXGbLV9MZn+CIlGO0NDf0R8WtN/ciwdf1E9Xlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+OXH2PPYfYsnFBFHjj9DsaqwdSQr9JCKTvuxXpwQco=;
 b=XZzObXiZCzMSVEwsRLmeLymugAitwIVMpgpVbQVczqzS284JqcA5XL5qT5Z4SPWiSkCNOp7ZHpVQaCxbYUFD1rTOnmVFP8uwXpphptCvv1h+XP2wN13DpSzCW0Bvu91pJlqf5DFlorEeuJ2Q9LtTal4vc2niwLUPAPiNpdRNr7NBKer16hYVbPQMW1e9wDHwc+wk1Uf9m9vgozUEfO4xbnWReoJKaa84jHw2L6NmFi16+nc6oPTp7QYU/nB4RhNB1Mvgtigw2ILixCLe7hLHu20SPcbuN8jlQl+kLHr9FC66/gzQ3H/ACMQCnDoCLJzQObqyB9aG10FV8eofsR1GLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+OXH2PPYfYsnFBFHjj9DsaqwdSQr9JCKTvuxXpwQco=;
 b=jJxwR2AfX+jrKmakuaNCgecCmkF5Z5iiJTX+hV/jM5Cw6D9q8mj31yivPmv1O+FuJIQtCFzxHmZQrNwX0pkhJo1/x4A1tZXMwKhiT1hCJWeMYoihPEfY6a6ka9DU53aM4bop1C6gNXRoCZPUV83c0lu5Qmo2ghlMghAwV3drWr4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9419.jpnprd01.prod.outlook.com (2603:1096:400:198::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 00:36:14 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4cba:2bd5:dfd4:f3cf%5]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 00:36:14 +0000
Message-ID: <877d0wtzsx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 03/11] ASoC: soc-dapm.c: remove no meaning variable from
 snd_soc_dapm_add_path()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkq8tzu1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Oct 2022 00:36:14 +0000
X-ClientProxiedBy: TYAPR01CA0089.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: 185d01f0-66a3-448d-d5c5-08dab169edae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yk7SKC5w8KpHHw5gwfgAaVnws31iD07z+4wQaEo8Z6yBlIRI0l+gyXra/icWiFKhfA9dqkU3sjvUotP2T04erY1mt53MXgA1n6yW7iNMgH3numaHq/RDDC5p7GyW41lIp2Vw6N97dPLlmoycLCidkdFSBIHnDQFgIFTuoODcSRzm4OTGDwyBJyUZk7oU94Ob68crEQd88wVvuRCIFuVdG9TmdpQjeO6HMXBPfPA/zZ29PZylBCCO9n/tE88r8T5SpEV8uUF7lPgo0tDq19NEtk5s4UKwef/UVmaqgJf1C1LGmHYy1ItQCbda/VcGSdj2qxU/G6serQMxSnGKJ7F5Ghxe9KSoGAxL679JTcp7/mBGuCcePBq49Qy8wM6aJhtEEO7yp8ZETZuxtB0aGQ8g8q/+Nn5LTX9UBGTpvVgLG/MQfE/TqphVsIZkVAVxY77+2Fc0i+WLopBK5FwQE+V62JN6rj3MmoajngdwKgagxJyLJ6ShwHd3JM+9ob+cTJVZK1lwaF/JsSRwfsDKFHxLi6uZ+lw9qB5CehDsFYwBrUFdR1eshwVPDO4kgrqhWhzZBHvt3Oa88moaRovAPBDJPfXiQt7iawG5qFk+W8lqjInuvWqufZuB8yZ2+2NSmF0MNbPjPikhqER64Wbu9vufyJurJz+C8Hq1bj0IdJEEf2nWfzbFcpvAmqEQmNhUt2eTy6Tt+B3vi5PBL0EjjlhNR4zPGGoa8jI2y0rtFtOzmoLgkMgFprOAmC3pmbKHLsJTcFQOkltywlS/MmSXx9AXQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(451199015)(2906002)(66556008)(38350700002)(66476007)(4326008)(8936002)(38100700002)(5660300002)(41300700001)(86362001)(36756003)(8676002)(6512007)(26005)(6506007)(52116002)(6916009)(186003)(2616005)(6486002)(478600001)(66946007)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fWTFYmL/9oKoTcgMbqjlEtbzwHtjE1YRFKNnDVShKmQmxczrS1n1zgjMuf4+?=
 =?us-ascii?Q?pYF1hjW4gYREK8Vutw4MJrZ2Yjdd62wesTcmvlL/6F0CWa5W9E5W+iOorNnt?=
 =?us-ascii?Q?xbUpMfvQhU6qm/I7hStGXu/D2ak6pwcTIe5TZmdKtT+KvZmRMkjDPi+RZaes?=
 =?us-ascii?Q?tvZcWZPj2hYY2N2JO2OB3LUe2aNV0qZANReq7BnaeZjcCG+GwYj5yzSwrDkN?=
 =?us-ascii?Q?JLiMVtAqpMNbK/9d4E3yE7rRGz2eY+bf3ncOxOShYJg7qqbzr2Co6anqktU/?=
 =?us-ascii?Q?SBNQLijOfgbJArEp2V46fOhngq56CRoJWVQ1OCnOBn2GXfOmG0TEjhLVzuSV?=
 =?us-ascii?Q?GAM9K+g8btU3xe9rfGoW0EDLSo23CWdIQ3nu4UFXVHamw38zYXY2Eq4Bnf+N?=
 =?us-ascii?Q?6vUgk7cTZ6fJ4YqG9daNaXVcxTerrpQUw4+oKURSKMDQu5biqu6YfQr+RK1s?=
 =?us-ascii?Q?3Ltq/O4/k74Gcy0YIfU/bf5jYP929Z6OKd7i3MowULwfowQ3XgnQOaRB7SSo?=
 =?us-ascii?Q?k/SNAaU/Aji4YxLNgflBfpv8Urw3S2a01wCJCJmy34UeXoOjOlz4X0USJdD3?=
 =?us-ascii?Q?HwPh0SiBvYifUlzp0ogzf819X1Q2r2wmY9lUaSMyzLJi07D7GYXaILp8LgV/?=
 =?us-ascii?Q?xOIRLCiEdOIkSjpAvs8r3wzzA3coXe95hd2vgH1pUS0z4iLV5nD0zLvo5xne?=
 =?us-ascii?Q?UFnY8Wck6HS/q1n1nS+tAYu6zfIeI3gC7F1OlpcGQh9RT/5HPPF8Kq2R2y1r?=
 =?us-ascii?Q?29LEWmLs7kI91js0SZKjVytd5nXxnC6BctUKfVMlVA4+X/bXvg2iyg4KeaUD?=
 =?us-ascii?Q?ZErXdbIVGffKA5M/3RHs225+Vt5pzCOuPNzthXDElUOPvCv+Agr1qDDNcfGn?=
 =?us-ascii?Q?WriaWlcjbpjMuWfKeUGz4QtLaqUzSLldT72qdHQk+Zgo7r6K0sSyfHGnnt8O?=
 =?us-ascii?Q?g7l2jqIbXqfS5uXUPD01r+vEWkOkLKaxkkSk01smPtYC53f9bE+L2HobL0Fr?=
 =?us-ascii?Q?LoM5S5EVOymnmWsJ0VzIRFMMr7jSiPbwXFlrO7NwTMWYU4Dq2/obIBRR0yD1?=
 =?us-ascii?Q?IIy9oPVMrVJWE+cvyGJFvknxwwdjbY+YmYJXH9/7tO6Qo+nmAzcpEED24pp4?=
 =?us-ascii?Q?kLUjH7ndGPJpkPvB75pcgHIRME29/ndDAV6jfzc9CmbJIVLbLRYXpiXGI0C0?=
 =?us-ascii?Q?9l7UqKyp33SD+Q2v8WAJ6Ln3K0lZxrXKhSCD2NO3HjSmO4ETLiNC+hgPsSOL?=
 =?us-ascii?Q?0Qs77NqAesUp/FFN//XJlq6h3on0qpdjR2q/U+mJ9eFHBqsYt3YnlMFIHYNq?=
 =?us-ascii?Q?Rh36X0ioOOCCWX4pCyLfD3kJeaJk8s5hu0dM7YDAn/OewpI9TBfNYeli/3ws?=
 =?us-ascii?Q?tmuOl6sLvCopVVsgMPca9wFHbL0gUdSTT0JuE884A3tE9qb8MY4rrLWLcfOC?=
 =?us-ascii?Q?Z6aXSdTwWztMwCXnjnBnS+Qei55h6ZTfT34saw36DuugzxDwm38BGyoRY/8s?=
 =?us-ascii?Q?nrM6UP+EzmklEn03E6h/i8I8g+a1cTGR7VzNUWimWOqdnV1lIQLUu/8ZLWKu?=
 =?us-ascii?Q?1ZcAHAOXuBfBJFN8salXH/QwIv7ed/8EjFbBzK9yAYxcUDJnXrSOJW3r+n1A?=
 =?us-ascii?Q?ifRYMPu5y8y77qT4gIAmHVk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 185d01f0-66a3-448d-d5c5-08dab169edae
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 00:36:14.5249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khUtAKDOa1MX4hhqFuBYQOoC6owm3u0mo05V8bm8e+7sdg5HsDHuAQkotLiqPHPG6Nm5VuKcwxAJ8wt76gN6xWT8GPXYg1r6+sGkHlRj3Lqq7IRSjlwt756W5p+GjL3p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9419
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

snd_soc_dapm_add_path() is using local variable "widgets[]", but it is
same as path->node[].
This is no meaning and duplicate operation. This patch removes "widgets[]".

	path->node[SND_SOC_DAPM_DIR_IN] = wsource;
	path->node[SND_SOC_DAPM_DIR_OUT] = wsink;
	widgets[SND_SOC_DAPM_DIR_IN] = wsource;
	widgets[SND_SOC_DAPM_DIR_OUT] = wsink;

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b4f876dff994..f9c4fd11853c 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2826,7 +2826,6 @@ static int snd_soc_dapm_add_path(struct snd_soc_dapm_context *dapm,
 	int (*connected)(struct snd_soc_dapm_widget *source,
 			 struct snd_soc_dapm_widget *sink))
 {
-	struct snd_soc_dapm_widget *widgets[2];
 	enum snd_soc_dapm_direction dir;
 	struct snd_soc_dapm_path *path;
 	int ret;
@@ -2862,8 +2861,6 @@ static int snd_soc_dapm_add_path(struct snd_soc_dapm_context *dapm,
 
 	path->node[SND_SOC_DAPM_DIR_IN] = wsource;
 	path->node[SND_SOC_DAPM_DIR_OUT] = wsink;
-	widgets[SND_SOC_DAPM_DIR_IN] = wsource;
-	widgets[SND_SOC_DAPM_DIR_OUT] = wsink;
 
 	path->connected = connected;
 	INIT_LIST_HEAD(&path->list);
@@ -2905,12 +2902,13 @@ static int snd_soc_dapm_add_path(struct snd_soc_dapm_context *dapm,
 	}
 
 	list_add(&path->list, &dapm->card->paths);
+
 	snd_soc_dapm_for_each_direction(dir)
-		list_add(&path->list_node[dir], &widgets[dir]->edges[dir]);
+		list_add(&path->list_node[dir], &path->node[dir]->edges[dir]);
 
 	snd_soc_dapm_for_each_direction(dir) {
-		dapm_update_widget_flags(widgets[dir]);
-		dapm_mark_dirty(widgets[dir], "Route added");
+		dapm_update_widget_flags(path->node[dir]);
+		dapm_mark_dirty(path->node[dir], "Route added");
 	}
 
 	if (dapm->card->instantiated && path->connect)
-- 
2.25.1

