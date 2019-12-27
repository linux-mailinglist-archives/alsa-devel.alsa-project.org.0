Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8528112B4AA
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 13:58:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2759E173D;
	Fri, 27 Dec 2019 13:57:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2759E173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577451502;
	bh=tRBO8hRHMfefj+aJ6WkF+peZIbfXXC43uVYD1xk+ypI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rQL8PXpy8ICC0FUQeCs2VJBJp0fo0GbBoKSnnGXVzEMNa68sVco/HgIs1GqEVrXtD
	 oBO/YQZK9+VPSd09TF3C7AFap6JOpNuckcuRkNeE8cdhbSXEsr2T5P06oiQhJQ86mX
	 Y8AYwQapLZUzFew2zmr7MQpafcB/RKfbHVvGBjhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC31DF802C4;
	Fri, 27 Dec 2019 13:53:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54056F802A1; Fri, 27 Dec 2019 13:53:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,UPPERCASE_50_75,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680081.outbound.protection.outlook.com [40.107.68.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CBCFF80291
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 13:53:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CBCFF80291
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="F7E/yyUB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2kwRSOaQ30a9jvNsjT9N9RYR4AyypRm2/yD9FUPb6xnnvUFsn8oPCT88IvicyXmkueoBTkBvZ/M6oZWNhzFVxSRbdOmE55EhwfozSZJ4EDd3GS4edGcePl8cZUFNXV1J+u86YP/j+51xuvzT51D+jnermSF9T96oFMcqHTjXAIrJ0XcOxeXGXP16Xu2iKjMNIBxOAItrY7c0Ik0JGBmmgxyMzsh9SSKHeFjA7iDnEeKtigBU2VECmmGkutBAbi1ugENnfCJzDApytmqsa4TE8/cG5n9nX8HlUizNj6AEsoxZ03fbNSjNsdzvul+seXdVAeQYqVggqnci3RWPp4fyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApmNX5ikvgoKwJVRrmgjW5z/ed9zionyy6WDW7x9I6s=;
 b=C0dfzB1GCWFn4OrDP5t6J8+3h1xGIdaCPy8TFk9WtKlhBrfwiLF7Ky2n2jyYi1GPAb/FLhuHDdt4pua8oS1puFGsAvHClRASQFdgzBqWg6BDfzP4GqgAJshnKpLBve8Xal+CBEI5AbiREbQGcxWH45R0pMJbsb0n0fR5HjiezHwcn/M5ZEDMhK5i0qv+GThJ85XsGLxxlCxpUgMhnpGkS214WUZxT6DhejR3UCfjZm2ipSSrTd+4jEahgdwEp9+JCnvE0pX6r+g96x96QwZJdcuBD5U7t2p39Jr0muZ7ZjsVApds2XcSMft2Rm0HkCs6QQFStSyHrG0ZENUHbk5WCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApmNX5ikvgoKwJVRrmgjW5z/ed9zionyy6WDW7x9I6s=;
 b=F7E/yyUBsm31zZ1lZrpfcEMiJGSQdpO/0TNQlzoMPzjiSfkXl+bnK7gcnoXz0l9wnNB6mvxMHohpzo6o1GTJ9nGYTgalEb2yOGLhXvrU03nhCy4yR2hp7qutCE0+eu7IZXR/FOD/NASiBqUG/4db1gWhSMG+yUQ2cIQnsCtEfYw=
Received: from DM3PR12CA0118.namprd12.prod.outlook.com (2603:10b6:0:51::14) by
 BN8PR12MB3091.namprd12.prod.outlook.com (2603:10b6:408:44::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Fri, 27 Dec 2019 12:53:29 +0000
Received: from CO1NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::206) by DM3PR12CA0118.outlook.office365.com
 (2603:10b6:0:51::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via Frontend
 Transport; Fri, 27 Dec 2019 12:53:29 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT010.mail.protection.outlook.com (10.13.175.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 12:53:29 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 27 Dec
 2019 06:53:28 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 27 Dec 2019 06:53:24 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 27 Dec 2019 18:20:55 +0530
Message-ID: <1577451055-9182-7-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577451055-9182-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1577451055-9182-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(428003)(189003)(199004)(8676002)(2616005)(81166006)(36756003)(86362001)(478600001)(6666004)(81156014)(356004)(8936002)(426003)(336012)(316002)(70206006)(70586007)(54906003)(4326008)(7696005)(2906002)(7416002)(26005)(186003)(5660300002)(109986005)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3091; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 228b49d0-4c54-41b5-a74a-08d78acbc59f
X-MS-TrafficTypeDiagnostic: BN8PR12MB3091:|BN8PR12MB3091:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3091B13531A31768EEABBDF9E72A0@BN8PR12MB3091.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0264FEA5C3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E1E+LiyBP5wL+rSvDx3Yr6JPpGQ0W89hqV8bBbH2orrPZavZP94hbFOHn1rRYAjqcEAg9kpy2v4FU/E7kt41xz7wqYhHaNQjILaObEOUIGjU3lo498thww1TBhA1YztjjFD8srIfj1cG5bFwQqnkKK/n/0EyXc+wW/2JUg+U3Tx5hWGV8BAtO1E3fe+UCCiTBHi3Kk0XbXBCULSH/OA9chK5hDXtyzUvei9QE2+FfeE1goXMudg6DePv1Z4oOWHlEMEUCvAj0k28Uok5OTBSNfI1fdL5Uj0y1K2m6Zisi0BMbl07lPiqq1y25zUXsR7u6xfr37nGUFgLiyL0g2xf0zsJKYOkYkViBOY5cVwzl99hEfcxok0tXUGc3JrQ6SetxPTPIeANh+CtyFVlJArLGSJ5YvglvM+PRyJag6HrKi/b9jNUV2RHIewl4AkI0cceiejjzzbqTmjhmeYAdB6XAjvd4sF47c/KXjLYP/0Jum8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2019 12:53:29.3182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 228b49d0-4c54-41b5-a74a-08d78acbc59f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3091
Cc: "moderated list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, open
 list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, pierre-louis.bossart@linux.intel.com,
 Liam Girdwood <lgirdwood@gmail.com>, Ravulapati
 Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, broonie@kernel.org,
 djkurtz@google.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Colin Ian King <colin.king@canonical.com>
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
index 7045a34..aae7ec6 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -22,6 +22,7 @@ static const struct snd_pcm_hardware acp3x_pcm_hardware_playback = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_BATCH |
+		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
 		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
 	.formats = SNDRV_PCM_FMTBIT_S16_LE |  SNDRV_PCM_FMTBIT_S8 |
 		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
@@ -42,7 +43,8 @@ static const struct snd_pcm_hardware acp3x_pcm_hardware_capture = {
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
