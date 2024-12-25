Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B66CB9FC3FA
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2024 08:26:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 362416028D;
	Wed, 25 Dec 2024 08:26:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 362416028D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735111587;
	bh=aOHZa+Qk/6pAwlvkUIEssC7Ei32tHLtPuoQe+VxkuPs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vnvDCuhYVdcyrDjAB0njADXpuOrJ4zsieugy8MWdHIEUJsEpf0oG3hTxjuomaUd/n
	 lM+4jdv/kvYy800yQsz20rqKBs5+4g5DQsJA56TQc4+Gk14yQFtH3nybJBcgAEU2Sa
	 4oQaXDpJ4rpYbP81LnCmMzJw3GtfsHHkcYywBrm4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0614F805AE; Wed, 25 Dec 2024 08:24:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 133FAF80655;
	Wed, 25 Dec 2024 08:24:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13F52F805B4; Wed, 25 Dec 2024 08:24:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B20B8F805AC
	for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2024 08:24:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B20B8F805AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WvxjDKtP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4xvZE34xbI0oypy3pIat9oYjK9h2aoi+5qpnuSuTOKgHSDKRY/lGvEjqkQ9CDwmszBlxMttf0NPgD93E/WY8mYlN9lm5oN7iA+GazAlygDraZolEQHR0aG/A+8dK+Y7f+CKrDBaZ3hv3FATlAaWN7SJm/BexHQcBIOBOtqiRS1LnpLq8+B/iJSd2b3rfVzxWkCLE0lwSwg/f3IXzQSftZQSc3rH2CYgo54Z5UV5cSAhAZdqSNHobznEYzqgkj9xm/9Nk/jZUIJZBg03UjDRpup/3URQnk/z2cW/Xf5843yjB7DFPXP1XyEYZMDRlyFSDnma/iUqZpF5kf88T0O6IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9/X3BRMGriHmnoiLhcfEh1hJCN+FTGVlUJgmtZRic8=;
 b=dW52P36OsuTL/yBndbX2ffHRvn7CBIBi9ylhHM+2D6pIL44Bl8eZDuoMBzDGvfGAOAMDrm5TvMhblMPWBGoWVkNXJeXd4K9cKeQjD/S6xLb3KYzxEUpaiB2S0/mRhIBt2T5tqmJAxgo5Fg4ol7bOVc527wpX0M4vO4U7lfdfN/Zj8LkZC2TrKoNuzQ2tn4+JC6d6qhpFNfYkxg55AsLhbdVrq5EwKV9kbZioeEMa21EAVS+KGyUzy1/Btx/Prnaeos/YXD8Fi4dMXwwCTpN3bXgAzhHh/4O8iNRAYMBKAQNmhy/EKvqCDrhV6oyW2MJubVQUCpTuC/nJpF1uSWKr/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9/X3BRMGriHmnoiLhcfEh1hJCN+FTGVlUJgmtZRic8=;
 b=WvxjDKtPz9aAJDq3KA4nG7K2/TsmwoXsKA4J8q4S9B4fIx4/TE8aoprfKVxubHDVGFlcCqn64PrQcUJz0fmsQCE0TxVoM5P5r5z3Td1hPLeMStq2qLdUoFgSVX3fbEr4PaNjdOkE/jWdwZmsYEugS2F85CzUZsWanz010OXF960=
Received: from SJ0PR13CA0010.namprd13.prod.outlook.com (2603:10b6:a03:2c0::15)
 by CY8PR12MB7491.namprd12.prod.outlook.com (2603:10b6:930:92::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Wed, 25 Dec
 2024 07:24:30 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::d2) by SJ0PR13CA0010.outlook.office365.com
 (2603:10b6:a03:2c0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.10 via Frontend Transport; Wed,
 25 Dec 2024 07:24:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Wed, 25 Dec 2024 07:24:30 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Dec 2024 01:24:26 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<sanyog.r.kale@intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 4/5] soundwire: amd: add soundwire host wake interrupt
 enable/disable sequence
Date: Wed, 25 Dec 2024 12:53:59 +0530
Message-ID: <20241225072400.912445-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241225072400.912445-1-Vijendar.Mukunda@amd.com>
References: <20241225072400.912445-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|CY8PR12MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9e2294-0d14-41ae-f44d-08dd24b52c24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wzq0/tq9vLsxKR8U6Snp+U1ZeVBXuIhencOydWxgHjVUbOJ4AMYD4/d5WTNU?=
 =?us-ascii?Q?2LgtvvuEUeccRdsHfeXvLFk8CxJ3NJ9fRg2othnLkOXyQxw9xFadbl17HTlM?=
 =?us-ascii?Q?a9+gM2hYw0H8eRtiM0Jan6qOlG9hMhx00mv+g9ijet2kX0GORTZEKDyXnTx8?=
 =?us-ascii?Q?hLRT1qv/PeCycQD8rYoW3X82XO+MH9J7fbCzk36VNTjD/whWFVxPd3aEu0o2?=
 =?us-ascii?Q?PyQVhfIS4Opik8mcrqLT/uc0UTF5mTbKMQChfhT3UW/D3rpiaMK5qPBEjbyf?=
 =?us-ascii?Q?MjI5Uu7rLqOIyDhy7f3pUzGiV5x/+AS8PcNfOR/chnEe2ehwf4DzkVuzrW5R?=
 =?us-ascii?Q?2nQqpHn6Ly8wYNcSKG3mNslTzcl9HfJhHgjubWbI7Wj9yptQ4QM2paX8ToLp?=
 =?us-ascii?Q?77i3AoSip5ixXn6e0mc035ANtJ5wJJALind4Wz+q6SmBRVBVGB++1y44/R7K?=
 =?us-ascii?Q?H5pWccBueuCNJBqgnKEWbHGymZpHBnp5JOFmpXMBHlZOiRDhDJ0UQNDN9KzB?=
 =?us-ascii?Q?qXcRR5SzwTAU34zZLKEvRL4LCYIfggv1As1OK7fwtvdyvZFkKqj6VdTCVA0V?=
 =?us-ascii?Q?5xGxNDZBEHVsih8M0ZHyvGmOBjDH3jv7vTCMmc0iaZU1uMJiRlTF/O+A+ceH?=
 =?us-ascii?Q?lnJXy8oy4mS0tOQOOmLDBfjuVMd08ZRZkNHFlJqidgl1sTwf0LUF3Qm0/dPT?=
 =?us-ascii?Q?lTiVbXXEdZ8c+sf4SWsCXsr1Wmb8P35T1J7g1DIuI4jUIU9ZV3lHLdCeZ9jh?=
 =?us-ascii?Q?yQFEiPv7c5oFVJR/uT59gvXXY2Nzvm9I0uLsSwOOaEwb8Hi6rW4PrVUGYWyW?=
 =?us-ascii?Q?XjHb/+OrWImLiFu0S4qmGpeWCgJ9RetFqh34RBOCEH/4tcknXx+ZcqppjhUU?=
 =?us-ascii?Q?hs8qIq6VK7ZDp4hRJ5E9ma4ySVgyyCUEhVP/94oTlc8Px1Xn6234Guqvinxw?=
 =?us-ascii?Q?u9aJ41o2cwRGcaq7gbyzFraYmTYqmipx1hlm3jOaGBGqXB5mf7TlJrWrqMfg?=
 =?us-ascii?Q?XZP0j0xL9QHRYMcjhTXdU9PgDcVeylKXC87ipXwNderN7TFl488JUnJeZyTU?=
 =?us-ascii?Q?SYRM6G9KJLwo1jq8zjC6CClaV0eLY9xSaxaWoZzu3Wvt1b72HrXMtLEj98l3?=
 =?us-ascii?Q?GtKK8RQG112bWr+UFgQjVoc8UOUzA2ZCW8EQpvXz3ic4Qvll8p7gwXobcvab?=
 =?us-ascii?Q?L3lWDMR4wpkdHt1OAaK9P7Oq4te4N6qffExFfPmJlqLAdKciGiitQ6qORInN?=
 =?us-ascii?Q?1y/tiVNJWkl5b1hAoPzvMKcDCoMhKjou/cFKii7n6y03WU5jlbZiWMXXYjIM?=
 =?us-ascii?Q?jbEf/BP3B5LeCW0N1qqO+lFq56F2T8CenURj3SMvnNsYqKPQpsbNOqL24/YQ?=
 =?us-ascii?Q?mOGjd9oGieHa18nzD3ym1GhqoYbRr5YtuO0JBlRF2OpayClBNWoDZMyIwAo7?=
 =?us-ascii?Q?uqHSGuZ2oYq0WWXjOwOBuZnz6UK36491tC7jM6OglHuucxhdn3YZ4g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 07:24:30.3059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ec9e2294-0d14-41ae-f44d-08dd24b52c24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7491
Message-ID-Hash: 5Z2E6W2HGMKVFFAVKH3V7O6HFZIQIS3N
X-Message-ID-Hash: 5Z2E6W2HGMKVFFAVKH3V7O6HFZIQIS3N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5Z2E6W2HGMKVFFAVKH3V7O6HFZIQIS3N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SoundWire host wake interrupt will be asserted based on below
pre-conditions for ACP7.0 & ACP7.1 platforms for SoundWire poweroff mode.
- ACP device should be in D0 state.
- SoundWire manager instance should be in D3 state.
- SoundWire manager device state should be set to D3.

Implement code changes to enable/disable SoundWire host wake mask and
SoundWire device state for ACP7.0 & ACP7.1 platforms for SoundWire
poweroff mode as mentioned below.
- Enable SoundWire host wake mask during runtime suspend sequence.
- Disable SoundWire host wake mask during resume sequence.
- Set the SoundWire device state to D3 during runtime suspend sequence and
set the device state to D0 state during resume sequence by programming
'AMD_SDW_DEVICE_STATE' register.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 45 +++++++++++++++++++++++++++++++++
 drivers/soundwire/amd_manager.h |  7 +++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 9eb8d345b527..6f9d9f765a20 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -143,6 +143,47 @@ static void amd_sdw_wake_enable(struct amd_sdw_manager *amd_manager, bool enable
 	writel(wake_ctrl, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_MASK_8TO11);
 }
 
+static int amd_sdw_host_wake_enable(struct amd_sdw_manager *amd_manager, bool enable)
+{
+	u32 intr_cntl1;
+	u32 sdw_host_wake_irq_mask;
+	u32 sdw_dev_state_mask;
+	u32 target_dev_state;
+	u32 sdw_dev_state;
+
+	if (!amd_manager->wake_en_mask)
+		return 0;
+
+	switch (amd_manager->instance) {
+	case ACP_SDW0:
+		sdw_host_wake_irq_mask = AMD_SDW0_HOST_WAKE_INTR_MASK;
+		sdw_dev_state_mask = AMD_SDW0_DEVICE_STATE_MASK;
+		break;
+	case ACP_SDW1:
+		sdw_host_wake_irq_mask = AMD_SDW1_HOST_WAKE_INTR_MASK;
+		sdw_dev_state_mask = AMD_SDW1_DEVICE_STATE_MASK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	intr_cntl1 = readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(ACP_SDW1));
+	if (enable) {
+		intr_cntl1 |= sdw_host_wake_irq_mask;
+		target_dev_state = AMD_SDW_DEVICE_STATE_D3;
+	} else {
+		intr_cntl1 &= ~sdw_host_wake_irq_mask;
+		target_dev_state = AMD_SDW_DEVICE_STATE_D0;
+	}
+	writel(intr_cntl1, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_CNTL(ACP_SDW1));
+	sdw_dev_state = readl(amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
+	amd_updatel(amd_manager->acp_mmio, AMD_SDW_DEVICE_STATE, sdw_dev_state_mask,
+		    target_dev_state);
+	sdw_dev_state = readl(amd_manager->acp_mmio + AMD_SDW_DEVICE_STATE);
+	dev_dbg(amd_manager->dev, "AMD_SDW_DEVICE_STATE:0x%x\n", sdw_dev_state);
+	return 0;
+}
+
 static void amd_sdw_ctl_word_prep(u32 *lower_word, u32 *upper_word, struct sdw_msg *msg,
 				  int cmd_offset)
 {
@@ -1191,6 +1232,8 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		return amd_sdw_clock_stop(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		amd_sdw_wake_enable(amd_manager, true);
+		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID)
+			amd_sdw_host_wake_enable(amd_manager, true);
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
@@ -1217,6 +1260,8 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		return amd_sdw_clock_stop_exit(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
+		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID)
+			amd_sdw_host_wake_enable(amd_manager, false);
 		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
 		if (val) {
 			val |= AMD_SDW_CLK_RESUME_REQ;
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 30244a31c21c..18faef593865 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -194,6 +194,13 @@
 #define AMD_SDW_CLK_RESUME_DONE				3
 #define AMD_SDW_WAKE_STAT_MASK				BIT(16)
 #define AMD_SDW_WAKE_INTR_MASK				BIT(16)
+#define AMD_SDW0_HOST_WAKE_INTR_MASK			BIT(22)
+#define AMD_SDW1_HOST_WAKE_INTR_MASK			BIT(23)
+#define AMD_SDW_DEVICE_STATE				0x1430
+#define AMD_SDW0_DEVICE_STATE_MASK			3
+#define AMD_SDW1_DEVICE_STATE_MASK			0xc
+#define AMD_SDW_DEVICE_STATE_D0				0
+#define AMD_SDW_DEVICE_STATE_D3				3
 
 static u32 amd_sdw_freq_tbl[AMD_SDW_MAX_FREQ_NUM] = {
 	AMD_SDW_DEFAULT_CLK_FREQ,
-- 
2.34.1

