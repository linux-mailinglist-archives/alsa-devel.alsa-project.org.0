Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B75C29FAA52
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Dec 2024 07:26:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1DC1601BE;
	Mon, 23 Dec 2024 07:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1DC1601BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734935173;
	bh=i33nWXBuR3ydrw8hHSncPLvZ85oMgC9gpxRNMiN24ss=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MfxJfEut/6KqjVAEObZuWSPvpWxTi06zSTVjhMDN0lvqE+hJ1pb6d/K5x5gGypKCB
	 AFSkdfbUW2UcC+/1i+UMQ+b8Hv2EcAnjSOenkBJI51M669UoAAm8NQDX2EdbmbiAFJ
	 eZK3k1jlo4NV5mBUpQmPhHs3UAjYeEirPhvimR4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 608FEF805BD; Mon, 23 Dec 2024 07:25:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 279A4F805B6;
	Mon, 23 Dec 2024 07:25:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB3D4F80254; Mon, 23 Dec 2024 07:25:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7747EF800B0
	for <alsa-devel@alsa-project.org>; Mon, 23 Dec 2024 07:25:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7747EF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=OZv+sq7j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmIh/VQVu8NIat7PUkj/uQcZZzEbI55D8eNOQ0RqBxfeW1QUr0fw56C6IXmUTrRz3TfrGMwqNzm/P4/KntIO3OAV2PmCJAUzdhWf0y4Fcs5H60RV4CFsVWIrl+l2sIm8d31R8A7xdy4FNVZ7lpeY7N4r1ZxAcPjlvVpG2NHH08B8CzkOLcCqWQuco6oRCOo22y+Klodqxgxd7FUExjB09ClH7CSGz6kiSrL5LCcGycxwv1nlU+ovFP0loVQyJr+61jaRUQeCsDo5sI3Ry57tp0FO2HImAtqHQTF3mEHrlULyO2D39Sy5q7DQfGn8aowQRV/RCDnPuZFoAH66scSldw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhrnOhgr/iOTzfNR08l4QFBOZKZH0dsfHgolXoNoQR8=;
 b=JndoEoFh41zRRijN8rXobz/S653ZJpc25xSVCXibxDmbV/i+W/jvPyhqoHf9BrvMTP8ijg3EMGrERHw29Nh6JRnTDmpmFlDv43YZHuDsxMHugw23O1XROmq1Eqt33lLsDWsVYn5CHQWTjpUkHwQq9BHbsVVYBZIldpiMMSmLcntbzHUaDq/QQvaLdj9d/8y0vtvlv+tnYBVGNFHj8LFOwdRMSfoHuG0pz/oIJdQQNVqQLC+1f0W+WG3TB58ieyStwksePHfX6VzBuyqYEODuKtl9U3x8ImGQyilrXvsVtgBfDEzKEClz4O0zximENkdrIAdOB/2N0tn11P6ywDDJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhrnOhgr/iOTzfNR08l4QFBOZKZH0dsfHgolXoNoQR8=;
 b=OZv+sq7jYyQM1I0h6S/3EQjpUXU9i4r4ti1m0nvQiOwhE9IitEPf3GvE283AjkXLdHnR/9kDykVHlv+BmhMwhjfcWPCEuEuw9OH7T+ruIXk8f4V6W1Wnohqo7OyaIwWvq3nFG79EAc08Dp8VSfc5jVsbkPvYTc1OcwaZMH10Xxo=
Received: from BN1PR12CA0024.namprd12.prod.outlook.com (2603:10b6:408:e1::29)
 by CY5PR12MB6369.namprd12.prod.outlook.com (2603:10b6:930:21::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Mon, 23 Dec
 2024 06:25:30 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:408:e1:cafe::4c) by BN1PR12CA0024.outlook.office365.com
 (2603:10b6:408:e1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.20 via Frontend Transport; Mon,
 23 Dec 2024 06:25:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Mon, 23 Dec 2024 06:25:29 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Dec 2024 00:24:56 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.dev>,
	<sanyog.r.kale@intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <Mario.Limonciello@amd.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, "open list:SOUNDWIRE SUBSYSTEM"
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH V2] soundwire: amd: clear wake enable register for power off
 mode
Date: Mon, 23 Dec 2024 11:54:29 +0530
Message-ID: <20241223062429.205985-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|CY5PR12MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: 588fc90f-fbdd-42ba-6e8c-08dd231a98e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2VYlCkuU8z4njc9uKwyXun30iFXnHpYC6zDQ14aFwDMxdQtDEsrVIzExPO02?=
 =?us-ascii?Q?J7W54IHLCAChI+kYb7U7xhQZzbAwa1EkQOsAYhYM+qSBjqZclX69XWa3w8CL?=
 =?us-ascii?Q?CXkejE+YQJmDXY1L6OHvwUUgR/Mr3vbILgLIJC15u4q32+TpP40nr7kVMt9D?=
 =?us-ascii?Q?l7ZqkNMdOl9O56h1Yf8gnFdY0aakl1E3CP+E8HbCwZ7AQvbsyL9IF37/FspA?=
 =?us-ascii?Q?Np1bgBykvuLLwmAeWATjGm3kDp+QU1TaQCSEmNSTCkwVl4RDIPREmJgh8hOn?=
 =?us-ascii?Q?ATUa1PVrIKRo4w1kczXQQREAZ5dm0rtATw2GKOhZYizFkk+bXZB/x7/TLJRE?=
 =?us-ascii?Q?8S5Da+8QV4pAPg6lrpGiHgVQrcRe+0DAb8YFObwK8FZlT6SI1BI3b+uPbX+A?=
 =?us-ascii?Q?dhJlE3QofQBRutXF1mAiGvb3/EaPfmrth2SHYM+DDq9GOq5UQREsrltkzJE7?=
 =?us-ascii?Q?3E+4E4JdvaucMf1OMV3IwrxF6/Sxa24I5wjoRF6xG4+oPh2LO9pYogDk4v4K?=
 =?us-ascii?Q?n9hKuhgKcVpfwr9nYpnKSMLvSNbf0pw68CQTkO/AYwUqS4LK27BarcIAU6T/?=
 =?us-ascii?Q?JsBqbh9EHAwfUOttpkGvqX3KFD3sR6eVlKrtyHmfIlocqWaAYeTFQsaIZkSx?=
 =?us-ascii?Q?zynMxGz7jTRO3VxR58PTGkZwcv0CVY2IlE3NGW0h7v9IGUkJATJhIcccuMUq?=
 =?us-ascii?Q?EBpoqr2bVHaXKpjS0/RsYoUDBGHoR4/Lsee7W3E8gBqYmEliDK2ut+OnVoW2?=
 =?us-ascii?Q?5JqHHo2V3fmsXefJdJoNvpiw7YvfrfUL4oGwE44LsBG3VJiiOYwD0DPR72L0?=
 =?us-ascii?Q?Kjq3ULpXHA1dJKbKg/d5U3bqcnDkU6uh4HApbuw+KqVeGNsdE5D3qR349otM?=
 =?us-ascii?Q?ukwQyKT7NnyfeoJTF1IG1/uqM8BCfTvQ7ZGAAq3LOG701Sf9BNUWvgXiaPz6?=
 =?us-ascii?Q?P14oPSMU9gFhRNFPeA1n2z8N4gSLa/HU3IwyJnELU9k5kQA66QkZDZ85yYv5?=
 =?us-ascii?Q?uam07Ax6t21+22L4Z7Yy8quk26O6IGNkBFCtypNatRG2SuG4FdBo88R7YGUC?=
 =?us-ascii?Q?lYNkM1Qurvv2komamdfp0SnezyuMZvSihMn7q6rwmCXZ0vtTGihe90JUvNwP?=
 =?us-ascii?Q?XkgHFb80S11KZkfj3pNK07Gf2cbQ2i3kCIA05RCYyusOKZdRgYPDqN0brD9i?=
 =?us-ascii?Q?XOBPYxJGPyVAp/oWeUqbj7XZWeZ2DThYwLsQ9WyepghQzn2YaR92z9w4TXg/?=
 =?us-ascii?Q?sErvfNxSMBO/khGq1Zxq+UDHO63I3fpqby11BIdqKxBsWGO+muKdXBbYZekZ?=
 =?us-ascii?Q?CbHpx/gtkbOlxWSQnXruHORfNyTjejYAC/neqlDMKdUVdctaf/t4duBH9OAc?=
 =?us-ascii?Q?RaQhuKQFQv1l0hLHzpz9UdaqaKfXz8n2avxOBvVnsp2FG3e886XC/PvRVOLT?=
 =?us-ascii?Q?O8PvtVfNlCRw9oZbGfmH/jC38eN+PVdH/wtOuncZidNZNGT/ru9Pbhv05mCs?=
 =?us-ascii?Q?IvtgzHVN4kJsW3s=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 06:25:29.7410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 588fc90f-fbdd-42ba-6e8c-08dd231a98e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6369
Message-ID-Hash: Z3YISTR6VD5KXSS3PTFTCZEF2OQMFPTF
X-Message-ID-Hash: Z3YISTR6VD5KXSS3PTFTCZEF2OQMFPTF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z3YISTR6VD5KXSS3PTFTCZEF2OQMFPTF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As per design for AMD SoundWire manager power off mode, clear the wake
enable register during resume sequence.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
Changes Since v1:
 	- Replaced 0x00 with 0 in register write
 	- Updte Commit message
 
 	
 drivers/soundwire/amd_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 5a4bfaef65fb..ca271a728a65 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1190,6 +1190,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		return amd_sdw_clock_stop_exit(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		writel(0, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
 		if (val) {
 			val |= AMD_SDW_CLK_RESUME_REQ;
-- 
2.34.1

