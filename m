Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 654D1694180
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 10:41:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CCB882A;
	Mon, 13 Feb 2023 10:40:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CCB882A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676281270;
	bh=un4YWUkY79FtE2xZsdouboCEKQgThl3bE2JVvYxvrv0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HiCbD6N0JKC05h6z9iLAGBrA1CfEsaKLB6Yr/uHmZ+YsEBIiWHONMkjkg/ElzYs4g
	 26h8Gtm78q6B238xQ6VobHWvtFSmnCZyeSlExpMI8tIoUSFvcXhgxpIfCZvurgfqxn
	 O1RNDl9OAe/qF7broiSj6O6N//msWGvhI3TaIHS0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0956F805A1;
	Mon, 13 Feb 2023 10:38:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A80EF80571; Mon, 13 Feb 2023 10:38:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF14FF80564
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 10:37:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF14FF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QV+WF+FH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmJDRtbqU1dszNZml9CfbfkHmdW2LfE9NZKX/BlAnCvRfVURFZYSbXnUzdxgL6Cx61PlNGmG15wE/ioUVEP+oyaiqg6tOHsE3162Nnb1FT2XmRH7Sxn0jsSm3jt+Wo70aF/4e+cPgculPjc27C0jESpEsURAmtlE0uCjwp+s0iCAxGvnqKsNp5IM81p5+4NyrW3/IdPaH9SFM4tZAHUNtbKygLRt6rHRZ3JeCWW0ysrICxjTKERuPQbQ8xOCckHDvr6aUs7PdzpfFNWajbp+RS25mVCKN9bHva+9nmDLSp81qUCy9m/sKQmFM+Wb3frCLfhF1KzaOq/GZ/poqWiMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AbeJQZWQgLfyB7IzvVWU5jNKASoL3N0KVTuKWhlcmlA=;
 b=aWKF8BgjAcOuMMzSJxTbF97ttA/dg/HKU+tlgGOs883iBPV7dIqKEfTPX6t1xRHzDwkX8bTAH7v7VrVRmcgypnY8RDrjQ4vYAVjyNxzQZ5Sr3cAPWlUm5jwDQrWo9VM+MyBX3AmOLeBDGw79hMa4mTnS9ZQN7mmBJfXXSCwblqUO071GfDfGGxGMZxaL6MA5uAxcX/Wwh4UkFkkyHlyxGKol4TeieEmwnmzz0LQINGoUobxE6FN5f5kj7SBuOPe7BJnRgTNVYlbukoMimQW3YNYngKzJN/rqh3reSAVUwu2B5Urhjuwvci/pqSAi/lOgyPGteYlcLZIlQPjDax16Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AbeJQZWQgLfyB7IzvVWU5jNKASoL3N0KVTuKWhlcmlA=;
 b=QV+WF+FH1HklkkuhR5CilmJk9xaZgT07YB7G6C6b9Zi8pHkf4V1QKun63hsPpJGDHxrfEp5qwEOnOOtSMC3lPSBDATjh6maRSm02n62PcCUDCh7BGR2K23uQvodxjQUoSyf59i5UrEgzI7rn2dviTdSHGbB8VRGBxJiqHhjnS2c=
Received: from BN0PR10CA0026.namprd10.prod.outlook.com (2603:10b6:408:143::21)
 by DS7PR12MB8347.namprd12.prod.outlook.com (2603:10b6:8:e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 09:37:50 +0000
Received: from BN8NAM11FT074.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:143:cafe::ee) by BN0PR10CA0026.outlook.office365.com
 (2603:10b6:408:143::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24 via Frontend
 Transport; Mon, 13 Feb 2023 09:37:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT074.mail.protection.outlook.com (10.13.176.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.24 via Frontend Transport; Mon, 13 Feb 2023 09:37:50 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 03:37:49 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 03:37:49 -0600
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 13 Feb 2023 03:37:45 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
Subject: [PATCH V2 5/8] soundwire: amd: add soundwire manager interrupt
 handling
Date: Mon, 13 Feb 2023 15:10:28 +0530
Message-ID: <20230213094031.2231058-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213094031.2231058-1-Vijendar.Mukunda@amd.com>
References: <20230213094031.2231058-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT074:EE_|DS7PR12MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: b8b67c5e-06da-460c-a5d5-08db0da5f904
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4/gnl0U1+LdRc/zGEsuhfS3I641IiGjtPwcs6bp2JQrcMeQhJbRGhdY/jg/dZD7d6yHrKpScR9oCsyC+k8p09ettXN6AaI39/pZBSVene5U5DdPANJSUk2MMcQdt2oqzJ8ilSeJHRoEkMSkF5VBKAwV47rQF1fVVPBnZaI9sPxRrW8vS5VhkgC1xsBVz4+wh+Z9KjGn2ICUuhfzeQ3qAhxL8T/KeAa+v6jeZJdXIQtHLKmzu1VzVGRzGFpw2v3QUQjGYpmxlUYF4I1sgB3zBCDzsAVUGT3QZ7c9qdAqpLvp/aseZ/DAuYsfyctxpjTmFMP4U4MCP8MChhT/IxXokNM9crGq0IGUQpGWDJTfjg3kpRmjx1Dt1fMwxQQISK7RQ+B/FRoonR7K0XmqD5fVzF2HrkEEaWEcMf4lF0uecM6VnwJW/dML96sDiIUQnjFPqclopo3bUnjn8VnlaS+9kCZD/Go2EMOEIKVJt+VJDr0RglIatN7rWHgJfVtViWReI3ggfEcbuoDFxcuPRvmTcj5j6ak27iOe8mqlWMQE+3F09zEE2TArWGwERBM2+2nOWv5ny7fAOKStSt1XB4nvf06UOQXz9wBoyNIVXkNSFqFnanAPF2l40cec+2bWmLRc/gwKc4CCNaULhWX7tu8GWvIq0jwwWyTqih24e5XiMsDaq2XKlC9cke++s4jM9thm+2LgD+oElZR3y4R2mfRQmAzTZhrno+OklSuDEnJ45IN0=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199018)(40470700004)(46966006)(36840700001)(40460700003)(36756003)(86362001)(54906003)(316002)(8676002)(4326008)(1076003)(70586007)(6666004)(7696005)(82310400005)(478600001)(2906002)(70206006)(6916009)(41300700001)(8936002)(5660300002)(81166007)(356005)(82740400003)(36860700001)(40480700001)(2616005)(336012)(26005)(186003)(83380400001)(47076005)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 09:37:50.1184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b8b67c5e-06da-460c-a5d5-08db0da5f904
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM11FT074.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8347
Message-ID-Hash: 2XAVHHJUJGI72L3GIUCIBC4OEBCZTQI6
X-Message-ID-Hash: 2XAVHHJUJGI72L3GIUCIBC4OEBCZTQI6
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: amadeuszx.slawinski@linux.intel.com, Mario.Limonciello@amd.com,
 Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2XAVHHJUJGI72L3GIUCIBC4OEBCZTQI6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for handling soundwire manager interrupts.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 132 ++++++++++++++++++++++++++++++
 drivers/soundwire/amd_manager.h   |   1 +
 include/linux/soundwire/sdw_amd.h |   7 ++
 3 files changed, 140 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 14c88b80ab6d..87f9a987d93a 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -417,6 +417,47 @@ static enum sdw_command_response amd_sdw_xfer_msg(struct sdw_bus *bus, struct sd
 	return SDW_CMD_OK;
 }
 
+static void amd_sdw_process_ping_status(u64 response, struct amd_sdw_manager *amd_manager)
+{
+	u64 slave_stat = 0;
+	u32 val = 0;
+	u16 dev_index;
+
+	/* slave status response*/
+	slave_stat = FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_0_3, response);
+	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STAT_4_11, response) << 8;
+
+	dev_dbg(amd_manager->dev, "%s: slave_stat:0x%llx\n", __func__, slave_stat);
+	for (dev_index = 0; dev_index <= SDW_MAX_DEVICES; ++dev_index) {
+		val = (slave_stat >> (dev_index * 2)) & AMD_SDW_MCP_SLAVE_STATUS_MASK;
+		dev_dbg(amd_manager->dev, "%s val:0x%x\n", __func__, val);
+		switch (val) {
+		case SDW_SLAVE_ATTACHED:
+			amd_manager->status[dev_index] = SDW_SLAVE_ATTACHED;
+			break;
+		case SDW_SLAVE_UNATTACHED:
+			amd_manager->status[dev_index] = SDW_SLAVE_UNATTACHED;
+			break;
+		case SDW_SLAVE_ALERT:
+			amd_manager->status[dev_index] = SDW_SLAVE_ALERT;
+			break;
+		default:
+			amd_manager->status[dev_index] = SDW_SLAVE_RESERVED;
+			break;
+		}
+	}
+}
+
+static void amd_sdw_read_and_process_ping_status(struct amd_sdw_manager *amd_manager)
+{
+	u64 response = 0;
+
+	mutex_lock(&amd_manager->bus.msg_lock);
+	response = amd_sdw_send_cmd_get_resp(amd_manager, 0, 0);
+	mutex_unlock(&amd_manager->bus.msg_lock);
+	amd_sdw_process_ping_status(response, amd_manager);
+}
+
 static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 {
 	struct amd_sdw_manager *amd_manager = to_amd_sdw(bus);
@@ -817,6 +858,95 @@ static int amd_sdw_register_dais(struct amd_sdw_manager *amd_manager)
 					       dais, num_dais);
 }
 
+static void amd_sdw_update_slave_status_work(struct work_struct *work)
+{
+	struct amd_sdw_manager *amd_manager =
+		container_of(work, struct amd_sdw_manager, amd_sdw_work);
+	int retry_count = 0;
+
+	if (amd_manager->status[0] == SDW_SLAVE_ATTACHED) {
+		acp_reg_writel(0, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
+		acp_reg_writel(0, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
+	}
+
+update_status:
+	sdw_handle_slave_status(&amd_manager->bus, amd_manager->status);
+	if (amd_manager->status[0] == SDW_SLAVE_ATTACHED) {
+		if (retry_count++ < SDW_MAX_DEVICES) {
+			acp_reg_writel(AMD_SDW_IRQ_MASK_0TO7, amd_manager->mmio +
+				       ACP_SW_STATE_CHANGE_STATUS_MASK_0TO7);
+			acp_reg_writel(AMD_SDW_IRQ_MASK_8TO11,
+				       amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
+			amd_sdw_read_and_process_ping_status(amd_manager);
+			goto update_status;
+		} else {
+			dev_err_ratelimited(amd_manager->dev,
+					    "Device0 detected after %d iterations\n",
+					    retry_count);
+		}
+	}
+}
+
+static void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_change_8to11,
+					struct amd_sdw_manager *amd_manager)
+{
+	u64 slave_stat = 0;
+	u32 val = 0;
+	int dev_index;
+
+	if (status_change_0to7 == AMD_SDW_SLAVE_0_ATTACHED)
+		memset(amd_manager->status, 0, sizeof(amd_manager->status));
+	slave_stat = status_change_0to7;
+	slave_stat |= FIELD_GET(AMD_SDW_MCP_SLAVE_STATUS_8TO_11, status_change_8to11) << 32;
+	dev_dbg(amd_manager->dev, "%s: status_change_0to7:0x%x status_change_8to11:0x%x\n",
+		__func__, status_change_0to7, status_change_8to11);
+	if (slave_stat) {
+		for (dev_index = 0; dev_index <= SDW_MAX_DEVICES; ++dev_index) {
+			if (slave_stat & AMD_SDW_MCP_SLAVE_STATUS_VALID_MASK(dev_index)) {
+				val = (slave_stat >> AMD_SDW_MCP_SLAVE_STAT_SHIFT_MASK(dev_index)) &
+				      AMD_SDW_MCP_SLAVE_STATUS_MASK;
+				switch (val) {
+				case SDW_SLAVE_ATTACHED:
+					amd_manager->status[dev_index] = SDW_SLAVE_ATTACHED;
+					break;
+				case SDW_SLAVE_UNATTACHED:
+					amd_manager->status[dev_index] = SDW_SLAVE_UNATTACHED;
+					break;
+				case SDW_SLAVE_ALERT:
+					amd_manager->status[dev_index] = SDW_SLAVE_ALERT;
+					break;
+				default:
+					amd_manager->status[dev_index] = SDW_SLAVE_RESERVED;
+					break;
+				}
+			}
+		}
+	}
+}
+
+static void amd_sdw_irq_thread(struct work_struct *work)
+{
+	struct amd_sdw_manager *amd_manager =
+			container_of(work, struct amd_sdw_manager, amd_sdw_irq_thread);
+	u32 status_change_8to11;
+	u32 status_change_0to7;
+
+	status_change_8to11 = acp_reg_readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
+	status_change_0to7 = acp_reg_readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
+	dev_dbg(amd_manager->dev, "%s [SDW%d] SDW INT: 0to7=0x%x, 8to11=0x%x\n",
+		__func__, amd_manager->instance, status_change_0to7, status_change_8to11);
+	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
+		amd_sdw_read_and_process_ping_status(amd_manager);
+	} else {
+		/* Check for the updated status on peripheral device */
+		amd_sdw_update_slave_status(status_change_0to7, status_change_8to11, amd_manager);
+	}
+	if (status_change_8to11 || status_change_0to7)
+		schedule_work(&amd_manager->amd_sdw_work);
+	acp_reg_writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
+	acp_reg_writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
+}
+
 static void amd_sdw_probe_work(struct work_struct *work)
 {
 	struct amd_sdw_manager *amd_manager = container_of(work, struct amd_sdw_manager,
@@ -909,6 +1039,8 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		return ret;
 	}
 	dev_set_drvdata(dev, amd_manager);
+	INIT_WORK(&amd_manager->amd_sdw_irq_thread, amd_sdw_irq_thread);
+	INIT_WORK(&amd_manager->amd_sdw_work, amd_sdw_update_slave_status_work);
 	INIT_WORK(&amd_manager->probe_work, amd_sdw_probe_work);
 	schedule_work(&amd_manager->probe_work);
 	return 0;
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 3e1bded1e769..5bcaf7a763bb 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -186,6 +186,7 @@
 #define AMD_SDW1_PAD_KEEPER_EN_MASK			0x10
 #define AMD_SDW0_PAD_KEEPER_DISABLE_MASK		0x1E
 #define AMD_SDW1_PAD_KEEPER_DISABLE_MASK		0xF
+#define AMD_SDW_PREQ_INTR_STAT				BIT(19)
 
 enum amd_sdw_cmd_type {
 	AMD_SDW_CMD_PING = 0,
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index c978cfbc0207..003b8a197fc5 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -45,8 +45,11 @@ struct sdw_amd_dai_runtime {
  * @mmio: soundwire registers mmio base
  * @acp_mmio: acp registers mmio base
  * @reg_mask: register mask structure per manager instance
+ * @amd_sdw_irq_thread: soundwire manager irq workqueue
+ * @amd_sdw_work: peripheral status work queue
  * @probe_work: soundwire manager probe workqueue
  * @sdw_lock: mutex to protect acp share register access
+ * @status: peripheral devices status array
  * @num_din_ports: number of input ports
  * @num_dout_ports: number of output ports
  * @cols_index: Column index in frame shape
@@ -65,10 +68,14 @@ struct amd_sdw_manager {
 	void __iomem *acp_mmio;
 
 	struct sdw_manager_reg_mask *reg_mask;
+	struct work_struct amd_sdw_irq_thread;
+	struct work_struct amd_sdw_work;
 	struct work_struct probe_work;
 	/* mutex to protect acp common register access */
 	struct mutex *sdw_lock;
 
+	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
+
 	int num_din_ports;
 	int num_dout_ports;
 
-- 
2.34.1

