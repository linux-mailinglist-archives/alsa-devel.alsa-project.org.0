Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 271EDC8A477
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Nov 2025 15:20:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CF4960212;
	Wed, 26 Nov 2025 15:20:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CF4960212
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764166820;
	bh=L8CtmBSGq/lt0y9qnJzo5JAQe360TKXZrgyh622tY9k=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gwWcgyxEbI2LznXIMZe13ZFK0vJdKH3zFfvU17kU1Q0DDtGobJF0tWh9GX28tC79q
	 80EGzLoUVoKWiGmn438qwNuYwqo+KhOJ/SNY3BRWzvzHdqnhZbMSzof2vFcUdR9vdI
	 O0m3RmfuRmwD47vZULTevpNgKVqUR9dJa5IzCSmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4D5DF8060F; Wed, 26 Nov 2025 15:19:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FFC6F80616;
	Wed, 26 Nov 2025 15:19:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CE40F8047D; Wed, 26 Nov 2025 13:20:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012025.outbound.protection.outlook.com [52.101.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87E64F8003C
	for <alsa-devel@alsa-project.org>; Wed, 26 Nov 2025 13:20:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87E64F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=YNkQfLXl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rOs0SQW18SyyWcrkKHBY6Y1k4m7X5i6YsiYH163Wm9bxYYMVVloa1L1FbQS3p/H5Vn92onec4veS1HglErM5Dmt8rrktmcrEbp2C9csd0IAC9XzR/yoiLeBuOst6ZkftLFbAmbrVISRuUNARAReX8xJG/XlsPWALFGVmqSYuNg8augYMxIwoHoLsp4jF8G4HjgNOXt7wTxWl8F5IHHtPMzHx6Yrf40ivTjv/iWkcPkLmIAdtgvqE8qZUrzOdjEPYkeNZNaD1KLSQR82CdRZCBY5s7lmSmFiyAdsGeShv2HxlKUW1azny1nQOZw51N3YjTocbtpcaZGajbfNsV4/0Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLh1n2Fw75zDMoKd8FTQRZvsrectjDnjObpIF5QWJnU=;
 b=fq92/keoYhP4QjbRoo5y8hjNYC9GuSqhxfxdULDqUJu2Su0Gj72DUPEmAj+5VWRahFOc+qsGBSXMkCdDFYc+tFH2YGI6ivT0ELsAa9l0PqE9DPjRNTXyYb+r7VCcdkdOtqIp69fgxRU/bFKnnmXmHCi7Qbi4OMr/VjS7vXkPiO9UcnUDau6FgzWSVLrYThFOEsYtpzRswqLaf2BMSr/czW4raw9UyHAyYrLcDnVGBx7Ly95aK3wWuY34PZB/rT59G8sqTOWrEspLWXbPIsyP5CGuMvlO25KZrw8oqLiNAiYCSlApmeCjCgZblFpZief8W5lD1kwG/qe6UYDJwsnypg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=hp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLh1n2Fw75zDMoKd8FTQRZvsrectjDnjObpIF5QWJnU=;
 b=YNkQfLXlk+gpzzHekRu3ZFkm8a7W8/R1WQr0bbA5nnhP6LvkeNCBPU6H9z/VuFapXbgQL0V7afzqMEZMq7Ye3oMWVzFFsExJ2muZ3Ibigpci489O/FjCqTfFw4JViydUPcSkiuVnYlVYD10/F57u3GNbU2mfWOVttmqB07496uk=
Received: from MN2PR03CA0016.namprd03.prod.outlook.com (2603:10b6:208:23a::21)
 by MW4PR10MB6559.namprd10.prod.outlook.com (2603:10b6:303:228::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Wed, 26 Nov
 2025 12:19:56 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:23a:cafe::a5) by MN2PR03CA0016.outlook.office365.com
 (2603:10b6:208:23a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Wed,
 26 Nov 2025 12:19:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 12:19:54 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 06:19:47 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 26 Nov
 2025 06:19:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 26 Nov 2025 06:19:46 -0600
Received: from lelvem-mr06.itg.ti.com ([10.250.165.138])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AQCJcPl1202942;
	Wed, 26 Nov 2025 06:19:39 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <tiwai@suse.de>, <hansg@kernel.org>
CC: <ilpo.jarvinen@linux.intel.com>, <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>, <alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>, <13916275206@139.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <baojun.xu@ti.com>, <letitia.tsai@hp.com>
Subject: [PATCH v4 0/1] platform/x86: serial-multi-instantiate: ACPI example
 code
Date: Wed, 26 Nov 2025 20:19:10 +0800
Message-ID: <20251126121911.10980-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|MW4PR10MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: a1d017c4-2a02-4e19-703d-08de2ce61b87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rw+JzEQaUORC5MV8sWle7rPwsX+XAdCWyKGZxKI/sEMdUHcRvX/19h21AOZM?=
 =?us-ascii?Q?ZL+9ldBOwEl3Cy6yB+ZQD8D6eQ0y8vaIf2khmGVU6sndLXKkjanL+19wHQz3?=
 =?us-ascii?Q?iAfNKIAnXVzIZP84WFJpaGzYCxAN5Y4yuOT3gobxlBqswxI+MdAMHrlJFlir?=
 =?us-ascii?Q?A74gHVjb8FLNMV3sNjj0kum5YvGSWbKXaQhwND4VBcRjqugHdjJ6nrpqCPeE?=
 =?us-ascii?Q?9U0or+ofDfnMAgPHBK9qDHAPzYEkGYEGcpg9c0+YfKlzFRe388zvQqKPnL+t?=
 =?us-ascii?Q?yAW1ui8+UBB/5K3JfKx29qam+OLwkRroFUlKXxiVwDcYEOBuA0RADMY9rhBz?=
 =?us-ascii?Q?I3pBE6Tgrra/R/MAv/71KeBwdntDM9IKQMO1Qm/GEICr6p3ckLzaiwB4AReM?=
 =?us-ascii?Q?9wHSlIC05GFeZZnCrb43y3qdpJ/jqzYKUzKNQAR2P6h7fa7qnwbNRiswYD8H?=
 =?us-ascii?Q?UTflZehunLRBE9CPxjuWY6ytorJe9+d/5aRgCN5rjzJNyHip4uIadF5C55tI?=
 =?us-ascii?Q?GmZlYW0QpkSEogq0Mpc/wxp7dCn9W7R2Fdt8Oq0cKsSQFepTz11LQhB+i9JH?=
 =?us-ascii?Q?zKxBB/cshaT4dJhhjs++MrIOrEw+jDuJC+B6d1O/9nbE16CsBGX0CgIZzacT?=
 =?us-ascii?Q?QICFgBQ5FxjfXNUtNMmuSkvZLbLPjdCKj2NlgMgJ/nRDxdwtyBV2OhWe7qaI?=
 =?us-ascii?Q?JZjWsfB4CTRcQ1pARdw4y2RSy4N6FsjIYB52+5LB/M5Gwj3fwGgm6HKBiQ/a?=
 =?us-ascii?Q?odRsxYPsoTdjvbsPArp094HLOtdRDdOLr6jGe2tjB1ork05J7ZmNU2d9+G/q?=
 =?us-ascii?Q?h6PwfKT/ogXpXzAAJkzWNKPCDggdwFcZfcG0zGrwwuBixE8dyqWmaTN1eVjX?=
 =?us-ascii?Q?I3KIxH01Mh3ecmzcfMlcidG9ALY1BWzbl4XUoxm8AbeZ/Rhk22GPUP5nhrMU?=
 =?us-ascii?Q?z37b7xoJPQdFsd9Xl1n0uYfPgmnRTCE6x7LQxNoy8eoP0Dm1uwDuZzhD8OBG?=
 =?us-ascii?Q?lUVaquWr77lC2HvEZokEmTPzo245P6uDBFE37F9lI3nQmTCA5O0zYrdjVFPW?=
 =?us-ascii?Q?uuWDITNc7V0B0/ihzIyvdLZgXTspknOoLwI8OHY4YZdja8v0dc9BaNAUxgOE?=
 =?us-ascii?Q?JE7IlRcra6zByo40HUHKzJwueKLfNBWnGWZ/5enptTgwP/fT3/lhuUaR1CE1?=
 =?us-ascii?Q?n+R2vsH/2JQDZcOz658H+mI4kypVbwd5eHi0ANA5j2rw8XH5Okiw2Tn+ylQ4?=
 =?us-ascii?Q?THXwi+HHizjFoRVW2P942VmCFqG40OIp9302YBx0U7G2IkKMwQkSUexj7gLv?=
 =?us-ascii?Q?hVvwvCxtPu/xUqKOO9xVGP67B+zz/soaAoDwNt2gVTrpAh8yTdGxQoAs+K4l?=
 =?us-ascii?Q?3WhLlsDduZQg/gi0z7uD+MzW8e8W0iUqoMbYcykmvvLaAZuAZMuaV9JN/8VU?=
 =?us-ascii?Q?5A1ZHQLVolC+h8wrlY6PQZS0bgbNr82/xHZMGNHd0OiJ4sZYusXoJpds/U9v?=
 =?us-ascii?Q?oTppaPO+UK3fzJPaQmz15+fm/TI6bsgdWt8CIkEgfysd2Z9sY11YoZ4IJDBr?=
 =?us-ascii?Q?+IujTAJMZuA+29JLM28=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 12:19:54.8087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a1d017c4-2a02-4e19-703d-08de2ce61b87
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6559
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2PW37G6YXMCJT5KXAVVXBSDMXDAYBAAC
X-Message-ID-Hash: 2PW37G6YXMCJT5KXAVVXBSDMXDAYBAAC
X-Mailman-Approved-At: Wed, 26 Nov 2025 14:13:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2PW37G6YXMCJT5KXAVVXBSDMXDAYBAAC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The tas2781-hda supports multi-projects, In some projects,
GpioInt() was dropped due to no IRQ connection.
See the example code below:

But in smi_i2c_probe(), smi_spi_probe() (serial-multi-instantiate.c),
if looking for IRQ by smi_get_irq() fails, it will return an error,
will not add new device, and cause smi_probe() to fail:
[    2.356546] Serial bus multi instantiate pseudo device driver TXNW2781:00:
error -ENXIO: IRQ index 0 not found
[    2.356561] Serial bus multi instantiate pseudo device driver TXNW2781:00:
error -ENXIO: Error requesting irq at index 0

So need to add an exception case for these situations.
BTW, this patch will take effect on both I2C and SPI devices.

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

Baojun Xu (1):
  platform/x86: serial-multi-instantiate: Add IRQ_RESOURCE_OPT for IRQ
    missing projects

 drivers/platform/x86/serial-multi-instantiate.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
2.25.1

