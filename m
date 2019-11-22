Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFD110693B
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 10:49:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24EBC17FB;
	Fri, 22 Nov 2019 10:48:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24EBC17FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574416146;
	bh=At7LSm9IU2ABof2JvfPB7qAhnPwX0a8arTWpoCA2Qw4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rsOGVPlPuAcGu8bs8/Cisb5DkNEqyX59y8D6aP9a2vWIxYN4RZNGxqiknb6oEffvc
	 7os7ciiiEmxfBfhJG+oUZ9hCK3WgNgOtUXMhhAd4EL6iJpa9riGFPRPOcw2tFQBGVz
	 RANLqY16W77d81HKK79PCv7omTO+uumD+xlSWuKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFD20F801EC;
	Fri, 22 Nov 2019 10:46:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CD0DF801DA; Fri, 22 Nov 2019 10:46:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700071.outbound.protection.outlook.com [40.107.70.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 846EEF80171
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 10:46:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 846EEF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="mY19/Aft"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aV3bmn0zcLjzXsZriAYqvScD7Fwc1+KCdmE3+oYN/N/KVLQyQPE1HzHpIa8uUse/0h5p7NP5JP8U51d9Y/dFNx/QHWIyqav7oIQ+Vtg2E38zjgi+LjIKx+abfSmk3PTE8IybkcX4PoGfqIdHNcLkuKYq/hgxCbnVwmlBy/fvWhYoPcmM22ZAFK04NerjawZ+sfpPu6mjZRQNpJzsMd8oFBQSLdBKOJ82n7q/bomHTEzWT/MvBBm1TzEo7LQ/JNOOXd3C9yR8f/I8biEBb35xcQDyTh4oaI20bbvxS1TG1GK0HNavR+4eQrUWgir3cZUVWgW2tBQ82Um02c2hceAPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/ybiMx7JBdObs1TBrwfluLoOP4MqQZyHu3RnO0eUas=;
 b=JoAODvUgVVA84X5DbAk8i/RuFvdCkS5D/kVOT58D+0nVynAOKk5sCRwFaayJvD46WP2zagJd5AvggAxPbbpCKu9EzBeKVDBf/7M1WWuUf6iYgS1UeNvRxcef4IaZHK+MhCO1ktnvsNISilK6jgpVr0u3yKqWGpiyYWY7r7ZuetsTWXcpy+zZpKZwVCKrJELclpml73/ye+9wa6WN9FGF+0k2a7d2hfLjzft/lLDamCJ7U0V+JzmdECUvQJmxepeW9B5htbVOKpjs8K2po1Kwws38jMqfZvj/QKTdsFrsPLGexsO0LVatapThQ8jQbLrhawVDnY7GTLkvlwWFBJklxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/ybiMx7JBdObs1TBrwfluLoOP4MqQZyHu3RnO0eUas=;
 b=mY19/AftZmbhMr9vK0VAky3PPH2ep0zUe4vtCmCU7i32EXKO6AaoUH/8BB26ggnZfp9avU1gZ69L/nPImR2qY0ewXNQGiVvoOrKaIxslDw6qSXguab7lgiFzDnAoxyEBchmLPI52vaaej5wYxVDRFFksbKUn89QWaux7ljrUjZs=
Received: from MN2PR12CA0003.namprd12.prod.outlook.com (2603:10b6:208:a8::16)
 by CY4PR12MB1766.namprd12.prod.outlook.com (2603:10b6:903:122::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.21; Fri, 22 Nov
 2019 09:46:00 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::200) by MN2PR12CA0003.outlook.office365.com
 (2603:10b6:208:a8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2474.18 via Frontend
 Transport; Fri, 22 Nov 2019 09:45:59 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Fri, 22 Nov 2019 09:45:59 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 22 Nov
 2019 03:45:59 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 22 Nov 2019 03:45:55 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 22 Nov 2019 15:14:23 +0530
Message-ID: <1574415866-29715-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574415866-29715-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574415866-29715-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(39860400002)(376002)(136003)(396003)(346002)(428003)(189003)(199004)(2616005)(478600001)(11346002)(26005)(446003)(14444005)(186003)(316002)(426003)(336012)(36756003)(47776003)(30864003)(8676002)(2906002)(7696005)(70206006)(86362001)(4326008)(8936002)(81156014)(81166006)(50226002)(53416004)(50466002)(5660300002)(19627235002)(70586007)(1671002)(48376002)(51416003)(7416002)(305945005)(76176011)(356004)(6666004)(54906003)(16586007)(109986005)(266003)(473944003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1766; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a026d254-18d0-42d4-50d9-08d76f30c7d9
X-MS-TrafficTypeDiagnostic: CY4PR12MB1766:|CY4PR12MB1766:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1766C6EF21F7D2ADE1E3FBFCE7490@CY4PR12MB1766.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-Forefront-PRVS: 02296943FF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GjndhfWSN4+pjsQSXbFS7xpPxV+AWKUrDuuGBkRoLz8aYiQtLDQaD9MWhJmmBBdFHktnYLnnyLqFFeRs1eJfT75C9AepZ/r11Ny3qEmk99lCKUzt1Ld2WlyXwENaP4wWReptUwaAIwAOZxIppzXSepCoS68Ais/uytGsTLE3K+5vnYiess7si3Omj2J8wVfOAaVa4XLMSPqw9oBkCJWUYOdrqzXbgWWmnE5cOXCxMZBnhbE4WaOG5vA1yUTJLF6CPcOuHi0sHvtnrZo/DTxMR8JEyWGhQ/20oT3dgnzkNsnGSwo4hGtiftgyrjaDYQL48nC1rl0olzSIDNcTC/aAXotxGkUakzxbB1Pdgd2sljy43hhK+86GEx6/ZyNVgiedcWYhjJW+PL5Iz9nuWYFJvJtq5J6vOg5jLARh7el29IjcZQep08gyo1z7AnmsiDd8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2019 09:45:59.7805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a026d254-18d0-42d4-50d9-08d76f30c7d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1766
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 pierre-louis.bossart@linux.intel.com, Ravulapati
 Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>, Akshu.Agrawal@amd.com,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH v12 3/6] ASoC: amd: Enabling I2S instance in
	DMA and DAI
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
 sound/soc/amd/raven/acp3x-i2s.c     | 123 +++++++++++++++++----
 sound/soc/amd/raven/acp3x-pcm-dma.c | 214 ++++++++++++++++++++++++------------
 sound/soc/amd/raven/acp3x.h         |  77 ++++++++++---
 3 files changed, 309 insertions(+), 105 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index cdc1c61..7f05782 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -28,10 +28,10 @@ static int acp3x_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
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
@@ -87,10 +87,22 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
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
@@ -110,11 +122,25 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
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
@@ -125,10 +151,21 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
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
@@ -138,31 +175,75 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
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
index f8ad7ce..77f2ed5 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -194,15 +194,31 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
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
@@ -224,38 +240,61 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
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
@@ -288,17 +327,21 @@ static int acp3x_dma_open(struct snd_soc_component *component,
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
 
 
@@ -306,16 +349,28 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
-	struct snd_pcm_runtime *runtime;
 	struct i2s_stream_instance *rtd;
+	struct snd_soc_pcm_runtime *prtd;
+	struct snd_soc_card *card;
+	struct acp3x_platform_info *pinfo;
 	int status;
 	u64 size;
 
-	runtime = substream->runtime;
-	rtd = substream->private_data;
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
 	status = snd_pcm_lib_malloc_pages(substream, size);
 	if (status < 0)
@@ -336,12 +391,25 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
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
@@ -386,15 +454,19 @@ static int acp3x_dma_close(struct snd_soc_component *component,
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
@@ -503,7 +575,7 @@ static int acp3x_resume(struct device *dev)
 {
 	struct i2s_dev_data *adata;
 	int status;
-	u32 val;
+	u32 val, reg_val, frmt_val;
 
 	adata = dev_get_drvdata(dev);
 	status = acp3x_init(adata->acp3x_base);
@@ -514,32 +586,38 @@ static int acp3x_resume(struct device *dev)
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
 	}
-
+	rv_writel((rtd->xfer_resolution  << 3), rtd->acp3x_base + reg_val);
+	if (adata->tdm_mode == TDM_ENABLE) {
+		rv_writel(adata->tdm_fmt, adata->acp3x_base + frmt_val);
+		val = rv_readl(adata->acp3x_base + reg_val);
+		rv_writel(val | 0x2, adata->acp3x_base + reg_val);
+	}
 	rv_writel(1, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
 	return 0;
 }
@@ -549,8 +627,8 @@ static int acp3x_pcm_runtime_suspend(struct device *dev)
 {
 	struct i2s_dev_data *adata;
 	int status;
-	adata = dev_get_drvdata(dev);
 
+	adata = dev_get_drvdata(dev);
 	status = acp3x_deinit(adata->acp3x_base);
 	if (status)
 		dev_err(dev, "ACP de-init failed\n");
@@ -566,8 +644,8 @@ static int acp3x_pcm_runtime_resume(struct device *dev)
 {
 	struct i2s_dev_data *adata;
 	int status;
-	adata = dev_get_drvdata(dev);
 
+	adata = dev_get_drvdata(dev);
 	status = acp3x_init(adata->acp3x_base);
 	if (status)
 		return -ENODEV;
diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index a6c6d63..ed1acbc 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -7,6 +7,12 @@
 
 #include "chip_offset_byte.h"
 
+#define I2S_SP_INSTANCE                 0x01
+#define I2S_BT_INSTANCE                 0x02
+
+#define TDM_ENABLE 1
+#define TDM_DISABLE 0
+
 #define ACP3x_DEVS		3
 #define ACP3x_PHY_BASE_ADDRESS 0x1240000
 #define	ACP3x_I2S_MODE	0
@@ -17,8 +23,11 @@
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
@@ -26,19 +35,28 @@
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
@@ -65,14 +83,20 @@ struct i2s_dev_data {
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
 
@@ -92,15 +116,36 @@ static inline u64 acp_get_byte_count(struct i2s_stream_instance *rtd,
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
