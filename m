Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E859FC3F5
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2024 08:25:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15905602A4;
	Wed, 25 Dec 2024 08:25:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15905602A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735111531;
	bh=zM2zh0uJM8rvEjfNegpihH264PTE4XAZU4iWLdI353Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ElKazsitYQUQ1NQxMhf7xyqLv5JZxV47HNbVQ8QnDk9ScLj5vcrsuv7X4k42crKA/
	 g3iun/njlTOft/fBuwjgHaxb8ZgpSZ4G7AMLJTNwDmKC1uxLjSPAQkxgmZ/7I1Wr3q
	 peGHwaUVeTMqknSvQpD6j2vwaj+g02OireectaBY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 256B8F805F8; Wed, 25 Dec 2024 08:24:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82C6EF805CA;
	Wed, 25 Dec 2024 08:24:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C6BFF80269; Wed, 25 Dec 2024 08:24:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::61c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2857F800B0
	for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2024 08:24:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2857F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=toPpxVRJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Es7ZrUx3LTD4lN8yOFweTdttOan16hboed2fnECajcO6rqHV/2DjVBmreA0g4qWQh8DfQtITjOGy7Y15Umh7v91wbMSbzOo6Coq1mGzSXJJ9tvTm7EH5+1OJxfa0TUy3tZLvOgt2NSVfsJS6VDY20/rEzQM//3gY/7uBtqdLI4dD1trEfCLJp/U9VyL2NiRmRFUvYdnS2jynUvxC/4HgdZivRdxDRa0MG9UUQr8J0JFSUI5bS5d5oxwuXdyhQ0jDKprQSYcs2Lb7e5o+Oy4ngez7BT1d0/aRSC9GdHqiKzDFzaRHd5ZnROgqCKmbuM8jMuFr7qiCfP8h+SK9noGWAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLKy6dTIYcrqkT+OBBEkmVnloXRQGYN6kFXV5rWHDsk=;
 b=OUbXwsn8vovcShrE2uNFFJF8kP3roV7g85ByyNWjnzSzZ3/VZRceMYYyHtleJf4c81O0/FKSaoKDTB7+Eg4SEzVe0wp2CTg3dib26Jv7k+vq0o6DTEZV+ZdjFOEl5m8lorD4Z3tVkBOTeIwW25WIBdqp2Cqcrjwg0hKAHa3drno2vJF3YL34Mlx3rr7gMi+QSuDMCX8L6z6CPcDq9uzBYWvukrkc3MuLa6QLVPLnuVUAT6kErNe7iDYahzmxXbrG78f+Yea0GXbBamOm2eezF4uyoBaJXnWTeRTraJrZefwvX+zEoKeXDXEckp/18z4FiUjal65zZAhpH4RJ2PBb3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLKy6dTIYcrqkT+OBBEkmVnloXRQGYN6kFXV5rWHDsk=;
 b=toPpxVRJYm7oG5x+xouzZRGUIPfhd2LJaGoYnaqRNjfwqc/uwONP42vzGPBvV0fAMhqW0vHP6L5vYRTrbq911xtvaFU/pfBFd9tjXdIHmM4lpJicFe1tgINTIHBRN8shv0tumpEiCD9x6lj8dPEu+6w8EYef0EbXwL1zrFN+/AI=
Received: from SJ0PR13CA0017.namprd13.prod.outlook.com (2603:10b6:a03:2c0::22)
 by IA1PR12MB6236.namprd12.prod.outlook.com (2603:10b6:208:3e4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Wed, 25 Dec
 2024 07:24:21 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::65) by SJ0PR13CA0017.outlook.office365.com
 (2603:10b6:a03:2c0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.10 via Frontend Transport; Wed,
 25 Dec 2024 07:24:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Wed, 25 Dec 2024 07:24:20 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Dec 2024 01:24:16 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<sanyog.r.kale@intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/5] soundwire: amd: change the soundwire wake enable/disable
 sequence
Date: Wed, 25 Dec 2024 12:53:56 +0530
Message-ID: <20241225072400.912445-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241225072400.912445-1-Vijendar.Mukunda@amd.com>
References: <20241225072400.912445-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|IA1PR12MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: 4106f380-dd2c-4a1e-ae22-08dd24b5260d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?l+khqjruzU965Ev66kkuGdo0iCwtdEGxCf+MNjRP8ZLujXNv0Yw3gaTmZif0?=
 =?us-ascii?Q?K+HK4DUv1eQw1SaRmawAdAFqHqLzKyWGgzC+z0vsit+039dzy7B19dV1vZ/U?=
 =?us-ascii?Q?jdtZXZ6n2Yhrco2rNgIPXQpGZOUu63cGbVDjGubPPgREWkq4G4XLrx0zqame?=
 =?us-ascii?Q?8hXJIoozup87dAi8Vf0PN0hsaQ+fgBr5aaU/jGMKeFazdixw1jkmon8A1UW9?=
 =?us-ascii?Q?wyQwT6cKLm5kQbackQcFO7MDevuVxF8QUP69NwYN8snHXKizFhmVri8tARaD?=
 =?us-ascii?Q?TGf5wXsDADEaDZl/+JmtXhTNvPpu4sxCL/TDsluWaH7gpE/36/lWXD7FfZUB?=
 =?us-ascii?Q?0evkLbtllz1e4SdaMr7rS3qVFkQx8DMBFZ5da/jbgHKwkYet7DWObbE/KEhw?=
 =?us-ascii?Q?YNTkwjYk8yGjjbhBz/rW7N1T9SoqvhBnaOIsDLr6TSSg61fgUTwSFwsucGmX?=
 =?us-ascii?Q?goIs01BcOir1hPHKzV9Risw7h1yGaXsaFKyxvpzn22TQXUYD0vXhOzJa5RTx?=
 =?us-ascii?Q?teM1iZzMN+wHA2586YE/FDLr+uq3P9j4Lxrq06rgC4Lua61XfnThLaxjAi2a?=
 =?us-ascii?Q?xryEx0DFaSb2mpPWn/ti+kodTTaC701WXoWFTvmsyVWH4rBylWDMYr5d1M38?=
 =?us-ascii?Q?zBDRQTrT67UtxZwTOGcgsdDrLeU6MCYCUik4Cz/bNS+SzZhVMAz0JWOQzrwP?=
 =?us-ascii?Q?3BDRoyVMmCFVozHNTi6fNBY/JpnMPzfVQm7Cnn8CesvA1RM8x9J+NLopUOoq?=
 =?us-ascii?Q?DcF7zJL7zvq07UIQmcDujuM2hK/OimBc1/HgvcU22ptjjhChQtmYyKzv9Uw+?=
 =?us-ascii?Q?pp46n6lrTsyLCTXZv64JZYlWCM/JejRNaWRiq8W0/2Prec52xSHHQkjAlOoq?=
 =?us-ascii?Q?s++keQQXIU+4s16ZErB+CZoxgH4Vw6hZnxCB7bGl9pE+OKbVkgrcDhLh4Hda?=
 =?us-ascii?Q?HvcvLhM2s/zUa3bzUHwGRZmJre3fPOA68KT9X+Uij6tEpLQglmlwmw0OuwGZ?=
 =?us-ascii?Q?aBHJ0Z1t+W0sdGAyt/xmtOaKLpRJZlB2q4U3L/VTNp3vS9icPPM9KB/jZnHF?=
 =?us-ascii?Q?OnvOaVFaK/wfCz6rk1JCaqvwy4hQPahscDsvp/4ux54kmQ3aaHKcGrjHJuhJ?=
 =?us-ascii?Q?FuvzEfU8bjAJ+dY1+KB9n+2nr9M3BBsF4V2YVW9sSnR9Zz0tD/FyAU3wq3C3?=
 =?us-ascii?Q?Sr4GMumgJPdk5VBgc6ZQxs0uBGZhnNAWgtaLB+Ci7DjqOt+DfQEx4In8Mvjc?=
 =?us-ascii?Q?cC03b0Re30ZpIHnADsOwTv3lHv1B5BipZ52icf1/cTug1tkD7CiN3tSeozR2?=
 =?us-ascii?Q?WIKF+RMRm5A1Sm6x8iE4SVzE1LgkKGCIZ+4YEDjwcWd8tCZHa6HFSOIakQGq?=
 =?us-ascii?Q?ymgBQgkRM+zbhCnsl1Ub984HKglFHlDp0JfOZNRqvfuDDfKQAWQXWYLTtK3X?=
 =?us-ascii?Q?OCQ8q3ycCojMCg8/g0X1OiXi/spLsa4aF1CErAH4KlhMSgqeX4WNwioQqxpJ?=
 =?us-ascii?Q?YrSL49ChqAu++qo=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 07:24:20.0870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4106f380-dd2c-4a1e-ae22-08dd24b5260d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6236
Message-ID-Hash: UOLWDJMEKG32S4GXMD42VHDHQIR3NPZW
X-Message-ID-Hash: UOLWDJMEKG32S4GXMD42VHDHQIR3NPZW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOLWDJMEKG32S4GXMD42VHDHQIR3NPZW/>
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

