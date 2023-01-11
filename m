Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD63A6656DB
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 10:05:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69F2A784A;
	Wed, 11 Jan 2023 10:04:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69F2A784A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673427926;
	bh=nNA20e4GaKDj3aXVZ6T4GIj1aRrd7BFg6Lfjn0So1rk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=t9sURkLvE4YvRMoziAA5PGHlWjbFpJI1lYAgmexvYKRof/fj0h208//na6tD5O/zd
	 bHlyhb9DDnsH75tJm6BvXw/spmnjPB69lY5XJZnEJ0yH9I/dYZMWy1vLP1d8wNzOWP
	 o1AuArZ0eZlNUr8EnCM7jqNeOCnTd4Zo1uawcwQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E106BF8019B;
	Wed, 11 Jan 2023 10:03:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1486CF80549; Wed, 11 Jan 2023 10:03:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2057.outbound.protection.outlook.com [40.107.102.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2354CF8019B
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 10:03:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2354CF8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=tj+LbGRD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcYMY2qY/4h/9zc3MRg4TeDHN6dkRO5MsaOq3JIvC/QKfss6GRrwcrlX9iq0E70waRVR7qR8R3JD7xPMGglr/hA/TuViaI9ZYsxbk/rKmC448YF3osNoyA4ac+tokbkms9Cjype2Wcul7KaTVva5wj6gC9U4UBe7IU7OUAge2VbpT9RYX+/PzpC12qNWkYkWnW4T/0+llCMXt5/Uz01DlL2ErXe9u/lcJFcjTKM1HeKIPbO5Csxxi1JVckNIKhjFfLrUEXHu/9pz2krcSc0L4EBP7gKpjpL9ADuILYHvWWNs5Qn+Iuyr2pddUzKOzrOkU7FQeOoIJsyXJ11YwesHzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWCFEEfEBxlW74hWdno7V5BxGl7W7b3yW79oi0bnu8k=;
 b=YCco6c/f3cJeo9CAtFBYAZ0OJ4xH+GcEhI0RY9VYcrHNqJkMYhHziiwDFNeKAsDVLeFclg0TNYmrpIOTXpSIvRP/H0iXOSrucy7YUT4NzcLikZIrRP2ufU9dDG0lisb3o3BmbPYGJOuZTwa6h6DNWfxZS0W1QhJh+0sBbcLq4QLkMh7DVCVnjLBDEYZYLlTQfvVCoQu83CJGm1/ydXHYgsuZXN7rxP3A+e6TX2q0+bY1nuu2ylV9HPFB2XpQ5YBTzn7FKztRo3YxKDjmsO5fNhcSTTf7S58LKs2iCvI8+Ak68OZ710OClbRbsyo5C5XljG7g6/Ny2cXWaGKaZXaztA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWCFEEfEBxlW74hWdno7V5BxGl7W7b3yW79oi0bnu8k=;
 b=tj+LbGRDjRg85Ll6FZIvraE238PCtxwuvBo1a7PxAGv8sHHyWCaDzpNdfUgKfF+gJIx60EmEKed95Eq/JzBi7cQN4zyd6QrzRQPleM40wGGeIZL1CDOih4k9K0qIR/OUf/2DiXMWFmmNm5VXHjDg9/ObIhJ3zhmm38HsCIHtook=
Received: from BN9PR03CA0586.namprd03.prod.outlook.com (2603:10b6:408:10d::21)
 by DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Wed, 11 Jan 2023 09:03:34 +0000
Received: from BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::35) by BN9PR03CA0586.outlook.office365.com
 (2603:10b6:408:10d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Wed, 11 Jan 2023 09:03:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT053.mail.protection.outlook.com (10.13.177.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Wed, 11 Jan 2023 09:03:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 11 Jan
 2023 03:03:15 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 11 Jan 2023 03:02:47 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 16/19] soundwire: amd: handle wake enable interrupt
Date: Wed, 11 Jan 2023 14:32:19 +0530
Message-ID: <20230111090222.2016499-17-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT053:EE_|DM4PR12MB6373:EE_
X-MS-Office365-Filtering-Correlation-Id: 093e2960-255e-42f7-de5e-08daf3b2b7db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hpUfmBS7Y1V836REon8EcIY1ucfx2HqKLLe8OYZrxba/G+qfV2fnR0dvkCt5iRtfVuY13A0ZGzYHD6cI1uwm1w2klTfMokcFAdE1RFjSg7OpeTpnu7M+ezfB5B8qTVRYcKx+OZUsYk32mMTv93s01K0Xnq66Z6SCgQvTRKCupXQm0WHFh+dl/Oi9RlkJ+niuJtwb9UWIbzYOkhlmqWBqFFusYQ8tyCUXtazYfz1i5kmKC6njxmTczX38k2zjcip0E6MqIB/X/WtIsTDXUoPOpVuB0UumtgvzVs+xa665XCjhWtt53rhdMl87JIIXmfxQ0xco+3L7DQQm65iGeMw3CCqqyj4yCnaJUaVubIW4KnvrnVce7pTVDfYlUIoxi7Dn2E3SfX6xQS4g4akPZoiutKfnwVxTN422FXbJal3hVjncA5nkcGFW5V1ciwBSNLCR4Blon6edTTJQzq4fDcmF5B3YMoK3PNtGVbpEBwelnlbWkVVR2BcNu2/KhrkN/Ad0ZDouAT3C9YZE+AX9XnYOTefbfn/Ip9YdLia+eJoRCZePMuIhz0qXLMcuh9xSY1qGKH1RSVeVLvm32yjo9lxzqx1eWMjfhBCmffmC8xt3ogsNPW8ilw7I8Eno55gZwSpa4I0yY6AgXhBlJ+pyrBIIDU4+LnicSh7rqWTyyspHNsE57Qfj/7HvmGIeoth3zR4JqlND6LBQoAnmGfHLOCDIUSqSoZpqsrRIVAcGuCVAbME=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(2906002)(7696005)(26005)(478600001)(6666004)(186003)(8676002)(83380400001)(110136005)(2616005)(1076003)(70586007)(36756003)(316002)(54906003)(336012)(40460700003)(70206006)(426003)(4326008)(41300700001)(47076005)(40480700001)(5660300002)(82740400003)(36860700001)(82310400005)(86362001)(81166007)(8936002)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 09:03:33.9620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 093e2960-255e-42f7-de5e-08daf3b2b7db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6373
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Mario.Limonciello@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, arungopal.kondaveeti@amd.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add wake enable interrupt support for both the soundwire controller
instances.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>
---
 drivers/soundwire/amd_master.c    | 9 +++++++++
 drivers/soundwire/amd_master.h    | 1 +
 include/linux/soundwire/sdw_amd.h | 1 +
 3 files changed, 11 insertions(+)

diff --git a/drivers/soundwire/amd_master.c b/drivers/soundwire/amd_master.c
index 290c59ab7760..2fd77a673c22 100644
--- a/drivers/soundwire/amd_master.c
+++ b/drivers/soundwire/amd_master.c
@@ -1219,6 +1219,13 @@ static void amd_sdwc_update_slave_status_work(struct work_struct *work)
 	u32 sw_status_change_mask_0to7_reg;
 	u32 sw_status_change_mask_8to11_reg;
 
+	if (ctrl->wake_event) {
+		pm_runtime_resume(ctrl->dev);
+		acp_reg_writel(0x00, ctrl->mmio + ACP_SW_WAKE_EN);
+		ctrl->wake_event = false;
+		return;
+	}
+
 	switch (ctrl->instance) {
 	case ACP_SDW0:
 		sw_status_change_mask_0to7_reg = SW_STATE_CHANGE_STATUS_MASK_0TO7;
@@ -1258,6 +1265,8 @@ static void amd_sdwc_update_slave_status(u32 status_change_0to7, u32 status_chan
 
 	if (status_change_0to7 == AMD_SDW_SLAVE_0_ATTACHED)
 		memset(ctrl->status, 0, sizeof(ctrl->status));
+	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK)
+		ctrl->wake_event = true;
 	slave_stat = status_change_0to7;
 	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STATUS_8TO_11, status_change_8to11) << 32;
 	dev_dbg(ctrl->dev, "%s: status_change_0to7:0x%x status_change_8to11:0x%x\n",
diff --git a/drivers/soundwire/amd_master.h b/drivers/soundwire/amd_master.h
index cc254255512b..e32884e3a45b 100644
--- a/drivers/soundwire/amd_master.h
+++ b/drivers/soundwire/amd_master.h
@@ -240,6 +240,7 @@
 #define AMD_SDW_CLK_STOP_DONE		1
 #define AMD_SDW_CLK_RESUME_REQ		2
 #define AMD_SDW_CLK_RESUME_DONE		3
+#define AMD_SDW_WAKE_STAT_MASK		BIT(16)
 
 enum amd_sdw_channel {
 	/* SDW0 */
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index f362f195b887..e3e539b868be 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -40,6 +40,7 @@ struct amd_sdwc_ctrl {
 	int num_ports;
 	bool clk_stopped;
 	bool startup_done;
+	bool wake_event;
 	u32 power_mode_mask;
 };
 
-- 
2.34.1

