Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBD788D66C
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 07:33:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D5BF2BF5;
	Wed, 27 Mar 2024 07:33:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D5BF2BF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711521221;
	bh=17lQP/6cUYkFTior5yW/mQtOmY7Orut49YPwqyvGCBU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qy3dM6/f3HFFRBaIooAd2bvJbSyOWt267YgC+kIq//ePyYsG0FdJYlT4Nr4BCeMDh
	 aXJZhedoE1KS1IhMTXGLkvnLeky4/ul4rlQhYEGd1+ok/WjZdXojhU51yjcBP9elF4
	 MaQpCf/Nqt7FuCg6cbGSxOdgEmWK7s7YbLs7xLxs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40247F805A8; Wed, 27 Mar 2024 07:33:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6E4FF80587;
	Wed, 27 Mar 2024 07:33:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E69A6F8025F; Wed, 27 Mar 2024 07:32:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2412::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E98C6F801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 07:31:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E98C6F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=K/VQSrXL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFgO6w64d0/ax142XsuLPXOgHNQTa1TPkt9ZbUmU738xjY0VXaqr7QdLeUllhGt+PY2ueWkpDoLJMTxqITW5ZzGUhRQV+u2z+dNKb3SS3EgXWuCdpPhZGg5P8KuYXYem+JvbqEAgjlZyO9rhyyT6Qht/hUUFLu54r8JtVe5vAIgeICWBT5hPaTEZ6y/ufI6FhaGrq28D0eb5EV8/MyeUk5Cmmf8j5HzLNTZO7v4Az9xoQTmyCelJIHjb47QRV6N4/15SjRe1A6mMxdHCKQJxjZlLVpVP8FNZM1sf+XWBaEhyYrM+Z065bXfLYB28IRk2RXTlKBIf5y7SWOt/QY3GXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gor4f/qSypQ7yItu/jaZAS0gMOiyJgzdGq8p5XYuN30=;
 b=FWd+qVK2JfxAuOnxnTHGAK7K8WjM88fPkzDUCkUS1gGk+WUJqlTZvY/rl46ur7rKtOheENfN5YCvxxb9wAVRlHzX04mXIopJCWKGs6zPA/jz1JezCvh3AbnYiI4dLhMvEiCL6sXCXLg3bmcXd2PGBCM7Jb5mpl5gE3LaI9gvnDnyWezwhCABRtMcYsEgtxHUbCCi3ExosDwNFEfhG8EhshG1m0qBCwCm/l4G2AbA0Zpz8nGb/yaIGntpEt1umHOHOnOJAT4eMSbEx5kZSPDtZlj8TPelhD7HYEojigqYvsl9abQzrGEAf/SA4GKpJdUddprmqJoOBpXMgxXWMsEjVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gor4f/qSypQ7yItu/jaZAS0gMOiyJgzdGq8p5XYuN30=;
 b=K/VQSrXLg/pBdCEkEN3R9KeyrXSBfWPhdVwSWH3GMvLFwmirxwT03Qdpy0/Fv54NH4cMZFftQ6IX/l+WXsEfU1GRHkQwCBSX382WvVIzjUCslTptxsuHaRHyTeWq+m1dSXoLez5xQaiva06f2FP0Jytoogct7HBtWSqHJC37gEI=
Received: from BLAPR05CA0004.namprd05.prod.outlook.com (2603:10b6:208:36e::8)
 by SN7PR12MB8028.namprd12.prod.outlook.com (2603:10b6:806:341::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 06:31:51 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::62) by BLAPR05CA0004.outlook.office365.com
 (2603:10b6:208:36e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Wed, 27 Mar 2024 06:31:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 06:31:51 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 01:31:51 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 23:31:50 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Wed, 27 Mar 2024 01:31:47 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<pierre-louis.bossart@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>,
	Mastan Katragadda <Mastan.Katragadda@amd.com>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] soundwire: amd: fix for wake interrupt handling for
 clockstop mode
Date: Wed, 27 Mar 2024 12:01:43 +0530
Message-ID: <20240327063143.2266464-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327063143.2266464-1-Vijendar.Mukunda@amd.com>
References: <20240327063143.2266464-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|SN7PR12MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: 4165160d-e72e-4530-b6d9-08dc4e2796a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ueJpIZ28qxzXEqHBDt8LkUAfj7vR3ZI6dmDlOl7jKoWJlE84sUPqYWa0EdNKRj9KPB96eisTQ+IaAVujndfIarqJKp6wUbp2naN99nhkEn5uIZhQNQLJwoYlxXeICxRarOOn3/D5OHgtRZKcxjfD+g/F3we1YBmN1R4N/ynjHXvMg5uWbaFWNdKz7scVL9iFVJ5wttHPAZrlXXwwSZhH8XiFm2AXWBOf92uRFQX+cLNsKYSGeRbbp3SQKC6nvEfZVGjaT4+yn5cPhBKmAm6rGBombP9IUB65IuNwG+/2RqdTeCVLJhB41j4YMUEuBMgIC76lp4zwHe01nKq+n9utHvMi02fKEmB8yr0TE6lcKutLWthGBKaw68DGOOuyCeWHwLp0x6GsTg3hHSlMG4oQsTybLilyfnU658cByWiIj+K0LG0Ie8zRrUbjwmE8HAiv5O3tp3Ewr+ZXIQzK0T+CXZFoWMZHsEHs91TPsuCE8uBYw9F9NZPkjyekRx7m5NDW3yOZ6kLSnbBP/D+y0odqRWKmOk9fhURvzEymZ0C0I8L2Q52GWKAqZmSmdIy6VUcUE2THQgCxC/sJ0enjlLd0Mk7Ws+TdkdKWn7ZMaeZEcu4XlBAh6+QUYJU9toUuY+P6QmUd7t8QO9enkiXFqPNC3ywET8DjOhj9wYX2AofdauGfkRM7phM4H7tJY135akQYHDhu3MkKKiNNPT+PJLncAGLlVEPU3cihwEHFKD0d+B1nKGhRj/yTXFP1Gv3QgEPi
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 06:31:51.7654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4165160d-e72e-4530-b6d9-08dc4e2796a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8028
Message-ID-Hash: BDZFPHGZ5LRVTJKGQADWSR6IYGATG5PS
X-Message-ID-Hash: BDZFPHGZ5LRVTJKGQADWSR6IYGATG5PS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BDZFPHGZ5LRVTJKGQADWSR6IYGATG5PS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When SoundWire Wake interrupt is enabled along with SoundWire Wake
enable register, SoundWire wake interrupt will be reported
when SoundWire manager is in D3 state and ACP is in D3 state.

When SoundWire Wake interrupt is reported, it will invoke runtime
resume of the SoundWire manager device.

In case of system level suspend, for ClockStop Mode SoundWire Wake
interrupt should be disabled.
It should be enabled only for runtime suspend scenario.
Change wake interrupt enable/disable sequence for ClockStop Mode in
system level suspend and runtime suspend sceanrio.

Fixes: 9cf1efc5ed2d ("soundwire: amd: add pm_prepare callback and pm ops support")

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 15 +++++++++++++++
 drivers/soundwire/amd_manager.h |  3 ++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 1066d87aa011..20d94bcfc9b4 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -129,6 +129,19 @@ static void amd_sdw_set_frameshape(struct amd_sdw_manager *amd_manager)
 	writel(frame_size, amd_manager->mmio + ACP_SW_FRAMESIZE);
 }
 
+static void amd_sdw_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
+{
+	u32 wake_ctrl;
+
+	wake_ctrl = readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
+	if (enable)
+		wake_ctrl |= AMD_SDW_WAKE_INTR_MASK;
+	else
+		wake_ctrl &= ~AMD_SDW_WAKE_INTR_MASK;
+
+	writel(wake_ctrl, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
+}
+
 static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_msg *msg,
 				  int cmd_offset)
 {
@@ -1094,6 +1107,7 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
+		amd_sdw_wake_enable(amd_manager, false);
 		return amd_sdw_clock_stop(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		/*
@@ -1120,6 +1134,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		return 0;
 	}
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
+		amd_sdw_wake_enable(amd_manager, true);
 		return amd_sdw_clock_stop(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		ret = amd_sdw_clock_stop(amd_manager);
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 418b679e0b1a..707065468e05 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -152,7 +152,7 @@
 #define AMD_SDW0_EXT_INTR_MASK		0x200000
 #define AMD_SDW1_EXT_INTR_MASK		4
 #define AMD_SDW_IRQ_MASK_0TO7		0x77777777
-#define AMD_SDW_IRQ_MASK_8TO11		0x000d7777
+#define AMD_SDW_IRQ_MASK_8TO11		0x000c7777
 #define AMD_SDW_IRQ_ERROR_MASK		0xff
 #define AMD_SDW_MAX_FREQ_NUM		1
 #define AMD_SDW0_MAX_TX_PORTS		3
@@ -190,6 +190,7 @@
 #define AMD_SDW_CLK_RESUME_REQ				2
 #define AMD_SDW_CLK_RESUME_DONE				3
 #define AMD_SDW_WAKE_STAT_MASK				BIT(16)
+#define AMD_SDW_WAKE_INTR_MASK				BIT(16)
 
 static u32 amd_sdw_freq_tbl[AMD_SDW_MAX_FREQ_NUM] = {
 	AMD_SDW_DEFAULT_CLK_FREQ,
-- 
2.34.1

