Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDE9A16A8D
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:14:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39B0560232;
	Mon, 20 Jan 2025 11:14:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39B0560232
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737368084;
	bh=zM2zh0uJM8rvEjfNegpihH264PTE4XAZU4iWLdI353Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gMMD9cjz+jFufmj1bDZ2O7u7r1WHJN+6FmwQcr3T6m+YjgP7kHBsvnWBVXNyKx75U
	 3aJyijyQIyCz4AaR1eDg9O5zZnjWb4LWfrfUQhgxbcbs2r+h/Wq+rGO6AOJUPK8eWj
	 0bWWByxkpZclWnMeLfQUr6Eo8UYU6qkBB6ssj444=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 703F5F80533; Mon, 20 Jan 2025 11:14:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AEAE2F805BA;
	Mon, 20 Jan 2025 11:14:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F60BF80424; Mon, 20 Jan 2025 11:13:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C4C8F800E4
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:13:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C4C8F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=dxQPjYFc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTx/xGxcVCgfjBGn9vhZ2RIWO8wraUGh4HjYtgi3cCeQ1tIGW+X0VpsA7AFO4eHNFXyb2ScfAyaCKVYm7eVssa3+GR4i2ftHhzT38e8Up5cpz2XY6bbZuIGtMYDkhh+cADwbpGK68VGIC16vOk/Zb7TcS40pj3YDtVYChzek4aN3i9fGLql2f/plzOIWxxIsISLsh7+k1tPs474SX9J4mqYaiS6JhOlSr1IlkZGVdFVa/H6EkFy3KP4doTXs/iIviMTeX7WO84+8LuekooGX/QYCPIR+78CvrSJvrfr4wkJx7NV3Us2N4OL14MA6JZ3mhunUtSkYDXBYjAyZ40kRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLKy6dTIYcrqkT+OBBEkmVnloXRQGYN6kFXV5rWHDsk=;
 b=MZMOp2F4lwHNFrIkRM/Gjgzi3EJ4k098MiQeZrq48gpbyhY4bILXjqPZLLszdZ20mT9aELAoPlvs70k8echG58oiXW4EGzfhx1Rq+/mCenvAr4PKGYHZpaDOdJPUU6zcskUua+h02RhHV2g5VbKZjz5B+XgjpCKYjFbOmBa5ETb/mLI7Vw/weTXe7zloGp58gSQalcI7tUPkXMqJbMGU40DczFqbiJ4YbaGv22hNlMaC3QY7mTKLDqGk7JzdcKfabwwgxw/lpQDh5L8v9/ZBh0h7APt9BF7YSjdnbAk2N75H9AaJ60rnkm+AMgzgvfVzwWwGjkPaEYVtfNxWSMvjAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLKy6dTIYcrqkT+OBBEkmVnloXRQGYN6kFXV5rWHDsk=;
 b=dxQPjYFcf447Dfa/TE4oRmMwcdacMqcZO+tRpevsYoZMbcmQ6S49W9X56Ql5TYzCv4TBav44khP7uNNMUqhpzpxaaxHpul+A97gPS9M0Y/J9Ocm40gxKuAakotQ6weFSzunVa2GAybCNzktlATus2g3yKxFOO7e2FClXF1lSsfA=
Received: from BN9P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::8)
 by CY8PR12MB7314.namprd12.prod.outlook.com (2603:10b6:930:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:13:47 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:13e:cafe::c8) by BN9P220CA0003.outlook.office365.com
 (2603:10b6:408:13e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.20 via Frontend Transport; Mon,
 20 Jan 2025 10:13:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.0 via Frontend Transport; Mon, 20 Jan 2025 10:13:47 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:13:43 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 1/7] soundwire: amd: change the soundwire wake
 enable/disable sequence
Date: Mon, 20 Jan 2025 15:43:23 +0530
Message-ID: <20250120101329.3713017-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120101329.3713017-1-Vijendar.Mukunda@amd.com>
References: <20250120101329.3713017-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|CY8PR12MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: 071c4d08-1074-4322-69a3-08dd393b20fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4gDGKzVhScHZxXDMakkPKNVoQtE6ep8Ix4p200Ym1WrdR1T6zxQ3wRDmD+Jb?=
 =?us-ascii?Q?lB2D7Q7Z11hONcxJATCc7Osr1WWN7KtqY15QxWbqvi7RGDxYtgM6eOq7JIkM?=
 =?us-ascii?Q?Zeb5n82tucyusj6w0RW5/KIodS91P5rc17NVoIlUjS5q3FVOxNuSUmCP07hc?=
 =?us-ascii?Q?x7S8MXaXdvmMPnArNtRoFpi2yKGUx94vwjJAWf1aMgjpgGC6VDDaJrwVfGzP?=
 =?us-ascii?Q?h7uAorHiF1kX7FCTIUrV7OpAw71qNek3R2BZoR6AkNl3L7yvfhdJPpf+XcH6?=
 =?us-ascii?Q?tlCDzwgRTDv7C4a2K1o/SjeShrMg1MiQbBUovOOJkTh0urbN+7dLYa1GiEEB?=
 =?us-ascii?Q?lu4zKa4JvPUCaiPqCwoL7o0+7SBNVnaArvLUvUo+aalOPhaOxWv2BKe+csrK?=
 =?us-ascii?Q?hYEbrcZ8v1XLUx4lIvIkMb0WYXZoQ5GCZ+nTN+7U/Ut0Xf6k4pIK28NAfHPT?=
 =?us-ascii?Q?8UrT21BmQYRsCH30p3foDCCILXWEe3YjvUWcK0YL9prSdEPQzRgquNCkp9WP?=
 =?us-ascii?Q?VwO2Fos4NQnhWKRrM5w1w/1Yi5qJEnYUMGFwbJ7hWvzAnUVAdf70UXx5j8iy?=
 =?us-ascii?Q?tCHhXLfzs9YxVkOvmkrmHuqxf8DIOPJKCAaNUcDXrLtNu9MJ8d8hZdl/ftLW?=
 =?us-ascii?Q?kI6GS4kmZPj43IwH+H5Cyv2jG8IFe6Q8XNZyrdkoe23ZqAm2Vxkbn47Pu0NO?=
 =?us-ascii?Q?clx/rhrXw9P6z95OpTMFqgUqnlp8kHRipkSeKO+k/TLPGKIooIyxe8Z8PGgk?=
 =?us-ascii?Q?89cNgz4kouWTzpJBvLmMYAkEGzN40Wn+13g6HqiQqnwrzMSyJXhalCnrHcZr?=
 =?us-ascii?Q?xBUYUSZ5xGm/2haQXHdN/nbc3aGV7fHDpnUys1jKMo79k6Mk95vzhmuT8SYS?=
 =?us-ascii?Q?kQsLizpXrsFZ2nYWZEdUmJbZcoErkrXwvovZibGUQaevz7wRJg7PxGHw8vaV?=
 =?us-ascii?Q?YOIEsA6XYbScNM6lXCf8PlzSpQZ+F0v8ajS/3DkLBZpYWtEF9J6xIRLmn3wk?=
 =?us-ascii?Q?cLBN4z4G0EZ6+kcOV1DG5SnRxCSfVzUAOC7jIgDjFOVhITw6qyGdfxZWT+Gv?=
 =?us-ascii?Q?ipWVaQFtFLAZHUqatNAbazblbe4i6FwNve7KAIvlrFl6NDg5/jdvVEtRKPBP?=
 =?us-ascii?Q?iBzvJMa1UMB4hOwhBCWM79lHN3H/jcCB2uVvBGBTgFDYlzxhf71GfZLRfoF0?=
 =?us-ascii?Q?fd87zXwqkImMQgm+pZ2R60V8xXyY0itYOhLpKiMkVmUAKMfsnbGli4TOsIY2?=
 =?us-ascii?Q?YzXShHwie3ETSgmJESEveqgkBy8/Yxz3Dalzwkm5d8vlWZzP0tApOKQMXBds?=
 =?us-ascii?Q?kiAM9s7UoS10TvHfqUcmuclnfK9+TJCvMyety8ZYKcz928i0lAO7xZhbiUWB?=
 =?us-ascii?Q?c6lld2M5aDYSVrrAtwDJ6dJ08TYM2CJ0HbapgHnjxzoJdfYotsUaMTGFa61F?=
 =?us-ascii?Q?zBIZyUPTJjTn0shZsQ97OkoPB6NeidVX0/It6jCtq71M7+/k05AKoPTri+l+?=
 =?us-ascii?Q?k8vJ0h/PPH9ywFY=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:13:47.5095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 071c4d08-1074-4322-69a3-08dd393b20fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7314
Message-ID-Hash: HPSZFSWKO24NADJ22YMRXD5GWGFSEY5D
X-Message-ID-Hash: HPSZFSWKO24NADJ22YMRXD5GWGFSEY5D
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HPSZFSWKO24NADJ22YMRXD5GWGFSEY5D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

During runtime suspend scenario, SoundWire wake should be enabled and
during system level suspend scenario SoundWire wake should be disabled.

Implement the SoundWire wake enable/disable sequence as per design flow
for SoundWire poweroff mode.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 71b3cf2df89d..187006e68ad6 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1139,6 +1139,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		amd_sdw_wake_enable(amd_manager, false);
 		return amd_sdw_clock_stop(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		amd_sdw_wake_enable(amd_manager, false);
 		/*
 		 * As per hardware programming sequence on AMD platforms,
 		 * clock stop should be invoked first before powering-off
@@ -1166,6 +1167,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		amd_sdw_wake_enable(amd_manager, true);
 		return amd_sdw_clock_stop(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		amd_sdw_wake_enable(amd_manager, true);
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
-- 
2.34.1

