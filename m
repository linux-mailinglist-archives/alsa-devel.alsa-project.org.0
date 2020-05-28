Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB761E59F3
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 09:57:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33CC317D5;
	Thu, 28 May 2020 09:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33CC317D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590652654;
	bh=4Xff7SmhNvPgsnDOZ4H9IcYgNqCOoO/bVcBFNp3B3lg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XvMzte5nLJZQ+JQGJDPFQfRUMEkA+I5JP5en6ohybHSMUcceWexKo76FLlo0iugGe
	 sJn/zmN6sLgmQa/zcT5kgzL49cycC1zsyi9VUqnK3k3YwYJ+tCA3fwkLSRCRzqJZLZ
	 h6GYq0HeLoNleB9Zl5rIvYWHVGegv2FHfrK7mW7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C973F800E4;
	Thu, 28 May 2020 09:55:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F990F80150; Thu, 28 May 2020 09:55:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B7DFF800E4
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 09:55:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B7DFF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="qoTiOd3I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUnae30IiMLYGToJ0tD0dR6bIZg0g9JDgZUOO3EiYjmER3kHUpnsyr+H5Dl9KDmZRk9ysLa98irecUWd2qogjIUX2gtHockp2Hs7g4z1xdBCuaIs2kF4BLSd4UlSAf0hRaxBOt2azR44G7lRdo5HBFGV54WRX4VeySi9KBvB1Wl2I9OR5ORiBGvpWqtcrrClZL3FloRI/lMzmrK68B9FfZ086Ian9i8he/PqUsaa2M1qYl/NuYNu5i3l8wsW5QHpcBadnMhWF7U0qqRQOes0BPfWTA5UZAgff71nl5VkWtfUxRLxLz1Oxg/XDqSoLgwS2x8T4ueywMrrRng7sZYK3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KASRA/0a7qd0wphlXj49kDm6f9PCqbkntlDH6XcuQE=;
 b=S3P8+jSN9ZsoI9EqVHwQNiC7ptVd5iAfVel7q6JZ0Touc3gSkNLMjCTBSsz6SyC4UF+ScoRK4IXzA2Oc74UzyO/c3KZPyJm32N9KCJkJxse2te9z6KH0/Ghdl7KsIXp9GDAFJustz843NVPg0EBlMHg+HiI/67JVgYw3XhhJl3bIo1EEdEhDIy1QwEKn5L6nfeVCszYXkWNs8X1x+ktd94uiEaH7QqLGWQpTzNQKnzMafp4UZiHJYZLOsb2Ns6SEomAx4xrf9B/aC/H9nnJRum+pFrOxZKUm6NkNH07t7Pt8P/Wg2PyGHaeMLrKoCezbar/H8jPF4Ktrvtus1SdefQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KASRA/0a7qd0wphlXj49kDm6f9PCqbkntlDH6XcuQE=;
 b=qoTiOd3Is2GjgFDnl3ZINJTxQyAM4fihoRLzEk8YXSV+VcHWBXWf+Lpz6rDgRjwJD1OfZUnhA/78Zun+DXgUoHiSFARjBB796AlUuYQLEjw3lKX7Mtm5E+bRzky4sGExlDo/XVCYNSt7MmokHoLlHMXDfKz6uQYsolW6gdKoLfQ=
Received: from DM6PR18CA0019.namprd18.prod.outlook.com (2603:10b6:5:15b::32)
 by DM5PR12MB1531.namprd12.prod.outlook.com (2603:10b6:4:f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23; Thu, 28 May 2020 07:55:42 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::84) by DM6PR18CA0019.outlook.office365.com
 (2603:10b6:5:15b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Thu, 28 May 2020 07:55:42 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3021.23 via Frontend Transport; Thu, 28 May 2020 07:55:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 28 May
 2020 02:55:41 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 28 May
 2020 02:55:40 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 28 May 2020 02:55:35 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Subject: [PATCH] ASoC: amd: Removing unnecessary instance initialization
Date: Thu, 28 May 2020 13:22:16 +0530
Message-ID: <1590652337-21587-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966005)(82740400003)(6666004)(36756003)(316002)(5660300002)(82310400002)(83380400001)(478600001)(2906002)(54906003)(356005)(8936002)(81166007)(4326008)(86362001)(47076004)(70206006)(336012)(186003)(2616005)(70586007)(8676002)(7696005)(109986005)(26005)(426003)(266003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 068254b6-7372-4805-08b1-08d802dc84d7
X-MS-TrafficTypeDiagnostic: DM5PR12MB1531:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1531E95E928AFA026BF8C9E9E78E0@DM5PR12MB1531.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-Forefront-PRVS: 0417A3FFD2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TnS+45s9vl61SdyWS3N9Y88a5LbKfiKh4uip5pDsXE9SlKKfLWixrMuZsYFStekXVEJkbFlei6oA79kSYY3loLJqLXLRQgchnOvCrfThCatcX+iYaaD+S7ftU1mNOzQ6sj6zFjznjKWuU6AAb2zxbnIdOe8/Dft4s8zKSgito8H46f5Xs5tDgYae5u8Xcm5AFF0AEs3Z9YIcTCCCA0woNgc9xkQ1PTCy171++KmYJK5nyw3VTo4Fh92xtwZsjYemcc45k7ML+vOjUZycfrth5GeefDpR5DUq3QJGrfAjoNWByiva6JKWs3p2CpavEO8ZgHVy0g7SQ93C9n3EEGOWSZsClQn4XkyVlxKmVTngZR4o52rx4AK4zOuH2/wvAFJFG3GAkFPax/mTNRhSQ0HHBX1IfTzsvs/Zcwv6fx/3I/o=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2020 07:55:41.6821 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 068254b6-7372-4805-08b1-08d802dc84d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1531
Cc: "moderated list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, open
 list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ravulapati Vishnu
 vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, broonie@kernel.org,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>
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

In DMA pointer the initialzation of instance is of no use.
In fact it will reinitialize the instance variable which is already
opened and functional.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 620b568..d8f554f 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -303,7 +303,6 @@ static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *prtd;
 	struct snd_soc_card *card;
-	struct acp3x_platform_info *pinfo;
 	struct i2s_stream_instance *rtd;
 	u32 pos;
 	u32 buffersize;
@@ -312,13 +311,6 @@ static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_soc_component *component,
 	prtd = substream->private_data;
 	card = prtd->card;
 	rtd = substream->runtime->private_data;
-	pinfo = snd_soc_card_get_drvdata(card);
-	if (pinfo) {
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			rtd->i2s_instance = pinfo->play_i2s_instance;
-		else
-			rtd->i2s_instance = pinfo->cap_i2s_instance;
-	}
 
 	buffersize = frames_to_bytes(substream->runtime,
 				     substream->runtime->buffer_size);
-- 
2.7.4

