Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F8E36CC24
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Apr 2021 22:08:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C9FD16EB;
	Tue, 27 Apr 2021 22:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C9FD16EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619554084;
	bh=TLaqSSR60Oszo+/jdTcckJYzNiK50Qpum2w6W+Ly1Ck=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DSubYZ68L6eBqSOcAStVlY6zv6r4eBassck85Q9T1Wy1zYa0hk03yoxjSOWskTP72
	 5VLCwKassZLLmFiUtrg4sirtbqKqxFwFG++wPJ3N/tSJ0ye6visVt4UNW2PtLqasuV
	 K5r9o5To3oigy6ok2/CazA4b1/yQ4vYN8CYdL1eQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A7BEF801ED;
	Tue, 27 Apr 2021 22:06:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6D22F801EC; Tue, 27 Apr 2021 22:06:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8027F800C0
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 22:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8027F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="OSWeZrP7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6e4M8KUhDQtJKXU0Bn08+0xmwwkuQCJ6VvAWucJgD41PwqNfPuukg54u/vCqi8c2y/DdWp9S7ox+Oie1Fk4CsP8Met6ertRLGCn9vk8dhSupCVkZAv7F43QcprM4i8IMvfzbHQGEr0Fuae7Sgd0rtUBkuDWFGXIhuFl6+F3gm+fBOA7ROeML0xvxxFgn5Ymdge9rkJ7ePuvKo+kpNz70cPsJXFtQApE3NxhzxQ+kO/DFwHhw9KLlfQ4Fmt7MwAEBCzmRJHIPB7P93EqhS5YrAMNv2UGbVLx1Awvfzkfc1Z5V3cL6YDTlURgx6jvKMbjOI+TF23FJJFGEF4zkexmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88i6vRRiW+iG82vyMnbmj6LmjXQgpY5zsYXhiiULLMM=;
 b=P8ZXMWsUdsfQVQuZHbbG7Cr8CL3a7JFo/94+R7g8NDHUfnqUiyZ454s2UDNRuisaqsJCOkvJ+H7aGofKa+IXbcI528DjGnBm1TwiiQFjC2cg35aKD2VJB1VpaD5Vmwru5Dnt2frpEKGzYNDAiZ+xsXO/1vew7RNeBcqIAnAgKxjESHNUg4ZoL0+ICRjzMaEtkaGSo1GRo5ckBAm6CARNhoaAJy4ihSwK0W9y9q5Hiln517DDnvg8ZUDocBoLc2xWlr/DqGNqT9L0cF49rc3sw/8zRvbCw4bzYIFx1FrV06aSD9uZET0y0zhFv6ysAMfmvReGh2EM7dUTYQEa7wRVMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=amd.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88i6vRRiW+iG82vyMnbmj6LmjXQgpY5zsYXhiiULLMM=;
 b=OSWeZrP7u1gXWUCGDghXqf9ZAtQG7JAku/agl85RN9xyEXHY76pTouqgKzp3fZIvM8LTbprnhWQYMEtWPTpnbifAFrT1paH1lbudJfK671zzDmHZszXtNVtt6pBhzWImytQvdgUXnu46fKDrvE75uACEftlZDMPIeFdaP8tuTEM=
Received: from DM3PR08CA0020.namprd08.prod.outlook.com (2603:10b6:0:52::30) by
 DM4PR12MB5085.namprd12.prod.outlook.com (2603:10b6:5:388::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21; Tue, 27 Apr 2021 20:06:20 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:52:cafe::dc) by DM3PR08CA0020.outlook.office365.com
 (2603:10b6:0:52::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25 via Frontend
 Transport; Tue, 27 Apr 2021 20:06:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Tue, 27 Apr 2021 20:06:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 27 Apr
 2021 15:06:18 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 27 Apr
 2021 15:06:18 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 27 Apr 2021 15:06:14 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] ASoC: amd: fix for pcm_read() error
Date: Wed, 28 Apr 2021 01:53:31 +0530
Message-ID: <1619555017-29858-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0a89623-7604-45d2-c71e-08d909b7ec38
X-MS-TrafficTypeDiagnostic: DM4PR12MB5085:
X-Microsoft-Antispam-PRVS: <DM4PR12MB50854385DED6A40C1C93C76497419@DM4PR12MB5085.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:51;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RX3eLAzcErjAJBvWN4IvxWTsV0OimoeKClmYkyPmGAw9WOEpSoOaeG7XRjRMDUyuInTy60plJMYzw0Zc6LqG8F0zCx+gzy3T1vx24QvzH+nFDtNFYGYlLohsdJfhxezBd9x/kL4MkRhk+0V38ot/QjmaPGz2VC9e1zXSyv/z+zA+QaeYJwm4EPHLFGPwjSOGzg4XMC2Mgo45ivwqjyED53MvUmDkawCStkXA0T1xKuTP2RWeRYSDxKDy4hJNctNkDjPDt21UpA4gBVa/6+/I8NJGSh0OItD0lUD0RTIS8HOUljIpHJI3+sW52VmcciOblvpGotyFFbmjEHfeNRSKyq1aFH02TvHP6YpMCoo92v/WnZBww6XhfUyVkvijgXY7p9630/hGagzEkjoGeFQlI/hkwFe9Dlp+3jfkUT647987WET+qziIomc05HnyX1JrxUds/qEFSoJp6aIREVwMh0+lq7oKNeSHbbB45pDOIjWqadVVT14GkMRw6QGrMrgkR0NPvHc45jwzC6mo9On2tkmhEdFTpK7l0CRJquLh1q3lTgj4pOyz+eBCUQY/B1pUvb+twUw/mIPOCf9bPNyplA1iViQQXOy9V1QQpveLw4EsJpDt+FZa9wmtHLpG1JvRbykI0AzYIxH6D7RF5n/45qhp5/4bQwkEkny18h1ezXkJlqwp+5+AMuew5JXexJK6
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966006)(36840700001)(82740400003)(81166007)(4326008)(478600001)(5660300002)(86362001)(316002)(82310400003)(7696005)(83380400001)(8936002)(70206006)(356005)(36756003)(6666004)(426003)(47076005)(2616005)(8676002)(336012)(70586007)(36860700001)(26005)(110136005)(54906003)(2906002)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 20:06:19.5475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a89623-7604-45d2-c71e-08d909b7ec38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5085
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, open
 list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 yuhsuan@google.com, Ravulapati
 Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Prike Liang <Prike.Liang@amd.com>, Vijendar
 Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
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

Below phython script throwing pcm_read() error.

import subprocess

p = subprocess.Popen(["aplay -t raw -D plughw:1,0 /dev/zero"], shell=True)
subprocess.call(["arecord -Dhw:1,0 --dump-hw-params"], shell=True)
subprocess.call(["arecord -Dhw:1,0 -fdat -d1 /dev/null"], shell=True)
p.kill()

Handling ACP global external interrupt enable register
causing this issue.
This register got updated wrongly when there is active
stream causing interrupts disabled for active stream.
Refactored code to handle enabling and disabling external interrupts.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 10 ----------
 sound/soc/amd/raven/acp3x.h         |  1 +
 sound/soc/amd/raven/pci-acp3x.c     | 15 +++++++++++++++
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index f22bb2b..8148b0d 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -235,10 +235,6 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 		return ret;
 	}
 
-	if (!adata->play_stream && !adata->capture_stream &&
-	    !adata->i2ssp_play_stream && !adata->i2ssp_capture_stream)
-		rv_writel(1, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
-
 	i2s_data->acp3x_base = adata->acp3x_base;
 	runtime->private_data = i2s_data;
 	return ret;
@@ -365,12 +361,6 @@ static int acp3x_dma_close(struct snd_soc_component *component,
 		}
 	}
 
-	/* Disable ACP irq, when the current stream is being closed and
-	 * another stream is also not active.
-	 */
-	if (!adata->play_stream && !adata->capture_stream &&
-		!adata->i2ssp_play_stream && !adata->i2ssp_capture_stream)
-		rv_writel(0, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
 	return 0;
 }
 
diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index 03fe9391..c3f0c8b 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -77,6 +77,7 @@
 #define ACP_POWER_OFF_IN_PROGRESS	0x03
 
 #define ACP3x_ITER_IRER_SAMP_LEN_MASK	0x38
+#define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
 
 struct acp3x_platform_info {
 	u16 play_i2s_instance;
diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index d3536fd..a013a60 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -76,6 +76,19 @@ static int acp3x_reset(void __iomem *acp3x_base)
 	return -ETIMEDOUT;
 }
 
+static void acp3x_enable_interrupts(void __iomem *acp_base)
+{
+	rv_writel(0x01, acp_base + mmACP_EXTERNAL_INTR_ENB);
+}
+
+static void acp3x_disable_interrupts(void __iomem *acp_base)
+{
+	rv_writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp_base +
+		  mmACP_EXTERNAL_INTR_STAT);
+	rv_writel(0x00, acp_base + mmACP_EXTERNAL_INTR_CNTL);
+	rv_writel(0x00, acp_base + mmACP_EXTERNAL_INTR_ENB);
+}
+
 static int acp3x_init(struct acp3x_dev_data *adata)
 {
 	void __iomem *acp3x_base = adata->acp3x_base;
@@ -93,6 +106,7 @@ static int acp3x_init(struct acp3x_dev_data *adata)
 		pr_err("ACP3x reset failed\n");
 		return ret;
 	}
+	acp3x_enable_interrupts(acp3x_base);
 	return 0;
 }
 
@@ -100,6 +114,7 @@ static int acp3x_deinit(void __iomem *acp3x_base)
 {
 	int ret;
 
+	acp3x_disable_interrupts(acp3x_base);
 	/* Reset */
 	ret = acp3x_reset(acp3x_base);
 	if (ret) {
-- 
2.7.4

