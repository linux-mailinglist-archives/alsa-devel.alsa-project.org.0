Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A709E6AE087
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 14:29:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84FEE1469;
	Tue,  7 Mar 2023 14:28:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84FEE1469
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678195775;
	bh=Yl0S2hjEYd7Ixd7VaSS7cafpi6mL72ogX/XuArBsMOQ=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=r0HlvOVMxB7MI2kBBWJKlH+BJ9GRMSiNgPyCuIsmICOyFbKAqqxtrQmZpN8XM+IxL
	 gmQQ8cnE8bfLAEvlR4WRemCpr00Q4yU/J/mm4l23ICaK/Ph2ZSceFHc2aM30LEZ0mn
	 U54ZEulBxQ9Ih6pcEYqYPQ4851IiIKy16JZ6RAJE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 447D4F80431;
	Tue,  7 Mar 2023 14:27:57 +0100 (CET)
To: <vkoul@kernel.org>
Subject: [PATCH V6 1/8] soundwire: export sdw_compute_slave_ports() function
Date: Tue, 7 Mar 2023 19:01:28 +0530
In-Reply-To: <20230307133135.545952-1-Vijendar.Mukunda@amd.com>
References: <20230307133135.545952-1-Vijendar.Mukunda@amd.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6MDIH62EZ62WVDVY5B6RBKCG6FFQWQ77/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167819567583.26.17371021074665657078@mailman-core.alsa-project.org>
From: Vijendar Mukunda via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, amadeuszx.slawinski@linux.intel.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 claudiu.beznea@microchip.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62F0DF80431; Tue,  7 Mar 2023 14:27:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F9F2F80236
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 14:27:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F9F2F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=sX5nDirs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTRS2nkGjkCB5HoQr/wkH5SYvEjSjo9aqklizwFjCYXTjbvK/5xc6q9NHGjtd9H9a0MRpeVLqkl+m43ZLBzZW8G92eLS17TCDCek3F2e152Kr1GbZ5Ir7Tznxm6sNEfDijGaSsSZ9rMWiys88w1Z3lsnez5hl6hMQ5zinivz6r4wIRTUdEtQENU6VY7AlI5F/uavo27QMYIvjDhTrUi0oTKLOCLFwFXJJf3lzGkfqgRjIsjDZV5Uf/jy5SWDBoRtKZKNnVMJFgas3Ey13l62l75drxy8I9oOXTR8K0SKClbHyTAtqCqxPGexjMBDqaFUyzKYBeneTZVAe9xrApg4TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUrMAhuQVof+ju/n9q/rmSwMNJzF/yYd0v9PWitn7Oc=;
 b=Wc7TN4irYbJSV9AoEuVw/pF4zbd5RsT88b5WA8w47O5FyLyW/lvxNpXaQuVcWrpP7pFOoNF7QbGgAXFb8VdU08BGVFenjb2I4a4su+YreVYDXmbUsbQ5zV2qIpIuvWEv6uckSJEbXJ9pXvzXBO/RmAycu5/uR+BglVZl8wUJQlGAuYemeXFhJEzCDPk1a1ZxWCzkymqtrKHiWfK+CUPIQ/PVsu0E9UgIZhUHFwJS5yyYpbmUjWzSJGGQBFSn0QzqlZPeLJ7CSd3xoRgRCgCF9124IGxx8+HeqKGtC4rIRNZalfSltXItj7OvsLqg8odfiL6bXenHzd4ekxPvshNgSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUrMAhuQVof+ju/n9q/rmSwMNJzF/yYd0v9PWitn7Oc=;
 b=sX5nDirsIRi0WdnVaSYe1VEXjiqZAl+XQ7IB3aL54C4nrg+5R55NIgOS89BJVnqxp1kBno9W07TKDL5zisW/qbgeYJ3uQBdu2EVxoR5Q1pQ3aQAXny99TG0sbshygKsi+tBzrOJEwA7vX26oyuUfbrV9l+eFO7tss/6FobkyjsA=
Received: from DS7PR03CA0300.namprd03.prod.outlook.com (2603:10b6:5:3ad::35)
 by SN7PR12MB7324.namprd12.prod.outlook.com (2603:10b6:806:29b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 13:27:40 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::6f) by DS7PR03CA0300.outlook.office365.com
 (2603:10b6:5:3ad::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29 via Frontend
 Transport; Tue, 7 Mar 2023 13:27:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.16 via Frontend Transport; Tue, 7 Mar 2023 13:27:39 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 07:27:37 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Mar
 2023 05:27:37 -0800
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 7 Mar 2023 07:27:33 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
Subject: [PATCH V6 1/8] soundwire: export sdw_compute_slave_ports() function
Date: Tue, 7 Mar 2023 19:01:28 +0530
Message-ID: <20230307133135.545952-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307133135.545952-1-Vijendar.Mukunda@amd.com>
References: <20230307133135.545952-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT067:EE_|SN7PR12MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 71ec8ecc-41bc-4c18-9ae0-08db1f0fb980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	C1voAZjMsAWJmZDJMM9U9Id9q5llOIE8xxVJyso3478G+Q/S0IAP36VqzfZxVTTosf3htFYFbBoWUHshgt0UoW1MjKqurl42LVCmW8tlPfHypyLn4hz/VqDN5HM7MXSz9WiQKNtrYJngbSw+Jlqfa/jj8FXp35VPmik/Iuz3Vo3Q9XxAvsW95RnIEnue2DtvhCTWAZAk3tFpdGJ3BvK+HHH5X3Z3uMSEUxG3/R5CoZU2PzZ9J3Mdrm+rn2knf1/md72CUziuGRz9xLs3DqpcZQg+k0nfdQGqaT5ug+7ILguVuTMn3MEBdg6nl910k57yV5PHDgQzwvaVHiu6EgpdnrAhKY9kVMq5u25lWliaBOevuj3PqsfXaVgjsGnsshXZJC70LIM2MLQVcu4v5wbEzd0kMB5xFcdYZoBskm6UnpUtWJ+s/dRpwNoWyK7yXCa3JhBYc/RvKsfTcajByrr32B+LB6F4VCCsTZcAfilgiuVOIVBehj8JkReAJr29/QKu7j0X4d1ubeJuqhBZsX8rljhpLWCKsfc2U4nYItPGKw1iIYFlnzByD6jabRnBTd+Pm8Sbf7UB7E1w/QGYCpCQdOZZjq4ffKExlGNNyHqG+uV+EyoFoZGa3zYm6GRXeY+7VUQaSRc/PP7/a8jPd5tLBjV/ZiknJsOG22JIXSXztdEfCIf36PhUIX3cvLZkKYR8IMyxG6CYQVtkRj/DOgefzugPdb6IwbbmkRQ7aenFxs0=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199018)(40470700004)(36840700001)(46966006)(478600001)(5660300002)(47076005)(336012)(86362001)(426003)(966005)(186003)(36756003)(40460700003)(1076003)(2906002)(2616005)(7696005)(26005)(40480700001)(82310400005)(70586007)(70206006)(81166007)(4326008)(8676002)(6916009)(82740400003)(6666004)(83380400001)(8936002)(36860700001)(316002)(41300700001)(54906003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 13:27:39.9459
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 71ec8ecc-41bc-4c18-9ae0-08db1f0fb980
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7324
Message-ID-Hash: 6MDIH62EZ62WVDVY5B6RBKCG6FFQWQ77
X-Message-ID-Hash: 6MDIH62EZ62WVDVY5B6RBKCG6FFQWQ77
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Mario.Limonciello@amd.com, amadeuszx.slawinski@linux.intel.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 claudiu.beznea@microchip.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6MDIH62EZ62WVDVY5B6RBKCG6FFQWQ77/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Export sdw_compute_slave_ports() function to use it in another
soundwire manager module.
Move sdw_transport_data structure to bus header file to export
sdw_compute_slave_ports() function.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/lkml/20230201165944.3169125-1-Vijendar.Mukunda@amd.com
---
 drivers/soundwire/bus.h                          |  9 +++++++++
 drivers/soundwire/generic_bandwidth_allocation.c | 12 +++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 96927a143796..0ea0412842c5 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -144,6 +144,13 @@ struct sdw_master_runtime {
 	struct list_head bus_node;
 };
 
+struct sdw_transport_data {
+	int hstart;
+	int hstop;
+	int block_offset;
+	int sub_block_offset;
+};
+
 struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
 					    enum sdw_data_direction direction,
 					    unsigned int port_num);
@@ -212,5 +219,7 @@ int sdw_bwrite_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 val
 
 void sdw_clear_slave_status(struct sdw_bus *bus, u32 request);
 int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
+void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
+			     struct sdw_transport_data *t_data);
 
 #endif /* __SDW_BUS_H */
diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index f7c66083a4dd..39543048baa7 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -28,15 +28,8 @@ struct sdw_group {
 	unsigned int *rates;
 };
 
-struct sdw_transport_data {
-	int hstart;
-	int hstop;
-	int block_offset;
-	int sub_block_offset;
-};
-
-static void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
-				    struct sdw_transport_data *t_data)
+void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
+			     struct sdw_transport_data *t_data)
 {
 	struct sdw_slave_runtime *s_rt = NULL;
 	struct sdw_port_runtime *p_rt;
@@ -85,6 +78,7 @@ static void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
 		}
 	}
 }
+EXPORT_SYMBOL(sdw_compute_slave_ports);
 
 static void sdw_compute_master_ports(struct sdw_master_runtime *m_rt,
 				     struct sdw_group_params *params,
-- 
2.34.1

