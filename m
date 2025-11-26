Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3B7CB00E5
	for <lists+alsa-devel@lfdr.de>; Tue, 09 Dec 2025 14:29:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64C19601EA;
	Tue,  9 Dec 2025 14:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64C19601EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765286970;
	bh=ti65yqwc5otdNdHej00u1H/ZQdJXhHtrTTL1nlZ20d8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ohHXVz6WrqmajFHjFr69jYHnBm95X00VDufd/DFSqzzkny3gSQUtI89/JYNSvt/E/
	 tdkA+sFHCOl6dambzECq/MNF92Lnlboq0NZqPc76DOqFizhJtWoORSzl8VDszGzaq/
	 IsCoihmogZ93E7noo8HSTD9kDYEtcA1umSQDMZ4Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BB84F805C8; Tue,  9 Dec 2025 14:28:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E00EF805D2;
	Tue,  9 Dec 2025 14:28:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 152C4F8047D; Wed, 26 Nov 2025 15:15:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F50AF80087
	for <alsa-devel@alsa-project.org>; Wed, 26 Nov 2025 15:15:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F50AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=eKylhRqK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+zNfTYe/A7eF2idbbcHyibj/Q2OGLUoRFMZCZl49hkV42tzJaC4U8uaHDqvHdMiFqT0bjnQZd4dBvTH/1I8NMzb2Vm031Z2vpZ7org0Z7n+UZEqWEPhk9HrkjThq4V0w0qa8GK0OvDCqt5OH1pRWgWHaIStV++ReVNRPwu+jnSug+qKmjBCRfKM2wVjGW6c37KXVrzH2+WmdT/ebGnuIZG+YQ13i5Hq1dvc9/K1tv2iidNMX4UH2cCVj7GmKQ8aJVirDsVvWqPwzMXn1ML2up9K1P1NCYOKS4nHUaqZdEhf5IrPY8UMT1hEd5lwMaTANGTTKT3EIdmpNyprPTlhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aqm7qXsQA3SysPwCFx7F4JGyTp0cKN9AP5X4yDrWies=;
 b=OkfI3hbA2s7AqBlamID0klpci0cF4w/QfpHUo9KhfGTGXTEmyqzEjH3onkQ+tKOyT7fFDxGND5tIv+PhnjxWD++A1tMIiPKcW7+ruoU3TObnm9NJSaCoznpO3c5TGE+d+FvYXnhDJ0AMVNtCWHr1C41AGI5UqNk36VCfzSWMxPisr8O7/oiA0KrXOVhhI9rd5f9XFY/22tOjYl4pUW319r2jA8Y72C69UumKdmTMsX6jqrd5EWwkPgyDj9jO2oWE5J+2sWkcM67LhcXWRlfXP80519bW5bObHvqxnVWaDiA9R+qtz9JjcgmULaMVRTZBZZRWFaKn49M9ZDjFhW5iOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=hp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aqm7qXsQA3SysPwCFx7F4JGyTp0cKN9AP5X4yDrWies=;
 b=eKylhRqKh3kBM4Zt47l+uYZ/GcpqpdB87ZitbAHYTUEy35yvuR2ukyik0WV/wU6PMS1U4OITHTD4NkiqhzKNWIOQHzUZMkSplGj3knyq9GayIiIbexssDFR4kUFAiqyOhrmoyFXxm6G4vXEZW88Admc+1992UjD9gxmQKJE//TA=
Received: from BN9PR03CA0259.namprd03.prod.outlook.com (2603:10b6:408:ff::24)
 by SA1PR10MB6589.namprd10.prod.outlook.com (2603:10b6:806:2bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 14:15:10 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:ff:cafe::7e) by BN9PR03CA0259.outlook.office365.com
 (2603:10b6:408:ff::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Wed,
 26 Nov 2025 14:15:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 14:15:09 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 08:15:06 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 08:15:06 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 26 Nov 2025 08:15:06 -0600
Received: from lelvem-mr06.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AQEF0d91340689;
	Wed, 26 Nov 2025 08:15:00 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>, <hansg@kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>, <alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>, <13916275206@139.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <baojun.xu@ti.com>, <letitia.tsai@hp.com>
Subject: [PATCH v5] platform/x86: serial-multi-instantiate: Add
 IRQ_RESOURCE_OPT for IRQ missing projects
Date: Wed, 26 Nov 2025 22:14:33 +0800
Message-ID: <20251126141434.11110-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|SA1PR10MB6589:EE_
X-MS-Office365-Filtering-Correlation-Id: 23aef568-edc7-4c21-7a16-08de2cf63534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BCQHr0tfoXgNOlbmKgx3H/MPkxYSmeaUGjbWr+8Tzi/vBeFL/yvQyCWTIjB/?=
 =?us-ascii?Q?1vAxAYmKLv/0IgsUG+0aouEKfu/mn2KzA4/AxuhWcL7e4beKmS1UL2WWmJfO?=
 =?us-ascii?Q?YuslzAD0k66HrCmJ6lZFA1mWg3panpkyESZje3qCW1ZzZPmbHfl1OQjtI9k4?=
 =?us-ascii?Q?oQn3hq/5W9m5XwqFn+kRAml14G4se0An2zKWx0Y424v299mcO7jXu8p4ba5z?=
 =?us-ascii?Q?aWlohPKWi3rmvtT8K/An9XJ/Y07g76Nt9EGe8KJjhs/XZC5mEMVFEeX49CA7?=
 =?us-ascii?Q?ulh0klkKSSncb49t0S+TNzqrSxSjGjKxLrVXign+UqwY84fxgp/oIB4ynCHn?=
 =?us-ascii?Q?PBrd1n96R3sSfr07zVbng6bF4uSWNDiKF50HHG3islpTlnkLc8+aHzKDi6+x?=
 =?us-ascii?Q?4fDHJ5z1/0l/+ytAMGmJbnJx+TB6800Pahmi3VVqhlUVb7NQYsE27wc6Vzsr?=
 =?us-ascii?Q?smmZJALhJz3Laztl+vNJ0+DF5mlZz0Laq5A3e8e9evWBRHkO0hOKT3kv98v0?=
 =?us-ascii?Q?VVuPV6JrbYyYNv8dVN3q+3J8STAY2RUGKwAa2vdfgxYYEGrTegCEEz7IlRDu?=
 =?us-ascii?Q?OAxwEfKHa84Oa3G6AeqQ/Ijm8zcq4lE/nBL+96H4OgZ9LzRLSiWqyRAazPgn?=
 =?us-ascii?Q?fVQ1pFDOdeTNTWdXDCabGOgfbiKypKedn/4rzogrWVhMpX8SYlfVAHDBv98g?=
 =?us-ascii?Q?H98xnTAQEXH6eNrsTwJ7ubmGSNSubgR//TWeI59aV05huUPHJkFfjJX90oLK?=
 =?us-ascii?Q?9pLwVDbLFq22iqfJOg/7uX3HBteaMl8Wma2tjEuYoXdgP+h33wFf3TQpc/3j?=
 =?us-ascii?Q?7QP9dw6FftbSZ13IPK/NwYL+YlGscnw5+fydNMpl4/86VAow2TcqDw+r3Zj9?=
 =?us-ascii?Q?V5uP+W0SnwLSzNwdQkveiQZRAR0aEdqu9G/4zVag/hQLnzRdeDH/pdxKMSNN?=
 =?us-ascii?Q?9EEStFpbIldaQeHNoqbVqAxKoI7A1V/iNEWsZQkyNz2PD6SRkxTt8ZCM+CEa?=
 =?us-ascii?Q?2z5wOz1KSSKCwt4e72c/wMF+ktTmxY6eYyyQkW/dl222KWZ2071LmySvxLCO?=
 =?us-ascii?Q?RqBq/LuL+hPAkFZnFSx0NpvHFqY9VaS5Zn5+jgwZ/JxuYvvSr4VQL93plWCz?=
 =?us-ascii?Q?Or84dfVHSPvEzpleiMdwSYSaHUgWLsLyZ7PMNCWcz85cVDjiT/FzMvQeARXz?=
 =?us-ascii?Q?bqZSsYBLDuKAZAT/wm8bjhBfcceWiBGAns3br4hS2U9bqBxPNvCNbf245SWy?=
 =?us-ascii?Q?QvPHDdX3h4pK/oIzbFl0lbvomdJZUpYVFr2WAGH5TYnPLwFLAcy2/8kvcwZl?=
 =?us-ascii?Q?SOx0fPsE32I6fGQz1rJL+201VzAvzwa4e1lOek3VTOuR+IED+WzdwbjSA8DM?=
 =?us-ascii?Q?KLWIxhVRh6EX6gDsSSzxqgM/+rhEhhDH58G+6/NsERUl7aImLUy7/PhbDl0H?=
 =?us-ascii?Q?dtnEOYj+7GMQF/VuABXhaXEWSG+eukm0JR6vnPrWoVPlUqBuvPq3LX4y7pdF?=
 =?us-ascii?Q?zqAOyMoWLAftYF3RPDha/w5X3IPffW9VItkE3vu9gj9KhE6ZDGZ7GtIswgyS?=
 =?us-ascii?Q?6MOnAGYtJIX7bA9xUbc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:15:09.7627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 23aef568-edc7-4c21-7a16-08de2cf63534
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6589
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4V7UEWC7VNIHDJHIE65NJ2SQZJSPCFG5
X-Message-ID-Hash: 4V7UEWC7VNIHDJHIE65NJ2SQZJSPCFG5
X-Mailman-Approved-At: Tue, 09 Dec 2025 13:28:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4V7UEWC7VNIHDJHIE65NJ2SQZJSPCFG5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The tas2781-hda supports multi-projects. In some projects, GpioInt() was
dropped due to no IRQ connection. See the example code below:

Device (SPKR)
{
    Name (_ADR, One)
    Name (_HID, "TXNW2781")
    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            I2cSerialBusV2 (0x0038, ...)
            I2cSerialBusV2 (0x0039, ...)
            // GpioInt (Edge, ...) { 0x0000 }
            //"GpioInt (...) {}" was commented out due to no IRQ connection.
        })
        Return (RBUF)
    }
}

But in smi_i2c_probe(), smi_spi_probe() (serial-multi-instantiate.c), if
looking for IRQ by smi_get_irq() fails, it will return an error, will not add
new device, and cause smi_probe() to fail:

[    2.356546] Serial bus multi instantiate pseudo device driver TXNW2781:00:
error -ENXIO: IRQ index 0 not found
[    2.356561] Serial bus multi instantiate pseudo device driver TXNW2781:00:
error -ENXIO: Error requesting irq at index 0

So, we need to add an exception case for these situations. BTW, this patch
will take effect on both I2C and SPI devices.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
v5:
 - Change the description for this patch, remove cover letter.
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

