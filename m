Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BF1897E32
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 06:27:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5EB92C74;
	Thu,  4 Apr 2024 06:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5EB92C74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712204842;
	bh=upbDgiA+zCOEh5rIdZlfJ4VyGQRR/fnBSIaZ8IluFD0=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lLi3M4APylTdqQcqgTZDISlXS9YcyPvPGn03/KLDFXQZ4fUM+OYmHXf10nuz+LW3j
	 F7zWqxXc6v7twjcoTZbgYsv8hu4W42kLRy90stG0ySRHh0V+kRBQMuIdJ8GYm4XN9p
	 K6WUiVgmYrthdD966wZL3Vy6axnH2m8GU8mcnD3E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76231F805CA; Thu,  4 Apr 2024 06:26:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF840F805C1;
	Thu,  4 Apr 2024 06:26:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 932DDF8020D; Thu,  4 Apr 2024 06:23:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AC45F80007;
	Thu,  4 Apr 2024 06:17:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AC45F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MBE9KSp1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gm5iCLMu2VYyPJEJNRH3OsdwiyFejuEBNIcwHW+R41SIzMen0MJ9U4D+76sr9/z6/4lNXgfVDJG7HAX2+lQMr3wdD3ENUQ4D+0irga4vsv9Vd0xAAGRSUxti9/NaMBPPMEYMwoKcI5dHtVEo/SNWRluqGZPvbBTpMrKsq2oNbXhh/U52H3/On7WcRWAVTDdOZmTeqSdy13JAR3KKPSZrJX/+2cSyQ/NQf1ktUu42zB9G6ij1TPcPwvNXLy0pnq7O9lO/FUi/1awow3rXWdMwBpHkiV+LChNKtVFS7V/GhKv2CqZze5dXMUQExkuABWk9eu6n87QCZlr9gc07GM6lyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJ8L2NOLCLTkgc2s6Gc1VnZNqEndYSbgtjRbPYJsRvY=;
 b=g9QpH6T5U281Twqjh9jcB65jjniIFZEtSRs5eQajfVbd+8rkd5zLbgNWLYrFnfPMsLLiAPq2F53LcAlmxWc/2M0Dt4mkovnOMVUQ12IOGhZa8pI3ciNzITJ1cEqDx7bCTS3Rdw7R72Ry1JUEBP5DqK2D+OGNmxsg2eLOoYbxYrPeea0q/unDRcCpBMaBzSYOtvh1YKjz8tYUaKGU3jn3uL2Wbv25e+Dk9b5F2CAge1wY5jsSU5Fp7UfIkqmTCQPZoCjH8eXjHqWznbi2GRRPBvrpotjPgzlzVZ4Dqr0hCaW7LrbYPQRpVzwp73PD2qySTo7e9xx+g/yxxcXKM1VcpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ8L2NOLCLTkgc2s6Gc1VnZNqEndYSbgtjRbPYJsRvY=;
 b=MBE9KSp1gwizbXhPktSZwYEOQLQuZV8jHwiyHvRS3S/yPTQz5NFbnT9b768B3AgtNFT88hX64CBG/SzjzswZEUv0Tr17IkDbF6YttblJST7S2738ml4KlIlFfCrYzWO7lldK0P3oq02EbcqQBoX2Obn4sy4Yqa3CKwVnmCn5ioU=
Received: from SA0PR13CA0009.namprd13.prod.outlook.com (2603:10b6:806:130::14)
 by DM4PR12MB6637.namprd12.prod.outlook.com (2603:10b6:8:bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 04:17:25 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::ea) by SA0PR13CA0009.outlook.office365.com
 (2603:10b6:806:130::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Thu, 4 Apr 2024 04:17:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 04:17:24 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 23:17:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 21:17:23 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Wed, 3 Apr 2024 23:17:17 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Sunil-kumar.Dommati@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Emil Velikov
	<emil.velikov@collabora.com>, Mastan Katragadda <Mastan.Katragadda@amd.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, "moderated list:SOUND - SOUND
 OPEN FIRMWARE (SOF) DRIVERS" <sound-open-firmware@alsa-project.org>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: SOF: amd: fix for false dsp interrupts
Date: Thu, 4 Apr 2024 09:47:13 +0530
Message-ID: <20240404041717.430545-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|DM4PR12MB6637:EE_
X-MS-Office365-Filtering-Correlation-Id: a5228266-d63d-4bb9-8358-08dc545e2169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TVI17PCm5UUqPBNCmXCW8u0Rb2jTE/NosuAzQn1QlTyoyisYJIxMcQrDoQQomCCVX9DF29zMsgz2wzJKaOpFvuZneqgNkLCBTOWU+/6KHw8iM/kS/pGv1JK8iPNax/BB84a5U3lydWvb85j51h4nwbw3ytw6UkmEpqSYk8eJ04BmSEc390IMsSZp7BojDvzABeVlWmk2pLGUHcL+AKgr2ds8d2fINszF5+M1+9hkVGKqcYjXEvAIArmIMiATSJlU5nwlFQzADa0J2T8qNRhimFtWD3j+EqarEjKouSb2FCLuWSfSR9RfFPIHk6kSwDmbyzHSoCz0qXiyNO7v+accGqWyj6wyuIb3pWd+FM7nP/iAETbEni3R0i1Ic0b1B4MWFCcdVHjMIl32ydJGD4B/klCosZ5X4ND8Wyp5zUGHcTr1iLKdlDAu7a7DcNWMlcwoHQUKGRWZvziZAg3JU/9HaXFPhEGTNz/zHFGL3cMiJNd4wlFlybOdn4IjMZRLFH5XWa/ttYsPVORpw3kIXhF0hyBo1a+GRsztox56CqKGjQsRcUQUJ6yNf5NtRnyV1kb/4Es7sc849j4HSC86+8mZ/1488yWNm1xDOem8sytMa54eikghwYlUpiwse8jC4jgP0Ll7+CqLeeflgKQkXv0hYvmBsE+ayKmjDpWP9kydumqZpOHrRH5kzsOp3mLbS1qyBC4cicDgHc5UxL+L0+EtealWSYE+JvRmUfkFOceYI09EszC9QZ/0ksAE/+KJcefB
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(7416005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 04:17:24.2583
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a5228266-d63d-4bb9-8358-08dc545e2169
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6637
Message-ID-Hash: NVKYRVVWO2IHLT6XP4RMFL2EBGTD32YQ
X-Message-ID-Hash: NVKYRVVWO2IHLT6XP4RMFL2EBGTD32YQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NVKYRVVWO2IHLT6XP4RMFL2EBGTD32YQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Before ACP firmware loading, DSP interrupts are not expected.
Sometimes after reboot, it's observed that before ACP firmware is loaded
false DSP interrupt is reported.
Registering the interrupt handler before acp initialization causing false
interrupts sometimes on reboot as ACP reset is not applied.
Correct the sequence by invoking acp initialization sequence prior to
registering interrupt handler.

Fixes: 738a2b5e2cc9 ("ASoC: SOF: amd: Add IPC support for ACP IP block")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index be7dc1e02284..c12c7f820529 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -704,6 +704,10 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 		goto unregister_dev;
 	}
 
+	ret = acp_init(sdev);
+	if (ret < 0)
+		goto free_smn_dev;
+
 	sdev->ipc_irq = pci->irq;
 	ret = request_threaded_irq(sdev->ipc_irq, acp_irq_handler, acp_irq_thread,
 				   IRQF_SHARED, "AudioDSP", sdev);
@@ -713,10 +717,6 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 		goto free_smn_dev;
 	}
 
-	ret = acp_init(sdev);
-	if (ret < 0)
-		goto free_ipc_irq;
-
 	/* scan SoundWire capabilities exposed by DSDT */
 	ret = acp_sof_scan_sdw_devices(sdev, chip->sdw_acpi_dev_addr);
 	if (ret < 0) {
-- 
2.34.1

