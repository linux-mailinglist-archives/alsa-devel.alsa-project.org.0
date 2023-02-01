Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BC0686C3D
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 17:57:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C38B1829;
	Wed,  1 Feb 2023 17:56:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C38B1829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675270665;
	bh=NWubp0l8PTlQfkij1AZrLCcIDnZrGF9NSAWIOilUQYI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=eZ1RybaZwlqJg26lVbWoy+5zsL2S2QZB/NbRlN6hiEkRqm/uuTIkNgTiJShk+P+1a
	 Fac49Q8iMpPKh58UkuxV1rChMtnBUncM0CQnFyA+skxMWVhj+HJyPd253U1w8itKCR
	 xe45l2wMJ+GlWdroy2jGUoJZkxoWjYDVL1Dt8Flg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26108F8045D;
	Wed,  1 Feb 2023 17:56:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56F10F80423; Wed,  1 Feb 2023 17:56:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::608])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75C83F80246
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 17:56:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75C83F80246
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mq+8k3L4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExGCy7BZVW2AVEdTHRvuozT57OlLpXtlrzjY45jM2ddJES3W+kLBt+ESviiSYhwJYHYYNsa8fyVU5RtVZ4CxE8TS6hSaonKfB1fxsxLrQdjl/TIV2lrKpbgd/DWFTxVC/3HD2pl2UsRAGrtgB7SJe6RduXkve7xAusW5HnsGKH2A0JEYPqW7hv+NUBw4pPwHoqbE7JyKjmvMocVoeuRqQLw2PH9Q4TAl90sZz8HrWL63KxTk++dztkiGXjWN82fM1gPII3k49OWLG/TH8/I+bW34zSve/OmLE2BWs3d/KLBYPs6BESU3a1e/+x4muF/NuJS0q1J6eiTT7qobEY8jVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nG71ypQbgaPxBFP5US00WjlmYAI5pEtHjKu+aLI0bwE=;
 b=LgPrD3SYvu/DbEFy3P1WtX5uc7u+tL8cJTUsi0N/q2jIrszQLC0xH9QAfSGbm3RX8KJstu76j+y/geN4F0BcjPtgncLkvaHa4xzJweXOOjS+s4xG5sPtlC3JKMnUgJCAP5gW8QNpC7Jk58UlMiH4iQUVRPB+ycYOsL0L6p7WFC5wmb9wdoy1TIOqoOpPcAMralIxedqKzJufQtpXKIucU5FVsLOQGgaPh0Ce1QX9nvQbLB+rb99wQ6LchIlIgpl5PEcaQRn5FBgP+b1n/jL1idnPGxLLRazDrXmD2jWk9qHDwH4yBmy2i6hvyG8t2A3KP5XLASaI4UvRdPI/gmeiNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nG71ypQbgaPxBFP5US00WjlmYAI5pEtHjKu+aLI0bwE=;
 b=mq+8k3L493YdJ8nLSBkKytB+bxQuD8tik+eXnNvteLzt6ieJL06U/WqLlTgdDLbCAfhXH2rAYZhMJ1FgOHWpnttJ0WUxG+1jC1LnPHL75N+mhccsgjEQcBTnzd+Y43gNpu9vIGsmHFkPlh3relHqUeJ/gtRECladnF1mXGm4zbM=
Received: from DS7PR03CA0242.namprd03.prod.outlook.com (2603:10b6:5:3b3::7) by
 DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.38; Wed, 1 Feb 2023 16:56:36 +0000
Received: from DS1PEPF0000E636.namprd02.prod.outlook.com
 (2603:10b6:5:3b3:cafe::cd) by DS7PR03CA0242.outlook.office365.com
 (2603:10b6:5:3b3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38 via Frontend
 Transport; Wed, 1 Feb 2023 16:56:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E636.mail.protection.outlook.com (10.167.17.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.21 via Frontend Transport; Wed, 1 Feb 2023 16:56:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 1 Feb
 2023 10:56:36 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 1 Feb 2023 10:56:32 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] soundwire: export sdw_compute_slave_ports() function
Date: Wed, 1 Feb 2023 22:29:44 +0530
Message-ID: <20230201165944.3169125-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E636:EE_|DM4PR12MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: 4387ee22-4f81-4ec2-49eb-08db047547f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hnMqiyuM1qD9stnX4lnOy31oLXHj6ZnklGCmQw5QB39XqEypNcGSeAQOyPgiHt+CDcaMb7xuhJX9j9C2LO6jkn46Zw/iWc8y3OglSPjXX/qMGnB91n8dtgyq4w5TP94OkcehqEPuHw0PdqE2kXiPIoA6LXNZCBT5M9p1F/z2xuj2aec01sT0iim79tKePglfdNNGHXaam1Jl1EdsWs3VofKpDA0nidFUol92wNOXTgRoDdnRTjLTlbscdSFdypTv2ywtdw75bJZikQIoG3VTe1jD37aWjBYtqgrv17hF5Xz2l8tb5Uom4dvOCXBBrTg39mcKD6k3njxD9gVH7XovsQR2916KwY1A+nZ3TUBPZ5R1guzWySnH61aFceOC03tgsVdWCpH/hwUqzpwhaW8OVDpW33/ZI4Cdo/8E8jqRgf7lwd9y/HZQS7Lxf6pP610h9iAXYBw5rgltdtIu9ChevMrdehZ+BLoAe3Z/RyPS3YuHnXVBmvlX81oL1S08fZ/wd+qPPljSOCmnzhfM6+bh7Xr8Fnj/0jI1zSFgFvGHl7vQZbLEF0186M3IDRaM0IW1dmcHFWKgugfVGwuLe9vtvyaH12Ih7F6q+nxPqC+rIiODpRz2q+GzLffVE3+8YiMuZXY8nLXL4SKD1Od/RsrT2fIwU1H9VmK6GF2oHlIroNUg/T9ECLBwWaAzyBt4xMqBMtWT4CkFxRk7AjQgIMUWtkADjyLIYyKHu5A9kVmxCLU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199018)(46966006)(36840700001)(40470700004)(70586007)(40480700001)(82310400005)(4326008)(70206006)(36756003)(41300700001)(336012)(6666004)(26005)(5660300002)(8676002)(1076003)(40460700003)(186003)(2616005)(110136005)(54906003)(316002)(478600001)(2906002)(7696005)(82740400003)(356005)(83380400001)(81166007)(86362001)(426003)(36860700001)(47076005)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 16:56:36.7021 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4387ee22-4f81-4ec2-49eb-08db047547f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E636.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6446
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
Cc: Mastan.Katragadda@amd.com, Sunilkumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Mario.Limonciello@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 arungopal.kondaveeti@amd.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Export sdw_compute_slave_ports() function to use it in another
soundwire manager module.
Move sdw_transport_data structure to bus header file to export
sdw_compute_slave_ports() function.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/bus.h                          |  9 +++++++++
 drivers/soundwire/generic_bandwidth_allocation.c | 12 +++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 7631ef5e71fb..141b99ac58de 100644
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
@@ -213,5 +220,7 @@ int sdw_bwrite_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 val
 
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

