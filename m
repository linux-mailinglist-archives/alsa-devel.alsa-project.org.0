Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE0BF18EB
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 15:40:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D5FE16AF;
	Wed,  6 Nov 2019 15:39:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D5FE16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573051248;
	bh=z4gXTInBGZzlff8dGPBI5TKueIvdOA3fqFF+LIrP000=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AyUGLrnaJ+M35pybed1YB9U9+dHIYGiIG7f+3vtwowRNqBx+iKBY751yCpkLIDr0n
	 7hqs83x9DTRUEn9I9qD8Pd8gFsCTwlV812+l8kSIQ9Y6lh09M618/RrLGofrRBtiYk
	 ikQRb6O1JSM9SV7j3hkLYFtOL3rkHcHokhyhMLmU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 243BCF80610;
	Wed,  6 Nov 2019 15:38:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37913F80611; Wed,  6 Nov 2019 15:38:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DATE_IN_FUTURE_12_24,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820077.outbound.protection.outlook.com [40.107.82.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2948BF8060F
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 15:38:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2948BF8060F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="FxVcurbk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IzaFcgo8xkS2FFCbAy/zBkN6FY3W8u/IRxoZj4QqssoFpBXhUai4VJOiUsLU3hcavPJUSBaXMiUdpyBc9Ic9zLAwqJy1kPVOM6thBSbr59lVR5o7bYkiuIwskjmd0iFm8TVVkCiNjm/AFDWau4fNBqJ4o3khW8vPz/giSiq809lIxIEpvP+x5VSXqhdYHu2zQ7STfGp9NvK3JgpE+m3F9Bcf2tDJxc3fm9m3xYTATH3pAf3hpAo9hVdnYLDn3T/pyoWYm8elmihE6OZSOLZIym9v+PrA5Q1ueXFjzamoMY8QLM0OOsykU2vqR/PldM9a/vjiLS//Vp83C5vbHcrBkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGW2GnTMbKHnaenQVhQN1z8tNRwWiAe5wv/2oecD1MA=;
 b=JI1vrOVU/DpSehQkNMHAzcHvyuiZvz+YU/WM/v73NldtDtyJFqjuq+Z5BlBzgyP+kugtr63MPNUeelAOo7ookheP09jzHYCZ9n2KJ9ews02vkq+nZy7qQJKnU0GfdYMNZvlbrOCr3xz51bHODcdBa8t0Z7KSx3GW33e0oi8oUzK6R2ZTEgAMO2N4fk/X9kKXyAE5wfI6WnTSwsXAofQRCqyX1cD8p9oyUJ4f2U3GrzrlNn0byXkQHLOS6xoEWG7xKZgxoeCLSQYO/dvOyD5rIxzlTb1yZR2YTEiQwsPzZ9TuhNGv9nEjV6TdUFs1UkpXYOvM3SBp27tRQXD4xItm0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGW2GnTMbKHnaenQVhQN1z8tNRwWiAe5wv/2oecD1MA=;
 b=FxVcurbkKtJUikKzZnVIUOv/plPs3WoD+H2SmcjWkmP/osQWmxEhP5/8AKhRe4Pf7QNO9cCIN/F7QYC8XXfLcFcTyYwY3nw65XnpNDuLCVcMENN96rlu/sMISS3v/owdS9w4oADT37qjxBR2eCTaNkTuKXNM0Ct3to0VJhVrMFQ=
Received: from CY4PR1201CA0014.namprd12.prod.outlook.com
 (2603:10b6:910:16::24) by CY4PR12MB1687.namprd12.prod.outlook.com
 (2603:10b6:910:3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.22; Wed, 6 Nov
 2019 14:37:59 +0000
Received: from DM3NAM03FT041.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by CY4PR1201CA0014.outlook.office365.com
 (2603:10b6:910:16::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2430.20 via Frontend
 Transport; Wed, 6 Nov 2019 14:37:59 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM3NAM03FT041.mail.protection.outlook.com (10.152.83.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2430.20 via Frontend Transport; Wed, 6 Nov 2019 14:37:59 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 6 Nov 2019
 08:37:58 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Wed, 6 Nov 2019 08:37:47 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Thu, 7 Nov 2019 20:06:00 +0530
Message-ID: <1573137364-5592-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573137364-5592-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573137364-5592-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(1496009)(136003)(376002)(39860400002)(396003)(346002)(428003)(199004)(189003)(47776003)(316002)(7696005)(51416003)(76176011)(16586007)(30864003)(54906003)(4326008)(186003)(70206006)(70586007)(86362001)(26005)(305945005)(109986005)(478600001)(50226002)(8936002)(356004)(486006)(2616005)(446003)(11346002)(476003)(5660300002)(126002)(6666004)(336012)(1671002)(36756003)(19627235002)(48376002)(53416004)(2906002)(14444005)(426003)(81166006)(50466002)(81156014)(8676002)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1687; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cba6e09-6b93-4984-b719-08d762c6ebae
X-MS-TrafficTypeDiagnostic: CY4PR12MB1687:|CY4PR12MB1687:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1687FCF675684C5C54FDAC4AE7790@CY4PR12MB1687.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-Forefront-PRVS: 02135EB356
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BSchGCbp7IIDnOroKwb+yfZKq6Bl5DKqVyHKMmDKO58FmfDEh4TsuXrab1U/VS96aTRNksDHuVEYBg1I2BNPQShWfEZ8ytZXAaquMtCsz1mtIezExihxGJeuoRDKLxlZSBCanp1+GETwVQWACFURLjo7DgV/7nZYvyiONVhRzx2SwsyWu8oUXIoP4neDZsr5GKzxYZjTG8kPb1FEIxuu9igwO7dVB9mOBzGmfFMPJVvI6fe5EkUjtTTlz6R5jF0/MYHOZb7Q4NKZpFLseOV16FYEklCPri4ZuPUSxFJ14Sr1Vx5mkdEF42ATeb+bCnWWMthyOIzJchiVv5OnB21LBa4erd0TegnPZSzXGbB6UWjecfxghaNe/0OSLqDT3v9lqn1xfeQNN/sKkdsTUWgcptjbopqEsULdO24UinZqa7OqcGndj5a/7zbuPTCOyCXS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2019 14:37:59.2496 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cba6e09-6b93-4984-b719-08d762c6ebae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1687
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Maruthi
 Bayyavarapu <maruthi.bayyavarapu@amd.com>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Akshu.Agrawal@amd.com,
 Sanju R Mehta <sanju.mehta@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>
Subject: [alsa-devel] [PATCH v2 3/7] ASoC: amd: Enabling I2S instance in DMA
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
 sound/soc/amd/raven/acp3x-i2s.c     | 168 ++++++++++++++++++++++-----
 sound/soc/amd/raven/acp3x-pcm-dma.c | 219 +++++++++++++++++++++++++++---------
 sound/soc/amd/raven/acp3x.h         |  74 +++++++++---
 3 files changed, 360 insertions(+), 101 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 728e757..725e71a 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -30,8 +30,8 @@ static int acp3x_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		adata->tdm_mode = false;
 		break;
 	case SND_SOC_DAIFMT_DSP_A:
-			adata->tdm_mode = true;
-			break;
+		adata->tdm_mode = true;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -82,8 +82,18 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
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
@@ -101,12 +111,33 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
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
+			break;
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
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			val = rv_readl(rtd->acp3x_base + mmACP_I2STDM_IRER);
+			val = val | (rtd->xfer_resolution  << 3);
+			rv_writel(val, rtd->acp3x_base + mmACP_I2STDM_IRER);
+		}
+	}
 
 	return 0;
 }
@@ -117,7 +148,16 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
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
@@ -127,33 +167,104 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
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
+				break;
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
+				break;
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
 		break;
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
+				break;
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
+				break;
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
 		break;
 	default:
 		ret = -EINVAL;
@@ -208,11 +319,6 @@ static int acp3x_dai_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct i2s_dev_data *adata;
 
-	if (!pdev->dev.platform_data) {
-		dev_err(&pdev->dev, "platform_data not retrieved\n");
-		return -ENODEV;
-	}
-
 	adata = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dev_data),
 			GFP_KERNEL);
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -231,6 +337,8 @@ static int acp3x_dai_probe(struct platform_device *pdev)
 	adata->i2s_irq = res->start;
 	adata->play_stream = NULL;
 	adata->capture_stream = NULL;
+	adata->i2ssp_play_stream = NULL;
+	adata->i2ssp_capture_stream = NULL;
 
 	dev_set_drvdata(&pdev->dev, adata);
 	status = devm_snd_soc_register_component(&pdev->dev,
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index f5e4c7b..58db11b 100644
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
+			break;
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
+			break;
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
 
 static int acp3x_dma_open(struct snd_soc_component *component,
@@ -285,13 +357,17 @@ static int acp3x_dma_open(struct snd_soc_component *component,
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
@@ -304,13 +380,24 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
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
@@ -334,8 +421,17 @@ static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_soc_component *component,
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
@@ -377,15 +473,19 @@ static int acp3x_dma_close(struct snd_soc_component *component,
 	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
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
@@ -437,6 +537,8 @@ static int acp3x_audio_probe(struct platform_device *pdev)
 	adata->i2s_irq = res->start;
 	adata->play_stream = NULL;
 	adata->capture_stream = NULL;
+	adata->i2ssp_play_stream = NULL;
+	adata->i2ssp_capture_stream = NULL;
 
 	dev_set_drvdata(&pdev->dev, adata);
 	/* Initialize ACP */
@@ -501,13 +603,16 @@ static int acp3x_resume(struct device *dev)
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
 
@@ -516,13 +621,17 @@ static int acp3x_resume(struct device *dev)
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
index 72c1a23..c071477 100644
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
@@ -17,8 +20,11 @@
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
@@ -26,19 +32,28 @@
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
@@ -64,14 +79,20 @@ struct i2s_dev_data {
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
 
@@ -91,15 +112,36 @@ static inline u64 acp_get_byte_count(struct i2s_stream_instance *rtd,
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
