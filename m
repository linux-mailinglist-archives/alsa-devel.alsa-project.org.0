Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C920C8A46E
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Nov 2025 15:19:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 368A7601F8;
	Wed, 26 Nov 2025 15:19:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 368A7601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764166786;
	bh=SE7tHqK0oBBvw+C6DuoxIApjZCFSRqSzDblCPWPUEag=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K02CKMymtlbSZSzuWOy3jhRutp2cayRhQHtIhIQnYwbfsHuvQAolgVk84KaLS1hnW
	 K94qUUb751o6JCaU4A4r0knY8+SCgVV9ojM4AQetI3ARiYW7C8YctAAJGRwH7QBsSy
	 qmp9SgG/qbAAzKLH7Rk2z7jXEzwpWM6PK32Gvz4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B708F805C0; Wed, 26 Nov 2025 15:19:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11803F805C0;
	Wed, 26 Nov 2025 15:19:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AD34F8047D; Wed, 26 Nov 2025 09:18:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011000.outbound.protection.outlook.com [40.107.208.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6839EF80087
	for <alsa-devel@alsa-project.org>; Wed, 26 Nov 2025 09:18:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6839EF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=xPPecdol
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a20kMv5Vkv03gU+VoWrypDyiaIqt3CWwA7nwXQu/va3H0Z8nhTHFwgWqbJca+oUfEAnoGOFwL3B+oXRXvD/9zSiCyyEKNwRCwYQQx9I78p8bEk7HY2pKwaulb+uEJU7CIxhiu4n6eju74CDFEs3N8ImZuodUHVG/yX78Ei8thO49m2BV37mu35TWR9OY1/3t1/Zo2AAg9tcqhqPm3mpWTWlgrVQX1k8+K9WDVZWniUmLGvMioo6JxpowMGBEwmo74Rk5vsWlYUyu+6H9S3ygER+XOaYcPQjVe8GM7Q1F+PWMJWZbvcOqT4pbY/FblNTIw7Jbj9D1nZkFaOXIK/dCcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbCeYhtqwec69DG/b7dH99PeZ1v6sqgKSeYcutPzJYI=;
 b=g3jcEj2OEMfMhxyNmb2l1WXb+Uf0KkViDCkezT124hc1izd/FhQMs7aNxWu99C2az4mT3oRwcZcjJ6H5GHnhrAGOfGjT98NkHbQGYyQaiuW+QwOnryl0Nk8rUz3A3bt78XQ1GDklkjftOAbt37H5adIUdtPNL27473nRTwYoe9/J9z4xW9ghXchAVIgivhv73feS8rZl//RrMfWOykxrcOmeOhFZ80DV2L8V3ClUVRUh94AP2URpXDPMMkX6umAseMWtDFFaHwRA3RfF/IhyIaoYv2UOFhk0VWRt+ugO3hSFXs32QX2iMtJ8wwJXFOzGACxOujv4mh8+TzjeWXLqFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=hp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbCeYhtqwec69DG/b7dH99PeZ1v6sqgKSeYcutPzJYI=;
 b=xPPecdoljBimd58bXANYmv1dzfwYefq1wnUE5DCYVlIhfvj/RWPSam7NV+5ciPD13l6zBBfgvJpYrfWZ6PmFSsaUMLfvXDKB7Ne+NIALzUv1plLK5mPTu3Vaqech363KAjSVDzOQ/cmmSGgcxJ4UjmRudYs8dQJ+WPlXMfYlN70=
Received: from DS7PR05CA0092.namprd05.prod.outlook.com (2603:10b6:8:56::10) by
 MN2PR10MB4222.namprd10.prod.outlook.com (2603:10b6:208:198::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.11; Wed, 26 Nov 2025 08:18:32 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:8:56:cafe::e0) by DS7PR05CA0092.outlook.office365.com
 (2603:10b6:8:56::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.11 via Frontend Transport; Wed,
 26 Nov 2025 08:18:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 08:18:31 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 02:18:25 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 02:18:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 26 Nov 2025 02:18:25 -0600
Received: from lelvem-mr05.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AQ8IFG6933432;
	Wed, 26 Nov 2025 02:18:21 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>, <hansg@kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>, <alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>, <13916275206@139.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <baojun.xu@ti.com>, <letitia.tsai@hp.com>
Subject: [PATCH v3 1/1] platform/x86: serial-multi-instantiate: Add
 IRQ_RESOURCE_OPT for IRQ missing projects
Date: Wed, 26 Nov 2025 16:17:41 +0800
Message-ID: <20251126081741.10588-2-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
In-Reply-To: <20251126081741.10588-1-baojun.xu@ti.com>
References: <20251126081741.10588-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|MN2PR10MB4222:EE_
X-MS-Office365-Filtering-Correlation-Id: ad936b33-f10f-4273-9018-08de2cc46290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X5qTSnFpHcjxTTuB6upiWsATgrB/i+nfmPwTIcSBZ3xyvm5X25D1/hsLtsWO?=
 =?us-ascii?Q?LytxHN6Xr2KZjLa+wNMAOc+BWc3WnvKzwbkSHNBcm8zLw+83HiQPWZjz16UA?=
 =?us-ascii?Q?2Fz2HcnQjsk8UYpqol559TiIvFp0SjJK0r3KwQ7GCCQqLcsjRtSrX9XBVp8S?=
 =?us-ascii?Q?+ETj1j+yzwC5B2Vw0peYM14t8M34SUG3NUo/1Bbjf17xol5U0c5WLOc0S7UC?=
 =?us-ascii?Q?OzCJzmXcDUqagyiMNE1BS3wyX3PPMDnLJaovpNiUZX3V7LD9x/oYkO2YLlIF?=
 =?us-ascii?Q?ENsq7YgKMfOZ0sRgd5ot50uRRC745otE9EDO31m7nwBvRzCGqNMqoCDGxYpf?=
 =?us-ascii?Q?l+5amXJqhrESE9Uyx8kwuFFiwOeTBowt6C8wAHq+BPUtj7jYekpWwAcGZh/R?=
 =?us-ascii?Q?BKyCh1ApJv2QBEl45B8xDaMTfdKgvjENzEeF1FNqsLH88b4kGpSRaFNt9kir?=
 =?us-ascii?Q?41I9fkOLpnYYJMPdlGB2HhgBrlZoxHxZsRNMnPjuwuYTV/+ScmVBjXyHMD//?=
 =?us-ascii?Q?i3T3KeuU9Us4JFTj1bKd7Pasu2LiJLX1+TDbsLbLCrzgclpQ+DfGirwPFXYI?=
 =?us-ascii?Q?kugqSna7If7kQUkNF5u1GdDrEZ80RbdJ5dNIWDpYYbyTn47aa+0BWZSJmKCF?=
 =?us-ascii?Q?L5IFezD7JV2NszmZNZwEbqhzrerBX+dvrLqIIkK1FBEdEuAHpiOtr+DAwALz?=
 =?us-ascii?Q?70ZKmdLd1zqnCmcjR/xxHtH9wtSZ/cRQ1rLnGD3rjZTVhHDxnePJK1ZrvsIn?=
 =?us-ascii?Q?FDfW0V8EKK13PsKjSbxnRc5pO1zw2sEXGBDU6AWzmxzv3kc3oYPvRVcB1Z8x?=
 =?us-ascii?Q?ALGFHy0IrDU5a+42kpjg2fJz71imDDSFW09VdI3iBWOBEqb4GRAA0MIxSzvJ?=
 =?us-ascii?Q?PyzfmMR7Lum4k33PI5mdD8aL09fUJcmET4u2iUV+G6fpj7+F3sZQ8PVDrH8m?=
 =?us-ascii?Q?yv/+ij8HYhkM+wr2D///zUGCjsp2yJJT6rJYf7x6MAb47HrApbP87G4fS1Re?=
 =?us-ascii?Q?8ag+Q0tAIYDpsv8pCqMdnaL1g9vbimLLGVvLMBqAStSwXiK0yW4EotAdZGi4?=
 =?us-ascii?Q?3MXne8BfCWx09Y0d0OTmSsDekiB/vpHqAI+mBf/0t5Z5/EZ7lTL8f/5sBfP8?=
 =?us-ascii?Q?OGwh6ageR/PKne1IjtWgAfbw93hRPQZiGMsO5KfQCm5R8o2Pu222RnKJYl1i?=
 =?us-ascii?Q?gR7zvQ50mm4hNqP5xE9vC5kNXiVsGrmXSDDoPgHtRu8VOkSCSwVLq4Ed/hUI?=
 =?us-ascii?Q?fKA6ol1k9ZR0hUyzkQt1pRsTWRQEzgtWnALlnWSxFveCzY78Olf7Msi1+n4F?=
 =?us-ascii?Q?bLIGZJ5X26tevRl92YNCohn7x7aXJd4ZUxiqqOhH8cODO9+AuNs7vLP6s8zF?=
 =?us-ascii?Q?qpB5PZcRj4crvbieXkASYnyZ0tx9sPvNAhd7UuRgnymvg/dItaWN5uShIaKp?=
 =?us-ascii?Q?inb9Ml3Pk3ooSyFghsgg7r+xjTKJUChOJesadrs0zroyxaGQeTSgG4dM0l0p?=
 =?us-ascii?Q?UX+ri9LgJRjJT9yg9siGVhqk/Sf8U5zw+G4V2PjdXlPCV2EIlEe9VkrayKEL?=
 =?us-ascii?Q?shx8OaB9qdX9ll/gl2M=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 08:18:31.1183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ad936b33-f10f-4273-9018-08de2cc46290
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4222
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7IG7SE5HFACMS4POQKGCNF5T4UARM3A4
X-Message-ID-Hash: 7IG7SE5HFACMS4POQKGCNF5T4UARM3A4
X-Mailman-Approved-At: Wed, 26 Nov 2025 14:13:09 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7IG7SE5HFACMS4POQKGCNF5T4UARM3A4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add IRQ_RESOURCE_OPT for compatible IRQ missing cases.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
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

