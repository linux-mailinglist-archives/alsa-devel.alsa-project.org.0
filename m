Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DE0806D5F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 12:07:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 930FBDEE;
	Wed,  6 Dec 2023 12:07:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 930FBDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701860858;
	bh=qwJhaUFtMXlF6Dc2H9w2wIKDJQPAoO//CAPxDgFlyEA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AwZLiWUZtILyiZjS1nqIco8wj9Qo/Nt6REYL/FX3r/qRlpZsDnPDnk8mEFwUkMPBT
	 19HxxT2eY5ySbh86vfGRR6OsQ1AhCkS8t9iyHxzHtkp5euMGf1newznlYJ6o687pES
	 AzhszWzBfpnizgNyb/ecWF0UrmIJGKYm2sAW6xSU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95A34F805A9; Wed,  6 Dec 2023 12:06:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 256EAF8059F;
	Wed,  6 Dec 2023 12:06:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 771FDF8025A; Wed,  6 Dec 2023 12:06:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5929AF800D2
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 12:06:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5929AF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=g7IRYH9V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrM5AXdWnC7Odo3YST9jQgW+GE7THzSrfxpj2fNVkZqTlVzcgbaeImCZFOoDrnUTri4MVt0FJQA2Y4jPCcIHwXUKwAuNbiKovo6KRTxyGGbHQWd2/DlVXGjFRzsw39CS7bLWBxoTG37JPuiz+FrGc6a2UiOE+yPqeHBuTWQj5W92yeKP+ZCWeixburGFCWQQFOscCYhqqNoWmIBfzDVO/031tSJXkl+LfNhg0yKUwo3fy9nheGCvO3Qv5hwalgDhApLEUdb9jO0QfBxQ2vOLB3w+AvBWdLeWOYb90oi/htYvBrNDeQxmNLjFHiHltX0/TTgs7g47jX/VI28pWlg59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cv52DuRUYZgv6YRplLvGa50YGTE58yTv3s1SwHY+Sc=;
 b=lyC9iK1f0ON9YCqSbtAg1FY3tmoYIPg3tRuWhqhKdfl2FAq9vBUsLnMPRzwn6+E9nB571Xk72p+oa/MnGUr/kX1HN5CjNhpAGG3FlZ1fArJxPf0zkmtXGEFGSV/OCNTV/dR3hYf3SdUdIwXBNkae91+8zZdBtwGEtYGi5uR/CzIeRkNAjNqRfhM6ynnVfPQcNk/o+QJGJBVqm9j9XZslCUsjhHLdREkwtg9OsukM4f9vMoOCg1hcARBnAbQyErqZr7YMu2in4Pz7yQOpJuAyhav5/UIOK0qIvMT4x3DibtTYbHQ41FoAAXc4YDKoB+X1UabN2AAMm2O+ppjDKWaggQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cv52DuRUYZgv6YRplLvGa50YGTE58yTv3s1SwHY+Sc=;
 b=g7IRYH9VgInTB7A+IHK2FFRG+FV5UbVBKY2K3TJ0CRPVS5UdwJPo3vzmpKh6FcR1Np7GlTb9LtsTbt3OWN4xYTGW4+Fqtx6Eu4T9x3oB6kCKutwgWyPirZTzkbakWqmyMZBgXBhjgeDYcADLD/asFhacJEe1LWFOQe1Dme+e0rY=
Received: from DM6PR11CA0072.namprd11.prod.outlook.com (2603:10b6:5:14c::49)
 by SJ2PR12MB9192.namprd12.prod.outlook.com (2603:10b6:a03:55d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 11:06:30 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:14c:cafe::33) by DM6PR11CA0072.outlook.office365.com
 (2603:10b6:5:14c::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.32 via Frontend
 Transport; Wed, 6 Dec 2023 11:06:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 11:06:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 6 Dec
 2023 05:06:28 -0600
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 6 Dec 2023 05:06:25 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER
 MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/7] ASoC: amd: vangogh: Add condition check for acp config
 flag
Date: Wed, 6 Dec 2023 16:36:13 +0530
Message-ID: <20231206110620.1695591-2-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206110620.1695591-1-venkataprasad.potturu@amd.com>
References: <20231206110620.1695591-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|SJ2PR12MB9192:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f0490b-e75d-44e7-2a54-08dbf64b65fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	20BLgfaCqXOdvtFNj4OwxUEAYyJJx7YxpOK73gCFiUa9DCqq485ZjP7PVNI8CmIzo5Tn6ACwhIRKVegfPLWZsZClfHAhDqfeoFP9V8LNsp3DMzfbBssJdRG9thQPwJfbrvhOR/swgB6dcEnue3hqeBYYcIVZAWP1LWayx6moBsCrOGNo8vNA2kXq+sOtqsOufisgJZRNF81PxwOzgXPM6hO2rnpDwanTN7L1HhOpwdaIZdHvmtMuFlExqe5fge7wsTSppeL7BrLvwVO4QqknWSSnc7B5giim7LBOilWuZoVCkR5XEWQdR9ERfb3/m/7FcZn6L23JZ39X8xY8lq2TNTlZTaHqC7/rwL2dU4doJ1MbPZutvhyXYlruge8l8RChJ8F61GU+NtBQgTobOSr9O8M22cVauRwxT3/b8rU7/rsLvMnUdWxq3FnElAwuWb/lLt0wZDkIkDuVqF9QeFo3rd/j/XWostzVsB2UQm4Jb4rprRM9LpCE1UWMdiSoV/uf010I56YH9mXrbznQ8wIQUpC9c/NlUoNPz9m/WzwE8ZlfzujcRFKH5hWw0GzATuX9sTp085Axadli5To8hrRBC3W2zg1gPhdYueA72VTBKpHDCBax/27/lyYA68iLJkwE/RpN+WcWfSH1kGjWJPJcNRYopqF9MtKdGg+95DKT5mljqagZ8onE4Vu2mnn/SP9ukBajDqLMbkMC3ZOrfZ6lQ3rSgD7QYO8zUKCZ7MxYwtZ57yE4QXccIKk+kQ3lpw/CYAvsjdB/p5IdDRYKlsm9yQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(82310400011)(1800799012)(186009)(451199024)(64100799003)(36840700001)(46966006)(40470700004)(83380400001)(82740400003)(40480700001)(336012)(426003)(41300700001)(36756003)(47076005)(356005)(81166007)(36860700001)(2906002)(26005)(2616005)(1076003)(6666004)(478600001)(40460700003)(5660300002)(70586007)(86362001)(110136005)(70206006)(7696005)(54906003)(316002)(8676002)(8936002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 11:06:29.6411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 87f0490b-e75d-44e7-2a54-08dbf64b65fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9192
Message-ID-Hash: PS32DJJJMYCOQN5ATZQKL5CBR54AIHDE
X-Message-ID-Hash: PS32DJJJMYCOQN5ATZQKL5CBR54AIHDE
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PS32DJJJMYCOQN5ATZQKL5CBR54AIHDE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add condition check for acp config flag to load legacy driver only.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/vangogh/pci-acp5x.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/vangogh/pci-acp5x.c b/sound/soc/amd/vangogh/pci-acp5x.c
index c4634a8a17cd..3826443d77b9 100644
--- a/sound/soc/amd/vangogh/pci-acp5x.c
+++ b/sound/soc/amd/vangogh/pci-acp5x.c
@@ -2,7 +2,7 @@
 //
 // AMD Vangogh ACP PCI Driver
 //
-// Copyright (C) 2021 Advanced Micro Devices, Inc. All rights reserved.
+// Copyright (C) 2021, 2023 Advanced Micro Devices, Inc. All rights reserved.
 
 #include <linux/pci.h>
 #include <linux/module.h>
@@ -13,6 +13,7 @@
 #include <linux/pm_runtime.h>
 
 #include "acp5x.h"
+#include "../mach-config.h"
 
 struct acp5x_dev_data {
 	void __iomem *acp5x_base;
@@ -131,7 +132,7 @@ static int snd_acp5x_probe(struct pci_dev *pci,
 
 	/* Return if acp config flag is defined */
 	flag = snd_amd_acp_find_config(pci);
-	if (flag)
+	if (flag != FLAG_AMD_LEGACY)
 		return -ENODEV;
 
 	irqflags = IRQF_SHARED;
-- 
2.25.1

