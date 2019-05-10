Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B066E19636
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 03:35:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D5C2193A;
	Fri, 10 May 2019 03:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D5C2193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557452130;
	bh=XvIyxmfwTnoLmRzLaTDisApCP3/EwyOIwsSSW5Bnk4A=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p8vH9IfUrwyzp/S79RFWeCSr+L6hnHFWrOcCyv4UPuBNJysERUoFRwY2AHhWxl2YE
	 sVHi3nE8D/4Y4bn6D1cj+gch5yF21N/T8fHCFRNxfbyylVMh/vFw0xE65LqgokO+rC
	 InJg8UV1iPHW+0DP+XkAh12c50cqzHKdQoAAa1Uo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60421F896F5;
	Fri, 10 May 2019 03:33:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7D32F896E6; Fri, 10 May 2019 03:33:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800074.outbound.protection.outlook.com [40.107.80.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F5E2F80730
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 03:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F5E2F80730
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="qCun+QB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoN+FfYc4NdyyWXFTNn/3MZPAa1Ny6z2h145bQ0u6l4=;
 b=qCun+QB0hcjIk8idFkI3haXG2G/wpAvuHV2wQN0+Cm3NN5WGWtA8WzN6DgLgZnkMNj6HO61CRH8Og7QW9WbIAbhSz7zXnB79O40xBo5eXVFD3XPQDbx8kqY6PXaQeNHg2GYs5WR+57uHIunSpnvNip/C9m+t58JLCELiHd2JNl0=
Received: from MWHPR12CA0030.namprd12.prod.outlook.com (2603:10b6:301:2::16)
 by DM6PR12MB2665.namprd12.prod.outlook.com (2603:10b6:5:4a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.11; Fri, 10 May
 2019 01:33:33 +0000
Received: from CO1NAM03FT014.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by MWHPR12CA0030.outlook.office365.com
 (2603:10b6:301:2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.21 via Frontend
 Transport; Fri, 10 May 2019 01:33:33 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; embeddedor.com; dkim=none (message not signed)
 header.d=none;embeddedor.com; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT014.mail.protection.outlook.com (10.152.80.101) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1856.11 via Frontend Transport; Fri, 10 May 2019 01:33:33 +0000
Received: from LinuxHost.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 9 May 2019
 20:33:32 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: 
Date: Fri, 10 May 2019 07:11:07 +0530
Message-ID: <1557452486-13396-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(376002)(39860400002)(2980300002)(428003)(189003)(199004)(47776003)(53416004)(54906003)(16586007)(316002)(4326008)(109986005)(486006)(426003)(2616005)(476003)(186003)(305945005)(126002)(26005)(336012)(77096007)(1671002)(68736007)(50226002)(8936002)(70586007)(70206006)(8676002)(48376002)(50466002)(81166006)(81156014)(53936002)(7696005)(51416003)(72206003)(36756003)(86362001)(5660300002)(356004)(6666004)(2906002)(478600001)(42413003)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2665; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ead55090-8df3-4548-1e53-08d6d4e783df
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:DM6PR12MB2665; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2665:
X-Microsoft-Antispam-PRVS: <DM6PR12MB266531C05FF88C44052BF1EF970C0@DM6PR12MB2665.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-Forefront-PRVS: 0033AAD26D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: eKIRp1zqbR7GVmsodxhdO8UlL+Q4q5pc6xk8PHXOgpdOLJizrO2/+EzquNevnGo/AnmGXkd9hR0FW9BJElc6wZIWsC2vE3OGU7gxNH6716iM+fxQiYGOmOqNwYkI/AeQwMExEgiwH4Gjp0Ni5jygFPDS2htkqZyUlJAFb/Ds7ww3yQiRCcoHM+RzyrHDIdPbnNFJ9VXZ0Xns+gZFcjh15UTNouowDFLaU2aEMOk8C9IVQYHW+bGKE35qA3HtuA2B9rkLKoPp8GyNanEwlz7JI9eTbYJ17g63sepkxmxM1PhQVb3IFf0ReQb/lC4ZG3NW7i1kG0YjRyYDTWl1LEMfDmG3RoMkYXFgmjunwvxIHIgXaH/Yj0kwBJwzaLBtCqLvz0Ck6SvFEaqgsz3K8boIfTDaGibZ9zP3aiKAZqy/Ago=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2019 01:33:33.1392 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ead55090-8df3-4548-1e53-08d6d4e783df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2665
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com
Subject: [alsa-devel] [PATCH] ASoC: amd: Reporting accurate hw_ptr for acp3x
	dma
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

From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>

acp3x dma pointer callback has issues in reporting hw_ptr.
Modified logic to use linear position registers to
retrieve accurate hw_ptr.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 43 ++++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 9775bda..a4ade6b 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -32,6 +32,7 @@ struct i2s_stream_instance {
 	u16 channels;
 	u32 xfer_resolution;
 	struct page *pg;
+	u64 bytescount;
 	void __iomem *acp3x_base;
 };
 
@@ -317,6 +318,24 @@ static int acp3x_dma_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+static u64 acp_get_byte_count(struct i2s_stream_instance *rtd, int direction)
+{
+	u64 byte_count;
+
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		byte_count = rv_readl(rtd->acp3x_base +
+				      mmACP_BT_TX_LINEARPOSITIONCNTR_HIGH);
+		byte_count |= rv_readl(rtd->acp3x_base +
+				       mmACP_BT_TX_LINEARPOSITIONCNTR_LOW);
+	} else {
+		byte_count = rv_readl(rtd->acp3x_base +
+				      mmACP_BT_RX_LINEARPOSITIONCNTR_HIGH);
+		byte_count |= rv_readl(rtd->acp3x_base +
+				       mmACP_BT_RX_LINEARPOSITIONCNTR_LOW);
+	}
+	return byte_count;
+}
+
 static int acp3x_dma_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
@@ -350,18 +369,17 @@ static int acp3x_dma_hw_params(struct snd_pcm_substream *substream,
 static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_pcm_substream *substream)
 {
 	u32 pos = 0;
-	struct i2s_stream_instance *rtd = substream->runtime->private_data;
-
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		pos = rv_readl(rtd->acp3x_base +
-			       mmACP_BT_TX_LINKPOSITIONCNTR);
-	else
-		pos = rv_readl(rtd->acp3x_base +
-			       mmACP_BT_RX_LINKPOSITIONCNTR);
-
-	if (pos >= MAX_BUFFER)
-		pos = 0;
-
+	u32 buffersize = 0;
+	u64 bytescount = 0;
+	struct i2s_stream_instance *rtd =
+		substream->runtime->private_data;
+
+	buffersize = frames_to_bytes(substream->runtime,
+				     substream->runtime->buffer_size);
+	bytescount = acp_get_byte_count(rtd, substream->stream);
+	if (bytescount > rtd->bytescount)
+		bytescount -= rtd->bytescount;
+	pos = do_div(bytescount, buffersize);
 	return bytes_to_frames(substream->runtime, pos);
 }
 
@@ -521,6 +539,7 @@ static int acp3x_dai_i2s_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		rtd->bytescount = acp_get_byte_count(rtd, substream->stream);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 			rv_writel(period_bytes, rtd->acp3x_base +
 				  mmACP_BT_TX_INTR_WATERMARK_SIZE);
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
