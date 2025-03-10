Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC2AA591C1
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 11:50:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B79C6077E;
	Mon, 10 Mar 2025 11:50:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B79C6077E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741603841;
	bh=fisrs6cePNNxgir5qlUPGXJsd/i/g/8L3UVPQneKqjQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WcLz7oQLVs2aUoaLvrTE96ZpdEXMaXoBp8hgUCAE0/2yUwbNE6VPd/vtTd7o4Ndpg
	 KnI4Tn8WCkRnES0/0qZHQG8x+RRzOflbk82QnNNKc0meDJZhAYZCdOWsX787UCMOrT
	 jGukLc/1HvJcLnLHYXKrAJOsRNMnXLoFZQjKjNVA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83E5CF8070D; Mon, 10 Mar 2025 11:47:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6284DF8064C;
	Mon, 10 Mar 2025 11:47:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D3E9F8070E; Mon, 10 Mar 2025 11:47:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::60f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BB02F8060E
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 11:47:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BB02F8060E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=F5I+HkvX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsrviGKur2NGfzndZan6/mkgVGuabgR4DcY+zKOZ+iTkHpCn7vD9TmECVSRpoq45tsEGaE/KT2oOISAKlwgDWT3+eA30B2GQAqgx8OFze7F+jn7ic4LeZvszUGZ0aQUod87ydKlhnfYTakGi+UIMsjAgZqlZVmZR4zLiTKrqqpyl+igxegJdalgizbfA8QKDbEHEZ+7otKL+ugdIiNekJRNf1UpoWigO0r0Zp0id4yfkZYY485KKlPNrpk+x78tedYfYb0xS0xYA4Q4kIcc97iW+vyK8uzKQuo04HBFrIJixSHgQWM00B/H6b2T6lpTLNxhRuaJYww5+hd+UvP4p3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9GyQ7Bm32NGHjk0Pn1Y6Cb8liWmV6wrFFvW+ruM+Ho=;
 b=WLtFcS/ImBBCE/yk7lek/EA27IZ5NZO7gxrRSNUEHtSLUe20EsLarN/kB17PEnQi3BvoiG47jg6X3zLGD/JuSGUXyGdBMPXCrTcPDsK/ylFFWvIUt1oQZY6g2gaJyQ9bGPCIgBd5lLuMQC71id2NvZLb4yFMsInU80dVBmIPso9AfNGH3K7QsM7CqYZZyciDquwSndwr2klI5vxPv//6xLF7PUakSEY9FsF0eamDrQCdlA+yO7SlXB7xO2GVEpwZitAbx0GmVHMP+i7+mr1uozwYvqANluxCmjqBcweru1A7SWEWuJq7iS1DFIwMzNUvYhf9biwOKUSDE1i170vHsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9GyQ7Bm32NGHjk0Pn1Y6Cb8liWmV6wrFFvW+ruM+Ho=;
 b=F5I+HkvX91+UhFqtgsqgFtIl9BDSQzmSmO6bhVXcZfqgHJX//7TDvVnZUB58sbh8tmA5p7mim5w+VKprnDU2iwQAUSX/+Tw2zkh8ftbqQr9n9mYDshKVvE+IARWj+pLKYcQMUa0TiepcNiCS7FOsHHTQ0RjQ5XfPkhV/xdQYswk=
Received: from BYAPR01CA0052.prod.exchangelabs.com (2603:10b6:a03:94::29) by
 PH7PR12MB6417.namprd12.prod.outlook.com (2603:10b6:510:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 10:47:46 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:94:cafe::41) by BYAPR01CA0052.outlook.office365.com
 (2603:10b6:a03:94::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.24 via Frontend Transport; Mon,
 10 Mar 2025 10:47:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 10:47:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:47:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:47:44 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 05:47:40 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <mario.limonciello@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Greg KH
	<gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, "Jeff
 Johnson" <quic_jjohnson@quicinc.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 13/14] ASoC: amd: acp: Refactor renoir platform resource
 structure
Date: Mon, 10 Mar 2025 16:16:00 +0530
Message-ID: <20250310104601.7325-14-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
References: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|PH7PR12MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 4856f936-c265-4017-9ea1-08dd5fc0fe47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fdsvVBjSeQkFCX/BQnVp9x2J2zVsjGuPUPC64bF4tAID5zBckY9olxS1Byst?=
 =?us-ascii?Q?O0Pv+5Ww7wTv8RjVuLRrwQXMdPCWoJ6cZGU+o7+69Bdy7UrqKjiagZa/+BYF?=
 =?us-ascii?Q?iqQGuHTRnBcDkk19Mb6XAcjFJhu9Ci2zBZ7NdM9wgffOm/EanFPFu3f0uhQm?=
 =?us-ascii?Q?R+YuJmYmP0joJeuRr/sL9Ej5U5Vgghoia5idZTrErdqG6fA8r9mRB5pxyKu1?=
 =?us-ascii?Q?3hvhE3x2prFZvsRtJSuUQpXC1qIvvrGw8edLpx77HBwi1w99xYuVfZFLtZWF?=
 =?us-ascii?Q?/APoXKW+DmyKZqKtDHrAeGEZlRBkzTWOiMokWCzzluVJu2IXnCiQBCOcG2Y2?=
 =?us-ascii?Q?XqSLEKXWeBU3rQQHm8B8rnEbW+SzkqXzMlTGgoFkvOwZNN+Sozg2yMV5Ygvq?=
 =?us-ascii?Q?ajW+uyLr9v9Kh4JlLiMMf2AxfrCV+9Gu/p9rqYPcFeD+EK3dGVblo6vLzZU7?=
 =?us-ascii?Q?AYS29sleu4GdTCYOdFPdnqLlq+WAgbWAl6LvBigYZjo8bMhRuEv1nTt9lWY/?=
 =?us-ascii?Q?k/8fWfWq9ijTeZp8k2asFLwpISLu3wGvPn+N8TkUPzhSaH1ifNMgLAdpam+p?=
 =?us-ascii?Q?3Lu9n2M368i+ePUgewNl9v7nLl0teO46FpN5/wRB5Ep9Xq77fpL6LYmrqDUA?=
 =?us-ascii?Q?TPIEkOTHTGZBIgCVYSf5wyW6PdblNfKtfE+rXWmpWQj8VVWGMX2bZCgLT9cq?=
 =?us-ascii?Q?NvyPyBTPspI8sIgtkJPQHYS7SLSiThxaQrMB60lxGtteX+JMgQGrgrogN6aY?=
 =?us-ascii?Q?Et05RBiaPv7iXhm/s7XiQQNgcYnGpZE5GLnMrU9Fkruje3VhrXTpcEItmOqw?=
 =?us-ascii?Q?VsWjLMWuKrihdHeveolMc3nsGd8mZ3kR49UmXSQMNnGNEf18VsdQccK01iyS?=
 =?us-ascii?Q?R+h6PeguezDQLb8LlF+SYHlRycUXg3KJ4QUwauI0EX0+ZgBohj09MYLtVIJU?=
 =?us-ascii?Q?hFOjmLoFi7r/n61li4MyDHVi+3MBuze2WI0818gplPKTedRI+roYMQdB11aV?=
 =?us-ascii?Q?+eDE9BaDrJRxfwwu5Dov8I+PopoesscUEnRaTgjYZUy1FPw7UuSJl4c0W3bE?=
 =?us-ascii?Q?oZoDSoLRZuJPjhD4BooBWCoZG1F05mmG4vFuWJNmIWLRSP3y5iNWqDOx2bwP?=
 =?us-ascii?Q?VSeZO7SXwi5xvixb99rvLFCy7zNzo+mKyZUVF1sIB7bfhds9+aBLhnJFnjid?=
 =?us-ascii?Q?m3dPvnBv17Ul++ynAsopQZTGpIg0ElYtxJXFSQHbH/I2WrsBE+kpa0EY2VSG?=
 =?us-ascii?Q?GBW6a2pKygMdaUB3x0iU2dBrFfIF4pgpNDyaDI8utRruIL+nwhfgZDzXm8fh?=
 =?us-ascii?Q?Mfr+5BUe2hbrcciZzaiPZCR9HSus3R/5qygxVZoWiag35+JMu6M2eyOORx94?=
 =?us-ascii?Q?GwKhK72s6d1ZM/9gg+BALOzJ6V/Vj/qm8hb7EAS1hw+5E6dlad9gDt3JyaOI?=
 =?us-ascii?Q?tJQoPOl9g3B6mTPZ45RTpxk9n6w2RpzgNAXwGPCRqXBNrtp7hJ+hS01JZ+WK?=
 =?us-ascii?Q?sRxnB0HMjgBYmWo=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 10:47:45.9225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4856f936-c265-4017-9ea1-08dd5fc0fe47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6417
Message-ID-Hash: VLZQXPYDRYA5KLE7D25DFGGVRZ52WRX3
X-Message-ID-Hash: VLZQXPYDRYA5KLE7D25DFGGVRZ52WRX3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLZQXPYDRYA5KLE7D25DFGGVRZ52WRX3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor renoir platform resource private structure to amd.h
header file.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-pci.c    |  1 +
 sound/soc/amd/acp/acp-renoir.c | 10 ----------
 sound/soc/amd/acp/amd.h        |  9 +++++++++
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index cf4794cc2f54..c6ae6e947338 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -135,6 +135,7 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	switch (pci->revision) {
 	case 0x01:
 		chip->name = "acp_asoc_renoir";
+		chip->rsrc = &rn_rsrc;
 		chip->acp_hw_ops_init = acp31_hw_ops_init;
 		chip->machines = snd_soc_acpi_amd_acp_machines;
 		break;
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index 970ca613a439..b8ded929d52e 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -27,15 +27,6 @@
 
 #define DRV_NAME "acp_asoc_renoir"
 
-static struct acp_resource rsrc = {
-	.offset = 20,
-	.no_of_ctrls = 1,
-	.irqp_used = 0,
-	.irq_reg_offset = 0x1800,
-	.scratch_reg_offset = 0x12800,
-	.sram_pte_offset = 0x02052800,
-};
-
 static struct snd_soc_dai_driver acp_renoir_dai[] = {
 {
 	.name = "acp-i2s-sp",
@@ -121,7 +112,6 @@ static int renoir_audio_probe(struct platform_device *pdev)
 	}
 
 	chip->dev = dev;
-	chip->rsrc = &rsrc;
 	chip->dai_driver = acp_renoir_dai;
 	chip->num_dai = ARRAY_SIZE(acp_renoir_dai);
 
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 67bc6b84564e..4015facac7b7 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -238,6 +238,15 @@ enum acp_config {
 	ACP_CONFIG_20,
 };
 
+struct acp_resource rn_rsrc = {
+	.offset = 20,
+	.no_of_ctrls = 1,
+	.irqp_used = 0,
+	.irq_reg_offset = 0x1800,
+	.scratch_reg_offset = 0x12800,
+	.sram_pte_offset = 0x02052800,
+};
+
 struct acp_resource rmb_rsrc = {
 	.offset = 0,
 	.no_of_ctrls = 2,
-- 
2.39.2

