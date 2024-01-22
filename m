Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0304C835E18
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 10:27:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A515D84C;
	Mon, 22 Jan 2024 10:27:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A515D84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705915631;
	bh=IFEot5bHMABYq7lhA8Lmyy1rUd/zj2YzvOCv6zifuJw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WMA4FnZ0F2Llbi6e4M3EnYsI9uSPoyTOSmMX7e7Wj1AWbGcUv71PEEPpgdz4DHIJ3
	 LNWNZYrz9j2xdZvu1cxN8hVybSygQqiMgHlj2mh8LqCxkIEgYVbAJ6ipkcngJHQlSK
	 7k6oSlIZcuKcwK0v41ifKkdKJh1ZOeDV6vE9vIg0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCE3AF805E8; Mon, 22 Jan 2024 10:26:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12F9BF80606;
	Mon, 22 Jan 2024 10:26:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02C03F805B3; Mon, 22 Jan 2024 10:25:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C27DF8022B
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 10:25:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C27DF8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Lr7Tn8dp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnLF3ZhCqFhZSitIdoI27GL1eMCZYOPelX7bTjNcfAoJmuoJ4W1eJUDmPcJtOfFxlSVb4J1Zw1NxB03+PCecy3V/K9pEplAUFOjtk4RQwJmt4EpznREg9an38cgFPYgYd0U6tfVWuqmox2VdY6GJJwsxjUcURZb1k4pORL3+ZFzX0zxg2IQv0Rv3uEN47qFdcYQM7pUZo3YDkT+F8idlXPKUIh1zuJN3rt8O3HgFnPCbaX9kKM2RDVIXvk8KzpPgliOXU+6Ip0W5Jmnox5bxse1SAwuClqT1SMK2Y8UG3XMJ4Hi42sfwXf7onPFbkwIlLQhrdhAEI/9jQrfCiezKkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFdBQFK594SUzT/rZ/nQ4zQ3K2GAlXJIQYpqFZzwPoU=;
 b=Zaa/B5KYA+XotM+Y3QUVFwNYEPR01H8y/EFnglGYx6vyyvbB6d04wMaQ5RjM4wzezPtJQcRydhTsMqUzJllgfQ97GkQ+WDJtB9m1Yydq3MIwNEqJSRAnKuc17U0qUvWW+Ij6L5mWqke4HrZsk9yTI/z9gpy+71A5YD2SfTwZaSRRH3Du5wTnh1xF3xHU2emh3eKpdcstYWhFiBm3dRsVvVK0EFci1+0Evt/XAMQ53kgP355fL4R1RyVASFnm+zOt9hArS/TyvwP0UmV//BUpBztSvNkJVFt+N/OGNi5CvTpinYzHEo336vLXHbMyokKRIO+pzyvnEB3AJIVwgabipw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFdBQFK594SUzT/rZ/nQ4zQ3K2GAlXJIQYpqFZzwPoU=;
 b=Lr7Tn8dptst+NG1nVETogNvZ4woSjIT//Q0uJyyUu8ZDIpUZtsuW+NxX2M+WrlDXGxryjHGooFQojPkk3F4uJ4RyqYZDAB6CP0O6eaZ0LsFjHdiT5PWMaExEE9hZ21MIgZKTTF/F4ZQttG8vTCSYkHmMenpdwGL8InEFx+mxxJo=
Received: from CH5P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::26)
 by PH7PR12MB6466.namprd12.prod.outlook.com (2603:10b6:510:1f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Mon, 22 Jan
 2024 09:25:28 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::49) by CH5P223CA0012.outlook.office365.com
 (2603:10b6:610:1f3::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32 via Frontend
 Transport; Mon, 22 Jan 2024 09:25:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 22 Jan 2024 09:25:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 22 Jan
 2024 03:25:18 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 22 Jan
 2024 03:25:11 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Mon, 22 Jan 2024 03:25:07 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <vinod.koul@intel.com>,
	<venkataprasad.potturu@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH V3 04/13] soundwire: amd: implement function to extract slave
 information
Date: Mon, 22 Jan 2024 14:54:26 +0530
Message-ID: <20240122092435.3791175-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122092435.3791175-1-Vijendar.Mukunda@amd.com>
References: <20240122092435.3791175-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|PH7PR12MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f33a64d-0b9b-4216-a226-08dc1b2c1247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ljlIOA0tTWFqZ1JqznuU+QUakOBtVpuT+H3n8y9F7y9Qfs3Z6ctt+fzqXfXeO0MFUAeWY5EYiMkW33mpKa7Poic9sOgljIdgxj0mv6t834yCZ9YaDqh7erADc7F1xR39ZShlTaZn+JGvJCJKYYRdFAokUOfdHcwPTtOiiKKkj6N5dOvxUKlo28AQHD4yhyZB9MvbB+xafzI/dWdRKF7PiSvXUAmCL5vBG7Ex2F5RuLvD7huHEQqJkzQZ+O+KXs5NTqozxQkWYhMg0s7/RmrGNR9LngSxjpu7xTEe6UpNifSRSQvfJB/lJ5o7LEq2z+JgKZFmb5lQ/4lBz/mCLAsPIWRp1ax700D7dnqNBC+xxexTe59++VSYvzdqjKV8qNGWLmBmf5NSDv0ltwrE6HtEe8WgKX7LBZfjIubk5ym2DgO3A1z3RN24YpnwXxYpk5/XOK+FmbHu7aaSqm+4tz9CTP0EdGKFoVScQWxq35WKzlaX3SywcAVr/UXEPobjVja8vfcFZevDXUBLwI+FUFShlODXkidO5HgeO9Cz0I+Fqs6twOe3WBtaJJx8V65Z5t5L6Rk0M6cpULTopc/3WCusFGZ76xVaFcDReRbvW8IOaGyPNw21ZlNOysGBfKCyWREKx2WiwzdQEkNIrR6RMvi+3FOvCtAwpq5wAZWseTtvVw/EsmbSng4zDiFWt3HNlhOXZ9gNThaiKCBUp7XUhgze4W/Q0OFIcXi35gJkiVnu55fmCnVD+AnL9VsKIItr7ikBXJNV1wLR0ZuecF+XsRl5VA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799012)(46966006)(40470700004)(36840700001)(478600001)(6666004)(7696005)(110136005)(70206006)(70586007)(8676002)(8936002)(316002)(54906003)(47076005)(36860700001)(1076003)(26005)(426003)(336012)(2616005)(2906002)(4326008)(5660300002)(41300700001)(36756003)(81166007)(356005)(82740400003)(86362001)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 09:25:27.8181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2f33a64d-0b9b-4216-a226-08dc1b2c1247
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6466
Message-ID-Hash: 4TU3MEMBHTI3AILXGT4DUO2APIAO6NS6
X-Message-ID-Hash: 4TU3MEMBHTI3AILXGT4DUO2APIAO6NS6
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
Archived-At: <>
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

