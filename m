Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CFE9FC3F6
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2024 08:25:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A654D6027C;
	Wed, 25 Dec 2024 08:25:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A654D6027C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735111549;
	bh=rUDS1W7GSY9x3ufKyR5TU335l/+EBtmFCipUhA7YfhE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SE/9oc9NgZuqqzQ6trMZPmqje0ss7iMzwN3rMHnv9n6oWA+qraM/emYW7w7J524ge
	 vqM975xRmn+7JjgU20Koi/gEKqVHazGGlRdayJVL4azl1Xy4OEoWMHhXNLoP9gGKFQ
	 DB36dpsIEIXzeF3e4FMbIz/H3i/EG75mD5zbjh5A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44CD5F80602; Wed, 25 Dec 2024 08:24:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70615F805EB;
	Wed, 25 Dec 2024 08:24:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFCA1F80269; Wed, 25 Dec 2024 08:24:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::616])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 881D9F8016E
	for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2024 08:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 881D9F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=oZzEVJqX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHmq9W18outfoJUZIE1XlH/QK5S8dOo1Abe5oPtuvQ5x3Q0fqjYSWQz3cyfbbI/L1t4a1RJephq6Xyj0aZbcp+NZ3X8cs6yHOAXvUH9wy5Dmg6uTAQBkqJNr/B2kVJdDB+gQUdb3nDUm6ZV3OTfc2Rs7BCh2qZOGheVmkf3zLECO2WfvwAkZhnAX8E+NhaSnqbVee3qSlzIzr0xDQmkxz3dMYhHmDr7IeZk2YP9UTeS8pjM5cGh8SyBAroUdv8SsDOt/K35DTmZsNyFBubbwdNbYl1fqbp8ExSnvh+UYsSM4zfjMpNjlpCONTzniIJYAgJqCRD4JGv7ny8tI+FuFnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+TII58PpEldSfBplN7Tj5YOOwq3yThcAXWsizYmDV4=;
 b=RwJps0SigMhBGxFxdU3Z/ihj1Zgrv1oXOm9K7h780L7UVjL4UIU2/VuD/FsnTPn8dYyydgHNLQskYnwxJGfT/86l5W1V7BVmHNOwJ1eYRnwwIe7RTW91kz1YtlQBQWK5ZHXIlovQyhqBI2RAcZXtGw6ELe7dSyW7T0EQUDX6ebXtcfN29gJja5oS2owXIpksztUzvniJs5IgifQnVOAkIjZbPiCRzq98tJYntkytFFjl+wCNosZtwCd/4tJLI1t6c4D9p1erAennA/LNYBLcSOMSJ/HUi88qdRniH4nbNuI+xM2E3xazx8IN+/5Ehhr/bmDLsd+10NNRA0iVkH3Qbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o+TII58PpEldSfBplN7Tj5YOOwq3yThcAXWsizYmDV4=;
 b=oZzEVJqXSA3hAf6QvHl38WAcoZNAagOxA6KZJhO4NeloZfDnD8r5+0w4EZ8rvqn+WwVEvD5/tsBmiDiyZY55QeiiI9LO3wfI+vNqk9cBA98BnsX/6MYTn7DFQ5lPb/T9ge5WdYxs/npa1y0sB6N79TDirkZEjPsMORWhTd0Cc+A=
Received: from SJ0PR13CA0002.namprd13.prod.outlook.com (2603:10b6:a03:2c0::7)
 by DM6PR12MB4138.namprd12.prod.outlook.com (2603:10b6:5:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Wed, 25 Dec
 2024 07:24:23 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::d4) by SJ0PR13CA0002.outlook.office365.com
 (2603:10b6:a03:2c0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.8 via Frontend Transport; Wed,
 25 Dec 2024 07:24:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Wed, 25 Dec 2024 07:24:23 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Dec 2024 01:24:19 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<sanyog.r.kale@intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/5] soundwire: amd: add debug log for soundwire wake event
Date: Wed, 25 Dec 2024 12:53:57 +0530
Message-ID: <20241225072400.912445-3-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|DM6PR12MB4138:EE_
X-MS-Office365-Filtering-Correlation-Id: 7292b5d3-b010-4350-e94b-08dd24b527cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ha3XbIfdlScqskp7dhV6YIp2aC550y7aojpyuxCDEr+0QMAgBEKblOACsQ8H?=
 =?us-ascii?Q?Rq0gHgRF8eAfOE/NKuRTZCcMaEnF4NHumMq9DjV0VE7Av/e5WdQ1JFA9YkjZ?=
 =?us-ascii?Q?vGCYRGeiORGSfOQygRtwPfbcmky9Wb1NoAAAIMac8PfiTR08C5PtPhh8BpVt?=
 =?us-ascii?Q?Du6pfYSXYkoyqVWPhPrUzDSZg6FfuJqf0Jt5K8UyGBH3Tvd63qHpw4fnX9/i?=
 =?us-ascii?Q?KiyER6m6d0EwxDZpcxNduV8858JQO80+xI9K4gHCqzApWafA9r/R61y3ixjY?=
 =?us-ascii?Q?qZtZ0QXhDH+p0ySaCwiSLpZ7U4DSavZHY3J4X9CXjyl+C3nGFonhpkTiab+o?=
 =?us-ascii?Q?pjq3k9KsarMWlvJmF3se60THLCaRVpoiF1eA0VyesFj/1uO+R3+iDkAS+A+y?=
 =?us-ascii?Q?KtU4UoqgFXkKO5QkehEtmvG7dh2EIVs2c0wN09iFn6nbnKHSZSTWYTamnH0X?=
 =?us-ascii?Q?7G1KQoP6cnr0VAl1KNo6ZbznKM9Mu47OnaUsSIaQsasrZDD7w5cX0FkbVll3?=
 =?us-ascii?Q?3i0OrmhtndNAJCbMctJ49rG4Uj1ZUn9qW3TeTKxedMfhZ93GhEfgrHOnrn5W?=
 =?us-ascii?Q?S2D5UMkoZ/4A58qzVx4az48ykfaH8/w0NCyPtAQfENObai4i7f1Hfl2oz3cS?=
 =?us-ascii?Q?rtj//Xhks4P8gbMURB3ocCuC8wWKiptbzoHFu0MpefIVoZyZt+7J+3BSosRD?=
 =?us-ascii?Q?5JPpS1kBRVKIF8JtiCzU2XVkPZjhyxOfRCyF1aNfqcfqJM+zIYsQe46QY0O4?=
 =?us-ascii?Q?YRIzw+oTSaHSEFZv7vhoioIkqzqCBjs6KrdF5mkM8q9blW2No9WhGOWeAXg3?=
 =?us-ascii?Q?3nzpkeamYLgU48Ld68Rl6lpQnyTLxbeP99OYmt4+eR2JP7tNsvs6AVSDhU32?=
 =?us-ascii?Q?fh63Uex2fwQRIEgMmv91XLTEmFa0MyTPZGFDWrDT0p0x0fuyAIvRDqqQQ/1H?=
 =?us-ascii?Q?ROP5qUIHOhDpldTpal5dDSxzmmdGUaXj5sPzAfBw/zBOYmazUYK+bUt+X8/y?=
 =?us-ascii?Q?nhtsCjNNI2P+zWtMdD/vg5LJ/HSn7beqVhe4ETh+wCApubHmcyjMPwV3w0UK?=
 =?us-ascii?Q?IESTPWATWeUPrxuN7vKw8Rtl9JPuHf59CSH6sac72ggqMCeoIf/45kLznjiY?=
 =?us-ascii?Q?r2rxeKWbNj1N9fN1X2gwRMgcnY+7MleO9sQCax/bZenzSV5JUjYcbojhKYLL?=
 =?us-ascii?Q?fAAFQzNrh04MNjS5uuacSNMgxLVjWS8948rurSZPuVXo7FzPLI+inPjAas7B?=
 =?us-ascii?Q?a294wnLlWnAqjd5L0V3pptfEY7NnT56Ttv6OiSZ+BHfwelKqcgp7BxVT0omO?=
 =?us-ascii?Q?gsRzyMzdBOA5frVbHuqlBjSVpvcwcIiyg0jPpuRBlzPOLQJ4s+P2cxDJd1ut?=
 =?us-ascii?Q?DIL/P/0Wqp3O+Q3X/hM5qjJfJ7X3uvTKuFPoBFx1XhEtqyDI6+VzaR+qz7S+?=
 =?us-ascii?Q?78s0zEbVwhd1y5j/gERsap6kQ0vOKPc5/PCFyiReUwhaQiNskfhsdo1DDxaW?=
 =?us-ascii?Q?TEzizqRh9vhIHTA=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 07:24:23.0246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7292b5d3-b010-4350-e94b-08dd24b527cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4138
Message-ID-Hash: QXT7S4VQXL4XBXZQFWWYY4XLI7FC4PYB
X-Message-ID-Hash: QXT7S4VQXL4XBXZQFWWYY4XLI7FC4PYB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QXT7S4VQXL4XBXZQFWWYY4XLI7FC4PYB/>
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

