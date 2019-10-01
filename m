Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F393C22CD
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2019 16:09:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 913971661;
	Mon, 30 Sep 2019 16:08:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 913971661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569852569;
	bh=zBYo1Bn1KUa/7a5Ay5zXKOa6tnSP/0Vfp4h++E9QXRY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sg0yJe54hQ2JzTNjRAdJuhX+H+ChhG/8oM9CyGTw1SwJu/lc8XtcbVCBVtFuWnR8u
	 VCSqc20BFAoM40nuUdikqDJjnPmeUh+ydakMLPxa74K3zWMfK5Ct1e3INsv4JdeI9l
	 AG1O5msf7Ji2CY3Wr1rAdJ+KxbyRFV1/O0cyAx6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E773F80634;
	Mon, 30 Sep 2019 16:06:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64B8EF80611; Mon, 30 Sep 2019 16:06:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730041.outbound.protection.outlook.com [40.107.73.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C4C1F8060E
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 16:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C4C1F8060E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="nztyjjDg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHOcemOefedZWIha5Ad9XWGywYv/E4a7wSUgWlprxJpzAV4cwuJZ84qNEtsScnESWxDs2dOzXvKhdZGwaRB92UlkboRKxmKwzau3VsjD+t9tR47KHQP9SyDQSYSWfFOq3hL1UMiBLa/Rm1DuN5z2DPK1uia9hGx1xr/yALpZzw+ro2RLZbfKZx7bJu1gDF4u8Q1COTZw7GlpUjNbtVsc7SAFAFQJgUHphtUOkkvK6mUiSZQegaW1dvQYnfgLUaQYgAWf1jYc0OIA1kDyuS3Hmi7T60POLH7xgQtXZjg8PEq7XvwyrAB8elBvLxtP25jUY4v43/4X1OFdwFPWv60bmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qllx4vReL+hDpx3KSejP3D8ofxeJV8B0G54qclhXU2Y=;
 b=EWIcsVePhH/xyzUXn5XfdSBhZBxjbX2Yz9AHzZue+6HtsH0pVg8F4Vf/YLTU1JgGn1u/+OukXCFGQBFSbJiHtWX0Kv13SevcqxvrDJJZbojC8yb0pf50lhvWAtky1rxZ2eDloCUWYwsQ501z6NAQgfy++nmfMiKIykD9I76dkXRu1koKwvHnWf8kSMLMr/y75Bya8ZNk0Sgp3GHCoYCy25cgZk9jztPgDwOtQnWfnTenFUhsscJmElZqJTqEngIQychyX7jp7RfATprP4lS0GnLkqs8EO8Tdpmg75pkh65Kk3fUV3xnGP2lVrSfRnjKJGGPlD4t45YlP+RoP1IHMSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=huawei.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qllx4vReL+hDpx3KSejP3D8ofxeJV8B0G54qclhXU2Y=;
 b=nztyjjDghgzsWfqnacmwnTDJRmUywkQzc2Ocw9EfENpf040eNjV/do7uDUajpEzMlRMAfRX/jxOjmJFVA8QYEVRvf+EccP5E4R6ZnvISE6GqGs4Xqj9V6X3paachN0ux5sbj3lklBm+H+g4KyoKZ2eOiwnjb1nNi215os1VkX7k=
Received: from MWHPR1201CA0021.namprd12.prod.outlook.com
 (2603:10b6:301:4a::31) by DM6PR12MB3915.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Mon, 30 Sep
 2019 14:06:31 +0000
Received: from CO1NAM03FT057.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by MWHPR1201CA0021.outlook.office365.com
 (2603:10b6:301:4a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.16 via Frontend
 Transport; Mon, 30 Sep 2019 14:06:31 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT057.mail.protection.outlook.com (10.152.81.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Mon, 30 Sep 2019 14:06:30 +0000
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Mon, 30 Sep 2019 09:06:26 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Tue, 1 Oct 2019 06:28:12 +0530
Message-ID: <1569891524-18875-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1569891524-18875-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(428003)(199004)(189003)(7696005)(50226002)(86362001)(51416003)(8936002)(8676002)(81156014)(81166006)(478600001)(76176011)(14444005)(5660300002)(2906002)(54906003)(6666004)(356004)(19627235002)(305945005)(50466002)(48376002)(70586007)(70206006)(26005)(53416004)(2616005)(336012)(1671002)(426003)(16586007)(186003)(36756003)(4326008)(47776003)(11346002)(446003)(316002)(30864003)(126002)(476003)(109986005)(486006)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3915; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bc1b02d-f7b4-416d-2208-08d745af64ea
X-MS-TrafficTypeDiagnostic: DM6PR12MB3915:|DM6PR12MB3915:
X-Microsoft-Antispam-PRVS: <DM6PR12MB39151E4F07CC37EB7860DE19E7820@DM6PR12MB3915.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-Forefront-PRVS: 01762B0D64
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ctoBQ3yOMIsp+ATl9IgcTIWgLEH2sxleoJgegjsaEdbbxTeJQpyFasf2G5IwxPp7xSNdLXMZhhfUic4VJcg/b+MQam8fJuL0xjtCduLf4ugne2CIMjiKRMy9/t933G7Zp98PuPf+Prxv4v7zOgNcP2p+pn4vUGGeJ7H05VtVG9y1m/XBAo3NoMLmeBxe25BLOFjjMqNF+E6KM8Sm1DwFLRMs2VEk+lp0eBPUn7bAtQFpjqL5von75vF+8aNb63DModOYzhDlh4SbQUwIAGRGVI5yZv4pKWAO6gi/deenMnNNNlgsVuYGthRdHUzGtWTdqLnwTCJPJQWfXPJ6vo+9DAowCTKUpa8jXdLHcSLGOu0H0s86JzJUDjqvmOJlwn2FSYDJmUYVlfiVWAwKSi50K68eUc90fy49j0bqk6OfYAE=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2019 14:06:30.8862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc1b02d-f7b4-416d-2208-08d745af64ea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3915
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [alsa-devel] [PATCH 4/7] ASoC: amd: Enabling I2S instance in DMA
	and DAI
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

This patch adds I2S SP support in ACP PCM DMA and DAI.
Added I2S support in DMA and DAI probe,its hw_params handling
its open and close functionalities.
This enable to open and close on the SP instance for
playback and capture.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/Makefile        |   2 +
 sound/soc/amd/raven/acp3x-i2s.c     | 181 +++++++++++++++++++++++-------
 sound/soc/amd/raven/acp3x-pcm-dma.c | 218 +++++++++++++++++++++++++-----------
 sound/soc/amd/raven/acp3x.h         |  75 +++++++++++--
 4 files changed, 358 insertions(+), 118 deletions(-)

diff --git a/sound/soc/amd/raven/Makefile b/sound/soc/amd/raven/Makefile
index 108d1ac..8eef292 100644
--- a/sound/soc/amd/raven/Makefile
+++ b/sound/soc/amd/raven/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0+
 # Raven Ridge platform Support
 snd-pci-acp3x-objs	:= pci-acp3x.o
+snd-acp3x-i2s-objs	:= acp3x-i2s.o
 snd-acp3x-pcm-dma-objs	:= acp3x-pcm-dma.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-pci-acp3x.o
+obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-acp3x-i2s.o
 obj-$(CONFIG_SND_SOC_AMD_ACP3x)	 += snd-acp3x-pcm-dma.o
diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 7420928..4511b9b 100644
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
 
@@ -100,8 +82,18 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
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
@@ -119,12 +111,33 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
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
@@ -135,7 +148,16 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 	int ret = 0;
 	struct i2s_stream_instance *rtd = substream->runtime->private_data;
 	u32 val, period_bytes;
-
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
 	switch (cmd) {
@@ -145,34 +167,105 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 		rtd->bytescount = acp_get_byte_count(rtd,
 						substream->stream);
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
@@ -249,6 +342,8 @@ static int acp3x_dai_probe(struct platform_device *pdev)
 	adata->i2s_irq = res->start;
 	adata->play_stream = NULL;
 	adata->capture_stream = NULL;
+	adata->i2ssp_play_stream = NULL;
+	adata->i2ssp_capture_stream = NULL;
 
 	dev_set_drvdata(&pdev->dev, adata);
 	status = devm_snd_soc_register_component(&pdev->dev,
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index e14ec55..6fa892a 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -193,20 +193,35 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
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
@@ -223,38 +238,95 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
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
@@ -285,48 +357,45 @@ static int acp3x_dma_open(struct snd_pcm_substream *substream)
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
 			       struct snd_pcm_hw_params *params)
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
@@ -349,8 +418,17 @@ static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_pcm_substream *substream)
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
 				     substream->runtime->buffer_size);
@@ -390,15 +468,19 @@ static int acp3x_dma_close(struct snd_pcm_substream *substream)
 								    DRV_NAME);
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
@@ -454,6 +536,8 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 	adata->i2s_irq = res->start;
 	adata->play_stream = NULL;
 	adata->capture_stream = NULL;
+	adata->i2ssp_play_stream = NULL;
+	adata->i2ssp_capture_stream = NULL;
 
 	dev_set_drvdata(&pdev->dev, adata);
 	/* Initialize ACP */
diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index baa76cd..d97d7d5 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -7,6 +7,9 @@
 
 #include "chip_offset_byte.h"
 
+#define I2S_SP_INSTANCE                 0x01
+#define I2S_BT_INSTANCE                 0x02
+
 #define ACP3x_DEVS		3
 #define ACP3x_PHY_BASE_ADDRESS 0x1240000
 #define	ACP3x_I2S_MODE	0
@@ -29,19 +32,28 @@
 #define ACP3x_SOFT_RESET__SoftResetAudDone_MASK	0x00010001
 
 #define ACP_SRAM_PTE_OFFSET	0x02050000
+#define ACP_SRAM_SP_PB_PTE_OFFSET	0x0
+#define ACP_SRAM_SP_CP_PTE_OFFSET	0x100
+#define ACP_SRAM_BT_PB_PTE_OFFSET	0x200
+#define ACP_SRAM_BT_CP_PTE_OFFSET	0x300
 #define PAGE_SIZE_4K_ENABLE 0x2
-#define MEM_WINDOW_START	0x4000000
-#define PLAYBACK_FIFO_ADDR_OFFSET 0x400
-#define CAPTURE_FIFO_ADDR_OFFSET  0x500
+#define I2S_SP_TX_MEM_WINDOW_START	0x4000000
+#define I2S_SP_RX_MEM_WINDOW_START	0x4020000
+#define I2S_BT_TX_MEM_WINDOW_START	0x4040000
+#define I2S_BT_RX_MEM_WINDOW_START	0x4060000
 
+#define SP_PB_FIFO_ADDR_OFFSET		0x500
+#define SP_CAPT_FIFO_ADDR_OFFSET	0x700
+#define BT_PB_FIFO_ADDR_OFFSET		0x900
+#define BT_CAPT_FIFO_ADDR_OFFSET	0xB00
 #define PLAYBACK_MIN_NUM_PERIODS    2
 #define PLAYBACK_MAX_NUM_PERIODS    8
-#define PLAYBACK_MAX_PERIOD_SIZE    16384
-#define PLAYBACK_MIN_PERIOD_SIZE    4096
+#define PLAYBACK_MAX_PERIOD_SIZE    8192
+#define PLAYBACK_MIN_PERIOD_SIZE    1024
 #define CAPTURE_MIN_NUM_PERIODS     2
 #define CAPTURE_MAX_NUM_PERIODS     8
-#define CAPTURE_MAX_PERIOD_SIZE     16384
-#define CAPTURE_MIN_PERIOD_SIZE     4096
+#define CAPTURE_MAX_PERIOD_SIZE     8192
+#define CAPTURE_MIN_PERIOD_SIZE     1024
 
 #define MAX_BUFFER (PLAYBACK_MAX_PERIOD_SIZE * PLAYBACK_MAX_NUM_PERIODS)
 #define MIN_BUFFER MAX_BUFFER
@@ -67,14 +79,20 @@ struct i2s_dev_data {
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
 
@@ -87,3 +105,44 @@ static inline void rv_writel(u32 val, void __iomem *base_addr)
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
