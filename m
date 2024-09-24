Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82704984046
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 10:19:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D152BB65;
	Tue, 24 Sep 2024 10:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D152BB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727165994;
	bh=mzE7iqMcEkbq8lRzw0FHdpNXy2E3A5M/5RVzSJimwpY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tlfW3iqTzA3H71+jTk+72ZbHZlc5oX8gIaSQjpAZzPftA5qNo+rH7kViuv5O391/e
	 p0wg78rf0M9b0k3gqm4LXUAKCB04FH9ke6VK0RDXzb8ta9iYJdAtwcZNTth2udaQtQ
	 kRGAzqTyWUcVuBVUR7pF2qBqIaupmtQIXZR5Jxrw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5AC4F805AB; Tue, 24 Sep 2024 10:19:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A7FF805B3;
	Tue, 24 Sep 2024 10:19:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31A6DF802DB; Tue, 24 Sep 2024 10:19:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF5ADF80007
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 10:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF5ADF80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mLyLYxKn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFTV6ODW+/r9aSPJxSQdrisw6US99NRKkUsaWAsgSBCFmIseFaBzpTk5yxpX58QT0B894OcQOTjQ3tNo1y8lWskmNBnS9gXS+wxw6PeYs/a1+yE0JTUmeV5m55x7iVDS81Fhp3vmWboXB7XN2auVjDgR8KlsZcWtSSt0YZktYQhJhT/rN8VL6+j6mkR+kFC56CCloDt5T0dRw5oaVOsKKYESHvvIJPgbdkfMEJnMiLnSbj7H9nQrTnFUAZsAeVoqB5gOXYX2Ot8xMHxbC8dgnnrsbZvlCeG9CKfUxhzYGx7WclJfB9ru0rdqT0sbsfck9T2rKJsmLlX60NgN+TMClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pj4Csd8DRf7P+vzRn7lcghSHDyaQdgeDzcWTQ+6oYG8=;
 b=Jngopvuq0yGfcScflVAbwE/V1cCqfHBzJGiSyq3lXVE7nyTTZw251pPIcFVuxodtnnvQjj/YKO/TJr3rxp8xUe3adin3ITnJs5nBsRuO+e30Evo1goNVXDkFdMfZxyZuNgHnJiUOjN6YTNSHRegWhIvHVy4pvhKlwwqoZK+ilu6C/0B44x6RS+eFbFAJc6xh3s5Y6quX1ZNUHvS7o9pm8nEFwrNLoGEQh6p5e9OFHwA33VTrb7NFUpgCteNpai+MfXBAyQAPmWwZmCX2aViX/fKmF3BBw9PAHGZfZpcNdch49L7rPYPC5iml0VNpVlxpLECjJhZe8m7GQU82jFvf0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pj4Csd8DRf7P+vzRn7lcghSHDyaQdgeDzcWTQ+6oYG8=;
 b=mLyLYxKnpADlKZujtRSyDcjmPJn2DsnNU3F6SGczKPjpCzN40/4hCuMBnT+5A6PAn7O1kRq+0EKps3FabICmJEQ1DPKKf/LPKPkou0FJTCv+ud/TC/v3QS9Bm6qeoJhz6NxNoBJwGnDEvFF+PTC4RUf0yZg3E4XBsN9rq2Aaak8=
Received: from SN6PR05CA0024.namprd05.prod.outlook.com (2603:10b6:805:de::37)
 by SA1PR12MB6895.namprd12.prod.outlook.com (2603:10b6:806:24e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 08:19:10 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:805:de:cafe::70) by SN6PR05CA0024.outlook.office365.com
 (2603:10b6:805:de::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.15 via Frontend
 Transport; Tue, 24 Sep 2024 08:19:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Tue, 24 Sep 2024 08:19:09 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 03:19:03 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/4] soundwire: amd: pass acp pci revision id as resource data
Date: Tue, 24 Sep 2024 13:48:43 +0530
Message-ID: <20240924081846.1834612-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924081846.1834612-1-Vijendar.Mukunda@amd.com>
References: <20240924081846.1834612-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|SA1PR12MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d427155-61d3-430f-a223-08dcdc7190cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZGyAkDNAXZO5KS3sFnwIVLPl7NTUkwgqKQuZvaUzCJFiRB6WSvCXQbCJjeYo?=
 =?us-ascii?Q?ftPy7g/fhOKwewM2pNMVhtMVRFvnFziV/p5jvH1Vhq82f9kA8gF2WWmQXS99?=
 =?us-ascii?Q?ki+omlyofus9jTMFln7ilTP+gykddWMTFbcituf0kevdyXnmYQ+jMISlRRJp?=
 =?us-ascii?Q?8Iln7FDv1Bhl80F/iyFNNt51dfXy4iX4XThEVdMPOEEkPMsGBsvGSALNolLK?=
 =?us-ascii?Q?0bPFYt6+Nlj82tBVoDHVw/iKtlSGiFimGuB7aRKEREqcxgeEt37HYh4P+ISJ?=
 =?us-ascii?Q?HcGfijVBhrXLF8eo0UEWY5y17TpVTgrjbJLZo0lvkPythBfLATi5K8s3Fsrt?=
 =?us-ascii?Q?OdesjM8PH6cPKnZB2nmoEMd1SIG7JYdNS55XUm2zaosQK5XqATe5RT1VzUjk?=
 =?us-ascii?Q?1n5gvWaRHNEXR8Lo2JmfT56qNhOcuGbX2gziZN5228RmCkW6BPaquBqSHHW2?=
 =?us-ascii?Q?LX2NgzfjNE0Huz6G1C8uh+js3P6eRlv++FZH8uCrIuCuBktYq+zQ2GAAcqeZ?=
 =?us-ascii?Q?sIuPhDmK2ePYFxIWQZQtkW8CYoadPtBOcEJhYc/65/mFWxj40xuayiefRtsT?=
 =?us-ascii?Q?Bu4W6zzDNAQVX+QIEIyxWOO+irHKejsM8RfDGXZkk+mfQxUqlwTohV4bIU8k?=
 =?us-ascii?Q?g1zinpmyrPsxVRX+As46IfCpa3Np2/dDgiD2oR2gUHRd6W8+qOYrrgilKapZ?=
 =?us-ascii?Q?/h1w55RdRCjWXXkb4RbT12kkOGNHzR6y8B0vEWEpnE2ePalA3oKMqQi9iJ1H?=
 =?us-ascii?Q?E6PzSTuzQw1nyqVTRkmoeJtoWKQygJQNBMdmA08qgY/1b9oKYVrDoYUJVIGQ?=
 =?us-ascii?Q?pD5+yuCN1SC7tfiPTG3kUPOwah2bly1MrWz76oTasRGYkZjqVU/ninK25Han?=
 =?us-ascii?Q?/WLF0NfvSm66/0ytznAYegsRSaYFxfHgm0WZcP4E81S2elnkyLAxqLBzRO3S?=
 =?us-ascii?Q?J6ulw9WT8XNocNnUrsFmjI2qQuLGu5uMSZZxGTje8tNTUuwu0X2RDiLc4EDc?=
 =?us-ascii?Q?0yy11bKvBp9a7f3sEtnQWBe7pWYkYnlA6MCMNhqsVaNST195ymOfPgB+HrT8?=
 =?us-ascii?Q?qmKhN08PWFxdRhPjywERvMgVJYMmMECE0QNnu62LBVPEAi18oGnusxDLvTVd?=
 =?us-ascii?Q?XAUoSXdvyvadzYjEasq6gt/5NCNV7hfDWseqy7VaBTP3QimaPpsfburJalkE?=
 =?us-ascii?Q?MP9u44DWcFk0Ir+LofzocBU099i3BO86u8eJxckH2fR/rrC9RlW+mknqTRo/?=
 =?us-ascii?Q?rwXfvEJ4EDzo5U2nucfiI4OshIwoV09zuuZbWSmQgXGf0/uxyuqKP9saerSZ?=
 =?us-ascii?Q?807qTb8+qz2bD8WdNIMnXoPH8wFoz0rOFE0pWp5CFZdmPjvVuj/XJ4FI5nLn?=
 =?us-ascii?Q?gS7cNt6v5YdNToCeYAwv90rduw3IJra9xgwYiU/3l35KUuWaq2S6xqvrxj6+?=
 =?us-ascii?Q?yPQbD20TA8UpKTefrMtc0CmckJHvf1DK?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:19:09.7772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7d427155-61d3-430f-a223-08dcdc7190cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6895
Message-ID-Hash: AXHZS46JBHVLFUSNXZNU5BXA2NDUGWHR
X-Message-ID-Hash: AXHZS46JBHVLFUSNXZNU5BXA2NDUGWHR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXHZS46JBHVLFUSNXZNU5BXA2NDUGWHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Pass ACP pci revision id as resource data and store it in amd SoundWire
manager private data structure. This field will be used to differentiate
ACP variants.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_init.c      | 1 +
 drivers/soundwire/amd_manager.c   | 1 +
 include/linux/soundwire/sdw_amd.h | 5 +++++
 3 files changed, 7 insertions(+)

diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index db040f435059..4f6e356e6bd2 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -121,6 +121,7 @@ static struct sdw_amd_ctx *sdw_amd_probe_controller(struct sdw_amd_res *res)
 
 		sdw_pdata[index].instance = index;
 		sdw_pdata[index].acp_sdw_lock = res->acp_lock;
+		sdw_pdata[index].acp_rev = res->acp_rev;
 		pdevinfo[index].name = "amd_sdw_manager";
 		pdevinfo[index].id = index;
 		pdevinfo[index].parent = res->parent;
diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 0d01849c3586..4a1966fb01f6 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -910,6 +910,7 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 	amd_manager->mmio = amd_manager->acp_mmio +
 			    (amd_manager->instance * SDW_MANAGER_REG_OFFSET);
 	amd_manager->acp_sdw_lock = pdata->acp_sdw_lock;
+	amd_manager->acp_rev = pdata->acp_rev;
 	amd_manager->cols_index = sdw_find_col_index(AMD_SDW_DEFAULT_COLUMNS);
 	amd_manager->rows_index = sdw_find_row_index(AMD_SDW_DEFAULT_ROWS);
 	amd_manager->dev = dev;
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 28a4eb77717f..e0abc59d4748 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -30,6 +30,7 @@
 
 struct acp_sdw_pdata {
 	u16 instance;
+	u32 acp_rev;
 	/* mutex to protect acp common register access */
 	struct mutex *acp_sdw_lock;
 };
@@ -66,6 +67,7 @@ struct sdw_amd_dai_runtime {
  * @instance: SoundWire manager instance
  * @quirks: SoundWire manager quirks
  * @wake_en_mask: wake enable mask per SoundWire manager
+ * @acp_rev: acp pci device revision id
  * @clk_stopped: flag set to true when clock is stopped
  * @power_mode_mask: flag interprets amd SoundWire manager power mode
  * @dai_runtime_array: dai runtime array
@@ -94,6 +96,7 @@ struct amd_sdw_manager {
 	u32 quirks;
 	u32 wake_en_mask;
 	u32 power_mode_mask;
+	u32 acp_rev;
 	bool clk_stopped;
 
 	struct sdw_amd_dai_runtime **dai_runtime_array;
@@ -134,6 +137,7 @@ struct sdw_amd_ctx {
  * struct sdw_amd_res - Soundwire AMD global resource structure,
  * typically populated by the DSP driver/Legacy driver
  *
+ * @acp_rev: acp pci device revision id
  * @addr: acp pci device resource start address
  * @reg_range: ACP register range
  * @link_mask: bit-wise mask listing links selected by the DSP driver/
@@ -146,6 +150,7 @@ struct sdw_amd_ctx {
  * @acp_lock: mutex protecting acp common registers access
  */
 struct sdw_amd_res {
+	u32 acp_rev;
 	u32 addr;
 	u32 reg_range;
 	u32 link_mask;
-- 
2.34.1

