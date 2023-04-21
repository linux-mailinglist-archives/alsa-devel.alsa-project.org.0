Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E386EA07E
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 02:12:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0325DEC2;
	Fri, 21 Apr 2023 02:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0325DEC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682035957;
	bh=3T2NtItc5T7+lHQBVkp+Un6i0TDUfmMmraxghY2Kmsc=;
	h=To:In-Reply-To:References:From:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gryULTJ8m1jfSZLLUYhlftW0lX9BrwJRLFHD8eHFUTPE1/J0CS+TLqnMmsN7yVfhY
	 tTlKv/tN/9MGBTMA5qQpcblWew1cv+SgfDQud3PvJFvdCOLdqELmAuuWSIZ1xbw6KZ
	 712jb1P7cN2UAhJERtT+K7Ze4cmC55HRsmcLbpSc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8FC7F80528;
	Fri, 21 Apr 2023 02:11:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF61AF8052E; Fri, 21 Apr 2023 02:11:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3676F80528
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 02:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3676F80528
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=npJn6J70
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YT9JOMmjtZ2b7bIGfgOLFoZQFIcfWmTIvbnilZi+Kbgct0jvZQ+ueeoNgyjqqDdty21uzyRlWfRp+nOLaACwmec1HFxt7rPZSXgM8c5I7fK5pnetMmcdaVjzDVfjOKNKfTYD/Zcr9dxT8EISmoW7zElLNdmZ1G4J1K5zwG4UK2ZpNBGdJF1xxUPmfRxSG72H0J6KYn4vns26As88/+IYLCjCY3DgRm/QdKog1pqJZTMTbWowQaisTkOX89eQO2RtpCv2gQaHs6/04OjE3LyKWam1NUYPRkPyRiupDzs7xZVGL4hWPgDa90j4tWv3OPqyiJ3MRnBwM0uTIu0BVbbzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kEytZl0L0E2qJ85C85uBo3Kd3F6roPVOV4aa28ILpc=;
 b=OHrnY8p01tPncfWvOs6iy5UfUS5NThNjqkwbmBxXhqnmo/ot/e2CnqGpPjf1namTSA/ejVC8f5iUZeU0nqyj/LusCsAnSoBaW/sybnhLkVCttikEuOTET0/NTvGIT936OPg/eJ+EKhbLzgv70Wt9qjuQ7hydi46oOCW1hr6Nmsv6u2wrwPrvncHKdv6V3xbF3pOK/nrW7zd26jPeR586qaVRL5kwPdLYYTNLLsJGPvJyOj2MFawJ2PsuZP1E9J+nJXNpILqRjbDV+vWO9ePQQkO46n3tN2KEgzS7Lrx8mJST0AHKKbdZ7JSJ2AWh6yXN/kAaqDnFINSng5YASBAQNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kEytZl0L0E2qJ85C85uBo3Kd3F6roPVOV4aa28ILpc=;
 b=npJn6J70nLB1I0Jji5D/EAIpps3i/WWkdsqmA/9286XLHyPoN/pTisDIlJ14zr98YbxK7PFtthLxPFQsYYgssGyOAhfAmltnIxr77wztgF3OZOkaFL7S4Y6NrSl1gMM8qeElGWnXw+oOeW4iL3zXT9n7bZNEi0DtVOQjbs96jWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11167.jpnprd01.prod.outlook.com (2603:1096:400:3f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 00:11:07 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 00:11:07 +0000
Message-ID: <87a5z2f61w.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz3yf631.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz3yf631.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH 2/4] ASoC: fsl: imx-spdif: cleanup platform which is
 using Generic DMA
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 21 Apr 2023 00:11:07 +0000
X-ClientProxiedBy: TY2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:404:a6::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11167:EE_
X-MS-Office365-Filtering-Correlation-Id: 5991dfcb-fb51-4ecd-c969-08db41fce79e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Lc4X3UlAWdIZfvyW91Us0h+yTNGfaMMLS64T8DdY2z3StmZDjcAtIYqW3apiHJmSDlC/Q2R5KmaH97vFHeqMZp6mAvnUsYAENyOtQ4FpnBAQrtcC0RU9AwKaAqCnCT24wE13F6xHmmEozv3czfrIi6WBTSKNY3pFtdEgfRUnUQjKAo2GPy4YMsr7WPlD+Prrrp5nGpPzPzXCZbT8SVV2VSxJgWK2fftl9LW2zFJqWI/llPrpQJYMtGoFL5mk91+AueQJH/TXmWjl2VMcgvty5/WeSTxBO/rLlWo1COVTcjW1q+119ebY0GsviVTJYvbqY7Xsqgw01fbvw5qAHVbKII6v9M2/DP0cdWAKSgnczRH2SWx/40eWXnhIpKbTTk6/uInU4F/Pwd9r2VWBoKyle8YOJl7hrDcxn/+TtCuxZpMQku5hvoHM6aWkmYzNku/1OZemNWbDCSS3SQ0UMnDFc5QkFDgbJEk/3brmufKCURqOUm55Wpz3AFaQLtDO2Qpm5CwSGnJu5fyBbrU8/iFWfUTcqDf3R8Uad+qLg1rr6QCfsDGF/tb4BmVcvhjgiwN1TQE7O6FbwYxgNIJICpOJzENPtI5bqsNUJnRI8PISYtxOaxeaR5ZRZtz27+eBWDDyQ4po94TSqaOwkLDXAr44jg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199021)(36756003)(2906002)(38100700002)(8936002)(8676002)(38350700002)(5660300002)(86362001)(6486002)(52116002)(6512007)(26005)(6506007)(54906003)(478600001)(2616005)(83380400001)(186003)(66476007)(66946007)(316002)(66556008)(41300700001)(4326008)(6916009)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TDnEhAWDbXEOhHA8fSPcy9t81L93kvWP5jzDe+xALnvcl9rlbH965fpx0CJf?=
 =?us-ascii?Q?G+v6Vf5STGif1Ie8yRM2DQV0rH5aZOrJoIarFEgzqq/qrnHdetjOT/SoOu13?=
 =?us-ascii?Q?Nirg1Ggv3jsykxZHmFodnN52egutilvvhxagOCJHPwqT5zuD2u8To6ETWOyY?=
 =?us-ascii?Q?sgafEpYAPZcqynlFMHPjUvxKhsA8pZj51tLOmmSNgbhogbYZbtXC3ssGgsUM?=
 =?us-ascii?Q?9fj8oshirB6ZFRSYHKli+bugdRR2gAmVCtY91BiQKI/PIFDACp+V0R+b+oXX?=
 =?us-ascii?Q?0hWmNlLdZKdEuwBb3vAe0qippVEmcKc85DFjoade4ikMDtySexly5Hx+DjNS?=
 =?us-ascii?Q?cajL52x4n6HvDawW3uxkvzyBSVhD+LXagWIbBISg/+iGNOO6Ye6eBafKjM6S?=
 =?us-ascii?Q?62jb56hAIEhq+JKNKxxQz+MA/d3cpa54AzsbXMtzF6ALFlBRZYf+Y2nIHue4?=
 =?us-ascii?Q?XBbQN4JbBlgXXNDr0uJkNcQRErMgfLFxLBriW5iIHMUY/5GFKkaQ8SzVvIz5?=
 =?us-ascii?Q?iC75Sd4n99/SOMx/RE5gaCPby8I2euimY75WL4YswPm5p1n6VJ4tcdXaFOCp?=
 =?us-ascii?Q?7N4KZZxMFipx1tDCrEt+y0WNx9KEpC1v5M1Z1isd9pA2TVb6avRIWcS7oVZ7?=
 =?us-ascii?Q?OHu0nno/rMRVHB8OjJyfAtZCQuuSandA9fDYys1MelQ1yIlEgdKbKQXmtNKv?=
 =?us-ascii?Q?9MXkM/oxIaLALBWZSFjMwHwwK6CkAOMRWzfySyopRTMY/H+ubm11LLq75im0?=
 =?us-ascii?Q?GZEpNGrrM9JzeNKg1cqjVPtBFk9gbpCxAMBD1JDlWMGLxNxW5X1t4FTdGtuE?=
 =?us-ascii?Q?pSvXyjkRva05gWo78/C12/kXlLHYoDO6Oe826vPKbhV8nvFYEM10mD7YQIrI?=
 =?us-ascii?Q?6BXqGHHIHeHOUJpz3hRMBoYgVVsoAyjj8YvlTz6Jy3LkLGwAkiGOYfi5FTuI?=
 =?us-ascii?Q?9jsZlB/Bed07iPfTjDfia0N0mJ4c8oWmCAMpGet9A/U5mK8d1z2TvfSUg36u?=
 =?us-ascii?Q?0Rdda1FAvdAGcUE/beM8IDvZZ5wZ5QK4KElNKBqNBsmBWTuq35S0cP5GSD3r?=
 =?us-ascii?Q?MZ5HohP8uQgP7TpjE4zbK4fXVg86cDsB6R7DuS2CwdTaj10SeyxYLSiFIYVd?=
 =?us-ascii?Q?ng8GtgprvN99dtxlYj5pjpTeRNMlF7hpBLpuf8kYSLAJXzhJePmOINmUwHBx?=
 =?us-ascii?Q?/t7aZOUNGnwbAU3EMWaaSVGGiG0RKg2yKnsEkqY1v07hu8H1V3Fbx+irov40?=
 =?us-ascii?Q?WoNoitnr784YNZo7w/xE1t3cvMkoSFpEaaVlzCuV3QTJPmSlntWPZ0DHW/ss?=
 =?us-ascii?Q?ztcyUnZQGy773mJKQuaGuLi8pSUyabyqP7mMalolsrHj1c/LMZ/VTw6lr86o?=
 =?us-ascii?Q?bRKmSakbRuZYxug2z8fToSupWgEMBArAAQjOwII0c3RB1uUA/tTl3Jsz9Ylr?=
 =?us-ascii?Q?aO13cr9kgIxOtWBF3oRoAZae4rcFc2dpzNJ+0MKzNd6jO5ECnku0QyY9YKxL?=
 =?us-ascii?Q?tN1cWwUMHOd2ZNjaw6gFQjmKI6tXBfk/CycUxw9V3B17TzB6tvZ9SZYlSW6q?=
 =?us-ascii?Q?VdSylSklT2GzZsBz2a+Z9aDdHe+TD6jiBHxlgHbBsLMRkOQb3xVDyUsaJk68?=
 =?us-ascii?Q?B7O1leE5e+VYQTagnD1Fj4c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5991dfcb-fb51-4ecd-c969-08db41fce79e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 00:11:07.7674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IYssVtQomW9zAdgIQdRefKoWNRTn2lAx/PnwWeFGabelUtnmJHeWqS6AQwDTlr/3ZikT6QFNBmgFr3OfBJQ0W37MlFhi1pRP1YUWxmvzBvdF3u5vT6qrT5mFrUBIS/Bh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11167
Message-ID-Hash: HEHB5TQNUM232VRO3Y6BC3VIADFFY6WO
X-Message-ID-Hash: HEHB5TQNUM232VRO3Y6BC3VIADFFY6WO
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HEHB5TQNUM232VRO3Y6BC3VIADFFY6WO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If CPU is using soc-generic-dmaengine-pcm, Platform Component will be
same as CPU Component. In this case, we can use CPU dlc for Platform dlc.
This patch shares CPU dlc with Platform, and add comment.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/imx-spdif.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/imx-spdif.c b/sound/soc/fsl/imx-spdif.c
index 4446fba755b9..ab978431ac98 100644
--- a/sound/soc/fsl/imx-spdif.c
+++ b/sound/soc/fsl/imx-spdif.c
@@ -26,15 +26,19 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 	}
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	comp = devm_kzalloc(&pdev->dev, 3 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(&pdev->dev, 2 * sizeof(*comp), GFP_KERNEL);
 	if (!data || !comp) {
 		ret = -ENOMEM;
 		goto end;
 	}
 
-	data->dai.cpus		= &comp[0];
+	/*
+	 * CPU == Platform
+	 * platform is using soc-generic-dmaengine-pcm
+	 */
+	data->dai.cpus		=
+	data->dai.platforms	= &comp[0];
 	data->dai.codecs	= &comp[1];
-	data->dai.platforms	= &comp[2];
 
 	data->dai.num_cpus	= 1;
 	data->dai.num_codecs	= 1;
@@ -45,7 +49,6 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 	data->dai.codecs->dai_name = "snd-soc-dummy-dai";
 	data->dai.codecs->name = "snd-soc-dummy";
 	data->dai.cpus->of_node = spdif_np;
-	data->dai.platforms->of_node = spdif_np;
 	data->dai.playback_only = true;
 	data->dai.capture_only = true;
 
-- 
2.25.1

