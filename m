Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C06FDD2A
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2019 13:16:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 952241671;
	Fri, 15 Nov 2019 13:15:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 952241671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573820169;
	bh=jyHj/W96a9rKaazya7nRlNb2yt0O9SzdIhhD78wCtnM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ouc7GPqUDJmLutCfEE8FMTVZeCN4xH3LcdXTfr9tsxW/Mb9Opq//oaBpkCix0OcUU
	 Q0uXfbM36K01j90A7apDNDVSmKew/SaWOGVHyYIDPHKQtKzRZPz2mFeII3uU9VxPZx
	 i45Vl90v7o5hNBjBchaiTT3IVl8x0cgDNxVLgkaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57BD9F8011E;
	Fri, 15 Nov 2019 13:13:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60A0AF8011E; Fri, 15 Nov 2019 13:13:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820084.outbound.protection.outlook.com [40.107.82.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C24BF80119
 for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2019 13:13:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C24BF80119
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="05sjrvhH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kk/j0uUr1TwBZ7cfXUFID4IZnoq3V/zjQ/jrApfdv+m0Z5EftaH3IQfOqSOQ1aelhaPNYXsKyl+eS1B5KvlhMYLbAeUNML9vWRLY0gJzc6YiwHrUg70lROXp+DRxI4J4ZYwkU3hOFXsS7aYn9daCLAlWCeyCQwQnFY21n5PaXY+iNINgWoNiBY7X4/TAZSxiLJ4ouEPd8mbxEIIERN9fvykJ0viwcZRLmlF9xzmRuzH3f0Tf/dz6+cyjQtgsBjTL2wHhXrOw3jjclI82wYu+KI1oDhe9frTuFoyZ8a5YWvyIBOuMSWIt75g0FX4XhcN54m+kvusIJlzCSvcSStYIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yp1KE2O3G77u/vi2hZHBs2afWPRghdUyvEwA3Eq2kHI=;
 b=ArlELhBhWntMslPhMjratic1J93s50S58tqLbtGgqf69J3QM2JDandAZXzgrD6YDCutLyweUb69S2LvHl2zbBhKnaFMmhgWaweV6VX0pByofc9F78ahRrk2gAAaFqnJ/b6OdPWMI7HOa1dZI0vNTVcLxk8apCErjudg1jLervSlj3eKQfAXswbPIhqy5yCvUuMgTYzBwobX7ob/TGef6qsbUZNCAWhAFxyuxUugHM2ekFfjcWr5eoZ34Vf8NozP2K6MUNMdX2+EhpJ59bBwxr2Jc1P3dk9e8XWwmYL+gsJ1Z9dzqjZOs1+dMAIix3ZKiFnVl/+wapDUok9HSWtzKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yp1KE2O3G77u/vi2hZHBs2afWPRghdUyvEwA3Eq2kHI=;
 b=05sjrvhHXR62QIpBMai3hfvAJOV+JiRP5f+uAY9wQv9gRFXv7py90fi1gQRST6HHKLOq+zGkL7+pmx5ZsbNqHiYXCxEUxLW5iUaz2fNXpLfT2/VBBlQsK7JyryFuXeNgk1f2w4SyfwBUM1ssK+mntYrv9o4Q+lv13N9Npfe0LfE=
Received: from DM3PR12CA0057.namprd12.prod.outlook.com (2603:10b6:0:56::25) by
 DM6PR12MB2665.namprd12.prod.outlook.com (2603:10b6:5:41::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.26; Fri, 15 Nov 2019 12:13:48 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::209) by DM3PR12CA0057.outlook.office365.com
 (2603:10b6:0:56::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23 via Frontend
 Transport; Fri, 15 Nov 2019 12:13:48 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2451.23 via Frontend Transport; Fri, 15 Nov 2019 12:13:48 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 15 Nov
 2019 06:13:48 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB02.amd.com (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 15 Nov 2019 06:13:39 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 15 Nov 2019 17:40:21 +0530
Message-ID: <1573819823-23731-5-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573819823-23731-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573819823-23731-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(428003)(199004)(189003)(36756003)(478600001)(70206006)(70586007)(26005)(426003)(1671002)(336012)(2616005)(476003)(126002)(486006)(11346002)(446003)(7696005)(51416003)(76176011)(48376002)(50466002)(54906003)(16586007)(316002)(305945005)(86362001)(53416004)(50226002)(4326008)(8676002)(81166006)(81156014)(109986005)(186003)(8936002)(6666004)(47776003)(356004)(5660300002)(2906002)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2665; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db9e5409-6e48-49a9-31ed-08d769c5454a
X-MS-TrafficTypeDiagnostic: DM6PR12MB2665:
X-Microsoft-Antispam-PRVS: <DM6PR12MB26650F7A8F7E214837B4BAC5E7700@DM6PR12MB2665.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 02229A4115
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DLpxWyTPkAZMfokUjI9aC+GqK4Z+UnGpqqRP/OwGthKlM+cbupn/yEbh6awlJkbL4baPE5xbuP6vaFQTAc/8uhOFoM87lVYvWV1rxbsRoBJftJR7FP3/kdrdLfjJVdK+8CuwOt4bj4v5llE8OJvbDxJDqWaMznzhFEWQUbfp5CVShHeFh7XV+MbbMXhunvfdoIeVRJJa+j03pdYo+5Q7SA65Yq1mTGLnCOCTvQcDy52xUbboBXCJbLXNmjedIfVD1loZxMQczs2D/3xotkIi6GBWZYLemCLyKAqDGHIjQX/wtjid2d7yYuhQVkFmgS5vDV8DX+dqNXWr8dF6kuet2C+X36Z6BaFJFG8126j0DNT5jbhhkQ1FmcysuvNJCRB9G8nsJ7+E1vPh8gMNs6h2eYYfI7zLvwF9KTWV7iRDvS3V1PjFm2q/4ub7YNxKQzIP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 12:13:48.7338 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db9e5409-6e48-49a9-31ed-08d769c5454a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2665
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Akshu.Agrawal@amd.com,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>
Subject: [alsa-devel] [PATCH v6 4/6] ASoC: amd: add ACP3x TDM mode support
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

ACP3x I2S (CPU DAI) can act in normal I2S and TDM modes. Added support
for TDM mode. Desired mode can be selected from ASoC machine driver.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-i2s.c | 42 +++++++++++++++++++++++++++++++----------
 sound/soc/amd/raven/acp3x.h     |  2 ++
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 247b9f5..5cb4ef7 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -43,8 +43,8 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
 		u32 rx_mask, int slots, int slot_width)
 {
 	struct i2s_dev_data *adata;
-	u32 val;
 	u16 slot_len;
+	u32 val, flen, reg_val, frmt_reg;
 
 	adata = snd_soc_dai_get_drvdata(cpu_dai);
 
@@ -67,16 +67,38 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
 		return -EINVAL;
 	}
 
-	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
-	rv_writel(val | 0x2, adata->acp3x_base + mmACP_BTTDM_ITER);
-	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
-	rv_writel(val | 0x2, adata->acp3x_base + mmACP_BTTDM_IRER);
-
-	val = FRM_LEN | (slots << 15) | (slot_len << 18);
-	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_TXFRMT);
-	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_RXFRMT);
+	/* Enable I2S / BT channels TDM and respective
+	 * I2S/BT`s TX/RX Formats frame lengths.
+	 */
+	flen = FRM_LEN | (slots << 15) | (slot_len << 18);
 
-	adata->tdm_fmt = val;
+	if (adata->substream_type == SNDRV_PCM_STREAM_PLAYBACK) {
+		switch (adata->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			reg_val = mmACP_BTTDM_ITER;
+			frmt_reg = mmACP_BTTDM_TXFRMT;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = mmACP_I2STDM_ITER;
+			frmt_reg = mmACP_I2STDM_TXFRMT;
+		}
+	} else {
+		switch (adata->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			reg_val = mmACP_BTTDM_IRER;
+			frmt_reg = mmACP_BTTDM_RXFRMT;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = mmACP_I2STDM_IRER;
+			frmt_reg = mmACP_I2STDM_RXFRMT;
+		}
+	}
+	val = rv_readl(adata->acp3x_base + reg_val);
+	rv_writel(val | 0x2, adata->acp3x_base + reg_val);
+	rv_writel(flen,	adata->acp3x_base + frmt_reg);
+	adata->tdm_fmt = flen;
 	return 0;
 }
 
diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index c071477..01b283a 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -76,6 +76,8 @@ struct i2s_dev_data {
 	bool tdm_mode;
 	unsigned int i2s_irq;
 	u32 tdm_fmt;
+	u16 i2s_instance;
+	u32 substream_type;
 	void __iomem *acp3x_base;
 	struct snd_pcm_substream *play_stream;
 	struct snd_pcm_substream *capture_stream;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
