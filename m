Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37491C8A431
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Nov 2025 15:16:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFFE5601F6;
	Wed, 26 Nov 2025 15:16:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFFE5601F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764166604;
	bh=F1Xibd8Hm2GccpoYGYctdzBhOnPvhH1VgHPjkXOYmCA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hin0Ope7j6SNGlXEBOziHJ5D46aGVq6sZYdLPS0lcjJfKd1a/FWI+rzHHYW69PkHK
	 3Np2u/EyLBT/9c1AbIzB+HeSU+4zXW2GGKH4Bn1dgkdaX7A04SEzCGDfb6f0WpWpXA
	 FRTeQjG8xtQutYSwCzTuisBW5WNnIM1Ih7qE2yKg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C6B9F805CA; Wed, 26 Nov 2025 15:16:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E336F805C8;
	Wed, 26 Nov 2025 15:16:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB4A7F8026A; Tue, 25 Nov 2025 09:45:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3278AF800FE
	for <alsa-devel@alsa-project.org>; Tue, 25 Nov 2025 09:45:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3278AF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=TdUzQCZq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhS9T+d5uBsLIWwDG3IacEsqRqor39bYfoVmZ7BX4qvB5TT3JOlARVpeeODNFpOpVEOFmDZbIqPhphNRQTX1fE9XJddnbxUqAJZ5hnuaQ13vG7SIgTSDCBfNTthl4tsYhT51HZiIZVz19ESlPwNJ0BJC9XVF4IiU16U5wzYGDFi5J83IMMuEvNyabqbqCqBT7s/JfBLPuFt8kUnzP0cH/m1zcBGJ3yftly89/b7ZKUAApjZIwrEhY2i03zGBAdGjI96GTULZA6rixtAAN7NBXFVXUwyairjjBvbiY8bOgeEENCzR5RXHlE40BDwAJL2I4qIKU9Z/Btxr2WNGzFF82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJo2g1mFP7T0CuyXZ4P2fcKwkQ1LFmxEMqMCCfap1S8=;
 b=uuEhXcvsNjrzOCqj1NtqB9xVTqYYfF+nERiXTMQQ1Vm0U1cNuHEHOiSiLOMuJXJm+PvJTGp2KXfRYy42zWWVA3VJdzVsNkIT6BcNqE5sEBUV+VrhJ6sAiAHSUugvi60wsL4h1H33OelAkfKgSA9bIB9HxV4hlZ56BEkNekCa8od3WqzNSGL4RbvB0Svd0GxhpnJ/hIKezrReRYyHtC9qvNQ2O7dKIk2UCyzRn3T0OSiGl6VWKWSejIkVc8ED6WgMNTfEQKDqqIVR5dWk8mCsOzCIxOjTIhvfn9VVA5WixYyOnDClm2T3QrGwmawOoYnyj2clJRsTPTi+WhvgYg+ZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=hp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJo2g1mFP7T0CuyXZ4P2fcKwkQ1LFmxEMqMCCfap1S8=;
 b=TdUzQCZqxwAEu+RCue6eCSFcXqLOw6MNu6MuhKn9o90p16dyZdqP6MPQR9W7XSSFhNSvWY87Uuurak/sI49/4ABUQpbBTZ8FIeKLN7xzL7SivnYreExaJHF1wPP1aZWFaLNGBhDYs2u1OmNR13mtBhFojOszV8F7qIPvjwyytd4=
Received: from BLAPR03CA0160.namprd03.prod.outlook.com (2603:10b6:208:32f::25)
 by PH5PR10MB997735.namprd10.prod.outlook.com (2603:10b6:510:34d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 08:45:09 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:32f:cafe::1d) by BLAPR03CA0160.outlook.office365.com
 (2603:10b6:208:32f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Tue,
 25 Nov 2025 08:45:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Tue, 25 Nov 2025 08:45:08 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 02:45:05 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 25 Nov
 2025 02:45:05 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 25 Nov 2025 02:45:05 -0600
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AP8ixcW3380800;
	Tue, 25 Nov 2025 02:45:00 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>, <hansg@kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>, <alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>, <13916275206@139.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <baojun.xu@ti.com>, <letitia.tsai@hp.com>
Subject: [PATCH v2] platform/x86: serial-multi-instantiate: IRQ_RESOURCE_AUTO
 should be compatible with IRQ_RESOURCE_NONE
Date: Tue, 25 Nov 2025 16:44:36 +0800
Message-ID: <20251125084436.8381-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|PH5PR10MB997735:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4ec79f-7863-456b-bfcd-08de2bfef043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hf1dZWGNGru5DZQJtcVzwHyOsisEBf4v7g4F755LwYY4XfNBo9MfV76EmmAI?=
 =?us-ascii?Q?wua+92sf8qKqnIlIYsqm8Gr6UBsH5TEhZ/6LpngG29aq8mGiH6nEo4fNPo6M?=
 =?us-ascii?Q?bSgMPmYCGcBcj1W0WD8hkj3vDmWw5aYxF9AqkV5fCGX/ZVFhZXxDgIGWCa/x?=
 =?us-ascii?Q?2Pj4xeaYVUBkxkFvmdy4Pn7jMHuz/gaOUAnvYfj29g4aEp/j15oHFfKMBIlr?=
 =?us-ascii?Q?Ph0B9V2Q/8AOIzO7YE8IM/9CryEBMc5QjBq6j0j6T1ZThdFp6xcuFm4CC1+k?=
 =?us-ascii?Q?HnP2kE/g0kE2l4URemHImo3VMg20Lksa4fwfp4FXA6yI628V6xn1L09FCfvq?=
 =?us-ascii?Q?FO1FZmxvFGjaKAZ4/j2EJgK8XvpWtKnQ/TH+nby6iUE3sIt+D+084hxEUWNq?=
 =?us-ascii?Q?J6Hp+aD6BR3FWwGVub/0cnvQwKnXgQR2Es7swFGAzpHsJnHyXoFBVoWP6Y8P?=
 =?us-ascii?Q?tlywC7vHjx+HTV/oTjAQ6QMO2LO7r4cc/Prte+pXtA6B5sEvFGTIjupZMgvo?=
 =?us-ascii?Q?fBJUpe9j7+ocmwbKIdC080Jn7rxdnFbtxkWJcrCb0BWDcMHPXAKOwK/lMktN?=
 =?us-ascii?Q?EMC1EB2RGa2BbCQRnzFXMzhto/eKTluvPsRS/udJBVNXLGmIkW0Tdywv2nqJ?=
 =?us-ascii?Q?EPjDsaYukfSq+FRcoqPGyYCYMH3g1DjW0fioLv/4RLBlucCfrWkePwGSM17c?=
 =?us-ascii?Q?cn/tqaaD/EyNC0VHzzbfy9C7VxtkjH3RyXvy9nHnwo6QTaMcJ5v0Pnjj5P9A?=
 =?us-ascii?Q?aZfW9J9TTsAXyQ6YdNHphcRihuTETMaIG+YGRXAz99jgePgslkWKtCYUpRml?=
 =?us-ascii?Q?kcf2wvIPf5tOwYqsaNKhhE8PnxgDeIiZeFFp0HtH41ku7da3r4KtbNhEq0Ud?=
 =?us-ascii?Q?rA1qob5Ry0SLIzGkPof4vekEQxuhk/6U8ZPiwf6Jhero6cgiaare09GSquPe?=
 =?us-ascii?Q?EYzC1SaeeMTKaq4zV4Lj0YkJPBxaroo7v3OnYm4m6BzPxNwqaptPviG44nX+?=
 =?us-ascii?Q?G9f5zoOXI0AWZ8CFsTHdYRAVhb08aRJ8EGSihBtdNNRZDFf0Qk3Zsv7mLtD9?=
 =?us-ascii?Q?Z/c94DDvqmsYi49yR/miMELnBSBub5fKd7cb+yofGgsdcuxUydJQxU7mfM0e?=
 =?us-ascii?Q?Z1oBkKz6TmhddZ0yhQpcfQcnydIphbrAbPihcsInUIhPc5sE+sWfwYCPNWdJ?=
 =?us-ascii?Q?k0v0pxUvY4JaD/aFnDcO5PUGflnqrNmNiMLbMY8H5vNVJf6foFZlQzFIsO7V?=
 =?us-ascii?Q?bYchlxrxjPPTE33Tfak1Rv0SbdFtb8TKh4lpdkhRNvjDFIo4CkhI2xivXK3v?=
 =?us-ascii?Q?d7K8MsLg6fSIlxahd/0lWzPXSv0g33rB9tRzRHt8aeeEWXOupnQCGB5oxofC?=
 =?us-ascii?Q?6r58CgPXBW/mqM8zsW2z7qqE5XRtKzCcB6B3AjZf3GT2e7emNJWCZDXbjD8X?=
 =?us-ascii?Q?7jGKXcwm1zZbrkNhYIU5Wyo44xkrGXdO+PETx6h7z4/NUvvWMXGhfQSU/ggf?=
 =?us-ascii?Q?ur/hpY4E/YHkK1ECnt0wZpc9LeYPPjWYJ34gHVNNNr5elbQ+0T5bOKHTcE5a?=
 =?us-ascii?Q?OKBF1ZMZ/dqMpzLSfqI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 08:45:08.4735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1f4ec79f-7863-456b-bfcd-08de2bfef043
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997735
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MFZTZ5PL4DSID6F6RQTB33OI4LMFLQY3
X-Message-ID-Hash: MFZTZ5PL4DSID6F6RQTB33OI4LMFLQY3
X-Mailman-Approved-At: Wed, 26 Nov 2025 14:13:09 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MFZTZ5PL4DSID6F6RQTB33OI4LMFLQY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The tas2781-hda supports multi-projects, in some projects,
no irq is required, so the IRQ_RESOURCE_AUTO should be compatible
with IRQ_RESOURCE_NONE.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
v2:
 - Remove error ignore, change to AUTO compatible with NONE.
---
 drivers/platform/x86/serial-multi-instantiate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index db030b0f176a..eb3fffbc29ad 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -64,7 +64,8 @@ static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
 			dev_dbg(&pdev->dev, "Using platform irq\n");
 			break;
 		}
-		break;
+		dev_dbg(&pdev->dev, "No irq\n");
+		return 0;
 	case IRQ_RESOURCE_GPIO:
 		ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
 		break;
-- 
2.25.1

