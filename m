Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43143C7571E
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 17:44:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C11F60210;
	Thu, 20 Nov 2025 17:44:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C11F60210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763657069;
	bh=hWZ/0FG2cukeMbF596yBA8fKpVfk6BJ8HvjLCiDCxDU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XgaVxgfK8otwwfx7+6zkAnQgh6KZypI0p8gsKh5YWyJBFGs1F63qVRfUkdsysf72S
	 wAQ/aTlI0sE0pwjBLWUmh01vxPpEX0oCBCSMQnbW43Tg+VYBd2d62dBlD1rNqULob3
	 n+ggWNTl+y81gYBYO+1diYr6s5sGzdNxvZLRP6MY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B990F8053D; Thu, 20 Nov 2025 17:43:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 491A2F805CA;
	Thu, 20 Nov 2025 17:43:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BB39F8021D; Mon, 10 Nov 2025 16:27:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010017.outbound.protection.outlook.com
 [52.101.193.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 516ACF8007E
	for <alsa-devel@alsa-project.org>; Mon, 10 Nov 2025 16:27:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 516ACF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=selector1 header.b=crU57bSy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUl8S3QWOMLnQSfKnWBBNsdI9W6t4qj/9rJZ+5plKo9uN+I8d4JxhHwRm36pIOA/DIjLRXEq34xXABHkcGUHEwOxcHXNVaey2eQPaGCT/r0eKqzib5/Q+CZkYYJm7LlkQ1fGyt6Tt4hDBVnndnGsWy/MNvdTATFXSIRktYqpmuWIUCJ0VFWqY/Z5d9OaYgrxti+ZaHxuyk98m/pQO6+e7h09CZ9qeat4BR78ka/M4tmdKxBUjrdc8xSScCMuybr/VVVtS8CRIWHT0WBN7GTJF2l294CPGS6DUW9fNyEQciMLyNMloj14CZdo1K9AccyWv+eYN5gk6AiDOoWDZZOv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I5CzYVjMIb1/X6ocgxs5tq0ZaX4U0AgSparwKVw1Ih0=;
 b=SsrYmF5e8klfHU+vMgHpmW/v1Et0Bbc1zB+GkN4jnmtZu5tYKsJvU004Er0cUzCMMuKDaqXBqkmpwx/L5c2kA+Qskns7l7qeXTOR6RT+iS3diUx1t/nCqokzxaLGERmLm+TBQtj9aDcWUu8XxmiVQp06E4lc7FxFOfs6RobSxZYbxB3mHQ1ByydQHDHcGzAjnh1ujLiGAssXIu4znhXpqFz5Cdi457oA7kX+tdgVcrIiMQY+6/xF1CPFcsscCm8PtnKTvs0m5SLhbCfTIsBuTb4tb1uCe1POF/WtdD1krKQj/2HIeKmgd+H8EFP9QvejBB/Aruu9LWDKqZzVyhJXtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=linaro.org smtp.mailfrom=ti.com;
 dmarc=bestguesspass action=none header.from=ti.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5CzYVjMIb1/X6ocgxs5tq0ZaX4U0AgSparwKVw1Ih0=;
 b=crU57bSyyl7LUf5YJkAIMYZCgReQ4E4CQaNdEIW9pSt1bHD944LOvrOoa5+yeWB0E0L3aH4amtq2ka12if+ELFV1PXimlKZkwmSwje40iyut3iJTU2Qws/iSfDlamRbTYKwVyfwnfreHIDySPLvoWAqmzY7ug5JgrpLonxGVk+U=
Received: from MW4PR03CA0245.namprd03.prod.outlook.com (2603:10b6:303:b4::10)
 by DS4PPFDA2AE39DA.namprd10.prod.outlook.com (2603:10b6:f:fc00::d4f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 15:27:07 +0000
Received: from CO1PEPF000044F6.namprd21.prod.outlook.com
 (2603:10b6:303:b4:cafe::f2) by MW4PR03CA0245.outlook.office365.com
 (2603:10b6:303:b4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Mon,
 10 Nov 2025 15:26:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000044F6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.0 via Frontend Transport; Mon, 10 Nov 2025 15:27:05 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 09:26:59 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 10 Nov
 2025 09:26:59 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 10 Nov 2025 09:26:59 -0600
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.133.122])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AAFQpBi3630404;
	Mon, 10 Nov 2025 09:26:52 -0600
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
Subject: [PATCH v2] ASoC: SDCA: bug fix while parsing
 mipi-sdca-control-cn-list
Date: Mon, 10 Nov 2025 20:56:46 +0530
Message-ID: <20251110152646.192-1-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F6:EE_|DS4PPFDA2AE39DA:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ea62823-648f-4f58-1e8d-08de206d9aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+qKdVyQk2TWni3XbLML08tuGKZZQIzvZDb+xRZFDj9kmduYs2uMEP6NmHWSe?=
 =?us-ascii?Q?JVNZa6sJcxjJEPJSpJlARin8wYUi/H+CoT5RIqs21H5c6Pf+wpDhGPrOD4JJ?=
 =?us-ascii?Q?bjCNZgmqvgdGRFTFll4sA5XyvlLg8Ke2fsDWWOUMQA7IfIQLRMyYZKwkmtwY?=
 =?us-ascii?Q?GW96pI+OVjZIYhHzEm98z28tkul2+bB874Qpu6pAz120NMte3ttbbDAl7Puq?=
 =?us-ascii?Q?QKnHxsfM6mm8R8LFrCNveQeYu+K82yUBfyjtRSHKENeTkxPrBb0rN3J7DH7Q?=
 =?us-ascii?Q?ubYhheaCyaDGI9RGmew47aYpRNYCwuRYRnqHswJOd5Z+RDbUzh9HbWJlfSMv?=
 =?us-ascii?Q?J1ddEG1GYc4XEUBDxKR+XhGjEXuerPr6Uh748tVjjvV5zrfH9s9p+Rhr/BWe?=
 =?us-ascii?Q?Wr6S1hnZx9Ta8zJhIoqBh9tuUTjp7eixlA8eWIhNCrYfmxE3y8NmiL15JpUG?=
 =?us-ascii?Q?jIDclrX3BQAy9KaN8OVj4I9bpg6LeAKzkSDhfU+ZJXEsrOOYPw653hZm+AjT?=
 =?us-ascii?Q?3ug5U9WdWwnQbvWf+1GxwDCobUVvbvEClK6SnnI2AWA61KXquSW/i1MBTOPA?=
 =?us-ascii?Q?VSdc5x4F8tAuXC2TYBMYlv/F2zJdI+WyB6iuiYh0dX7kgB8+6tp9gbnpYP0W?=
 =?us-ascii?Q?YyS1Z8Y95PXNQ2huiIpS4NsIP2e+Aw5LHBErSLEKzKtl4hq+yhPXUbtb5yAz?=
 =?us-ascii?Q?POrHT11qo5OZGXtcB2XumRWn9/WYi82sLfp87ivYV9WaNQWvc8BEjS/2iiTm?=
 =?us-ascii?Q?67xnPf6vEN7DSewpxahvbQb6K9q9rnf6ikkOhS8NTiyUtp4zltcMTmBhHhXD?=
 =?us-ascii?Q?4DjAWKOknEAO2TWcj7U6lebW81MvZhB2WUA8m6ETKKM4wZ33XDWlx41f/+xY?=
 =?us-ascii?Q?B9Bzi919mqClpGnpOaXSMCTmVfP//vJ9VztFESlejz/E3FC8kSq4bIlH7Anb?=
 =?us-ascii?Q?HWTNfrmXhqwnqJ4bzhBvUaLUZ3MuLChK0o6ZJhheXLBQRgzFEcTG/yNQqF2O?=
 =?us-ascii?Q?mFqSommGWgdxL2i4G3cE2xE9oEGY7Aj15BanmsYuoRvIFa0bbGxAUB4IN/+N?=
 =?us-ascii?Q?V9D+8U9Z8aO3RiV0Ye0hfyn1xCmchKzNWvmIZdzX5QH985NWfKZogv5VWO0U?=
 =?us-ascii?Q?+NPubSa6ODxcQL4H+zxbX4mj/8+r8Vk3g+A7h6bjBXzzAE/kPd5+yO/L3+Fb?=
 =?us-ascii?Q?7jftF+qB8y7c9vCPsQGHktK5SPjzVC5WxUV8WVlLhUFddDMk2DBGMShaAZwB?=
 =?us-ascii?Q?C8dwYCILzVJouf6UOQJZ2PHTDZVOuhHCy4L+1yK7CmqVdhdLdbFV8PTi6STV?=
 =?us-ascii?Q?5zpQwzvuHeucbClQGT018tV/9cDCCueRlbnZeZM0aa7scEWLUfyuPoDlr+fy?=
 =?us-ascii?Q?qr1ARxUBLw7DImNvdWpRHUbzevg/rXOVn23/eibjugBHbB7BX7u2wKrzsQlB?=
 =?us-ascii?Q?0mT2XV6+EJ9CcpeZOfkWO2eWOTJdIwPvKhmEbmIJyWdgAYndZtqgimcQbo3Z?=
 =?us-ascii?Q?aIPPEqfSWhvMBp6iJnJ4uSqRok2h5G6qO04BNQrDT9iUsh+5HOLroj6+VBRH?=
 =?us-ascii?Q?gPbMY1SFQFsVhArzBSg=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 15:27:05.0155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0ea62823-648f-4f58-1e8d-08de206d9aaa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDA2AE39DA
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EQ4L3URVFU34SJG2KT6X7LYT4YEGYY5E
X-Message-ID-Hash: EQ4L3URVFU34SJG2KT6X7LYT4YEGYY5E
X-Mailman-Approved-At: Thu, 20 Nov 2025 16:42:39 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQ4L3URVFU34SJG2KT6X7LYT4YEGYY5E/>
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
v2:
- use kcalloc instead of kzalloc
---
 sound/soc/sdca/sdca_functions.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index b2e3fab9b..49b98fe2d 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -950,7 +950,8 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 		return ret;
 	}
 
-	control->values = devm_kzalloc(dev, hweight64(control->cn_list), GFP_KERNEL);
+	control->values = devm_kcalloc(dev, hweight64(control->cn_list),
+				       sizeof(int), GFP_KERNEL);
 	if (!control->values)
 		return -ENOMEM;
 
-- 
2.25.1

