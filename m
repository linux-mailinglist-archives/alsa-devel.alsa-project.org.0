Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A8F79C6FB
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 08:35:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1824284C;
	Tue, 12 Sep 2023 08:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1824284C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694500512;
	bh=MaxmGu1tea7kTBhTE1ZQnz3/Sx4hQNrMF3B4iIKKHUA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MXehFApgp4kAR8rp9256xgQbiGA58pPw+RB4YV2KlCinI4WpTHY4UwOXqT5qb+B83
	 IkotqdioxbGWs4iu3kaNQdXuGk0T4z+RtXgawvyaaLw/Gh76o4m/x+F9DYa4p2+V7k
	 lOTRtYrmaX8+PXMBTWLKDPSKJaUyQt+AFw6ubyRI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 708C9F80549; Tue, 12 Sep 2023 08:34:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB8E7F80246;
	Tue, 12 Sep 2023 08:34:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20BC3F80425; Tue, 12 Sep 2023 08:34:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe16::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 516D2F8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 08:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 516D2F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=dqfyrh8J
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYbsfeSX2J6FE8m/0527pJ9gaBqy+tUHRr8L/51rq3ckYORdobZRcWtnEZ4QpEEc7C+xyqOxqx+fto1Tr1sTziTiAgS746BpGZ+8RkROqLtowKcrHgzmgbr7f0ZfQyNbCpJhZ2nyA/b/DyW6+qUNq95GY2ZOv8PtSFxNtMYOIcfrymTeC0taS6KHborqaqEzk+t8bhAE8P9bwUH6pF0P275riAisS3Mvmj5WmY0rQbW4Vzo0zTygM0+HaMUsIl3RR8ZG/f98JjvJHyDFmDsjpWjl2eZjQaGSro19bwvxNgd30uXmPjmbvDWQjDZtgCg2ZI16ckjFERTgqq9ZedJP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTyqv2t1gJzlEaB+U7fgU0wD3aVZC7wms7saV5VFGb4=;
 b=jMcNwQWTyA/5cHbewGY4unD9/CD/SIq/R9pzpAU5m3jcOm0o4VeuRRCna15Kf6IvoU24VgoUJ//5d5xfL/4FM+mv7OUX4C1yDiKqz3MrjtUzVX5HZQyAEA4++yVPTfuNc/Jbai7IsTL/zlMBXpqVoMKGxXVmr+EFJ8lIi6MqfTRrV8p2utLe44pQjkX2p9Dptu8Ta6RxCkfDTW1GfpcczFSYt47jHVJsUHMjWgVvQZx5cv0wko/Bk87bUPrvaVyjHjV4p3Mbz4ssn6XY9jmmkUQq+ZjzyeIqnYvPbS7ibVQKXiJtiAr3HEPfdsZpdxYR5lqijNsk78TnjT0f/2cApA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTyqv2t1gJzlEaB+U7fgU0wD3aVZC7wms7saV5VFGb4=;
 b=dqfyrh8Jn6VBBqiJFM/SicNG5lPbquqrcJHVuqu6GXwzF+mNQq6WBxOww7A/tBTpcbLXeBC3H3FpEFhWAOdRA81I2fx9fPaqZz+gYF+JiqsT03ZplK4dd644JBWNMt5H7h3jgBMZcVPtLeMNUWus9gx//bP8D6IVNFHeIfMW6+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AM9PR04MB8778.eurprd04.prod.outlook.com (2603:10a6:20b:409::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 06:34:09 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96%7]) with mapi id 15.20.6745.034; Tue, 12 Sep 2023
 06:34:08 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH] ASoC: imx-rpmsg: Set ignore_pmdown_time for dai_link
Date: Tue, 12 Sep 2023 14:33:29 +0800
Message-Id: <20230912063329.2260360-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AM9PR04MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c40ab1-9ed3-47d5-3669-08dbb35a44db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A5EfoBMKi8tRqU5ZYuJ+AdRP0NIAp1pJ2jOFaIFVONl1swJ/qx1WQKV9fXdQjpr54IubtrpyjuLpEtGXCv8d4bxdw8hinl6sgqpv0dob5dgr3yqQivWkrg1dx44++Xf4vJn8vxwa8KJewsI+OPe0/zhow7kb0hBv6nPixIPOhOWjrke+NftrniPLMpMOwDflzWvFiNPCuG3qnAjFoOPEwAx6+/PP2+l8Zzb1VpD+Rnjfnh0GOiDfTgfJfosyMBQVGa79WbDa4daoJQ0rzLjnstLya9cgCQozIXkiRuRXDI0DIi6KM0tEeCNdG+GFgkMzKV1Rb90sgUL6LIix6iGLVBaWcDhgRi3Wxzllcb++uMz82YC9Wq5uZ+5jMuFr2cp6XV+VKPcSND3L3R1I9+OrgU43hnLQkAOv++ek8dvhc06Cb8++0Mqo7pQY+zKuoZ2b4/ulm6Q0XdoRu3z2Ba/XrKNbu2ADqTXUBtGS3mQHzcpwiIf0p6s0/YnM+DfBqawWa0i74iXRXqepmAPB6xlaRPZvvrgz2dmr5Dpfkz2TbVqtgxTmyWWu8jCtqGLopl9xETJvPyu89TiuZmfZj/TFBzdFSOH4Z53eXFmnVLtIdr0OD+au+s6BFdK6MrwiNrvUAPgCdYkdBJD2QufMCwG+jQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(346002)(366004)(186009)(1800799009)(451199024)(6506007)(6486002)(6512007)(52116002)(6666004)(83380400001)(921005)(38100700002)(86362001)(38350700002)(36756003)(2616005)(1076003)(26005)(66476007)(2906002)(66556008)(7416002)(66946007)(316002)(41300700001)(44832011)(5660300002)(8936002)(4326008)(8676002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0DbXtKfZk6VGdbsNt+wmPYmXMJ736ZjPVChC6F3a7aZjN5IkxOvubg+GgDZT?=
 =?us-ascii?Q?wwF7jm0ZMWqsgtAtHfWciNACiMxrBp+rPvahEK56uRXQagLx9KVyM1KvXVCN?=
 =?us-ascii?Q?ImjBcfBLyVabQirEjPn17I08ZpN7X1s9JhkYZw33Jng0egZtv/y2oCQtbYbu?=
 =?us-ascii?Q?gv17YuWPp3BnTFLzCsI3+prvIHmXOd0V5KgfGNxJaQHQ7vxXImvdoUprrjii?=
 =?us-ascii?Q?T3Zs6eWVn5iZBktdJe1guUvsZthsI9WX6s6LNB/aLdSLq/MYCTUSixBkU5tX?=
 =?us-ascii?Q?Kq3RUPpjbuXlS2f/J7+Okuxfu8O0BOhAltaxA5se5vT0qCgEQWNzbENAqgu5?=
 =?us-ascii?Q?f5FQnKZpUhRP5ywCvNAHabKBMVV1+GpG1VJoZxZ9LNcVeyV5NxDxLFX0a0gG?=
 =?us-ascii?Q?5v7MykDXarxKb0bgjHWY69+x/FBVsLnYdzpwdnDf+nBVHEk4RLtwi+e30ww4?=
 =?us-ascii?Q?Eg8pMwags/sYZA459Ug6sgJahY+pFa60krNtoIg4cnR+HO96m8fgRO7OIeMr?=
 =?us-ascii?Q?VKcyDOMIJ+DiLv1G1j3uQPHzm4VQfYCanmaChVc4eqsbQPXDISFPIcq1Ohku?=
 =?us-ascii?Q?YLxj/88FNwfYp/DLSPjvS+3+dESpfq/I+u+RPWk646c3S4ld0/8oWucfB5U0?=
 =?us-ascii?Q?YmUYfFyiujVxYQvZGB5YqGmiNpd0OkMUt/ZnanK0bDVP2xebo0yDMpSCmM/w?=
 =?us-ascii?Q?OzFRCfV7YTPOl6fiSmDP7naxukjE+lek9P8Q7AR1JQ06IDV6Gw48s8ufJN9V?=
 =?us-ascii?Q?xTUrD+iZc3AFN9XrYMpWsG+YtGjX861zjwJwU8GTT8Vt60QW67sv+E1+/xn/?=
 =?us-ascii?Q?r1f+aOkNN34PzafAddp0M/H2ZgVCJIYYXrPPcF4Yyql8gFQg6JuIkukGo396?=
 =?us-ascii?Q?qi28Zm8szcy6xEaut87KC0WL05uhfCYnFUy8zmquODqb47yGqFz8qYxNbQTE?=
 =?us-ascii?Q?0uWpAZLqu7N6URUlortN/4LueWUMAUmFH/0PnvgG8RkLvkUCWqDMNYy8k5vu?=
 =?us-ascii?Q?0PHp/RmIjomG86281CYh38uMz4Rk/KBXqnjeSlkHmwEpn4PLjO4tij3DKeQ9?=
 =?us-ascii?Q?nwmLL1dYYyLvzSoHxxL4eL9HCHF6lbTq0pf8xR2ikoefVOEfrIBNCKIu4PnG?=
 =?us-ascii?Q?0i5Q2UONwYyjVM+QEXNkBQUKT6w/AHxIvwJNZoevNiuaU1oDTA2kJe65u4qq?=
 =?us-ascii?Q?GPIJsMBqI3nUI5C2U2euHHBlydq89Er3t2GdhrtRUFVMlj8T9s/NQTNea7fU?=
 =?us-ascii?Q?Lur+ELxPp2MGufbcbelEk1n4IuXtGqykodb2eHHn/YH/jQjhmWp26U345eKf?=
 =?us-ascii?Q?BoodcWqYXek2QDsa+kPQFaABkULOGWotjUpJp+k4SQhF+MMgp6eBJvrnAmXu?=
 =?us-ascii?Q?6ybf6xp/D77k61wpMJtrkNvnuxH2V1JA3IzbQRE6+xTcBOQ+nnr5nZjPevBO?=
 =?us-ascii?Q?iNTfUm1MjCjMyzxZn+X76catizAP7F9AwCPk27JO34fzzDuJGGH/zvFhdUAs?=
 =?us-ascii?Q?s0bZJCTXzbN6rt4hew35gSV39eAywwq4MRsAET7VLmdGM/3rBz07RV7Kzd6o?=
 =?us-ascii?Q?3juin8X+Yl8GVPNCqWJ/9fx4e/YdQhmWT3dQQ+j2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c8c40ab1-9ed3-47d5-3669-08dbb35a44db
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 06:34:08.9611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5SbLCHeco4WhcC69m2ateXDue7Bp8CBJULY5d+Ef9dne6Y7DQqJo54HXRrbNjatvS+OIM4HUTUXADQhe5d8eug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8778
Message-ID-Hash: 4MODAKFZDVBOUO6EZMVICZRNQUMIXBLK
X-Message-ID-Hash: 4MODAKFZDVBOUO6EZMVICZRNQUMIXBLK
X-MailFrom: chancel.liu@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4MODAKFZDVBOUO6EZMVICZRNQUMIXBLK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

i.MX rpmsg sound cards work on codec slave mode. MCLK will be disabled
by CPU DAI driver in hw_free(). Some codec requires MCLK present at
power up/down sequence. So need to set ignore_pmdown_time to power down
codec immediately before MCLK is turned off.

Take WM8962 as an example, if MCLK is disabled before DAPM power down
playback stream, FIFO error will arise in WM8962 which will have bad
impact on playback next.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 3c7b95db2eac..d2ecd5e821b1 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -89,6 +89,13 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 			    SND_SOC_DAIFMT_NB_NF |
 			    SND_SOC_DAIFMT_CBC_CFC;
 
+	/* i.MX rpmsg sound cards work on codec slave mode. MCLK will be
+	 * disabled by CPU DAI driver in hw_free(). Some codec requires MCLK
+	 * present at power up/down sequence. So need to set ignore_pmdown_time
+	 * to power down codec immediately before MCLK is turned off.
+	 */
+	data->dai.ignore_pmdown_time = 1;
+
 	/* Optional codec node */
 	ret = of_parse_phandle_with_fixed_args(np, "audio-codec", 0, 0, &args);
 	if (ret) {
-- 
2.25.1

