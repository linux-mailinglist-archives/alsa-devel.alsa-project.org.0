Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7947C8AF75C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 21:30:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0425F1060;
	Tue, 23 Apr 2024 21:30:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0425F1060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713900646;
	bh=9Dko9UMNHpwftPyahCFC5ntRrUoyi7fWa6mUo/8JOI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UlqQ8P3mosfQXdy5DLiD0HmwL/Urq1kMwSUl9bG4eHdWBlVa8DHwMsor6UbtrZnL0
	 KkRYh/r0Dm9ooQ0rXqj/8eJFNMA/Nz2xRlWTcLBHvJg7msOwEl74HKNg3tYVzwLNed
	 L5m9vBbhJ/OaJhM25aZucjbwDr3uSonsc/meEUA4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 237F4F8067C; Tue, 23 Apr 2024 21:29:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69F5DF805C4;
	Tue, 23 Apr 2024 21:29:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39033F8045D; Tue, 23 Apr 2024 10:34:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on20705.outbound.protection.partner.outlook.cn
 [IPv6:2406:e500:4440:2::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF8E5F802E8
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 10:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF8E5F802E8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6x+NQogBB9vBPGVkpfMyYeev0mlMQpa4rgJdJSPqNea7IC2I1Vp12B4czfin8qV/1AzH+POpHMw06gE5ndc5VUtpXwJ/Y8ywSiwAij7C7VsKxb6yAT2TWCwtznAIpO18JLjBCjqJveYC80VKaSoOVYKkrcEwcCwUY/RLOLZno2M2So6K3glCmrCC4zhBb2LPHBN2QbuRJX2fEmXrjoGTwI89BV8mlk1RSxbK7GbB2qV8hWurj9DITahtDQkdr15tNV+sdOCnF9ygtGOr5263DzHUU0VtewRmUxAzy315FIu/Eh11jY8LnJOUIi76qyT4+JrNHHD1+t0MgFHqHs9Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEpg0o4aY4eKXOkClvwZMGtSxULcS3pPR9Nh5T2+4UE=;
 b=DTwOhN9A1XW0qGB79PDwZznFVyN6Xn8pK3ZhsidaRgyDZQqX4JftwY7RvN29Je/z2XStsCqe6SyUG882lRBAtyWI4J1hwgnwU5ZdQj7xbAEmBqesISs6w5RE7NfZE8Xv0kAsFnr1pCwZh/xKRxZuvY4kOJxid69GC5T/+eI7XTFjJUiG6LMsf6wC5HWURliTkJM+6+N5nNQgDKUiwhYADj9oGTpsOArKFOVFPObejtHFNv1rLLc88qMq9FtOpBjt4e0AQ48pW+MkHVJLylS6xwNO4OCGruSJ7nt/LG6uzUg2JvtcJNPBzs3BGDIRJWW9ZwGbNeAVln5ACcDKpc8rUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1002.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33; Tue, 23 Apr
 2024 08:34:18 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::e903:99a6:10b7:304d]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::e903:99a6:10b7:304d%6])
 with mapi id 15.20.7472.044; Tue, 23 Apr 2024 08:34:18 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Walker Chen <walker.chen@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: starfive: Add PDM controller support
Date: Tue, 23 Apr 2024 16:34:05 +0800
Message-Id: <20240423083405.263912-3-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240423083405.263912-1-xingyu.wu@starfivetech.com>
References: <20240423083405.263912-1-xingyu.wu@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0022.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::31) To NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB0956:EE_|NTZPR01MB1002:EE_
X-MS-Office365-Filtering-Correlation-Id: be690d44-e894-4a64-59e6-08dc63702ac8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YhLnT+7BcoYBq+KxXX+K9HToLschMd4zdSZCYm9h5C40qMtlqBwuUvOEpFdXDupJqAFV2kAdmOpyWhoB14OnHuOQLwA+1IOBtX9kRawtYYI5537KLVMy2kD8ZU72W0tLxcbDg4FIpJJbYvZ7tpvKigTaZ0awIm1xUTl1CMO2TzA+vXPhzFOLRrG07xLSGoNO9zm42EFHLyPru6vFK5FuqqW393ne9QDz/VL2AyHRYrqVhqPx7Z9U1oWwPAer88MyI+E0wBo/q8XBDw20eA1vuUrXsSl5xPa8Vsfs0GdBSjUDT3+7MpVvRk6UPi1/KfOG8MboHAoTILmM88Kf547rUKMn9njfgq1JPwTzX/to7pjMUvqVauwviWeIySEuwzJ0WrEONcb/Cq4IwjqvJ25BHj3FhaQSBknCzIJxV/XE7f4ibaNlE56iDh74KYgAa/yr8Qr4ojoIM2OELhy1uMsx/75lMYKKWsYH7q2liVuk7xdAW0UxYRP7RalduGmUxY9m9omqC7aD0LVQw7pZtphy3FsNOQIWMVg8qFdd0hrj+iORjLGVo8hLHMPLzoqVCvZ0/Ru30wFl4gGqcakAElolemq2P9tfPnj8fUqjJzKr0apztwpnCZEjvswk5vnFriCs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(41320700004)(52116005)(366007)(1800799015)(7416005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZgeDQG8goQP7fbJD8xJjPEqjey50pGvDdDkf5wRnpYu/ROgwLqxx+kBswEBW?=
 =?us-ascii?Q?EObfnh2Tffh7hHTBXiGVhodkNB0okBLt4JZNZ2OuNLzeYQVf29Joyzj/snFR?=
 =?us-ascii?Q?kPHMsacFHqJQz0wcHVQwFhf4GRGVov9ezx9WIK7ek4vcC9Km13Y6qHTV1m/L?=
 =?us-ascii?Q?GMF0gXUIHTFdLsTqM5o8+34GRZEP+VHkR4PaFggHuRIkiJyFO2xoTJHeXkdC?=
 =?us-ascii?Q?S/9VDmmbyKB+VCjthuTQIRi2sKKUPwXclhNnnYqpDQkHH1Q9ISShXyHPyGVf?=
 =?us-ascii?Q?zKF+a2Uodvfk7c3/a+rCJ+YDZ87s+7nQ0P5+hMYzvRcE0jz8u25V6IgCESSZ?=
 =?us-ascii?Q?A6VR/X6Dp/4Lr8+oX+yabCSkaqtPZyiNMRbMIofujrPRpSHBRJRIOGWO3at1?=
 =?us-ascii?Q?QaAtuN1h//1YW4AQX1djccfr0GZhK+PbbYXHrEXHEs4ZZV8TdoIrzcZ+PaaK?=
 =?us-ascii?Q?aZDfGWW/jwnlZi2H3/330xpNj+VbWpLsgtZ3VZx7Af2SJUXzQ/go8/VsbudK?=
 =?us-ascii?Q?iq6hELyxIMy7YHTcuwWplQg0LvyFPvSwPCJ+rz8MjOM8J/jzsZG82lBpEpCf?=
 =?us-ascii?Q?VnvilGA9YPLHqTefdw0CkFxoD9Rp95Xr/C1MFOcNKClvIWNmQWEcz/5ivBnN?=
 =?us-ascii?Q?N8pYql4YqY2WdAGR79rAoGhLHlDJCunRlWTsjWzwwmzjK29R4a7KMFqK79ou?=
 =?us-ascii?Q?DySXlf3t5VjbbIWYoohlCrKxBljnfqfYhiwUDMEK/IvZ1NkRZu+181SJ4WIB?=
 =?us-ascii?Q?iTTsEjBmftGZAZE+tYtJe1DZgOLhNsaQONQUcuTcKmdOP9V5PLO09/ZnW5CG?=
 =?us-ascii?Q?dnEHJgQQa8Pmtlpp0e8m4PKMliV2ThGvXlncEbI2+o/dn1PqyEALjlOniYY0?=
 =?us-ascii?Q?V+Gep83wim1kKXwbJfrIaBb1Wrp1vGomKycT3DOhwRafGns3ZXrO3UKVSXka?=
 =?us-ascii?Q?0vlB+PJ+6rDhK+sSQFKBpr7XJYG5RUUUyyz2BNs0h5qmi9EwG6ofF6y1MKUh?=
 =?us-ascii?Q?zaYanKFv3nRO7V08O63KQBNp4Qp7GHQDeR9oj0WarLYV5NbYcHarfjkO0+PC?=
 =?us-ascii?Q?1xrmudC4Bn70243+sPeAh7CA/tigU2D8NGi9Rd40eJbUK98wI32P0OlBSNEC?=
 =?us-ascii?Q?M0QrUB33vSgeL773MJRDfu2Z6Xl/M43xXiwP7B/LdG1DxrA03gIfYD/jMjaF?=
 =?us-ascii?Q?fSXO7zYahCwGJKf+Dm00aZlfoUXBurhg2X6zahoY6D5r51D5JDzvJNcyT2Ph?=
 =?us-ascii?Q?jA6We1t1A5y4r7kSPvkoivDFxBvInfUmABfX9De20NiP8euyPLh3UcUQQXKm?=
 =?us-ascii?Q?5V5Z5e4BK3DVyfhFd3Ds/8MBqD4iqro252hER06eKhlieSOt+HrdvHoJHkmy?=
 =?us-ascii?Q?gFvnBvEUaiRUvwXLbbraF1FsqEbFNBdoOddY6C1auQXCL6F4rLVEM0lhJMDD?=
 =?us-ascii?Q?KdNovEH1juI8yoC7GZn0/p3F8pfZemYjrPc0l27gg6m4V9hnZXuIQXaRcdK0?=
 =?us-ascii?Q?zfoDnlp25g+ktbFnPQLn/rtHTUIEI0qI7HJm1wk6ds/5FE34t0PpoawPaFZg?=
 =?us-ascii?Q?oAjFie5Iu+B5kRpzq5twpq+3rhgnCNz4WO9l4j+umcuQ9hOWYY7vbBKUjrVO?=
 =?us-ascii?Q?Ew=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 be690d44-e894-4a64-59e6-08dc63702ac8
X-MS-Exchange-CrossTenant-AuthSource: 
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 08:34:18.6214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 leva2SG7Ehna8eS0yfpSRn1/jN8ObtwNC7OPJAfPToSNu9HKy/PPFHqaRQh+HIApruE/iDnqDM6RJAymLXkuvT5qSmZiz62cdaGTuPTkrk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1002
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PVNMM4JYT2YV432D5JMTUEW27YMFZZEW
X-Message-ID-Hash: PVNMM4JYT2YV432D5JMTUEW27YMFZZEW
X-Mailman-Approved-At: Tue, 23 Apr 2024 19:29:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PVNMM4JYT2YV432D5JMTUEW27YMFZZEW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the driver of PDM controller for the StarFive JH8100 SoC.

The Pulse Density Modulation (PDM) controller is a digital PDM
microphone interface controller and decoder that supports up to
4 channels. The PDM have two blocks and each block controls
stereo audio data which is transferred to a Inter-IC Sound (I2S)
recorder on the JH8100 SoC.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 MAINTAINERS                     |   7 +
 sound/soc/starfive/Kconfig      |   7 +
 sound/soc/starfive/Makefile     |   1 +
 sound/soc/starfive/jh8100_pdm.c | 447 ++++++++++++++++++++++++++++++++
 4 files changed, 462 insertions(+)
 create mode 100644 sound/soc/starfive/jh8100_pdm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c23fda1aa1f0..cf6e26ce16e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21079,6 +21079,13 @@ F:	Documentation/devicetree/bindings/power/starfive*
 F:	drivers/pmdomain/starfive/
 F:	include/dt-bindings/power/starfive,jh7110-pmu.h
 
+STARFIVE JH8100 PDM DRIVER
+M:	Xingyu Wu <xingyu.wu@starfivetech.com>
+M:	Walker Chen <walker.chen@starfivetech.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/starfive,jh8100-pdm.yaml
+F:	sound/soc/starfive/jh8100_pdm.c
+
 STARFIVE SOC DRIVERS
 M:	Conor Dooley <conor@kernel.org>
 S:	Maintained
diff --git a/sound/soc/starfive/Kconfig b/sound/soc/starfive/Kconfig
index 279ac5c1d309..f6b03ab0dd98 100644
--- a/sound/soc/starfive/Kconfig
+++ b/sound/soc/starfive/Kconfig
@@ -22,3 +22,10 @@ config SND_SOC_JH7110_TDM
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for StarFive TDM driver.
+
+config SND_SOC_JH8100_PDM
+	tristate "JH8100 PDM controller device driver"
+	depends on HAVE_CLK && SND_SOC_STARFIVE
+	select REGMAP_MMIO
+	help
+	  Say Y or M if you want to add support for StarFive PDM driver.
diff --git a/sound/soc/starfive/Makefile b/sound/soc/starfive/Makefile
index 9e958f70ef51..b672425830d9 100644
--- a/sound/soc/starfive/Makefile
+++ b/sound/soc/starfive/Makefile
@@ -1,3 +1,4 @@
 # StarFive Platform Support
 obj-$(CONFIG_SND_SOC_JH7110_PWMDAC) += jh7110_pwmdac.o
 obj-$(CONFIG_SND_SOC_JH7110_TDM) += jh7110_tdm.o
+obj-$(CONFIG_SND_SOC_JH8100_PDM) += jh8100_pdm.o
diff --git a/sound/soc/starfive/jh8100_pdm.c b/sound/soc/starfive/jh8100_pdm.c
new file mode 100644
index 000000000000..74b5f22622cc
--- /dev/null
+++ b/sound/soc/starfive/jh8100_pdm.c
@@ -0,0 +1,447 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PDM driver for the StarFive JH8100 SoC
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ */
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/tlv.h>
+
+/* PDM RES: BLOCK 0 */
+#define JH8100_PDM_DMIC_CTRL0			0x00
+#define JH8100_PDM_DC_SCALE0			0x04
+/* BLOCK 1 */
+#define JH8100_PDM_DMIC_CTRL1			0x10
+#define JH8100_PDM_DC_SCALE1			0x14
+
+#define JH8100_PDM_BLOCKX_SHIFT			0x10
+#define JH8100_PDM_GET_CTRLX(x)			(JH8100_PDM_DMIC_CTRL0 + \
+						 (x) * JH8100_PDM_BLOCKX_SHIFT)
+#define JH8100_PDM_GET_SCALEX(x)		(JH8100_PDM_DC_SCALE0 + \
+						 (x) * JH8100_PDM_BLOCKX_SHIFT)
+
+/* PDM CTRL0/1 OFFSET */
+#define JH8100_PDM_DMIC_MSB_MASK		GENMASK(3, 1)
+#define JH8100_PDM_DMIC_VOL_MASK		GENMASK(21, 16)
+#define JH8100_PDM_VOL_DB_MUTE			GENMASK(21, 16)
+#define JH8100_PDM_VOL_DB_MAX			0
+
+#define JH8100_PDM_DMIC_RSWITCH_MASK		BIT(22)
+#define JH8100_PDM_DMIC_LSWITCH_MASK		BIT(23)
+#define JH8100_PDM_DMIC_I2S_SLAVE		BIT(24)
+#define JH8100_PDM_DMIC_HPF_EN			BIT(28)
+#define JH8100_PDM_DMIC_FASTMODE_MASK		BIT(29)
+#define JH8100_PDM_SW_RST_MASK			BIT(31)
+#define JH8100_PDM_SW_RST_RELEASE		BIT(31)
+
+/* PDM SCALE0/1 OFFSET */
+#define JH8100_DMIC_DCOFF_MASK			GENMASK(27, 8)
+#define JH8100_DMIC_DCOFF_DEF_VAL		0xc0005
+#define JH8100_DMIC_SCALE_MASK			GENMASK(5, 0)
+#define JH8100_DMIC_SCALE_DEF_VAL		0x8
+
+enum jh8100_pdm_blockx {
+	JH8100_PDM_BLK0 = 0,
+	JH8100_PDM_BLK1 = 1,
+};
+
+struct jh8100_pdm_priv {
+	struct regmap *regmap;
+	struct regmap *syscon_regmap;
+	struct device *dev;
+	struct clk *dmic_clk;
+	struct clk *icg_clk;
+	struct reset_control *rst;
+	unsigned int syscon_args[2]; /* [0]: offset, [1]: mask */
+};
+
+static const DECLARE_TLV_DB_SCALE(volume_tlv, -9450, 150, 0);
+
+static const struct snd_kcontrol_new jh8100_pdm_snd_controls[] = {
+	SOC_DOUBLE_R("DC compensation Switch", JH8100_PDM_DMIC_CTRL0,
+		     JH8100_PDM_DMIC_CTRL1, 30, 1, 0),
+	SOC_DOUBLE_R("High Pass Filter Switch", JH8100_PDM_DMIC_CTRL0,
+		     JH8100_PDM_DMIC_CTRL1, 28, 1, 0),
+	SOC_DOUBLE_R_TLV("Volume", JH8100_PDM_DMIC_CTRL0,
+			 JH8100_PDM_DMIC_CTRL1, 16, 0x3F, 1, volume_tlv),
+	SOC_DOUBLE_R("Data MSB Shift Route", JH8100_PDM_DMIC_CTRL0,
+		     JH8100_PDM_DMIC_CTRL1, 1, 7, 0),
+	SOC_DOUBLE_R("SCALE Route", JH8100_PDM_DC_SCALE0,
+		     JH8100_PDM_DC_SCALE1, 0, 0x3F, 0),
+	SOC_DOUBLE_R("DC offset Route", JH8100_PDM_DC_SCALE0,
+		     JH8100_PDM_DC_SCALE1, 8, 0xFFFFF, 0),
+};
+
+/* Left (and Right) Channel Swicth Enable */
+static void jh8100_pdm_enable_lr(struct regmap *map, u8 block,
+				 bool right)
+{
+	u16 res = JH8100_PDM_GET_CTRLX(block);
+
+	regmap_update_bits(map, res, JH8100_PDM_DMIC_RSWITCH_MASK, 0);
+
+	if (right)
+		regmap_update_bits(map, res, JH8100_PDM_DMIC_LSWITCH_MASK, 0);
+}
+
+/* Left and Right Channel Swicth Disable */
+static void jh8100_pdm_disable(struct regmap *map, u8 block)
+{
+	u16 res = JH8100_PDM_GET_CTRLX(block);
+
+	regmap_update_bits(map, res,
+			   JH8100_PDM_DMIC_RSWITCH_MASK | JH8100_PDM_DMIC_LSWITCH_MASK,
+			   JH8100_PDM_DMIC_RSWITCH_MASK | JH8100_PDM_DMIC_LSWITCH_MASK);
+}
+
+static void jh8100_pdm_disable_all(struct regmap *map)
+{
+	jh8100_pdm_disable(map, JH8100_PDM_BLK0);
+	jh8100_pdm_disable(map, JH8100_PDM_BLK1);
+}
+
+static int jh8100_pdm_dai_probe(struct snd_soc_dai *dai)
+{
+	struct jh8100_pdm_priv *priv = snd_soc_dai_get_drvdata(dai);
+
+	/* Change I2SDIN source to PDM */
+	regmap_update_bits(priv->syscon_regmap, priv->syscon_args[0],
+			   priv->syscon_args[1], priv->syscon_args[1]);
+
+	return 0;
+}
+
+static int jh8100_pdm_trigger(struct snd_pcm_substream *substream, int cmd,
+			      struct snd_soc_dai *dai)
+{
+	struct jh8100_pdm_priv *priv = snd_soc_dai_get_drvdata(dai);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		return 0;
+
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		jh8100_pdm_disable_all(priv->regmap);
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+}
+
+static int jh8100_pdm_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct jh8100_pdm_priv *priv = snd_soc_dai_get_drvdata(dai);
+
+	/*
+	 * 1 channel: block 0 left channel on,
+	 * 2 channels: block 0 left/right on,
+	 * 3 channels: block 0 left/right on, block 1 left on,
+	 * 4 channels: block 0 and 1 all on.
+	 */
+	switch (params_channels(params)) {
+	case 1:
+		jh8100_pdm_enable_lr(priv->regmap, JH8100_PDM_BLK0, false);
+		break;
+	case 2:
+		jh8100_pdm_enable_lr(priv->regmap, JH8100_PDM_BLK0, true);
+		break;
+	case 3:
+		jh8100_pdm_enable_lr(priv->regmap, JH8100_PDM_BLK0, true);
+		jh8100_pdm_enable_lr(priv->regmap, JH8100_PDM_BLK1, false);
+		break;
+	case 4:
+		jh8100_pdm_enable_lr(priv->regmap, JH8100_PDM_BLK0, true);
+		jh8100_pdm_enable_lr(priv->regmap, JH8100_PDM_BLK1, true);
+		break;
+
+	default:
+		dev_err(priv->dev, "channels are not supported\n");
+		return -EINVAL;
+	}
+
+	/* set pdm_mclk,  PDM MCLK = 128 * LRCLK */
+	return clk_set_rate(priv->dmic_clk, 128 * params_rate(params));
+}
+
+static const struct snd_soc_dai_ops jh8100_pdm_dai_ops = {
+	.probe		= jh8100_pdm_dai_probe,
+	.trigger	= jh8100_pdm_trigger,
+	.hw_params	= jh8100_pdm_hw_params,
+};
+
+static void jh8100_pdm_block_init(struct jh8100_pdm_priv *priv, u8 block)
+{
+	u16 ctrl = JH8100_PDM_GET_CTRLX(block);
+	u16 scale = JH8100_PDM_GET_SCALEX(block);
+
+	/* Reset */
+	regmap_update_bits(priv->regmap, ctrl,
+			   JH8100_PDM_SW_RST_MASK, 0);
+	regmap_update_bits(priv->regmap, ctrl,
+			   JH8100_PDM_SW_RST_MASK, JH8100_PDM_SW_RST_RELEASE);
+
+	/* Make sure the device is initially disabled */
+	jh8100_pdm_disable(priv->regmap, block);
+
+	/* MUTE */
+	regmap_update_bits(priv->regmap, ctrl,
+			   JH8100_PDM_DMIC_VOL_MASK, JH8100_PDM_VOL_DB_MUTE);
+
+	/* UNMUTE */
+	regmap_update_bits(priv->regmap, ctrl,
+			   JH8100_PDM_DMIC_VOL_MASK, JH8100_PDM_VOL_DB_MAX);
+
+	/* enable high pass filter */
+	regmap_update_bits(priv->regmap, ctrl,
+			   JH8100_PDM_DMIC_HPF_EN, JH8100_PDM_DMIC_HPF_EN);
+
+	/* PDM work as slave mode */
+	regmap_update_bits(priv->regmap, ctrl,
+			   JH8100_PDM_DMIC_I2S_SLAVE, JH8100_PDM_DMIC_I2S_SLAVE);
+
+	/* Enable fast mode */
+	regmap_update_bits(priv->regmap, ctrl,
+			   JH8100_PDM_DMIC_FASTMODE_MASK,
+			   JH8100_PDM_DMIC_FASTMODE_MASK);
+
+	/* Default dmic msb shift 0 */
+	regmap_update_bits(priv->regmap, ctrl,
+			   JH8100_PDM_DMIC_MSB_MASK, 0);
+
+	/* Default scale: 0x8 */
+	regmap_update_bits(priv->regmap, scale,
+			   JH8100_DMIC_SCALE_MASK, JH8100_DMIC_SCALE_DEF_VAL);
+
+	/* Default DC offset: 0xc005 */
+	regmap_update_bits(priv->regmap, scale,
+			   JH8100_DMIC_DCOFF_MASK,
+			   FIELD_PREP(JH8100_DMIC_DCOFF_MASK, JH8100_DMIC_DCOFF_DEF_VAL));
+}
+
+#define JH8100_PDM_RATES	(SNDRV_PCM_RATE_8000 | \
+				 SNDRV_PCM_RATE_11025 | \
+				 SNDRV_PCM_RATE_16000)
+
+#define JH8100_PDM_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
+				 SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver jh8100_pdm_dai_drv = {
+	.name = "PDM",
+	.id = 0,
+	.capture = {
+		.stream_name	= "Capture",
+		.channels_min	= 1,
+		.channels_max	= 4,
+		.rates		= JH8100_PDM_RATES,
+		.formats	= JH8100_PDM_FORMATS,
+	},
+	.ops = &jh8100_pdm_dai_ops,
+	.symmetric_rate = 1,
+};
+
+static int jh8100_pdm_component_probe(struct snd_soc_component *component)
+{
+	struct jh8100_pdm_priv *priv = snd_soc_component_get_drvdata(component);
+
+	snd_soc_component_init_regmap(component, priv->regmap);
+
+	return 0;
+}
+
+static int jh8100_pdm_crg_enable(struct jh8100_pdm_priv *priv)
+{
+	int ret;
+
+	ret = clk_prepare_enable(priv->icg_clk);
+	if (ret)
+		return dev_err_probe(priv->dev, ret, "failed to enable icg clock\n");
+
+	ret = reset_control_deassert(priv->rst);
+	if (ret) {
+		dev_err(priv->dev, "failed to deassert pdm_apb\n");
+		goto disable_icg;
+	}
+
+	return 0;
+
+disable_icg:
+	clk_disable_unprepare(priv->icg_clk);
+	return ret;
+}
+
+static int jh8100_pdm_crg_disable(struct jh8100_pdm_priv *priv)
+{
+	int ret = reset_control_assert(priv->rst);
+
+	if (ret)
+		return dev_err_probe(priv->dev, ret, "failed to assert pdm_apb\n");
+
+	clk_disable_unprepare(priv->icg_clk);
+	return 0;
+}
+
+static int __maybe_unused jh8100_pdm_runtime_suspend(struct device *dev)
+{
+	struct jh8100_pdm_priv *priv = dev_get_drvdata(dev);
+
+	return jh8100_pdm_crg_disable(priv);
+}
+
+static int __maybe_unused jh8100_pdm_runtime_resume(struct device *dev)
+{
+	struct jh8100_pdm_priv *priv = dev_get_drvdata(dev);
+
+	return jh8100_pdm_crg_enable(priv);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int jh8100_pdm_suspend(struct snd_soc_component *component)
+{
+	return pm_runtime_force_suspend(component->dev);
+}
+
+static int jh8100_pdm_resume(struct snd_soc_component *component)
+{
+	return pm_runtime_force_resume(component->dev);
+}
+#else
+#define jh8100_pdm_suspend	NULL
+#define jh8100_pdm_resume	NULL
+#endif
+
+static const struct snd_soc_component_driver jh8100_pdm_component_drv = {
+	.name = "jh8100-pdm",
+	.probe = jh8100_pdm_component_probe,
+	.suspend = jh8100_pdm_suspend,
+	.resume = jh8100_pdm_resume,
+	.controls = jh8100_pdm_snd_controls,
+	.num_controls = ARRAY_SIZE(jh8100_pdm_snd_controls),
+};
+
+static const struct regmap_config jh8100_pdm_regmap_cfg = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.max_register	= 0x20,
+};
+
+static int jh8100_pdm_crg_init(struct jh8100_pdm_priv *priv)
+{
+	priv->dmic_clk = devm_clk_get(priv->dev, "dmic");
+	if (IS_ERR(priv->dmic_clk))
+		return dev_err_probe(priv->dev, PTR_ERR(priv->dmic_clk),
+				     "failed to get dmic clock.\n");
+
+	priv->icg_clk = devm_clk_get(priv->dev, "icg");
+	if (IS_ERR(priv->icg_clk))
+		return dev_err_probe(priv->dev, PTR_ERR(priv->icg_clk),
+				     "failed to get icg clock.\n");
+
+	priv->rst = devm_reset_control_get_exclusive(priv->dev, NULL);
+	if (IS_ERR(priv->rst))
+		return dev_err_probe(priv->dev, PTR_ERR(priv->rst), "failed to get pdm reset\n");
+
+	return jh8100_pdm_crg_enable(priv);
+}
+
+static int jh8100_pdm_probe(struct platform_device *pdev)
+{
+	struct jh8100_pdm_priv *priv;
+	void __iomem *base;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	platform_set_drvdata(pdev, priv);
+
+	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base, &jh8100_pdm_regmap_cfg);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->regmap),
+				     "failed to init regmap\n");
+
+	priv->dev = &pdev->dev;
+	ret = jh8100_pdm_crg_init(priv);
+	if (ret)
+		return ret;
+
+	priv->syscon_regmap = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+								   "starfive,syscon",
+								   2, priv->syscon_args);
+	if (IS_ERR(priv->syscon_regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->syscon_regmap),
+				     "get the syscon regmap failed\n");
+
+	ret = devm_snd_soc_register_component(&pdev->dev, &jh8100_pdm_component_drv,
+					      &jh8100_pdm_dai_drv, 1);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to register pdm dai\n");
+
+	jh8100_pdm_block_init(priv, JH8100_PDM_BLK0);
+	jh8100_pdm_block_init(priv, JH8100_PDM_BLK1);
+
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	return 0;
+}
+
+static int jh8100_pdm_remove(struct platform_device *pdev)
+{
+	struct jh8100_pdm_priv *priv = platform_get_drvdata(pdev);
+
+	/* Change I2SDIN source to default (PAD) */
+	regmap_update_bits(priv->syscon_regmap, priv->syscon_args[0],
+			   priv->syscon_args[1], 0);
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+static const struct of_device_id jh8100_pdm_of_match[] = {
+	{.compatible = "starfive,jh8100-pdm",},
+	{}
+};
+MODULE_DEVICE_TABLE(of, jh8100_pdm_of_match);
+
+static const struct dev_pm_ops jh8100_pdm_pm_ops = {
+	SET_RUNTIME_PM_OPS(jh8100_pdm_runtime_suspend,
+			   jh8100_pdm_runtime_resume, NULL)
+};
+
+static struct platform_driver jh8100_pdm_driver = {
+	.driver = {
+		.name = "jh8100-pdm",
+		.of_match_table = jh8100_pdm_of_match,
+		.pm = &jh8100_pdm_pm_ops,
+	},
+	.probe = jh8100_pdm_probe,
+	.remove = jh8100_pdm_remove,
+};
+module_platform_driver(jh8100_pdm_driver);
+
+MODULE_AUTHOR("Xingyu Wu <xingyu.wu@starfivetech.com>");
+MODULE_AUTHOR("Walker Chen <walker.chen@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JH8100 PDM Controller Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

