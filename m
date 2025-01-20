Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5FA16A91
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:15:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F02B460292;
	Mon, 20 Jan 2025 11:14:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F02B460292
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737368102;
	bh=rUDS1W7GSY9x3ufKyR5TU335l/+EBtmFCipUhA7YfhE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eS5RdgvdlRxp+6kHAY3cXFlHCzT1iaRFCToeTkgiVIcEbP5bCLbHLhJoZQpjhZNot
	 GDHM13RB9SNHFddWvVq/GvDHZBHPgbnATB3X9TS4aqtpEtG50O0gM6iK7KIm8B6+Iq
	 d42gpffwq3/fuOa0SRbvoDJb8VTJNplaurUhQ7+Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3820BF805D4; Mon, 20 Jan 2025 11:14:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50221F805C9;
	Mon, 20 Jan 2025 11:14:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2B54F800E4; Mon, 20 Jan 2025 11:13:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::604])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81DECF8016B
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:13:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81DECF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Xb8rLpEU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RU+NfdNIdxLhh2AqpFHqKA+SalVae1I5afvgjqUuz3NrWq+0FJLiI/l8psCpwC84m0hSnzqnqBMmi9aCeTOrl4JwDwF502B98MdOVCXQEBzuHnXop5F9IPu6XoeF6Z8dXLEXAlH/S+zA60Mb+DDwfFh11a1dnHcZfJNAP65Tfd7ZXDcekUOg0+VW8KvQczPlWsYaGuOkrqJ3yZxsS1FGOi6iDn7iMmUZOKXbZfVDJ7JTK5olvQ6HZCwTSgks+bN73Cj3PmH5ThdutjsIJebVmx2BIhTpaVzUtJE/p7Wnfxw05ELJdeKonUedc9gyH4xSG20bRqfee6d18NKeWKp0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+TII58PpEldSfBplN7Tj5YOOwq3yThcAXWsizYmDV4=;
 b=hI7KtgYB6x1sUBbHtP9acAtAe8sj3yURMIOFWfKtBc9AiUzxmhnYq/aRr42lghRKsuDYd3e9f0qDFQdJ7mqBijZTzMjwzC2ZvCmVrpZ05lfdC+jMx5OlRgi1mkzlAfPPGs2+O+aZKcPpt4GgtJXiHB9+AVY8QSkOKbTspXFC+pdIRPja73EQvIQhtvPlCEAdjoRne9VXkM1bDPvRcfhab725XC2uDoE0BSiDSm3Shx57TgIUaQUjPoRbpEW1g44xU4l6RUfRVdHCU0DoZujsNJu5dnhP/gmNEDNSjZQao0WUQALapYPHr/4R56AKOJWBumTd3jASnEGVFowqrqR0Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+TII58PpEldSfBplN7Tj5YOOwq3yThcAXWsizYmDV4=;
 b=Xb8rLpEU6UkYeTC19HQVBKKvX4RY72uWfp8LN63p55dWZhy6IXfEkLKornDFTQta36he4TM2NUic5L8eYsztANw6VGpsFBuxc6st8vyzBslGGiZwe6Ppz3iUSUUXr7e1MPTkl42Psrj4qcJb55NVhinxfqbxYr1jrFNMmB0YPZU=
Received: from BL0PR1501CA0003.namprd15.prod.outlook.com
 (2603:10b6:207:17::16) by DM3PR12MB9414.namprd12.prod.outlook.com
 (2603:10b6:0:47::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Mon, 20 Jan
 2025 10:13:51 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:207:17:cafe::a) by BL0PR1501CA0003.outlook.office365.com
 (2603:10b6:207:17::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Mon,
 20 Jan 2025 10:13:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.0 via Frontend Transport; Mon, 20 Jan 2025 10:13:50 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:13:47 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 2/7] soundwire: amd: add debug log for soundwire wake event
Date: Mon, 20 Jan 2025 15:43:24 +0530
Message-ID: <20250120101329.3713017-3-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|DM3PR12MB9414:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bf4005b-14ac-47c2-c69b-08dd393b2301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9U5ZnFHnRolcVd7+byS/Yr1zP5D7DoLRyaYlrhFDTSpgEDLQweJdlTYl5kFF?=
 =?us-ascii?Q?spVC06MwR1i5/iT9Z9969lxfDBvJQ2sqSaJXmloOZLbHzNtmSpCvdkpA/9T0?=
 =?us-ascii?Q?AvYNH8lmEM4UfxbkjFHdyon3G8ZfcH9s8e4v/h/4BGMIodWxVoGstzBoPbd0?=
 =?us-ascii?Q?zlPVYUivrbuNKyax7vlecchM+cumyHdlSvidsLXIeY9IVIhNMZCX0/qets/D?=
 =?us-ascii?Q?UIyCLuG+2Zg2Xucu9wNIe/73hQcaO5KXHNrZaIoWhCTjyeSy2j2+z62+pFxb?=
 =?us-ascii?Q?ZxC4Jy/vw5E0J+JaCx5FKB8iQZbeRwPhIwlMO6nScp7Cs08HP5vJIVP58O9M?=
 =?us-ascii?Q?Ec8xbz7a3zCNDKZcQdIDYihh4M+HyAOXMgND835XbR8GWp5gCAsZgcPSbKPf?=
 =?us-ascii?Q?4UYtp/mZReMhFGASIKyeCV2muI8YGVm955p2XcyfYle8cHLeqPNy3/wtpgba?=
 =?us-ascii?Q?2j8N+1EVMhQ2hxygBR3xixLtAKDTKDt4ll59O2pm8BWbzV3DOROXIDv4VV9D?=
 =?us-ascii?Q?0jO9QNO54i8duW3ajkEgC+0wCGOiDCWN/dwNNNPsmcx13QrxqsLCmkGpcJ14?=
 =?us-ascii?Q?lBNatbdGnKeHeseJCYYQ2d/gUlr7+Tk1UMemwQq8ooZsFXEJzfukduXPk2vn?=
 =?us-ascii?Q?b95ZvKjCO0BfL53u+VhKgFlhi21RhpuaZJB/dXb61dPlnSSFJrKVnDsnXx/X?=
 =?us-ascii?Q?PqUM5kv/C5n9Dz3x5dsObM567u2AKaBT8R2EmWKNIqo3wfqPqV1kkl0pOHZL?=
 =?us-ascii?Q?3JP+bmj8UlQ8bY2GZoOkWMBWh4ilPr+2tKBuN+a7Bf8k7x/zKkr+VgBfyXAI?=
 =?us-ascii?Q?1IvjLa+3pgdjZGD5UOTjUJ5LJsQf29c6mJp7cjvyIbBHSuC02wqHSzNsksBG?=
 =?us-ascii?Q?GJKFNlx5t2oRMm5ZNdB5QMWIdzFwhkEFIx/JtH9Kv2q32GlVmB0klBLebFM4?=
 =?us-ascii?Q?FLKwVTk1eMAbRQtgFb3K9vDB2aylmmYlbjIIN//iM7opQmp8Xu2wws46NC+F?=
 =?us-ascii?Q?Vo/Wm7vrXPwF3sbasCR2XS94H2QG+ziGuxHN1Lc0rQfGCvzejc4RPmekNAue?=
 =?us-ascii?Q?tUqdsoA/BgDyMPnLcip6jEE+1unJXP0Bll9NmNLVv/SeVlUWeJkrr+4Ua5Xt?=
 =?us-ascii?Q?zPY6fm9QjO0PDypUwDprN8R7a8KUPmHPVX4bmfoXS0WabMpMru4k0v/mi1tW?=
 =?us-ascii?Q?YvoU+MA/+05Iujsydq3M1vMgY05Jl4RBl39ldxeDesoxaBu0iUb5GmCs6Vwb?=
 =?us-ascii?Q?+zwmHPVjOITOa8i+xupZRI/0otXW79CZ4KdGC26bWCEglXlDZBgmJuIa3xYu?=
 =?us-ascii?Q?VNcZJmU1ZYfdd3cTemUmdL30muKtghWfGMLFU8DLlc9KELf3MIXuWgR3LNDP?=
 =?us-ascii?Q?aVFGNtwMzb2WHCxSasXNFOnd2xwj3L9j7lFSgZGJwjGRB1hswjsXHd5biw2a?=
 =?us-ascii?Q?AnMhU/aLKF1wcHHUt3mxOm8TWWqsZFhFYD2C1KeTTvJLN0rgwa1/8mwklpoE?=
 =?us-ascii?Q?coXy5uD2O68qiPQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:13:50.9026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9bf4005b-14ac-47c2-c69b-08dd393b2301
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9414
Message-ID-Hash: ZVURNI3RKFD7NMQYQU5IG6TE7QH5EYHG
X-Message-ID-Hash: ZVURNI3RKFD7NMQYQU5IG6TE7QH5EYHG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZVURNI3RKFD7NMQYQU5IG6TE7QH5EYHG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add debug log in amd_sdw_process_wake_event() function.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 187006e68ad6..60be5805715e 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -849,6 +849,7 @@ static void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_chang
 
 static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
 {
+	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
 	pm_request_resume(amd_manager->dev);
 	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
-- 
2.34.1

