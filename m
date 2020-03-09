Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A5517DDFF
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 11:55:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6C0F166B;
	Mon,  9 Mar 2020 11:54:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6C0F166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583751303;
	bh=mrGbco4UoDqc5vCY7wURHVi1Six8CQoM0nGA8XmuAo4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=slZaZhU/Dv2dlTUoB4cwt8n6a2Hu928elm/06poGUaFDWY3UZf7ioHirBJE1G7LFI
	 oRda+v26wD6Xb8nqwIiXtE8m+MUp7h8Cg0FQEelEBSc4cN7muzPjbVSHOU1GHeA5h9
	 wTlCUjhOR0wQzDMo1bDuuIR+Ohp9G5KsraVgA1iE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C00D8F800DA;
	Mon,  9 Mar 2020 11:53:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED5D6F801EB; Mon,  9 Mar 2020 11:53:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE autolearn=disabled version=3.4.0
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680052.outbound.protection.outlook.com [40.107.68.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7872F800DA
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 11:53:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7872F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="lskhy6DJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQaZIoJzZ5QfmTmXR1yG9XbgQRxt8vUQ/EjWLPPq9KvJo5ZhNnl6a6TwN29z4TNjhWTB59k3elZtbeTXsE7GzmQ4YawPnedn1Ak/Fste3mfdb6IPxnxHznqWxMhmO3pNDesquEplEXFSdMB14/r6Pf54YBogljf+KoJ7AbE2a8JI/wPjTGBbdViy+XunoAAn7l5n3cfg59NNZ3xgQbhWWCwGXCVPJ6mJvHiztQ3WuFLfbyjAkkwSLf7y07bT3ZBsCXqD+VvwhkngOuDubRbdiN6rL8p9dNPEMi7z8Hln0DgwzJf6zJLEPchqJPPdQv8ppbMTSr/YQcVLV5Ym9+wIjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9iRj6a2/D5eVturi8PSsJdpc60VqLgXtEano4ULlLs=;
 b=cwdFMIFjy4719cth3WlVlxWBKGMZIODgePVQAK32WwpV6ZCBXiWcjZoJ4qyHI8iBxu4xMUfYYqTk1CntuHOV5D79MeHWDTYcRhkREU0H8VIjfpqu3DCxkCQcdZ/Vo1DZlzTXDjOPsO3AKb0ZNp8hqs2ySng3Pwr51nRLW9fJLHQuBhnOneOjfQLRn0WA72VKY5cBs9tSCzsiSIpR01UexKFX1ygnyS6rXupFlKz34LhpTwBh8ceU20ah8w3NvOKjqqGZYiG0qAwBFPwC9UFVd/Pi8HXqtonsvFCu1Lf3EQ6HIToVOmKlpIcTmPsYBjEjsJCLrM9krrz+Yx1rWcD+aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9iRj6a2/D5eVturi8PSsJdpc60VqLgXtEano4ULlLs=;
 b=lskhy6DJz0OgJDBgGbppeOIWnO5Gi93duEH7BpBBz/v3UW3t2YHDVKFzklG0BLXeUIijmeuo5eHkjT0Gzb3guIu58z7Fh5SebAy+gXXcXytMdmur2sNQtwVQ2Ap4OSUj/l97qBsk6p0ZUD+o2ZGujbMm2Zvb2pvJnM3JuUMxwWo=
Received: from BL0PR05CA0020.namprd05.prod.outlook.com (2603:10b6:208:91::30)
 by DM5PR12MB1418.namprd12.prod.outlook.com (2603:10b6:3:7a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Mon, 9 Mar
 2020 10:53:09 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:208:91:cafe::f7) by BL0PR05CA0020.outlook.office365.com
 (2603:10b6:208:91::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.6 via Frontend
 Transport; Mon, 9 Mar 2020 10:53:09 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2793.11 via Frontend Transport; Mon, 9 Mar 2020 10:53:09 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 9 Mar 2020
 05:53:08 -0500
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Mon, 9 Mar 2020 05:53:05 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Subject: [PATCH] ASoC: amd: Adding TDM support in hw_params.
Date: Mon, 9 Mar 2020 16:20:10 +0530
Message-ID: <1583751029-2850-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(428003)(189003)(199004)(2906002)(426003)(316002)(54906003)(5660300002)(186003)(8936002)(7696005)(478600001)(86362001)(109986005)(36756003)(6666004)(4326008)(356004)(26005)(336012)(70586007)(2616005)(81156014)(70206006)(8676002)(81166006)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1418; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6321754a-6e86-4d3e-e845-08d7c4180e34
X-MS-TrafficTypeDiagnostic: DM5PR12MB1418:
X-Microsoft-Antispam-PRVS: <DM5PR12MB141806445122633B43BE7F8FE7FE0@DM5PR12MB1418.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-Forefront-PRVS: 0337AFFE9A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: veW7wT/w29yDysUflh7RjVy0HGrNRwN3I4HI7Mvf6uWFpjjLJrVniLMa3G+uPPsJXnoPiAoLCbivJw1OjUjv16castL6/NEn7gOrgP0gpdfe2jvBzyTPbhVPc3tBI3+EYnykf/Tzl+lw9IJgsRcKKJRcQtxBzgRHbHFfHclyNW1k0BfqTEq8LtuoxzFK6oMx5HPmJUBFEAUIcKzfQeErllWTeay9fWMJSKjdL7iFP9rGaveykwWAGq6obBX6DeT21sxPYtw1tgx9LiK9PE1b4t8/x36rt1NlZ6bueHpvAVnHApjnm5vjxjXrF/6iJ0mM6R4rj2fGsS8gXuwNTkklRoRyXAqemfwFKZ0N8CVTjRYTphK0pntV67nmKiJNP/oZ32/Zqc4LQCt9wOOfot74k7yloNW2fHMTpod3+lPp0dXUwOahbxkw7w9Tya+kweF+/J1nl+OCbTN4eWxtXQGGDcOYaElw3Km/ECgF8u4BmPI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2020 10:53:09.2392 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6321754a-6e86-4d3e-e845-08d7c4180e34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1418
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ravulapati Vishnu
 vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, broonie@kernel.org,
 Wei Yongjun <weiyongjun1@huawei.com>, Alexander.Deucher@amd.com,
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

TDM related settings for ACP registers in hw_params.
When TDM mode is enabled, Hw_params needs to read and write
from/to respective TX/RX (ACP_(I2S/BT)TDM_(TX/RX)FRMT) registers.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-i2s.c | 44 ++++++++++++-----------------------------
 1 file changed, 13 insertions(+), 31 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 91a3881..3a3c47e 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -42,7 +42,7 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,
 		u32 tx_mask, u32 rx_mask, int slots, int slot_width)
 {
 	struct i2s_dev_data *adata;
-	u32 val, reg_val, frmt_reg, frm_len;
+	u32 frm_len;
 	u16 slot_len;
 
 	adata = snd_soc_dai_get_drvdata(cpu_dai);
@@ -64,36 +64,7 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,
 	default:
 		return -EINVAL;
 	}
-
-	/* Enable I2S/BT channels TDM, respective TX/RX frame lengths.*/
-
 	frm_len = FRM_LEN | (slots << 15) | (slot_len << 18);
-	if (adata->substream_type == SNDRV_PCM_STREAM_PLAYBACK) {
-		switch (adata->i2s_instance) {
-		case I2S_BT_INSTANCE:
-			reg_val = mmACP_BTTDM_ITER;
-			frmt_reg = mmACP_BTTDM_TXFRMT;
-			break;
-		case I2S_SP_INSTANCE:
-		default:
-			reg_val = mmACP_I2STDM_ITER;
-			frmt_reg = mmACP_I2STDM_TXFRMT;
-		}
-	} else {
-		switch (adata->i2s_instance) {
-		case I2S_BT_INSTANCE:
-			reg_val = mmACP_BTTDM_IRER;
-			frmt_reg = mmACP_BTTDM_RXFRMT;
-			break;
-		case I2S_SP_INSTANCE:
-		default:
-			reg_val = mmACP_I2STDM_IRER;
-			frmt_reg = mmACP_I2STDM_RXFRMT;
-		}
-	}
-	val = rv_readl(adata->acp3x_base + reg_val);
-	rv_writel(val | 0x2, adata->acp3x_base + reg_val);
-	rv_writel(frm_len, adata->acp3x_base + frmt_reg);
 	adata->tdm_fmt = frm_len;
 	return 0;
 }
@@ -105,12 +76,14 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *prtd;
 	struct snd_soc_card *card;
 	struct acp3x_platform_info *pinfo;
+	struct i2s_dev_data *adata;
 	u32 val;
-	u32 reg_val;
+	u32 reg_val, frmt_reg;
 
 	prtd = substream->private_data;
 	rtd = substream->runtime->private_data;
 	card = prtd->card;
+	adata = snd_soc_dai_get_drvdata(dai);
 	pinfo = snd_soc_card_get_drvdata(card);
 	if (pinfo) {
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -141,21 +114,30 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
 		switch (rtd->i2s_instance) {
 		case I2S_BT_INSTANCE:
 			reg_val = mmACP_BTTDM_ITER;
+			frmt_reg = mmACP_BTTDM_TXFRMT;
 			break;
 		case I2S_SP_INSTANCE:
 		default:
 			reg_val = mmACP_I2STDM_ITER;
+			frmt_reg = mmACP_I2STDM_TXFRMT;
 		}
 	} else {
 		switch (rtd->i2s_instance) {
 		case I2S_BT_INSTANCE:
 			reg_val = mmACP_BTTDM_IRER;
+			frmt_reg = mmACP_BTTDM_RXFRMT;
 			break;
 		case I2S_SP_INSTANCE:
 		default:
 			reg_val = mmACP_I2STDM_IRER;
+			frmt_reg = mmACP_I2STDM_RXFRMT;
 		}
 	}
+	if (adata->tdm_mode) {
+		val = rv_readl(rtd->acp3x_base + reg_val);
+		rv_writel(val | 0x2, rtd->acp3x_base + reg_val);
+		rv_writel(adata->tdm_fmt, rtd->acp3x_base + frmt_reg);
+	}
 	val = rv_readl(rtd->acp3x_base + reg_val);
 	val = val | (rtd->xfer_resolution  << 3);
 	rv_writel(val, rtd->acp3x_base + reg_val);
-- 
2.7.4

