Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6817283FDE4
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 06:58:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7C93828;
	Mon, 29 Jan 2024 06:58:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7C93828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706507935;
	bh=FVjpMP69oWAUZhseNQbxx7gMLX7UskpwleJNyKTU9nY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PgFzQ2aCja3R7X05/0dnh5mPRhshhieBP1Rb4Xya2HbBHwunDZU9AQleC5IlzgPf4
	 AKnU6g5AV6GLEhoSk0GTKWmDu4/4ilc7fjXeaEZgpPA32sc4S0Le4qySS2l3SZpMe5
	 4clU/7elaVr0t+3rhc4y8vUmsd2wmVTQIwbuourA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C20EF80053; Mon, 29 Jan 2024 06:58:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97046F8057E;
	Mon, 29 Jan 2024 06:58:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2760BF80564; Mon, 29 Jan 2024 06:53:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55154F80431
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 06:52:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55154F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=rh7YdyPC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eo8E3ATvYDN+FF9mBPeKu7f2zek9VQeS1Sjq5fNgy9limmrJTgtv9SGN6PththZj/WhsrEyEC8EY1MPomdGakfVvfwtGDK2mM+JmTo1hJvbqvjyo+v3twOKjA7Rp5d4365M/81UWYI65eJxufqJY6LRftC85NeUG52hamMC2L/0Vd09hvoiDYU+g8Ij6ailYSD8WrWFHQHRMjMUaNN5kPO7ThF8nYvhxoSiAqwCgqgShR7KRCKkH8UVlcqRlw0z6lMAp9lrNb2nAqxPWE+hefSuQA2z6dRkg2Jd8h7hvvkOll0KiCD8h+QZPjuoCYBpbw0MZ+1SgNOVyuAhuNRDgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNUwLRiqJGoty4Xl3f1Y8lQns5ZPGMlRhxebPwEWFYQ=;
 b=hKHjcHSBpPpUzzitH0YonUm9b4d3WS5W/QyVNiNjXyj9UlmVefTHCoJFpsOsVhE3caW0lXTmCdDXQJ2/17jrlEWq/yAlPi+Zt9EIXtIKSuD6/e/ohsG8kwYnAFb5evegrd/KV0zhLPbsQjK13HeaqKihRGWpYsJjfddAy2F0r4RyHxEeBbIFOer2CCiS4WKq3XQoK8X/5lID8H+ECraEAHEZilnCD0fpYRTPygFQjQW5xRffMFeNnDKDKY5oM+poXFoOj3LRsx9Nzc7CGIIJMnQFxANH+C5kwnKUIXdFupEeJMxfUjCojaPSMuC0ZQACypWL5tULzTvWkKGlSpE+sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNUwLRiqJGoty4Xl3f1Y8lQns5ZPGMlRhxebPwEWFYQ=;
 b=rh7YdyPCkIWmXYoY65gbq2woaQabcbIXRJbxGB6WY0nzFJ4k3W7+68vCArFyfDQNEY/iu9ghk1QOHTk3Xd/lWlPP9JZBbpscHf0cTkTa8px1kRoA7tdQjDXMuYH6NlD2xkcNpXZkObiN2T5XcYVrHi3ChV4elXUdrpPDi7XYNiA=
Received: from BN9PR03CA0050.namprd03.prod.outlook.com (2603:10b6:408:fb::25)
 by IA1PR12MB6580.namprd12.prod.outlook.com (2603:10b6:208:3a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 05:52:28 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:fb:cafe::a5) by BN9PR03CA0050.outlook.office365.com
 (2603:10b6:408:fb::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32 via Frontend
 Transport; Mon, 29 Jan 2024 05:52:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 29 Jan 2024 05:52:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 28 Jan
 2024 23:52:23 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 28 Jan
 2024 23:52:22 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sun, 28 Jan 2024 23:52:19 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <vinod.koul@intel.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V4 03/13] soundwire: amd: refactor amd soundwire manager
 device node creation
Date: Mon, 29 Jan 2024 11:21:37 +0530
Message-ID: <20240129055147.1493853-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|IA1PR12MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: 0572a0a5-6e25-4364-ed22-08dc208e79d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pMPQsDT0z02WpO8eEPEahmooScAujK9KchE6AysMt0/mhY1z7jvIY0FFROa5Hich7/CbTv8luU4YB1vf+sbOKlUOaVlCHgMSGFOzAT7Lihi5CRPjD8E+lhLvbDNO7eaQ1ApMgXQSYH4aQT3Uapr6XBIUvMBTTjL4H9t+4o6InghT7T08swg3jbgl6XFud+9YoMVrpMg5WgXRlwldTGKOahsZDo9qE0aD5JARHyVsB3HdWZGdmPAd3nUpTESklm1xqO8M41UsroPzRlguhpRrH/l60bjD3tRSVO0YZje8F8E4gPERw6wojhb3AYOt6Hzp/CnUd3D8Xtezgh+03USGlc+Skr+6a+wtFX4TYxv+z0ZTJ2ByoSqxwPkIjjAKoUE26et+kA0NXUy7TDvAujw9wgUImJmcNouU8sDqz9WfAeb3vynl86W9dGcRnqIk0S9yJHPNjYMg9wNjpiTIh1vx5SyPP/PbmgXhVPYcxK6vShdYmchioCNfPnVVG7CIEO+a45To0GdviYt+sB5biILXuhbcc2RzsvjEJhUDHY/lKNziMNsmViEvfOiR1365MqHSb9qYaihmrEobfUxU0zgYtk8rqJMw0GdiO0WeJsoXNz5BCoUXHApzo5yBoNTiI4bWSyfDAOuiyx/kEaTulMOuauO0CBm4ib4bwCOJxNZD43FR+cPYWDv/rRR4nSZvV7XwBnHJICUkWfRz8mtea9nf6Z5H+r+ZabrMsq5y6Lvw65UymnFKurjRH9KS3lAZue9NWKLxcNLpgv36ikM/UW5Jow==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82310400011)(40470700004)(46966006)(36840700001)(41300700001)(478600001)(6666004)(2616005)(7696005)(86362001)(5660300002)(2906002)(30864003)(70206006)(70586007)(110136005)(316002)(54906003)(8676002)(8936002)(4326008)(36860700001)(1076003)(83380400001)(26005)(336012)(426003)(47076005)(356005)(36756003)(81166007)(82740400003)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 05:52:28.0675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0572a0a5-6e25-4364-ed22-08dc208e79d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6580
Message-ID-Hash: VB3H6FP4WCMUPBDPQEW2VBXF5AWURL7K
X-Message-ID-Hash: VB3H6FP4WCMUPBDPQEW2VBXF5AWURL7K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VB3H6FP4WCMUPBDPQEW2VBXF5AWURL7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor amd SoundWire manager device node creation logic and implement
generic functions to have a common functionality for SoundWire manager
platform device creation, start and exit sequence for both legacy(NO DSP)
and SOF stack for AMD platforms. These functions will be invoked from
legacy and SOF stack.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/Makefile        |   2 +-
 drivers/soundwire/amd_init.c      | 147 ++++++++++++++++++++++++++++++
 drivers/soundwire/amd_init.h      |  13 +++
 drivers/soundwire/amd_manager.c   |  18 ++--
 include/linux/soundwire/sdw_amd.h |  56 +++++++++++-
 5 files changed, 220 insertions(+), 16 deletions(-)
 create mode 100644 drivers/soundwire/amd_init.c
 create mode 100644 drivers/soundwire/amd_init.h

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 657f5888a77b..e80a2c2cf3e7 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -20,7 +20,7 @@ soundwire-bus-y += irq.o
 endif
 
 #AMD driver
-soundwire-amd-y :=	amd_manager.o
+soundwire-amd-y := amd_init.o amd_manager.o
 obj-$(CONFIG_SOUNDWIRE_AMD) += soundwire-amd.o
 
 #Cadence Objs
diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
new file mode 100644
index 000000000000..699391d9acba
--- /dev/null
+++ b/drivers/soundwire/amd_init.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * SoundWire AMD Manager Initialize routines
+ *
+ * Initializes and creates SDW devices based on ACPI and Hardware values
+ *
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/acpi.h>
+#include <linux/export.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "amd_init.h"
+
+static int sdw_amd_cleanup(struct sdw_amd_ctx *ctx)
+{
+	int i;
+
+	for (i = 0; i < ctx->count; i++) {
+		if (!(ctx->link_mask & BIT(i)))
+			continue;
+		platform_device_unregister(ctx->pdev[i]);
+	}
+
+	return 0;
+}
+
+static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
+{
+	struct sdw_amd_ctx *ctx;
+	struct acpi_device *adev;
+	struct resource *sdw_res;
+	struct acp_sdw_pdata sdw_pdata[2];
+	struct platform_device_info pdevinfo[2];
+	u32 link_mask;
+	int count, index;
+
+	if (!res)
+		return NULL;
+
+	adev = acpi_fetch_acpi_dev(res->handle);
+	if (!adev)
+		return NULL;
+
+	if (!res->count)
+		return NULL;
+
+	count = res->count;
+	dev_dbg(&adev->dev, "Creating %d SDW Link devices\n", count);
+
+	/*
+	 * we need to alloc/free memory manually and can't use devm:
+	 * this routine may be called from a workqueue, and not from
+	 * the parent .probe.
+	 * If devm_ was used, the memory might never be freed on errors.
+	 */
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return NULL;
+
+	ctx->count = count;
+	ctx->link_mask = res->link_mask;
+	sdw_res = kzalloc(sizeof(*sdw_res), GFP_KERNEL);
+	if (!sdw_res) {
+		kfree(ctx);
+		return NULL;
+	}
+	sdw_res->flags = IORESOURCE_MEM;
+	sdw_res->start = res->addr;
+	sdw_res->end = res->addr + res->reg_range;
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+	link_mask = ctx->link_mask;
+	for (index = 0; index < count; index++) {
+		if (!(link_mask & BIT(index)))
+			continue;
+
+		sdw_pdata[index].instance = index;
+		sdw_pdata[index].acp_sdw_lock = res->acp_lock;
+		pdevinfo[index].name = "amd_sdw_manager";
+		pdevinfo[index].id = index;
+		pdevinfo[index].parent = res->parent;
+		pdevinfo[index].num_res = 1;
+		pdevinfo[index].res = sdw_res;
+		pdevinfo[index].data = &sdw_pdata[index];
+		pdevinfo[index].size_data = sizeof(struct acp_sdw_pdata);
+		pdevinfo[index].fwnode = acpi_fwnode_handle(adev);
+		ctx->pdev[index] = platform_device_register_full(&pdevinfo[index]);
+		if (IS_ERR(ctx->pdev[index]))
+			goto err;
+	}
+	kfree(sdw_res);
+	return ctx;
+err:
+	while (index--) {
+		if (!(link_mask & BIT(index)))
+			continue;
+
+		platform_device_unregister(ctx->pdev[index]);
+	}
+
+	kfree(sdw_res);
+	kfree(ctx);
+	return NULL;
+}
+
+static int sdw_amd_startup(struct sdw_amd_ctx *ctx)
+{
+	struct amd_sdw_manager *amd_manager;
+	int i, ret;
+
+	/* Startup SDW Manager devices */
+	for (i = 0; i < ctx->count; i++) {
+		if (!(ctx->link_mask & BIT(i)))
+			continue;
+		amd_manager = dev_get_drvdata(&ctx->pdev[i]->dev);
+		ret = amd_sdw_manager_start(amd_manager);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **sdw_ctx)
+{
+	*sdw_ctx = sdw_amd_probe_controller(res);
+	if (!*sdw_ctx)
+		return -ENODEV;
+
+	return sdw_amd_startup(*sdw_ctx);
+}
+EXPORT_SYMBOL_NS(sdw_amd_probe, SOUNDWIRE_AMD_INIT);
+
+void sdw_amd_exit(struct sdw_amd_ctx *ctx)
+{
+	sdw_amd_cleanup(ctx);
+	kfree(ctx->ids);
+	kfree(ctx);
+}
+EXPORT_SYMBOL_NS(sdw_amd_exit, SOUNDWIRE_AMD_INIT);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD SoundWire Init Library");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/soundwire/amd_init.h b/drivers/soundwire/amd_init.h
new file mode 100644
index 000000000000..928b0c707162
--- /dev/null
+++ b/drivers/soundwire/amd_init.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Copyright (C) 2024 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#ifndef __AMD_INIT_H
+#define __AMD_INIT_H
+
+#include <linux/soundwire/sdw_amd.h>
+
+int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager);
+
+#endif
diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index f2c66b165be8..efc000334aa0 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -2,7 +2,7 @@
 /*
  * SoundWire AMD Manager driver
  *
- * Copyright 2023 Advanced Micro Devices, Inc.
+ * Copyright 2023-24 Advanced Micro Devices, Inc.
  */
 
 #include <linux/completion.h>
@@ -19,6 +19,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include "bus.h"
+#include "amd_init.h"
 #include "amd_manager.h"
 
 #define DRV_NAME "amd_sdw_manager"
@@ -864,10 +865,8 @@ static void amd_sdw_irq_thread(struct work_struct *work)
 	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
 }
 
-static void amd_sdw_probe_work(struct work_struct *work)
+int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
 {
-	struct amd_sdw_manager *amd_manager = container_of(work, struct amd_sdw_manager,
-							   probe_work);
 	struct sdw_master_prop *prop;
 	int ret;
 
@@ -876,11 +875,11 @@ static void amd_sdw_probe_work(struct work_struct *work)
 		amd_enable_sdw_pads(amd_manager);
 		ret = amd_init_sdw_manager(amd_manager);
 		if (ret)
-			return;
+			return ret;
 		amd_enable_sdw_interrupts(amd_manager);
 		ret = amd_enable_sdw_manager(amd_manager);
 		if (ret)
-			return;
+			return ret;
 		amd_sdw_set_frameshape(amd_manager);
 	}
 	/* Enable runtime PM */
@@ -889,6 +888,7 @@ static void amd_sdw_probe_work(struct work_struct *work)
 	pm_runtime_mark_last_busy(amd_manager->dev);
 	pm_runtime_set_active(amd_manager->dev);
 	pm_runtime_enable(amd_manager->dev);
+	return 0;
 }
 
 static int amd_sdw_manager_probe(struct platform_device *pdev)
@@ -972,11 +972,6 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, amd_manager);
 	INIT_WORK(&amd_manager->amd_sdw_irq_thread, amd_sdw_irq_thread);
 	INIT_WORK(&amd_manager->amd_sdw_work, amd_sdw_update_slave_status_work);
-	INIT_WORK(&amd_manager->probe_work, amd_sdw_probe_work);
-	/*
-	 * Instead of having lengthy probe sequence, use deferred probe.
-	 */
-	schedule_work(&amd_manager->probe_work);
 	return 0;
 }
 
@@ -986,7 +981,6 @@ static void amd_sdw_manager_remove(struct platform_device *pdev)
 	int ret;
 
 	pm_runtime_disable(&pdev->dev);
-	cancel_work_sync(&amd_manager->probe_work);
 	amd_disable_sdw_interrupts(amd_manager);
 	sdw_bus_master_delete(&amd_manager->bus);
 	ret = amd_disable_sdw_manager(amd_manager);
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 56b4117c087a..54735fa49759 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
 /*
- * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
+ * Copyright (C) 2023-24 Advanced Micro Devices, Inc. All rights reserved.
  */
 
 #ifndef __SDW_AMD_H
@@ -26,6 +26,7 @@
 #define AMD_SDW_POWER_OFF_MODE		2
 #define ACP_SDW0	0
 #define ACP_SDW1	1
+#define AMD_SDW_MAX_MANAGER_COUNT	2
 
 struct acp_sdw_pdata {
 	u16 instance;
@@ -63,7 +64,6 @@ struct sdw_amd_dai_runtime {
  * @reg_mask: register mask structure per manager instance
  * @amd_sdw_irq_thread: SoundWire manager irq workqueue
  * @amd_sdw_work: peripheral status work queue
- * @probe_work: SoundWire manager probe workqueue
  * @acp_sdw_lock: mutex to protect acp share register access
  * @status: peripheral devices status array
  * @num_din_ports: number of input ports
@@ -87,7 +87,6 @@ struct amd_sdw_manager {
 	struct sdw_manager_reg_mask *reg_mask;
 	struct work_struct amd_sdw_irq_thread;
 	struct work_struct amd_sdw_work;
-	struct work_struct probe_work;
 	/* mutex to protect acp common register access */
 	struct mutex *acp_sdw_lock;
 
@@ -120,5 +119,56 @@ struct sdw_amd_acpi_info {
 	u32 link_mask;
 };
 
+/**
+ * struct sdw_amd_ctx - context allocated by the controller driver probe
+ *
+ * @count: link count
+ * @num_slaves: total number of devices exposed across all enabled links
+ * @link_mask: bit-wise mask listing SoundWire links reported by the
+ * Controller
+ * @ids: array of slave_id, representing Slaves exposed across all enabled
+ * links
+ * @pdev: platform device structure
+ */
+struct sdw_amd_ctx {
+	int count;
+	int num_slaves;
+	u32 link_mask;
+	struct sdw_extended_slave_id *ids;
+	struct platform_device *pdev[AMD_SDW_MAX_MANAGER_COUNT];
+};
+
+/**
+ * struct sdw_amd_res - Soundwire AMD global resource structure,
+ * typically populated by the DSP driver/Legacy driver
+ *
+ * @addr: acp pci device resource start address
+ * @reg_range: ACP register range
+ * @link_mask: bit-wise mask listing links selected by the DSP driver/
+ * legacy driver
+ * @count: link count
+ * @mmio_base: mmio base of SoundWire registers
+ * @handle: ACPI parent handle
+ * @parent: parent device
+ * @dev: device implementing hwparams and free callbacks
+ * @acp_lock: mutex protecting acp common registers access
+ */
+struct sdw_amd_res {
+	u32 addr;
+	u32 reg_range;
+	u32 link_mask;
+	int count;
+	void __iomem *mmio_base;
+	acpi_handle handle;
+	struct device *parent;
+	struct device *dev;
+	/* use to protect acp common registers access */
+	struct mutex *acp_lock;
+};
+
+int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **ctx);
+
+void sdw_amd_exit(struct sdw_amd_ctx *ctx);
+
 int amd_sdw_scan_controller(struct sdw_amd_acpi_info *info);
 #endif
-- 
2.34.1

