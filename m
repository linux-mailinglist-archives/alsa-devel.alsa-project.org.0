Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2A2C75796
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 17:53:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F138F60262;
	Thu, 20 Nov 2025 17:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F138F60262
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763657587;
	bh=F/00U6r6QTOQo2Hk90gTihBivuh252BkrXrbxx5YNJE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=akU/T4Izx2wAmTFutOvMptttdhZ4zINgrxj2lWc4pfN7YMLc+Ki2E7RCiuI60KDf3
	 dcg6vmLn1mCI15oDNpWKuT+HgzxUJa5bsXPWfZCj3AhutE2KpJ9QxhV+zVqR2RG+2I
	 fG9ck35xRdtq8MgmC84pQa43fCRC4OY1uQkl9ZEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE5D0F80680; Thu, 20 Nov 2025 17:51:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 873E6F80678;
	Thu, 20 Nov 2025 17:51:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13209F8021D; Thu, 20 Nov 2025 10:21:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012016.outbound.protection.outlook.com
 [40.93.195.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93FABF8001E
	for <alsa-devel@alsa-project.org>; Thu, 20 Nov 2025 10:21:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93FABF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=T+d6Que6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6AeLsETLFLgvH/yqdkzCDa1R6gCEKZls7Xgb9VF+NqY8KrkrugVjVTqxBUKrE/nXSMz7zVxmwRIgGXKO2TMD4FEAaib41XAAafBF5Vs4Mcwwmn3eB8+cv9iMBV/0DirPzpnY1hAAL1fS3Mj8qQCdgDyX8lqX+HZAAYCaD001d8ei3alz25YkmaK8njQIt4EgqLSJ4FKupSEwelyP18CYyntxGeRCjFPEvYXZ9acS16yNov7MnZGu4dfuYkbALbb31bc4rw1qGuqC8aPZT8efxa6l4TlKbkk7BFIC8/W31nI/OwVRRR5t4mYhk1dDGXRdifdkW7wCz0xOi4QYZtMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VIS2eLeAsRp4qR7J3UbolPVmnCJDdx6upuP8ymLtQek=;
 b=ilv0MlIxvamkS86VOe/sjdgS8XfsIXwkYjs3/9/K+FH3Kj5hDf8OiB2wR8R/Sl1GJNuTmte6yTzfOzMVc/GdVZgvu+j9wA8aYOnDCVjX6jHzEMjwSryw9dx52Gg0FA1V2DpsWHGWe+8nn+W/WzbXGXtXx2GqkxRvjVfzKQMRRtGroJ1wUWlyOlZC/S2K1rONU98ZSQ5g/lFWlGvO56m5uUhDgpDDX3EqXMbZ2Juqt58V91xUdcW+XMGsi2yDONPmetlzZ2/OrxJGZlkTWv8V/coHB5mimTmmev9N4y7O0GmdXs68Z2FFW3TK4p5z5qwQ+Y/nru12s1ieFr9n/klhsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIS2eLeAsRp4qR7J3UbolPVmnCJDdx6upuP8ymLtQek=;
 b=T+d6Que61m3u/Dic6KYY2e1KXrx4vbAtTX8Q140UswXSq6QgYs3bAJYmfSZgGxRj0vR2baZ3nvQZemnts/yjs49jw70mQmqxanMTCAvEZAzaNz42tCs+6OQTy6fJrofAD7F8mTMjzaMhdrNctC5HrWGqlCAN3N3sjhzsQxIEPY0=
Received: from SJ0PR03CA0138.namprd03.prod.outlook.com (2603:10b6:a03:33c::23)
 by PH3PPFB6E8A1B1E.namprd10.prod.outlook.com (2603:10b6:518:1::7c2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 09:21:51 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::8e) by SJ0PR03CA0138.outlook.office365.com
 (2603:10b6:a03:33c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 09:21:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 09:21:49 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:21:43 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:21:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 03:21:42 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.133.122])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK9L1c53383883;
	Thu, 20 Nov 2025 03:21:37 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <ckeepax@opensource.cirrus.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <navada@ti.com>, <shenghao-ding@ti.com>,
	<v-hampiholi@ti.com>, <baojun.xu@ti.com>, <dan.carpenter@linaro.org>,
	Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v1 5/8] ASoc: tas2783A: fw name based on system details
Date: Thu, 20 Nov 2025 14:50:47 +0530
Message-ID: <20251120092050.1218-5-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20251120092050.1218-1-niranjan.hy@ti.com>
References: <20251120092050.1218-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|PH3PPFB6E8A1B1E:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c0336e8-0012-4ca9-3fa6-08de28163c54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WazA/YRJ0VMX3rAZW+WVTsVe00Y+K//xCMWFmgl38H/yvG9kDVdyLHEEEOop?=
 =?us-ascii?Q?+3v5H3wsh9gIiUkRNMzwZd/dHMYt1HR6zBIOjPfpF07zylxyfvqQgUgJbBZm?=
 =?us-ascii?Q?4h498F1MPJUWnApC36lkefbvzbIKKUDKOs6PsKAlifGfFoDGg4JQg9aeQtOx?=
 =?us-ascii?Q?Ne2kEOX9ehGs6hE9fv2m/Wr8eKpu+rzyIbjA7OZcxfDTNYHmyS/WeZPFMjbt?=
 =?us-ascii?Q?ltak/P+24T6vt05Cul13z3NnOKLVbLLpMjlEYfdoGnJyzuRfpMGHEogMl/wt?=
 =?us-ascii?Q?fNUKfI0pA/yhC3YwI2qTLEMBPmcRemxQc1uERD+XtqBgh21TmvGHdMzWLc5h?=
 =?us-ascii?Q?ZpE114rJTNk3nX94rPCtMUUK0xJ4tDzw+8048HfIC2OmrjkKLBkIiC7YjJwG?=
 =?us-ascii?Q?wSE5XOkCfNVeyO7vH4UCyPOu4WlctlIxqrPmtYH64tnBCjKH7BFTgU4kwqcQ?=
 =?us-ascii?Q?xkMQjTH7aUa1kAUvLiC8BtxgjF4H+FwcDb3TtbO/+SF+7fF/2thNBN8QS4AM?=
 =?us-ascii?Q?EQhTlab+TwNIt/ScGb3LZe5X+pw2RyqoaXWKyIwfLJ1FYEXZn5lJ0khILaUH?=
 =?us-ascii?Q?nHdn4/cUPEUATQNDs0e4OutkagwHoaucjE7oImn+i+YqXwn7x5u8Cj2OnLji?=
 =?us-ascii?Q?ouVyFVRpnxmGneTqV0sZB2WEUQO4XtDPQ776q5nTbWR8BvvQU+lWgFvdh4qV?=
 =?us-ascii?Q?/RmwEKFIcz393HLGx2HkYMk4LULHIDUOrNvOWzKQr7n2uM6uWDZKV7UvnDo5?=
 =?us-ascii?Q?etuhx0D42G4MGEBwTT664/U08MVqRtDKqn80Bj1UTvonbTBNG7WPOFYJJjM0?=
 =?us-ascii?Q?t/HyeHXPNfkIXWSV4fu17uEYL1NzyGN3i9rQ4s2o4kJcmgoyEjW2wsG8nSDM?=
 =?us-ascii?Q?HqBLpLsZlNc5V3vZUlGIe/dRtDV1RQXfmixYNY3M9BqzAR/1vvpbiXE04fGU?=
 =?us-ascii?Q?VUSZE0+HGHvqazGQgyvNOuokYrGvJgl6+3l9kmFbZ4bGEKdpRHJ61FyfWems?=
 =?us-ascii?Q?cJaXtkJaMitm4d6dy0vLLtC6i8mvcTI+t7y70OKrWLF3RUnxKOKIiVLgpPKA?=
 =?us-ascii?Q?TuPa2qEyL7+Diog0JbgZYA3vnoRPbuijyEFbvyQd8W8LLjx2+z3fWIFv7rXk?=
 =?us-ascii?Q?XXAl+ZAs/G1LIYFEX1ErOuwcPMZROc/cL8uOUbLBhHBTTzjYEoe2crnSQjyY?=
 =?us-ascii?Q?Q7oMkU5pxGuP1D7xYpPHEO6//j5W9Q/CY+no7xXU98rZwjCkXvYVckTZGlfX?=
 =?us-ascii?Q?PORKydJWEKIxUctD/dLZ65xMx24AnQHp67LrvS6mAWZeRobfl2eFmzolA3qP?=
 =?us-ascii?Q?l3+tWZ2CT8IZnQVolRmyMIjz8Ds2AxfNxICPXMY3VU3wc/AvYqFtftQmq+L+?=
 =?us-ascii?Q?Q0/zCqVTG9oChz3TBQH0NXRJ+efdktSrHOOmJwW5gIL8kfCQbdbdpKOyMSWw?=
 =?us-ascii?Q?s208FnfvS/lQ5AFWDLLafsgmiQHzp7Hgh62Qoqdlrnrb63nI+SK/SOo85i60?=
 =?us-ascii?Q?QEQa4W/ykvmZ4WjXS5J/5UxPDJVtIWLtkY5inw0fwcO1AlwBhyIZDJiE2s6R?=
 =?us-ascii?Q?EdxHY+dUB9y13MLs8NE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:21:49.8375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5c0336e8-0012-4ca9-3fa6-08de28163c54
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFB6E8A1B1E
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3CK4TRPIF7WBYBJBIQX2U355WE7B5PPA
X-Message-ID-Hash: 3CK4TRPIF7WBYBJBIQX2U355WE7B5PPA
X-Mailman-Approved-At: Thu, 20 Nov 2025 16:51:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CK4TRPIF7WBYBJBIQX2U355WE7B5PPA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

  The firmware file for tas2783A contains the device
and algorithm settings. So the firmware files are unique
for a system and driver should have the ability to
distinctly identify and pick the right firmware.

This commit adds the method to uniquely identify the
firmware for a system based on the below format.
 <Subsystem>-<Link>-<Unique>.bin

* Subsystem is the PCI device subsystem-id
* Link is the SoundWire link id on which the device recides.
* Unique is the SoundWire slave unique id in the system.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/codecs/tas2783-sdw.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 397442cd6..adfbccedb 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -27,6 +27,7 @@
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw_type.h>
+#include <linux/pci.h>
 #include <sound/sdw.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
@@ -1162,8 +1163,21 @@ static const struct dev_pm_ops tas2783_sdca_pm = {
 	RUNTIME_PM_OPS(tas2783_sdca_dev_suspend, tas2783_sdca_dev_resume, NULL)
 };
 
+static struct pci_dev *tas_get_pci_dev(struct sdw_slave *peripheral)
+{
+	struct device *dev = &peripheral->dev;
+
+	for (; dev; dev = dev->parent)
+		if (dev->bus == &pci_bus_type)
+			return to_pci_dev(dev);
+
+	return NULL;
+}
+
 static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 {
+	struct pci_dev *pci;
+	struct sdw_bus *bus;
 	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
 	s32 ret;
 	u8 unique_id = tas_dev->sdw_peripheral->id.unique_id;
@@ -1171,6 +1185,13 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 	if (tas_dev->hw_init)
 		return 0;
 
+	pci = tas_get_pci_dev(slave);
+	if (!pci) {
+		dev_err(dev, "pci device id can't be read");
+		return -EINVAL;
+	}
+
+	bus = slave->bus;
 	tas_dev->fw_dl_task_done = false;
 	tas_dev->fw_dl_success = false;
 
@@ -1181,8 +1202,10 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 	}
 	usleep_range(2000, 2200);
 
+	/* subsystem_id-link_id-unique_id */
 	scnprintf(tas_dev->rca_binaryname, sizeof(tas_dev->rca_binaryname),
-		  "tas2783-%01x.bin", unique_id);
+		  "%04X-%1X-%1X.bin", pci->subsystem_device, bus->link_id,
+		  unique_id);
 
 	ret = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
 				      tas_dev->rca_binaryname, tas_dev->dev,
-- 
2.25.1

