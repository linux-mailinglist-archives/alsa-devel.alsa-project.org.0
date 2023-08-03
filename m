Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCA276E156
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 09:28:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BE19210;
	Thu,  3 Aug 2023 09:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BE19210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691047680;
	bh=Teuye6O+vllB9/2N4VSo3liTG0HDV944n4nRY+MHMWM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Oe6rHaatn2uzvML9gDJlKDlDQGW2kBG38xEQE1Noo4UzkvD/QZXp37e3LQqDRFHhv
	 Ax/dFs8lOSO2G1YFRkgJuafHpU5yXwuScPJqxNzsoUe9ZxjIKwJWOIgENBmpeN+cmT
	 7SbPPa2IugZBYWlkqRuFFIoZ7jOSAJmdecQu3Q3M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57E9FF801D5; Thu,  3 Aug 2023 09:27:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03ACEF801D5;
	Thu,  3 Aug 2023 09:27:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 305A7F8025A; Thu,  3 Aug 2023 09:27:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
	T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC85CF8015B
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 09:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC85CF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=UW7oH9Vt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJD15VOYznIStgj9GAAN1z7vu2hAf269yTmBtDcgbEAKWVK/L/0hJMIE+ldCO6nJE+Bun9csp/RXYWVfZPI/CjFV47Tgi+sNs35nyupguiqs5RvxTBLMehoHvmVjbFKRJ455nm31PkiZ71Qk2um+/T+lZ6cEZxFDn56ajRXUwW4USOKXCmzOsm557LCXvozLjjEJVPC8jSM5YJzBItxjZ8CvjIlsOoNwEw6WtRSckHTBVRur3oi0Bp2WHtPOta+Q/JPiWBbyZFQ/o8ednFfM4Z6TQPWcL+XeFAqoJgqtkXx1x9t+IFh8vbxvch/RJGlVyPLMustwYH9jJlkXxqqy6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6xZVWo+VAqKRi84PvtvOP4MObkyLAc9LaKFlb7R0Bg=;
 b=cdhalbwPE4JELvdAIYClJLBsAKfg54cuzQg+mTX4GEBa2to5m4bLlm2BQIT8Bo9i1S3lzb1NKyFLavdUEBWps/xvOt1cZ24KiVqJMFAA/4aUUNUWUASkqLA7Tv1n2pwKbtC11POxfeYWvPzZ7toeDIUrjNVbP1bZfkI/tslYr6jXx+s2FVY3oC5BZr2amSEgBqjB5KBnQSm/k+6KNN8r3cP7xKtv2imM3FcdXSHnc8kr3L5OrgjYBSay0jm9L/gvUYZWPrAmuUYRffXiSWzPwH+9X/0RR2vyNeMHPa/rqj+Ebw/piotayG6+FWS+Yl2yHt8QM7yss6D9g/X3tTeUIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6xZVWo+VAqKRi84PvtvOP4MObkyLAc9LaKFlb7R0Bg=;
 b=UW7oH9VtKgOH1KdKUoWc+w85ce42paODxcj6hZjsKN14LClH6S1BDSk43zRmfCJOGBeNfbs0f8QYOx5Oa35oK2TU7UfL2IkKpod5QAz7mkbOmeM07ktbsjRWAFOq8JOMz5MAk8t15RINk48qq3wbkl+ej0vaGZ9cpV3tajvlIus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by DU2PR04MB8631.eurprd04.prod.outlook.com (2603:10a6:10:2de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Thu, 3 Aug
 2023 07:26:56 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::d4e4:973a:b085:de93]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::d4e4:973a:b085:de93%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 07:26:55 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: shengjiu.wang@gmail.com,
	broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com
Subject: [PATCH] ASoC: fsl: micfil: Use dual license micfil code
Date: Thu,  3 Aug 2023 10:26:38 +0300
Message-Id: <20230803072638.640789-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0072.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::9) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|DU2PR04MB8631:EE_
X-MS-Office365-Filtering-Correlation-Id: 01e6ab90-ca91-48cd-f0b6-08db93f3037d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	s6CDYNXGAlDUvgelTC7zRF4MifMgHPljwgKc7QO0T2da0ngGqISSqmC/5ywotDjTVdCfQNMdOp+Fl5iXxt7KkTuhJ44PNq1e8+3MTQ/6tecPEjP2mTAWmO/PHDHdEltg4jQkO/d2M3KjtZMjYW80Yst1ZkLN34pxOXKHIwMPHbp8AKFNJX/GcV22YDwJeGR6hqSwwa03rW0TND9YPkxt8TvTaDfXUqMrmfH2xNEy08gWxMv3JtKNRj3hA4zOQXn0LqdfxFNgjRlVJRaK0Kjmyd3ovsFnxnTNoeQXezP/83viqYyRb4txPwnyO+cJnyoPGAYw7Ufhl55bBmwP+JjNl2jC+k/blnuY1n5fRzc2yJV8TpHwDeVIKTRJPzlVluqzhJhUJZtsq32ZFuWFPPtPNaQp2GX93RxpwjoVIvoTazblwIfULY2F1FtfMRDmiY9Lxhu0DkWWfLj3yDC3nJRf6ZL/OZ0Er3MYNbC0CQGw5HgedsPZyRw+2Difh4de4sL7XUhBC0fu5iKRkUIiSEP5qt4QJmlUQlzoitcf30eBlLn+BDHWwOLohvrAyB/QbyAhuibox5Vdpjbnbn/1PidqQJx0dpmavqOF94c49zPCkK5jyvaNkUuVM+1Ax2+FRz2c
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5151.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199021)(6666004)(52116002)(478600001)(186003)(6512007)(6486002)(83380400001)(86362001)(26005)(38350700002)(8936002)(2906002)(4326008)(66946007)(1076003)(44832011)(2616005)(6506007)(5660300002)(66556008)(41300700001)(66476007)(38100700002)(8676002)(7416002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Mc8DfxdUxhQqSin3B5xTUTU/bCq6SeozcBMIuUAbo2nhyYDBsu6LYMd9Iw6u?=
 =?us-ascii?Q?DYC7pCOsxIzhNOW7XvXyz3npZY2o354pKmTv7vXhyk5fTLA4wwy5kk/wOgkq?=
 =?us-ascii?Q?Wcht8M3rNcrPk+N0VBAm8TFMKuWLT/eFeT4FVHZe+zXBfUqh+IXPyY7YKhLj?=
 =?us-ascii?Q?qrwbBJEgliUicU6UDv8QPcece/PeOO+JvwWrcwahOcoIVD1xiA+pGkf+mdsp?=
 =?us-ascii?Q?JhrHPzEgXqOoMLH2USEERBeEioZCN0sK5wAIjWz3IiuKN2hj8+6ev2qQaKRM?=
 =?us-ascii?Q?y2Y4jCtPtwPNRCu0CIfJyNF7vUoV4tlSeh32BcoAokrVucSaMzCwZfVCwINH?=
 =?us-ascii?Q?j1JSK4jnsoGMcQApEfhn48CKuAZP9srEciEslQokEMfcxtOQV2IJiIL5yK6E?=
 =?us-ascii?Q?n1MKPNQWcVyKrPsUsf3ibgZFKMBpHgVeTcdMXlHby4tjb10kfHWal/dta5Y2?=
 =?us-ascii?Q?2I/asiJmaeqQbmx5A1c+ubJvxdquOy0GoiuHTULurfwvyTP1wy8iT3NuxSAg?=
 =?us-ascii?Q?e7Yw4g4EkC68V41PgktCmHmy1z10CStEue4xi8VOM6qDVOf/MCjbHaazNVZ2?=
 =?us-ascii?Q?SemnYM4r+k67Nq7tARMnsWKPBCk+h4v8GvAvVfrgzVGhFxMjlhQgwKyfnba5?=
 =?us-ascii?Q?TRDegTH2aSQyUXkPtBIVO83Q3nRLzdV8NUffL3la1mpUs6OCS18m/xe91jIF?=
 =?us-ascii?Q?p+Iu8LUhVkL/bvR+Spsx2jRak/DZWvHxhcQcotWkZB0vVytzpOEMlLY4thyk?=
 =?us-ascii?Q?FCNr7RPyDFFmUEI1gfTeSwwfwiK3JRkI+ccEbTsjS/qpXu7BaJzTsy15JcJP?=
 =?us-ascii?Q?cEjenMrEGHPCLP98211+BgBr6ZfNLwmlFnW9n6dU0qEx3OJS+iIsdpm4KSA3?=
 =?us-ascii?Q?clF/5k+W9tt1KXHwej97F/ANsi/4+mW+IxioUB0pcEWota8tO6OTxRTT777G?=
 =?us-ascii?Q?h++wx0C7E8+4qQsmh7xafy9j+Ft2+C55KTjb5eoMewj7fbhVgGLB3gA9dV8g?=
 =?us-ascii?Q?b8xM+oTzDIcvBfJ1OrNF0i/CboaY4JTtJbA+MZLJ07XvkIqe7O1CRiO9iDlV?=
 =?us-ascii?Q?x1NPm5P+ja4T9+q+gLc2B+M0Emd4mS9L758tVU3QaVkIkdSz+ppDS/QWa66L?=
 =?us-ascii?Q?V39qW3os7IaIG+NqLjHYCy+SWVxwSQtBYMFUxqOoYRAXJFxEszCnIjo4YA0E?=
 =?us-ascii?Q?VxvrkVplDLtLZP2rRwat0j6rPja0owN6Sopj5JycQJUfJD2Z8HU/+zSVdRRv?=
 =?us-ascii?Q?RkDvQOAGPmCQQ8XkbjZ8RjLPVnMQIMbQMrQuTzMZC95C4uO1KRD4ai/mXv+M?=
 =?us-ascii?Q?4PtKRY+vo5fWiy9zfIJo5zC0tA4vkDSYheZElqGA5O3yVyQwFlEupUsKs+ra?=
 =?us-ascii?Q?tTx5y+KEiRhLK7cVdyV+7CuD3oPpuBXb+FJ/7Z0dvJ+Z/7EEjJ7+0hWQTj6f?=
 =?us-ascii?Q?d49ci9nzbfuxrWIC4/BsU9UgH3QBlCLULPIg6tHlGo/yTc9WKutHYUP5T3F/?=
 =?us-ascii?Q?jHXJZodDPkb0JTf1gFLO9LXU/uCrm6bAoEU4sT2RbohXXDCTsxgRHUIIPxn+?=
 =?us-ascii?Q?xbyt3sQNbWY2d7YvlaYqqLzjIWWMWQOfgxmzM8ZI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 01e6ab90-ca91-48cd-f0b6-08db93f3037d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 07:26:54.9926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 n7tVF/dyzBl0To7cg2xsE2GPFC8WCJfvx56V+kNxxCooe4AKX4LD3G2gPH+R0ETA3xvuTh7M/lj3ntK5627TZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8631
Message-ID-Hash: LCTOXJX6NJSZRLNJFFGA2S6MPA2HZAG6
X-Message-ID-Hash: LCTOXJX6NJSZRLNJFFGA2S6MPA2HZAG6
X-MailFrom: daniel.baluta@oss.nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LCTOXJX6NJSZRLNJFFGA2S6MPA2HZAG6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

We need this in order to easily reuse register definitions
and some functions with Sound Open Firmware driver.

According to Documentation/process/license-rules.rst:
    "Dual BSD/GPL"	The module is dual licensed under a GPL v2
			variant or BSD license choice. The exact
			variant of the BSD license can only be
			determined via the license information
			in the corresponding source files.

so use "Dual BSD/GPL" for license string.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 4 ++--
 sound/soc/fsl/fsl_micfil.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index fe28b27e50d0..97cf315781ab 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
 // Copyright 2018 NXP
 
 #include <linux/bitfield.h>
@@ -1254,4 +1254,4 @@ module_platform_driver(fsl_micfil_driver);
 
 MODULE_AUTHOR("Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>");
 MODULE_DESCRIPTION("NXP PDM Microphone Interface (MICFIL) driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
index 9237a1c4cb8f..fee9fe3d9119 100644
--- a/sound/soc/fsl/fsl_micfil.h
+++ b/sound/soc/fsl/fsl_micfil.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
 /*
  * PDM Microphone Interface for the NXP i.MX SoC
  * Copyright 2018 NXP
-- 
2.25.1

