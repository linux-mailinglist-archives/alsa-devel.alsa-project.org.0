Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C321FEC80
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 09:32:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23AD8173A;
	Thu, 18 Jun 2020 09:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23AD8173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592465555;
	bh=9Qc3rITLbqg77thfQjTWM7IBjc6vrFW666xmqH05GsI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=STPRHD+rKp0tw65uCL7T3zqKXVzquN4PjRLRQkpcVE2uw9ASOn94R6xIOtPDdRIUT
	 iigNpUURa+Agx2H7fVmw5lUpW5AHDvk5zDW/USwQkCugaFppmMaARoVNIHr/9Hv2tQ
	 qcrT+PKKdUQJgsf2q7w+kel4aUlKtD/+xKqM/8OA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 486E0F80101;
	Thu, 18 Jun 2020 09:30:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F433F80116; Thu, 18 Jun 2020 09:30:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2076.outbound.protection.outlook.com [40.107.92.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B6B9F80101
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 09:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B6B9F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="jII+dT2X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NoosOumjT6/DdGE9Xc5AEZ9AYwLOgiTo+j7Bk9C99CmIMnO9B4AwVzBcv01L2nEiylVDjNJylkOosMVKVgYS6RyVORRq7/HHBzXC2ASUgIclOybsF6+F3DaiVXxx6r7FoFpzV3hts/11CezOEsvXT3FaKCVK4qUicNCD62n4ugxDmFgxSnlAfZvbc+apZ2rZT8A+s8eUsUG7eeB4faTkoLIkHxnZRG+LzcmAttDhJ03sejqKIGsOJWvKHYx0E9Zp0UyqLSuh1Pjr6WmkckkGTJZUEuJdndk+bvQ+7pKBhj7LwY4owyfCg1yYJcYUd5oK4eXVBPK4GG//KZ9JTw5MlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALhVsoPAVJX01zfIW6EyznoLOnqnzDPiCsGfkEto1iA=;
 b=WBIevZzHjNVy/sTFhmVjm1aArmBJBt0XdrkpHXM5x2czXlrqCgmim7Bil26dWCh89TwkS1qg+39ck2spFkB0iv5HLfWU/C/MYvR9vMAs4CrGNLk25BVRbnnTRCp0BN+X6cqjs8YyNvGYLBjG4wwoFgIoxoAHA/qgwxaXm77IJbXT8fJx0/NzIRseP5PjyOSc+UtF97ZMRX2JL6rhQNd91oHMGroPdWhrNqtvO4jNaiLtEu1y53SzMLdOwSxGJNam4ACXq/ckQMuHEfEnrF4RF5uMyOLvBvyVE1HjlXr1piVDuSEzOJRe3rJrpOWH5NATs73aEi6Nv8Y782PjGmGSew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALhVsoPAVJX01zfIW6EyznoLOnqnzDPiCsGfkEto1iA=;
 b=jII+dT2XgENy6kkpsiPGPh2bgU5gygzkhaNeQKZi+J4yYv4gFoXOqvo9TUE+hkKMyXUW5Ln2IloSY1VTc+wTcgg1RxORFn6jzOzjT5v9Rkbp7qH7NY0owpRNmk1zPNDqAnrZxw2fYUDR8e4IdELbtHH9z0XvE3xw/HmylDI9WSs=
Received: from CO2PR06CA0055.namprd06.prod.outlook.com (2603:10b6:104:3::13)
 by DM5PR12MB2439.namprd12.prod.outlook.com (2603:10b6:4:b4::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Thu, 18 Jun
 2020 07:30:40 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:3:cafe::be) by CO2PR06CA0055.outlook.office365.com
 (2603:10b6:104:3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21 via Frontend
 Transport; Thu, 18 Jun 2020 07:30:40 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3109.22 via Frontend Transport; Thu, 18 Jun 2020 07:30:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 18 Jun
 2020 02:30:39 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 18 Jun
 2020 02:30:39 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 18 Jun 2020 02:30:35 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Subject: [PATCH 1/2] ASoC: amd: Removing unnecessary instance initialization
Date: Thu, 18 Jun 2020 12:56:10 +0530
Message-ID: <20200618072624.27047-1-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966005)(7696005)(54906003)(6666004)(1076003)(316002)(336012)(426003)(2616005)(36756003)(5660300002)(8676002)(70206006)(86362001)(26005)(186003)(109986005)(356005)(70586007)(8936002)(47076004)(82310400002)(2906002)(478600001)(81166007)(83380400001)(82740400003)(4326008)(266003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8ed3416-402c-41bf-0731-08d813598070
X-MS-TrafficTypeDiagnostic: DM5PR12MB2439:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2439570A1F621443B907BF76E79B0@DM5PR12MB2439.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-Forefront-PRVS: 0438F90F17
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 77nzCHOs3pmFrgVfn+pul8qPOi5yHZAlORlBByErSgwgQHPijji/iIn4Nk2eD6cIqcrgvqtje09Tn1qvSvUtHQyEcKQeFxzS0A95oj8gk2fWfpZ5znH3baqNbD3huVv89NK7Slv71fJHag/mEzlTNGPFfm1hZDg+1x+gJYZi2eoqxLk68C2+t/v0ven1XIZI68931b9faz0wCgu8oBORqVXAIfFhTladpnjpusGQsX/kwm3NPnyTHsDuU4Xshvo+KxRT+kiYnjJpYVobWmQwrv/tBDF3D4CF8Jl2d+X5d7eVwAWg0rdsVkZlxPa11tl0wwSo5lfgw5f4CCVhKzQ9WrMrN+jNpjJdG5IPE0/AcbJcYK3ZUYXKNTulseMOvr7A06wUZvrrt8/FhOVUq9abN/9IMBYQ0PfwHySm1WWbLVE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2020 07:30:39.9048 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ed3416-402c-41bf-0731-08d813598070
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2439
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>,
 Alexander.Deucher@amd.com, Akshu Agrawal <akshu.agrawal@amd.com>
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

In trigger we already get the selected instance details
from runtime->private_data.So, removing the local
initialization which may corrupt the instance selected
details and this leads to corrupt data.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-i2s.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index a532e01a2622..14607563abd2 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -151,20 +151,12 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 	struct i2s_stream_instance *rtd;
 	struct snd_soc_pcm_runtime *prtd;
 	struct snd_soc_card *card;
-	struct acp3x_platform_info *pinfo;
 	u32 ret, val, period_bytes, reg_val, ier_val, water_val;
 	u32 buf_size, buf_reg;
 
 	prtd = substream->private_data;
 	rtd = substream->runtime->private_data;
 	card = prtd->card;
-	pinfo = snd_soc_card_get_drvdata(card);
-	if (pinfo) {
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			rtd->i2s_instance = pinfo->play_i2s_instance;
-		else
-			rtd->i2s_instance = pinfo->cap_i2s_instance;
-	}
 	period_bytes = frames_to_bytes(substream->runtime,
 			substream->runtime->period_size);
 	buf_size = frames_to_bytes(substream->runtime,
-- 
2.17.1

