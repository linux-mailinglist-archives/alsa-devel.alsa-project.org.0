Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA9542DAD8
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 15:52:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFCC21663;
	Thu, 14 Oct 2021 15:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFCC21663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634219520;
	bh=DBgJ93ZPFS2qqmnR1zdmZtPHgzauk1wlitm5XsC/WIA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GoNOjrFR+bSU659o+HcU/DMXfX3OF7dYaA35X9J70PYpoof2tpGPHt5hQ6143MHNO
	 q+0ANWnAS+wiqFV8ysd68eG2X+Zb8i0vk9uKpJwNEk0UtZoUvXxErS7zKqoDPIORdf
	 IOrGsljjvW4+HM/El6KKgityggbY5CwtaL/An69Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7BB0F80527;
	Thu, 14 Oct 2021 15:47:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E4D4F8025B; Wed, 13 Oct 2021 17:52:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2099.outbound.protection.outlook.com [40.107.102.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D675EF8025B
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 17:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D675EF8025B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=maximintegrated.onmicrosoft.com
 header.i=@maximintegrated.onmicrosoft.com header.b="JEpDKGUq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBDZlAm64tMyCy2NFAe1CjV3Y+C6Ke3Mrtb4bnym3g2eDNF+ylawJy2fk/bsnaMbrkSLskrnYOMT517nw42OMBPXMHqh9+bWG4KlQqqosbmG4f8MUc3CX0lG5uFuyrsB0U0TGLSvJeXcDV56KrNXTosfxsKWL2fO6YUwJcJZtvm8psBUOjmZYToi+c+SkpXrmd2bzC7dDaXhCfZRpH3yUZE0WkcQ8itooNOvhQ5isjrMoVwpIjylXfiP1CWQXEQORSidZraX/2eJu9+MJKTGSDWM+MrmAaP6weImWNx1pPx5P80vJN6+yMWH/Y7BpwAnO8nYM64aFM2Q1xLTZ+mNcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMyQeWkLUdQErvna3BB7Mv8N1b8OByGsrZ2dwoWIj2E=;
 b=iRWQ/JOzjbDYh9ovecEfrDxxPf2U9PN1kb2LrXJUjL+Cjp/iynEmPaj5JOE3ngxSwTVUgr/cQPavip770RXCJhQLmjXthCORlGZNZxuX/dWQhtrM+uxqw2AH2ZNkK8UyChD20QEedUHUCJqEOSb9lZaZkdyCgUJ6aD2TjMxouZJ+b8rvSoINWB8t32s8S7bjzyyUClPqWamMdKjRb1SRHJYJxs2xcIY4KL2hFrSG3RVgS0zzhZpNq+cD13Com/EtM0jHWH0yS6ic+OMt+FcrmbWzxyl0ISKKM3TH3FjtaqMlg07mDpXdZLql7tFf+XBQ7qUV1V8U12pRilBJnEUUSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=maximintegrated.com; dmarc=pass action=none
 header.from=maximintegrated.com; dkim=pass header.d=maximintegrated.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maximintegrated.onmicrosoft.com;
 s=selector2-maximintegrated-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMyQeWkLUdQErvna3BB7Mv8N1b8OByGsrZ2dwoWIj2E=;
 b=JEpDKGUqvB8gyoPobQ6096IUqVybC67Igho2pY9TQfrnyiWvqjDLFaemztXexmX4X7anqyIJLyDgS0m3tzQpzWzmtzZgqY5Q3YTrDAR72U0+jzdcSBo1amaxpUNeySaAA1kXYw4N45jkZWMdyMEdgwlTX0VIeyhKavm94i3QMsg=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=maximintegrated.com;
Received: from MN2PR11MB3678.namprd11.prod.outlook.com (2603:10b6:208:f8::11)
 by MN2PR11MB3694.namprd11.prod.outlook.com (2603:10b6:208:f7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Wed, 13 Oct
 2021 15:52:18 +0000
Received: from MN2PR11MB3678.namprd11.prod.outlook.com
 ([fe80::fc11:3689:b9ad:4bfc]) by MN2PR11MB3678.namprd11.prod.outlook.com
 ([fe80::fc11:3689:b9ad:4bfc%7]) with mapi id 15.20.4587.027; Wed, 13 Oct 2021
 15:52:18 +0000
From: George Song <george.song@maximintegrated.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org
Subject: [PATCH 2/2] ASoC: max98520: Add max98520 audio amplifier driver
Date: Thu, 14 Oct 2021 00:51:58 +0900
Message-Id: <20211013155158.1311-2-george.song@maximintegrated.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013155158.1311-1-george.song@maximintegrated.com>
References: <20211013155158.1311-1-george.song@maximintegrated.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0123.KORP216.PROD.OUTLOOK.COM (2603:1096:101::20)
 To MN2PR11MB3678.namprd11.prod.outlook.com
 (2603:10b6:208:f8::11)
MIME-Version: 1.0
Received: from SEL-LT-028891.maxim-ic.internal (39.117.232.232) by
 SL2P216CA0123.KORP216.PROD.OUTLOOK.COM (2603:1096:101::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 15:52:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8ca177a-5fc5-425e-fb92-08d98e616f21
X-MS-TrafficTypeDiagnostic: MN2PR11MB3694:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR11MB369474A0ECB9D1B7F4FF7F2FF4B79@MN2PR11MB3694.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:16;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q1sZMyIMPom7hpI4m51LV5cachZykhzyn57ayNDj2RhW6f2X2aGICfhSXUv9sHo1XNkz025zpHDV55Wn+GOBDrs/mgrhMFKFTjOs3S8ppjDOllyNG6WlmdvZFz4IqQ7cUx6M+rZP5tC9BlbpCqNL3+7J0crylt6yVIPbhpYcrO7h3ABueIQbr3/+21uASbQSyk2nAmz0WyOgAXAPXIjGsp9oldMsgpl4vxZw/4ZLSBntYhLuvMin8rqb0kN1kfn7oogNOiCBJdQ7R16u0Qw7yowNQMTN/HEwd1oZYYeiWTza/QOaD4y72SXCMl9ygqQNKALT7nGYjXYhVFqpbe5BoYTeejweUvMFmi/nSFJsPozg2fpBsY2X4ZDD2Z4tUFzWyDd9bteylHJxBtmF/Wl6Nokv50skv831VlpkgeANzs5maz1Z0yV2ayj3ced0xMqoAVty+kboOy5CsBUUSsnsLSyOMNdxW1hA0ToNSbaLzI0IlLhEDKnLtPA4yFdCplBR5wdut/gnCL6i2Y2oyg20ynd/aDMA0TNq9xADEj71O3WldxWQMTo5VpNQKS1UxW8P0ikQbBluPRdVH6WybX3Z738vD5ap16yf2i77oM0KCUA0NmZhxsoOs6Q9VQp5nG5MDA6da+GHDVb3d3MxfDIN0uUSQWQaSOKEo4Yj5VmjQVrY6XLZKMvL+eYqutM7TJKQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB3678.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(30864003)(86362001)(38100700002)(4326008)(107886003)(508600001)(44832011)(6486002)(316002)(1076003)(2906002)(6506007)(6512007)(8936002)(66946007)(66556008)(6666004)(5660300002)(66476007)(186003)(83380400001)(8676002)(36756003)(52116002)(2616005)(26005)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l/+3ybL6mUzdpoB3BdbVHp4RTuZTGfDx7ok18GTOsHYWvQ6q3a3LqSRz9evD?=
 =?us-ascii?Q?WqFpLPaFS9JRGUehxK2l2tPwFLqlXr3ebD5vk7JYjlv7F41z62jx2K4fo/FS?=
 =?us-ascii?Q?NnQekUrFWYnFdT/Lb9nSyjuiT25FZfSaXmryBkeXq7sPWgUd8oxz9BETkFF0?=
 =?us-ascii?Q?waYJRkCsq1D+ceT8dKcviE7AwBTrQZsWSAfbLcnVbaIxDQws4+JRWDu/uxeH?=
 =?us-ascii?Q?DIxp5vqrHaC/ZbJGCgIqGOeuZNpcq7pOTkKxuCCmBfmP3gkEh4IJ5KKGScv8?=
 =?us-ascii?Q?7zHXvSH7cZhtLch96vIeg4yZaVIOby9o83BixhOnFf1C1G30QQcxBu6TBM8M?=
 =?us-ascii?Q?vpmgi/Yh6dJ7u+IG0zmQXEfWuGGWbj5EcheVNzFX7AXgvCwGEhvE3J/2uY0e?=
 =?us-ascii?Q?36n9styShdVh8VkB1RrUU5A2Yu/ZIkg5rDGh9/JW10jRbETx/6AKveU9GGV0?=
 =?us-ascii?Q?2sG5inIX2PyhHjqSHxkx+I4W8PpgfQsR8TZBPEEIrkSP8jDMm/moDRrV8IzQ?=
 =?us-ascii?Q?ToRp6MYMBydTbrsFzl5ckBZ1Trw3hGGg7lPA6xq5aeTpeA9CE+C5/RiS9cSe?=
 =?us-ascii?Q?vciKRzzOT6U463lJWITDHg5trFsqo5NEr3XeoFSf8VopkgLg0e1ERAqTYtKl?=
 =?us-ascii?Q?qRTrKk4lFQKcrOFG6uFnVfIGgVgqaeZi26DVyE9M3HSTEMHkurvHrbQ3nQsf?=
 =?us-ascii?Q?JY7ZuNZ0tAWditpe44cZA1sbQJsRA6z+OBUnWMnPjjrk6voRQIwP61BKGts2?=
 =?us-ascii?Q?os2Q4smfraXZXQXBbKYBGYYtRRC8X6lZquM/9ERQs1jvA8KWrhF2tzJP8+U2?=
 =?us-ascii?Q?5fr4PCfrUYwk17+HIQN0eV+TgSHwL8vRaMllfWvqqe+cAitm2XkWZe019dOl?=
 =?us-ascii?Q?VLC5v6HkQyhNR8YTIPw8xdnpSBBLS9DZfNifc6c3haSm8Zox7cPlCAw9LtRE?=
 =?us-ascii?Q?fSOq9qJ9s31XVAWGxaUe2XxlzutJEFJDMhcEdJnKp+7tEo/rbfZdsMyfTxOn?=
 =?us-ascii?Q?GR+2tGOuEkzWaIY+u9qTDtqfULTEqI+9dBHIDXUeSvf+UttMSF53YGX3f6Fz?=
 =?us-ascii?Q?vomx2KNT3wRSzVC0uAKUsYBO6+OSEokJVzykhAy7GSikET07ZKBMGbWx75xi?=
 =?us-ascii?Q?z8HNK/AjWwJNPPPxpwKehOel8TNSYQvK/c9XH43rcloOBCuqqd8XAObxVezG?=
 =?us-ascii?Q?48aW0ieLxYkryvTfqrVRqEgBZAMIhU+VFZV/u3qnrZDa+TdEgwX+SeWWQeLK?=
 =?us-ascii?Q?UOsH/MjCIJN+DAx703aSfZVpcZM4z49lGOKyf607vJsoWOtHRdj30KPDgg2E?=
 =?us-ascii?Q?xPo6zu5LtTbHvRolJyLciz1m?=
X-OriginatorOrg: maximintegrated.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ca177a-5fc5-425e-fb92-08d98e616f21
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3678.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 15:52:18.1333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd909df-ea69-4788-a554-f24b7854ad03
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3btgkwgPeoX8mJowhVZiDYAiNtMgWsO9ttvyjaOadVBdIABL87fx+f+KZD1whJqTDxQmgJFKbALQI7CAux+9P6D+c40inzGjjzsd8eKRspc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3694
X-Mailman-Approved-At: Thu, 14 Oct 2021 15:47:06 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 steves.lee@maximintegrated.com, ryans.lee@maximintegrated.com,
 george.song@analog.com, linux-kernel@vger.kernel.org
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

From: George Song <george.song@analog.com>

Add max98520 audio amplifier driver

Signed-off-by: George Song <george.song@analog.com>
---
 sound/soc/codecs/Kconfig    |   5 +
 sound/soc/codecs/Makefile   |   2 +
 sound/soc/codecs/max98520.c | 777 ++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/max98520.h | 159 ++++++++
 4 files changed, 943 insertions(+)
 create mode 100644 sound/soc/codecs/max98520.c
 create mode 100644 sound/soc/codecs/max98520.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 82ee233a269d..86b121d2f381 100644
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
@@ -922,6 +923,10 @@ config SND_SOC_MAX98927
 	tristate "Maxim Integrated MAX98927 Speaker Amplifier"
 	depends on I2C
 
+config SND_SOC_MAX98520
+	tristate "Maxim Integrated MAX98520 Speaker Amplifier"
+	depends on I2C
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
index 000000000000..1a5e0ceae362
--- /dev/null
+++ b/sound/soc/codecs/max98520.c
@@ -0,0 +1,777 @@
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
+						MAX98520_R2041_PCM_CLK_SETUP,
+						MAX98520_PCM_MODE_CFG_PCM_BCLKEDGE,
+						invert);
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
+						MAX98520_R2040_PCM_MODE_CFG,
+						MAX98520_PCM_MODE_CFG_FORMAT_MASK,
+						format << MAX98520_PCM_MODE_CFG_FORMAT_SHIFT);
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
+	struct snd_pcm_hw_params *params)
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
+							MAX98520_R2041_PCM_CLK_SETUP,
+							MAX98520_PCM_CLK_SETUP_BSEL_MASK,
+							value);
+	}
+	dev_dbg(component->dev, "%s tdm_mode:%d out\n", __func__, max98520->tdm_mode);
+	return 0;
+}
+
+static int max98520_dai_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params,
+	struct snd_soc_dai *dai)
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
+						MAX98520_R2040_PCM_MODE_CFG,
+						MAX98520_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
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
+						MAX98520_R2042_PCM_SR_SETUP,
+						MAX98520_PCM_SR_MASK,
+						sampling_rate);
+
+	return max98520_set_clock(component, params);
+err:
+	dev_dbg(component->dev, "%s out error", __func__);
+	return -EINVAL;
+}
+
+static int max98520_dai_tdm_slot(struct snd_soc_dai *dai,
+	unsigned int tx_mask, unsigned int rx_mask,
+	int slots, int slot_width)
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
+						MAX98520_R2041_PCM_CLK_SETUP,
+						MAX98520_PCM_CLK_SETUP_BSEL_MASK,
+						bsel);
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
+						MAX98520_R2040_PCM_MODE_CFG,
+						MAX98520_PCM_MODE_CFG_CHANSZ_MASK, chan_sz);
+
+	/* Rx slot configuration */
+	regmap_update_bits(max98520->regmap,
+						MAX98520_R2044_PCM_RX_SRC2,
+						MAX98520_PCM_DMIX_CH0_SRC_MASK,
+						rx_mask);
+	regmap_update_bits(max98520->regmap,
+						MAX98520_R2044_PCM_RX_SRC2,
+						MAX98520_PCM_DMIX_CH1_SRC_MASK,
+						rx_mask << MAX98520_PCM_DMIX_CH1_SHIFT);
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
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct max98520_priv *max98520 =
+		snd_soc_component_get_drvdata(component);
+
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
+		0, 3, max98520_switch_text);
+
+static const struct snd_kcontrol_new max98520_dai_controls =
+	SOC_DAPM_ENUM("DAI Sel", dai_sel_enum);
+
+static const struct snd_soc_dapm_widget max98520_dapm_widgets[] = {
+	SND_SOC_DAPM_DAC_E("Amp Enable", "HiFi Playback",
+	MAX98520_R209F_AMP_EN, 0, 0, max98520_dac_event,
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
+	0, 0x7F, 1, max98520_digital_tlv),
+SOC_SINGLE_TLV("Speaker Volume", MAX98520_R2091_AMP_PATH_GAIN,
+	0, 0x5, 0, max98520_spk_tlv),
+/* Volume Ramp Up/Down Enable*/
+SOC_SINGLE("Ramp Up Switch", MAX98520_R2092_AMP_DSP_CFG,
+	MAX98520_DSP_SPK_VOL_RMPUP_SHIFT, 1, 0),
+SOC_SINGLE("Ramp Down Switch", MAX98520_R2092_AMP_DSP_CFG,
+	MAX98520_DSP_SPK_VOL_RMPDN_SHIFT, 1, 0),
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
+	MAX98520_DHT_LIMITER_MODE_SHIFT, 1, 0),
+SOC_SINGLE("DHT Hysteresis Switch", MAX98520_R20D6_DHT_HYSTERESIS_CFG,
+	MAX98520_DHT_HYSTERESIS_SWITCH_SHIFT, 1, 0),
+SOC_SINGLE_TLV("DHT Rot Pnt", MAX98520_R20D0_DHT_CFG1,
+	MAX98520_DHT_VROT_PNT_SHIFT, 10, 1, max98520_dht_rotation_point_tlv),
+SOC_SINGLE_TLV("DHT Supply Headroom", MAX98520_R20D1_LIMITER_CFG1,
+	MAX98520_DHT_SUPPLY_HR_SHIFT, 16, 0, max98520_dht_supply_hr_tlv),
+SOC_SINGLE_TLV("DHT Limiter Threshold", MAX98520_R20D2_LIMITER_CFG2,
+	MAX98520_DHT_LIMITER_THRESHOLD_SHIFT, 0xF, 1, max98520_dht_lim_thresh_tlv),
+SOC_SINGLE_TLV("DHT Max Attenuation", MAX98520_R20D3_DHT_CFG2,
+	MAX98520_DHT_MAX_ATTEN_SHIFT, 20, 1, max98520_dht_max_atten_tlv),
+SOC_SINGLE_TLV("DHT Hysteresis", MAX98520_R20D6_DHT_HYSTERESIS_CFG,
+	MAX98520_DHT_HYSTERESIS_SHIFT, 0x7, 0, max98520_dht_hysteresis_tlv),
+SOC_ENUM("DHT Attack Rate", max98520_dht_attack_rate_enum),
+SOC_ENUM("DHT Release Rate", max98520_dht_release_rate_enum),
+/* ADC configuration */
+SOC_SINGLE("ADC PVDD CH Switch", MAX98520_R20CF_MEAS_ADC_CFG, 0, 1, 0),
+SOC_SINGLE("ADC PVDD FLT Switch", MAX98520_R20B2_ADC_PVDD0_CFG,
+	MAX98520_FLT_EN_SHIFT, 1, 0),
+SOC_SINGLE("ADC TEMP FLT Switch", MAX98520_R20B3_ADC_THERMAL_CFG,
+	MAX98520_FLT_EN_SHIFT, 1, 0),
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
+						MAX98520_R2092_AMP_DSP_CFG, MAX98520_SPK_SAFE_EN_MASK, 0);
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
+						MAX98520_R204F_PCM_RX_EN,
+						MAX98520_PCM_RX_EN_MASK, 1);
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
+static int max98520_i2c_probe(struct i2c_client *i2c,
+	const struct i2c_device_id *id)
+{
+
+	int ret = 0;
+	int reg = 0;
+	struct max98520_priv *max98520 = NULL;
+	struct i2c_adapter *adapter = to_i2c_adapter(i2c->dev.parent);
+
+	ret = i2c_check_functionality(adapter,
+		I2C_FUNC_SMBUS_BYTE
+		| I2C_FUNC_SMBUS_BYTE_DATA);
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
+	max98520->regmap
+		= devm_regmap_init_i2c(i2c, &max98520_regmap);
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
+	ret = regmap_read(max98520->regmap,
+		MAX98520_R21FF_REVISION_ID, &reg);
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
+MODULE_AUTHOR("Ryan Lee <ryans.lee@analog.com>");
+MODULE_AUTHOR("George Song <george.song@analog.com>");
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

