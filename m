Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB6CA16A96
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:15:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF856602A9;
	Mon, 20 Jan 2025 11:15:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF856602A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737368125;
	bh=1vVmNfq8H+MF8cFUabtR1dg1mENZPacQbwpf4RcYRqs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mSMVVuW+Kyq0B81MeZ2E0T7ytPNDoKgN1SIu7zpmDkwgWQ4JT6NGxrDj+Y2lfu5kq
	 n5/MvFwGwznkK7MyRGnXtw0vBhMmsH/Ohy7oSVtVmeBP3cRRgzUODtuOSPSEqY3mWC
	 HD11N53Hbz5IXXtQhd8Xz4fsxioIWi99GzPtHfc8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2EE0F805FC; Mon, 20 Jan 2025 11:14:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05F10F805F8;
	Mon, 20 Jan 2025 11:14:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0099F80482; Mon, 20 Jan 2025 11:14:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97DA3F800E4
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:13:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97DA3F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=0uXLXmM5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHrLjy0tHSmpjfB8ETz8HygbFVhhyQXrnZtDJB6QeIY21fTMKG4B7ahuQZQVhMtTkme4KEHFBEyt5rpJsh23VZbQFejLLt04QP2ukzQ8NCNZFuxkM4yOutDuaS5UEmkezWXJYw5r7ZbyhbsY4nLhrtN5ixPidnEZfQvk8184E90UkIBh2jyOlNOwPOxKzK+cPEIltSFPqJ3mtlAjpWeEGj3ITqJNIbLMEG3W/5ERJdDEkj5p0I46G/dTSlCzTXnSKbNw4ITSkfJ8AWM2p0DWyYjGqcXx8OQft7TtxB813SSdrwQuebzp+bpleZblQpFYq2Q2Is3QFiQE8kNfA0KM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41PUfFjatuc7da+InPcOcLM/ud0y8M9s1/dqpC1dL3A=;
 b=kkmXtHnbdNa0pMnBjwkNLh5a7QXxBfdJ+VClhTcTJ4zL4lTEhjMBRj1t4UuxI9Dx0mLEvQTC9wBv0RPT2JrJrdEz30c2AJufl5wqPsMHg0nDD7L3egDY/YJDI1UWW/3YE2WqRf4LnxeI6I7d2nLejile7uezX9Bh+uORCTcEPnz/Jo1RibZ6ur1C2KC3k46jE/hIgVK0P1en5+K0G/5+fUNGrZzo1Y4sU4bCQSAxj5CHAAg1iMKKS3kgRhj+r+oLSy5qHtkjLT5HOyTJSGHSXmsxTwtq5zxfcl2zN4g7sYNCx9aJyCvAKX1M+vfxMWF7g98bn9kf+oUkUx4NhB0iew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41PUfFjatuc7da+InPcOcLM/ud0y8M9s1/dqpC1dL3A=;
 b=0uXLXmM5Q1WX6XffhbhMXioSUxH8EyGumvKHPVc6rVaa3eiLvFSljqz/rZ1qImjbTup4WIjEQdeaurIphGZO4oAdDr9TpTG64pBdVpFuSA8FuP+m0PdBjaGXCiXX+Vhux6ONigs76NddPlGi1TJx+CFcAqeNMtfrxX20YPtOxp0=
Received: from BN9P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::13)
 by DS0PR12MB6631.namprd12.prod.outlook.com (2603:10b6:8:d1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 10:13:54 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:13e:cafe::13) by BN9P220CA0008.outlook.office365.com
 (2603:10b6:408:13e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Mon,
 20 Jan 2025 10:13:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.0 via Frontend Transport; Mon, 20 Jan 2025 10:13:54 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:13:50 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <alsa-devel@alsa-project.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <sanyog.r.kale@intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Mario.Limonciello@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 3/7] soundwire: amd: add conditional for check for device
 resume
Date: Mon, 20 Jan 2025 15:43:25 +0530
Message-ID: <20250120101329.3713017-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120101329.3713017-1-Vijendar.Mukunda@amd.com>
References: <20250120101329.3713017-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|DS0PR12MB6631:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e31bd00-7aab-4ca1-284c-08dd393b2509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Amf6RDISE3lq7IA2b4gJcn95I1dXG8Z3p7nfgWWcyfeLfQlHCKdjonz5nnEK?=
 =?us-ascii?Q?/4NBKf5K1nz0Y484zybyUVoLCgkCc8nekGmkLNO9kOUN6OVP0aABoc7tU9R3?=
 =?us-ascii?Q?+mWeppXhlaTDwkt7MUcPaCfmT1hFc+Okxvzv6XVj6ofShixEZLlgQoeBodEM?=
 =?us-ascii?Q?4O+xDlGbXlvJYQbKLDm6uzpeOJvV8NSbgZIOIIqyYeRQVZaVMTuQWrPVya+y?=
 =?us-ascii?Q?kAN7n2vH47ZYGVeX2JOPtUsOhJQrfoj/3bJ0bWigqcps6VfpkNrcny58GPgx?=
 =?us-ascii?Q?8TOx+S+O+wCgy2MwTaa7+ZTzOe9GLaxMx8qP0IZ9vCAZI9Rs4yGCB7/Vvm4b?=
 =?us-ascii?Q?BkfVr17dajyGcTH10JDTsW2ho9zk4AaY1ab5L2u+r9R2/MTrcO0p483nqOiU?=
 =?us-ascii?Q?PxsVVyLFIRD2SaqvPgFd6QvB2SSgQfVRapbJSOxo/UssyYU3aK6RWpxIEuXD?=
 =?us-ascii?Q?jSbNK6QBCgcWvCn0ZNKbVzVNmXRzVbAvgtGPjVYhsr4lVqf3k8XECQvxP6dB?=
 =?us-ascii?Q?JVZ6xZxrqdKUasVGB21/pWQE84lglPkC90OlCoGZR6yi8pM76k4GAvZ25oYV?=
 =?us-ascii?Q?TkMsIRX6T9N28KEIs59Jw03jr831QxkyxkE8sXLuIZ3zILfCgiwRNU2QkezP?=
 =?us-ascii?Q?9nHSL+a+97InbFJoy2arx/x83vwIJHev7KOSZgR8/H9pDaeBK4tKISsHBwj3?=
 =?us-ascii?Q?/4XzHc38yi2Buszk6zJMgV1jqOdqe3loEJ8xJiRbnzuZdffupauFM7nQulXr?=
 =?us-ascii?Q?/Gbao75Xepbw0YbWxjXxOo3suLXj8glNYAB9jZw+TItlVkyp89PHT048WjtO?=
 =?us-ascii?Q?Gc/Y5fcIXp27B+jM9BubpsOkWy53AMvK9FQ4sSpI39csGNLrskU8rQqVG3Y7?=
 =?us-ascii?Q?jnLt8OBWHWGhvToIwJC/8bkliiAfSJRN39lMz5Shei4bJDzws0094EPp+mcd?=
 =?us-ascii?Q?CeZAjTSHkbU0XlyN2XfUdJOlJtaMoin2kRxx2qWgUuBPghMVavIvpFP6femz?=
 =?us-ascii?Q?ODLocMvv4hZG9hCinObe5tE2MoOpBbHgG9HbA6kyAIthnL6BSJePB+n6TgPs?=
 =?us-ascii?Q?4G0BuGrCGZ5dcxnO9KwGTs/4xoyGUvUDf+5h0/6Gc93geAnt6/T8goqNde1Z?=
 =?us-ascii?Q?7WQtSHietMZBesNFyyFFhR4sVDErqCS3uXZGudp146NWsY629TtxD+KTgefa?=
 =?us-ascii?Q?bZIdNVx+wYUkxYXaPajZBUtJMl3luy1vqB3toNph/W35p0vFaSJNvBThPUS2?=
 =?us-ascii?Q?Rbe6KOwuoc0ERNui2edc4vXP0ryyFG+yr6wPPVdaGlaIw7bo3eiwSpo9W4Et?=
 =?us-ascii?Q?i0EPJTFlHOTRhxLnalW+x3nEIETvhwzj0kCxxPYcweixQculSu0B+XuRhrB2?=
 =?us-ascii?Q?//+NC1cEDJdUyMfjyGwLwmddmy7nqhOMofyEoKomfC2WXeUgPNycRG1+jeYS?=
 =?us-ascii?Q?n4YF8hPp3fbYZfYNKzwkpjHBFNsOo1pQjRlYwnmuSRhepnUya+/VkB1n0CSJ?=
 =?us-ascii?Q?Wj8XaKiMvuvD1zU=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:13:54.3064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2e31bd00-7aab-4ca1-284c-08dd393b2509
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6631
Message-ID-Hash: 4NB3QHXEMKQ72E6BC3OYQEJBLZF5IOXZ
X-Message-ID-Hash: 4NB3QHXEMKQ72E6BC3OYQEJBLZF5IOXZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4NB3QHXEMKQ72E6BC3OYQEJBLZF5IOXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a conditional check to resume SoundWire manager device, when the
SoundWire manager instance is in the suspended state.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 60be5805715e..6831b3729db5 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -850,7 +850,10 @@ static void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_chang
 static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
 {
 	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
-	pm_request_resume(amd_manager->dev);
+	if (pm_runtime_suspended(amd_manager->dev)) {
+		dev_dbg(amd_manager->dev, "Device is in suspend state\n");
+		pm_request_resume(amd_manager->dev);
+	}
 	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
 }
-- 
2.34.1

