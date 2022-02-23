Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BD94C0D3E
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 08:25:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7274B1943;
	Wed, 23 Feb 2022 08:24:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7274B1943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645601129;
	bh=qXvDvVwBCHbweKAieI2WcxjrWKpqdGwTZ1CFc5f1hhs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qxEXc37uerMzN5Tczx2dWMpjPuQA6gMBlC0UG30O+R21WUSX6gbSFzWB4aKik/DO1
	 HwfGOmcTti8a1AlqQNrTA+gl9Ld32PdMKlAYe13bxNYbx+o9wnemdg+DLVv3rywa3O
	 jI3qgozOMEUj8UQU0yycUfFj8y4277vmz5SxUgWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7D2FF800F5;
	Wed, 23 Feb 2022 08:24:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59C4CF802E3; Wed, 23 Feb 2022 08:24:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::60b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D547F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 08:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D547F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="ylc/ZYqq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m87F0rRBu8WazUGIclFVSA+Y9bmucxiyBtLWCszinKiGc/8xGPljncisQt0S6y4KFh05ls0sL8aMTEVGmSTfBsza9h36L3dIbAutkslHVYF32OvYSyUmJCOw67/QSl+iI9jFbuV4bTM38OuK/pbcheKqC9wgyWGOEYBHshkDq+KfhAwKhJUiM4/m2iqC3GxoaChSvoxkqrCKzeD0gsJd5xTunzZkTU9LFSAtjzb+Gxg+M1oUDQX+Hx7iJkYUaisAhnIR/EgAfglzNzhVn7BMejYAyBnJmyUN9OW1yTOOu6ZOy6nIyoMVDlld0j55gGkGzDSqholzws0IhzErveNXvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNRvlWPfQIdipH1qhAW8xKtQn594+8w0iwVdP6o9t1c=;
 b=Fvp+RKBlZAM3Oi/4ijMbLfdMfJgThD1rvyKpQ7L3bXZ+DrMjmk5I6X6xlDr/fAvWwvvUsFYQa8ZiWulxzBwpY48dBkIF2XczrJuL/6N8cGAJJbLLfunoD632rMeihEo12q35RcY79N8AamZvBHMlhtMFjuQZypq4Pp6yJXJ/hZmQpJuzJEiJ44JEYF1mvy/d4683PsUF3Q4R1/OwglO4mSveGsiQj5gxR6kv0rrG9sEpmufG1kvaiMAAR4FBmrRdMMxAG78bvm1LbnIWelUUGxfDK+4OBs/uKSBFxMaz/3I4RkSfjI3L9s0kr/r4slyyUJuM6+fbRqPXk9chOVxf6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNRvlWPfQIdipH1qhAW8xKtQn594+8w0iwVdP6o9t1c=;
 b=ylc/ZYqqsehnN5wbPHcdqWyTMi3pXQQ6OZ7XIc6tQhvcVkdknr2+F1v+5wh4MhUyEpyaR3C4HKPB/JJ34ArKsxR1OmzNNxsBIUZkqamO+X5DtknjwWTt00QXTEVPlqkwY3t4B1yDYqGpzFovFExmGVlvCj/cTk6AUVWx3GdGhW8=
Received: from BN6PR14CA0031.namprd14.prod.outlook.com (2603:10b6:404:13f::17)
 by DM6PR12MB3356.namprd12.prod.outlook.com (2603:10b6:5:38::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 23 Feb
 2022 07:24:11 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:13f:cafe::3a) by BN6PR14CA0031.outlook.office365.com
 (2603:10b6:404:13f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23 via Frontend
 Transport; Wed, 23 Feb 2022 07:24:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Wed, 23 Feb 2022 07:24:11 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 23 Feb
 2022 01:23:45 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Feb
 2022 23:23:45 -0800
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Wed, 23 Feb 2022 01:23:41 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/9] ASoC: amd: vangogh: refactor i2s master mode clock
 sequence code
Date: Wed, 23 Feb 2022 12:49:31 +0530
Message-ID: <20220223071959.13539-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220223071959.13539-1-Vijendar.Mukunda@amd.com>
References: <20220223071959.13539-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3beeee4e-93a3-4b37-a62a-08d9f69d7cdd
X-MS-TrafficTypeDiagnostic: DM6PR12MB3356:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB33560389FDBD75A24B5CF0E0973C9@DM6PR12MB3356.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uPEFwL5KBLrnjxXKgcd22ZTmF85zntG/PrcJDsE5xpPikq7Vwn9iQdhbC7ZfoIt1BbKFS3GJiYZY2us9AB7s/9wGetTx3F1ECzFaH22vl4f123XCf2/yNTJM9pMubYesK2MhE2QF28mPApUk5ng7VKIYLBCemaPxtyZG7+VBncHzmOMMqKlfyCogmTZKh+gttolUJYA/WSrUrrXBBeJqDqYOPTTThntJKMZADaNTqCpSI7NzZ/QL62oED58PvNhOXT2/ExIipe1M+wBqL7x6t/ppqgEzL5OUtwT9i3zhgPpepMVABRC1twI48nK+M9KKoxaHL9k+rIm0OzI2CvVCdnt6qxE0/LVknKcnmzFSY8vsuHlHtRuYfz0P27xfgkN3MuVcYwydPeJnB6E+jLRtuIYMgjyjTW2tTOPNhC6MNxZaL2up2Z+S4auwam5SobckUqN5r9kx/lLFPzRc0xCEgx9OH8b2scbbbCQEjvI1w0Ol3+8gwBTVc0m3hG9syx+EyHcMBbh1pqj311vVZoYLBO2wYz75oS7b0T9qf5RvKtqSsjSfbh6qgJsMIwk6X8YtPLF8HVJ8vko2b7g9D+MHx+Cs5M1xE5BYHQHxNSE7IB1nZ4jQSAFzh04pTr5UKFC4T4JpGBOuXlYSxnTWvnLXm/HHY+TXWnR2SyxboIk2+4vKZhD0frXjE+NUvJTYAG9SV35J1B5//gAnBc1dCmk58Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2616005)(1076003)(5660300002)(426003)(316002)(86362001)(336012)(36860700001)(54906003)(7416002)(40460700003)(26005)(36756003)(83380400001)(186003)(110136005)(47076005)(356005)(70206006)(8676002)(81166007)(70586007)(2906002)(8936002)(6666004)(4326008)(508600001)(82310400004)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 07:24:11.4210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3beeee4e-93a3-4b37-a62a-08d9f69d7cdd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3356
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, wtli@nuvoton.com, open
 list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 krisman@collabora.com, Dan Carpenter <dan.carpenter@oracle.com>
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

Refactor I2S Master mode clock programming sequence code.
This will also fix the i2s clocks restore issue during system level
resume.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x-i2s.c | 26 +++++++-------------------
 sound/soc/amd/vangogh/acp5x.h     | 29 +++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
index 002db3971ca9..59a98f89a669 100644
--- a/sound/soc/amd/vangogh/acp5x-i2s.c
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -88,10 +88,9 @@ static int acp5x_i2s_hwparams(struct snd_pcm_substream *substream,
 	struct snd_soc_card *card;
 	struct acp5x_platform_info *pinfo;
 	struct i2s_dev_data *adata;
-	union acp_i2stdm_mstrclkgen mclkgen;
 
 	u32 val;
-	u32 reg_val, frmt_reg, master_reg;
+	u32 reg_val, frmt_reg;
 	u32 lrclk_div_val, bclk_div_val;
 
 	lrclk_div_val = 0;
@@ -160,20 +159,6 @@ static int acp5x_i2s_hwparams(struct snd_pcm_substream *substream,
 	acp_writel(val, rtd->acp5x_base + reg_val);
 
 	if (adata->master_mode) {
-		switch (rtd->i2s_instance) {
-		case I2S_HS_INSTANCE:
-			master_reg = ACP_I2STDM2_MSTRCLKGEN;
-			break;
-		case I2S_SP_INSTANCE:
-		default:
-			master_reg = ACP_I2STDM0_MSTRCLKGEN;
-			break;
-		}
-		mclkgen.bits.i2stdm_master_mode = 0x1;
-		if (adata->tdm_mode)
-			mclkgen.bits.i2stdm_format_mode = 0x01;
-		else
-			mclkgen.bits.i2stdm_format_mode = 0x0;
 		switch (params_format(params)) {
 		case SNDRV_PCM_FORMAT_S16_LE:
 			switch (params_rate(params)) {
@@ -238,9 +223,8 @@ static int acp5x_i2s_hwparams(struct snd_pcm_substream *substream,
 		default:
 			return -EINVAL;
 		}
-		mclkgen.bits.i2stdm_bclk_div_val = bclk_div_val;
-		mclkgen.bits.i2stdm_lrclk_div_val = lrclk_div_val;
-		acp_writel(mclkgen.u32_all, rtd->acp5x_base + master_reg);
+		rtd->lrclk_div = lrclk_div_val;
+		rtd->bclk_div = bclk_div_val;
 	}
 	return 0;
 }
@@ -249,9 +233,11 @@ static int acp5x_i2s_trigger(struct snd_pcm_substream *substream,
 			     int cmd, struct snd_soc_dai *dai)
 {
 	struct i2s_stream_instance *rtd;
+	struct i2s_dev_data *adata;
 	u32 ret, val, period_bytes, reg_val, ier_val, water_val;
 	u32 buf_size, buf_reg;
 
+	adata = snd_soc_dai_get_drvdata(dai);
 	rtd = substream->runtime->private_data;
 	period_bytes = frames_to_bytes(substream->runtime,
 				       substream->runtime->period_size);
@@ -300,6 +286,8 @@ static int acp5x_i2s_trigger(struct snd_pcm_substream *substream,
 		}
 		acp_writel(period_bytes, rtd->acp5x_base + water_val);
 		acp_writel(buf_size, rtd->acp5x_base + buf_reg);
+		if (adata->master_mode)
+			acp5x_set_i2s_clk(adata, rtd);
 		val = acp_readl(rtd->acp5x_base + reg_val);
 		val = val | BIT(0);
 		acp_writel(val, rtd->acp5x_base + reg_val);
diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index fe5e1fa98974..b85d3ee369a3 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -105,6 +105,8 @@ struct i2s_stream_instance {
 	dma_addr_t dma_addr;
 	u64 bytescount;
 	void __iomem *acp5x_base;
+	u32 lrclk_div;
+	u32 bclk_div;
 };
 
 union acp_dma_count {
@@ -191,3 +193,30 @@ static inline u64 acp_get_byte_count(struct i2s_stream_instance *rtd,
 	}
 	return byte_count.bytescount;
 }
+
+static inline void acp5x_set_i2s_clk(struct i2s_dev_data *adata,
+				     struct i2s_stream_instance *rtd)
+{
+	union acp_i2stdm_mstrclkgen mclkgen;
+	u32 master_reg;
+
+	switch (rtd->i2s_instance) {
+	case I2S_HS_INSTANCE:
+		master_reg = ACP_I2STDM2_MSTRCLKGEN;
+		break;
+	case I2S_SP_INSTANCE:
+	default:
+		master_reg = ACP_I2STDM0_MSTRCLKGEN;
+		break;
+	}
+
+	mclkgen.bits.i2stdm_master_mode = 0x1;
+	if (adata->tdm_mode)
+		mclkgen.bits.i2stdm_format_mode = 0x01;
+	else
+		mclkgen.bits.i2stdm_format_mode = 0x00;
+
+	mclkgen.bits.i2stdm_bclk_div_val = rtd->bclk_div;
+	mclkgen.bits.i2stdm_lrclk_div_val = rtd->lrclk_div;
+	acp_writel(mclkgen.u32_all, rtd->acp5x_base + master_reg);
+}
-- 
2.17.1

