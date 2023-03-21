Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1876C29A6
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 06:14:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52B251F1;
	Tue, 21 Mar 2023 06:13:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52B251F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679375667;
	bh=6Z9OPsbBZmU8XOZ3nZWBgbfr2+9DfdGe6hborx09jWg=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=hLE3aeCfZ1LGiWw2n6bRJH8tqtqxZt68ohmsKgVggi7eHNCXd7VHS9gIQbtIwPEWx
	 VXQc8FOj1Hwyirar93U6WP0ZT/ZpcBbnhPmymoSIUJoi2LNUHzMpRvbf3f3/rkKDtq
	 8avtWbbGuk71dbdSsvcJPmTmrUHarDL+tx0vrJfo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8183F80482;
	Tue, 21 Mar 2023 06:13:31 +0100 (CET)
To: <vkoul@kernel.org>
Subject: [PATCH V8 1/8] soundwire: export sdw_compute_slave_ports() function
Date: Tue, 21 Mar 2023 10:38:54 +0530
In-Reply-To: <20230321050901.115439-1-Vijendar.Mukunda@amd.com>
References: <20230321050901.115439-1-Vijendar.Mukunda@amd.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKPB3J7NSOHINBRBUUB7GK7T3TUX6TAI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167937547418.26.17643929569554590362@mailman-core.alsa-project.org>
From: Vijendar Mukunda via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: vinod.koul@linaro.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 amadeuszx.slawinski@linux.intel.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, claudiu.beznea@microchip.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA161F80529; Tue, 21 Mar 2023 06:08:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67E6FF800C9
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 06:05:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67E6FF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Jmmdl914
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cU/3UWSpM1TxZN+NaA99/0NCE3Gfz7hczLsyQpErAcaFy9r58CjzVsZ687T4HBPT9V0SJwWFV30q9MCOHWjpleTYxbfR7h3GFm4Oy6orLYzQvrfoLaITEGrfeY55wGd56z4Qjw5hhgS63fhX4P+6dRNsidixOmdX6rORB1qRm9bc7MD8ZKHHoX1LI+kPaWxLWikdgYLGEyBglHhqQDjyFGCJk9KmG2bwx5lY8VlU2JAPOHX1P6Ie6EA+zmboM74L6/+EaWHQ4THokKVzLbF7UVyZvBbkrxN9ptubXjDEsAVSKmx2AoPeJdsNoMwS32MZEh0RHJPyV4Af2ofZTftvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUrMAhuQVof+ju/n9q/rmSwMNJzF/yYd0v9PWitn7Oc=;
 b=HLXqIKGRfn7qDhALxhmgi0MyPyk3oZMmtz5l0yyvlZm30HepGn2pZLvkd3fm6luycNndtxTlTfloiTBmC0rNQ6Z3DvNI2gwN9bmtpk1Th9kVk3H128i5tq7KwVBjrUMSBIxVrvQlGxLlb1KTNG8c8FBykMaiIJmQ2akBzD/GXbX6c2/U+r/zWVhu5uj8hmLZj95BRAzu4W4H0jkTZWg08B353IipONoVmM7qS6LtcJJcFDUo2ut/R3mQ0CujgtVLoGX2qHu8hX1toTsERaInXZ8NZW8gVQnVokf+y7wJq2aev0t6znOMSdHiBaI2fkMeXliZwPVNUeiRuog2KjxqDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUrMAhuQVof+ju/n9q/rmSwMNJzF/yYd0v9PWitn7Oc=;
 b=Jmmdl914LFu3uFRn8XFShvnLeLiIdZKQDZDEH6791xKEMHuxrpXybz+BnIpp+exykXvqJv35TTMXO7s59Xq0AF5Lf1AvJyF0i3/9PZH9nDk6hxhrf/vr/OyPJZUf7j6DUJqqOpWAj52qA92/SE3Zz9Vv/XlS1sq124yXU9NoygY=
Received: from BN9PR03CA0038.namprd03.prod.outlook.com (2603:10b6:408:fb::13)
 by DM4PR12MB6254.namprd12.prod.outlook.com (2603:10b6:8:a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 05:05:18 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:fb:cafe::c6) by BN9PR03CA0038.outlook.office365.com
 (2603:10b6:408:fb::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 05:05:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Tue, 21 Mar 2023 05:05:17 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 00:05:17 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 20 Mar
 2023 22:05:16 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 21 Mar 2023 00:05:13 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
Subject: [PATCH V8 1/8] soundwire: export sdw_compute_slave_ports() function
Date: Tue, 21 Mar 2023 10:38:54 +0530
Message-ID: <20230321050901.115439-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321050901.115439-1-Vijendar.Mukunda@amd.com>
References: <20230321050901.115439-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|DM4PR12MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be76ed4-5442-4d98-9b64-08db29c9dd2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9wolNxDVbyH1m2W+G1NyyXBiBASeDZfQ8jVxgi1OxPZFLyK9piCtzX9cT2wcZUupLKZPLfab48Aicibdb/t9tUmjx8MRjJlm3dIaIxiVj3QM9IPQ9KyYUGAKrNuBaWu0etGdvVi7ujfvyGldCOb9PY2SGIOTzMKh2NZpQth94+GTCjKVO4bXxDTmUazaqk0csx1IC11Fq158QLGZez64ASoFNH8mbCCqRj5Rnsn+m7XF2I0YetX8qk3OBY1TjrgHssn0cGTAAuAMT0i5WEZQVMEiha4/lxffuK76mtzB50idRftMIGtsOcmigaiKlDVNUcGcVbT3CTfFfnSHujqhnt67VwIh63ig6rSSVGWPAa64EgPd/Tov3czNFvvUvXvDLh/qmlYVxVF30PL1BmrYaddHXMoD0lQU7zf1kvgn9kYbBeVHwS9HjRUXJSApGjvn4XK1oUu0P2YsK/g+7DuuSwHZ9hm/d7vsSwRXLzCSkBCW2z+Nw88iUMwb0+Y6K333EfkFBG8MDV/LR66v7qkqZCnBvss//TIW8/m56ieMQeN9ZUnnokW6RIaRL9isJPqlpSMJ068DC3ZBRVLe2dz48LPWyaU3Yy2PpknAcyCBpaWnWDD62OsSzsNL7dy6trCKols9L05PA/NvHOzmGesL3Z+Mz6hEBMcDzZH0ahEe09vt/a05fGivyVHiDvfI+yBZLdpo5sPtNnTpgdvJrVjzsJTfxx1y+4lmAJ5m1gs2POM=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(82310400005)(83380400001)(478600001)(54906003)(82740400003)(81166007)(2616005)(356005)(2906002)(26005)(47076005)(5660300002)(426003)(7696005)(186003)(316002)(1076003)(36756003)(8936002)(966005)(40480700001)(86362001)(6666004)(70586007)(336012)(70206006)(8676002)(36860700001)(6916009)(4326008)(41300700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 05:05:17.8573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5be76ed4-5442-4d98-9b64-08db29c9dd2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6254
Message-ID-Hash: VKPB3J7NSOHINBRBUUB7GK7T3TUX6TAI
X-Message-ID-Hash: VKPB3J7NSOHINBRBUUB7GK7T3TUX6TAI
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 amadeuszx.slawinski@linux.intel.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, claudiu.beznea@microchip.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKPB3J7NSOHINBRBUUB7GK7T3TUX6TAI/>
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

