Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5222010EB62
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2019 15:12:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3E9A166E;
	Mon,  2 Dec 2019 15:11:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3E9A166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575295963;
	bh=9j2ROZY7damFVvOM771hxBtCQkKlrmhiTFB01Q8/G4Y=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SFV1aDOd44sDly3vOWiZ+GvSaiIbKTuFX4HjMYqsNkcG1F+z+7pGVOsferuCgEseb
	 QJruVSiKb6djvxCwVV/d3D6uZWQ5pT3e0crym56/84X2h+I6iQFZPET636aMk4mMvO
	 16fAVs5dShH7jtp6vMNOlj65sYc83/iQ5bUUfLCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53F9FF8028D;
	Mon,  2 Dec 2019 15:07:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB639F8027C; Mon,  2 Dec 2019 15:07:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,UPPERCASE_50_75,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750054.outbound.protection.outlook.com [40.107.75.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8B5CF80265
 for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2019 15:07:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8B5CF80265
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="PWxzJAHK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7E1vgoesIQSi4TXR4eStbD6C4z3iSCeRghGKe1k2GFWYe5/T7sO8xZ/1IvuodmcGIqz6MvF4UJxnBOIUm3C2FvAgNiSNJG3PnDzoV8+p5VGVW+mVySCiAYxPoeWuX0hbMZrBrFyXTsykTFtXagMsYQuCEwlSx02jQArHdu/+2+M5gZqr4E6jNV7uJrnqZtBmNSkMCcZTgRBUsAioexbKG+kn4JnS26AosNIVYPJc4n5gYid3Ep7fXz1jox9N2coehuWqbkztPtNBdg457LBwCy6bp8UiZbb8nmjDShg3WcpZOMsomhVowNm6V788OwMzixWL5Ft9gpF2t+Tsys99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jl9TdWDTaZX5XCZNEfhbVKPeI0Lh5VXqOnTgqPScIA=;
 b=GJ4Bzl6n096RkfkWeA5BUzfxKH3vmB8BtCfGJy7gsVukBuyT8y634qvHF/2emN2qtkosmusb7R4RapTe2ftAO+8j5n6lCjVm+txckaEx9hiuDgqOZNlWI2s1kikBMSsJs9bGr7nIERbWmmIPhQlnSHlJ6b99znlc90ZqaahWlkOeBFod4PwcaIFqujTUbtx0PVkYDfxJo/DZIsEvf7pYTrSpez3L/VQp+bDYaRPgiuwPeJCp+EYBhNf35Ft1s3vmePhsOmN3f5cM3DjhVwG6qi+oZcMqH362VC9hsDYg/HDKnZQZp4zW/+t1qhdhap/6BiFKSIPTj+gW4lZgniHCow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jl9TdWDTaZX5XCZNEfhbVKPeI0Lh5VXqOnTgqPScIA=;
 b=PWxzJAHKGEOYjCw4GuQsxfz/W81Vs9pDjp0py4AcX+HM+sS5Lq/1Rr0mkdB6/XrWl0iS+/ExZ9yTYCdJWVapL55urBopnA/7eTY46+1kcRc6dLdTxMJHcTy2KqAF4AsPbiOitfayWxBnPSo7UL/jZLgfE4FeyMnikagkSTbufm4=
Received: from MWHPR1201CA0022.namprd12.prod.outlook.com
 (2603:10b6:301:4a::32) by DM5PR12MB2438.namprd12.prod.outlook.com
 (2603:10b6:4:b5::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Mon, 2 Dec
 2019 14:07:05 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::205) by MWHPR1201CA0022.outlook.office365.com
 (2603:10b6:301:4a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2495.19 via Frontend
 Transport; Mon, 2 Dec 2019 14:07:05 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Mon, 2 Dec 2019 14:07:05 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 2 Dec 2019
 08:06:56 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 2 Dec 2019 08:06:53 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Mon, 2 Dec 2019 19:34:41 +0530
Message-ID: <1575295481-9076-8-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575295481-9076-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1575295481-9076-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(428003)(199004)(189003)(2906002)(53416004)(109986005)(478600001)(86362001)(26005)(76176011)(4326008)(14444005)(7696005)(51416003)(7416002)(47776003)(186003)(6666004)(356004)(54906003)(305945005)(336012)(446003)(36756003)(8936002)(11346002)(50226002)(2616005)(5660300002)(1671002)(70586007)(48376002)(8676002)(316002)(81166006)(16586007)(81156014)(70206006)(50466002)(426003)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2438; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7d25634-44a0-4959-7692-08d77730e958
X-MS-TrafficTypeDiagnostic: DM5PR12MB2438:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2438208DC4A5770946EFCB87E7430@DM5PR12MB2438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0239D46DB6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wdcHhHNXTMc/4CUke8VpQdo/J10sU0iYCmxzVxW8KhAB2ElsRq36qdCHWK5nzQsdKzu/sFl7sJu3KfxNYBqof+TGmV2wu3/dtatQ1+6a3jI0jZbWd0iF8CR7ix7cpSI0EW1JQN3zferA0wO/VPCrW8HPqBVVUb8e62Vt3TSx54ZAcxTxkSjSQ3iIk9x01EuqSSQyJoPqRJBRICUnSu/esM/w2rJfXajp7KF9qJdctuNcBTJcZu17Ul4/3aam5dG2+3Xiw6znZGPcqIfaf5xeU7tjqeuMFW+hDSpfo/5bq+wR2TLWHviABzT4IMkpopDzn8zXUufXPt+g/5tGpgTwwLXzt4GeBRJn11aRc+6uf97dxMbZIsAjU8fwaNBm2OToiRpjd0lNaNBWFqC/XiCQXBg34D+6eslIRt7cwIom1u3p1WRuR7Isj7xO0iBUIh4+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2019 14:07:05.2398 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d25634-44a0-4959-7692-08d77730e958
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2438
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, pierre-louis.bossart@linux.intel.com,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com, Colin
 Ian King <colin.king@canonical.com>
Subject: [alsa-devel] [PATCH v13 7/7] ASoC: amd MMAP INTERLEAVED Support
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

Our device support MMAP_INTERLEAVED.
Added support for the same.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 916f0d8..28a3081 100644
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
