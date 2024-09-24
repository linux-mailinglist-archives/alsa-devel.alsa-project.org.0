Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6DD98404B
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 10:20:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F273CDF8;
	Tue, 24 Sep 2024 10:20:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F273CDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727166029;
	bh=qL0BXQOHIHCvBYPLh/gVB1hbC/9Bfvfo6V+DOAEzz0I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lwCH5wztaKQjKehOE0TzRntju3a/7BBR1hqyAnHN09LbEVmeVXHuzOxQPX2+Tac/T
	 QFI7jzM1atcIku3JSYDUDRc0q0Ev+gyACB9igyx0bsaz8waJXjeI+/Fml5P1x+e0dI
	 2QbqWCd8CGMRDHjkjg1QhjZkzjrm8itKr63MeHrI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1180F80601; Tue, 24 Sep 2024 10:19:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B94F1F805F9;
	Tue, 24 Sep 2024 10:19:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9019F805B5; Tue, 24 Sep 2024 10:19:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70545F802DB
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 10:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70545F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=y0kdZsfd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvGejSGc9E8Xhhox48Bu3VQ76jryqFxaC3z0zhxX93Y7MTd/Z1zsStZEV98GLSAS36EDKjUqni80bx7BdXI3QJLOnabIQihXOF994buUhVV/XEnLeSQdoLsgKGsWsWVJsV5da5JkXHsLqljpkDKrLroGQFO1GY8b2Zd6PeiAvE/15YVUOOlchExjizbcr7SwtSJ0tiJq4ltVoTty7hXhy/Vv9Qtji9tF+TRITH6D7+2wI/nj5EiUadju8s3Y+MYTBKWym/tph/l9elrH9PTRoLvRTstPjX/hifXXgPcJDQ9jOkHgV1nWjNw01ac0i3aIXf2mXy+z9D8ejlfCkvDbLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuRqpROnAfGh1YRWcQlhomQXZ2b5iEdA8vMR+xTjuSs=;
 b=wJ5UOckyx1xg/b11YdvxYglEUgGlSfG2h69F5QgaeCmvWXiAwefViyky60lbVWsKC1Y5T+c62VAIgHk2v7HZFOVXwmxA70Nh8OQsXT1dSo+x2Tr2ox50qwJ6SySkHQd+sTVnCUSi8CMlkJ4/GQ5eIk+jeTFXuCldPBRMxKsvmtbEpX/iDVMnwcJxh/yxsHag1NMepmLtmppBxuxBaGboZ7cWSD8y1+0e/+lICC3ogdUel/SNd5/kSd6SYcqhRC3aEOxKeUFOVqqYvL1CenVS2mVmFxR0PGhWp0gJHIhzwuMtbwbeFiTFjbcJZISTbNUOvCcYh+ugBV/vZLLCPGqkNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KuRqpROnAfGh1YRWcQlhomQXZ2b5iEdA8vMR+xTjuSs=;
 b=y0kdZsfdfwHN1UEPQv0dsKGT2+DyPbcxYr31Pa322J3z2qJIzaYCwoyBJXsLsFWUA/xzLRgBGr5JwxjaQ7DLaf05QdjIN4zVUCNHHmD3GChtOI2Kh30+AvL41W3fSRJUfAR61KJm48K1g2CxaBeQRtx2fv2QZXMxkaYcP6n8vKA=
Received: from QR2P297CA0015.MEXP297.PROD.OUTLOOK.COM (2603:10b6:3d0:6a::17)
 by CYXPR12MB9442.namprd12.prod.outlook.com (2603:10b6:930:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Tue, 24 Sep
 2024 08:19:16 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:3d0:6a:cafe::a0) by QR2P297CA0015.outlook.office365.com
 (2603:10b6:3d0:6a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27 via Frontend
 Transport; Tue, 24 Sep 2024 08:19:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 24 Sep 2024 08:19:15 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 03:19:08 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 2/4] soundwire: amd: refactor existing code for acp 6.3
 platform
Date: Tue, 24 Sep 2024 13:48:44 +0530
Message-ID: <20240924081846.1834612-3-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|CYXPR12MB9442:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f3e0fd-5dc8-4c97-f5c1-08dcdc71941a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8p8XfKDpw4n+HaQki8KH9eNaZ/6vGHORyqdfTXWFQjscf9insB7USFsepxvS?=
 =?us-ascii?Q?EZJZ5gtEmMIRVmkkh3m/GXthh88rNaeorUlF2AhEyIRocccdOFqKCpVTTiTF?=
 =?us-ascii?Q?1Sfjbz3SubLb3YXzJJiYvlM4BmkeGNiqnP2vytzCUqe1PIbNgrTp1ik12ulH?=
 =?us-ascii?Q?NwvdB7JlEb0M3YGz9HWWoljr/mdRo7rWE0cU9xpbUqC6f+z9FOlwnlmbPIml?=
 =?us-ascii?Q?kUeZzDxZUyyuOIhhkBA3A/n788G1vdIUgw+xvNF5ScrNiE0UsHXBs/4l4pKg?=
 =?us-ascii?Q?m+yWz6ftj0nkDd5Y5pfcm6WMM+KewOh7fQ/Cr64Z7qFiymFIdl7Ud/CqYoya?=
 =?us-ascii?Q?6Kh60JJEzL9nbhRuWk3k0qKLZGYBUpSLz9AJqWHoVb6LgmLETKyGYizfXg4x?=
 =?us-ascii?Q?l9duAdhO2lD8xjOxNVECBBLbbtc3wXjtW5qS1s0nCrDaGL6Qif4I5IbMagN6?=
 =?us-ascii?Q?1lLBgXHnDvIRBZrwp52LgyGgZ7zswJD9jXwuYwIBBUYsPDUo7Pj0QJ83AVk3?=
 =?us-ascii?Q?lanS5AI/DKwjoGsr1Ldz2bJUSqK4xmyXDU1k1mYDN/khiTNDx5HEThdl0gOL?=
 =?us-ascii?Q?WokkSFapHDUu9IrlGVU4VrMFJNmxHWPrp6bZh/aI7gAReWyMOQH0Tvsscao+?=
 =?us-ascii?Q?KTjOvN4bvdJcMvYELPb+lYLMZwOkrdVNUOf91zibGF9drSLbSkiIZgEHduWM?=
 =?us-ascii?Q?UO2wjzSpEA1jony3QOkyOdMBfrz29NOUCD0ayOFjPYO4ezRuVICCzqADu56t?=
 =?us-ascii?Q?UhKXIZe4+dpu4kuD2Vkgd0h+fVq61SvEsw5pEWzNbBSJcaWXRD19G32vKLex?=
 =?us-ascii?Q?j/NVuIADT+X0ql1NDTlmehF6LzK67dZNKYX7mnRwJAi48PmU2D/LN8Y6XuPa?=
 =?us-ascii?Q?NwHv9XeCuwMJZgWu9Xgr0h4n4G50ViBGpZ6+uDyQo43pKxBti2P6NtR7jyLD?=
 =?us-ascii?Q?TN4tKz3NHGV0oYtGqOclt1kC1t03mQttBJp8X3XESZ6xUVDj2+4PdIVBKQES?=
 =?us-ascii?Q?r1faBH+mBXoSIZ9eQyxxNvQLGfHw35IyJ86SXo25f+ss5mg8GUUmR3RIk7aQ?=
 =?us-ascii?Q?fgZtNaOYYo/uIZksCHbJsC76w2Qd7VDn3Xto95lJx6ciGvkQj2FnbCSFMph8?=
 =?us-ascii?Q?ONQG+AOnVfXi0Jmn9QH+70dzjBD+DIbIcBnedmufs8fYeFIwFhuLWOMGjJlO?=
 =?us-ascii?Q?qsUcVCdNDq55TtJ5+jca75ZZv1aM57Ry9rXM26VE4uWeB9TlXMplcaGZZ5dv?=
 =?us-ascii?Q?leloB5jfZ+iaXtAw4Uu3nJc2o0ZaD9SAz13GmxxqoiPJWgutu44I9l4H57xd?=
 =?us-ascii?Q?2QGyyg2Pic7Di0dpYHiEWXqFozpRfrSf+bxZqB5VUsHVLI0MoOOgVxT6tQud?=
 =?us-ascii?Q?l5kUdr//JIyDYYaoS32wAk97vl5/kxuGVyObPdZ73NHUYoKXSWwpA+QNFFGp?=
 =?us-ascii?Q?t+3CHUN69YQJmfJE8OEybznQdnPNj0WQ?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:19:15.2884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 34f3e0fd-5dc8-4c97-f5c1-08dcdc71941a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9442
Message-ID-Hash: YQK6OXGJNIZISOM6N5PXCTOXQVAJP2PY
X-Message-ID-Hash: YQK6OXGJNIZISOM6N5PXCTOXQVAJP2PY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YQK6OXGJNIZISOM6N5PXCTOXQVAJP2PY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor existing code by adding acp pci revision id coditional checks
for ACP 6.3 platform. Rename the macros and structure names with ACP63
tag.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 98 ++++++++++++++++++++-----------
 drivers/soundwire/amd_manager.h   | 16 ++---
 include/linux/soundwire/sdw_amd.h |  1 +
 3 files changed, 72 insertions(+), 43 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 4a1966fb01f6..5a4bfaef65fb 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -433,12 +433,18 @@ static int amd_sdw_port_params(struct sdw_bus *bus, struct sdw_port_params *p_pa
 	u32 frame_fmt_reg, dpn_frame_fmt;
 
 	dev_dbg(amd_manager->dev, "p_params->num:0x%x\n", p_params->num);
-	switch (amd_manager->instance) {
-	case ACP_SDW0:
-		frame_fmt_reg = sdw0_manager_dp_reg[p_params->num].frame_fmt_reg;
-		break;
-	case ACP_SDW1:
-		frame_fmt_reg = sdw1_manager_dp_reg[p_params->num].frame_fmt_reg;
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		switch (amd_manager->instance) {
+		case ACP_SDW0:
+			frame_fmt_reg = acp63_sdw0_dp_reg[p_params->num].frame_fmt_reg;
+			break;
+		case ACP_SDW1:
+			frame_fmt_reg = acp63_sdw1_dp_reg[p_params->num].frame_fmt_reg;
+			break;
+		default:
+			return -EINVAL;
+		}
 		break;
 	default:
 		return -EINVAL;
@@ -465,20 +471,28 @@ static int amd_sdw_transport_params(struct sdw_bus *bus,
 	u32 frame_fmt_reg, sample_int_reg, hctrl_dp0_reg;
 	u32 offset_reg, lane_ctrl_ch_en_reg;
 
-	switch (amd_manager->instance) {
-	case ACP_SDW0:
-		frame_fmt_reg = sdw0_manager_dp_reg[params->port_num].frame_fmt_reg;
-		sample_int_reg = sdw0_manager_dp_reg[params->port_num].sample_int_reg;
-		hctrl_dp0_reg = sdw0_manager_dp_reg[params->port_num].hctrl_dp0_reg;
-		offset_reg = sdw0_manager_dp_reg[params->port_num].offset_reg;
-		lane_ctrl_ch_en_reg = sdw0_manager_dp_reg[params->port_num].lane_ctrl_ch_en_reg;
-		break;
-	case ACP_SDW1:
-		frame_fmt_reg = sdw1_manager_dp_reg[params->port_num].frame_fmt_reg;
-		sample_int_reg = sdw1_manager_dp_reg[params->port_num].sample_int_reg;
-		hctrl_dp0_reg = sdw1_manager_dp_reg[params->port_num].hctrl_dp0_reg;
-		offset_reg = sdw1_manager_dp_reg[params->port_num].offset_reg;
-		lane_ctrl_ch_en_reg = sdw1_manager_dp_reg[params->port_num].lane_ctrl_ch_en_reg;
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		switch (amd_manager->instance) {
+		case ACP_SDW0:
+			frame_fmt_reg = acp63_sdw0_dp_reg[params->port_num].frame_fmt_reg;
+			sample_int_reg = acp63_sdw0_dp_reg[params->port_num].sample_int_reg;
+			hctrl_dp0_reg = acp63_sdw0_dp_reg[params->port_num].hctrl_dp0_reg;
+			offset_reg = acp63_sdw0_dp_reg[params->port_num].offset_reg;
+			lane_ctrl_ch_en_reg =
+					acp63_sdw0_dp_reg[params->port_num].lane_ctrl_ch_en_reg;
+			break;
+		case ACP_SDW1:
+			frame_fmt_reg = acp63_sdw1_dp_reg[params->port_num].frame_fmt_reg;
+			sample_int_reg = acp63_sdw1_dp_reg[params->port_num].sample_int_reg;
+			hctrl_dp0_reg = acp63_sdw1_dp_reg[params->port_num].hctrl_dp0_reg;
+			offset_reg = acp63_sdw1_dp_reg[params->port_num].offset_reg;
+			lane_ctrl_ch_en_reg =
+					acp63_sdw1_dp_reg[params->port_num].lane_ctrl_ch_en_reg;
+			break;
+		default:
+			return -EINVAL;
+		}
 		break;
 	default:
 		return -EINVAL;
@@ -520,12 +534,20 @@ static int amd_sdw_port_enable(struct sdw_bus *bus,
 	u32 dpn_ch_enable;
 	u32 lane_ctrl_ch_en_reg;
 
-	switch (amd_manager->instance) {
-	case ACP_SDW0:
-		lane_ctrl_ch_en_reg = sdw0_manager_dp_reg[enable_ch->port_num].lane_ctrl_ch_en_reg;
-		break;
-	case ACP_SDW1:
-		lane_ctrl_ch_en_reg = sdw1_manager_dp_reg[enable_ch->port_num].lane_ctrl_ch_en_reg;
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		switch (amd_manager->instance) {
+		case ACP_SDW0:
+			lane_ctrl_ch_en_reg =
+					acp63_sdw0_dp_reg[enable_ch->port_num].lane_ctrl_ch_en_reg;
+			break;
+		case ACP_SDW1:
+			lane_ctrl_ch_en_reg =
+					acp63_sdw1_dp_reg[enable_ch->port_num].lane_ctrl_ch_en_reg;
+			break;
+		default:
+			return -EINVAL;
+		}
 		break;
 	default:
 		return -EINVAL;
@@ -927,15 +949,21 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 	 * information.
 	 */
 	amd_manager->bus.controller_id = 0;
-
-	switch (amd_manager->instance) {
-	case ACP_SDW0:
-		amd_manager->num_dout_ports = AMD_SDW0_MAX_TX_PORTS;
-		amd_manager->num_din_ports = AMD_SDW0_MAX_RX_PORTS;
-		break;
-	case ACP_SDW1:
-		amd_manager->num_dout_ports = AMD_SDW1_MAX_TX_PORTS;
-		amd_manager->num_din_ports = AMD_SDW1_MAX_RX_PORTS;
+	dev_dbg(dev, "acp_rev:0x%x\n", amd_manager->acp_rev);
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		switch (amd_manager->instance) {
+		case ACP_SDW0:
+			amd_manager->num_dout_ports = AMD_ACP63_SDW0_MAX_TX_PORTS;
+			amd_manager->num_din_ports = AMD_ACP63_SDW0_MAX_RX_PORTS;
+			break;
+		case ACP_SDW1:
+			amd_manager->num_dout_ports = AMD_ACP63_SDW1_MAX_TX_PORTS;
+			amd_manager->num_din_ports = AMD_ACP63_SDW1_MAX_RX_PORTS;
+			break;
+		default:
+			return -EINVAL;
+		}
 		break;
 	default:
 		return -EINVAL;
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 707065468e05..cc2170e4521e 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -155,12 +155,12 @@
 #define AMD_SDW_IRQ_MASK_8TO11		0x000c7777
 #define AMD_SDW_IRQ_ERROR_MASK		0xff
 #define AMD_SDW_MAX_FREQ_NUM		1
-#define AMD_SDW0_MAX_TX_PORTS		3
-#define AMD_SDW0_MAX_RX_PORTS		3
-#define AMD_SDW1_MAX_TX_PORTS		1
-#define AMD_SDW1_MAX_RX_PORTS		1
-#define AMD_SDW0_MAX_DAI		6
-#define AMD_SDW1_MAX_DAI		2
+#define AMD_ACP63_SDW0_MAX_TX_PORTS		3
+#define AMD_ACP63_SDW0_MAX_RX_PORTS		3
+#define AMD_ACP63_SDW1_MAX_TX_PORTS		1
+#define AMD_ACP63_SDW1_MAX_RX_PORTS		1
+#define AMD_ACP63_SDW0_MAX_DAI		6
+#define AMD_ACP63_SDW1_MAX_DAI		2
 #define AMD_SDW_SLAVE_0_ATTACHED	5
 #define AMD_SDW_SSP_COUNTER_VAL		3
 
@@ -222,7 +222,7 @@ struct sdw_manager_dp_reg {
  * in SoundWire DMA driver.
  */
 
-static struct sdw_manager_dp_reg sdw0_manager_dp_reg[AMD_SDW0_MAX_DAI] =  {
+static struct sdw_manager_dp_reg acp63_sdw0_dp_reg[AMD_ACP63_SDW0_MAX_DAI] =  {
 	{ACP_SW_AUDIO0_TX_FRAME_FORMAT, ACP_SW_AUDIO0_TX_SAMPLEINTERVAL, ACP_SW_AUDIO0_TX_HCTRL_DP0,
 	 ACP_SW_AUDIO0_TX_OFFSET_DP0, ACP_SW_AUDIO0_TX_CHANNEL_ENABLE_DP0},
 	{ACP_SW_AUDIO1_TX_FRAME_FORMAT, ACP_SW_AUDIO1_TX_SAMPLEINTERVAL, ACP_SW_AUDIO1_TX_HCTRL,
@@ -237,7 +237,7 @@ static struct sdw_manager_dp_reg sdw0_manager_dp_reg[AMD_SDW0_MAX_DAI] =  {
 	 ACP_SW_AUDIO2_RX_OFFSET, ACP_SW_AUDIO2_RX_CHANNEL_ENABLE_DP0},
 };
 
-static struct sdw_manager_dp_reg sdw1_manager_dp_reg[AMD_SDW1_MAX_DAI] =  {
+static struct sdw_manager_dp_reg acp63_sdw1_dp_reg[AMD_ACP63_SDW1_MAX_DAI] =  {
 	{ACP_SW_AUDIO1_TX_FRAME_FORMAT, ACP_SW_AUDIO1_TX_SAMPLEINTERVAL, ACP_SW_AUDIO1_TX_HCTRL,
 	 ACP_SW_AUDIO1_TX_OFFSET, ACP_SW_AUDIO1_TX_CHANNEL_ENABLE_DP0},
 	{ACP_SW_AUDIO1_RX_FRAME_FORMAT, ACP_SW_AUDIO1_RX_SAMPLEINTERVAL, ACP_SW_AUDIO1_RX_HCTRL,
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index e0abc59d4748..c9586f22c5a9 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -27,6 +27,7 @@
 #define ACP_SDW0	0
 #define ACP_SDW1	1
 #define AMD_SDW_MAX_MANAGER_COUNT	2
+#define ACP63_PCI_REV_ID		0x63
 
 struct acp_sdw_pdata {
 	u16 instance;
-- 
2.34.1

