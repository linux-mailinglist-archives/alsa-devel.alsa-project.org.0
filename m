Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E22E8A5A30A
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 19:35:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2200960758;
	Mon, 10 Mar 2025 19:35:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2200960758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741631716;
	bh=jt6F0PYXtasgjoQLXuoNkr0b1s/oxUJBN1Y4ZJEiL74=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V3N0l51r1SPDvX/ugWyiV/Hfz0UJ+nQPUOuWwZXvJ+rOY+6YaRQKlZs6CTYv/g3uA
	 MYBXHJkUwDUztpFCxb0IZj0zOkpXRqSHDnFp7Bi0VMCuEzShAqFwjhwG0wJxYIZgSq
	 KQJIu8JGIXBfD1YejrC98CBdyhKmjCeT9mBUdFiI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0906DF806A5; Mon, 10 Mar 2025 19:33:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA8DFF806A4;
	Mon, 10 Mar 2025 19:33:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2ED3F805CA; Mon, 10 Mar 2025 19:33:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCB5AF805C7
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 19:33:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCB5AF805C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=I+iylskH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQGnQq4fBrWVEYmyyz4fwpjtXOz6dq50VwN+8rraODdBysV8wWV3MbxTrOmwpzxuJU+9GxfPPXeQxZ4K7HcYZpGpAh0Cbi4m/6vg1j1t6Zb4r4uryDmDPU8V6olV/hXgYQfMbB9E79BFyGvT1H+FALWnSNsLCvZSGJVefRY0NYyV2Lfljn0bHviSOZvRDhJMqpelsrFHeiNI0HeTu4H/mbA1HFP/4RVTR0MPRTd6xzFvoieP1St4cAwB2t/u9mR2ghxq6ncO6KHl68mYplYVX1xfuBtYTAsTbpRfO7w3EGA05aLSChp0kc/7q1ncaIGlIWN2V/hjCdHF2PmJ4BZrxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7sLt8sBe9/EPSYp8bjdvUdhm0piEtEqPpLgLdgbD34=;
 b=JZ35LjnPJDXNhZxQwxDduBQmQyi+GqArbbLaHeHqC7fCvM8R3Fhn54wvslk/k5RO8gvEqDTG8kzH0zRfjimWSOq7nooX5a851qDZzCvhaWxZfnshNM4uy0Je53XOZTetC7+hFldNQi4E/HGVJ12JbA4qs0b/q7Ws+YUX9S/JwNtoDi0zc2DrsYb8nQxOR5UAaNesry5WJqVZ4t4iYQD3YhJVltPrPIKNESBe8Z2UyofZknbjXMzvmR3I17PsvW0hEN7mWMNHJF3FsEYNrpO58wT71PrCk3sq6iPZ98TMCJmVLedPBl/84D/vldM66Ig5+BG9/Dh8MD0UAmkArOw+xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7sLt8sBe9/EPSYp8bjdvUdhm0piEtEqPpLgLdgbD34=;
 b=I+iylskHbC58zvnBsv3L8xIw67hQ0zHxwCA1MFxsL+QUEN7klpzr2FgNYlk0h3c4JAWwMF4ELocMCnqqEnCsM8In8K5yJ/eLyTUj72FyW8JqR6mlE7ngx/yQtlpQArvfKfeqVrHA8vaUvgnEdHoJuva1SWi8ksP5wVwX3A8y4vs=
Received: from MN0PR02CA0027.namprd02.prod.outlook.com (2603:10b6:208:530::30)
 by PH7PR12MB9125.namprd12.prod.outlook.com (2603:10b6:510:2f4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 18:33:12 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::dd) by MN0PR02CA0027.outlook.office365.com
 (2603:10b6:208:530::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 18:33:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 18:33:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:33:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:33:10 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 13:33:06 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Mario.Limonciello@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<ssabakar@amd.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Greg KH <gregkh@linuxfoundation.org>, "Jeff
 Johnson" <quic_jjohnson@quicinc.com>, Peter Zijlstra <peterz@infradead.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Murad Masimov
	<m.masimov@maxima.ru>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER
 MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 08/14] ASoC: amd: acp: Move spin_lock and list
 initialization to acp-pci driver
Date: Tue, 11 Mar 2025 00:01:55 +0530
Message-ID: <20250310183201.11979-9-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
References: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|PH7PR12MB9125:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ca4e41-427c-4d7c-3910-08dd6002033c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XzXRcnFI7ThIxDCkhw3rs5eOgVXGL7Jmo6rWqVSw5jbH6eNyh2WOprHdiV2Y?=
 =?us-ascii?Q?Mo5Qw9t9gU13ctsL1/gisd+6jB5/rlgF6Bw7vLwgxtm92pXb0cWBYPWtGbvd?=
 =?us-ascii?Q?yREPyRCKEdJSsfTAAss33krAP4wZn2kOhQCLelNIctEq0Fr6ZmBT6bXoHl3r?=
 =?us-ascii?Q?vxieOUpF9fKRAVdREmqHtSKnIVLPXjTqTlqILTIPvFGfjtLBcNiSfCZnXYmU?=
 =?us-ascii?Q?PM1jTJBLG1XU1ZcMyOwHnyGS/hfuAW8I1//T9iKLItWzGRa4nbq9sqGhspc2?=
 =?us-ascii?Q?ok2CXLzQGVTu+53WXVpwan4j+0uaedKAKNi0NJj+WVswTTgy4DCyn4dea8an?=
 =?us-ascii?Q?Mk2mn776cGCrjLkSo0i7p+upMyHTNzOE9IfiqG/6e9FjAnT2n3Ba3Ip0GH9M?=
 =?us-ascii?Q?WTzDnlTR4VVo2nzaunatLVsz27zFpdhRH1NmM4Gs1/h9eAsxd8a1A1OzYhP3?=
 =?us-ascii?Q?hbnwO+dv12z0AjL5sbZP57tHOwBbS1i3hStcj09odAEIyMO3qu2RCvOXc+LO?=
 =?us-ascii?Q?fLP9j/fewBA1zshX3A9k3QQQA9Dsus9iuv20mdk6/329Tr9e0GOy0U4wV8BL?=
 =?us-ascii?Q?k4FHo0E+1wYKDPUZoSq/zk7lr81h87vyyYV2UzAOEgjEEKD7i40prkGw5JqE?=
 =?us-ascii?Q?3jnfNejL66bGA1aCYpVlbUAuM1+A76DrOGglPoZzZ63umvfN+QbiCCFDfvVz?=
 =?us-ascii?Q?Sz/OTY8gSqnO0mcnBKpk7iHzip6m/jLI3MQkK62qUwSPG5Fd/X6sGZXMmspF?=
 =?us-ascii?Q?RB8XHYWFczWXnyNBEOG1dy7kIYZNyJ0i8Gw2ElSfwoZ2ZjcLvcvVsq7HPUqL?=
 =?us-ascii?Q?OpTmBz4EKSibryFWmoDeDnzObvSD0dsGnO8F55TbxPZIrHUxCCYHtRpBxl81?=
 =?us-ascii?Q?6Li/P0FYp+D9L84z9AjBxxMHj1Vld64B00p3m2u4yJXcjGHvTQ65QAdkd2wg?=
 =?us-ascii?Q?MVgZtOJfeUZHU5XeDLbVMwfY/tZppqFZ2irJuy/qcfOTHulR8Et+ds/qoXqL?=
 =?us-ascii?Q?bTkq0TDCQ+WgdvP4RNjiAGIVENqzyYPACj7ReNBbozFfFw2taPxQQoU4fHdL?=
 =?us-ascii?Q?R9I/lYzilg41HmqHWObEx0fe814fplU6ZHPBTC/TmPQpe2yl1e+i33QVUaP0?=
 =?us-ascii?Q?UwbBRBVjuxpVNoyFO//diwtNq+6ndsggtBLQXL7yJTbzulAl9zcEgSTbQhfp?=
 =?us-ascii?Q?PYiPNHqx9SU5zVClixjz28L3Qv5kmFeVKV0WyniUWrOi4xei3J9/X5STp/T5?=
 =?us-ascii?Q?J2Wq5mtoqWftNrLbtqGwV3+cvdEsdmbMYPsqyNJ/cr6kzFDAsMd92c/6bZtN?=
 =?us-ascii?Q?Y2xDogx77F6mGyCao2AoxGRetvE4NJQ+pzbTl/tBipFMTBATtKiWjlsxth02?=
 =?us-ascii?Q?n1VElnNhdm2TsKdneYft4H4JfFwHSLRG31yVDV7raeHAtOurL1p5qcF1gDZd?=
 =?us-ascii?Q?4lW+4ivoFZOZWIyWG83e6pJeXo1ml08jchH6EXwWAeHwVH5t+DvB7fUAJxP/?=
 =?us-ascii?Q?+R/UceOaRA/pWKQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 18:33:11.6489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f4ca4e41-427c-4d7c-3910-08dd6002033c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9125
Message-ID-Hash: WBINLBIQYK32U367HRJX4YFRM6XOXKSD
X-Message-ID-Hash: WBINLBIQYK32U367HRJX4YFRM6XOXKSD
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WBINLBIQYK32U367HRJX4YFRM6XOXKSD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move spin_lock and linked list initialization from platform driver to
acp-pci driver.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-pci.c      | 3 +++
 sound/soc/amd/acp/acp-platform.c | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 1ef9faba1d8a..8bb93ca18053 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -196,6 +196,9 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	chip->dev = &chip->acp_plat_dev->dev;
 
 	acp_machine_select(chip);
+
+	INIT_LIST_HEAD(&chip->stream_list);
+	spin_lock_init(&chip->acp_lock);
 skip_pdev_creation:
 	dev_set_drvdata(&pci->dev, chip);
 	pm_runtime_set_autosuspend_delay(&pci->dev, 2000);
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 8d61e1991e4f..b3eddf76aaa4 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -343,9 +343,6 @@ int acp_platform_register(struct device *dev)
 		return status;
 	}
 
-	INIT_LIST_HEAD(&chip->stream_list);
-	spin_lock_init(&chip->acp_lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(acp_platform_register, "SND_SOC_ACP_COMMON");
-- 
2.39.2

