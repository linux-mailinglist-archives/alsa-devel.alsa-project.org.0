Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C500BCC6B9F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Dec 2025 10:11:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 545696024D;
	Wed, 17 Dec 2025 10:11:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 545696024D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765962702;
	bh=HEa7dQfd3QzYfM0XggL6DRYS60BZUYYSSPhEQFzhYME=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jsE7nuURFAMMRGA1HxIN3jHAaTNxu59zcoP1DFBNIYs7s9P7/yKMHFs9qNVFNMOyM
	 TznH0PF/6Z0I/AIrZ3QhbYZm3ssQAKpbnBNdE/C1fAfEldG+sP8SsfCsrZDTmz6l2p
	 mOwkN1aGC+s256l4zXqx5pNMyvGNqWqZop+36Nj4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DE9AF8068E; Wed, 17 Dec 2025 10:10:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B825FF80687;
	Wed, 17 Dec 2025 10:10:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BC34F80169; Mon, 15 Dec 2025 16:33:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012036.outbound.protection.outlook.com [40.107.209.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9256F800BA
	for <alsa-devel@alsa-project.org>; Mon, 15 Dec 2025 16:33:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9256F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=C/UhFy6B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4tZV9jg0fVR++UGn0/Xja8w9mAnIvrmy10V73uEcrA9ZFwDbTr6yRPK2GfT59jpwaoyBwvOTWSexcB7+MOn+S5F6YUzpaIl+oHI9msujx3CNRPh8pSnD/mGw4pfrQgkBj+kwIsnpxqA0bMi2kYS0Upw6i6wAGx0QCr+kQRWvlUdJqay1EeV0y9tptchxRY4w7gAaOOi9dEV7yy0UAzis7rVVbMpl3YLAXVBdXYXJYhsGA7fBZf+RU1Ei3Ygcnad7Pl9vB6OW+mYsvQdzVYLLA3Mtv1vIy/aZm5tlh4eCSM3XqYsVoPNyMev2M6voWWSath34WaK756bNHDDoEAz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PX0se+K2gD6NCPWyKk+dho6hXZNCI+779Ge6hgv5D9Q=;
 b=jMQ5xTtfpRG0a4DfDW7wl5DJGbmAhkY+gBPj9QbTicZC3T+sXwoFxPMc4MjoP8XgKWLckbOJ+HYD9ay38B7HTHEW5Nbg8bxCZSFiuTOdDYaY3wkDIvr3fNrnUZ5KaTh72fXUxgeLpj7kVpBQIy36flitO0Vfp9GTc03rQ4GEryOxe8l9MJlBsmLKNVyR0z2cFg5wxLr8vCIisPIAVB3op2f/rvrCgXw2vNbxy6OSi/lSpDPX0khEB8tczE3I+KPuSFnr0P7bPp29F2qcpzv+fMtPuRnGJKK1mU35TUIegblybbtDzt36yTr8BD4Q+3v0CoSeD9mh5YKxn1x0vZy1ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PX0se+K2gD6NCPWyKk+dho6hXZNCI+779Ge6hgv5D9Q=;
 b=C/UhFy6BntgjqGE7C2/J+zqf5rSAPGSV/nljh55pgD3bsXrU+NonaMq6ol03d4pULyWuhaO1k7O4ITJScoy0YBWe2a2hCwTm/nzRft9j9YuWHB3sQ3pe0+9G3UMv623bIlmPyViJXWwh1s4WNi6gpiWC5t3MMYkykiiwKgvZITY=
Received: from CH0PR03CA0021.namprd03.prod.outlook.com (2603:10b6:610:b0::26)
 by BY5PR10MB4115.namprd10.prod.outlook.com (2603:10b6:a03:213::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:33:03 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::67) by CH0PR03CA0021.outlook.office365.com
 (2603:10b6:610:b0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 15:33:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 15:33:02 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:33:00 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 09:33:00 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 09:33:00 -0600
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFFWTtY2639809;
	Mon, 15 Dec 2025 09:32:55 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <linux-sound@vger.kernel.org>, <broonie@kernel.org>,
	<ckeepax@opensource.cirrus.com>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <shenghao-ding@ti.com>,
	<v-hampiholi@ti.com>, <baojun.xu@ti.com>, <dan.carpenter@linaro.org>,
	<sandeepk@ti.com>, Niranjan H Y <niranjan.hy@ti.com>
Subject: [PATCH v2 5/8] ASoc: tas2783A: fw name based on system details
Date: Mon, 15 Dec 2025 21:02:16 +0530
Message-ID: <20251215153219.810-5-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20251215153219.810-1-niranjan.hy@ti.com>
References: <20251215153219.810-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|BY5PR10MB4115:EE_
X-MS-Office365-Filtering-Correlation-Id: bdad573f-7ecc-4b02-b02e-08de3bef3c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KN2Fyjcb6I+7ObAhxtwLrYdIviENXQtbQ9GN6Nty8J8UwBs0DV68gPBW1LI4?=
 =?us-ascii?Q?HpLeEuAknasQpPRd+VTdnEvexfnbIsJ+QjLKrAC3DGYt7SNWzm/8Ke4JC6dW?=
 =?us-ascii?Q?DtipVExCcLSxWJTUAoAeAscUcsPwAMRbck/FT7CXa9HutfQAgTPTFG+Bk2ds?=
 =?us-ascii?Q?vb+a5KYb75LHm2zWKlokFk4zR7hty2yU8ChKI0H8VkY0jNX5fj0Z3BQ16sTV?=
 =?us-ascii?Q?oJOiyJAirNnVTb13f1Lsp5xxSqJJpMsUNF6i3JJrJriQ2cmQT4zGD9dvJ4Yi?=
 =?us-ascii?Q?Z/1z0LjizX4e237dCIELtzgZUrphIzJDdwnlqu2qRNWl3mgbP4sonIksweEY?=
 =?us-ascii?Q?jmjYLeSmGZC7RLCHMnjui6Ad1XCokVmp8ib+fFwJmUjOj4uDmPdPs62jvKkU?=
 =?us-ascii?Q?t8F2A27oFepabvehzRdIjnTyqnAq/pdtDMQSphfxfKUewtZQ4cVe//sYeSjT?=
 =?us-ascii?Q?5KNIiNU/iKQk3qkTCjPOQP5CiF7sy0/QqhqYzKxjJD7iohH/700uxDNkx32I?=
 =?us-ascii?Q?8iCSKhp5pw/eILuC3D1lVHk6YOgt9dh91nV/RKgPC8+eRyvEC99pXY8m7p3W?=
 =?us-ascii?Q?OTHCc8vbIDj4PuqNjrGx1MTuc4+bFI99VfZRAnxX/qQod7bcmqPlRrKkiJVd?=
 =?us-ascii?Q?qJ8abqy2SnLEux6+eNxK4zbuJIECh8xub/ysgT/O1EQCzAjIewjpbwgfh2X/?=
 =?us-ascii?Q?smy6f8wpWnuT4+sKT0onQQbx+ivlz07eHeTcI0PIOtzD7xEd4wGtfop1b3kq?=
 =?us-ascii?Q?YmH4igpVu3nPfNjRQ25fl+xiC7EE9XeNWOgl2c3K06xixeu+ui0JDAoxehQh?=
 =?us-ascii?Q?fUrFVGc8OS6pN3NqwVHs3hF2hcvUk9GGUgR9srf65ybT2VjuDO/axqU6OfQY?=
 =?us-ascii?Q?1IpQswHOdeOvGtyBND57go1AjvfI/xIGlJ0nhNS+a+SGO/R0W3RKoqXU5xbc?=
 =?us-ascii?Q?Cg2+1PKmdnrhrTmu7RUT/Xb5h1Gr17qpzPFMYFr6E+o54NG9wLyxBWPkc/aW?=
 =?us-ascii?Q?e89oaypjAvRZbrkSR6jx2x5vXv/UjaXozSIynVEDJ4vQaGHf654eidVfoHPb?=
 =?us-ascii?Q?6I96gOWWAyOx5k8zl4jH/sK3JHAeaK+xbhojudBX6ky+BQXh3ZS4c79FNE77?=
 =?us-ascii?Q?qdufRRfWpj4q8s/AQkbmvDvxuiwoQLQWDlgaRb4nWTjl2JYSQeXVkIQSsKC2?=
 =?us-ascii?Q?22vQbGTdkIebG1Vp1HgwwezgqfTcEZZ/Xr6fQL7Fc995JCOt9yK5Uy7EahO+?=
 =?us-ascii?Q?cwiPGUW0QYBzbfyBuuh1vXdZjUH+7r9Zs8fGv+L+lt3sN4L1yhGdxacs0iTd?=
 =?us-ascii?Q?QPE5G4rLDZPBbMXa0R7mPf3EH9CBWm6g7liL86UhBcnP6Th/e4Eh4i+Pc9fO?=
 =?us-ascii?Q?Y1jkr9sxV9sLdizT3JMhB9ODS2zFCUyj2Ff21eq52jeoXjs1RN5h0ON9qHXg?=
 =?us-ascii?Q?vqvNOqVZz/m2apCbGSaAy6M45H+io8C9SMtvwpbHTD+fBy5gR8WmGYYaVuoT?=
 =?us-ascii?Q?8PB16ZGwRuo32xj6FsfL2NVmmUfO+XUHoD1DCQt4hdvZI4SGZK7d8UlYjxsp?=
 =?us-ascii?Q?yuyUBQyYva/MYYDqa7k=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:33:02.6811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bdad573f-7ecc-4b02-b02e-08de3bef3c43
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4115
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7VNJYBRUC3XUGVOZKWJBS3RNYNBHUBGD
X-Message-ID-Hash: 7VNJYBRUC3XUGVOZKWJBS3RNYNBHUBGD
X-Mailman-Approved-At: Wed, 17 Dec 2025 09:09:57 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7VNJYBRUC3XUGVOZKWJBS3RNYNBHUBGD/>
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
v2:
- no change
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
2.43.0

