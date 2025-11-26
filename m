Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9B3C8A48A
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Nov 2025 15:20:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8E576018A;
	Wed, 26 Nov 2025 15:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8E576018A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764166836;
	bh=7wLvRemsST8lKUUHDWYhm4/rPosuv0NioAxRHjhoRCI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TinvrP2q0jo5WT2GuC3Z4jst2PIOcoKRGY5h6kNxixMmZOPkChQuDG8HM5XfDTIMb
	 Gg2acjB/ugtE6e/sm8r0GZyTlaJnHxVtnQAf/kXsAA7vqOwkExs+oGglamTJTCysXd
	 /hOyvuPNaYD8QWUf+IH8UAsTUCz+IOGeZ7dg664Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 979F4F80636; Wed, 26 Nov 2025 15:19:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56CBBF80642;
	Wed, 26 Nov 2025 15:19:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95C2CF8047D; Wed, 26 Nov 2025 13:20:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011069.outbound.protection.outlook.com [40.107.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7544BF800AE
	for <alsa-devel@alsa-project.org>; Wed, 26 Nov 2025 13:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7544BF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=WomTmhyX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aewaATRUn3kv3EJtEanr5TwhlMlbwv1jlbiOUHeMSTEQhhCOAi9T4VmGG4F/VC7R8aJhA5sumVB5vKmq41+qfuCpb8ZMqOOA+j/aqCWsbkIc6wyp6JmtYXj0Qe0b73baIHfutjKTI6Ofppc50SuMSG+A5jPwslYkMDR2yfgF3yWCrp3aXWp/LrMc84qwj+yRb35Uvq+frbD5sCM0AqiJoX7E7yqvwjo1Ns9Ea/3BPdSRGpeouR1aTORl/P09wz+j3zfNw/OElJcPitlokxJcKeoj7w0g+hFdQYkviCnjGEjCL3PITJuZ8wYg0Nk7HLD4StMwpaoVH5q1Mx0GIUdmoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPI+zqCzGsMzddNoQyXR3F4HWPH6Fa65U/JuSSS28WQ=;
 b=H2a0/W5SatK1u7wfDq0a2K297QAYRPU6uBg3ftZj2GVFXqZVxSoD5zxUy7qXqTKP3QyjkKCJvI0Y1bq+1yLmw051GqhnkUV05LmNDUvasAKW7bb5HkYLQwdmEP3TJPmaj7Kvj/ROTHiYvHyjW71LCX4SWYbrF3F6OU8pRxdWr1I+VsjQ3N2rEy0dhfECzw5jZARie4qQlqbK5EzReTqlK6VqlDDLjqhGU5VjwDOP9eDoKffF4193RJ5JFCjZptfUPqJ7kwa35e+LHSOxbkvMv2vc7Fhp3ALtqdTPOljdPoqpNd+AxybR+syn8hTK22KY+7G42WBZ4VFNEWkrNSDO/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=hp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPI+zqCzGsMzddNoQyXR3F4HWPH6Fa65U/JuSSS28WQ=;
 b=WomTmhyXYTv+Y7FFpzeG1HTXmJAQ1Sz90Kif/Y7ms7uqLGiNQi+SnER2OS6tNtrWgwRDb9bT8ru3KbYdkPNVWupo88yzIkuGdes8WPH9fnd/X5DQzYDr2zTjCt4/Zr70alTJAMDxOvq293ylGzVMXDxvD7RQBy7TWHPeri5b0iY=
Received: from BN9PR03CA0354.namprd03.prod.outlook.com (2603:10b6:408:f6::29)
 by CO1PR10MB4788.namprd10.prod.outlook.com (2603:10b6:303:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 12:20:01 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:f6:cafe::69) by BN9PR03CA0354.outlook.office365.com
 (2603:10b6:408:f6::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 12:20:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 12:20:00 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 06:19:54 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 06:19:54 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 26 Nov 2025 06:19:54 -0600
Received: from lelvem-mr06.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AQCJcPm1202942;
	Wed, 26 Nov 2025 06:19:47 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>, <hansg@kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>, <alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>, <13916275206@139.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <baojun.xu@ti.com>, <letitia.tsai@hp.com>
Subject: [PATCH v4 1/1] platform/x86: serial-multi-instantiate: Add
 IRQ_RESOURCE_OPT for IRQ missing projects
Date: Wed, 26 Nov 2025 20:19:11 +0800
Message-ID: <20251126121911.10980-2-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20251126121911.10980-1-baojun.xu@ti.com>
References: <20251126121911.10980-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|CO1PR10MB4788:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d4b7c1-7b1d-4526-190d-08de2ce61ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Xcaur/+J3EEcN+ggieg1qQ3yz09Lxx3BUFMYDVqMvcxCeD6d9p1E2LIj00ra?=
 =?us-ascii?Q?B1ofb0nZ0T2FdZsVPPfL2Fg7ZSOpTK03+U8z54k8ClmAISGzmTdGw7kx9TJV?=
 =?us-ascii?Q?TaKAiB6PCRxmxigmLG5vb13yOuw5jIsxjulJ/TaMIGojcmSY0O09FgE4Szs5?=
 =?us-ascii?Q?ruhkzFDdXxDZsxFMSNQ3J7shmX52GDUbD5lKFffZY6k1laFtdHxEzYmqsIO5?=
 =?us-ascii?Q?8ejBdd5ybxa1O6DlTEPZqcnif/svCcDEY0ao21e68N9Ybu+Q483avujoCuF7?=
 =?us-ascii?Q?migTPaIXqp5bqG87M5fnB02g/wqTKUjJWGHJGlADcdmtYKNzLRknP27pMPnM?=
 =?us-ascii?Q?VNbw7muRPNVBUBT36bshszIhUu/rnjQ16f2W8e3aiO5pjSIgze0VXr9Pw3tY?=
 =?us-ascii?Q?wfTwGywsyhHKushQFpLcmJnRaMTuoUkxgRb9GY/UkNL84js/f6kmwsn+8rhm?=
 =?us-ascii?Q?252boq2qzekkbISA3JA9cI8GwZnz88asWgHJD0/6qPEBEXSq6ijySbH56BTg?=
 =?us-ascii?Q?fY2Izf40uDyXb85Ib26vsIyPMG4/wNv9xAMuzocdm8J1GkInqKQ/wdSMrT5o?=
 =?us-ascii?Q?EGnj5GjIY3b7PbSQFdbf5ij/It6IcuWpOkvgQ6Iv8Hj8CuzWSO4ZJdZKwe/R?=
 =?us-ascii?Q?ggDSpM1p2sFwx/bZKVhh2F6MTFfS0cAV3xXKaP/u+D4ajfjP5rg3stlBHhYW?=
 =?us-ascii?Q?fG7vhuPDh5vB68TwQ7WYbiDkIc/+hnfwLMIfzDw7GysPQ2okLt/IBZPz8zOJ?=
 =?us-ascii?Q?qlMiu/zLHzOMKWL3fWfVSlzriJMtPNCPsQ7/kgS2h3UR/LMJRVUoeEBWnrUO?=
 =?us-ascii?Q?StxRs5mEeznjRUn7Vb7xc0dPEpOqEi1McqyhduFmvSqiAmThRvRL07Ea0a7G?=
 =?us-ascii?Q?9Ov8kKFMlm13WflVVZYTjjxMg8YERhVZdbeE8QNvX5p6xgP3lq2ARVICjnTP?=
 =?us-ascii?Q?ihQtSD2gDifBHjQFlHNtwHcTqDepmZWckhFIBM+LQ5fbHSJimv+c5YQrEG/O?=
 =?us-ascii?Q?3VQVVvVXn/aSJT6VSlCh17WU1oH3zkKxG2iR7mtCowCStOaK/BH6CdgPjVk6?=
 =?us-ascii?Q?NQF6wwQtuRezDLfMV8kTSmyBPGvCzsOZ9q/soHKyypX4rwd8N80xyzvq+1vx?=
 =?us-ascii?Q?9zlxLLKTNr42a7JCDik9dUjmgTLTw8Jcx5P+LPJbWtqdFzQSo6kwqJ1NUngp?=
 =?us-ascii?Q?KvLWnB1R1v9VAvm2uLM0rSiCgcnD1EOVafRxAlzsQG+pIwRA2E8rYw6WzEz8?=
 =?us-ascii?Q?XtIKrTWBvIzRZvf1h7KIC7UVLGHkT94sufW1qYVeUVhjfvuYKOMAKVsNzeSl?=
 =?us-ascii?Q?DIgXQRB+80FppuwB1ONfGCsiaAbO/mLOeV+lhqyU6xAr5h9skRXOrUQgLfhG?=
 =?us-ascii?Q?BmT15bL/d1j0I6ZyRnzyZ17c4GzcskTj/nVGZO4toaAF/mFu5MbAFJO8SYxe?=
 =?us-ascii?Q?K1fURpU3UJ7z+pP2y6tR192c2+m9ivebQ71AqG3x/AWjQTaAzlo7QEsA/3Hu?=
 =?us-ascii?Q?sIiSApHHEOfJ2CdRymMZJBA3HwFuTGY2i7RlTacO0kDlVs4FXC+cMqD1ooWs?=
 =?us-ascii?Q?puLPULa5Mn2DhmkMMrA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 12:20:00.2498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f8d4b7c1-7b1d-4526-190d-08de2ce61ec8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4788
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ODYNYVF4UYDL5AYZ5C535LAGVHT45DT5
X-Message-ID-Hash: ODYNYVF4UYDL5AYZ5C535LAGVHT45DT5
X-Mailman-Approved-At: Wed, 26 Nov 2025 14:13:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ODYNYVF4UYDL5AYZ5C535LAGVHT45DT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The tas2781-hda supports multi-projects. In some projects,
GpioInt() was dropped due to no IRQ connection.
See the example code in the cover letter.
But in smi_i2c_probe(), smi_spi_probe() (serial-multi-instantiate.c),
if looking for IRQ by smi_get_irq() fails, it will return an error,
will not add new device, and cause smi_probe() to fail.
So, we need to add an exception case for these situations.
BTW, this patch will take effect on both I2C and SPI devices.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
v4:
 - Change the description for this patch.
v3:
 - Add IRQ_RESOURCE_OPT for IRQ missing cases.
v2:
 - Remove error ignore, change to AUTO compatible with NONE.
---
 drivers/platform/x86/serial-multi-instantiate.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index db030b0f176a..1a369334f9cb 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -22,6 +22,7 @@
 #define IRQ_RESOURCE_GPIO	1
 #define IRQ_RESOURCE_APIC	2
 #define IRQ_RESOURCE_AUTO   3
+#define IRQ_RESOURCE_OPT	BIT(2)
 
 enum smi_bus_type {
 	SMI_I2C,
@@ -64,6 +65,10 @@ static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
 			dev_dbg(&pdev->dev, "Using platform irq\n");
 			break;
 		}
+		if (inst->flags & IRQ_RESOURCE_OPT) {
+			dev_dbg(&pdev->dev, "No irq\n");
+			return 0;
+		}
 		break;
 	case IRQ_RESOURCE_GPIO:
 		ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
@@ -386,10 +391,10 @@ static const struct smi_node cs35l57_hda = {
 
 static const struct smi_node tas2781_hda = {
 	.instances = {
-		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
-		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
-		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
-		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
+		{ "tas2781-hda", IRQ_RESOURCE_AUTO | IRQ_RESOURCE_OPT, 0 },
+		{ "tas2781-hda", IRQ_RESOURCE_AUTO | IRQ_RESOURCE_OPT, 0 },
+		{ "tas2781-hda", IRQ_RESOURCE_AUTO | IRQ_RESOURCE_OPT, 0 },
+		{ "tas2781-hda", IRQ_RESOURCE_AUTO | IRQ_RESOURCE_OPT, 0 },
 		{}
 	},
 	.bus_type = SMI_AUTO_DETECT,
-- 
2.25.1

