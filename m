Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC59A16A5E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:07:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E51EE60280;
	Mon, 20 Jan 2025 11:07:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E51EE60280
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367672;
	bh=e53Pigm6+kk9T7rRdj1YAWi+FELpAOjIl0BuGYekSYc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dE97g995sLEJjzTUe5N59hiEqwf5WziTY5UxRaNJwp/gj9JwQqDSYbMPiuCwxOPmT
	 g3zUHgrNuRqbrZxvqke+544mChZ2/eSAhLeW3g8EFi/+Sb3qBWkPUbUKHYci5BiUug
	 dAxGZvbo/qua54YbZp/tjn/XCjBTTFaAmN57up7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 261A0F80623; Mon, 20 Jan 2025 11:06:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC7BCF8061F;
	Mon, 20 Jan 2025 11:06:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A382FF805AF; Mon, 20 Jan 2025 11:02:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68CCCF80517
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68CCCF80517
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=CtB3B6BX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUlSRe6J91gX5Ws53ijwyYHBEW05QZ4234oXv/IRdY08iRzSaDOzXK2mArCRQUCCD5qtKmYHeEM0TuMYUjG/tE+IG9dRnvpjV5kT6vWRy7x8q2LurkQti7v3lH4STnYBUCjhhj72hp6202D+5DOoALxNNmKUOGpThsGJBlfHjcBA4nN0T4UqDJ87zecEmv6MCDjSjUSgZWRmv5PDFSZQh8k8/wkitxN9p28oAUKhKjtoOKhC1M9Azw93CMII0B2IWrDl2Zd5JMtXqGQDFgso/+EvmJOA/ZKMU0ulhhGTHju744YZ1hBAQOMMSjcvXDHsPtSLupgWOCuNMTiRIItlvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbFZAX+8GKFJ7ojVAYOMqZVKyHnQXs/yp4BhZGkQpYE=;
 b=KYNBKaeGxnimg04BAx9JBnQtivlgIejoPBsp6Q5dA+6iY2XFwG1molG5GMOOHCjGQXEZ+IaEK8OMttieyG/YLkSAKB66UIY4iUUgX7QtQPfWYFmwEJznjmQXekCF4b80RG8b/WQSlEZPVne8xpxTzuDef3UDplNzzXLdXtvjZnhBMPa+o4ui3Mwxc4ZlOGlc1dUH5NUpB+ZTz3kh1DjFRd0G7Y68givxAloTusPOzaRWYuFDE4zTYeeWrCYlYZZsho6hXGE7Zq1wst827FUVeZzZv5HFnGwlubhmStlTMdLQLL2XTaGhqzFZjl+8LLr+/j3v5z56lRWfpMrHDz0K5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbFZAX+8GKFJ7ojVAYOMqZVKyHnQXs/yp4BhZGkQpYE=;
 b=CtB3B6BXIsD1a3/oTb21oC+6PsgU6bj4wBnXJCgilGTqc5KPvLk2W18IGJ7yiDZAwWdWhlVjuzNPDtBNFRkoalqVP/gET0Xt+zPc0089bB+hxtb+Tr3mecOaJgimHzV20t4Lm4sgmC7XYai0yxNiSe4cxFJNNa0L3PwfuQ7/Ij4=
Received: from CH0PR03CA0256.namprd03.prod.outlook.com (2603:10b6:610:e5::21)
 by MN2PR12MB4238.namprd12.prod.outlook.com (2603:10b6:208:199::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 10:02:41 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::ba) by CH0PR03CA0256.outlook.office365.com
 (2603:10b6:610:e5::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 10:02:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:41 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:37 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 16/23] ASoC: amd: acp70: enable wake capability for acp pci
 driver
Date: Mon, 20 Jan 2025 15:31:23 +0530
Message-ID: <20250120100130.3710412-17-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|MN2PR12MB4238:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f29af0-9aac-406e-c6e0-08dd393993ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zhm0HXJPHqtSciINBpuK0iHi2clmMIAMW3u/xARUQJiNUkEuS/wVQbFalCiy?=
 =?us-ascii?Q?Rsyx2UPPDxQQJaVor5MWfAOWDYO7N0oSKqOnDUh2P/F0SOmN9X0slN1ea5d9?=
 =?us-ascii?Q?XTqw7q2Q1Kk9Dw9NlYPywsohdwg9TBqMCu3oeTnKY4//RKoNXeMLSdasAhJx?=
 =?us-ascii?Q?AHclVmsMe37WNPTEiD8Bpq4bUoZnFV1Jt/RCH65b1Fv/buaL450PAi71uAU9?=
 =?us-ascii?Q?gA1hImxh2A0WYRW2gOXOPUBFz/nOzZAAWvQyOkx6anw2xKycbyt6QTPAbSfE?=
 =?us-ascii?Q?zy76nmry6Yz/6zCBp5sJoZYZ3mJXG1P9CFxp76HS7B5q2vBpLlNd/0O6MVMV?=
 =?us-ascii?Q?kXOXGoQtBKgnyK9NrN0S1E5Lytd5zKovEJaIZsSqrzNNM7q6eca27PJuWKzz?=
 =?us-ascii?Q?d9gB/Xii0j4EbA9N7WY3Fs5HEKhfcI43JcHeAmvKTnQu6OogXUX4ALN6+VWW?=
 =?us-ascii?Q?yv+fPJn4yxLBfRNmYxJ+vIxMQQV607hS+pJcpFnIYC6OpX+/IrlOXNWIuwem?=
 =?us-ascii?Q?iYXIZwIwYWkJW/3ZO9aV4TftFHCPczfYqzpIuw8CeVjgKaG7Jpk66kiS/d2t?=
 =?us-ascii?Q?aNz/qqsg9216NirZGu6gJn2MHO6CBCDv/lCVcm+NY00lb8Ydm/e3tGPu9ocO?=
 =?us-ascii?Q?TAePF6xvRiQZORJZRKU4JI+5N0qFqRMOFGhzGZ2J4G0o9B/EKOt4t5OhOsKK?=
 =?us-ascii?Q?99hPx0NG/OfBQYK/j40XT+yz6FdR8hVc/RQv0qVTomEyDU9EuPvY837MVfAI?=
 =?us-ascii?Q?blTaaYtSOzIG57WtciXgC7DE5s+txPNuzae5mPjKF/4mOQ7cbjEEDq2DcNil?=
 =?us-ascii?Q?+oAFL+ochn+dlLfo+7I04Umzyk29PQaDQyCMFF/FiNJ8SOiSaXsUA/6OvnHe?=
 =?us-ascii?Q?29EMQfrovnfcx0qDK/nil4rTcWedVgYNifN9dfVyxGFHeKTogwiFY6l3UdXS?=
 =?us-ascii?Q?HZVsLfaA3N6kQAwEKH8l7XT8RFhz895w72zgRoG0aMvXyQGhOLITT+oEB71X?=
 =?us-ascii?Q?HqXU5ZwyuzWjmoO5Jao6Xn2BPv0cIRzaZkPfLeYBUcjaHlwOLj2SmoOiqBps?=
 =?us-ascii?Q?YNFAfZ5fBT2AOO7HLMmORs+J0sJ7JtEXuqHxb8ClFHwIZlswOQa8VYozWjVy?=
 =?us-ascii?Q?Xm1aUOc4QdSlJzs+JDL9dOJ6O7urnFSrx9UbflShkHmFCAOxoKqlmaiaxp1M?=
 =?us-ascii?Q?2tNpRVaT6/JA30uIEb0avWUvVMJpghqwmKKGXcHq8InwUlQih0vp4euxZIia?=
 =?us-ascii?Q?fJebJ2+Eho+tCnYOr+NDuOTsFwzpM8vYCG5oLEvUXCqJIo+4MzywElKHygBM?=
 =?us-ascii?Q?uH9BoaPeFzGkrwONPt7Wwn28jaTCucV/pcbQwaDaaIP792RMw8gAK4Z/WjYy?=
 =?us-ascii?Q?M2e4caosVbOpozkUwcHbu1/lt4n52pbfdZ6Wh2sg8LOvA5rh47E+Row3CFDi?=
 =?us-ascii?Q?H/i3Oy5QwPx1QaKIqyzxXvBUkzD1vFbCC5lllQ4uShGX320nYqMBWLPqr8wb?=
 =?us-ascii?Q?ONPkp+jiKQbKlMk=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:41.3449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 94f29af0-9aac-406e-c6e0-08dd393993ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4238
Message-ID-Hash: 57JG5PUSACITQUECJQ4PLJQG73NYUTEL
X-Message-ID-Hash: 57JG5PUSACITQUECJQ4PLJQG73NYUTEL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/57JG5PUSACITQUECJQ4PLJQG73NYUTEL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enable wake capability for acp pci driver for ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/pci-acp70.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index 9b298ddb097c..1e22be4f11bd 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -555,6 +555,7 @@ static int snd_acp70_probe(struct pci_dev *pci,
 		goto de_init;
 	}
 skip_pdev_creation:
+	device_set_wakeup_enable(&pci->dev, true);
 	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pci->dev);
 	pm_runtime_put_noidle(&pci->dev);
-- 
2.34.1

