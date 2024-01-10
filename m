Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18941829699
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 10:51:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90A3CE67;
	Wed, 10 Jan 2024 10:51:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90A3CE67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704880274;
	bh=IFEot5bHMABYq7lhA8Lmyy1rUd/zj2YzvOCv6zifuJw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=agU7ErR2prK7uPe8jg8i37NZTIOcys/JEo1GZZydXDccyDzNc5OKIKBrFiEHxTlB6
	 1MOxSAlsBEWEpfc8lijV6MRTuae4xwGPAAtg+t0wu47PA62hG4LscA/cdGfDsvHUSQ
	 WjpCPYcqo9DFqWfImnXjI5TsjqGSmKNQvIoIVSik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC81CF80563; Wed, 10 Jan 2024 10:49:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE4F9F8065D;
	Wed, 10 Jan 2024 10:49:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D110EF805AD; Wed, 10 Jan 2024 10:47:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CA8DF804F1
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 10:45:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CA8DF804F1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=3+Cdj8tQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbEEvPiC0RSHaBn0d1nbiBgxRhUkTnvnVpaZIIS15TdOoxNlXbT96o+Ym6o8pz8LlniJhjxMNBq9Iq/SufxaGUw6BZq9Y0YcU+bW2vzifUcWUsCjuUoiA754MhYYLw66ZOkeeJ/z9P97c4iEbfKTWCftBJsQ2N9xWNXxDUvMZeSgacAtM0i2PFCnCuTjTNPH4X71ZEl+yEXAnDJ4NxGjO+9E6U2gZp9PQ3EM7wYpYa3pc+DEVqFNwQ2Sbn4O6BEfa9spRK8CZjk5r3pwbYDesf+EHbCzX+8SznpZGPLb/vArCVttlwhbsiQyjOzWs5+sCqyL34qQ50xCrVCKxYmwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFdBQFK594SUzT/rZ/nQ4zQ3K2GAlXJIQYpqFZzwPoU=;
 b=AJesCtBDvaumf+Q8XrYw9400Vc3/XMbvAfQvD3YqVwAnE0anSn+lwhoWwpGqZd+ZRvI7kCFM1xkqtrUcaRn1LTtHmPzQ4NsGOgwUteCEQSdNL7vNOR0NSO7whsHqIHvPbkESxeVyRF35Ifnb0UsMWQ3o2Xp9OzJBc7RZCiwgPW5yo3fnf7DPTO0TqZYSRQ2x2GcLu9SmQx/BB46GrV++HtrTSqva4UtSB65XJPHNbdcbX4/pueUbIjFiQFOMCKOJ3m/b7geviZ/+bhZkOZ5lR+gsgnzb+T+JegB0oMLYKo6W5BJseRXlGS6m/CS3lsNN4rHj3cPvqZeMAaAN7cGKtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFdBQFK594SUzT/rZ/nQ4zQ3K2GAlXJIQYpqFZzwPoU=;
 b=3+Cdj8tQGenzL78axlX1xmGOuZ8IEzhQn/v1S2BoINEfiAaRPpx/fs9BzibPrWPNqtPh9g+qjsZUydRBDLj2GedNltI9KDHgxYA/9ASytoJFgWR8/7pKdHFysIa2J2ycod7k2+gR/RaBx1mjfYoIECHuML8P3DBZ7L1j6NQpL6Q=
Received: from DS7PR03CA0338.namprd03.prod.outlook.com (2603:10b6:8:55::31) by
 SA0PR12MB7092.namprd12.prod.outlook.com (2603:10b6:806:2d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 09:45:28 +0000
Received: from CY4PEPF0000EE30.namprd05.prod.outlook.com
 (2603:10b6:8:55:cafe::1c) by DS7PR03CA0338.outlook.office365.com
 (2603:10b6:8:55::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17 via Frontend
 Transport; Wed, 10 Jan 2024 09:45:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE30.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Wed, 10 Jan 2024 09:45:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 10 Jan
 2024 03:45:18 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Wed, 10 Jan 2024 03:45:15 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <vinod.koul@intel.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V2 04/13] drivers: soundwire: amd: implement function to
 extract slave information
Date: Wed, 10 Jan 2024 15:14:07 +0530
Message-ID: <20240110094416.853610-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110094416.853610-1-Vijendar.Mukunda@amd.com>
References: <20240110094416.853610-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|SA0PR12MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a54b6e4-1758-43e4-9ec1-08dc11c0e0ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WWbOnxhZ9ODM6uzxd1mpVw713ZS11jSkrhSM8wa1/mqYs2bsXaHMEDgn+q9VLNG4CeNHnE2Nmc82j9IILlI5Ft//jlhtaHasC/LnrNQ/pZI1hyLiwpDtqJ1gfGBhDDlAWa42BahMrKLg3VPMPN83bmnQeGaaiPIiBm+wdHbuFLF0PhedosU6fZ6vRXqChcYIM5jcLmcNz8bg7fzpL+qBmIBffBFg4ct0309dI7l7f3cdHAGLwxaueBO5FYYKYZwgvj80T2VtxKUwy5OfaDjYkMo4BSYxuW/xCKAcfpThq0oXrvGkRV6xgfEnUU0TJPXfhbUoo8C5Mb/K6tHdgmvs1jyJIdhILsgZPSi1KEwhG9OwVsBqu6kQd28uFMx8RCnWivDU9H8iB0VTb5i/IE6M7N3g08k5tmekLUZFDu+zlFAZ5UXAVbFRsPiyGzeDhGCOqqxwcVwi6EJMQjq3S9F7xtneqkgtLelwT9YwxLW4os86+XqHKxTW9wOB/MF0FAnjvP72GxXRDTiiWmrKBnfGujuQmH4d9mQqEGTJ0orSv3QkeAJEy+gyGENKAZQVU0A9qamUY//2OXQ4A6dcUUKQh7GORapX1EoRiWxX/Sd+iR279TJPXBJb6ObSLux5PzVWg/ixMipyT+VomcspPWhWFAFCpqzac9KewYu65r+vH79+b/+RWyDRtl7JP3WQmY8li92VTvctcwU/sFdk5s2eQ6ro5XODWBPFCLSaz4GgKxQecrz/VJM0KSZ9u2s15kDnv54fVrpkfXqhCa/qsu/ACw==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(64100799003)(186009)(82310400011)(1800799012)(451199024)(46966006)(36840700001)(40470700004)(36860700001)(478600001)(82740400003)(70586007)(86362001)(316002)(54906003)(110136005)(70206006)(356005)(81166007)(7696005)(2616005)(6666004)(336012)(26005)(426003)(1076003)(40460700003)(40480700001)(47076005)(8936002)(8676002)(5660300002)(4326008)(36756003)(41300700001)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 09:45:27.9567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0a54b6e4-1758-43e4-9ec1-08dc11c0e0ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7092
Message-ID-Hash: 2RHVXTKE4DXM6YQCZK3HSNTT66NQSXO7
X-Message-ID-Hash: 2RHVXTKE4DXM6YQCZK3HSNTT66NQSXO7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2RHVXTKE4DXM6YQCZK3HSNTT66NQSXO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Implement function to extract slaves information connected on the bus.
This information is required during machine select logic.
This function will be called from machine select logic code.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c      | 43 +++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw_amd.h |  2 ++
 2 files changed, 45 insertions(+)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index d732ab0bfd59..5c9569d9ad01 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -142,6 +142,49 @@ void sdw_amd_exit(struct sdw_amd_ctx *ctx)
 }
 EXPORT_SYMBOL_NS(sdw_amd_exit, SOUNDWIRE_AMD_INIT);
 
+int sdw_amd_get_slave_info(struct sdw_amd_ctx *ctx)
+{
+	struct amd_sdw_manager *amd_manager;
+	struct sdw_bus *bus;
+	struct sdw_slave *slave;
+	struct list_head *node;
+	int index;
+	int i = 0;
+	int num_slaves = 0;
+
+	for (index = 0; index < ctx->count; index++) {
+		if (!(ctx->link_mask & BIT(index)))
+			continue;
+		amd_manager = dev_get_drvdata(&ctx->pdev[index]->dev);
+		if (!amd_manager)
+			return -ENODEV;
+		bus = &amd_manager->bus;
+		/* Calculate number of slaves */
+		list_for_each(node, &bus->slaves)
+			num_slaves++;
+	}
+
+	ctx->ids = kcalloc(num_slaves, sizeof(*ctx->ids), GFP_KERNEL);
+	if (!ctx->ids)
+		return -ENOMEM;
+	ctx->num_slaves = num_slaves;
+	for (index = 0; index < ctx->count; index++) {
+		if (!(ctx->link_mask & BIT(index)))
+			continue;
+		amd_manager = dev_get_drvdata(&ctx->pdev[index]->dev);
+		if (amd_manager) {
+			bus = &amd_manager->bus;
+			list_for_each_entry(slave, &bus->slaves, node) {
+				ctx->ids[i].id = slave->id;
+				ctx->ids[i].link_id = bus->link_id;
+				i++;
+			}
+		}
+	}
+	return 0;
+}
+EXPORT_SYMBOL_NS(sdw_amd_get_slave_info, SOUNDWIRE_AMD_INIT);
+
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
 MODULE_DESCRIPTION("AMD SoundWire Init Library");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 1e5ff4c46365..ae53664f87cb 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -170,5 +170,7 @@ int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **ctx);
 
 void sdw_amd_exit(struct sdw_amd_ctx *ctx);
 
+int sdw_amd_get_slave_info(struct sdw_amd_ctx *ctx);
+
 int amd_sdw_scan_controller(struct sdw_amd_acpi_info *info);
 #endif
-- 
2.34.1

