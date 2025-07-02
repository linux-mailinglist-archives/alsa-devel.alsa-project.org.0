Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FF0AF1057
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jul 2025 11:45:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77FC26020F;
	Wed,  2 Jul 2025 11:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77FC26020F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751449534;
	bh=UG55emeSW6j2yG5Tz3CNIlVodC2TuECMDlC7B44Hp44=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r6XVsuBUqL5mM/23dYZN03Dp5UPunJ/uCuUioCm2dP4zRZu6R9yfD83KC0TEVhMcp
	 gSkDULbnt2CiJ+kEBjCq8QBMFflNLI+FyLnm55S83qXf0EO6iXZgFQscnm0yOfrRW4
	 aUMUT0g9dsqjJmrwGoaMpBlWA7cc25SWxwshDKWc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CD76F805F5; Wed,  2 Jul 2025 11:44:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF83CF805F9;
	Wed,  2 Jul 2025 11:44:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC2E1F805E5; Wed,  2 Jul 2025 11:44:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::624])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0B0EF805C9
	for <alsa-devel@alsa-project.org>; Wed,  2 Jul 2025 11:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0B0EF805C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=xcQjb0hW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAr6naHk8Yo1buygGfSSs4Hdm8hplDbwEQ8Lgi2OAGgspp9LxJ0clGtmwE+cD0sj5ZmydcmQsAoGg0smCTIt1NjoYTCByahF+ahzQey5HYEt8r2xRbHdVCqqsYbsXc8Yl1Gxm1AM4ydvlkOCnmR4z4w2mWPUw4H+HP59/EcjaNY0W7s4eX0EmTbeWfdkDnkNI/BESVdFrZzOFaeCxKtT/mj+gWKML6KYNgDBwbRFvbSXlSDbuc3Yy8dFVxbLVf5yqOXh8SjXbyFWlFGW5PAhXOi+XXlJ0MN3orhzJfQFf6q/LhTY9FV4UMP/XtZNPxr93c9a4qLxtNmD1qfrmqkqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUIRH36XdQmbvzQf400K8mzog/y4CdqcB4Ytg5yxHWA=;
 b=uTJkQJKYjeluLx57gx85hXgtlM4kz+cS2vawcqLncSs23y9Qzf5r0RSfFd2UW+Zrv/jTZ2i/bunLd42pwvrC22J/wydCykmr4x8PmUh455LAkDJjSvM0WVnTwCc1vQX7RyexBhOkTKdceufvEhn9e8E9/Ju5M7vh5Sd5ueCyUSxLOdKzrtmud/yCNrUi9DgAi2xS7OblatcD/gciuHJ9JTGVvSDQfhFT0SodhMeIRhJGaCUB9stxGnZMLzAMulC3Am9FIqvd4LF3gIGvVtF9V38MRXGyXoNjFUtHimljweQH/SP2xq8mLFbx+rocfXsdYOd1yyX9HmMUF0eqZbGOXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUIRH36XdQmbvzQf400K8mzog/y4CdqcB4Ytg5yxHWA=;
 b=xcQjb0hWbQnWTC/qiP5ZF+ogK42shyDZkt0uXK6NVTHJTObIT9O1n3sVR9y7sHYlIaukiAQKDV9UoEe1mWhST41c6/gWpw5TIOxE7GdT9RU3sjAW+LNcxmUKYaRUkvpoJ2B5XfHKqDmuKG7uSvhlDXNydW7ufGAsuFjx9AjIxc0=
Received: from MN2PR20CA0056.namprd20.prod.outlook.com (2603:10b6:208:235::25)
 by MN2PR12MB4256.namprd12.prod.outlook.com (2603:10b6:208:1d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.37; Wed, 2 Jul
 2025 09:44:43 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:235:cafe::57) by MN2PR20CA0056.outlook.office365.com
 (2603:10b6:208:235::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 09:44:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 09:44:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 04:44:42 -0500
Received: from r9-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 2 Jul 2025 04:44:37 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Greg KH <gregkh@linuxfoundation.org>, Peter Zijlstra
	<peterz@infradead.org>, "Mario Limonciello" <mario.limonciello@amd.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, Dan Carpenter
	<dan.carpenter@linaro.org>, Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Murad Masimov <m.masimov@maxima.ru>, Thorsten Blum <thorsten.blum@linux.dev>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] ASoC: amd: acp: Add legacy driver support acp7.2 based
 platforms
Date: Wed, 2 Jul 2025 15:14:10 +0530
Message-ID: <20250702094425.155185-2-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702094425.155185-1-venkataprasad.potturu@amd.com>
References: <20250702094425.155185-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|MN2PR12MB4256:EE_
X-MS-Office365-Filtering-Correlation-Id: 2325f9e1-ce9e-405e-db5a-08ddb94d127c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Irph6XfCOdCC+2GVxyriPjx4+BHsKzEOfWdE4T00l6GayiIXVQ3KUO4yk55z?=
 =?us-ascii?Q?WCoBDbcoTgONJZEn/ZpLlw0AtbSQIDGiXeuPXu1Reoxxk0mHQ63+ZXsfqfII?=
 =?us-ascii?Q?xsNyTWe0/Cv1n1Qg7k0/ZtuetcoWSajBz7ywEBEMkTfKcGPlsyaXcsbhJVid?=
 =?us-ascii?Q?sHVF5ocrbGioqGzkLJQWGGSCbJCdo2tkuvW+/bSUvabk0lgWO1Y7ditjm/EF?=
 =?us-ascii?Q?PpoKgSFeHzRR6LAogcvY+Sox6iN7S9V6noskdPR33BAy0HSII8vjay5bdI4O?=
 =?us-ascii?Q?7vzmcIREWq8RNYgGWobWVckzzzJ0hEblU4cW526RwGWS5rO49b3jK0lGOJqg?=
 =?us-ascii?Q?2w4GxJZEc1nBkzzxbo9tesOxJZxVZCIblk/k+WY4aumkCRZgnodvk9KBBNkj?=
 =?us-ascii?Q?FfzZb45T42AqkEgD77wq8OZTuIHIWyPu/CGghwI8F/7bLagcwaqhD4QA0zy1?=
 =?us-ascii?Q?E51wGI9UHp6ia7LhrgN25twP4i4u3K+skGybIeM0ioA6e5cqhHG0e0x0740a?=
 =?us-ascii?Q?b5hNQ9nNxMXgHy99zUbyPHcNR9zrjAojfI/6IlGMi8RSeoh6GY9Pzvk02XPK?=
 =?us-ascii?Q?6LvRASXxFYjDOdA01w0KLJUFiqTw/gk7/cFYh357LIw/enlrP8kRDXAO+yQC?=
 =?us-ascii?Q?sDGCTMt5U/fDNgjq2qcWQQ6yG8TjoyHbxnTtWvx02VAu+0RREpTJH8UVhBX/?=
 =?us-ascii?Q?JS7g1ZSat3d5hqsgzteksGd6XGkr7/puPRS3ql0usEUN2H5yzSwKtXeWms2Z?=
 =?us-ascii?Q?Mm1K1NwXK3/VfFez9+7W+f8Y94+jNUI7/mhh79T3euU8UIN8D44H728/UYzq?=
 =?us-ascii?Q?j35gO7A3FL2rUZDYOCXmVWxibPcXYfBPxYZH8JXnDFyzVT1sMsSoJ3Epdt/g?=
 =?us-ascii?Q?UymDIwHoGiBvUrZjR9FnpCJmoqAXgkzAgsGWqTyLJcdC11VAyDbStby+ojRW?=
 =?us-ascii?Q?69lful933+RHis32vq2cy4Zsos+kKTsKbWiEetHDe0h5n+f0G768WXy3+Wqc?=
 =?us-ascii?Q?uMH9mY5WdV2jKVgyX44gFhjk/zcbSCO6pNhRj/zRcH8XbZJB/yE9E+mcXCc0?=
 =?us-ascii?Q?2jXE5IhzyN7vXLYtzSlv+T6AlooP7nMP1/NyRaKrFfX0XTAuorsvOFluthG+?=
 =?us-ascii?Q?CHEXispB4xhlTmlwuXGJessbCmmDS+KeCLzNzEkfp5z4gfT6xP77Z4pUgvpK?=
 =?us-ascii?Q?B48sGANKhLHw+hx4MUYLLoa32BaCEWXAXDOnv4cM39ARZNRy7JD8t+SxN7Rc?=
 =?us-ascii?Q?iwJehuuedvQn63JGYcFAOWOiuQ3Zu/eDKQ9gP+uFzHjRMqftIqPxmhM8InE1?=
 =?us-ascii?Q?Dek/OVhKQHBV5gJnZ8TQzPu9szRluxp5m1hrcRBevejt6TYxsegC2i/Aguwt?=
 =?us-ascii?Q?JH2YZacTzUNPt7U+5Qw5K4p5dO3jnIhmaxX5KXjcFMfMCmq9BqgsLFG7ZoHJ?=
 =?us-ascii?Q?ukwoPoSyLkZ88yG5jeyPOdbkKKkYHf4E1G8z+sTIW2XYTDZwYogqbCa0Mk7w?=
 =?us-ascii?Q?4oSyJzBrNQPUtIPb8DGQ9hPWo2haC0cue5CQ?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 09:44:42.9836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2325f9e1-ce9e-405e-db5a-08ddb94d127c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4256
Message-ID-Hash: CEIUI6R4VW2564G36E5FUMCL2VEXO6JG
X-Message-ID-Hash: CEIUI6R4VW2564G36E5FUMCL2VEXO6JG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CEIUI6R4VW2564G36E5FUMCL2VEXO6JG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add pci revision id 0x72 in pci and platform driver to support
acp7.2 based platforms.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-legacy-common.c | 2 ++
 sound/soc/amd/acp/acp-pci.c           | 1 +
 sound/soc/amd/acp/acp-platform.c      | 2 ++
 sound/soc/amd/acp/acp70.c             | 1 +
 sound/soc/amd/acp/acp_common.h        | 1 +
 5 files changed, 7 insertions(+)

diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index 4e0bbccd1e93..57982d057c3a 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -372,6 +372,7 @@ static int acp_power_on(struct acp_chip_info *chip)
 		break;
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+	case ACP72_PCI_ID:
 		acp_pgfsm_stat_reg = ACP70_PGFSM_STATUS;
 		acp_pgfsm_ctrl_reg = ACP70_PGFSM_CONTROL;
 		break;
@@ -573,6 +574,7 @@ void check_acp_config(struct pci_dev *pci, struct acp_chip_info *chip)
 		break;
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+	case ACP72_PCI_ID:
 		pdm_addr = ACP70_PDM_ADDR;
 		check_acp70_config(chip);
 		break;
diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 2591b1a1c5e0..f83708755ed1 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -153,6 +153,7 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		break;
 	case 0x70:
 	case 0x71:
+	case 0x72:
 		chip->name = "acp_asoc_acp70";
 		chip->rsrc = &acp70_rsrc;
 		chip->acp_hw_ops_init = acp70_hw_ops_init;
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index b3eddf76aaa4..b25ac5612808 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -140,6 +140,7 @@ void config_acp_dma(struct acp_chip_info *chip, struct acp_stream *stream, int s
 	switch (chip->acp_rev) {
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+	case ACP72_PCI_ID:
 		switch (stream->dai_id) {
 		case I2S_SP_INSTANCE:
 			if (stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
@@ -205,6 +206,7 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	case ACP63_PCI_ID:
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+	case ACP72_PCI_ID:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			runtime->hw = acp6x_pcm_hardware_playback;
 		else
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index b95e3949e70b..bca311c88139 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -136,6 +136,7 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 	switch (chip->acp_rev) {
 	case ACP70_PCI_ID:
 	case ACP71_PCI_ID:
+	case ACP72_PCI_ID:
 		break;
 	default:
 		dev_err(&pdev->dev, "Un-supported ACP Revision %d\n", chip->acp_rev);
diff --git a/sound/soc/amd/acp/acp_common.h b/sound/soc/amd/acp/acp_common.h
index f1ae88013f62..984685602e3d 100644
--- a/sound/soc/amd/acp/acp_common.h
+++ b/sound/soc/amd/acp/acp_common.h
@@ -15,5 +15,6 @@
 #define ACP63_PCI_ID		0x63
 #define ACP70_PCI_ID		0x70
 #define ACP71_PCI_ID		0x71
+#define ACP72_PCI_ID		0x72
 
 #endif
-- 
2.43.0

