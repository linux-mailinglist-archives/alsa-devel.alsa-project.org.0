Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 897A683FDE5
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 06:59:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C03AB60;
	Mon, 29 Jan 2024 06:59:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C03AB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706507957;
	bh=UPvVpjBU95eOac8i7j8iw7//J5Ez4toj7pAvd73y8Ws=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mKFdzXUO+1p+Bd8C/a+hYNnRPM/C+tELCkBV0j8PqJSaym60VQpQ3FUufcz5u8KwU
	 kyC0jYG7NXboXHiOXpaM2Bmv8OHWaSkqoNG5HFWWVb8ZV2MSxlinb3geAUztwhJG0V
	 mrpxsyBvxUsvg4nUd0Xl7TfNSIbCYSfKBc/1Hgis=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F876F805C6; Mon, 29 Jan 2024 06:58:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A429F805C7;
	Mon, 29 Jan 2024 06:58:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5028AF80431; Mon, 29 Jan 2024 06:53:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CFA6F80310
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 06:52:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CFA6F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=oJYnIrZU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAJO4nTVZgB7/Yo2Wc2wyPIeXgBUAD1JVc9ZA0lJO9qQMb+Fa69GTixtdfPRE33TG3eraYSlNrT/n+xKLktqKG+SDzaLQBJN9Qh1rX02FX2sivSGyy+lf7yGaSs9wOdO66m7Nl8tkixIOxuv5dOTmELg1/LxHwJ9YFPDmljAs84QA84FxD2qBfQGRqCbkrdQrAUhXYq8HhHiOk5CjTtZOf02tZgCbZf4v6/Ce8Hz5VQSSgHsFM5hAxRLNC54BBXZxaSn5WTJTwQIezmkkfT/v5hk38qafYPRcohAzWUkuTLi8tQg3FIJpRqGJwlj7tsaj7TRsZAc5y26SuKa0UPIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5COjSW4UOArU5llcbOXsHm5E5dMJezix0FBZCvu+cWU=;
 b=TEHuXlIJktBR6K8P/W6/mdsRQakmTdcPGAKwMpvbdAxxJj3syDVlmg5ov+egUE9OqhfK5ouhR2BZndCef+lednCTgdXtBX8mK+55b974Jwv7TwnU8bjgd+0vjbTBA7NePZLc/wshaZoJd2dAPF/tlk9YNrgmWDiNPlb9BdEbNRlUV2PfBaDoKmvBW47PbUmXBKdZm/YwKC5iXkQAMLeKFBd9b+p7dUS6BsV22XCswAoG9cufeJqEoQfVeWEHDHTde8nsEw2FDSr8MzxpVtQB2TrfuYG1yS7zsvpzXcaATk1CpLdEM0HQaX9+dmLWu7Ei00FgTZECXb/DRKj0ZlyrcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5COjSW4UOArU5llcbOXsHm5E5dMJezix0FBZCvu+cWU=;
 b=oJYnIrZUgPd9Ca4o5txGw8Xlxv/FhcOblopkKgQOc2bIXs/+h/h5eZOnADu2180fRliYZYOomFnZTQWzzhiot7dlZiv31yB00xbsYoO2HeBZxTIFXS9ebcK4Cdi5kDxzrlJB8nsjApJ8tTv1jNZhfNYGHj7xLwx7LG6YyVWxBLo=
Received: from BN9PR03CA0031.namprd03.prod.outlook.com (2603:10b6:408:fb::6)
 by DM4PR12MB5246.namprd12.prod.outlook.com (2603:10b6:5:399::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 05:52:28 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:fb:cafe::a) by BN9PR03CA0031.outlook.office365.com
 (2603:10b6:408:fb::6) with Microsoft SMTP Server (version=TLS1_2,
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
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 28 Jan
 2024 23:52:26 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Sun, 28 Jan
 2024 23:52:26 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Sun, 28 Jan 2024 23:52:23 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <vinod.koul@intel.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V4 04/13] soundwire: amd: implement function to extract slave
 information
Date: Mon, 29 Jan 2024 11:21:38 +0530
Message-ID: <20240129055147.1493853-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
References: <20240129055147.1493853-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|DM4PR12MB5246:EE_
X-MS-Office365-Filtering-Correlation-Id: b321ca89-3f0a-44a8-d792-08dc208e79fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	caxsIItU860NwS1MSM4J25hjd40RXCm18wQOEHQCUMNyAZoZQcSlyuxFCgpF1XcLnrrkS2sQ9luFPSLuKxyI9usG25GNhOla2djiATiMSRyV9SlOuz/Piad02tNdyu2rfkUakumMdaE0domuCl3um+ralEzBZ7pO9iybAiZO0dZwKbsmcUVII4O3E3cznV/12TULKsDPguC2NCiIR3U7Vk+QWSpUZv66P9IdWFzb/iu4fP0zSVWSWPhT7NI/BJTX/3aaUxaZAg6md1B4lYA0j8Iw3EnTNj9JVFIsmbqq4P+rkPf7MosDBsDcSK+1WMbnGOxV4lGXd4Qf475O5Rwb7kZM10DKXymRuYKTZFaCwI2WCcK+ncntDqvDMnKVSV18p64pvnnEYfHOy4AU/Lk5FzaHJ/2ADBnV8OHb4A3RQTL36AHciFHIZVwHPNzKLon8KPzUXLPROSDKaHlupPf9yH2RwPMd36SeNu94XHgegZuhcgysmJzmjUkOJE7R/uM3KEDh4eeDP4Uvg1VPB86tRetp5H1+j8cO+oBv7LgasbJ2CMHLp9ZGOSEOSHUoYUeNlO8Qvouf94744UB8IJqs9Uy/nq3l7EitwrFzPaqNGvDZrzqW7kGKGejW+Zy2rpglumj0Wx2j+7eYalK3tR0NSKH8fFX0VVl6+3aXgxYWGwvwJjNnSq2x6fGfqT3Y/bCLPt4c4WUArJlh64r/Ow3VQn6vrKoX55j3oS7078+9vmf0pIlNwSH8weMkJ1sfsrUTHN1JMTzIzTqGJ86bDKykrw==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(36840700001)(40470700004)(46966006)(336012)(426003)(1076003)(26005)(6666004)(7696005)(2616005)(36860700001)(47076005)(5660300002)(8936002)(8676002)(4326008)(41300700001)(2906002)(478600001)(316002)(110136005)(54906003)(70206006)(70586007)(36756003)(86362001)(82740400003)(356005)(81166007)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 05:52:28.3488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b321ca89-3f0a-44a8-d792-08dc208e79fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5246
Message-ID-Hash: IMAYLMZTY5KOVWTOFOQMWWY4SD4QORAF
X-Message-ID-Hash: IMAYLMZTY5KOVWTOFOQMWWY4SD4QORAF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IMAYLMZTY5KOVWTOFOQMWWY4SD4QORAF/>
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
index 699391d9acba..46a0538d7fc7 100644
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
index 54735fa49759..9103772c2497 100644
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

