Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 183BB433191
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 10:51:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 732B216A3;
	Tue, 19 Oct 2021 10:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 732B216A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634633485;
	bh=lRutWDajjyZ6Vd4nIqmPIiIsPwpUF+sTA1DwIty5z0k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hXYgFfFy/FbjHcip7dtikvA1T9qOvIT1ao+/Y2mQlhJVfFeUXTGht6YSeaS1B6R83
	 nSbsx9jT62ec2oTw9edHDo3/FhPjFMunOFL5Z6og+Jnns98e5BSJ26bYvKig6tdpaI
	 Z75xRHBB0p2HtLu0rC6HHwNTRFOLLckVRwHiecKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A95AF8026C;
	Tue, 19 Oct 2021 10:50:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E22BF80256; Tue, 19 Oct 2021 10:50:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2090.outbound.protection.outlook.com [40.107.92.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3498DF80155
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 10:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3498DF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="Y5gR/AxH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X63LL4rzk14l1wLOU6qcHo1OyzvfEI5KqSx73VA4gUjypY+T6EGJkDW/WPaZoffzrayoBns/GLed148WbRSYdWwkTNC+2YqtlNvfFCTNIYQw+MjRxumRqBYIgXOkshXm1TeETcNAXCV32HgCKr0dlw/XeYFAlugL0Fv4Eat9H5EI3Ph8SoNERciVqHWz2yS/lGyESGIagzDwot7prrXeW/hvybhsyXKK/DhdqLeqc6Fy6Sgy2jIP9iYhCkH1GRZt1r/ZHqhUtVrd9K79h4Y8tfJe6d/oRk8nUU2mJJUCzrrd03FLRA3KVQC94V8L7J1Bcmn8ZWN8UW6058cJ3WJMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90DijlOhkNafXLa/nRW/Gz7sH/4Ntd67j837g6ysXEQ=;
 b=QrhMszdLFrYdgfu0IcBhuTK7CJLqIynS5QnJXxieCDdujigFhSZ9kdvB12BruudTgoQ8IxLrvwVvs4rRi3fdNXFmK5O/ttY3iqEg1utTHzHLzOgdVriunMZGHNce0DTyHo1rEHLAzMj2wvEegQOa5/hLwU4jxyheydu81072GUskuJPwbM0rsqwvesqBQoU3N5UrMXUq7XFfgrIUXLA+e+MqVDqWYjX6O/iNWOeSczmauTujW3kEGtrcAt1Oai3+6wflunTCmXT9QztnUXtEOSykkUbBkC1dF+kNRGK1rgpI0OqM+rC82IUUfpZ644RcQFlf/QHGgG1ehB9L7WxuyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90DijlOhkNafXLa/nRW/Gz7sH/4Ntd67j837g6ysXEQ=;
 b=Y5gR/AxHbwB+lxWtqnZLHPXLpTQa7WPkHICCrrrEcvmwDbyRmkBTQVYQGZlbGi7guzIHuc0gk/ertZqBDodTptSiRijfpZuvNRDUmxPWfGeAxckefMIBqfGBQ2C4Y10dE2D+iv/mSqVNxoy5HuOhbHQqYurafTAOQTIGPZs3Jt0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from BYAPR11MB3671.namprd11.prod.outlook.com (2603:10b6:a03:b3::15)
 by BYAPR11MB3349.namprd11.prod.outlook.com (2603:10b6:a03:1c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 08:49:54 +0000
Received: from BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94]) by BYAPR11MB3671.namprd11.prod.outlook.com
 ([fe80::49d4:a1dd:5b55:4c94%6]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 08:49:54 +0000
From: George Song <george.song@maximintegrated.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org
Subject: [v4] ASoC: max98520: add max98520 audio amplifier driver
Date: Tue, 19 Oct 2021 17:49:14 +0900
Message-Id: <20211019084914.14622-1-george.song@maximintegrated.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0114.KORP216.PROD.OUTLOOK.COM (2603:1096:101::11)
 To BYAPR11MB3671.namprd11.prod.outlook.com
 (2603:10b6:a03:b3::15)
MIME-Version: 1.0
Received: from SEL-LT-028891.maxim-ic.internal (223.62.188.239) by
 SL2P216CA0114.KORP216.PROD.OUTLOOK.COM (2603:1096:101::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Tue, 19 Oct 2021 08:49:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41ffff2a-1791-41fa-2d72-08d992dd6b58
X-MS-TrafficTypeDiagnostic: BYAPR11MB3349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR11MB334959EB90855C18B5F88D05F4BD9@BYAPR11MB3349.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6UZv8/EydGctJis6wP5JpmCUypf7w0Bi82KjzpiAPC+yyUXy/dw4RJJHb5pqI/RsF8wopyDs0nqyzb17o6Hbgowo/LZn8xfm9/H353ECWb6doBvPAF+4wtP0tHcZx1MEtuL2hUGAHAAJv+shSCrujBiwNWjYD2umOaK+UgZh0oeIrJrJC7+0KX4ozeQGPAnhxsZuMT/kSXZVoXmPLNEHnsogM1+Pcf33gA3CkWVYWxXRoh+/5/N42YnbHNzZ25ESy2aRPVL/uRC0QDN0bngOCknnYwwBZAU55Z4R5BO8jvis25T+m8kQWBwwMsGSmbJNw8mfPO2B5pOt9AolMeqRSLmeOmCAnEqVfXAdalcGZ2TiM7ewwHgAFDCsEA8euYc3J5cxpQsZ8dr3Tf4yTtTQcqvbX+DO1LgtCU8lVbSbNwdXI7Ge2vS5TR3SdN2Ko+iOj5lv/AIvQ5hrTnkcLmphmwHecnlnSGathA8/NI0aEzBUchOgp5+0YYiT4pS6K/S98Q653IUu+7xpI2xFqq/ymGDQHivlscXbjD5W88Lw1psUsA6g2BUgKvqn0Dt+eOj2yak2N2JVpGL83BqkpL0HTYtUv5IrCImekc3fi+nWeqPZ1j8kSXD2D4C9jhqEZQwnnBihp1029I+56Gdg4WDUfmHEj9ecI0TIFXfzP0c0srEfBx1GzaFWxipOksngp4MWFQu6vb1hKaImGAdEZWG2gQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3671.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(8936002)(38100700002)(38350700002)(44832011)(8676002)(5660300002)(2906002)(107886003)(66946007)(86362001)(316002)(6486002)(66476007)(956004)(508600001)(6512007)(52116002)(2616005)(83380400001)(30864003)(6666004)(26005)(36756003)(66556008)(1076003)(6506007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XQTc1wLi2OD3qBwMETSNqMXqr2j/rUiL6AF5prgOrYln5iVG1Y8OPTpTQxXZ?=
 =?us-ascii?Q?VvMdgMOFFHP3wfLvfNzHOARh2Ly6AiX5p7lXx05eoa+XLLBAnC+4cYJsXR+z?=
 =?us-ascii?Q?AJDPoOX+t3pwqfrIPfqKEvVVeq+pHqnNDCzKdnbwWn3kozsxfoS1WauG8H/w?=
 =?us-ascii?Q?1621GjA0zlAj02RTPLSQAZrwPO7CaQGvx51xbkJ8SwQN20g5udmWCTnd+cBf?=
 =?us-ascii?Q?R/pKS4NNtsj7YMmPZUHgxFoiygcH8Qk1nTBzAO2JgEMD6LtQ21zViZi5OZB7?=
 =?us-ascii?Q?/HD72ZxJywsdidtT5DtE+RaGGJ4/EfPTNG1ulWokReiYs6JE6c/OjG+HipVG?=
 =?us-ascii?Q?FJkRG63ypA6/K1PT4+9yOubIKgXv+F8gJ/ZG+Xbi6Crtp5ID2ThTthgMGGjf?=
 =?us-ascii?Q?pu9lEJ7BOF38sJwimRz53DQPskChNqMn19vP04IV3f6+E68cQMQXclzBaYWW?=
 =?us-ascii?Q?HSU0qPuO/krLvAs360ItUhYYLWcVWx2yU059phwY1TKvueh/sXWBn0OQ12BT?=
 =?us-ascii?Q?/hcUok/87Y9U5nV+wRacQahTy7xO2S3Fit5tvWlPz1ZAU6pbfmBRyb0i9TM7?=
 =?us-ascii?Q?H/09vb9YytLqmroSg5/Kj+96d45Anpi3g3Vfecv1cTf9/YNrQU0ZLDt6nrHm?=
 =?us-ascii?Q?GFZ8N8kap++5K/c63DPiiGrfBF5GOld/f7lnxWAaejQblJHYTG7WZ0RUTNHm?=
 =?us-ascii?Q?jddlp7s1VPsedqwkwtSxGQfmIuXy9LkV284P9soNvS7JFAHpMDAlSQAFRY/N?=
 =?us-ascii?Q?FiglBa7qgS2eYYNCqO52Iimc0Pnj8kIJlSNzjJqX5Lvl/VJZzcumH8G5/g6H?=
 =?us-ascii?Q?enjh6h1+8pE5wGcBqfF66yu7ifYD6JST8JJQMHZX51cNdLH3ZS4zesWc+0NG?=
 =?us-ascii?Q?iB6E34FnfxTFeLpigs3KqeWnSlvME4HpzbUVghC1I/Xot2aNwGyhPBIcqj+G?=
 =?us-ascii?Q?OSOByAToxt7F8/FyRidfXq4MnhldUSSD9K9RqJwCNMJjMEtK84YLG4pIUd+/?=
 =?us-ascii?Q?BF5EUE9Clgpu1CnBK/qcatjhhY8fJ6CfbMqZJVoKQFMTgIIrkppfHlPHDlUS?=
 =?us-ascii?Q?7lXjSLBUwNS6bcbU2LYKwiX6vMFsikvRgplO56torpVMmh4upqO4uidrM9ur?=
 =?us-ascii?Q?2uK71yMmu9XMeIqo3LIksQJHUzMCZMfOHNXAi0igoh64T+OqS9akpDW6/i1X?=
 =?us-ascii?Q?Wp5zN205wk6JR8bs8lFCB4DnKJEgeErHBcxnSNDgdoI1qQdhu9aPE/6GjA8N?=
 =?us-ascii?Q?CGyvvdzF3SmaNLfW8sjza7PxMQIEbDecMacGrgAclsZmzv94W6vJRHYhYoGt?=
 =?us-ascii?Q?Qu+8HOSmmP3f2jppLQHXjAPr?=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ffff2a-1791-41fa-2d72-08d992dd6b58
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3671.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 08:49:54.0391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9JHlCrus8mSPDCTZtd67P6Q3+FodOmaROLFaa20n5mCT0UAdFtWN0if9wacK3Zgj8Nsu+m9wsavbYH4wdB5zvq/0QLglqDUNcngw8rRoBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3349
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
 sound/soc/codecs/max98520.c | 798 ++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/max98520.h | 159 +++++++
 4 files changed, 971 insertions(+)
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
index 000000000000..3f87410d0608
--- /dev/null
+++ b/sound/soc/codecs/max98520.c
@@ -0,0 +1,798 @@
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
+#include <linux/gpio/consumer.h>
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
+		regmap_write(max98520->regmap, MAX98520_R209F_AMP_EN, 1);
+		regmap_write(max98520->regmap, MAX98520_R210F_GLOBAL_EN, 1);
+		usleep_range(30000, 31000);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		dev_dbg(component->dev, " AMP OFF\n");
+
+		regmap_write(max98520->regmap, MAX98520_R210F_GLOBAL_EN, 0);
+		regmap_write(max98520->regmap, MAX98520_R209F_AMP_EN, 0);
+		usleep_range(30000, 31000);
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
+static const struct snd_kcontrol_new max98520_left_input_mixer_controls[] = {
+	SOC_DAPM_SINGLE("PCM_INPUT_CH0", MAX98520_R2044_PCM_RX_SRC2, 0, 0x0, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH1", MAX98520_R2044_PCM_RX_SRC2, 0, 0x1, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH2", MAX98520_R2044_PCM_RX_SRC2, 0, 0x2, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH3", MAX98520_R2044_PCM_RX_SRC2, 0, 0x3, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH4", MAX98520_R2044_PCM_RX_SRC2, 0, 0x4, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH5", MAX98520_R2044_PCM_RX_SRC2, 0, 0x5, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH6", MAX98520_R2044_PCM_RX_SRC2, 0, 0x6, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH7", MAX98520_R2044_PCM_RX_SRC2, 0, 0x7, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH8", MAX98520_R2044_PCM_RX_SRC2, 0, 0x8, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH9", MAX98520_R2044_PCM_RX_SRC2, 0, 0x9, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH10", MAX98520_R2044_PCM_RX_SRC2, 0, 0xa, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH11", MAX98520_R2044_PCM_RX_SRC2, 0, 0xb, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH12", MAX98520_R2044_PCM_RX_SRC2, 0, 0xc, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH13", MAX98520_R2044_PCM_RX_SRC2, 0, 0xd, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH14", MAX98520_R2044_PCM_RX_SRC2, 0, 0xe, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH15", MAX98520_R2044_PCM_RX_SRC2, 0, 0xf, 0),
+};
+
+static const struct snd_kcontrol_new max98520_right_input_mixer_controls[] = {
+	SOC_DAPM_SINGLE("PCM_INPUT_CH0", MAX98520_R2044_PCM_RX_SRC2, 4, 0x0, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH1", MAX98520_R2044_PCM_RX_SRC2, 4, 0x1, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH2", MAX98520_R2044_PCM_RX_SRC2, 4, 0x2, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH3", MAX98520_R2044_PCM_RX_SRC2, 4, 0x3, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH4", MAX98520_R2044_PCM_RX_SRC2, 4, 0x4, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH5", MAX98520_R2044_PCM_RX_SRC2, 4, 0x5, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH6", MAX98520_R2044_PCM_RX_SRC2, 4, 0x6, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH7", MAX98520_R2044_PCM_RX_SRC2, 4, 0x7, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH8", MAX98520_R2044_PCM_RX_SRC2, 4, 0x8, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH9", MAX98520_R2044_PCM_RX_SRC2, 4, 0x9, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH10", MAX98520_R2044_PCM_RX_SRC2, 4, 0xa, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH11", MAX98520_R2044_PCM_RX_SRC2, 4, 0xb, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH12", MAX98520_R2044_PCM_RX_SRC2, 4, 0xc, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH13", MAX98520_R2044_PCM_RX_SRC2, 4, 0xd, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH14", MAX98520_R2044_PCM_RX_SRC2, 4, 0xe, 0),
+	SOC_DAPM_SINGLE("PCM_INPUT_CH15", MAX98520_R2044_PCM_RX_SRC2, 4, 0xf, 0),
+};
+
+static const struct snd_soc_dapm_widget max98520_dapm_widgets[] = {
+	SND_SOC_DAPM_DAC_E("Amp Enable", "HiFi Playback",
+			   SND_SOC_NOPM, 0, 0, max98520_dac_event,
+	SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_MUX("DAI Sel Mux", SND_SOC_NOPM, 0, 0,	&max98520_dai_controls),
+	SND_SOC_DAPM_OUTPUT("BE_OUT"),
+	/* Left Input Selection */
+	SND_SOC_DAPM_MIXER("Left Input Selection", SND_SOC_NOPM, 0, 0,
+			   &max98520_left_input_mixer_controls[0],
+			   ARRAY_SIZE(max98520_left_input_mixer_controls)),
+	/* Right Input Selection */
+	SND_SOC_DAPM_MIXER("Right Input Selection", SND_SOC_NOPM, 0, 0,
+			   &max98520_right_input_mixer_controls[0],
+			   ARRAY_SIZE(max98520_right_input_mixer_controls)),
+};
+
+static const DECLARE_TLV_DB_SCALE(max98520_digital_tlv, -6300, 50, 1);
+static const DECLARE_TLV_DB_SCALE(max98520_spk_tlv, -600, 300, 0);
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
+		if (!ret)
+			return;
+
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
+
+	/* Enable DC blocker */
+	regmap_update_bits(max98520->regmap, MAX98520_R2092_AMP_DSP_CFG, 1, 1);
+	/* Enable Clock Monitor Auto-restart */
+	regmap_write(max98520->regmap, MAX98520_R2030_CLK_MON_CTRL, 0x1);
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
+static void max98520_power_on(struct max98520_priv *max98520, bool poweron)
+{
+	if (max98520->reset_gpio)
+		gpiod_set_value_cansleep(max98520->reset_gpio, !poweron);
+}
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
+	max98520->reset_gpio = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_HIGH);
+	if (max98520->reset_gpio) {
+		if (IS_ERR(max98520->reset_gpio)) {
+			ret = PTR_ERR(max98520->reset_gpio);
+			dev_err(&i2c->dev, "Unable to request GPIO pin: %d.\n", ret);
+			return ret;
+		}
+
+		max98520_power_on(max98520, 1);
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
index 000000000000..89a95c25afcf
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
+	struct gpio_desc *reset_gpio;
+	unsigned int ch_size;
+	bool tdm_mode;
+};
+#endif
+
-- 
2.25.1

