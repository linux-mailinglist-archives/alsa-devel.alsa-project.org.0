Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 896FCBF2C2
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 14:18:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00566172A;
	Thu, 26 Sep 2019 14:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00566172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569500286;
	bh=n1CBDAM+rWDw63yBLHpWMGQe61B8vU/JS7tX7HoEtoY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=graJmySMhrRSM3Ethwm71Lv5Be3Wj5UIwurddYnFsgLDWnYeAk13FK6wYHxyvg2z4
	 AotvhZfDOx649MFPAa2pNQfnGiKqfgg063nH0wB/KCKy1BOooDTprQDeuoioIMB2cW
	 mfvQhsEogyZ/wkUx3pI9oZri0Ath/de6f8rfyZnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F411FF8060D;
	Thu, 26 Sep 2019 14:15:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C91FF805FF; Thu, 26 Sep 2019 14:15:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730057.outbound.protection.outlook.com [40.107.73.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CF1FF805FC
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 14:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CF1FF805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="KpDvbqJ/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOf0DskAE5kOMwR86r4LaUVlwlo/NYd+JErpYMjTwTUOlGZaYF4tpe63VCt6/AQTQGXMQmCHRrcHPt4/CPbm2tRS9nQzkMHLhABmdATPVVCaYeJwBz105DuX3tLB7HVWVQqdVkyfBIgc+DlZ6fLSiQjf39EdC4f3fIsnE5DqjG0JwQQ/RBr5n4AVJQ3+WFbdTifx7JCLGgFj0HdXgdnW8axeL3XAVU+WS58FiPFiJC97xbq6q+tNrNlagDqtQ181J66CEKNKn+nmaPuFcqU0/mstM0wcSVdU9vtqsj9cq1X56JhK6nQR/oXwjyC+QUq8sMG6v+K6Y3hRBv2EJqIAfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUMmDPvBR559oEym/BhVJvW/7H9AC7YgaUkEDC0BAfM=;
 b=FiXPliozHHrDfRw9bhvu6gcdBjZNRHgxaW6aXvGrHz4ZjeklQ54iHnY8uIoafP0T223zFFK/2Ulg2ewxGdEz5VioSx9JaKcYm1679b5u+XBJYeN8fQkkYXKbWzCSJRxA2Fjknfisd4RifBv+Yst1x7dnFLAl1uPOj19d9eyLKrA8NWGTbi+2XQWYvgv+lgmEAFfvUracA7o1IxIf/DanmeKrGqlrJk2HiniY7uftLbmcQGDX/mjGs0NZUc4+R+LBSQ29gMF2RNk2c7BJbbUGfC5E1ykhJYv8wp3nQ7NtaOFIJsR1A5KA/T65OVKCdaL64N0lobk7TxwgneipPN9ioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=embeddedor.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUMmDPvBR559oEym/BhVJvW/7H9AC7YgaUkEDC0BAfM=;
 b=KpDvbqJ/dwXHVCc6uSBKc2vTgqUlywLeiZ9cFLOmJ3t+PXsmnRfRnvVvjPlYR7DRk7GpwHO4QgEoNDqg6iyW3fwWeEkRs/0MaSYdzSZzFwpKab/xalPxtgceek20bep1F2zyiVBY/p2aPcLzYJUgANZNqOpFDslxqhmtIWDapBI=
Received: from SN1PR12CA0050.namprd12.prod.outlook.com (2603:10b6:802:20::21)
 by DM5PR12MB1385.namprd12.prod.outlook.com (2603:10b6:3:6e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.26; Thu, 26 Sep
 2019 12:15:42 +0000
Received: from CO1NAM03FT057.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::203) by SN1PR12CA0050.outlook.office365.com
 (2603:10b6:802:20::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.16 via Frontend
 Transport; Thu, 26 Sep 2019 12:15:42 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; embeddedor.com; dkim=none (message not signed)
 header.d=none;embeddedor.com; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT057.mail.protection.outlook.com (10.152.81.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 26 Sep 2019 12:15:41 +0000
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 26 Sep 2019 07:15:40 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 27 Sep 2019 04:37:37 +0530
Message-ID: <1569539290-756-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569539290-756-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1569539290-756-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(428003)(189003)(199004)(14444005)(186003)(26005)(36756003)(336012)(70206006)(6666004)(356004)(30864003)(2906002)(5660300002)(70586007)(86362001)(76176011)(486006)(2616005)(126002)(476003)(446003)(426003)(11346002)(7696005)(51416003)(48376002)(478600001)(47776003)(8936002)(305945005)(1671002)(16586007)(316002)(50466002)(53416004)(4326008)(8676002)(81156014)(54906003)(81166006)(50226002)(109986005)(19627235002)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1385; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49caacf7-a2e8-4cbb-e3ef-08d7427b4019
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:DM5PR12MB1385; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1385:|DM5PR12MB1385:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1385CE1AB5F960FC3F46D213E7860@DM5PR12MB1385.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:193;
X-Forefront-PRVS: 0172F0EF77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: JRosrYrMLpT4H9owckV8C147rbV1rDf3LQ5QDvJ6yTqqD8wuxG2nP3qr3Z5W9SeBLsaWkkitvD4bJh4M9jI0l04/HfjQrVUZdwKJnEacdnB/f8Ic0RVqqWDmO1qzgSnNOPu4huaZizl5my88abSuBpG/qoJu+9m4NijOIdpArrAswln8N/cR4WzipB1YLNPDeuO06PWJQsp6Dz/WVMJ1itqvSLSNbgMvCu5ilCkHmwB0m5b1hP1BPYPCcDlL+Jb7IR3pt8XJAWrfdyu0vEWCLdwPHgg6aoCeyG6zSeQN1jINbfpoPjxJyjDzBeKwest205zXHL5QWmH6AexkKzSE5K2DFVrpnApwMzksljZ71quKvo7/EGM4W5p/+DQfvV1FVjJRt9w8uDs0zL5kdk3NrtRVMxBZnNaJZ8B+QONIvB0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2019 12:15:41.6579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49caacf7-a2e8-4cbb-e3ef-08d7427b4019
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1385
Cc: "moderated list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <vijendar.mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [alsa-devel] [PATCH 3/5] ASoC: amd: Enabling two I2S instances
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

RAVEN has multiple I2S instances:BT and SP.But only BT is enabled.
Now I2S SP instance also gets enabled with this patch.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Reviewed-by: Vijendar Mukunda <vijendar.mukunda@amd.com>
---
 sound/soc/amd/raven/acp3x-i2s.c     | 216 +++++++++++++++++-------
 sound/soc/amd/raven/acp3x-pcm-dma.c | 321 ++++++++++++++++++++++++------------
 sound/soc/amd/raven/acp3x.h         | 105 +++++++++---
 3 files changed, 461 insertions(+), 181 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 7420928..9467c1d 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -19,24 +19,6 @@
 
 #define DRV_NAME "acp3x-i2s"
 
-static u64 acp_get_byte_count(struct i2s_stream_instance *rtd, int direction)
-{
-	u64 byte_count;
-
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
-		byte_count = rv_readl(rtd->acp3x_base +
-				mmACP_BT_TX_LINEARPOSITIONCNTR_HIGH);
-		byte_count |= rv_readl(rtd->acp3x_base +
-				mmACP_BT_TX_LINEARPOSITIONCNTR_LOW);
-	} else {
-		byte_count = rv_readl(rtd->acp3x_base +
-				mmACP_BT_RX_LINEARPOSITIONCNTR_HIGH);
-		byte_count |= rv_readl(rtd->acp3x_base +
-				mmACP_BT_RX_LINEARPOSITIONCNTR_LOW);
-	}
-	return byte_count;
-}
-
 static int acp3x_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 {
 
@@ -46,10 +28,10 @@ static int acp3x_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 
 	case SND_SOC_DAIFMT_I2S:
 		adata->tdm_mode = false;
-		break;
+	break;
 	case SND_SOC_DAIFMT_DSP_A:
-			adata->tdm_mode = true;
-			break;
+		adata->tdm_mode = true;
+	break;
 	default:
 		return -EINVAL;
 	}
@@ -68,16 +50,16 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
 	switch (slot_width) {
 	case SLOT_WIDTH_8:
 		slot_len = 8;
-		break;
+	break;
 	case SLOT_WIDTH_16:
 		slot_len = 16;
-		break;
+	break;
 	case SLOT_WIDTH_24:
 		slot_len = 24;
-		break;
+	break;
 	case SLOT_WIDTH_32:
 		slot_len = 0;
-		break;
+	break;
 	default:
 		return -EINVAL;
 	}
@@ -87,9 +69,16 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
 	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
 	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_IRER);
 
+	val = rv_readl(adata->acp3x_base + mmACP_I2STDM_ITER);
+	rv_writel((val | 0x2), adata->acp3x_base + mmACP_I2STDM_ITER);
+	val = rv_readl(adata->acp3x_base + mmACP_I2STDM_IRER);
+	rv_writel((val | 0x2), adata->acp3x_base + mmACP_I2STDM_IRER);
+
 	val = (FRM_LEN | (slots << 15) | (slot_len << 18));
 	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_TXFRMT);
 	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_RXFRMT);
+	rv_writel(val, adata->acp3x_base + mmACP_I2STDM_TXFRMT);
+	rv_writel(val, adata->acp3x_base + mmACP_I2STDM_RXFRMT);
 
 	adata->tdm_fmt = val;
 	return 0;
@@ -100,31 +89,62 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	u32 val = 0;
+	struct snd_soc_pcm_runtime *prtd = substream->private_data;
+	struct snd_soc_card *card = prtd->card;
+	struct acp3x_platform_info *pinfo = snd_soc_card_get_drvdata(card);
 	struct i2s_stream_instance *rtd = substream->runtime->private_data;
 
+	if (pinfo) {
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			rtd->i2s_instance = pinfo->play_i2s_instance;
+		else
+			rtd->i2s_instance = pinfo->cap_i2s_instance;
+	}
+
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_U8:
 	case SNDRV_PCM_FORMAT_S8:
 		rtd->xfer_resolution = 0x0;
-		break;
+	break;
 	case SNDRV_PCM_FORMAT_S16_LE:
 		rtd->xfer_resolution = 0x02;
-		break;
+	break;
 	case SNDRV_PCM_FORMAT_S24_LE:
 		rtd->xfer_resolution = 0x04;
-		break;
+	break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		rtd->xfer_resolution = 0x05;
-		break;
+	break;
 	default:
 		return -EINVAL;
 	}
-	val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
-	val = val | (rtd->xfer_resolution  << 3);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
-	else
-		rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
+			val = val | (rtd->xfer_resolution  << 3);
+			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
+		break;
+		case I2S_SP_INSTANCE:
+		default:
+			val = rv_readl(rtd->acp3x_base + mmACP_I2STDM_ITER);
+			val = val | (rtd->xfer_resolution  << 3);
+			rv_writel(val, rtd->acp3x_base + mmACP_I2STDM_ITER);
+		}
+	} else {
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
+			val = val | (rtd->xfer_resolution  << 3);
+			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
+		break;
+		case I2S_SP_INSTANCE:
+		default:
+			val = rv_readl(rtd->acp3x_base + mmACP_I2STDM_IRER);
+			val = val | (rtd->xfer_resolution  << 3);
+			rv_writel(val, rtd->acp3x_base + mmACP_I2STDM_IRER);
+		}
+	}
 
 	return 0;
 }
@@ -132,9 +152,19 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
 static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 		int cmd, struct snd_soc_dai *dai)
 {
+	u32 val, period_bytes;
 	int ret = 0;
 	struct i2s_stream_instance *rtd = substream->runtime->private_data;
-	u32 val, period_bytes;
+	struct snd_soc_pcm_runtime *prtd = substream->private_data;
+	struct snd_soc_card *card = prtd->card;
+	struct acp3x_platform_info *pinfo = snd_soc_card_get_drvdata(card);
+
+	if (pinfo) {
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			rtd->i2s_instance = pinfo->play_i2s_instance;
+		else
+			rtd->i2s_instance = pinfo->cap_i2s_instance;
+	}
 
 	period_bytes = frames_to_bytes(substream->runtime,
 			substream->runtime->period_size);
@@ -142,37 +172,107 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		rtd->bytescount = acp_get_byte_count(rtd,
-						substream->stream);
+		rtd->bytescount = acp_get_byte_count(rtd, substream->stream);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			rv_writel(period_bytes, rtd->acp3x_base +
+			switch (rtd->i2s_instance) {
+			case I2S_BT_INSTANCE:
+				rv_writel(period_bytes, rtd->acp3x_base +
 					mmACP_BT_TX_INTR_WATERMARK_SIZE);
-			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
-			val = val | BIT(0);
-			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
+				val = rv_readl(rtd->acp3x_base +
+						mmACP_BTTDM_ITER);
+				val = val | BIT(0);
+				rv_writel(val, rtd->acp3x_base +
+						mmACP_BTTDM_ITER);
+				rv_writel(1, rtd->acp3x_base +
+						mmACP_BTTDM_IER);
+			break;
+			case I2S_SP_INSTANCE:
+			default:
+				rv_writel(period_bytes, rtd->acp3x_base +
+					mmACP_I2S_TX_INTR_WATERMARK_SIZE);
+				val = rv_readl(rtd->acp3x_base +
+						mmACP_I2STDM_ITER);
+				val = val | BIT(0);
+				rv_writel(val, rtd->acp3x_base +
+						mmACP_I2STDM_ITER);
+				rv_writel(1, rtd->acp3x_base +
+						mmACP_I2STDM_IER);
+			}
 		} else {
-			rv_writel(period_bytes, rtd->acp3x_base +
+			switch (rtd->i2s_instance) {
+			case I2S_BT_INSTANCE:
+				rv_writel(period_bytes, rtd->acp3x_base +
 					mmACP_BT_RX_INTR_WATERMARK_SIZE);
-			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
-			val = val | BIT(0);
-			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
+				val = rv_readl(rtd->acp3x_base +
+						mmACP_BTTDM_IRER);
+				val = val | BIT(0);
+				rv_writel(val, rtd->acp3x_base +
+						mmACP_BTTDM_IRER);
+				rv_writel(1, rtd->acp3x_base +
+						mmACP_BTTDM_IER);
+			break;
+			case I2S_SP_INSTANCE:
+			default:
+				rv_writel(period_bytes, rtd->acp3x_base +
+					mmACP_I2S_RX_INTR_WATERMARK_SIZE);
+				val = rv_readl(rtd->acp3x_base +
+						mmACP_I2STDM_IRER);
+				val = val | BIT(0);
+				rv_writel(val, rtd->acp3x_base +
+						 mmACP_I2STDM_IRER);
+				rv_writel(1, rtd->acp3x_base +
+						mmACP_I2STDM_IER);
+			}
 		}
-		rv_writel(1, rtd->acp3x_base + mmACP_BTTDM_IER);
-		break;
+	break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
-			val = val & ~BIT(0);
-			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
+			switch (rtd->i2s_instance) {
+			case I2S_BT_INSTANCE:
+				val = rv_readl(rtd->acp3x_base +
+							mmACP_BTTDM_ITER);
+				val = val & ~BIT(0);
+				rv_writel(val, rtd->acp3x_base +
+							mmACP_BTTDM_ITER);
+				rv_writel(0, rtd->acp3x_base +
+							mmACP_BTTDM_IER);
+			break;
+			case I2S_SP_INSTANCE:
+			default:
+				val = rv_readl(rtd->acp3x_base +
+							mmACP_I2STDM_ITER);
+				val = val & ~BIT(0);
+				rv_writel(val, rtd->acp3x_base +
+							mmACP_I2STDM_ITER);
+				rv_writel(0, rtd->acp3x_base +
+							mmACP_I2STDM_IER);
+			}
+
 		} else {
-			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
-			val = val & ~BIT(0);
-			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
+			switch (rtd->i2s_instance) {
+			case I2S_BT_INSTANCE:
+				val = rv_readl(rtd->acp3x_base +
+							mmACP_BTTDM_IRER);
+				val = val & ~BIT(0);
+				rv_writel(val, rtd->acp3x_base +
+							mmACP_BTTDM_IRER);
+				rv_writel(0, rtd->acp3x_base +
+							mmACP_BTTDM_IER);
+			break;
+			case I2S_SP_INSTANCE:
+			default:
+				val = rv_readl(rtd->acp3x_base +
+							mmACP_I2STDM_IRER);
+				val = val & ~BIT(0);
+				rv_writel(val, rtd->acp3x_base +
+							mmACP_I2STDM_IRER);
+				rv_writel(0, rtd->acp3x_base +
+							mmACP_I2STDM_IER);
+			}
 		}
-		rv_writel(0, rtd->acp3x_base + mmACP_BTTDM_IER);
-		break;
+	break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -200,7 +300,7 @@ static struct snd_soc_dai_driver acp3x_i2s_dai = {
 			SNDRV_PCM_FMTBIT_S24_LE |
 			SNDRV_PCM_FMTBIT_S32_LE,
 		.channels_min = 2,
-		.channels_max = 8,
+		.channels_max = 2,
 
 		.rate_min = 8000,
 		.rate_max = 96000,
@@ -249,6 +349,8 @@ static int acp3x_dai_probe(struct platform_device *pdev)
 	adata->i2s_irq = res->start;
 	adata->play_stream = NULL;
 	adata->capture_stream = NULL;
+	adata->i2ssp_play_stream = NULL;
+	adata->i2ssp_capture_stream = NULL;
 
 	dev_set_drvdata(&pdev->dev, adata);
 	status = devm_snd_soc_register_component(&pdev->dev,
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 67160b5..bc90fa0 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -15,23 +15,22 @@
 #include <sound/soc-dai.h>
 
 #include "acp3x.h"
-
 #define DRV_NAME "acp3x-i2s-audio"
-
 static const struct snd_pcm_hardware acp3x_pcm_hardware_playback = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_BATCH |
 		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
 	.formats = SNDRV_PCM_FMTBIT_S16_LE |  SNDRV_PCM_FMTBIT_S8 |
-		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
-		   SNDRV_PCM_FMTBIT_S32_LE,
+		SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
+		SNDRV_PCM_FMTBIT_S32_LE,
 	.channels_min = 2,
 	.channels_max = 8,
 	.rates = SNDRV_PCM_RATE_8000_96000,
 	.rate_min = 8000,
 	.rate_max = 96000,
-	.buffer_bytes_max = PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE,
+	.buffer_bytes_max = PLAYBACK_MAX_NUM_PERIODS *
+				PLAYBACK_MAX_PERIOD_SIZE,
 	.period_bytes_min = PLAYBACK_MIN_PERIOD_SIZE,
 	.period_bytes_max = PLAYBACK_MAX_PERIOD_SIZE,
 	.periods_min = PLAYBACK_MIN_NUM_PERIODS,
@@ -42,16 +41,17 @@ static const struct snd_pcm_hardware acp3x_pcm_hardware_capture = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_BATCH |
-	    SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
+		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
 	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
-		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
-		   SNDRV_PCM_FMTBIT_S32_LE,
+		SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE |
+		SNDRV_PCM_FMTBIT_S32_LE,
 	.channels_min = 2,
 	.channels_max = 2,
 	.rates = SNDRV_PCM_RATE_8000_48000,
 	.rate_min = 8000,
 	.rate_max = 48000,
-	.buffer_bytes_max = CAPTURE_MAX_NUM_PERIODS * CAPTURE_MAX_PERIOD_SIZE,
+	.buffer_bytes_max = CAPTURE_MAX_NUM_PERIODS *
+						CAPTURE_MAX_PERIOD_SIZE,
 	.period_bytes_min = CAPTURE_MIN_PERIOD_SIZE,
 	.period_bytes_max = CAPTURE_MAX_PERIOD_SIZE,
 	.periods_min = CAPTURE_MIN_NUM_PERIODS,
@@ -96,7 +96,7 @@ static int acp3x_reset(void __iomem *acp3x_base)
 	while (true) {
 		val = rv_readl(acp3x_base + mmACP_SOFT_RESET);
 		if ((val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK) ||
-		     timeout > 100) {
+				timeout > 100) {
 			if (val & ACP3x_SOFT_RESET__SoftResetAudDone_MASK)
 				break;
 			return -ENODEV;
@@ -170,19 +170,35 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
 	play_flag = 0;
 	cap_flag = 0;
 	val = rv_readl(rv_i2s_data->acp3x_base + mmACP_EXTERNAL_INTR_STAT);
-	if ((val & BIT(BT_TX_THRESHOLD)) && rv_i2s_data->play_stream) {
-		rv_writel(BIT(BT_TX_THRESHOLD), rv_i2s_data->acp3x_base +
-			  mmACP_EXTERNAL_INTR_STAT);
+	if ((val & BIT(BT_TX_THRESHOLD)) &&
+				rv_i2s_data->play_stream) {
+		rv_writel(BIT(BT_TX_THRESHOLD), rv_i2s_data->acp3x_base
+				+ mmACP_EXTERNAL_INTR_STAT);
 		snd_pcm_period_elapsed(rv_i2s_data->play_stream);
 		play_flag = 1;
 	}
+	if ((val & BIT(I2S_TX_THRESHOLD)) &&
+				rv_i2s_data->i2ssp_play_stream) {
+		rv_writel(BIT(I2S_TX_THRESHOLD),
+			rv_i2s_data->acp3x_base	+ mmACP_EXTERNAL_INTR_STAT);
+		snd_pcm_period_elapsed(rv_i2s_data->i2ssp_play_stream);
+		play_flag = 1;
+	}
 
-	if ((val & BIT(BT_RX_THRESHOLD)) && rv_i2s_data->capture_stream) {
-		rv_writel(BIT(BT_RX_THRESHOLD), rv_i2s_data->acp3x_base +
-			  mmACP_EXTERNAL_INTR_STAT);
+	if ((val & BIT(BT_RX_THRESHOLD)) &&
+				rv_i2s_data->capture_stream) {
+		rv_writel(BIT(BT_RX_THRESHOLD),
+			rv_i2s_data->acp3x_base	+ mmACP_EXTERNAL_INTR_STAT);
 		snd_pcm_period_elapsed(rv_i2s_data->capture_stream);
 		cap_flag = 1;
 	}
+	if ((val & BIT(I2S_RX_THRESHOLD)) &&
+				rv_i2s_data->i2ssp_capture_stream) {
+		rv_writel(BIT(I2S_RX_THRESHOLD),
+			 rv_i2s_data->acp3x_base + mmACP_EXTERNAL_INTR_STAT);
+		snd_pcm_period_elapsed(rv_i2s_data->i2ssp_capture_stream);
+		cap_flag = 1;
+	}
 
 	if (play_flag | cap_flag)
 		return IRQ_HANDLED;
@@ -193,20 +209,35 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
 static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 {
 	u16 page_idx;
-	u32 low, high, val, acp_fifo_addr;
-	dma_addr_t addr = rtd->dma_addr;
+	uint64_t low, high, val, acp_fifo_addr;
+	dma_addr_t addr;
 
-	/* 8 scratch registers used to map one 64 bit address */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		val = 0;
-	else
-		val = rtd->num_pages * 8;
+	addr = rtd->dma_addr;
 
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			val = ACP_SRAM_BT_PB_PTE_OFFSET;
+		break;
+		case I2S_SP_INSTANCE:
+		default:
+			val = ACP_SRAM_SP_PB_PTE_OFFSET;
+		}
+	} else {
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			val = ACP_SRAM_BT_CP_PTE_OFFSET;
+		break;
+		case I2S_SP_INSTANCE:
+		default:
+			val = ACP_SRAM_SP_CP_PTE_OFFSET;
+		}
+	}
 	/* Group Enable */
 	rv_writel(ACP_SRAM_PTE_OFFSET | BIT(31), rtd->acp3x_base +
-		  mmACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
+			mmACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
 	rv_writel(PAGE_SIZE_4K_ENABLE, rtd->acp3x_base +
-		  mmACPAXI2AXI_ATU_PAGE_SIZE_GRP_1);
+			mmACPAXI2AXI_ATU_PAGE_SIZE_GRP_1);
 
 	for (page_idx = 0; page_idx < rtd->num_pages; page_idx++) {
 		/* Load the low address of page int ACP SRAM through SRBM */
@@ -223,38 +254,95 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 	}
 
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
-		/* Config ringbuffer */
-		rv_writel(MEM_WINDOW_START, rtd->acp3x_base +
-			  mmACP_BT_TX_RINGBUFADDR);
-		rv_writel(MAX_BUFFER, rtd->acp3x_base +
-			  mmACP_BT_TX_RINGBUFSIZE);
-		rv_writel(DMA_SIZE, rtd->acp3x_base + mmACP_BT_TX_DMA_SIZE);
-
-		/* Config audio fifo */
-		acp_fifo_addr = ACP_SRAM_PTE_OFFSET + (rtd->num_pages * 8)
-				+ PLAYBACK_FIFO_ADDR_OFFSET;
-		rv_writel(acp_fifo_addr, rtd->acp3x_base +
-			  mmACP_BT_TX_FIFOADDR);
-		rv_writel(FIFO_SIZE, rtd->acp3x_base + mmACP_BT_TX_FIFOSIZE);
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+				/* Config ringbuffer */
+			rv_writel(I2S_BT_TX_MEM_WINDOW_START,
+				rtd->acp3x_base + mmACP_BT_TX_RINGBUFADDR);
+			rv_writel(MAX_BUFFER, rtd->acp3x_base +
+					mmACP_BT_TX_RINGBUFSIZE);
+			rv_writel(DMA_SIZE,
+				rtd->acp3x_base + mmACP_BT_TX_DMA_SIZE);
+
+			/* Config audio fifo */
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+						BT_PB_FIFO_ADDR_OFFSET;
+			rv_writel(acp_fifo_addr,
+				rtd->acp3x_base +  mmACP_BT_TX_FIFOADDR);
+			rv_writel(FIFO_SIZE,
+				rtd->acp3x_base + mmACP_BT_TX_FIFOSIZE);
+			/* Enable  watermark/period interrupt to host */
+			rv_writel(BIT(BT_TX_THRESHOLD),
+				rtd->acp3x_base + mmACP_EXTERNAL_INTR_CNTL);
+		break;
+
+		case I2S_SP_INSTANCE:
+		default:
+			/* Config ringbuffer */
+			rv_writel(I2S_SP_TX_MEM_WINDOW_START,
+				rtd->acp3x_base + mmACP_I2S_TX_RINGBUFADDR);
+			rv_writel(MAX_BUFFER,
+				rtd->acp3x_base + mmACP_I2S_TX_RINGBUFSIZE);
+			rv_writel(DMA_SIZE,
+				rtd->acp3x_base + mmACP_I2S_TX_DMA_SIZE);
+
+			/* Config audio fifo */
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+						SP_PB_FIFO_ADDR_OFFSET;
+			rv_writel(acp_fifo_addr,
+				rtd->acp3x_base + mmACP_I2S_TX_FIFOADDR);
+			rv_writel(FIFO_SIZE,
+				rtd->acp3x_base + mmACP_I2S_TX_FIFOSIZE);
+			/* Enable  watermark/period interrupt to host */
+			rv_writel(BIT(I2S_TX_THRESHOLD),
+				rtd->acp3x_base + mmACP_EXTERNAL_INTR_CNTL);
+		}
 	} else {
-		/* Config ringbuffer */
-		rv_writel(MEM_WINDOW_START + MAX_BUFFER, rtd->acp3x_base +
-			  mmACP_BT_RX_RINGBUFADDR);
-		rv_writel(MAX_BUFFER, rtd->acp3x_base +
-			  mmACP_BT_RX_RINGBUFSIZE);
-		rv_writel(DMA_SIZE, rtd->acp3x_base + mmACP_BT_RX_DMA_SIZE);
-
-		/* Config audio fifo */
-		acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
-				(rtd->num_pages * 8) + CAPTURE_FIFO_ADDR_OFFSET;
-		rv_writel(acp_fifo_addr, rtd->acp3x_base +
-			  mmACP_BT_RX_FIFOADDR);
-		rv_writel(FIFO_SIZE, rtd->acp3x_base + mmACP_BT_RX_FIFOSIZE);
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			/* Config ringbuffer */
+			rv_writel(I2S_BT_RX_MEM_WINDOW_START,
+				rtd->acp3x_base + mmACP_BT_RX_RINGBUFADDR);
+			rv_writel(MAX_BUFFER,
+				rtd->acp3x_base + mmACP_BT_RX_RINGBUFSIZE);
+			rv_writel(DMA_SIZE,
+				rtd->acp3x_base + mmACP_BT_RX_DMA_SIZE);
+
+			/* Config audio fifo */
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+						BT_CAPT_FIFO_ADDR_OFFSET;
+			rv_writel(acp_fifo_addr,
+				rtd->acp3x_base + mmACP_BT_RX_FIFOADDR);
+			rv_writel(FIFO_SIZE,
+				rtd->acp3x_base + mmACP_BT_RX_FIFOSIZE);
+			/* Enable  watermark/period interrupt to host */
+			rv_writel(BIT(BT_RX_THRESHOLD),
+				rtd->acp3x_base + mmACP_EXTERNAL_INTR_CNTL);
+		break;
+
+		case I2S_SP_INSTANCE:
+		default:
+			/* Config ringbuffer */
+			rv_writel(I2S_SP_RX_MEM_WINDOW_START,
+				rtd->acp3x_base + mmACP_I2S_RX_RINGBUFADDR);
+			rv_writel(MAX_BUFFER,
+				rtd->acp3x_base + mmACP_I2S_RX_RINGBUFSIZE);
+			rv_writel(DMA_SIZE,
+				rtd->acp3x_base + mmACP_I2S_RX_DMA_SIZE);
+
+			/* Config audio fifo */
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+						SP_CAPT_FIFO_ADDR_OFFSET;
+			rv_writel(acp_fifo_addr,
+				rtd->acp3x_base + mmACP_I2S_RX_FIFOADDR);
+			rv_writel(FIFO_SIZE,
+				rtd->acp3x_base + mmACP_I2S_RX_FIFOSIZE);
+			/* Enable  watermark/period interrupt to host */
+			rv_writel(BIT(I2S_RX_THRESHOLD),
+				rtd->acp3x_base + mmACP_EXTERNAL_INTR_CNTL);
+		}
 	}
 
-	/* Enable  watermark/period interrupt to host */
-	rv_writel(BIT(BT_TX_THRESHOLD) | BIT(BT_RX_THRESHOLD),
-		  rtd->acp3x_base + mmACP_EXTERNAL_INTR_CNTL);
 }
 
 static int acp3x_dma_open(struct snd_pcm_substream *substream)
@@ -264,13 +352,14 @@ static int acp3x_dma_open(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *prtd = substream->private_data;
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(prtd,
-								    DRV_NAME);
+			DRV_NAME);
 	struct i2s_dev_data *adata = dev_get_drvdata(component->dev);
 
-	struct i2s_stream_instance *i2s_data = kzalloc(sizeof(struct i2s_stream_instance),
-						       GFP_KERNEL);
+	struct i2s_stream_instance *i2s_data =
+		kzalloc(sizeof(struct i2s_stream_instance),
+				GFP_KERNEL);
 	if (!i2s_data)
-		return -EINVAL;
+		return -ENOMEM;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		runtime->hw = acp3x_pcm_hardware_playback;
@@ -278,55 +367,52 @@ static int acp3x_dma_open(struct snd_pcm_substream *substream)
 		runtime->hw = acp3x_pcm_hardware_capture;
 
 	ret = snd_pcm_hw_constraint_integer(runtime,
-					    SNDRV_PCM_HW_PARAM_PERIODS);
+			SNDRV_PCM_HW_PARAM_PERIODS);
 	if (ret < 0) {
 		dev_err(component->dev, "set integer constraint failed\n");
 		kfree(i2s_data);
 		return ret;
 	}
 
-	if (!adata->play_stream && !adata->capture_stream)
+	if (!adata->play_stream && !adata->capture_stream &&
+		adata->i2ssp_play_stream && !adata->i2ssp_capture_stream)
 		rv_writel(1, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		adata->play_stream = substream;
-	else
+		adata->i2ssp_play_stream = substream;
+	} else {
 		adata->capture_stream = substream;
+		adata->i2ssp_capture_stream = substream;
+	}
 
 	i2s_data->acp3x_base = adata->acp3x_base;
 	runtime->private_data = i2s_data;
 	return 0;
 }
 
-static u64 acp_get_byte_count(struct i2s_stream_instance *rtd, int direction)
-{
-	u64 byte_count;
-
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
-		byte_count = rv_readl(rtd->acp3x_base +
-				      mmACP_BT_TX_LINEARPOSITIONCNTR_HIGH);
-		byte_count |= rv_readl(rtd->acp3x_base +
-				       mmACP_BT_TX_LINEARPOSITIONCNTR_LOW);
-	} else {
-		byte_count = rv_readl(rtd->acp3x_base +
-				      mmACP_BT_RX_LINEARPOSITIONCNTR_HIGH);
-		byte_count |= rv_readl(rtd->acp3x_base +
-				       mmACP_BT_RX_LINEARPOSITIONCNTR_LOW);
-	}
-	return byte_count;
-}
-
 static int acp3x_dma_hw_params(struct snd_pcm_substream *substream,
-			       struct snd_pcm_hw_params *params)
+		struct snd_pcm_hw_params *params)
 {
 	int status;
-	u64 size;
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct i2s_stream_instance *rtd = runtime->private_data;
+	uint64_t size;
+	struct snd_soc_pcm_runtime *prtd = substream->private_data;
+	struct snd_soc_card *card = prtd->card;
+	struct acp3x_platform_info *pinfo = snd_soc_card_get_drvdata(card);
 
+	struct i2s_stream_instance *rtd = substream->runtime->private_data;
 	if (!rtd)
 		return -EINVAL;
 
+
+	if (pinfo) {
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			rtd->i2s_instance = pinfo->play_i2s_instance;
+		else
+			rtd->i2s_instance = pinfo->cap_i2s_instance;
+	} else
+		pr_err("pinfo failed\n");
+
 	size = params_buffer_bytes(params);
 	status = snd_pcm_lib_malloc_pages(substream, size);
 	if (status < 0)
@@ -349,11 +435,20 @@ static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_pcm_substream *substream)
 	u32 pos = 0;
 	u32 buffersize = 0;
 	u64 bytescount = 0;
-	struct i2s_stream_instance *rtd =
-		substream->runtime->private_data;
+	struct snd_soc_pcm_runtime *prtd = substream->private_data;
+	struct snd_soc_card *card = prtd->card;
+	struct acp3x_platform_info *pinfo = snd_soc_card_get_drvdata(card);
+	struct i2s_stream_instance *rtd = substream->runtime->private_data;
+
+	if (pinfo) {
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			rtd->i2s_instance = pinfo->play_i2s_instance;
+		else
+			rtd->i2s_instance = pinfo->cap_i2s_instance;
+	}
 
 	buffersize = frames_to_bytes(substream->runtime,
-				     substream->runtime->buffer_size);
+			substream->runtime->buffer_size);
 	bytescount = acp_get_byte_count(rtd, substream->stream);
 	if (bytescount > rtd->bytescount)
 		bytescount -= rtd->bytescount;
@@ -364,10 +459,13 @@ static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_pcm_substream *substream)
 static int acp3x_dma_new(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd,
-								    DRV_NAME);
+			DRV_NAME);
 	struct device *parent = component->dev->parent;
-	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
-					      parent, MIN_BUFFER, MAX_BUFFER);
+
+	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm,
+			SNDRV_DMA_TYPE_DEV,
+			parent, MAX_BUFFER,
+			MAX_BUFFER);
 	return 0;
 }
 
@@ -377,7 +475,7 @@ static int acp3x_dma_hw_free(struct snd_pcm_substream *substream)
 }
 
 static int acp3x_dma_mmap(struct snd_pcm_substream *substream,
-			  struct vm_area_struct *vma)
+		struct vm_area_struct *vma)
 {
 	return snd_pcm_lib_default_mmap(substream, vma);
 }
@@ -387,18 +485,22 @@ static int acp3x_dma_close(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *prtd = substream->private_data;
 	struct i2s_stream_instance *rtd = substream->runtime->private_data;
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(prtd,
-								    DRV_NAME);
+			DRV_NAME);
 	struct i2s_dev_data *adata = dev_get_drvdata(component->dev);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		adata->play_stream = NULL;
-	else
+		adata->i2ssp_play_stream = NULL;
+	} else {
 		adata->capture_stream = NULL;
+		adata->i2ssp_capture_stream = NULL;
+	}
 
 	/* Disable ACP irq, when the current stream is being closed and
 	 * another stream is also not active.
 	 */
-	if (!adata->play_stream && !adata->capture_stream)
+	if (!adata->play_stream && !adata->capture_stream &&
+		!adata->i2ssp_play_stream && !adata->i2ssp_capture_stream)
 		rv_writel(0, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
 	kfree(rtd);
 	return 0;
@@ -443,7 +545,7 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 	}
 
 	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
-					 resource_size(res));
+			resource_size(res));
 
 	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	if (!res) {
@@ -454,6 +556,8 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 	adata->i2s_irq = res->start;
 	adata->play_stream = NULL;
 	adata->capture_stream = NULL;
+	adata->i2ssp_play_stream = NULL;
+	adata->i2ssp_capture_stream = NULL;
 
 	dev_set_drvdata(&pdev->dev, adata);
 	/* Initialize ACP */
@@ -461,14 +565,14 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 	if (status)
 		return -ENODEV;
 	status = devm_snd_soc_register_component(&pdev->dev,
-						 &acp3x_i2s_component,
-						 NULL, 0);
+			&acp3x_i2s_component,
+			NULL, 0);
 	if (status) {
 		dev_err(&pdev->dev, "Fail to register acp i2s component\n");
 		goto dev_err;
 	}
 	status = devm_request_irq(&pdev->dev, adata->i2s_irq, i2s_irq_handler,
-				  irqflags, "ACP3x_I2S_IRQ", adata);
+			irqflags, "ACP3x_I2S_IRQ", adata);
 	if (status) {
 		dev_err(&pdev->dev, "ACP3x I2S IRQ request failed\n");
 		goto dev_err;
@@ -518,13 +622,16 @@ static int acp3x_resume(struct device *dev)
 			adata->play_stream->runtime->private_data;
 		config_acp3x_dma(rtd, SNDRV_PCM_STREAM_PLAYBACK);
 		rv_writel((rtd->xfer_resolution  << 3),
-			  rtd->acp3x_base + mmACP_BTTDM_ITER);
+				rtd->acp3x_base + mmACP_BTTDM_ITER);
+		val = rv_readl(rtd->acp3x_base + mmACP_I2STDM_ITER);
+		val = val | (rtd->xfer_resolution  << 3);
+		rv_writel(val, rtd->acp3x_base + mmACP_I2STDM_ITER);
 		if (adata->tdm_mode == true) {
 			rv_writel(adata->tdm_fmt, adata->acp3x_base +
-				  mmACP_BTTDM_TXFRMT);
+					mmACP_BTTDM_TXFRMT);
 			val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
 			rv_writel((val | 0x2), adata->acp3x_base +
-				  mmACP_BTTDM_ITER);
+					mmACP_BTTDM_ITER);
 		}
 	}
 
@@ -533,13 +640,17 @@ static int acp3x_resume(struct device *dev)
 			adata->capture_stream->runtime->private_data;
 		config_acp3x_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
 		rv_writel((rtd->xfer_resolution  << 3),
-			  rtd->acp3x_base + mmACP_BTTDM_IRER);
+				rtd->acp3x_base + mmACP_BTTDM_IRER);
+		val = rv_readl(rtd->acp3x_base + mmACP_I2STDM_ITER);
+		val = val | (rtd->xfer_resolution  << 3);
+		rv_writel(val, rtd->acp3x_base + mmACP_I2STDM_ITER);
+
 		if (adata->tdm_mode == true) {
 			rv_writel(adata->tdm_fmt, adata->acp3x_base +
-				  mmACP_BTTDM_RXFRMT);
+					mmACP_BTTDM_RXFRMT);
 			val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
 			rv_writel((val | 0x2), adata->acp3x_base +
-				  mmACP_BTTDM_IRER);
+					mmACP_BTTDM_IRER);
 		}
 	}
 
diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index 6bc38a4..d381b5c 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -7,6 +7,9 @@
 
 #include "chip_offset_byte.h"
 
+#define I2S_SP_INSTANCE                 0x01
+#define I2S_BT_INSTANCE                 0x02
+
 #define ACP3x_DEVS		3
 #define ACP3x_PHY_BASE_ADDRESS	0x1240000
 #define	ACP3x_I2S_MODE		0
@@ -28,31 +31,47 @@
 #define ACP3x_POWER_OFF_IN_PROGRESS	0x03
 #define ACP3x_SOFT_RESET__SoftResetAudDone_MASK	0x00010001
 
-#define ACP_SRAM_PTE_OFFSET	0x02050000
-#define PAGE_SIZE_4K_ENABLE	0x2
-#define MEM_WINDOW_START	0x4000000
-#define PLAYBACK_FIFO_ADDR_OFFSET	0x400
-#define CAPTURE_FIFO_ADDR_OFFSET	0x500
+#define PAGE_SIZE_4K_ENABLE		0x02
+#define I2S_SP_TX_MEM_WINDOW_START	0x4000000
+#define I2S_SP_RX_MEM_WINDOW_START	0x4020000
+#define I2S_BT_TX_MEM_WINDOW_START	0x4040000
+#define I2S_BT_RX_MEM_WINDOW_START	0x4060000
+
+#define ACP_SRAM_PTE_OFFSET		0x02050000
+#define ACP_SRAM_SP_PB_PTE_OFFSET	0x0
+#define ACP_SRAM_SP_CP_PTE_OFFSET	0x100
+#define ACP_SRAM_BT_PB_PTE_OFFSET	0x200
+#define ACP_SRAM_BT_CP_PTE_OFFSET	0x300
+#define SP_PB_FIFO_ADDR_OFFSET		0x500
+#define SP_CAPT_FIFO_ADDR_OFFSET	0x700
+#define BT_PB_FIFO_ADDR_OFFSET		0x900
+#define BT_CAPT_FIFO_ADDR_OFFSET	0xB00
+
+
 
+#define SLOT_WIDTH_8			0x08
+#define SLOT_WIDTH_16			0x10
+#define SLOT_WIDTH_24			0x18
+#define SLOT_WIDTH_32			0x20
 #define PLAYBACK_MIN_NUM_PERIODS	2
 #define PLAYBACK_MAX_NUM_PERIODS	8
-#define PLAYBACK_MAX_PERIOD_SIZE	16384
-#define PLAYBACK_MIN_PERIOD_SIZE	4096
+#define PLAYBACK_MAX_PERIOD_SIZE	8192
+#define PLAYBACK_MIN_PERIOD_SIZE	1024
 #define CAPTURE_MIN_NUM_PERIODS		2
 #define CAPTURE_MAX_NUM_PERIODS		8
-#define CAPTURE_MAX_PERIOD_SIZE		16384
-#define CAPTURE_MIN_PERIOD_SIZE		4096
+#define CAPTURE_MAX_PERIOD_SIZE		8192
+#define CAPTURE_MIN_PERIOD_SIZE		1024
 
-#define MAX_BUFFER (PLAYBACK_MAX_PERIOD_SIZE * PLAYBACK_MAX_NUM_PERIODS)
-#define MIN_BUFFER MAX_BUFFER
-#define FIFO_SIZE 0x100
-#define DMA_SIZE 0x40
-#define FRM_LEN 0x100
+#define MAX_BUFFER	(PLAYBACK_MAX_PERIOD_SIZE * PLAYBACK_MAX_NUM_PERIODS)
+#define MIN_BUFFER	MAX_BUFFER
+#define FIFO_SIZE	0x100
+#define DMA_SIZE	0x40
+#define FRM_LEN		0x100
 
-#define SLOT_WIDTH_8 0x08
-#define SLOT_WIDTH_16 0x10
-#define SLOT_WIDTH_24 0x18
-#define SLOT_WIDTH_32 0x20
+#define SLOT_WIDTH_8	0x08
+#define SLOT_WIDTH_16	0x10
+#define SLOT_WIDTH_24	0x18
+#define SLOT_WIDTH_32	0x20
 
 struct acp3x_platform_info {
 	u16 play_i2s_instance;
@@ -67,17 +86,24 @@ struct i2s_dev_data {
 	void __iomem *acp3x_base;
 	struct snd_pcm_substream *play_stream;
 	struct snd_pcm_substream *capture_stream;
+	struct snd_pcm_substream *i2ssp_play_stream;
+	struct snd_pcm_substream *i2ssp_capture_stream;
 };
 
 struct i2s_stream_instance {
 	u16 num_pages;
+	u16 i2s_instance;
+	u16 capture_channel;
+	u16 direction;
 	u16 channels;
 	u32 xfer_resolution;
-	u64 bytescount;
+	u32 val;
 	dma_addr_t dma_addr;
+	u64 bytescount;
 	void __iomem *acp3x_base;
 };
 
+
 static inline u32 rv_readl(void __iomem *base_addr)
 {
 	return readl(base_addr - ACP3x_PHY_BASE_ADDRESS);
@@ -87,3 +113,44 @@ static inline void rv_writel(u32 val, void __iomem *base_addr)
 {
 	writel(val, base_addr - ACP3x_PHY_BASE_ADDRESS);
 }
+
+static inline u64 acp_get_byte_count(struct i2s_stream_instance *rtd,
+							int direction)
+{
+	u64 byte_count;
+
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			byte_count = rv_readl(rtd->acp3x_base +
+					mmACP_BT_TX_LINEARPOSITIONCNTR_HIGH);
+			byte_count |= rv_readl(rtd->acp3x_base +
+					mmACP_BT_TX_LINEARPOSITIONCNTR_LOW);
+		break;
+		case I2S_SP_INSTANCE:
+		default:
+			byte_count = rv_readl(rtd->acp3x_base +
+					mmACP_I2S_TX_LINEARPOSITIONCNTR_HIGH);
+			byte_count |= rv_readl(rtd->acp3x_base +
+					mmACP_I2S_TX_LINEARPOSITIONCNTR_LOW);
+		}
+
+	} else {
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			byte_count = rv_readl(rtd->acp3x_base +
+					mmACP_BT_RX_LINEARPOSITIONCNTR_HIGH);
+			byte_count |= rv_readl(rtd->acp3x_base +
+					mmACP_BT_RX_LINEARPOSITIONCNTR_LOW);
+		break;
+		case I2S_SP_INSTANCE:
+		default:
+			byte_count = rv_readl(rtd->acp3x_base +
+					mmACP_I2S_RX_LINEARPOSITIONCNTR_HIGH);
+			byte_count |= rv_readl(rtd->acp3x_base +
+					mmACP_I2S_RX_LINEARPOSITIONCNTR_LOW);
+		}
+	}
+	return byte_count;
+}
+
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
