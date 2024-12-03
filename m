Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6CD9E1742
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2024 10:22:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6F62E72;
	Tue,  3 Dec 2024 10:22:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6F62E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733217776;
	bh=JCArq2paes462V82FvolIinFT9U/GeOLXOi2cG53vD4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AMGENPkD48Jv9jeY5uuEioDZW1pLdFhlPEaUBDUsVXC/cnv5xbuOn9zZXtsexKQ1G
	 LKstkqV6DWeDyaVFK11TLHnSHCyA+r14TlVaAjuMz09yMs0cyxR+IK6V7IQWpD5SFT
	 1CnG+ISH0KquTyU/OcYcifQWZ9ZisCmnISoMourE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85B98F805B5; Tue,  3 Dec 2024 10:22:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFF6EF805BB;
	Tue,  3 Dec 2024 10:22:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 529FBF80272; Tue,  3 Dec 2024 10:22:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C1FAF8003C
	for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2024 10:22:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C1FAF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=du17ts+1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVYDzpwFC3NNq/43WKMyI6UfFULf0gOSBOPeunXkgCM5Z8zZtZVLia1n/u7evwCKT7Z2JwKgw2JOvXys1f0HcendZ0L9/qjG89ola6DcRPkT+CtVPqPxPCqKDzLOBY1hNhoEFiAzUJmM1eFWJUSuk1jhF9ow4f0QVa64a2WsThsiykKPLXQBtlNbvLVVwC/t4eyonrS8bhHmC8yGkI2rKLbIphkY7kXQDpipZGrcjX3RjTbovv/uu+x0dsJnPh2DaGTCoyqHeaCO/lOdmlgBpcLzUbvn1SQ15GCOPzp4WM8Ek/3tH9IkKOcuXfQqwlOuSmKFlynAoCVwlOCAg6y3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tB/zHa4I0nkrecKYF8loAUxBra6/AwysO5/gHTQRL4=;
 b=uSU5VguMELh7iwufWHHoq0nEh3ENPVCJhFztodAQa2YPRd8oRroXQpNDoG8uaB9mL7YFD8aThcRavp5z0Eyb6ChRAD0DLeM1ZMgRAeBDRxzM7vWciQieZtVWlPySjrX9BTJo8bI0ytXpGSZbBPnvVyD4z/80kbdLE9vvJuvmmGdnZbeK7Iq+v/xNTKpCm8zTUcTvrZnYUCUGfD+/L+a3cwPNCgqz7Scv7ggCPTZrLEnh9WRZg0rlGGWD90cYmEwpqXGOO9RBgkT2wnBhyp2+ON+GV3mGukMX/P+3qz2A5AsUG2Yacm6MLPRCPxFitt8Lxu0g7IYmOdrZPORxV7sorw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tB/zHa4I0nkrecKYF8loAUxBra6/AwysO5/gHTQRL4=;
 b=du17ts+1DiETwN3XJfNgK4E1oeCVbxf4YWf8bSwkNzfT+gDMB15a6LinrMLGiENIvyryBRIOnZUTdiTnxB8KvZ1JNyUbu5ofk13OGsf6VXzmP66mwsaiF7bSlhhqjm4nxQoraJQUyt8zh4YYYBGmdeiC81Pk670rVlKKtSli3fk=
Received: from PH7P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::35)
 by DS0PR12MB6534.namprd12.prod.outlook.com (2603:10b6:8:c1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Tue, 3 Dec
 2024 09:22:01 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::f8) by PH7P221CA0030.outlook.office365.com
 (2603:10b6:510:32a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Tue,
 3 Dec 2024 09:22:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 09:22:00 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 03:21:56 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<sanyog.r.kale@intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH RESEND] soundwire: amd: clear wake enable register for power
 off mode
Date: Tue, 3 Dec 2024 14:51:44 +0530
Message-ID: <20241203092144.4096986-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|DS0PR12MB6534:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2beeff-f3f6-40bc-c97c-08dd137bf14b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QGjrRnljPKMGL4mrjYEmsbnSE+fQpsemD/6xFmUVCQOFr3TrB8uOdgx+jCOV?=
 =?us-ascii?Q?ad5X3Ku4FghzVK6DgHRDdhbQyMnBmY5IKobmeE/hKk4HG57UuuXP1W44Lov6?=
 =?us-ascii?Q?q6KciYpbq7B6M4W3D67bX0bA4Y9dBGEQHNcrbyBbmvAY1aZSAeG19+kGMKR8?=
 =?us-ascii?Q?7UjHToJz5Q0w2L2YLBdq5x/dZy13BrIuqVt3wkLF0Lc9LLXXIQ3MIQrio1Nh?=
 =?us-ascii?Q?Zb+0l1kLwq6z4AYUsPS91CbZiZHpb9C5EQfSoVrcxOc/VEyaehS+jOjWIOm1?=
 =?us-ascii?Q?6or051IK1Wd5wFiYmbmpdnbDGWUjCBVk4jT6Wl7sHNJ0qgvmJy18PRxDWtEu?=
 =?us-ascii?Q?oxOo0sDJG+Qy7mMEiiJG9pP8wW9iSHsKJXER4I3IQf3GkCXHO2ALlEOmdWpJ?=
 =?us-ascii?Q?6iOJDhGc2X2Y7HIxazQk4Qv/ywbW2iLIHQcpvbyESxN4pXzb4+kBByn4rWh3?=
 =?us-ascii?Q?ca4dqODaewpcBQeOFnVrL/pbaKP24gIy1k9ih32eYAzCoTyguX4QSAQVEW9T?=
 =?us-ascii?Q?YfgQ2JroQ8Wykat2My+SLCD5HNKHmPNmpf5LYkna/mokgvcRyhiybPzp/bl4?=
 =?us-ascii?Q?bBKaStb24OtpibM+J+dhzDxVSIE2C0R4uFuIzBJu7H7LK4xhCvsJMGiNl5hD?=
 =?us-ascii?Q?DnYXAL66DGrNO7bHh3VbMjW/v6ZPhNn8n/1EgZ+pwQpeWJ3Yjc3XMauuAw60?=
 =?us-ascii?Q?5pfqxT4OmKxkcYQCDvZZmis+DjIg1+ozrBi9nLsBAc9OdMzP5cGs8hnb4XgM?=
 =?us-ascii?Q?xHs01E9u3V0RsU/g9k9mt7obRBIAdmjS8edDrR+RgVBdWUy10CJM39AtP1sA?=
 =?us-ascii?Q?67V1eg4ZbXavMtqO1lX0L/trZIgV3rhA88CfcZz98HbTNw1iY1lV9IYBbv6O?=
 =?us-ascii?Q?FHRKnw3vgW3hOyje7Jy+sWjhbZey7sTKJRbei1v+HOqzN9C4ILEFvy+V5p6k?=
 =?us-ascii?Q?G4N42Y7/s3n8I3fCQqkbyROKhe3w3UlEBCIjsCxoAf5ubefXccTYfrRS9R9u?=
 =?us-ascii?Q?ypRSbCoCMqeO/0m9ifClP3eZ2BZlB4b4pg/CS1YQ2hlA+O0/GeEDH7cFszNt?=
 =?us-ascii?Q?ObbfPiGq5uP5L6jAz2GOzq99GcPbGgszaaTCSelJ2OwaVWpKjy7p8Bt+2fyr?=
 =?us-ascii?Q?7Ffw2I2l28qdWTlrFzpS3pX8+kuUxD4ZFf0kELdy6nnPqgdmOAdkkyL+7rbl?=
 =?us-ascii?Q?eAuii4YrRiRsEP+2uEjVdbMG5Z80bOxib4kzyxhX3bB1iQdIQE/REsE2HudC?=
 =?us-ascii?Q?VkySc3OLx7UmuTv9kmc9zuHt5nfxEJRAV9Er8n826DprChZMQA2HbjKgmB1E?=
 =?us-ascii?Q?XVrcLF/E49hrs9aXs9nODvg+jKaRlM0Dbkj20IDPe6hkwVZo3uiIteAws5LA?=
 =?us-ascii?Q?txhZ1GVDHNEhF2P6qw2CfjGlmti9iF3XUE6rJr89Mp07Kc+AP38eE1gEX2IT?=
 =?us-ascii?Q?NDLWdYj6jL2AgQ/n54wdiQUUOqDfb17y?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 09:22:00.5878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8a2beeff-f3f6-40bc-c97c-08dd137bf14b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6534
Message-ID-Hash: KQKL3FVWIWYV4G2P244GNMCLWBAEBCQS
X-Message-ID-Hash: KQKL3FVWIWYV4G2P244GNMCLWBAEBCQS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQKL3FVWIWYV4G2P244GNMCLWBAEBCQS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As per design for power off mode, clear the wake enable register during
resume sequence.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 5a4bfaef65fb..96a3aa6da711 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1190,6 +1190,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		return amd_sdw_clock_stop_exit(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
+		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
 		if (val) {
 			val |= AMD_SDW_CLK_RESUME_REQ;
-- 
2.34.1

