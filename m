Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 185E03666BC
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 10:07:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C59D167F;
	Wed, 21 Apr 2021 10:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C59D167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618992474;
	bh=VVgK1wvm4NJYLYL4B4LaoBDkD/FrpoRdtdXfu9H7190=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JVLM8IH5dkf4wvTgNWzMWrw7TAf81Fao+m9Ber3Mi73b3jrwBF1MS2ENxC6JfIAgW
	 5M1bgUB1kNBh1ewCl651hKNHYw3I00E3nx5op1/epZhJ7DNBjFPVwn/lAcnaSx6MSS
	 5jqk6khVkkFNUJHQYnx7WggtRF2kgHgmrPq7PEwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CFCFF80256;
	Wed, 21 Apr 2021 10:06:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB153F80227; Wed, 21 Apr 2021 10:06:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B9C5F800FE
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 10:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B9C5F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="WhHxy8kk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kionR9k3itmrRO+eolAaBU1TXVAO06Y0bFcByIIJSLdrh5XViZmLikKFZkLB3GsGKvhJDt7T8Nk8LJ4M0dK13kjo8pa9L9rr+U/biOicSOmYmfgykubf8p/Vnx52P7Nfmyd4XajYMNWYGauM7Xna2FAihdvxDl+cftC+gnpYuwFoIk8kCnjS5AiJkpTlccgZpNBdUzBCWb2SmyPEEA3QLyx6tjWkQqZQNT3i7p/0an7im3OghhfSFQAo51cPHhx4SkQ4fY+2a7Wsj25ym1SSdUSQiPqo2XQMnKkCPXpT+JRA1AoX04yewyt67aS76PXWwkoLNUygTQRn8VBlY2EZZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxUdBpgvFbIJdR5BwP6Mwgbcbhw3f6P0+zfUXKhB5aw=;
 b=QbEZxgjpq5mJar5rH9DwDbN5V1SYYFURIXjiTKeeL0vMhDtjyfBnOI3apf6Epy9Ay3bKnHcBq2c2kr5Dzu+zHPq6+XoaBp05ZQD72DWrjfYjJMCGq12CgMNCb+wSnJMICgdI4RrMvfxishew9nDt4aCwZXzINy9d9YZ+9uB1LOeA+C1T4iCgYY13EQQXx1Pl82r5G4lQFYkYDK/YMCmsTozqyYyrw8qrTckFCKMoW4Aj7hM6SI/qBJwdh3n2CufCL4B8fMEsQKFkfyDU28ffkfALuOtypFiy5HsM2Vl243XqBKa1qkH2a1LcMO0hVbIDViaDJDLlOPVfpmP4Eg555A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=amd.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxUdBpgvFbIJdR5BwP6Mwgbcbhw3f6P0+zfUXKhB5aw=;
 b=WhHxy8kkBvwk1jXfBbsLnQHnF3Fg3QREY9zDkVbTiUnI+JSHYwGkFai7tL8aCCPP4s5R6a5w2QLZjZkKq9KTpFxsX5bDgQKi298Vu3yo686zw4YWXNNzn29HWGdccFiSo9ChWIn06crnGgdFFNJelWjFjt1J0CRpsYd5Q00NLtU=
Received: from BN9PR03CA0411.namprd03.prod.outlook.com (2603:10b6:408:111::26)
 by CH2PR12MB4087.namprd12.prod.outlook.com (2603:10b6:610:7f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 21 Apr
 2021 08:06:03 +0000
Received: from BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::26) by BN9PR03CA0411.outlook.office365.com
 (2603:10b6:408:111::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Wed, 21 Apr 2021 08:06:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT007.mail.protection.outlook.com (10.13.177.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Wed, 21 Apr 2021 08:06:02 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 Apr
 2021 03:06:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 Apr
 2021 03:06:02 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 21 Apr 2021 03:05:58 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: drop S24_LE format support
Date: Wed, 21 Apr 2021 13:53:11 +0530
Message-ID: <1618993402-10354-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d4c85e8-e844-4871-6f49-08d9049c4e99
X-MS-TrafficTypeDiagnostic: CH2PR12MB4087:
X-Microsoft-Antispam-PRVS: <CH2PR12MB40877291F76D9CBE53F9290397479@CH2PR12MB4087.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JhPBa6Dl9uyx9tj9XKbmKtfm/+u8SxcP1Q9dC8IwJvBjBDkGmwAGoC969Z9lubvh7ORc6d0mmYYZgrDAxfbHDNPPUUisCkvH48P/I6auNUkOGMN9gB+h3ckFNmiQtunqqDk2zZRu6ZUzvukJO02d5ipQTbTuB6QwhGu85CpMtcGiF6DXIBSxBnZfGufsd7HtLoatdlME80g3TWHudANjOnASVRiWhws1eCrgeASBbNwgJh2yR9mBsrbXnc80bwsjuTWoZ+DDzs2QB7aaewd/K75ThRcI3oaiO4yn37qes+5UCdrdWy/rDpmK6Ry8BL3dh9YMVwGruSZulA0hZzUOrZqcWwPmrhFzcyNYb3NnA8FW04dA2U1lPgBUwkZGO+wPPHcc6vgM8J2DcKElE6Vlt1QO6WldLOl+uoDs/7V0LjGVH1gbza2PMoWlvnPoBnYSAtB02EHGpQxgPgW4HjMzQqPng1rvdgxsxQfGJK8G/MllOA+qmhk63tDbbxXj3enTzrMjblDo/8nrRUk9iZqoFrGdbnnJQHp8mjQQVwGIxTAo8J5BjfkPLv9CBznskSRhWX3QgfX0DHaNvNADvtd8IS/Pl8fD9ktKzxGD5ExClRmizhiJhJaox9RdiCL0vPDhFcSmzFO4e+C2rrITAWpRr31OQhI3O+ioH1UeVhM+VR6ARy4OZTX+u04sUMn3YCny
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(36840700001)(46966006)(316002)(8936002)(81166007)(70206006)(82740400003)(83380400001)(8676002)(36860700001)(110136005)(4326008)(356005)(2906002)(186003)(478600001)(36756003)(7696005)(47076005)(82310400003)(6666004)(54906003)(426003)(26005)(336012)(2616005)(5660300002)(70586007)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 08:06:02.9293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4c85e8-e844-4871-6f49-08d9049c4e99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4087
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Akshu Agrawal <akshu.agrawal@amd.com>, Ye Bin <yebin10@huawei.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

AMD I2S Controller doesn't support S24_LE format.
Remove S24_LE format support from ACP DMA driver
and CPU DAI Driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/raven/acp3x-i2s.c     | 6 ++----
 sound/soc/amd/raven/acp3x-pcm-dma.c | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 396cb7d..de6f70d 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -264,8 +264,7 @@ static struct snd_soc_dai_driver acp3x_i2s_dai = {
 	.playback = {
 		.rates = SNDRV_PCM_RATE_8000_96000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
-			SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
-			SNDRV_PCM_FMTBIT_S32_LE,
+			SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
 		.channels_min = 2,
 		.channels_max = 8,
 		.rate_min = 8000,
@@ -274,8 +273,7 @@ static struct snd_soc_dai_driver acp3x_i2s_dai = {
 	.capture = {
 		.rates = SNDRV_PCM_RATE_8000_48000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
-			SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
-			SNDRV_PCM_FMTBIT_S32_LE,
+			SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
 		.channels_min = 2,
 		.channels_max = 2,
 		.rate_min = 8000,
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 417cda2..f22bb2b 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -24,8 +24,7 @@ static const struct snd_pcm_hardware acp3x_pcm_hardware_playback = {
 		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
 		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
 	.formats = SNDRV_PCM_FMTBIT_S16_LE |  SNDRV_PCM_FMTBIT_S8 |
-		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
-		   SNDRV_PCM_FMTBIT_S32_LE,
+		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
 	.channels_min = 2,
 	.channels_max = 8,
 	.rates = SNDRV_PCM_RATE_8000_96000,
@@ -45,8 +44,7 @@ static const struct snd_pcm_hardware acp3x_pcm_hardware_capture = {
 		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
 		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
 	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
-		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
-		   SNDRV_PCM_FMTBIT_S32_LE,
+		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,
 	.channels_min = 2,
 	.channels_max = 2,
 	.rates = SNDRV_PCM_RATE_8000_48000,
-- 
2.7.4

