Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2603912BDAD
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Dec 2019 14:45:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C45541787;
	Sat, 28 Dec 2019 14:44:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C45541787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577540734;
	bh=lyo9QpyBkMjFp1AVQs8Hr9QyKTnAY/z/sv57wNFLf0k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jmO6Q8ESp/p/8VkqOquFwe/YQs99S2fIiHrNMLUcLhO5tBXl+n/8/li9rlYU4SPos
	 2wAuiGk9hW6zL8++KTBCFCs0jaxQNtn6Gx18iUc1zZyP/qqBe4n8dH+VqQ4d3OsSmg
	 8+5vCMNbZMgREiGcVCY95bGETpcJ2O7WW878a5ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4983CF80271;
	Sat, 28 Dec 2019 14:43:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F32DF8025E; Sat, 28 Dec 2019 14:43:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770054.outbound.protection.outlook.com [40.107.77.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D88BF80139
 for <alsa-devel@alsa-project.org>; Sat, 28 Dec 2019 14:43:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D88BF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="Yy4RZ8ge"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3wQ8Q/QbVhi5s7mXL6NNI6pf9d9D4Np9NGCbDTdC5eUgBFmR2G+s2jV57SN9u2qV9n3GjFSTsETLXzNIfr3ueaTaLImkuWDRfMgg0W+Fj74SRPdZF4V8kMLzuOzIp+8ICp4sNkGpX/elIuJf+Z+us27R1xD6mrcuA3mD88ib3aciLOeEI2YbTYE3Mg1zicUWX4hNrXhHFT82MdQ+UbLU8EzX9RQ9R/fc8lek8cWHccD9G/54J9HuUumUzAKO91E/7+W1CzYIeFY2Qf4oX7RiiEvX+g6eoe98gl9k6h6NFsrr5oLHDDwRNg6fL+RqXzUmjIUPD5FdDK6qEw/XSkB1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/RFWlDX2ub9W8E3hHnzUmRaVV77Ih+xGyqlDZOvhuw=;
 b=JQaZvVIguAoJuC46EV7ZgHOqF5VAFX3XmAXIJ5kk032yqxRz/vMY0lulKIbnNzBp0JluJsnlQv4VrWVz6G2BOrgB/u7vr+7mKJLGuPJ47DPrpcqc9B8OdAseEZ1vsHPMy/If5V4U/XOzqAqoBg5orV6lhprILAoJStZd5NdPB6+VcOq10pt18B5d7MYkzJgFcsntbnze5iBsGjJ+pimsGT6PgytmDRXBFfLu148kSzahNGSej1xKDxdulRXUG5JS+7rBaqZY2OEdU+D1Fue3uqulrFraraL3GxjzXo0EB5oW5ZoeGlATtM8Giqcq9sSN9nr64W/I0iDiOsxBCAyvqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/RFWlDX2ub9W8E3hHnzUmRaVV77Ih+xGyqlDZOvhuw=;
 b=Yy4RZ8geVEcQOL4zSWqqRnUMmbC8KD+718IPHpBqTSM18kFqavkFonB/1QU4XLTYJ6tmpeaj9QaZ/dlqtotcpsCoEe079BGrOSmRIAABtIzgjg5Pjvu/fckM0nBKf3/eLWD/jcA4xdPTihPLl7LvoUy5NxnCwLMGIp7M9QbYL8o=
Received: from SN1PR12CA0108.namprd12.prod.outlook.com (2603:10b6:802:21::43)
 by CH2PR12MB4085.namprd12.prod.outlook.com (2603:10b6:610:79::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11; Sat, 28 Dec
 2019 13:42:56 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::209) by SN1PR12CA0108.outlook.office365.com
 (2603:10b6:802:21::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.15 via Frontend
 Transport; Sat, 28 Dec 2019 13:42:56 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2581.11 via Frontend Transport; Sat, 28 Dec 2019 13:42:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 28 Dec
 2019 07:42:55 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sat, 28 Dec
 2019 07:42:55 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sat, 28 Dec 2019 07:42:51 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Sat, 28 Dec 2019 19:10:56 +0530
Message-ID: <1577540460-21438-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577540460-21438-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1577540460-21438-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(428003)(189003)(199004)(4326008)(70206006)(8676002)(26005)(81166006)(81156014)(19627235002)(356004)(70586007)(186003)(7696005)(426003)(336012)(316002)(7416002)(109986005)(36756003)(5660300002)(8936002)(54906003)(2906002)(478600001)(30864003)(86362001)(2616005)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4085; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe0f7b3e-0a9f-4b95-24d3-08d78b9bd82c
X-MS-TrafficTypeDiagnostic: CH2PR12MB4085:|CH2PR12MB4085:
X-Microsoft-Antispam-PRVS: <CH2PR12MB40852A9DE7674CCCF4AFBC6CE7250@CH2PR12MB4085.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 02652BD10A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7P/EQHk7yjpnHeLYoUSqHOlXiWFbnVjci6KRyCE15B0J+3QMfQLgwQJZKUY9ocVyKJQ1yh9KlIfmvax0llhgW5oEVXwQLWiW8tbJ8ZEB8Mv2hrJO0KftJ2CrKbjK8PSVXw7d8S07uQ4JOCbMGwvAiYP4oZLtAdaZ/Qr0G9eLpkQpbbrxwenbID2nhbYxDErTxQ2Z+VkWd1vLS2AviqfDXBbbZ7tS42EjmLrDp+AiN5Q57/ZTG9BurWyH4xaEb7nvQd44wKHTtV8dSmTthwZGg7etrMXJlZPWLrWD4aXDrqE2o1Kbs/6eo11GSkQCnZGoo97dpFOd6+vfEkygAXHXNuczMyjJOz9Pq5lokulGt8TMQkjLS2kQKtJcHJLNj3Cq1jiR8Whb+iDPaOQuqITAJUHjFcIFBPT+v5b78wH9rE8n7Kveq9WGIrPGVD8zZUYR+vheJcIOtNk6NYOoUocT6CcQ0OsfJ5FrlABUGAfSwLs=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2019 13:42:55.8317 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0f7b3e-0a9f-4b95-24d3-08d78b9bd82c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4085
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, "Gustavo
 A. R. Silva" <gustavo@embeddedor.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>, Liam
 Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 broonie@kernel.org, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>, Dan
 Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH 2/6] ASoC: amd: Enabling I2S instance in DMA
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
This enables to open and close on the SP instance for
playback and capture.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-i2s.c     | 123 ++++++++++++++++----
 sound/soc/amd/raven/acp3x-pcm-dma.c | 217 +++++++++++++++++++++++++-----------
 sound/soc/amd/raven/acp3x.h         |  76 ++++++++++---
 3 files changed, 312 insertions(+), 104 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index d9bc0fc..368e4c85 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -27,10 +27,10 @@ static int acp3x_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
 	mode = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
 	switch (mode) {
 	case SND_SOC_DAIFMT_I2S:
-		adata->tdm_mode = false;
+		adata->tdm_mode = TDM_DISABLE;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
-		adata->tdm_mode = true;
+		adata->tdm_mode = TDM_ENABLE;
 		break;
 	default:
 		return -EINVAL;
@@ -86,10 +86,22 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
 {
 	struct i2s_stream_instance *rtd;
+	struct snd_soc_pcm_runtime *prtd;
+	struct snd_soc_card *card;
+	struct acp3x_platform_info *pinfo;
 	u32 val;
 	u32 reg_val;
 
+	prtd = substream->private_data;
 	rtd = substream->runtime->private_data;
+	card = prtd->card;
+	pinfo = snd_soc_card_get_drvdata(card);
+	if (pinfo) {
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			rtd->i2s_instance = pinfo->play_i2s_instance;
+		else
+			rtd->i2s_instance = pinfo->cap_i2s_instance;
+	}
 
 	/* These values are as per Hardware Spec */
 	switch (params_format(params)) {
@@ -109,11 +121,25 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
 	default:
 		return -EINVAL;
 	}
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		reg_val = mmACP_BTTDM_ITER;
-	else
-		reg_val = mmACP_BTTDM_IRER;
-
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			reg_val = mmACP_BTTDM_ITER;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = mmACP_I2STDM_ITER;
+		}
+	} else {
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			reg_val = mmACP_BTTDM_IRER;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = mmACP_I2STDM_IRER;
+		}
+	}
 	val = rv_readl(rtd->acp3x_base + reg_val);
 	val = val | (rtd->xfer_resolution  << 3);
 	rv_writel(val, rtd->acp3x_base + reg_val);
@@ -124,10 +150,21 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 				int cmd, struct snd_soc_dai *dai)
 {
 	struct i2s_stream_instance *rtd;
-	u32 val, period_bytes;
-	int ret, reg_val;
+	struct snd_soc_pcm_runtime *prtd;
+	struct snd_soc_card *card;
+	struct acp3x_platform_info *pinfo;
+	u32 ret, val, period_bytes, reg_val, ier_val, water_val;
 
+	prtd = substream->private_data;
 	rtd = substream->runtime->private_data;
+	card = prtd->card;
+	pinfo = snd_soc_card_get_drvdata(card);
+	if (pinfo) {
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			rtd->i2s_instance = pinfo->play_i2s_instance;
+		else
+			rtd->i2s_instance = pinfo->cap_i2s_instance;
+	}
 	period_bytes = frames_to_bytes(substream->runtime,
 			substream->runtime->period_size);
 	switch (cmd) {
@@ -137,31 +174,75 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
 		rtd->bytescount = acp_get_byte_count(rtd,
 						substream->stream);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			reg_val = mmACP_BTTDM_ITER;
-			rv_writel(period_bytes, rtd->acp3x_base +
-					mmACP_BT_TX_INTR_WATERMARK_SIZE);
+			switch (rtd->i2s_instance) {
+			case I2S_BT_INSTANCE:
+				water_val =
+					mmACP_BT_TX_INTR_WATERMARK_SIZE;
+				reg_val = mmACP_BTTDM_ITER;
+				ier_val = mmACP_BTTDM_IER;
+				break;
+			case I2S_SP_INSTANCE:
+			default:
+				water_val =
+					mmACP_I2S_TX_INTR_WATERMARK_SIZE;
+				reg_val = mmACP_I2STDM_ITER;
+				ier_val = mmACP_I2STDM_IER;
+			}
 		} else {
-			reg_val = mmACP_BTTDM_IRER;
-			rv_writel(period_bytes, rtd->acp3x_base +
-					mmACP_BT_RX_INTR_WATERMARK_SIZE);
+			switch (rtd->i2s_instance) {
+			case I2S_BT_INSTANCE:
+				water_val =
+					mmACP_BT_RX_INTR_WATERMARK_SIZE;
+				reg_val = mmACP_BTTDM_IRER;
+				ier_val = mmACP_BTTDM_IER;
+				break;
+			case I2S_SP_INSTANCE:
+			default:
+				water_val =
+					mmACP_I2S_RX_INTR_WATERMARK_SIZE;
+				reg_val = mmACP_I2STDM_IRER;
+				ier_val = mmACP_I2STDM_IER;
+			}
 		}
+		rv_writel(period_bytes, rtd->acp3x_base + water_val);
 		val = rv_readl(rtd->acp3x_base + reg_val);
 		val = val | BIT(0);
 		rv_writel(val, rtd->acp3x_base + reg_val);
-		rv_writel(1, rtd->acp3x_base + mmACP_BTTDM_IER);
+		rv_writel(1, rtd->acp3x_base + ier_val);
+		ret = 0;
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			reg_val = mmACP_BTTDM_ITER;
-		else
-			reg_val = mmACP_BTTDM_IRER;
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			switch (rtd->i2s_instance) {
+			case I2S_BT_INSTANCE:
+				reg_val = mmACP_BTTDM_ITER;
+				ier_val = mmACP_BTTDM_IER;
+				break;
+			case I2S_SP_INSTANCE:
+			default:
+				reg_val = mmACP_I2STDM_ITER;
+				ier_val = mmACP_I2STDM_IER;
+			}
 
+		} else {
+			switch (rtd->i2s_instance) {
+			case I2S_BT_INSTANCE:
+				reg_val = mmACP_BTTDM_IRER;
+				ier_val = mmACP_BTTDM_IER;
+				break;
+			case I2S_SP_INSTANCE:
+			default:
+				reg_val = mmACP_I2STDM_IRER;
+				ier_val = mmACP_I2STDM_IER;
+			}
+		}
 		val = rv_readl(rtd->acp3x_base + reg_val);
 		val = val & ~BIT(0);
 		rv_writel(val, rtd->acp3x_base + reg_val);
-		rv_writel(0, rtd->acp3x_base + mmACP_BTTDM_IER);
+		rv_writel(0, rtd->acp3x_base + ier_val);
+		ret = 0;
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 9f6ea3e..040a8be5 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -193,15 +193,31 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
 static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 {
 	u16 page_idx;
-	u32 low, high, val, acp_fifo_addr;
-	dma_addr_t addr = rtd->dma_addr;
+	u32 low, high, val, acp_fifo_addr, reg_fifo_addr;
+	u32 reg_ringbuf_size, reg_dma_size, reg_fifo_size;
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
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			val = ACP_SRAM_SP_PB_PTE_OFFSET;
+		}
+	} else {
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			val = ACP_SRAM_BT_CP_PTE_OFFSET;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			val = ACP_SRAM_SP_CP_PTE_OFFSET;
+		}
+	}
 	/* Group Enable */
 	rv_writel(ACP_SRAM_PTE_OFFSET | BIT(31), rtd->acp3x_base +
 		  mmACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
@@ -223,38 +239,61 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
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
+			reg_ringbuf_size = mmACP_BT_TX_RINGBUFSIZE;
+			reg_dma_size = mmACP_BT_TX_DMA_SIZE;
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+						BT_PB_FIFO_ADDR_OFFSET;
+			reg_fifo_addr = mmACP_BT_TX_FIFOADDR;
+			reg_fifo_size = mmACP_BT_TX_FIFOSIZE;
+			rv_writel(I2S_BT_TX_MEM_WINDOW_START,
+				rtd->acp3x_base + mmACP_BT_TX_RINGBUFADDR);
+			break;
+
+		case I2S_SP_INSTANCE:
+		default:
+			reg_ringbuf_size = mmACP_I2S_TX_RINGBUFSIZE;
+			reg_dma_size = mmACP_I2S_TX_DMA_SIZE;
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+						SP_PB_FIFO_ADDR_OFFSET;
+			reg_fifo_addr =	mmACP_I2S_TX_FIFOADDR;
+			reg_fifo_size = mmACP_I2S_TX_FIFOSIZE;
+			rv_writel(I2S_SP_TX_MEM_WINDOW_START,
+				rtd->acp3x_base + mmACP_I2S_TX_RINGBUFADDR);
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
-	}
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			reg_ringbuf_size = mmACP_BT_RX_RINGBUFSIZE;
+			reg_dma_size = mmACP_BT_RX_DMA_SIZE;
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+						BT_CAPT_FIFO_ADDR_OFFSET;
+			reg_fifo_addr = mmACP_BT_RX_FIFOADDR;
+			reg_fifo_size = mmACP_BT_RX_FIFOSIZE;
+			rv_writel(I2S_BT_RX_MEM_WINDOW_START,
+				rtd->acp3x_base + mmACP_BT_RX_RINGBUFADDR);
+			break;
 
-	/* Enable  watermark/period interrupt to host */
-	rv_writel(BIT(BT_TX_THRESHOLD) | BIT(BT_RX_THRESHOLD),
-		  rtd->acp3x_base + mmACP_EXTERNAL_INTR_CNTL);
+		case I2S_SP_INSTANCE:
+		default:
+			reg_ringbuf_size = mmACP_I2S_RX_RINGBUFSIZE;
+			reg_dma_size = mmACP_I2S_RX_DMA_SIZE;
+			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
+						SP_CAPT_FIFO_ADDR_OFFSET;
+			reg_fifo_addr = mmACP_I2S_RX_FIFOADDR;
+			reg_fifo_size = mmACP_I2S_RX_FIFOSIZE;
+			rv_writel(I2S_SP_RX_MEM_WINDOW_START,
+				rtd->acp3x_base + mmACP_I2S_RX_RINGBUFADDR);
+		}
+	}
+	rv_writel(MAX_BUFFER, rtd->acp3x_base + reg_ringbuf_size);
+	rv_writel(DMA_SIZE, rtd->acp3x_base + reg_dma_size);
+	rv_writel(acp_fifo_addr, rtd->acp3x_base + reg_fifo_addr);
+	rv_writel(FIFO_SIZE, rtd->acp3x_base + reg_fifo_size);
+	rv_writel(BIT(I2S_RX_THRESHOLD) | BIT(BT_RX_THRESHOLD)
+		| BIT(I2S_TX_THRESHOLD) | BIT(BT_TX_THRESHOLD),
+		rtd->acp3x_base + mmACP_EXTERNAL_INTR_CNTL);
 }
 
 static int acp3x_dma_open(struct snd_soc_component *component,
@@ -287,17 +326,21 @@ static int acp3x_dma_open(struct snd_soc_component *component,
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
-	return 0;
+	return ret;
 }
 
 
@@ -305,13 +348,27 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
+	struct i2s_stream_instance *rtd;
+	struct snd_soc_pcm_runtime *prtd;
+	struct snd_soc_card *card;
+	struct acp3x_platform_info *pinfo;
 	u64 size;
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct i2s_stream_instance *rtd = runtime->private_data;
 
+	prtd = substream->private_data;
+	card = prtd->card;
+	pinfo = snd_soc_card_get_drvdata(card);
+	rtd = substream->runtime->private_data;
 	if (!rtd)
 		return -EINVAL;
 
+	if (pinfo)
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			rtd->i2s_instance = pinfo->play_i2s_instance;
+		else
+			rtd->i2s_instance = pinfo->cap_i2s_instance;
+	else
+		pr_err("pinfo failed\n");
+
 	size = params_buffer_bytes(params);
 	rtd->dma_addr = substream->dma_buffer.addr;
 	rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
@@ -322,12 +379,25 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
 static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_soc_component *component,
 					   struct snd_pcm_substream *substream)
 {
+	struct snd_soc_pcm_runtime *prtd;
+	struct snd_soc_card *card;
+	struct acp3x_platform_info *pinfo;
 	struct i2s_stream_instance *rtd;
 	u32 pos;
 	u32 buffersize;
 	u64 bytescount;
 
+	prtd = substream->private_data;
+	card = prtd->card;
 	rtd = substream->runtime->private_data;
+	pinfo = snd_soc_card_get_drvdata(card);
+	if (pinfo) {
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			rtd->i2s_instance = pinfo->play_i2s_instance;
+		else
+			rtd->i2s_instance = pinfo->cap_i2s_instance;
+	}
+
 	buffersize = frames_to_bytes(substream->runtime,
 				     substream->runtime->buffer_size);
 	bytescount = acp_get_byte_count(rtd, substream->stream);
@@ -363,15 +433,19 @@ static int acp3x_dma_close(struct snd_soc_component *component,
 	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
 	adata = dev_get_drvdata(component->dev);
 
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
 	return 0;
 }
@@ -478,8 +552,10 @@ static int acp3x_resume(struct device *dev)
 {
 	struct i2s_dev_data *adata;
 	int status;
-	u32 val;
+	u32 val, reg_val, frmt_val;
 
+	reg_val = 0;
+	frmt_val = 0;
 	adata = dev_get_drvdata(dev);
 	status = acp3x_init(adata->acp3x_base);
 	if (status)
@@ -489,32 +565,39 @@ static int acp3x_resume(struct device *dev)
 		struct i2s_stream_instance *rtd =
 			adata->play_stream->runtime->private_data;
 		config_acp3x_dma(rtd, SNDRV_PCM_STREAM_PLAYBACK);
-		rv_writel((rtd->xfer_resolution  << 3),
-			  rtd->acp3x_base + mmACP_BTTDM_ITER);
-		if (adata->tdm_mode == true) {
-			rv_writel(adata->tdm_fmt, adata->acp3x_base +
-				  mmACP_BTTDM_TXFRMT);
-			val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
-			rv_writel((val | 0x2), adata->acp3x_base +
-				  mmACP_BTTDM_ITER);
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			reg_val = mmACP_BTTDM_ITER;
+			frmt_val = mmACP_BTTDM_TXFRMT;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = mmACP_I2STDM_ITER;
+			frmt_val = mmACP_I2STDM_TXFRMT;
 		}
+	rv_writel((rtd->xfer_resolution  << 3), rtd->acp3x_base + reg_val);
 	}
-
 	if (adata->capture_stream && adata->capture_stream->runtime) {
 		struct i2s_stream_instance *rtd =
 			adata->capture_stream->runtime->private_data;
 		config_acp3x_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
-		rv_writel((rtd->xfer_resolution  << 3),
-			  rtd->acp3x_base + mmACP_BTTDM_IRER);
-		if (adata->tdm_mode == true) {
-			rv_writel(adata->tdm_fmt, adata->acp3x_base +
-				  mmACP_BTTDM_RXFRMT);
-			val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
-			rv_writel((val | 0x2), adata->acp3x_base +
-				  mmACP_BTTDM_IRER);
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			reg_val = mmACP_BTTDM_IRER;
+			frmt_val = mmACP_BTTDM_RXFRMT;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = mmACP_I2STDM_IRER;
+			frmt_val = mmACP_I2STDM_RXFRMT;
 		}
+	rv_writel((rtd->xfer_resolution  << 3), rtd->acp3x_base + reg_val);
+	}
+	if (adata->tdm_mode == TDM_ENABLE) {
+		rv_writel(adata->tdm_fmt, adata->acp3x_base + frmt_val);
+		val = rv_readl(adata->acp3x_base + reg_val);
+		rv_writel(val | 0x2, adata->acp3x_base + reg_val);
 	}
-
 	rv_writel(1, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
 	return 0;
 }
@@ -524,8 +607,8 @@ static int acp3x_pcm_runtime_suspend(struct device *dev)
 {
 	struct i2s_dev_data *adata;
 	int status;
-	adata = dev_get_drvdata(dev);
 
+	adata = dev_get_drvdata(dev);
 	status = acp3x_deinit(adata->acp3x_base);
 	if (status)
 		dev_err(dev, "ACP de-init failed\n");
@@ -541,8 +624,8 @@ static int acp3x_pcm_runtime_resume(struct device *dev)
 {
 	struct i2s_dev_data *adata;
 	int status;
-	adata = dev_get_drvdata(dev);
 
+	adata = dev_get_drvdata(dev);
 	status = acp3x_init(adata->acp3x_base);
 	if (status)
 		return -ENODEV;
diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index a1f03fc..a1cdc4e 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -7,6 +7,11 @@
 
 #include "chip_offset_byte.h"
 #include <sound/pcm.h>
+#define I2S_SP_INSTANCE                 0x01
+#define I2S_BT_INSTANCE                 0x02
+
+#define TDM_ENABLE 1
+#define TDM_DISABLE 0
 
 #define ACP3x_DEVS		3
 #define ACP3x_PHY_BASE_ADDRESS 0x1240000
@@ -18,8 +23,11 @@
 #define ACP3x_BT_TDM_REG_START	0x1242800
 #define ACP3x_BT_TDM_REG_END	0x1242810
 #define I2S_MODE	0x04
+#define	I2S_RX_THRESHOLD	27
+#define	I2S_TX_THRESHOLD	28
 #define	BT_TX_THRESHOLD 26
 #define	BT_RX_THRESHOLD 25
+#define ACP_ERR_INTR_MASK	29
 #define ACP3x_POWER_ON 0x00
 #define ACP3x_POWER_ON_IN_PROGRESS 0x01
 #define ACP3x_POWER_OFF 0x02
@@ -27,19 +35,28 @@
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
@@ -66,14 +83,20 @@ struct i2s_dev_data {
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
 
@@ -93,15 +116,36 @@ static inline u64 acp_get_byte_count(struct i2s_stream_instance *rtd,
 	u64 byte_count;
 
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
-		byte_count = rv_readl(rtd->acp3x_base +
-				mmACP_BT_TX_LINEARPOSITIONCNTR_HIGH);
-		byte_count |= rv_readl(rtd->acp3x_base +
-				mmACP_BT_TX_LINEARPOSITIONCNTR_LOW);
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			byte_count = rv_readl(rtd->acp3x_base +
+					mmACP_BT_TX_LINEARPOSITIONCNTR_HIGH);
+			byte_count |= rv_readl(rtd->acp3x_base +
+					mmACP_BT_TX_LINEARPOSITIONCNTR_LOW);
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			byte_count = rv_readl(rtd->acp3x_base +
+					mmACP_I2S_TX_LINEARPOSITIONCNTR_HIGH);
+			byte_count |= rv_readl(rtd->acp3x_base +
+					mmACP_I2S_TX_LINEARPOSITIONCNTR_LOW);
+		}
+
 	} else {
-		byte_count = rv_readl(rtd->acp3x_base +
-				mmACP_BT_RX_LINEARPOSITIONCNTR_HIGH);
-		byte_count |= rv_readl(rtd->acp3x_base +
-				mmACP_BT_RX_LINEARPOSITIONCNTR_LOW);
+		switch (rtd->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			byte_count = rv_readl(rtd->acp3x_base +
+					mmACP_BT_RX_LINEARPOSITIONCNTR_HIGH);
+			byte_count |= rv_readl(rtd->acp3x_base +
+					mmACP_BT_RX_LINEARPOSITIONCNTR_LOW);
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			byte_count = rv_readl(rtd->acp3x_base +
+					mmACP_I2S_RX_LINEARPOSITIONCNTR_HIGH);
+			byte_count |= rv_readl(rtd->acp3x_base +
+					mmACP_I2S_RX_LINEARPOSITIONCNTR_LOW);
+		}
 	}
 	return byte_count;
 }
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
