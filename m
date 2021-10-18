Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3922A431241
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 10:38:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A53B418D6;
	Mon, 18 Oct 2021 10:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A53B418D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634546288;
	bh=9dkTWdgGvnhKFd2W9AcGaHVYH+mI6Fv04m/2np8VmbM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kxRyhHpcWxHlRgiQz/CvWvHsgxxU1HZGVIsLM2v9ENb2OXCiNq3OR8/3I8fbr/4ew
	 ZvVQt5/NjVnjbyetrfh/00N60h3FZS0si7UvSS/Bwo6bNSxWb91kYkpaupBrnrNqiW
	 91ZBOvK3kpXR0p8pxUyndnZah2yrqat50QMBNZ7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75253F80300;
	Mon, 18 Oct 2021 10:36:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF0FDF80224; Mon, 18 Oct 2021 10:36:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2096.outbound.protection.outlook.com [40.107.244.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 822F2F80217
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 10:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 822F2F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="PyDR2+0T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rjm9qM3hxT0QfTukPbvopDapg4YxfbX1PFiNyY7HDNYzLgd2j1is7wjC2ulVrkNs6E4jrqb0kzPiC7Qf1W3CslHBwj64UGyILxrZLJsXqjd9RuYwslNzrjydKXyrBXigjO1trzEw+kmDCNRXReFPwYn3LcrnB/L4glVIxuOk/pHpMpW7c659xmosesqCaJpjzuFxRTKSqftZ6pLKDOeS4YRdsODZ6iUOz+iKcVPMTw3jUA3EgkkQlG9mmuObv7g6klEOTHAHoET8ARVIERTSsQ1rKKixyRWI1T9WwwHDdPXAdiN2tO/wFIf5aJ7HQ1riyC/VTlR5WdoQs+BIP1qiUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy0js8X4yhKcBcmKExDGNcaYxTh4IZ0meHYOiMp9EkY=;
 b=VOlHT6HZ6Buet2zj53f075IkYBR0BykRMD8P+2NSK+MfqbA4NuplRh9OCjqFGsrv+E3buLviqS0YBxSsn3j0yYtSazqi7Jm0PbravaXlar6Nw6f6feEAuF5XGZrAsns0zTY346pwuwZjx5xNqVLdS3mjhJkDchp/nj2tuj8MsR80fqAhZb1e/Jtn8vaco+AHRIvRWAHDBbmj7xYT8AkReOIpynRdF0WaGsG5vGyf6b1X/1NdKcZLknNa0S6rc4QTrZmlVEng4dUk+6POljbt9ajYfMFGwS8OPB7gKeBgPeB1rv1DQgtiNU9bf2C/KPtTRDpjSMusksalTIS8bgoD2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xy0js8X4yhKcBcmKExDGNcaYxTh4IZ0meHYOiMp9EkY=;
 b=PyDR2+0TWeynXhLnzj6OubVJBmQqRP33RB63Fihan5azGTRibEKNC2foWXFaxWGXnIvnVYBvRPplH3b1QJ39N0wNTVJMgikkVbgGQ8LhZA2xZc62muJ0AMk9K9TxCCIveNErwaaaFKaErAoCgSDphfe5FqrWZ+JarNEAUFhacoY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 08:36:15 +0000
Received: from BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94]) by BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94%6]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:36:15 +0000
From: George Song <george.song@maximintegrated.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org
Subject: [v3 2/2] ASoC: max98520: add max98520 audio amplifier driver
Date: Mon, 18 Oct 2021 17:35:54 +0900
Message-Id: <20211018083554.5360-2-george.song@maximintegrated.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018083554.5360-1-george.song@maximintegrated.com>
References: <20211018083554.5360-1-george.song@maximintegrated.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SLXP216CA0004.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:6::14) To BYAPR11MB3671.namprd11.prod.outlook.com
 (2603:10b6:a03:b3::15)
MIME-Version: 1.0
Received: from SEL-LT-028891.maxim-ic.internal (223.62.219.217) by
 SLXP216CA0004.KORP216.PROD.OUTLOOK.COM (2603:1096:100:6::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 08:36:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af2513ad-c24d-4e23-a58b-08d992125944
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5134:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR11MB5134C97879B84D561C3C0DE6F4BC9@SJ0PR11MB5134.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:18;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cjnUUW9QN3qnT87TbL2wki3CGwQnLHe6z0cfj7J7SjclnohizypsXFQb8wEZpVNK1K+b3pGH0GF/NQxplCuzTIdpYqnGYpuOk0CNjE/C+Q8CdzCasdyMPgnFo1wGgK61HuqV7QFP+2ajckJHVeP5hCfipcd5/BzHFUQWtAF5qmwlLtJEmzvWdKIZQJCjMbrHSJMrUEOaMrrc4eRwUXIuQebMi32FrUKQhOrRb/ApAXC32hlNu+PM3WdXrSqsP8lqNPFGy4/uYF6c+wOLwfpwRUNN9Q+mHKr0GBTnt/U1EQvA2SpJ28qIDBygWwAjnS1hrz8SB2umOiM4BEq7JRMbdL07oNsdDQX03tAx0NI90wlUTkHiPwz/gEW35fnyVKYObeTNOD010nGhVV2dfZS6FKgNSg/p3TZBD2+7vKqs3Ys/FhMv3m0leqVayT4yPPpaAOi+lssH21KYmS/BM7hzRuKeJwKBO7asp4nkhhpl01yw0Q61NJFkUiNHuexYf5zTEtxt2l5fmZcI9oMdebSjUeRsU/qoQs/SFgCKdOLWbO5qS6R4WxbLtGVIACV+UBxskzPuBCa/Nq+sy4W0317fSja0WuK0zj1Moeu1pN58Ap4YYNRw4HnOBXh/zqmIImZkeFTga1JpwQskjUpcuwEtxnT0rygXZ63+LPldHSOmrEBvD03zS96P2bvryjLT0OQx/d6bOYqFxMmk/5RIJVDIcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3671.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(26005)(6506007)(38100700002)(6512007)(66556008)(2616005)(66476007)(44832011)(38350700002)(52116002)(36756003)(6486002)(956004)(1076003)(30864003)(4326008)(86362001)(186003)(83380400001)(107886003)(5660300002)(508600001)(316002)(2906002)(6666004)(66946007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MJnvNfgWcvT9byOx17q7Ds52DML6hbsf8qfpG0iO/8xIBTsRX85SGfqGvZQ/?=
 =?us-ascii?Q?pj9sf++R2dZdH9zNAIppQPm+2SRzHgS3RvHON35rNFrhQOmX0ONfhXFWdoNw?=
 =?us-ascii?Q?35w7eSyJtbaDlF1QojzQKLBrq/vsQtPqikPuPmppERtSH97Xuui+MoAjLHhN?=
 =?us-ascii?Q?lkxdsAxNumYGO+luBNzWlIo1L/J/j/rx/d+zFK379lSL5WV4Pllzn4rzZ3bj?=
 =?us-ascii?Q?Wf/+6xs3YGV9XsIkxQQM4B0+57B79HfS7E1pIq7Dj7vi6pL1+VUJRHtoDWxH?=
 =?us-ascii?Q?OknTJ980SKFgYUfd6N5o89S3qHKdm9WKXZZYG35lNgaEMH6JOIfKemDtA0k0?=
 =?us-ascii?Q?G7+lzvN5XQIp+3/WMEEYuClknO9jyO2rvrhx3rQ27HTrBTm311y0kkcZdTnc?=
 =?us-ascii?Q?KOrZg+8+eDG4Ys5H0z/ORT3dA6wCxtTLJzajYY7O7MtIeJQA1H7C9qsm55mW?=
 =?us-ascii?Q?ExZTeEgwWQ7C9wiYDU6Y+wR+8SHYuYPmZdg3yb6XQvPjXyPVukSwQcOIlQJA?=
 =?us-ascii?Q?x2ZGrxJRF4hx5KtXkUo7s3SEQv1m5lCLp5aMVbcb4/vMY/f9ezdG6u1cEtxe?=
 =?us-ascii?Q?LBoeOqtSbuGPsBZ/rKBxbnacshLGsz4SKUdS0A3AIwk53mXtZ68+HG/du9Tb?=
 =?us-ascii?Q?JA1gu+olAq6JiD16MR/hG2xc5gXZUXbjiYNgi5RdieLUqzsygB7xmGYPhGCM?=
 =?us-ascii?Q?avFch+SdeQbxhi9NlZPINeYJHf8+YqrZ5pCt4a8wQvJrrUvkVxRxHALBnfeR?=
 =?us-ascii?Q?DGdULLmR+KjYquloThQZCmidoVHFKAHKXo8Fquw3Hyg10Qp7w4CjO0g0akIX?=
 =?us-ascii?Q?gCLEKkmIRXlevZfzhR7UI5yypaqnGFD12tqRiPUEs6kUcc8s4Z+LxiLZxXmO?=
 =?us-ascii?Q?Bu7mdOth9sBbdYvCTRC9Ciic0NgxN31QbygtH3QO+YUnEVwpTr6dfhU37Mvy?=
 =?us-ascii?Q?jMTnkb1pIo6fdmJRwapttfW0wtib6vbqkaiyS3/qcuW1fB7w+c3ULhbr/QFy?=
 =?us-ascii?Q?IZ6TgOUqr1GTpoAX/3RlPXmp3j8xkmUo0Xwi3mPZ5kmOsTV3DVvnEL087jLs?=
 =?us-ascii?Q?3tfAqNrazV+mAXxCLfoWF2sgQIlUA3+hTJhvLvx8X5yGHl1WSHNP4QiirYMf?=
 =?us-ascii?Q?FfKMQzApZXtDYuYnNAf1sM+6MFkzv7N3A8rpijU3O6QqxYCNxOHUptIxq+dx?=
 =?us-ascii?Q?gAVr7xZojeI9wsECjlvjHQRRR8N+MlrbLAHJcfq/4B6q9FwiGPq/x3dTpkO9?=
 =?us-ascii?Q?du4IRaQaRhWiPMQqDYwWKZ+SOFnwcm1jJfXPKmaaWiEzkWfnheKZobb5F/w5?=
 =?us-ascii?Q?B+Q5Bz+9Hc4poo8wXQh3n/+N?=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af2513ad-c24d-4e23-a58b-08d992125944
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:36:15.6781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YPV+Zfm3D4sCj56YJPPw72bpwttkBTX4GdU491knHho+avb6quOxP+aEl88eM8aweXdl+hc5BpFTPYPzFl2eMcgKR2bVJdP4gP0b2LjqX9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 steves.lee@maximintegrated.com, ryans.lee@maximintegrated.com,
 george.song@analog.com, linux-kernel@vger.kernel.org,
 George Song <george.song@maximintegrated.com>
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

add max98520 audio amplifier driver

Signed-off-by: George Song <george.song@maximintegrated.com>
---
 sound/soc/codecs/Kconfig    |  12 +
 sound/soc/codecs/Makefile   |   2 +
 sound/soc/codecs/max98520.c | 770 ++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/max98520.h | 159 ++++++++
 4 files changed, 943 insertions(+)
 create mode 100644 sound/soc/codecs/max98520.c
 create mode 100644 sound/soc/codecs/max98520.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 82ee233a269d..e8817029c671 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -115,6 +115,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_MAX98357A
 	imply SND_SOC_MAX98371
 	imply SND_SOC_MAX98504
+	imply SND_SOC_MAX98520
 	imply SND_SOC_MAX9867
 	imply SND_SOC_MAX98925
 	imply SND_SOC_MAX98926
@@ -922,6 +923,17 @@ config SND_SOC_MAX98927
 	tristate "Maxim Integrated MAX98927 Speaker Amplifier"
 	depends on I2C
 
+config SND_SOC_MAX98520
+	tristate "Maxim Integrated MAX98520 Speaker Amplifier"
+	depends on I2C
+	help
+	  Enable support for Maxim Integrated MAX98520 audio
+	  amplifier, which implements a tripler charge pump
+	  based boost converter and support sample rates of
+	  8KHz to 192KHz.
+
+	  To compile this driver as a module, choose M here.
+
 config SND_SOC_MAX98373
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 8dcea2c4604a..daf63e31fdd0 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -123,6 +123,7 @@ snd-soc-max9867-objs := max9867.o
 snd-soc-max98925-objs := max98925.o
 snd-soc-max98926-objs := max98926.o
 snd-soc-max98927-objs := max98927.o
+snd-soc-max98520-objs := max98520.o
 snd-soc-max98373-objs := max98373.o
 snd-soc-max98373-i2c-objs := max98373-i2c.o
 snd-soc-max98373-sdw-objs := max98373-sdw.o
@@ -450,6 +451,7 @@ obj-$(CONFIG_SND_SOC_MAX9867)	+= snd-soc-max9867.o
 obj-$(CONFIG_SND_SOC_MAX98925)	+= snd-soc-max98925.o
 obj-$(CONFIG_SND_SOC_MAX98926)	+= snd-soc-max98926.o
 obj-$(CONFIG_SND_SOC_MAX98927)	+= snd-soc-max98927.o
+obj-$(CONFIG_SND_SOC_MAX98520)	+= snd-soc-max98520.o
 obj-$(CONFIG_SND_SOC_MAX98373)	+= snd-soc-max98373.o
 obj-$(CONFIG_SND_SOC_MAX98373_I2C)   += snd-soc-max98373-i2c.o
 obj-$(CONFIG_SND_SOC_MAX98373_SDW)   += snd-soc-max98373-sdw.o
diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
new file mode 100644
index 000000000000..163cc0f106af
--- /dev/null
+++ b/sound/soc/codecs/max98520.c
@@ -0,0 +1,770 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2021, Maxim Integrated
+
+#include <linux/acpi.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/cdev.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <linux/gpio.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <sound/tlv.h>
+#include "max98520.h"
+
+static struct reg_default max98520_reg[] = {
+	{MAX98520_R2000_SW_RESET, 0x00},
+	{MAX98520_R2001_STATUS_1, 0x00},
+	{MAX98520_R2002_STATUS_2, 0x00},
+	{MAX98520_R2020_THERM_WARN_THRESH, 0x46},
+	{MAX98520_R2021_THERM_SHDN_THRESH, 0x64},
+	{MAX98520_R2022_THERM_HYSTERESIS, 0x02},
+	{MAX98520_R2023_THERM_FOLDBACK_SET, 0x31},
+	{MAX98520_R2027_THERM_FOLDBACK_EN, 0x01},
+	{MAX98520_R2030_CLK_MON_CTRL, 0x00},
+	{MAX98520_R2037_ERR_MON_CTRL, 0x01},
+	{MAX98520_R2040_PCM_MODE_CFG, 0xC0},
+	{MAX98520_R2041_PCM_CLK_SETUP, 0x04},
+	{MAX98520_R2042_PCM_SR_SETUP, 0x08},
+	{MAX98520_R2043_PCM_RX_SRC1, 0x00},
+	{MAX98520_R2044_PCM_RX_SRC2, 0x00},
+	{MAX98520_R204F_PCM_RX_EN, 0x00},
+	{MAX98520_R2090_AMP_VOL_CTRL, 0x00},
+	{MAX98520_R2091_AMP_PATH_GAIN, 0x03},
+	{MAX98520_R2092_AMP_DSP_CFG, 0x02},
+	{MAX98520_R2094_SSM_CFG, 0x01},
+	{MAX98520_R2095_AMP_CFG, 0xF0},
+	{MAX98520_R209F_AMP_EN, 0x00},
+	{MAX98520_R20B0_ADC_SR, 0x00},
+	{MAX98520_R20B1_ADC_RESOLUTION, 0x00},
+	{MAX98520_R20B2_ADC_PVDD0_CFG, 0x02},
+	{MAX98520_R20B3_ADC_THERMAL_CFG, 0x02},
+	{MAX98520_R20B4_ADC_READBACK_CTRL, 0x00},
+	{MAX98520_R20B5_ADC_READBACK_UPDATE, 0x00},
+	{MAX98520_R20B6_ADC_PVDD_READBACK_MSB, 0x00},
+	{MAX98520_R20B7_ADC_PVDD_READBACK_LSB, 0x00},
+	{MAX98520_R20B8_ADC_TEMP_READBACK_MSB, 0x00},
+	{MAX98520_R20B9_ADC_TEMP_READBACK_LSB, 0x00},
+	{MAX98520_R20BA_ADC_LOW_PVDD_READBACK_MSB, 0xFF},
+	{MAX98520_R20BB_ADC_LOW_READBACK_LSB, 0x01},
+	{MAX98520_R20BC_ADC_HIGH_TEMP_READBACK_MSB, 0x00},
+	{MAX98520_R20BD_ADC_HIGH_TEMP_READBACK_LSB, 0x00},
+	{MAX98520_R20CF_MEAS_ADC_CFG, 0x00},
+	{MAX98520_R20D0_DHT_CFG1, 0x00},
+	{MAX98520_R20D1_LIMITER_CFG1, 0x08},
+	{MAX98520_R20D2_LIMITER_CFG2, 0x00},
+	{MAX98520_R20D3_DHT_CFG2, 0x14},
+	{MAX98520_R20D4_DHT_CFG3, 0x02},
+	{MAX98520_R20D5_DHT_CFG4, 0x04},
+	{MAX98520_R20D6_DHT_HYSTERESIS_CFG, 0x07},
+	{MAX98520_R20D8_DHT_EN, 0x00},
+	{MAX98520_R210E_AUTO_RESTART_BEHAVIOR, 0x00},
+	{MAX98520_R210F_GLOBAL_EN, 0x00},
+	{MAX98520_R21FF_REVISION_ID, 0x00},
+};
+
+static int max98520_dai_set_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct max98520_priv *max98520 =
+		snd_soc_component_get_drvdata(component);
+	unsigned int format = 0;
+	unsigned int invert = 0;
+
+	dev_dbg(component->dev, "%s: fmt 0x%08X\n", __func__, fmt);
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		invert = MAX98520_PCM_MODE_CFG_PCM_BCLKEDGE;
+		break;
+	default:
+		dev_err(component->dev, "DAI invert mode unsupported\n");
+		return -EINVAL;
+	}
+
+	regmap_update_bits(max98520->regmap,
+			   MAX98520_R2041_PCM_CLK_SETUP,
+			   MAX98520_PCM_MODE_CFG_PCM_BCLKEDGE,
+			   invert);
+
+	/* interface format */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		format = MAX98520_PCM_FORMAT_I2S;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		format = MAX98520_PCM_FORMAT_LJ;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		format = MAX98520_PCM_FORMAT_TDM_MODE1;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		format = MAX98520_PCM_FORMAT_TDM_MODE0;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(max98520->regmap,
+			   MAX98520_R2040_PCM_MODE_CFG,
+			   MAX98520_PCM_MODE_CFG_FORMAT_MASK,
+			   format << MAX98520_PCM_MODE_CFG_FORMAT_SHIFT);
+
+	return 0;
+}
+
+/* BCLKs per LRCLK */
+static const int bclk_sel_table[] = {
+	32, 48, 64, 96, 128, 192, 256, 384, 512, 320,
+};
+
+static int max98520_get_bclk_sel(int bclk)
+{
+	int i;
+	/* match BCLKs per LRCLK */
+	for (i = 0; i < ARRAY_SIZE(bclk_sel_table); i++) {
+		if (bclk_sel_table[i] == bclk)
+			return i + 2;
+	}
+	return 0;
+}
+
+static int max98520_set_clock(struct snd_soc_component *component,
+			      struct snd_pcm_hw_params *params)
+{
+	struct max98520_priv *max98520 =
+		snd_soc_component_get_drvdata(component);
+	/* BCLK/LRCLK ratio calculation */
+	int blr_clk_ratio = params_channels(params) * max98520->ch_size;
+	int value;
+
+	if (!max98520->tdm_mode) {
+		/* BCLK configuration */
+		value = max98520_get_bclk_sel(blr_clk_ratio);
+		if (!value) {
+			dev_err(component->dev, "format unsupported %d\n",
+				params_format(params));
+			return -EINVAL;
+		}
+
+		regmap_update_bits(max98520->regmap,
+				   MAX98520_R2041_PCM_CLK_SETUP,
+				   MAX98520_PCM_CLK_SETUP_BSEL_MASK,
+				   value);
+	}
+	dev_dbg(component->dev, "%s tdm_mode:%d out\n", __func__, max98520->tdm_mode);
+	return 0;
+}
+
+static int max98520_dai_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params,
+				  struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct max98520_priv *max98520 =
+		snd_soc_component_get_drvdata(component);
+	unsigned int sampling_rate = 0;
+	unsigned int chan_sz = 0;
+
+	/* pcm mode configuration */
+	switch (snd_pcm_format_width(params_format(params))) {
+	case 16:
+		chan_sz = MAX98520_PCM_MODE_CFG_CHANSZ_16;
+		break;
+	case 24:
+		chan_sz = MAX98520_PCM_MODE_CFG_CHANSZ_24;
+		break;
+	case 32:
+		chan_sz = MAX98520_PCM_MODE_CFG_CHANSZ_32;
+		break;
+	default:
+		dev_err(component->dev, "format unsupported %d\n",
+			params_format(params));
+		goto err;
+	}
+
+	max98520->ch_size = snd_pcm_format_width(params_format(params));
+
+	regmap_update_bits(max98520->regmap,
+			   MAX98520_R2040_PCM_MODE_CFG,
+			   MAX98520_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
+
+	dev_dbg(component->dev, "format supported %d",
+		params_format(params));
+
+	/* sampling rate configuration */
+	switch (params_rate(params)) {
+	case 8000:
+		sampling_rate = MAX98520_PCM_SR_8000;
+		break;
+	case 11025:
+		sampling_rate = MAX98520_PCM_SR_11025;
+		break;
+	case 12000:
+		sampling_rate = MAX98520_PCM_SR_12000;
+		break;
+	case 16000:
+		sampling_rate = MAX98520_PCM_SR_16000;
+		break;
+	case 22050:
+		sampling_rate = MAX98520_PCM_SR_22050;
+		break;
+	case 24000:
+		sampling_rate = MAX98520_PCM_SR_24000;
+		break;
+	case 32000:
+		sampling_rate = MAX98520_PCM_SR_32000;
+		break;
+	case 44100:
+		sampling_rate = MAX98520_PCM_SR_44100;
+		break;
+	case 48000:
+		sampling_rate = MAX98520_PCM_SR_48000;
+		break;
+	case 88200:
+		sampling_rate = MAX98520_PCM_SR_88200;
+		break;
+	case 96000:
+		sampling_rate = MAX98520_PCM_SR_96000;
+		break;
+	case 176400:
+		sampling_rate = MAX98520_PCM_SR_176400;
+		break;
+	case 192000:
+		sampling_rate = MAX98520_PCM_SR_192000;
+		break;
+	default:
+		dev_err(component->dev, "rate %d not supported\n",
+			params_rate(params));
+		goto err;
+	}
+
+	dev_dbg(component->dev, " %s ch_size: %d, sampling rate : %d out\n", __func__,
+		snd_pcm_format_width(params_format(params)), params_rate(params));
+	/* set DAI_SR to correct LRCLK frequency */
+	regmap_update_bits(max98520->regmap,
+			   MAX98520_R2042_PCM_SR_SETUP,
+			   MAX98520_PCM_SR_MASK,
+			   sampling_rate);
+
+	return max98520_set_clock(component, params);
+err:
+	dev_dbg(component->dev, "%s out error", __func__);
+	return -EINVAL;
+}
+
+static int max98520_dai_tdm_slot(struct snd_soc_dai *dai,
+				 unsigned int tx_mask, unsigned int rx_mask,
+				 int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct max98520_priv *max98520 =
+		snd_soc_component_get_drvdata(component);
+	int bsel = 0;
+	unsigned int chan_sz = 0;
+
+	if (!tx_mask && !rx_mask && !slots && !slot_width)
+		max98520->tdm_mode = false;
+	else
+		max98520->tdm_mode = true;
+
+	/* BCLK configuration */
+	bsel = max98520_get_bclk_sel(slots * slot_width);
+	if (bsel == 0) {
+		dev_err(component->dev, "BCLK %d not supported\n",
+			slots * slot_width);
+		return -EINVAL;
+	}
+
+	regmap_update_bits(max98520->regmap,
+			   MAX98520_R2041_PCM_CLK_SETUP,
+			   MAX98520_PCM_CLK_SETUP_BSEL_MASK,
+			   bsel);
+
+	/* Channel size configuration */
+	switch (slot_width) {
+	case 16:
+		chan_sz = MAX98520_PCM_MODE_CFG_CHANSZ_16;
+		break;
+	case 24:
+		chan_sz = MAX98520_PCM_MODE_CFG_CHANSZ_24;
+		break;
+	case 32:
+		chan_sz = MAX98520_PCM_MODE_CFG_CHANSZ_32;
+		break;
+	default:
+		dev_err(component->dev, "format unsupported %d\n",
+			slot_width);
+		return -EINVAL;
+	}
+
+	regmap_update_bits(max98520->regmap,
+			   MAX98520_R2040_PCM_MODE_CFG,
+			   MAX98520_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
+
+	/* Rx slot configuration */
+	regmap_update_bits(max98520->regmap,
+			   MAX98520_R2044_PCM_RX_SRC2,
+			   MAX98520_PCM_DMIX_CH0_SRC_MASK,
+			   rx_mask);
+	regmap_update_bits(max98520->regmap,
+			   MAX98520_R2044_PCM_RX_SRC2,
+			   MAX98520_PCM_DMIX_CH1_SRC_MASK,
+			   rx_mask << MAX98520_PCM_DMIX_CH1_SHIFT);
+
+	return 0;
+}
+
+#define MAX98520_RATES SNDRV_PCM_RATE_8000_192000
+
+#define MAX98520_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
+	SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+static const struct snd_soc_dai_ops max98520_dai_ops = {
+	.set_fmt = max98520_dai_set_fmt,
+	.hw_params = max98520_dai_hw_params,
+	.set_tdm_slot = max98520_dai_tdm_slot,
+};
+
+static int max98520_dac_event(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct max98520_priv *max98520 =
+		snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		dev_dbg(component->dev, " AMP ON\n");
+
+		regmap_write(max98520->regmap, MAX98520_R210F_GLOBAL_EN, 1);
+		usleep_range(30000, 31000);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		dev_dbg(component->dev, " AMP OFF\n");
+
+		regmap_write(max98520->regmap, MAX98520_R210F_GLOBAL_EN, 0);
+		usleep_range(30000, 31000);
+		max98520->tdm_mode = false;
+		break;
+	default:
+		return 0;
+	}
+	return 0;
+}
+
+static const char * const max98520_switch_text[] = {
+	"Left", "Right", "LeftRight"};
+
+static const struct soc_enum dai_sel_enum =
+	SOC_ENUM_SINGLE(MAX98520_R2043_PCM_RX_SRC1,
+			0, 3, max98520_switch_text);
+
+static const struct snd_kcontrol_new max98520_dai_controls =
+	SOC_DAPM_ENUM("DAI Sel", dai_sel_enum);
+
+static const struct snd_soc_dapm_widget max98520_dapm_widgets[] = {
+	SND_SOC_DAPM_DAC_E("Amp Enable", "HiFi Playback",
+			   MAX98520_R209F_AMP_EN, 0, 0, max98520_dac_event,
+	SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("DAI Sel Mux", SND_SOC_NOPM, 0, 0,	&max98520_dai_controls),
+	SND_SOC_DAPM_OUTPUT("BE_OUT"),
+};
+
+static DECLARE_TLV_DB_SCALE(max98520_digital_tlv, -6300, 50, 1);
+static const DECLARE_TLV_DB_RANGE(max98520_spk_tlv,
+	0, 5, TLV_DB_SCALE_ITEM(600, 300, 0),
+);
+
+static const DECLARE_TLV_DB_RANGE(max98520_dht_lim_thresh_tlv,
+	0, 15, TLV_DB_SCALE_ITEM(-1500, 100, 0),
+);
+
+static const DECLARE_TLV_DB_RANGE(max98520_dht_hysteresis_tlv,
+	0, 3, TLV_DB_SCALE_ITEM(100, 100, 0),
+	4, 7, TLV_DB_SCALE_ITEM(600, 200, 0),
+);
+
+static const DECLARE_TLV_DB_RANGE(max98520_dht_rotation_point_tlv,
+	0, 1, TLV_DB_SCALE_ITEM(-1500, 300, 0),
+	2, 4, TLV_DB_SCALE_ITEM(-1000, 200, 0),
+	5, 10, TLV_DB_SCALE_ITEM(-500, 100, 0),
+);
+
+static const DECLARE_TLV_DB_RANGE(max98520_dht_supply_hr_tlv,
+	0, 16, TLV_DB_SCALE_ITEM(-2000, 250, 0),
+);
+
+static const DECLARE_TLV_DB_RANGE(max98520_dht_max_atten_tlv,
+	1, 20, TLV_DB_SCALE_ITEM(-2000, 100, 0),
+);
+
+static const char * const max98520_dht_attack_rate_text[] = {
+	"20us", "40us", "80us", "160us", "320us", "640us",
+	"1.28ms", "2.56ms",	"5.12ms", "10.24ms", "20.48ms", "40.96ms",
+	"81.92ms", "163.84ms"
+};
+
+static SOC_ENUM_SINGLE_DECL(max98520_dht_attack_rate_enum,
+			    MAX98520_R20D4_DHT_CFG3, 0,
+			    max98520_dht_attack_rate_text);
+
+static const char * const max98520_dht_release_rate_text[] = {
+	"2ms", "4ms", "8ms", "16ms", "32ms", "64ms", "128ms", "256ms", "512ms",
+	"1.024s", "2.048s", "4.096s", "8.192s", "16.384s"
+};
+
+static SOC_ENUM_SINGLE_DECL(max98520_dht_release_rate_enum,
+			    MAX98520_R20D5_DHT_CFG4, 0,
+			    max98520_dht_release_rate_text);
+
+static bool max98520_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX98520_R2000_SW_RESET:
+	case MAX98520_R2027_THERM_FOLDBACK_EN:
+	case MAX98520_R2030_CLK_MON_CTRL:
+	case MAX98520_R2037_ERR_MON_CTRL:
+	case MAX98520_R204F_PCM_RX_EN:
+	case MAX98520_R209F_AMP_EN:
+	case MAX98520_R20CF_MEAS_ADC_CFG:
+	case MAX98520_R20D8_DHT_EN:
+	case MAX98520_R21FF_REVISION_ID:
+	case MAX98520_R2001_STATUS_1... MAX98520_R2002_STATUS_2:
+	case MAX98520_R2020_THERM_WARN_THRESH... MAX98520_R2023_THERM_FOLDBACK_SET:
+	case MAX98520_R2040_PCM_MODE_CFG... MAX98520_R2044_PCM_RX_SRC2:
+	case MAX98520_R2090_AMP_VOL_CTRL... MAX98520_R2092_AMP_DSP_CFG:
+	case MAX98520_R2094_SSM_CFG... MAX98520_R2095_AMP_CFG:
+	case MAX98520_R20B0_ADC_SR... MAX98520_R20BD_ADC_HIGH_TEMP_READBACK_LSB:
+	case MAX98520_R20D0_DHT_CFG1... MAX98520_R20D6_DHT_HYSTERESIS_CFG:
+	case MAX98520_R210E_AUTO_RESTART_BEHAVIOR... MAX98520_R210F_GLOBAL_EN:
+	case MAX98520_R2161_BOOST_TM1... MAX98520_R2163_BOOST_TM3:
+		return true;
+	default:
+		return false;
+	}
+};
+
+static bool max98520_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MAX98520_R210F_GLOBAL_EN:
+	case MAX98520_R21FF_REVISION_ID:
+	case MAX98520_R2000_SW_RESET:
+	case MAX98520_R2001_STATUS_1 ... MAX98520_R2002_STATUS_2:
+	case MAX98520_R20B4_ADC_READBACK_CTRL
+		... MAX98520_R20BD_ADC_HIGH_TEMP_READBACK_LSB:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct snd_kcontrol_new max98520_snd_controls[] = {
+/* Volume */
+SOC_SINGLE_TLV("Digital Volume", MAX98520_R2090_AMP_VOL_CTRL,
+	       0, 0x7F, 1, max98520_digital_tlv),
+SOC_SINGLE_TLV("Speaker Volume", MAX98520_R2091_AMP_PATH_GAIN,
+	       0, 0x5, 0, max98520_spk_tlv),
+/* Volume Ramp Up/Down Enable*/
+SOC_SINGLE("Ramp Up Switch", MAX98520_R2092_AMP_DSP_CFG,
+	   MAX98520_DSP_SPK_VOL_RMPUP_SHIFT, 1, 0),
+SOC_SINGLE("Ramp Down Switch", MAX98520_R2092_AMP_DSP_CFG,
+	   MAX98520_DSP_SPK_VOL_RMPDN_SHIFT, 1, 0),
+/* Clock Monitor Enable */
+SOC_SINGLE("CLK Monitor Switch", MAX98520_R2037_ERR_MON_CTRL,
+	   MAX98520_CTRL_CMON_EN_SHIFT, 1, 0),
+/* Clock Monitor Config */
+SOC_SINGLE("CLKMON Autorestart Switch", MAX98520_R2030_CLK_MON_CTRL,
+	   MAX98520_CMON_AUTORESTART_SHIFT, 1, 0),
+/* Dither Enable */
+SOC_SINGLE("Dither Switch", MAX98520_R2092_AMP_DSP_CFG,
+	   MAX98520_DSP_SPK_DITH_EN_SHIFT, 1, 0),
+/* DC Blocker Enable */
+SOC_SINGLE("DC Blocker Switch", MAX98520_R2092_AMP_DSP_CFG,
+	   MAX98520_DSP_SPK_DCBLK_EN_SHIFT, 1, 0),
+/* Speaker Safe Mode Enable */
+SOC_SINGLE("Speaker Safemode Switch", MAX98520_R2092_AMP_DSP_CFG,
+	   MAX98520_DSP_SPK_SAFE_EN_SHIFT, 1, 0),
+/* AMP SSM Enable */
+SOC_SINGLE("CP Bypass Switch", MAX98520_R2094_SSM_CFG,
+	   MAX98520_SSM_RCVR_MODE_SHIFT, 1, 0),
+/* AMP Dynamic Mode Configuration */
+SOC_SINGLE("Dynamic Mode Switch", MAX98520_R2095_AMP_CFG,
+	   MAX98520_CFG_DYN_MODE_SHIFT, 1, 1),
+/* AMP Speaker Mode Switch */
+SOC_SINGLE("Speaker Mode Switch", MAX98520_R2095_AMP_CFG,
+	   MAX98520_CFG_SPK_MODE_SHIFT, 1, 0),
+/* Dynamic Headroom Tracking */
+SOC_SINGLE("DHT Switch", MAX98520_R20D8_DHT_EN, 0, 1, 0),
+SOC_SINGLE("DHT Limiter Mode", MAX98520_R20D2_LIMITER_CFG2,
+	   MAX98520_DHT_LIMITER_MODE_SHIFT, 1, 0),
+SOC_SINGLE("DHT Hysteresis Switch", MAX98520_R20D6_DHT_HYSTERESIS_CFG,
+	   MAX98520_DHT_HYSTERESIS_SWITCH_SHIFT, 1, 0),
+SOC_SINGLE_TLV("DHT Rot Pnt", MAX98520_R20D0_DHT_CFG1,
+	       MAX98520_DHT_VROT_PNT_SHIFT, 10, 1, max98520_dht_rotation_point_tlv),
+SOC_SINGLE_TLV("DHT Supply Headroom", MAX98520_R20D1_LIMITER_CFG1,
+	       MAX98520_DHT_SUPPLY_HR_SHIFT, 16, 0, max98520_dht_supply_hr_tlv),
+SOC_SINGLE_TLV("DHT Limiter Threshold", MAX98520_R20D2_LIMITER_CFG2,
+	       MAX98520_DHT_LIMITER_THRESHOLD_SHIFT, 0xF, 1, max98520_dht_lim_thresh_tlv),
+SOC_SINGLE_TLV("DHT Max Attenuation", MAX98520_R20D3_DHT_CFG2,
+	       MAX98520_DHT_MAX_ATTEN_SHIFT, 20, 1, max98520_dht_max_atten_tlv),
+SOC_SINGLE_TLV("DHT Hysteresis", MAX98520_R20D6_DHT_HYSTERESIS_CFG,
+	       MAX98520_DHT_HYSTERESIS_SHIFT, 0x7, 0, max98520_dht_hysteresis_tlv),
+SOC_ENUM("DHT Attack Rate", max98520_dht_attack_rate_enum),
+SOC_ENUM("DHT Release Rate", max98520_dht_release_rate_enum),
+/* ADC configuration */
+SOC_SINGLE("ADC PVDD CH Switch", MAX98520_R20CF_MEAS_ADC_CFG, 0, 1, 0),
+SOC_SINGLE("ADC PVDD FLT Switch", MAX98520_R20B2_ADC_PVDD0_CFG,	MAX98520_FLT_EN_SHIFT, 1, 0),
+SOC_SINGLE("ADC TEMP FLT Switch", MAX98520_R20B3_ADC_THERMAL_CFG, MAX98520_FLT_EN_SHIFT, 1, 0),
+SOC_SINGLE("ADC PVDD MSB", MAX98520_R20B6_ADC_PVDD_READBACK_MSB, 0, 0xFF, 0),
+SOC_SINGLE("ADC PVDD LSB", MAX98520_R20B7_ADC_PVDD_READBACK_LSB, 0, 0x01, 0),
+SOC_SINGLE("ADC TEMP MSB", MAX98520_R20B8_ADC_TEMP_READBACK_MSB, 0, 0xFF, 0),
+SOC_SINGLE("ADC TEMP LSB", MAX98520_R20B9_ADC_TEMP_READBACK_LSB, 0, 0x01, 0),
+};
+
+static const struct snd_soc_dapm_route max98520_audio_map[] = {
+	/* Plabyack */
+	{"DAI Sel Mux", "Left", "Amp Enable"},
+	{"DAI Sel Mux", "Right", "Amp Enable"},
+	{"DAI Sel Mux", "LeftRight", "Amp Enable"},
+	{"BE_OUT", NULL, "DAI Sel Mux"},
+};
+
+static struct snd_soc_dai_driver max98520_dai[] = {
+	{
+		.name = "max98520-aif1",
+		.playback = {
+			.stream_name = "HiFi Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MAX98520_RATES,
+			.formats = MAX98520_FORMATS,
+		},
+		.ops = &max98520_dai_ops,
+	}
+
+};
+
+static void max98520_reset(struct max98520_priv *max98520, struct device *dev)
+{
+	int ret, reg, count;
+
+	/* Software Reset */
+	ret = regmap_write(max98520->regmap, MAX98520_R2000_SW_RESET, 1);
+	if (ret)
+		dev_err(dev, "Reset command failed. (ret:%d)\n", ret);
+
+	count = 0;
+	while (count < 3) {
+		usleep_range(10000, 11000);
+		/* Software Reset Verification */
+		ret = regmap_read(max98520->regmap, MAX98520_R21FF_REVISION_ID, &reg);
+		if (!ret) {
+			dev_info(dev, "Reset completed (retry:%d)\n", count);
+			return;
+		}
+		count++;
+	}
+	dev_err(dev, "Reset failed. (ret:%d)\n", ret);
+}
+
+static int max98520_probe(struct snd_soc_component *component)
+{
+	struct max98520_priv *max98520 =
+		snd_soc_component_get_drvdata(component);
+
+	/* Software Reset */
+	max98520_reset(max98520, component->dev);
+	usleep_range(30000, 31000);
+
+	/* L/R mix configuration */
+	regmap_write(max98520->regmap, MAX98520_R2043_PCM_RX_SRC1, 0x2);
+
+	regmap_write(max98520->regmap, MAX98520_R2044_PCM_RX_SRC2, 0x10);
+	/* Enable DC blocker */
+	regmap_update_bits(max98520->regmap, MAX98520_R2092_AMP_DSP_CFG, 1, 1);
+	/* Disable Speaker Safe Mode */
+	regmap_update_bits(max98520->regmap,
+			   MAX98520_R2092_AMP_DSP_CFG, MAX98520_SPK_SAFE_EN_MASK, 0);
+	/* Enable Clock Monitor Auto-restart */
+	regmap_write(max98520->regmap, MAX98520_R2030_CLK_MON_CTRL, 0x1);
+
+	/* Hard coded values for the experiments */
+	regmap_write(max98520->regmap, MAX98520_R21FF_REVISION_ID, 0x54);
+	regmap_write(max98520->regmap, MAX98520_R21FF_REVISION_ID, 0x4d);
+	regmap_write(max98520->regmap, MAX98520_R2161_BOOST_TM1, 0x2);
+	regmap_write(max98520->regmap, MAX98520_R2095_AMP_CFG, 0xc8);
+
+	/* set Rx Enable */
+	regmap_update_bits(max98520->regmap,
+			   MAX98520_R204F_PCM_RX_EN,
+			   MAX98520_PCM_RX_EN_MASK,
+			   1);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int max98520_suspend(struct device *dev)
+{
+	struct max98520_priv *max98520 = dev_get_drvdata(dev);
+
+	regcache_cache_only(max98520->regmap, true);
+	regcache_mark_dirty(max98520->regmap);
+	return 0;
+}
+
+static int max98520_resume(struct device *dev)
+{
+	struct max98520_priv *max98520 = dev_get_drvdata(dev);
+
+	regcache_cache_only(max98520->regmap, false);
+	max98520_reset(max98520, dev);
+	regcache_sync(max98520->regmap);
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops max98520_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(max98520_suspend, max98520_resume)
+};
+
+static const struct snd_soc_component_driver soc_codec_dev_max98520 = {
+	.probe			= max98520_probe,
+	.controls		= max98520_snd_controls,
+	.num_controls		= ARRAY_SIZE(max98520_snd_controls),
+	.dapm_widgets		= max98520_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(max98520_dapm_widgets),
+	.dapm_routes		= max98520_audio_map,
+	.num_dapm_routes	= ARRAY_SIZE(max98520_audio_map),
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static const struct regmap_config max98520_regmap = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_register = MAX98520_R21FF_REVISION_ID,
+	.reg_defaults  = max98520_reg,
+	.num_reg_defaults = ARRAY_SIZE(max98520_reg),
+	.readable_reg = max98520_readable_register,
+	.volatile_reg = max98520_volatile_reg,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static int max98520_i2c_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
+{
+	int ret = 0;
+	int reg = 0;
+	struct max98520_priv *max98520 = NULL;
+	struct i2c_adapter *adapter = to_i2c_adapter(i2c->dev.parent);
+
+	ret = i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA);
+	if (!ret) {
+		dev_err(&i2c->dev, "I2C check functionality failed\n");
+		return -ENXIO;
+	}
+
+	max98520 = devm_kzalloc(&i2c->dev, sizeof(*max98520), GFP_KERNEL);
+
+	if (!max98520) {
+		ret = -ENOMEM;
+		return ret;
+	}
+	i2c_set_clientdata(i2c, max98520);
+
+	/* regmap initialization */
+	max98520->regmap =
+		devm_regmap_init_i2c(i2c, &max98520_regmap);
+	if (IS_ERR(max98520->regmap)) {
+		ret = PTR_ERR(max98520->regmap);
+		dev_err(&i2c->dev,
+			"Failed to allocate regmap: %d\n", ret);
+		return ret;
+	}
+
+	/* Power on device */
+	if (gpio_is_valid(max98520->reset_gpio)) {
+		ret = devm_gpio_request(&i2c->dev, max98520->reset_gpio,
+					"MAX98520_RESET");
+		if (ret) {
+			dev_err(&i2c->dev, "%s: Failed to request gpio %d\n",
+				__func__, max98520->reset_gpio);
+			return -EINVAL;
+		}
+		gpio_direction_output(max98520->reset_gpio, 0);
+		msleep(50);
+		gpio_direction_output(max98520->reset_gpio, 1);
+		msleep(20);
+	}
+
+	/* Check Revision ID */
+	ret = regmap_read(max98520->regmap, MAX98520_R21FF_REVISION_ID, &reg);
+	if (ret < 0) {
+		dev_err(&i2c->dev,
+			"Failed to read: 0x%02X\n", MAX98520_R21FF_REVISION_ID);
+		return ret;
+	}
+	dev_info(&i2c->dev, "MAX98520 revisionID: 0x%02X\n", reg);
+
+	/* codec registration */
+	ret = devm_snd_soc_register_component(&i2c->dev,
+					      &soc_codec_dev_max98520,
+		max98520_dai, ARRAY_SIZE(max98520_dai));
+	if (ret < 0)
+		dev_err(&i2c->dev, "Failed to register codec: %d\n", ret);
+
+	return ret;
+}
+
+static const struct i2c_device_id max98520_i2c_id[] = {
+	{ "max98520", 0},
+	{ },
+};
+
+MODULE_DEVICE_TABLE(i2c, max98520_i2c_id);
+
+#if defined(CONFIG_OF)
+static const struct of_device_id max98520_of_match[] = {
+	{ .compatible = "maxim,max98520", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max98520_of_match);
+#endif
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id max98520_acpi_match[] = {
+	{ "MX98520", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, max98520_acpi_match);
+#endif
+
+static struct i2c_driver max98520_i2c_driver = {
+	.driver = {
+		.name = "max98520",
+		.of_match_table = of_match_ptr(max98520_of_match),
+		.acpi_match_table = ACPI_PTR(max98520_acpi_match),
+		.pm = &max98520_pm,
+	},
+	.probe = max98520_i2c_probe,
+	.id_table = max98520_i2c_id,
+};
+
+module_i2c_driver(max98520_i2c_driver)
+
+MODULE_DESCRIPTION("ALSA SoC MAX98520 driver");
+MODULE_AUTHOR("George Song <george.song@maximintegrated.com>");
+MODULE_LICENSE("GPL");
+
diff --git a/sound/soc/codecs/max98520.h b/sound/soc/codecs/max98520.h
new file mode 100644
index 000000000000..afb5f3917136
--- /dev/null
+++ b/sound/soc/codecs/max98520.h
@@ -0,0 +1,159 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021, Maxim Integrated.
+ */
+
+#ifndef _MAX98520_H
+#define _MAX98520_H
+
+#define MAX98520_R2000_SW_RESET 0x2000
+#define MAX98520_R2001_STATUS_1 0x2001
+#define MAX98520_R2002_STATUS_2 0x2002
+#define MAX98520_R2020_THERM_WARN_THRESH 0x2020
+#define MAX98520_R2021_THERM_SHDN_THRESH 0x2021
+#define MAX98520_R2022_THERM_HYSTERESIS 0x2022
+#define MAX98520_R2023_THERM_FOLDBACK_SET 0x2023
+#define MAX98520_R2027_THERM_FOLDBACK_EN 0x2027
+#define MAX98520_R2030_CLK_MON_CTRL 0x2030
+#define MAX98520_R2037_ERR_MON_CTRL 0x2037
+#define MAX98520_R2040_PCM_MODE_CFG	0x2040
+#define MAX98520_R2041_PCM_CLK_SETUP 0x2041
+#define MAX98520_R2042_PCM_SR_SETUP 0x2042
+#define MAX98520_R2043_PCM_RX_SRC1 0x2043
+#define MAX98520_R2044_PCM_RX_SRC2 0x2044
+#define MAX98520_R204F_PCM_RX_EN 0x204F
+#define MAX98520_R2090_AMP_VOL_CTRL 0x2090
+#define MAX98520_R2091_AMP_PATH_GAIN 0x2091
+#define MAX98520_R2092_AMP_DSP_CFG 0x2092
+#define MAX98520_R2094_SSM_CFG 0x2094
+#define MAX98520_R2095_AMP_CFG 0x2095
+#define MAX98520_R209F_AMP_EN 0x209F
+#define MAX98520_R20B0_ADC_SR 0x20B0
+#define MAX98520_R20B1_ADC_RESOLUTION 0x20B1
+#define MAX98520_R20B2_ADC_PVDD0_CFG 0x20B2
+#define MAX98520_R20B3_ADC_THERMAL_CFG 0x20B3
+#define MAX98520_R20B4_ADC_READBACK_CTRL 0x20B4
+#define MAX98520_R20B5_ADC_READBACK_UPDATE 0x20B5
+#define MAX98520_R20B6_ADC_PVDD_READBACK_MSB 0x20B6
+#define MAX98520_R20B7_ADC_PVDD_READBACK_LSB 0x20B7
+#define MAX98520_R20B8_ADC_TEMP_READBACK_MSB 0x20B8
+#define MAX98520_R20B9_ADC_TEMP_READBACK_LSB 0x20B9
+#define MAX98520_R20BA_ADC_LOW_PVDD_READBACK_MSB 0x20BA
+#define MAX98520_R20BB_ADC_LOW_READBACK_LSB 0x20BB
+#define MAX98520_R20BC_ADC_HIGH_TEMP_READBACK_MSB 0x20BC
+#define MAX98520_R20BD_ADC_HIGH_TEMP_READBACK_LSB 0x20BD
+#define MAX98520_R20CF_MEAS_ADC_CFG 0x20CF
+#define MAX98520_R20D0_DHT_CFG1 0x20D0
+#define MAX98520_R20D1_LIMITER_CFG1 0x20D1
+#define MAX98520_R20D2_LIMITER_CFG2 0x20D2
+#define MAX98520_R20D3_DHT_CFG2 0x20D3
+#define MAX98520_R20D4_DHT_CFG3 0x20D4
+#define MAX98520_R20D5_DHT_CFG4 0x20D5
+#define MAX98520_R20D6_DHT_HYSTERESIS_CFG 0x20D6
+#define MAX98520_R20D8_DHT_EN 0x20D8
+#define MAX98520_R210E_AUTO_RESTART_BEHAVIOR 0x210E
+#define MAX98520_R210F_GLOBAL_EN 0x210F
+#define MAX98520_R2161_BOOST_TM1 0x2161
+#define MAX98520_R2162_BOOST_TM2 0x2162
+#define MAX98520_R2163_BOOST_TM3 0x2163
+#define MAX98520_R21FF_REVISION_ID 0x21FF
+
+/* MAX98520_R2030_CLK_MON_CTRL */
+#define MAX98520_CMON_AUTORESTART_SHIFT (0)
+
+/* MAX98520_R2037_ERR_MON_CTRL */
+#define MAX98520_CTRL_CMON_EN_SHIFT (0)
+
+/* MAX98520_R2040_PCM_MODE_CFG */
+#define MAX98520_PCM_MODE_CFG_FORMAT_MASK (0x7 << 3)
+#define MAX98520_PCM_MODE_CFG_FORMAT_SHIFT (3)
+#define MAX98520_PCM_TX_CH_INTERLEAVE_MASK (0x1 << 2)
+#define MAX98520_PCM_FORMAT_I2S (0x0 << 3)
+#define MAX98520_PCM_FORMAT_LJ (0x1 << 3)
+#define MAX98520_PCM_FORMAT_TDM_MODE0 (0x3 << 3)
+#define MAX98520_PCM_FORMAT_TDM_MODE1 (0x4 << 3)
+#define MAX98520_PCM_FORMAT_TDM_MODE2 (0x5 << 3)
+#define MAX98520_PCM_MODE_CFG_CHANSZ_MASK (0x3 << 6)
+#define MAX98520_PCM_MODE_CFG_CHANSZ_16 (0x1 << 6)
+#define MAX98520_PCM_MODE_CFG_CHANSZ_24 (0x2 << 6)
+#define MAX98520_PCM_MODE_CFG_CHANSZ_32 (0x3 << 6)
+
+/* MAX98520_R2041_PCM_CLK_SETUP */
+#define MAX98520_PCM_MODE_CFG_PCM_BCLKEDGE (0x1 << 4)
+#define MAX98520_PCM_CLK_SETUP_BSEL_MASK (0xF << 0)
+
+/* MAX98520_R2042_PCM_SR_SETUP */
+#define MAX98520_PCM_SR_SHIFT (0)
+#define MAX98520_IVADC_SR_SHIFT (4)
+#define MAX98520_PCM_SR_MASK (0xF << MAX98520_PCM_SR_SHIFT)
+#define MAX98520_IVADC_SR_MASK (0xF << MAX98520_IVADC_SR_SHIFT)
+#define MAX98520_PCM_SR_8000 (0x0)
+#define MAX98520_PCM_SR_11025 (0x1)
+#define MAX98520_PCM_SR_12000 (0x2)
+#define MAX98520_PCM_SR_16000 (0x3)
+#define MAX98520_PCM_SR_22050 (0x4)
+#define MAX98520_PCM_SR_24000 (0x5)
+#define MAX98520_PCM_SR_32000 (0x6)
+#define MAX98520_PCM_SR_44100 (0x7)
+#define MAX98520_PCM_SR_48000 (0x8)
+#define MAX98520_PCM_SR_88200 (0x9)
+#define MAX98520_PCM_SR_96000 (0xA)
+#define MAX98520_PCM_SR_176400 (0xB)
+#define MAX98520_PCM_SR_192000 (0xC)
+
+/* MAX98520_R2044_PCM_RX_SRC2 */
+#define MAX98520_PCM_DMIX_CH1_SHIFT (0xF << 0)
+#define MAX98520_PCM_DMIX_CH0_SRC_MASK (0xF << 0)
+#define MAX98520_PCM_DMIX_CH1_SRC_MASK (0xF << MAX98520_PCM_DMIX_CH1_SHIFT)
+
+/* MAX98520_R204F_PCM_RX_EN */
+#define MAX98520_PCM_RX_EN_MASK (0x1 << 0)
+#define MAX98520_PCM_RX_BYP_EN_MASK (0x1 << 1)
+
+/* MAX98520_R2092_AMP_DSP_CFG */
+#define MAX98520_DSP_SPK_DCBLK_EN_SHIFT (0)
+#define MAX98520_DSP_SPK_DITH_EN_SHIFT (1)
+#define MAX98520_DSP_SPK_INVERT_SHIFT (2)
+#define MAX98520_DSP_SPK_VOL_RMPUP_SHIFT (3)
+#define MAX98520_DSP_SPK_VOL_RMPDN_SHIFT (4)
+#define MAX98520_DSP_SPK_SAFE_EN_SHIFT (5)
+
+#define MAX98520_SPK_SAFE_EN_MASK (0x1 << MAX98520_DSP_SPK_SAFE_EN_SHIFT)
+
+/* MAX98520_R2094_SSM_CFG */
+#define MAX98520_SSM_EN_SHIFT (0)
+#define MAX98520_SSM_MOD_SHIFT (1)
+#define MAX98520_SSM_RCVR_MODE_SHIFT (3)
+
+/* MAX98520_R2095_AMP_CFG */
+#define MAX98520_CFG_DYN_MODE_SHIFT (4)
+#define MAX98520_CFG_SPK_MODE_SHIFT (3)
+
+/* MAX98520_R20D0_DHT_CFG1 */
+#define MAX98520_DHT_VROT_PNT_SHIFT	(0)
+
+/* MAX98520_R20D1_LIMITER_CFG1 */
+#define MAX98520_DHT_SUPPLY_HR_SHIFT (0)
+
+/* MAX98520_R20D2_DHT_CFG2 */
+#define MAX98520_DHT_LIMITER_MODE_SHIFT (0)
+#define MAX98520_DHT_LIMITER_THRESHOLD_SHIFT (1)
+
+/* MAX98520_R20D3_DHT_CFG2 */
+#define MAX98520_DHT_MAX_ATTEN_SHIFT (0)
+
+/* MAX98520_R20D6_DHT_HYSTERESIS_CFG */
+#define MAX98520_DHT_HYSTERESIS_SWITCH_SHIFT (0)
+#define MAX98520_DHT_HYSTERESIS_SHIFT (1)
+
+/* MAX98520_R20B2_ADC_PVDD0_CFG, MAX98520_R20B3_ADC_THERMAL_CFG */
+#define MAX98520_FLT_EN_SHIFT (4)
+
+struct max98520_priv {
+	struct regmap *regmap;
+	int reset_gpio;
+	unsigned int ch_size;
+	bool tdm_mode;
+};
+#endif
+
-- 
2.25.1

