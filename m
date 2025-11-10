Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC6EC475A0
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Nov 2025 15:51:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C719603A8;
	Mon, 10 Nov 2025 15:51:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C719603A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762786314;
	bh=+2U8qdN0Kz3qr/cWPxIXm94rPqvukxGm3SlE9V9h1cE=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sH2kOenLSEyIVj3/LkmvYMLxBvD8Q1sDsdhO/7eMI4OgHDcjeAj6SCMja5990uPuD
	 Er+qQlkoZMwvLiRyVAffS0i2yhzqZ+kk8K1OiHcZHhyUY0OWIKqJTmOXtC1vVzeh5J
	 dDymvDckVqPaz7mCgJ/Y1ctUvUCoW7vhf7LlAFtY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BCECF80746; Mon, 10 Nov 2025 15:43:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2E7BF8074E;
	Mon, 10 Nov 2025 15:43:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1477F80254; Mon, 10 Nov 2025 14:01:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E7FBF8007E
	for <alsa-devel@alsa-project.org>; Mon, 10 Nov 2025 14:01:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E7FBF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=kKZawxcX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLR3VX/QU6l4kd/UhoSviIGznLoxMPV1Uj5Vcz06hWcu8bhWkrrR1UmhKH6s9GfJhNIbgOwrx3V4LSfuY2INIT9vIZrBaCvMmZQzBEk7BRkICr0yidNBi+AT1YSMvk0oEIYKdYp/sNLrk20MCXLwWkugBaT3WQR9qk2XAuqL2NmHX4DxQ7WLSVPzda9Go5PNlDcrIF0+/DoGh4bAIPE9bJhw0Yo0YV5sqr0k396bilhaRw6rhD4uLnM4L4X0Y52pocGiCme0nBSZnxYa9zfk8+MIWMWjnOMMACCb4ksD2nSTnVWOVObip9bPPn1TRVWL5bHjo4QAxCTg58Lt4LM+vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mk9LzkRVx6RNEjvS9ltahn0JvNOQJd5iQxSLi2yCE6Y=;
 b=RA2XyuCy5/4rIfrjfYGRkKIGlVibLlXFr4+3mgg1DQYsAvCsszrcHuEYl+OWyvCl+7O2qzIjE1yTPEWBiYtyS7HZMa7Kne8tOKB9vJsLQ1cSR7bn34OlOCWXn4NeZiK7datz/A0bR8gvL7NEryoXp2v3Bc0DrMl5gEMbxRtZBzjkAq11h2oydc4yfIwjmbV+yD9Vr4DwXdBoxn0ZCd/9IkfhlG/1A2e8xdc40fNAKg/3uZmY3n2FGsXa+IAwGy9aQcXsVo4cQZzK8npyBxxJTUuRr7wnVbs7//j6epDhH1cclKnsFcG2pFVlI6umzbfCdk34HQOiGTD8/7PoX/D1zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mk9LzkRVx6RNEjvS9ltahn0JvNOQJd5iQxSLi2yCE6Y=;
 b=kKZawxcXoYkALnk0ydgEJoeqZ3cNt8lqcmNmtVXD3efGipTJ4ExRfQvhYhFf6wp2Ksx/fXTGEumlouu4We7SHFs1AZuIBGm7PY9KfW6ZlLskXJB4Zv6ktphj/dQvp4zVyn2zF+ruNkM6PRwchsUpksWSQz3wGzgb/K027dm5pxo=
Received: from SA9PR13CA0087.namprd13.prod.outlook.com (2603:10b6:806:23::32)
 by CH4PR10MB8099.namprd10.prod.outlook.com (2603:10b6:610:242::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:01:26 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:23:cafe::86) by SA9PR13CA0087.outlook.office365.com
 (2603:10b6:806:23::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.5 via Frontend Transport; Mon,
 10 Nov 2025 13:01:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Mon, 10 Nov 2025 13:01:25 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 07:01:18 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 07:01:17 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 10 Nov 2025 07:01:17 -0600
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AAD1C923439164;
	Mon, 10 Nov 2025 07:01:13 -0600
From: Niranjan H Y <niranjan.hy@ti.com>
To: <alsa-devel@alsa-project.org>
CC: <broonie@kernel.org>, <ckeepax@opensource.cirrus.com>,
	<mstrozek@opensource.cirrus.com>, <yung-chuan.liao@linux.intel.com>,
	<linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <cezary.rojewski@intel.com>,
	<peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<navada@ti.com>, <shenghao-ding@ti.com>, <v-hampiholi@ti.com>,
	<baojun.xu@ti.com>, <dan.carpenter@linaro.org>, Niranjan H Y
	<niranjan.hy@ti.com>
Subject: [PATCH v1] ASoC: SDCA: bug fix while parsing
 mipi-sdca-control-cn-list
Date: Mon, 10 Nov 2025 18:30:58 +0530
Message-ID: <20251110130058.818-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|CH4PR10MB8099:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e5b959-4366-4e0e-0982-08de205941b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/yHED1j4UkcxwlfxCAoUiaI99O4xy0KxgQ6ZWWtM9vU2lS+yboYPzbqF6ra/?=
 =?us-ascii?Q?zAv4UtuYtpiuYT4BshL4Ea/UOMOtun01VgyrKMXUWHMX/2bjouCfYygEnS7k?=
 =?us-ascii?Q?I61dI61sZVn6XmisN0msJbVSnAnYMcOUmBgE6g2B6QrnFXqmZwcNipAy3Nsv?=
 =?us-ascii?Q?EYfg4FaDaBj5tyrM5sQSSXP/J7QTlzSPL2gpZburv3PRRom9K0kvmiLF/Eoc?=
 =?us-ascii?Q?OALrIsrHjRVQi7aSK9+oO3IeOEIgKjlWsluIMIPuwKkzhqFf8sg5fmse5Uri?=
 =?us-ascii?Q?9nKQufQqw76uyUI7t5tCyGdCpuv7IPq6CF3nofnWqEMZ5geHJbp9SOLfZhfb?=
 =?us-ascii?Q?Va+vbS7bedeo9zyP6yCwQCJCDZjNvoIdYceG3eqU+7yInSKeXPhRsVmlK7z+?=
 =?us-ascii?Q?JCZsOONO07IxQaeuRioPxtGfS3olEBZwfpPzh28LaleTW16o02QnLKXl3DO5?=
 =?us-ascii?Q?449I4WE9+gspXFhurNfznmk+/KOt38xebNI0IpFxDWTWDaouOQmEamAmn52h?=
 =?us-ascii?Q?zhfriL1Yz6C15/FxyzUy0wqbzoW2utihTiWrLdQHjerFNotoGdshTqOOpf2y?=
 =?us-ascii?Q?BOgOz7Ps0+07dXAFtTTLKuju+TGvCI+XwKQkqE+lFZ+kLIPmkQ0YZ3OuyRcv?=
 =?us-ascii?Q?7Sv5+PX2XX+IhbUWwFDBalaiVoPmj80Lld17jbve7HeUVEKfqmJOCqiUkh7G?=
 =?us-ascii?Q?YUCeYxgP2qkdQpftQ2YqmMoX9dHkjqaoAqXTlu/iVCfmGjwQCPIScZlQ0FGv?=
 =?us-ascii?Q?y2u41TSqUDfU0m5PAUJPNjvP3UQIKL9Ct2ktGX36MwpULme/DDosfP8DIlO+?=
 =?us-ascii?Q?ZFFObeC1cAscJuJhLYJYi4UUS2DNRXYXz3xR3Ml0PN0XLKX2PRsvbTV/vpPv?=
 =?us-ascii?Q?7lx+c+4buzHPJ6l28pZPU6i/wSoUtQvBm0R/9Y9PpK7Q0yLnaUZKEAs6Z3ou?=
 =?us-ascii?Q?vwilsypnOc8nPIV6INNuaURp5VYcNAlXip4AU/r77aFQG+bUHRSVjBTM308P?=
 =?us-ascii?Q?r0jq9LaDN4jg8LYVLJqC1sViLEoKS3+rAbuhdQ7ZDouMiY7l9DHdCvNVr+X7?=
 =?us-ascii?Q?w5q9t+dAekezEICEjlVqGdebVU93jWVRkB31aEKEwwuo88BkoOY1/ti5zZOD?=
 =?us-ascii?Q?96YxK/YXSJv2x/v7r3tCtMpNluInieUdngXafJaxOVPMPEJqznQYgkqGxTm0?=
 =?us-ascii?Q?2q7omp2JIewjIl4pC0L+dNxNvlngda1C/EQaXse3+gnaTkB7JXeSv5dkXx5h?=
 =?us-ascii?Q?aKTw7FDJAwadtmC0bP6XjROohZ88gUseMd4nsJcfAqD30l+0H8ARn0M06d0U?=
 =?us-ascii?Q?fb3HXlvvluUb9X/6aylKhrjp5pNWFCvxQPDzoYLU7CrVHlyW1c9Xv1A6LGFn?=
 =?us-ascii?Q?oqp3T37sFUnQTiWXbCcZWHMixd5Go+QGraK7qnfNKXO7ekzLs1Rfg2sOplHt?=
 =?us-ascii?Q?PXa0xul6MHSwvCyrTaiWl1pJqRNv0+fYdB3UuG2IQanS09RnXheS0Sf/sFdd?=
 =?us-ascii?Q?5ycI5o5tO8BHMK+fCL8MJ3pHqh5i/BPM4IqE2LpzjVBZTfjlVGgNlbU5reUS?=
 =?us-ascii?Q?5SqGDKn9EEumsWhMkIo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:01:25.8777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c2e5b959-4366-4e0e-0982-08de205941b1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8099
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: R5MNYGGOHA4NO5YR3MAE7AIROZBSCR2J
X-Message-ID-Hash: R5MNYGGOHA4NO5YR3MAE7AIROZBSCR2J
X-Mailman-Approved-At: Mon, 10 Nov 2025 14:43:31 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R5MNYGGOHA4NO5YR3MAE7AIROZBSCR2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

"struct sdca_control" declares "values" field as integer array.
But the memory allocated to it is of char array. This causes
crash for sdca_parse_function API. This patch addresses the
issue by allocating correct data size.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/sdca/sdca_functions.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index b2e3fab9b..6975c71a9 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -950,7 +950,8 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 		return ret;
 	}
 
-	control->values = devm_kzalloc(dev, hweight64(control->cn_list), GFP_KERNEL);
+	control->values = devm_kzalloc(dev, hweight64(control->cn_list) * sizeof(int),
+				       GFP_KERNEL);
 	if (!control->values)
 		return -ENOMEM;
 
-- 
2.25.1

