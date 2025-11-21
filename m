Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 647ECC7BF54
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Nov 2025 00:45:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0EBB60202;
	Sat, 22 Nov 2025 00:45:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0EBB60202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763768734;
	bh=maE44IA0q5DP32IbdT752zTiw5auxUmFpJlYKxufT0U=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=p/SK7rmuNRIpb6og9zCMns5B3UDeLYXaCoLfavPQMcm8NfeC75CH9rADZqDMmIG1f
	 TN8fwPg2ITNuIWdlqWze139OlueBriMxPTuXL+BonG8kMiv79HmGqixqEBG8M0mlQu
	 2UyUWFnJC4GN1KgLuBkeGXtHqnVesJg2xOwCvb1Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B9B6F805BD; Sat, 22 Nov 2025 00:44:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D3B6F805C4;
	Sat, 22 Nov 2025 00:44:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FAEFF80254; Sat, 22 Nov 2025 00:44:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011069.outbound.protection.outlook.com [52.101.52.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04747F80134
	for <alsa-devel@alsa-project.org>; Sat, 22 Nov 2025 00:44:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04747F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=gjO1H6o/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+jeIvphi/pssaGBTIZZxzPwnCpBtiOOwydTpz8AXGRcjUwaoidUf9ly7IjUxoEz4wGpr+4+p2ssyI3N20Lu/K/qeQIApbT/KEJHMDyhCmqtAhrsjuy5o7uyks5pCs89bi9Y5VC1pkqf1z2hhCr/N+u3nJSGID80xDvmWHiRs9OyGyTCHfZp8kE/OP7jfOjlezLN13CDZXawXj09Jcz4rt+dSE+11LPl3tDvM62r23Pp5Fu8zSjLJI+zjua+EilPYud2SBUkdI4EldXR1PCFsYwTzgEzxh9M3ke2gQ/iVmHrHVU1IXoddhFWWqcdYxAHtB0Vdd5CK07SxugfESPu8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDK6i+jxNd+S3G2flygvqSuNIkU8lwhZrUHE/MPejq4=;
 b=Bl3hsmR8aty448CMZFuR22KmSWbvGgjpoT3kkFcNZAvRr95AZDs5f2hIRNDzGdvB1lXZVz5pI3PH8UGTp8iqKh3IKvQQS6K4XmDO5kwxpwmHGJVtIn90yzaIQSnmEFQAopUNGWiHaVqJ72j9GKxsmKz9IOfvBu8dEaEnkI7ORWJRm9iF8Af3NX+N1S1z9AzQFAiiUwpFtLFHOGD62JiEX+AsSAY66yb6B2418lYun/QlQgkEBmpehb8BjIQbJk+YcUG23Iinc23WEPekFUG5JH67o8srtg7/wHq19PYeCNAtl5/pUwIqG04oxaZrNps80n8tpCJ83os0DvzHjlZV5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDK6i+jxNd+S3G2flygvqSuNIkU8lwhZrUHE/MPejq4=;
 b=gjO1H6o/2k7XzOw3J4Pap4xrUaAY8SiGgIo4txz5/ZrW33gXNdai2rVT8gc5GQ88/vKpkAXRvnEbv/FnH0FuXWuLqu5XX6fWYRkxBRVRe7DSxqbCGSrhWv3GSqZpx8bzXv16r9n1pUo1KVzA4GzGqQAYyle8QbKv1M+bB8G7rz4=
Received: from BYAPR03CA0021.namprd03.prod.outlook.com (2603:10b6:a02:a8::34)
 by DM6PR10MB4202.namprd10.prod.outlook.com (2603:10b6:5:222::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 23:44:41 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a02:a8:cafe::5d) by BYAPR03CA0021.outlook.office365.com
 (2603:10b6:a02:a8::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.12 via Frontend Transport; Fri,
 21 Nov 2025 23:44:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 23:44:39 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 17:44:36 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 17:44:36 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 17:44:36 -0600
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.111])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ALNiWSb2283165;
	Fri, 21 Nov 2025 17:44:33 -0600
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
	<13916275206@139.com>, <13564923607@139.com>, <alsa-devel@alsa-project.org>,
	<baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: correct the wrong period
Date: Sat, 22 Nov 2025 07:44:27 +0800
Message-ID: <20251121234427.402-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|DM6PR10MB4202:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c64c06-2eb8-41bc-5f41-08de2957efd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MlpGczM1Yk8xRWlscWJVL1hBS3YwMmdUdmhMRS9VK0x2WEIxcjVZMTArL3Va?=
 =?utf-8?B?UmdRSHoxdllnbDNzTFZ1eVFjRkllaldVMXFKZDRmSFRuR2xOcjA2amdnVEJr?=
 =?utf-8?B?NlNEazNydXNmSGhUbElkRGo5aUFPVnZJWW5UM3JyOFlaMGJhYnpWZEMwcWJh?=
 =?utf-8?B?bklCZUZoU2doeEZrODFMYVFwTFRUcmcyK3ZOOXZ1UFh0eVZpTXlRS1pWL0Vj?=
 =?utf-8?B?SVR6TTFZSWZqY1RyMHZwcEZPMWxHYXU5bUVUcmRPUTRCS2dEd0xUWU55RHc4?=
 =?utf-8?B?V1BsbTVneFdOWnlJNWxFVjhvZTI1VmRkRHl0YUNsOW5POGVzNGpEZmlMWG96?=
 =?utf-8?B?QUFKdUxvY0g0bUdXOHFoQzNtT3lydE1xajcyU2ZRQ3hpdkt5Uzd1MmlrS2Z6?=
 =?utf-8?B?dU1pZlVqZ3E5VnR4NG1Cc0NucGtOWktXd2dCSVU1NmxJeVBNMURIanF1NFVk?=
 =?utf-8?B?eWRwQmNtb1pWLzlCZElNZWhmNjBXbEk4OHFkUWJoUTFLTXBBVWpqMXZDY0k3?=
 =?utf-8?B?TEQ2TTJXQm01Q2VRQndXVUdHcXVzKzNUSjhxbmZyVmFaaHdsZFJPNFZjWDZN?=
 =?utf-8?B?YjMrNC9MbFZ3bm9jbXBhY1ZaMFBMc1N0NnREZ2w2YnFvOEpjNWRZSGRkYW52?=
 =?utf-8?B?OG5SaDV5a2Q5SVQxeTNKMEdwc3N1L1dNanVVeDNiQnk0cm9IY0E1aEc1d3hI?=
 =?utf-8?B?Rzh5eGtpRXN2U1M2TmQ1aFJwdFBIS3hTeHprYmxzOUZ3dzVXNnVVSWVDNU1t?=
 =?utf-8?B?bVEzZS9tM1lYNWRxMWlJQVBTazAyV2trV05zaUV3UnVpTW56em56OEJkMW1E?=
 =?utf-8?B?d25ud1V5Vjg5N2cxZE4yZE1vVHRSYzlwWWQxNFlWcWtMYWV1QVBqS1pwb3FC?=
 =?utf-8?B?YnpVeGNQRWVlSm1KdFJrSWhSb1lCV0V2eGtVb2dRN0tKT1VUa014azRxRG1r?=
 =?utf-8?B?ZHk1L0RxUThTcWc1dWtKUmtnc0Q3N1RSVkh2N284VVdwb3phc0tHTjBlRUFC?=
 =?utf-8?B?TVBqN1Z3OFEwcFlpNEY5d25VOFFLME1PMGFEc0oxNlNyN3JnL1pab2pDMFhY?=
 =?utf-8?B?aXhGUWNrNXg5ajdwdTJRSyt3eTBidWxNUkZKb0JTWFJrRWxjdXg5VWUxc2F0?=
 =?utf-8?B?MEtGT0tjZkd3K0JjcEVaa09YbmRLcExNaWRxSEpOTlJoL2t4aG5KWWFYdHVx?=
 =?utf-8?B?TitNdmtRTFZScnNqT0k5NXptMVYzcmhQR1dMbmI1cXB1Z1IyS3J2ZVFaRlFD?=
 =?utf-8?B?ajZjY2x4SkZkQVhyRE1lWUxKUTlGQmM0VUtpU3FLSnlzOTBEaURBMUNpUE9G?=
 =?utf-8?B?VVRDRE9zcTBPckVrOC9iWGZRdmdrd25hRHhqWVJqZGhlaHVmUWlVSmZFdjht?=
 =?utf-8?B?VFBEeGJ0UGkveWVrTmJYQW9xU1A4MlFjclZJelpRTHpUVmdzR1lxcU1EMFls?=
 =?utf-8?B?c1dnMU1ZTnR0NHNYYVROSWhPMjhVWmhXcTUzT1R0R2lqeEsxS2NRZ0oxL2xM?=
 =?utf-8?B?cjYvSUpSSStVakFGOTB5cWlQdFBtSndzVmxQdkJOTUZCbDRHMnBDYjB3L3o3?=
 =?utf-8?B?RVFyL0JiNmZ6cDZ3YnFPTmU1YXNRRzRtbHREYkQ5S1RkeituUGl2OVlYOVF4?=
 =?utf-8?B?N3BtV2lwYVpJYTUwZC9TT0FLZmdGMUNicC80eisrMGpTenZkejlFZysvQ1NV?=
 =?utf-8?B?MW9zUXdPR2tBckdsV1VoZnF5eUpZWUIrOFBWYmVDZTRsdCt0ZHM4VVdTYUJB?=
 =?utf-8?B?OFp0R29GZFlla25kdDJkOC85ZmdJMUN0K25ETjNCb3ZvcU4wNWJqMXorK0lz?=
 =?utf-8?B?aGxqODFMeUlwendUS2M5NXE0L2NmdXFTOVRpdW9aejN1V0hpSHhRTm5qNXBx?=
 =?utf-8?B?RTlpUUlWYVg4MTRLWGtJNWRsSDJhaGJvZHFDanZqVXpnbFJ4K1FLQytIckF2?=
 =?utf-8?B?eE9PLy9YcnBPbHFBYmhpUktnSWdGNjlCdVFWL1RieVpEYXdwb0FycmFRdjFz?=
 =?utf-8?B?L3lzOTJtdVlNRVN2dHM4TWdZbjNMbkdQVnZLc0dQSzJ2MTUyUUlhNnZaNzZG?=
 =?utf-8?B?c1IreGo2akJuYnh1cUwrbkNELy90cEFETmNxK0RJaC9zZHYrWmtkZWdrd3lo?=
 =?utf-8?Q?Y1hs=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 23:44:39.4746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b8c64c06-2eb8-41bc-5f41-08de2957efd4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4202
Message-ID-Hash: FAJVA6LC47AHKV3LUQKER6DBB2IMVBGO
X-Message-ID-Hash: FAJVA6LC47AHKV3LUQKER6DBB2IMVBGO
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FAJVA6LC47AHKV3LUQKER6DBB2IMVBGO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A wrong preiod at the end of the sentence was reported by one of my
customers. Their thorough code review is greatly appreciated.

Fixes: 49e2e353fb0d ("ASoC: tas2781: Add Calibration Kcontrols for Chromebook")
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 sound/soc/codecs/tas2781-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 0a86964dfcfd..d1c76ab0144d 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1400,7 +1400,7 @@ static int tasdevice_create_cali_ctrls(struct tasdevice_priv *priv)
 
 	/*
 	 * Alloc kcontrol via devm_kzalloc(), which don't manually
-	 * free the kcontrol。
+	 * free the kcontrol.
 	 */
 	cali_ctrls = devm_kcalloc(priv->dev, nctrls,
 		sizeof(cali_ctrls[0]), GFP_KERNEL);
-- 
2.43.0

