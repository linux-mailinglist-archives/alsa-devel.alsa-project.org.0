Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4B481866A
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 12:32:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63A48E72;
	Tue, 19 Dec 2023 12:32:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63A48E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702985570;
	bh=JKEFR9AVt0hzLGc5hMYAvIWEW3UXallJf9PWOgWe90s=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NvmCxjbxglJErWzKr6e6557LVhQJVLPdn0PuFac8WUehknn/8KUVJf88KlPRTgJJi
	 i3Tnj7MXgxZAW8V3uNDIhWozd3L8w2XXDxnjZMX8X+KFZTkAScTZgf7glXdz9/suZf
	 EtBkbvwcuywByvspny05pS1d4vGGHCHVVFert4MY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70108F805C5; Tue, 19 Dec 2023 12:32:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBB0CF80579;
	Tue, 19 Dec 2023 12:32:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B935F80431; Tue, 19 Dec 2023 12:24:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB35BF8016E;
	Tue, 19 Dec 2023 12:24:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB35BF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=P9YAVAtI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lq/b0FXAu8AAdJPyY/jehdK3qcH5TNH5Dc9WhJUSM1hHGbme+ZLSHw8I2htC1QqfNehK37fFlO60VjV6HNXHwBC7zodRKcpI9+4Di8MwhCtSB6jqJWJphdph4jTEDm3YVAMnfzU9FjkTr29AIrx4j7Zc6T6XMNJEzde0a3orZ9gq0+61eR1tvLGDhhML9baI7U/+sc0zCw/4SL7sRjDOyXSdd4L6tK3PqgnBLno5abSePgKA2K7RzQeKv9JJzFMtM4T8mlYL24qB0ik+6DXHSSBuXpTfKHwPTuiDaepFfixnG+rmWQYQr7JtgwBpuCA8aZxN2Z67tDx2ynqKGz1fig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTPjxlBwYGQHfWczDCu8z7bW/rfGkxhfKxXlcJVH/ls=;
 b=SBzaZtXd6B0oeb+9DA5RJDI4jIvxkNjB751tuEVJvSyDNKuCc37xKdwHwwWdGYpUX89mbHcMIsHX9+54/iqPLsQ9KzoZzlif43UU5c/7b+zGh2IdF14r+VlIDETqWVXcXXOCM/EzXEaXDVbEXQKOWScwOFJ7wfwDREB/0S1IM5hiSrMLjVo8OybPUkaLeEJhKRqBS0rW1+lGRaX9fHot43IvOKUDdiq7Q72WLF7l56iqqE6SCq+0O9dqRClZVjDwbd2fEsXQ/AnNxlYzmaGPLJRkqTiSusONG6C3Bc8VMr0evYCKeHpVWCBn2avnIPVnsP6cHpu6SgQS28LqjAYXUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTPjxlBwYGQHfWczDCu8z7bW/rfGkxhfKxXlcJVH/ls=;
 b=P9YAVAtILtz+CeeAna0HnAMe7MPUmGIe6tmeSfEJ3Iqmd93gZ0j0cIXvlF6nkYCP6lg3Gm/9l/xEcNECKPcZ/irUuCFyk0Tqy8YXsplQxqO9xgHm+oKMAiqoXU/wD599Fn3W32dGtS0TKBAU+di9E/jN7BM5X2Vufw0i6p5hWCQ=
Received: from CH5P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::29)
 by SJ0PR12MB5662.namprd12.prod.outlook.com (2603:10b6:a03:429::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Tue, 19 Dec
 2023 11:24:24 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:610:1ee:cafe::d1) by CH5P222CA0018.outlook.office365.com
 (2603:10b6:610:1ee::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Tue, 19 Dec 2023 11:24:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Tue, 19 Dec 2023 11:24:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 19 Dec
 2023 05:24:23 -0600
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 19 Dec 2023 05:24:17 -0600
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>,
	<cristian.ciocaltea@collabora.com>, <emil.velikov@collabora.com>, "Venkata
 Prasad Potturu" <venkataprasad.potturu@amd.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Iuliana Prodan
	<iuliana.prodan@nxp.com>, Paul Olaru <paul.olaru@nxp.com>, "V sujith kumar
 Reddy" <Vsujithkumar.Reddy@amd.com>, Mastan Katragadda
	<Mastan.Katragadda@amd.com>, "moderated list:SOUND - SOUND OPEN FIRMWARE
 (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>, "open list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, "open
 list" <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/5] ASoC: SOF: amd: Refactor spinlock_irq(&sdev->ipc_lock)
 sequence in irq_handler
Date: Tue, 19 Dec 2023 16:54:09 +0530
Message-ID: <20231219112416.3334928-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|SJ0PR12MB5662:EE_
X-MS-Office365-Filtering-Correlation-Id: de258426-a1ba-4646-161f-08dc00850de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D5m4KdAlVkLahO+EXS+vrYzO82wZ1GRXWsHeLj5AKmNYzd33Rq8876AM0CV3suNFwJMHNTPzZ5EV7yROOR0zXjfM1S8vsOvKyc3D+mFjvK5OV953lV6OjEiR/8djn19Hf53X20ZXt1YOWe9JS0II17OUBO0ljmNz1mGt14UKTfopQcighKLBYDb0vvRRxFbAMcKB3OgLX8+hvQB18YtawGIn1jVxn9MYy7kxvlLYMmTgULZwIYVFmaw4hD4wvLxEVkMo5cGE3YWHr7bUhVFYVTN9TLGlbvhgo0DUladyB/hg14Jmje6Nx7prJXVG3pETYBgod3OT+kCWjtqeAQc3en13p/kEt+8HblQP/o2I7C8q5/XpZoqZusRCn5aafgKIEwfRUkFS7zhfysLY+HNakkMXsto90b1VFUeiBssMlLdAWxxO6pCRlMU9YvaR+6IDL7JqpF/n2GffRenLJTXxa8Y0ZFd17aMOiNHhYsWQg359bNNBMpdx6kdCS7RbHz1ndcMoAIlUD8UCD1wuz5DAczu0xiMtGb7ze7JT+Ei+tJBSIq3r3qWMszzLC4y6ogd2wDVJL7oK+mLxRzf2X7fypPyH6/xVZe4op8PqhY/X1BpLHf6QRf1KQY7oItukhmvPdnrh7mTYm9ADnxSoYdHUZd8uUwQygWqzgN5K213Gg7KxTVT3aWO+1F7Cv/eVdo/VKM6/QpJy4G/z2BI5QutM13z0kD1jfMAzVj+1wFUHf+V3ekq417TSXjlSnP9jUnOeo/evTkK3u4o1pF99xjxksQ==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(82740400003)(70206006)(70586007)(356005)(81166007)(86362001)(36756003)(1076003)(36860700001)(336012)(83380400001)(26005)(426003)(2616005)(7696005)(316002)(6666004)(8936002)(54906003)(478600001)(8676002)(7416002)(110136005)(5660300002)(47076005)(4326008)(2906002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 11:24:24.2492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 de258426-a1ba-4646-161f-08dc00850de1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5662
Message-ID-Hash: JEGMZQNSMD4QHHYFX5BV4Q6EDGBEPIII
X-Message-ID-Hash: JEGMZQNSMD4QHHYFX5BV4Q6EDGBEPIII
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JEGMZQNSMD4QHHYFX5BV4Q6EDGBEPIII/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor spinlock_irq(&sdev->ipc_lock) sequence in irq_handler
to avoid race conditions for acquiring hw_semaphore.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/sof/amd/acp-ipc.c | 4 +---
 sound/soc/sof/amd/acp.c     | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
index fcb54f545fea..2743f07a5e08 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license. When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2021 Advanced Micro Devices, Inc.
+// Copyright(c) 2021, 2023 Advanced Micro Devices, Inc.
 //
 // Authors: Balakishore Pati <Balakishore.pati@amd.com>
 //	    Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
@@ -188,13 +188,11 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 
 	dsp_ack = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + dsp_ack_write);
 	if (dsp_ack) {
-		spin_lock_irq(&sdev->ipc_lock);
 		/* handle immediate reply from DSP core */
 		acp_dsp_ipc_get_reply(sdev);
 		snd_sof_ipc_reply(sdev, 0);
 		/* set the done bit */
 		acp_dsp_ipc_dsp_done(sdev);
-		spin_unlock_irq(&sdev->ipc_lock);
 		ipc_irq = true;
 	}
 
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 603ea5fc0d0d..7860724c4d2d 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -343,11 +343,13 @@ static irqreturn_t acp_irq_thread(int irq, void *context)
 	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
 	unsigned int count = ACP_HW_SEM_RETRY_COUNT;
 
+	spin_lock_irq(&sdev->ipc_lock);
 	while (snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->hw_semaphore_offset)) {
 		/* Wait until acquired HW Semaphore lock or timeout */
 		count--;
 		if (!count) {
 			dev_err(sdev->dev, "%s: Failed to acquire HW lock\n", __func__);
+			spin_unlock_irq(&sdev->ipc_lock);
 			return IRQ_NONE;
 		}
 	}
@@ -356,6 +358,7 @@ static irqreturn_t acp_irq_thread(int irq, void *context)
 	/* Unlock or Release HW Semaphore */
 	snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->hw_semaphore_offset, 0x0);
 
+	spin_unlock_irq(&sdev->ipc_lock);
 	return IRQ_HANDLED;
 };
 
-- 
2.25.1

