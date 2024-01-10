Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22556829693
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 10:50:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A7A3E69;
	Wed, 10 Jan 2024 10:50:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A7A3E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704880219;
	bh=tyEZPTEeR7iWKSi9Zhc2/tPj3NPkCZH6BZVfjFCsVZQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P9OT66Qf4o8yMRk1zk+6GE3pYCTCIl+3zBb2UjTrpMGp6NvumvYIcErzG01oZ2DnE
	 BaMggFlasqzU4kWpdUWSzJaKA4BxmDY5vVwypGFtPRaFNKIrDp5S4ocd5ZrGaMTHYu
	 kpbI3HMjcflN9+Hw2gT0JjENmGaRMjn9UEzPlfIA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 360BCF805C2; Wed, 10 Jan 2024 10:49:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D50DDF805D6;
	Wed, 10 Jan 2024 10:49:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F0F6F80254; Wed, 10 Jan 2024 10:46:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D0EDF802DB
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 10:45:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D0EDF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=G6aN58pd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JdGepawoEhYXGMOi+M4wHy5RXw3NiZtDZaOIaDlDTpSzARHWzA3Nwb1nm+EZjMtZaVumAboCO4Q97QIaS73zEpbvE/u4y+EzR2eUTlxv5g1BG6ieX4sbckYU9+GO75RXFkA7OzntvDd5rYIC+pN0deDtINxFxeg79k9cUudMQUcm2z5I81IBHg9iy5kZcptwUNnVpu+q4KVzDeMlsY5M6HvR+5Pt6TgEtLZtWizoDjwn8UkpWU0xp/i+dvOnGA2Iru8eIYVr+Q5QN/1cLTIdu9n8hbFhbfGvr34hA7GWm2CHNvgDDaRq05xJ8ZyFL5MKGqHL4ygLuDP0XILTxhWxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IacFn7eqF5kdZGkhlqH0YD9/OWDzYxwStCzDix+z0ns=;
 b=dbdKZjiaQIWdndNe2odKPok9BgWk4oxcEsqUBeCRJbTlQKfxkUNa3AeeF+Lzd5Sgr9rjVfPx5DTiuvi6/KDi46QYQE/8UaRHJ0rZ8hzfOBN/vqjetahtMyyFN/Wd7/juR1AXA6kVMaJU6ZgoxJ092Ogq1dMdPrw8ThaQmfoAx6q/j6wujk2etBvQ8CKjrUeElE1MAcMcT2PZ+e8uglSxGRD/DCcgKme0q7clFc4ho+k7ezfupmAX1hY7tZDaYGbQlmmJIglcXJvK8GBJBktLwoLU+7/eOccv5r1Y/o/I8lhxP6nB6i8Or2Q5it8kQ+IpSH7ctTgTftPUToVvKp1yEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IacFn7eqF5kdZGkhlqH0YD9/OWDzYxwStCzDix+z0ns=;
 b=G6aN58pd/CwxHYNcE+2+SGx6c83dbjsfoQ9jTfQec6ZTxZw70DUSaQypRD//a9nhxyP2eZcEKe/VirBS7b55RaBFoacidsXI6qQKw5lWhE2ZRkkWjH6/e9J8VTvmDHEhrczGrzOrevNcOakYVVJ3bSfwnyHnJlcACFaIfj1Sj4M=
Received: from SJ0PR05CA0182.namprd05.prod.outlook.com (2603:10b6:a03:330::7)
 by DS0PR12MB7631.namprd12.prod.outlook.com (2603:10b6:8:11e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 09:45:24 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::f) by SJ0PR05CA0182.outlook.office365.com
 (2603:10b6:a03:330::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17 via Frontend
 Transport; Wed, 10 Jan 2024 09:45:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Wed, 10 Jan 2024 09:45:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 10 Jan
 2024 03:45:22 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Wed, 10 Jan 2024 03:45:19 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <vinod.koul@intel.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V2 05/13] drivers: soundwire: amd: refactor soundwire pads
 enable
Date: Wed, 10 Jan 2024 15:14:08 +0530
Message-ID: <20240110094416.853610-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110094416.853610-1-Vijendar.Mukunda@amd.com>
References: <20240110094416.853610-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|DS0PR12MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dec608e-cab7-486f-fb5b-08dc11c0ddec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UmmaGyWJnzQ1yU3vCliEFLmbT7jpmIk4J2+W33K3TIlRsWhWdN8HjmqU0KUL+P156qNG/vGb5MBU4A2pe+0dQwSgyq+Zs2Myt6XlRMVN3yeYIDk9dc5M8Kbvb9+tkk6C5ma0ZinVl29GynED5doplrTLhgo7K3By0MXharQHULRTZMNZeRGLCMpYErzV1/IEebvOA+eHym4O2Gb+saOqEZEHOQ+XacmjukmMEgqp1pqp9Vy6hvJ8OX094AhyvGrxxgGFm/jKd4Y+RSenzyxEBxUjFScJWDjx4XRy9LfLLhs9T5k0RuzFZEAN600Bkx7zhtCqQDwodZsACV2vfTXxSxSY0R/5JTLxmKlNmdu3ftQv92hoaZI+O0UjM5j6UXYqXhB/Y8almztuS42X1BfLt6DScAteYz9fdZtAFXnT+ZRzj3WdYBV8Y8uQaZV28xzYqFKzG9UZleYB/C/aZaAUkDD7nCAqDNFntvUnfDMZQfah85CiO4cMVdRV6QKVYlnT6ktqHOLSfkAefPtYySk6j/APZoV+IF1mwpbTrv84RqX2jEZC1FyaXSRnVG0b29T4Kqd9kpRDAMzYfI4+XIrjr+RNak2OOHKdZuCm1ivpH5Kv6WhuhRzOA+EIdOv2TNSGQS+q6O6Ly/Maxr7Q9Cs3hCW/JI+SbFvDLs/6ZYxlnlek5NJMNFCLyQpS0fBgb+iMl5f0z6x/e+E901RtLuHfrQQcvedchD06oryGNmcSEVjYR56xYF9LOz7tGY2YgHHBftfIA3LRXOUPDW1GuXDqmA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(40470700004)(46966006)(36840700001)(478600001)(36860700001)(5660300002)(6666004)(7696005)(86362001)(2616005)(8676002)(316002)(110136005)(41300700001)(54906003)(70206006)(70586007)(36756003)(47076005)(82740400003)(83380400001)(426003)(1076003)(336012)(26005)(8936002)(81166007)(356005)(4326008)(40480700001)(2906002)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 09:45:23.3050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7dec608e-cab7-486f-fb5b-08dc11c0ddec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7631
Message-ID-Hash: TBQQJAMG3LYHWSWKMQP6AK5JQSDVGUY7
X-Message-ID-Hash: TBQQJAMG3LYHWSWKMQP6AK5JQSDVGUY7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TBQQJAMG3LYHWSWKMQP6AK5JQSDVGUY7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As sdw pads enable sequence is executed only once, invoke it from probe
sequence.

Program required pads for both manager instances based on link_mask during
probe sequence. This will avoid acquiring mutex lock.
Remove unnecessary delay after programming ACP_SW_PAD_KEEPER_EN register.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c    | 45 +++++++++++++++++++++++++++++++++
 drivers/soundwire/amd_manager.c | 18 -------------
 2 files changed, 45 insertions(+), 18 deletions(-)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index 5c9569d9ad01..b3b3c7266384 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -15,6 +15,47 @@
 
 #include "amd_init.h"
 
+#define ACP_PAD_PULLDOWN_CTRL				0x0001448
+#define ACP_SW_PAD_KEEPER_EN				0x0001454
+#define AMD_SDW_PAD_PULLDOWN_CTRL_ENABLE_MASK		0x7f9a
+#define AMD_SDW0_PAD_PULLDOWN_CTRL_ENABLE_MASK		0x7f9f
+#define AMD_SDW1_PAD_PULLDOWN_CTRL_ENABLE_MASK		0x7ffa
+#define AMD_SDW0_PAD_EN_MASK				1
+#define AMD_SDW1_PAD_EN_MASK				0x10
+#define AMD_SDW_PAD_EN_MASK	(AMD_SDW0_PAD_EN_MASK | AMD_SDW1_PAD_EN_MASK)
+
+static int amd_enable_sdw_pads(void __iomem *mmio, u32 link_mask, struct device *dev)
+{
+	u32 val;
+	u32 pad_keeper_en_mask, pad_pulldown_ctrl_mask;
+
+	switch (link_mask) {
+	case 1:
+		pad_keeper_en_mask = AMD_SDW0_PAD_EN_MASK;
+		pad_pulldown_ctrl_mask = AMD_SDW0_PAD_PULLDOWN_CTRL_ENABLE_MASK;
+		break;
+	case 2:
+		pad_keeper_en_mask = AMD_SDW1_PAD_EN_MASK;
+		pad_pulldown_ctrl_mask = AMD_SDW1_PAD_PULLDOWN_CTRL_ENABLE_MASK;
+		break;
+	case 3:
+		pad_keeper_en_mask = AMD_SDW_PAD_EN_MASK;
+		pad_pulldown_ctrl_mask = AMD_SDW_PAD_PULLDOWN_CTRL_ENABLE_MASK;
+		break;
+	default:
+		dev_err(dev, "No SDW Links are enabled\n");
+		return -ENODEV;
+	}
+
+	val = readl(mmio + ACP_SW_PAD_KEEPER_EN);
+	val |= pad_keeper_en_mask;
+	writel(val, mmio + ACP_SW_PAD_KEEPER_EN);
+	val = readl(mmio + ACP_PAD_PULLDOWN_CTRL);
+	val &= pad_pulldown_ctrl_mask;
+	writel(val, mmio + ACP_PAD_PULLDOWN_CTRL);
+	return 0;
+}
+
 static int sdw_amd_cleanup(struct sdw_amd_ctx *ctx)
 {
 	int i;
@@ -37,6 +78,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 	struct platform_device_info pdevinfo[2];
 	u32 link_mask;
 	int count, index;
+	int ret;
 
 	if (!res)
 		return NULL;
@@ -50,6 +92,9 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
 	count = res->count;
 	dev_dbg(&adev->dev, "Creating %d SDW Link devices\n", count);
+	ret = amd_enable_sdw_pads(res->mmio_base, res->link_mask, res->parent);
+	if (ret)
+		return NULL;
 
 	/*
 	 * we need to alloc/free memory manually and can't use devm:
diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 0fcf8f8545b1..7ccafd8eab7d 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -26,23 +26,6 @@
 
 #define to_amd_sdw(b)	container_of(b, struct amd_sdw_manager, bus)
 
-static void amd_enable_sdw_pads(struct amd_sdw_manager *amd_manager)
-{
-	u32 sw_pad_pulldown_val;
-	u32 val;
-
-	mutex_lock(amd_manager->acp_sdw_lock);
-	val = readl(amd_manager->acp_mmio + ACP_SW_PAD_KEEPER_EN);
-	val |= amd_manager->reg_mask->sw_pad_enable_mask;
-	writel(val, amd_manager->acp_mmio + ACP_SW_PAD_KEEPER_EN);
-	usleep_range(1000, 1500);
-
-	sw_pad_pulldown_val = readl(amd_manager->acp_mmio + ACP_PAD_PULLDOWN_CTRL);
-	sw_pad_pulldown_val &= amd_manager->reg_mask->sw_pad_pulldown_mask;
-	writel(sw_pad_pulldown_val, amd_manager->acp_mmio + ACP_PAD_PULLDOWN_CTRL);
-	mutex_unlock(amd_manager->acp_sdw_lock);
-}
-
 static int amd_init_sdw_manager(struct amd_sdw_manager *amd_manager)
 {
 	u32 val;
@@ -872,7 +855,6 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
 
 	prop = &amd_manager->bus.prop;
 	if (!prop->hw_disabled) {
-		amd_enable_sdw_pads(amd_manager);
 		ret = amd_init_sdw_manager(amd_manager);
 		if (ret)
 			return ret;
-- 
2.34.1

