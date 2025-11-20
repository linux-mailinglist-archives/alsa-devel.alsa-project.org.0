Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3D0C75793
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 17:52:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B80666025D;
	Thu, 20 Nov 2025 17:52:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B80666025D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763657567;
	bh=vVRT6YVyyNU2aF0vAoKK9tI1r7Mo7+GUQ6a9TA7xrVY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W12sel+XvjrtqTiRKTi3L3N6JxjMgrkJvl1PxMKXX+7um/TFD4LeakQocxkL0s5JL
	 F0aGq8IeaSqOhdUfb0quany6tm3CrMbWYDp7XhWj+XOZ/Qoik9hxL9TP83tRXW9P7O
	 292XALUixQEADk5fDthEywqpC9/HOAJtjcb5swsE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD70DF8064F; Thu, 20 Nov 2025 17:51:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05A3BF8063D;
	Thu, 20 Nov 2025 17:51:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9FDBF8021D; Thu, 20 Nov 2025 10:21:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010009.outbound.protection.outlook.com
 [52.101.193.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 247CFF8001E
	for <alsa-devel@alsa-project.org>; Thu, 20 Nov 2025 10:21:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 247CFF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=onMtblnJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sk6IxwbOQDireOj0sjVu/VY3McqMSqbfgcp6M17m0Kmt2xAIk+helSqfbTNjWKIqEOc8nSrTsUSZDw8Tgumq5wT/q4/CM04nzBNntKY5BSKIx3+zqfRkdl7PRgbbLNaUKOuROAUkdaHK6HH9W+xgRXz/hkEenhZPBhtNOTkJHpi4Y5dkETbJ5qWmlQKuggTJ0vCT11E+FZmMpnNI0cAluK4UlxJ+zqz3t/uKG0XvlVFipDmMW8KQ0SI5j/rCd4+r8JXHNICIqMekYuG3LnSkOPGFXObA0ucQCQ/Ph5OKtHKJW8LbBZ7UtMxVmU1UecRracqgdveClppeqlo/OV6ZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5XY9vOETRqYhI+d3AMr0jYsvoGjyUQ5smbzpFi0m0M=;
 b=Zxu2nTf6Kxv9MZgD+QupVJncs3bhSoDH5u3er8GQK6uYCdEvIB6xOxI5Ek3ry/q+z7IKsUXXXrw8bJ7pgnIckoswpHNVb2TTavzVPWgAxPqMk/BulTyziZNGSG7ZZ5l6iJJ3B+RcNLAy8XLiyVrqm+ZJ1XXw5oyoe6v5IA+pw0qzHz2djXgyw4l6EKxWbY15K6qBRKND4JtLH0UkeIl609GZ/PrDF0W4/Y/4b2Ze9cqR8fIJMuPs2LxmkStIdK03isylT4FP2Omtgmdu42onJY4fkpmN9BIYRbyjICBzhvEF14DG7XbXnHDQR55vmOGpaUEife1R9AvBdv+UabCFHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5XY9vOETRqYhI+d3AMr0jYsvoGjyUQ5smbzpFi0m0M=;
 b=onMtblnJ7SIJAd+rz5LpXB1hWBo6T0G5U4V38znWj7T70KHfy49Rz4sh75u8l+fA4KXJYWb/u8Uh8ybUclTlVg4PJ9KHR70jL+w3iVbwuX7Ybo5ZSDiBmMUByGJ7FqvxVc32S1QGQC9P3otleT2iZ0kvZt0TZWdTJr3giE1+yQ8=
Received: from BL1P223CA0043.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::9)
 by SJ5PPF6A2C0CCA1.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7a4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 09:21:41 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:5b6:cafe::4d) by BL1P223CA0043.outlook.office365.com
 (2603:10b6:208:5b6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 09:21:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 09:21:39 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:21:34 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 03:21:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 03:21:33 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.133.122])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AK9L1c43383883;
	Thu, 20 Nov 2025 03:21:28 -0600
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
Subject: [PATCH v1 4/8] ASoC: tas2783A: fix error log for calibration data
Date: Thu, 20 Nov 2025 14:50:46 +0530
Message-ID: <20251120092050.1218-4-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20251120092050.1218-1-niranjan.hy@ti.com>
References: <20251120092050.1218-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|SJ5PPF6A2C0CCA1:EE_
X-MS-Office365-Filtering-Correlation-Id: ba830e5d-aadf-4260-f27f-08de2816363c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QqtfUJqdXTY5in/xvh+RweRcX8REV5uG4/GUOxG2ai8KdazdpXo8PjBNkdRc?=
 =?us-ascii?Q?v9vn8++ev1enrujbAIvMk11UHD00pB4+888sPbnfSn91f/nhi/uIpTiblA5j?=
 =?us-ascii?Q?dse3dYsUtF06/iaNm3z1/H7if00GquavWaZjrU1F4Y+AToUbrfD4rvynVf9e?=
 =?us-ascii?Q?9rWmoigEIWw45WIqtsc00VUy27slyUuDC/EZvN8uWO5u0/g0EF3o90NHZXoo?=
 =?us-ascii?Q?vZh128OzyTcVCBiBZcNH+kGLL2O7GHo0h8DpKvJG15zobXO2DD4kjupWFMSP?=
 =?us-ascii?Q?oLWbnPtJil7Of4McfpSLXh37+JVzo06p0dUBJo7s8pDkXL+UhYZnypUZ2QPe?=
 =?us-ascii?Q?fMw0mL+KJ4cvqb8kKs4EAnthMwxBRW7iUm7v03gF5L2ppnsc9VjF9PhqTAxc?=
 =?us-ascii?Q?q0eQ9moWo4JcKxglOae3EidXeRc6KvjxSA8UZn0kwy5onbbAJ5FSxnhMr1kG?=
 =?us-ascii?Q?XwhZZ3ladu9ixzU36Yacs0+ZeHIlo+zc8qEaSjpKxxmKe3DyhTQCA8a9tnhZ?=
 =?us-ascii?Q?xktZcUqS1xJ1IntmyIxjctXFcG3RfmmwhyMhn1v3Gbly2YTD699NSFkjlv40?=
 =?us-ascii?Q?I6OfgQfS2XRlXLerFaDkt/0TNDRXAg6xQ6UCLA5QD23CTUh2y0xxd2LT2/Dm?=
 =?us-ascii?Q?pWRB97vw3Dyyy582Pu99gtDz9PRVR8duFmfq/FMydOeXOWw+T93/kbbeOZ/2?=
 =?us-ascii?Q?LhJdi6Jbl4iUp76nH0H1+R/+hYb97oylV6iYpoaK1PSGldlndUX2RdiolmO7?=
 =?us-ascii?Q?Ppvq4qAcneQw0+tSGvDINfJWiVW3dP+xDTSssVb7Cu8nIN6l+Z4eITLt+Y8r?=
 =?us-ascii?Q?TRvNsP9l11SttouG4ALYaLjEkTUOqInEq2ocDwvE2YLaLRwoel4uhTxjCtN/?=
 =?us-ascii?Q?/6RIfVrZwfz6AKgNdMppttDEtocdx3wAgP/z3ByqHqMIxCZRjTQ+28XSg2DN?=
 =?us-ascii?Q?zPzA4bGhxoKOFlb0CGvQMcy4IqMDVQDDK9CsRBFSLKrL5CwOuAKHqJKtnfDF?=
 =?us-ascii?Q?n/nZ/+gUZ23ilZFBh+4p5TeEVcbiMOLtVzhiMlNfTZMQbmyYsWKS2iKgOZPJ?=
 =?us-ascii?Q?9KarQHGZevgzk1kB1qyu4+VrHPGG6IMTvDOmwJ+z6SJzBjTXgOGAqDOZR6fY?=
 =?us-ascii?Q?8rEraudUre496rtPgBVDoh2IYKXFFSCFGrVwE6NL0E8VT8/4u9zPyejVqAq8?=
 =?us-ascii?Q?4BNcA9VlLl+g+avQ09CH9fbmc0tWF10axt+PZe2r8ph2byEQZi6Oc23LB/xL?=
 =?us-ascii?Q?2ORIAo9g7K0rRCGszYN8JfQ3sxRIdfZHN/MYhcrJqW+n5Hf72FQSh7OGeQVZ?=
 =?us-ascii?Q?Rk77bGhH02E02jclPxj5stfYT/VpdrStZRJqPqJtwoCsRiNwgBzwyuuMoTQs?=
 =?us-ascii?Q?RIf+XEpiBij+CBqWlLGy78eImJwiqIyIXCCYdf5TD9CbTLA0QjiMWxlQJFAc?=
 =?us-ascii?Q?8UUPg+P1CGDH+3t9mcx5jNepQ/hlzX1BD6R7O8prjTXtnO448T7DCeahYhfY?=
 =?us-ascii?Q?GXrcZyX/mrpSXmSkwEZfWM7cvWd4wcyt2coIDRaCMBpehNIqznRfGA03BZfy?=
 =?us-ascii?Q?nq4+KmILpcOMB/fMeIM=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:21:39.6271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ba830e5d-aadf-4260-f27f-08de2816363c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6A2C0CCA1
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FO5TFXUTJ42EIF76WABQIGK7FC3HF7KR
X-Message-ID-Hash: FO5TFXUTJ42EIF76WABQIGK7FC3HF7KR
X-Mailman-Approved-At: Thu, 20 Nov 2025 16:51:12 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FO5TFXUTJ42EIF76WABQIGK7FC3HF7KR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently when the calibration is not foun, it is wrongly
logged as device is not found. Fix this error message to
indicate that calibration data is not valid instead.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/codecs/tas2783-sdw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index bfa925dd6..397442cd6 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -635,7 +635,8 @@ static void tas2783_set_calib_params_to_device(struct tas2783_prv *tas_dev, u32
 	}
 
 	if (device_num == dev_count)
-		dev_err(tas_dev->dev, "device not found\n");
+		dev_err(tas_dev->dev,
+			"unique id not found in the calib data\n");
 	else
 		dev_dbg(tas_dev->dev, "calib data update done\n");
 }
-- 
2.25.1

