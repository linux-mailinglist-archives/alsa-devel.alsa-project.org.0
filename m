Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B185C8A3A4
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Nov 2025 15:12:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C304260203;
	Wed, 26 Nov 2025 15:12:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C304260203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764166375;
	bh=oUoY8kJoctcG5kL+W0Prbzsp2QBc9tcNO8/24VC+A7g=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Eugj72RLfk3HwtP/QgYTZ0Ug9Wg0dPhn48py1pVfkVWj1/h+T0s5zNhM9xXIYXS1a
	 9akLQsToNQQVSuS3tMS4MIgtnqSmkC3YaBkicbCf+o3uGgPqPWDBDOJq6sTB9aCR8/
	 TV/JYGL+6zDtKoUY8B64qEdrqAH39KgKdw7vrECk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 721BFF80623; Wed, 26 Nov 2025 15:12:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE053F80610;
	Wed, 26 Nov 2025 15:12:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6DFDF8026A; Mon, 24 Nov 2025 04:16:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012030.outbound.protection.outlook.com
 [40.93.195.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC233F8016E
	for <alsa-devel@alsa-project.org>; Mon, 24 Nov 2025 04:16:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC233F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=u1EqCm1s
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOSz/GQvFWt0Nis9lwqixXfPc1Zit7eVE/3QjPBQIgusH8aTkhoBkHHfLPiHr4uIVbmBDXfOMLvTNY7v/oR6PZTa3nfh00QaOnrcqqlYTvUvNXVZUY+8Sn3JXn1jdnKAVqO/M1dg1//BbQy34sy1sL7C+VRYTyrENdiDpAAZVxPfvpFfDBfoXbqSg7kzkzvBtCgqQOn6nDXz0r0FU9Ndt6R9IMl0ciVwRTIk2dkYnh50obTJg8VGROXbIp9vAnrsv1Gxg7W22RG/sYy+7B/Mz+K33eZgN5RRnBeCFrHcMZQzIxorIifc6YaZMK4/uUn1J6WWSmmDkZWnl7SI0eF/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUFcpG3+TdKUE7bR2QiYpXdDCZ2Qkz+igTsb7D/YlMw=;
 b=XtLsRBMEFlVSkY26aGnIzHcNYUZS7zgGbSySUPNMq8UJ9hTkZju/xp5Ftvm155M84GLst72477NmI5KDl7fw1Qc+hW/M7U6XAkqI/ijMmUQau4jXHoTVMNuQ147g/nZJegB9409RQ6En31wfi0pRKpbrCyFTlaTG4TIzQLfpnRRH1SVv0mq/C6HAbxwTkPr+R6yep47dHmyrJrqmOxBGw9kHmIAbrGBJaaoBNa4tkYbjt9kuoozh8ZLl+vqBl7MfV2Ssf5De6uxXOj2Pmy+3Y4lXCFjCjeSd2KVlno8Rk9tMeEsxg3Yb1MkqqCbV4k5uUb6EPRBC7W9JfWzuuAr1aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUFcpG3+TdKUE7bR2QiYpXdDCZ2Qkz+igTsb7D/YlMw=;
 b=u1EqCm1s6WETowSpsjRb6hLRfmA8N76KOhlCcDsF3fYzGjGWLh6lUutPsMGQhmScVkBQbZaj7rLCmWOuC72rtbcZziiO9BhbivqT0IRN5VJWrCk5CX23X6JXCmNE6kGv/fOB4TJJk0I4huiW85i0vdERZVxCEIRgLne+XrbndXM=
Received: from BLAPR05CA0025.namprd05.prod.outlook.com (2603:10b6:208:335::6)
 by CH3PR10MB7908.namprd10.prod.outlook.com (2603:10b6:610:1d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.16; Mon, 24 Nov
 2025 03:16:14 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:335:cafe::2c) by BLAPR05CA0025.outlook.office365.com
 (2603:10b6:208:335::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.9 via Frontend Transport; Mon,
 24 Nov 2025 03:16:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 03:16:13 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 23 Nov
 2025 21:16:12 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 23 Nov
 2025 21:16:12 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 23 Nov 2025 21:16:12 -0600
Received: from lelvem-mr06.itg.ti.com ([10.250.165.138])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AO3G6RB1250695;
	Sun, 23 Nov 2025 21:16:07 -0600
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <andriy.shevchenko@linux.intel.com>,
	<13916275206@139.com>, <alsa-devel@alsa-project.org>, <shenghao-ding@ti.com>,
	<baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <k-yi@ti.com>, <henry.lo@ti.com>,
	<robinchen@ti.com>, <will-wang@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Correct the wrong chip ID for reset
 variable check
Date: Mon, 24 Nov 2025 11:15:42 +0800
Message-ID: <20251124031542.2793-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|CH3PR10MB7908:EE_
X-MS-Office365-Filtering-Correlation-Id: 658f0857-257b-406c-54d3-08de2b07d322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3wqex7GTtom9fwE6tH7eCpaNbkSrDR4upEpbcUs5jBiGmJwTKEY3yEdFB4BB?=
 =?us-ascii?Q?aYyfwyEsEcdSdKdMbkw8NVmAdY2ZGiiQ+1PL18oy3+KfkkLk5BYJ0gPv3ALW?=
 =?us-ascii?Q?TEJ3qUcZ1Z7G37mLLWRXbe0e1tkd6mC+feZDcgm12JVJO86keuzlUd6Gq9A7?=
 =?us-ascii?Q?nDYoHHYhQ/YQeaff5bxbv3R+YyfK+eI+UUr+mDqOCiwe3JngdwONufZV3IPT?=
 =?us-ascii?Q?nV4i7NZivLECn5goJcjKLidE6F4F0yFnOexuSF7TjdRXnuOzxwwrZ3HNvFNC?=
 =?us-ascii?Q?+k7fHWj2W+wi4rCR4rCkdGl4mc2/voRyVHk2MG0gGLATHKFH+VCjsN+P9sg4?=
 =?us-ascii?Q?So+dOoIbB0RvTlJxb1Ngz/RTF2jVmRyX5bAiCXbDQQo77ObUPS+FmJ8rg/9G?=
 =?us-ascii?Q?h4peiPGk2J9h8p9QnKWdabYG5IG12ADnc9FzHMuuPEKYwetY27xnRCCobx5k?=
 =?us-ascii?Q?vc7dV+11GsZfVmaBynqfKIE6sUw8VyRrrwgxDSRpiF5Gu7nHq0ucae9iP7ZV?=
 =?us-ascii?Q?wqenIyTohWw5d75KwpBhqjlDEgSjvMibRN/eYx/CkpBFE26m+Tj1LIimMygE?=
 =?us-ascii?Q?NwBfx0PC84Vnc3CZdYwWrJc7/x9N4W8wr/09KJ8jQmgBzlQEp68SHmNcGdV8?=
 =?us-ascii?Q?Lqvb7R/2E6DM4rW+jaCFmY2QropZpX45eS5Pq2GIojFKfab4c6shl8SQ9w2+?=
 =?us-ascii?Q?pAWL+AKZ4+j9WmKbdy8F5IVK9U8uLCQ3MBYMyKpv0xKNIulocUvkiaE+XaZs?=
 =?us-ascii?Q?qr87QOjMZg2KIEY6lmrnagNa3tQzWsJMeAdEu2fqwOw+yY6MX08It/woEOjy?=
 =?us-ascii?Q?GAALC6LKPccvuxuwBKCqLYVa9/6jPWFsQJaVIul2Flv9d5NfGx5DXkzyfFYh?=
 =?us-ascii?Q?yooEF8yT9fs34wXOZqahB3Q9lDzP8WtguKk9FPUVXwIK5N1Qaj7IFsHNPZSq?=
 =?us-ascii?Q?YVvTGqAuFlCvl9tgtGd/jhz310QBSX63djuZ4xzHKHXI0Z2Woiqz8/cVhPBb?=
 =?us-ascii?Q?ZU7qq3+31K6ubCYA39fKffw798m4QT1meUlbJq3BfLovjB+uM6pb5rTBvL2J?=
 =?us-ascii?Q?Pcsc4a9HdNp91EqYxjW+2cDewsmW1UXMvY0Akhlcoe/XRFlav90wDtDnPRxS?=
 =?us-ascii?Q?zVEhOnTlTu26VPxMMTMXjZDcOcL01hZUMTmWqCGiPH5J+zIo5kmu4FLJwjlX?=
 =?us-ascii?Q?QGaGjmXy67RnfyJwP262NoQXD0F9c5Rr1zUWlQ+mVmaZwkF/XxtRW+fWXVj/?=
 =?us-ascii?Q?/TgoTUX7lFW9VlabqWnkjiNCP9BYBJ///pz/Qg32qSBueJErpo8wrCkMczuK?=
 =?us-ascii?Q?bdTIivVw2cgLEoudHers7gYpiHNZpU5PecXW4Mahkcb43p7YPLtmUcyIQwQu?=
 =?us-ascii?Q?riIK/bU32AeSkk5kP755wBp+dla80hXKt3PeWIEfOvKzqM4LZgHmKyGbJW+d?=
 =?us-ascii?Q?IV2zysJCkzxemxUIh9vkeKl3XSp18L6HnzTzwv5cfjv1vU5xHuaAW3AL2t4+?=
 =?us-ascii?Q?/KotTrEqfqv6BxNTZGXkMCKnR8Olv88huna5XYK1G9EZvbG6eEZ+x34bDrjk?=
 =?us-ascii?Q?HK+OcN6lMcllahddeFw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 03:16:13.9026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 658f0857-257b-406c-54d3-08de2b07d322
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7908
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JDPD4DIZOS23X4WD3J2MBUZD3FHAH22U
X-Message-ID-Hash: JDPD4DIZOS23X4WD3J2MBUZD3FHAH22U
X-Mailman-Approved-At: Wed, 26 Nov 2025 14:11:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDPD4DIZOS23X4WD3J2MBUZD3FHAH22U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The new variable of reset was added for TAS58XX on TAS5825 first.
And TAS5802/5815... was added later, so this reset variable check
should be changed to lowest chip of TAS58XX.

Fixes: 53a3c6e22283 ("ASoC: tas2781: Support more newly-released amplifiers tas58xx in the driver")
Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 sound/soc/codecs/tas2781-comlib-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-comlib-i2c.c b/sound/soc/codecs/tas2781-comlib-i2c.c
index b3fd7350143b..e24d56a14cfd 100644
--- a/sound/soc/codecs/tas2781-comlib-i2c.c
+++ b/sound/soc/codecs/tas2781-comlib-i2c.c
@@ -320,7 +320,7 @@ void tasdevice_reset(struct tasdevice_priv *tas_dev)
 		for (i = 0; i < tas_dev->ndev; i++) {
 			ret = tasdevice_dev_write(tas_dev, i,
 				TASDEVICE_REG_SWRESET,
-				tas_dev->chip_id >= TAS5825 ?
+				tas_dev->chip_id >= TAS5802 ?
 				TAS5825_REG_SWRESET_RESET :
 				TASDEVICE_REG_SWRESET_RESET);
 			if (ret < 0)
-- 
2.25.1

