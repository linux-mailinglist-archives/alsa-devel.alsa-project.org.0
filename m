Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4978612BDB1
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Dec 2019 14:48:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C59E01796;
	Sat, 28 Dec 2019 14:47:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C59E01796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577540896;
	bh=lhygySWO0xZ54vcnIBlIIJGHMDgG3WEK+EEWmgSAdtw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XjPYnXzEygzk9vndUY3k2rH1WuFWeLZ+kmjsc9/Af0BiFcSh4mG6PqQ6RcOx+pyQm
	 NpX0xoHKKzeb/GaGq1nP+OMGsHUeqn9iOLmL4bY2DX3mZF0sy/K7UAOZYNTqlWut1/
	 umxYDOckDB1rlUoMd6XpX5FIDkoW0rycgt9/CHjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 910ADF802C4;
	Sat, 28 Dec 2019 14:43:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCDCAF802C2; Sat, 28 Dec 2019 14:43:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,UPPERCASE_50_75,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA1B3F80299
 for <alsa-devel@alsa-project.org>; Sat, 28 Dec 2019 14:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA1B3F80299
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="AQgtSQ3I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAOYMSU/O1CD1OuiPnQA7KoFaT+ZwlILbWXmPumY9fOiPk+1AJWqfQBaoEXEH2Dhg7+EB6q64SceR/t6M6XPgEYy333wKQHIEc51VrqOvT5m1hEP2M/NbKYXlf5D217+mjb7PV0lSmCJz2Z/Cgpp9DMAOEe9kE9RQoEwjLhKyVcofGd6vTryDsnJQZY6Mt2naPUne8FZZ0FPhcJBIZVcAYGzG/saIDX7OXKgYFNKynMcXkoaKqyM5rcnYFrKsHECCP+p9oQbd0uW9I2a4FYKgSaJrejZ6ukk9t+62ZiaidcBYCIKxmkKIz2gL+CLCW1qqeJpGxQ+AumGNPY/Jxxsvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qs1iC6WkRXnElFVdHO5iHBOqfRvBCxLOuccgTbnC/oU=;
 b=NAr7XKotT9nrsLjkRmFZh4AniqXJ21oh1ZEfiitI4oDFLeEG/YRwIPMX7GJxIKJJKGUkvHS0jC3kvH3CL2wThbLw30wf9kHFsqnvwIbNyV8uCzzaYLSdeTD2V1+hVnPA77TueH4eF3JWAWwc+Q4WOj2DmFLDAlKe49BYNJPfHF0gmp83jfSp8t8Eni4Z2E0cT97dvct2TyGwD9fR4lSe/UnZavB5GJHvTj/xgnEIxfmtv1P0WN9M34FbHJaoiYzxGTMwh0npFN7nkM0IyQer2X8JJ/RtzN+Agsl6JQf2+6kjLEeM87ONsRqY9JfV4/o8IUlP3wwsRAmI4q1hHztHRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qs1iC6WkRXnElFVdHO5iHBOqfRvBCxLOuccgTbnC/oU=;
 b=AQgtSQ3II7Cesr3n2SZQLVY3I7G+U6GdchjmJefxkLUEqydElTDdX50FRjmrqwDAHP0+KmIDNa6Az8JYZT75SFvsdw8OC+Bch2J2CMa07qNBHzubaMd0MoBcDnaYnqYTdALhFj/EAXMjJZlVFgpqzxNeDCDJBPCoWS3Or+NxXPs=
Received: from MWHPR12CA0054.namprd12.prod.outlook.com (2603:10b6:300:103::16)
 by BN7PR12MB2769.namprd12.prod.outlook.com (2603:10b6:408:2b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11; Sat, 28 Dec
 2019 13:43:18 +0000
Received: from BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::204) by MWHPR12CA0054.outlook.office365.com
 (2603:10b6:300:103::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Sat, 28 Dec 2019 13:43:18 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT041.mail.protection.outlook.com (10.13.177.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2581.11 via Frontend Transport; Sat, 28 Dec 2019 13:43:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 28 Dec
 2019 07:43:17 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 28 Dec
 2019 07:43:17 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sat, 28 Dec 2019 07:43:13 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Sat, 28 Dec 2019 19:11:00 +0530
Message-ID: <1577540460-21438-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577540460-21438-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1577540460-21438-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(396003)(428003)(199004)(189003)(86362001)(2616005)(54906003)(70586007)(356004)(2906002)(36756003)(316002)(426003)(70206006)(6666004)(478600001)(336012)(81156014)(186003)(8936002)(8676002)(109986005)(7696005)(4326008)(5660300002)(26005)(81166006)(7416002)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2769; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ce36e64-1915-44d1-2e6a-08d78b9be573
X-MS-TrafficTypeDiagnostic: BN7PR12MB2769:|BN7PR12MB2769:
X-Microsoft-Antispam-PRVS: <BN7PR12MB2769E1CDDAD257E42C4D42D6E7250@BN7PR12MB2769.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 02652BD10A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ZbX5p4uvpOcJ7fVFJBu3snCp0avmkGblr4dMh5ONBqZRfhbiU1EGb15p8HaFJzig5HZpxSvCpvu7vLOHcp/83nPMvcui9aT8nFKOjwmHT8Wx0tk50SPC/S/qXeYguG2VXHlKyf5ViTFG4P/E6VxUWALGpuNrLmqz4eccMlsM7d91hoAybseBVFndcrYTRnEhjo+SNv4xa+oPL5Oh6YFbDSHF954ow+n7Ez7ZBCwUeJtXCVge8JEtJWwaFhAKQhZ62CkWQYfBySusIKFRkCNib/s2QDGFe+ydIeGsiXL3wZYSjbCWVsFOspt3znExdoeiL8aKgnCgBP3ZRj80IuwGAtnIq1zLeXzOmfMG6NQvYGGYb2E/m4PGmM9P2deFFvTI6UaV+/11BUSILg6O5dOHwa0JVbHnXuCh0aNIGHCnVDNMS9a4hifr/zgZdzQJLlbMuDHziycnz8uaH/zcS6LBAa4C0y0ZkbqxuPvm4C/rIw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2019 13:43:18.1516 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce36e64-1915-44d1-2e6a-08d78b9be573
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2769
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "Gustavo
 A. R. Silva" <gustavo@embeddedor.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>, Liam
 Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 broonie@kernel.org, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>
Subject: [alsa-devel] [PATCH 6/6] ASoC: amd MMAP_INTERLEAVED Support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

ACP-I2S device support MMAP_INTERLEAVED.
Added support for the same.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 151daa9..5c3ec3c 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -21,6 +21,7 @@ static const struct snd_pcm_hardware acp3x_pcm_hardware_playback = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_BATCH |
+		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
 		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
 	.formats = SNDRV_PCM_FMTBIT_S16_LE |  SNDRV_PCM_FMTBIT_S8 |
 		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
@@ -41,7 +42,8 @@ static const struct snd_pcm_hardware acp3x_pcm_hardware_capture = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_BATCH |
-	    SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
+		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
 	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
 		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
 		   SNDRV_PCM_FMTBIT_S32_LE,
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
