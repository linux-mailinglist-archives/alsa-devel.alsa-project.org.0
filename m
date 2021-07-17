Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 707E63CBCEE
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 21:45:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5CE916CB;
	Fri, 16 Jul 2021 21:44:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5CE916CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626464739;
	bh=3x+ENYLskURXRtmeMlIXJAL1noJDbyMeCdjWq1A3HB8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H8Ue5/5Nrwk6cFPPKPfvpGHXgg66j1SLmcN7FqSg2AXlnjbA56PWTJDK6sZgeFBGW
	 8zo8xNuZOOQ9MD6M9u6opvyXGsLltDCUvBdDxE1tIeFiTY/4Um/kXF5UXZDACodglS
	 1J8Kaj346z9DuJaBXISGT3z/hvTgXzYK3bjjOCCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED627F804FE;
	Fri, 16 Jul 2021 21:43:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2F6AF804FD; Fri, 16 Jul 2021 21:43:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D69EF804DA
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 21:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D69EF804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="Z/r9aPsL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+JqH74dLdd0lKIFtlvhTCME6u8tTXs8Pw+lMNGukYSjgjs/53Vt2LtUl6VykrbPM57TAyDj3tgLS+Kt++194H3q/9yyua5kAxOthuv2gcKyeCbNBaz9XSprmm9LIKQN826NbrHG0YOsaTx5fWGiCMazI9BFbVZXLXVFMNNFcTmbQHTOcE8930WHIH429HeQsxet1IaVQAnbKKqzR7RRvmqZbMhWxHPxBFqB44y1hV+cnlBXQI3WhmVJ0nHxdyQMmr0u0DqixM08wCDVGoSuDw7IQkA9iZBjuIPEGjW1YTkI0FDh8MT3NPr48XdhF9vgxVkqSTa0sxZk/Bl3sGpxkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8r5GStPMZm6rd9rqpKKTAPlZHKzc3F7vKikwwpYO5Wk=;
 b=HN7dCuxoJBVgnEz1X+42drCFllxbvczBUBf5sT5RB8s4BamjGP/+3f+6cUK4Ynzj/QfVGDvKXFLwYxMN8QM3JNLLNnZl89I3eZTylaPlok2GCinIzKApwHMEfisnE/ir0592iphj92OPxEWC6f4wXZ4STXDqzn8zehxZ8J+635OVblvTM02wYWS39Ppot+ObKMBxsSg0M26lI+SNVUqvDLjfUgH3Mp2Nv0VNjx636icQ+ARQBn4FyaCQ/vO1N01UQ3rQ6muA1RUT4lsDOLmMMhX0/G8lrzBju1jyZH21upIHAaT6QWBOi9+Id9+vvw+K1HKxH21DIfTxaYO5xsAktA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8r5GStPMZm6rd9rqpKKTAPlZHKzc3F7vKikwwpYO5Wk=;
 b=Z/r9aPsL5Vygr6zz8ZUnQxs2bpM7eQuU9WPb3x3kS9UgPOoIwNxEe3EExCrIySbOUiAFI0RnZfXDiQuHqaJ/5wEVMWnRwoAW2j3o2LOpjfA+Q5CrDbmddGCybW+OFbT4cTz+fijEz+D5CZ3dDvsyaO0YfIVjvdiAPZgYVV32yz4=
Received: from BN9PR03CA0930.namprd03.prod.outlook.com (2603:10b6:408:107::35)
 by DM5PR12MB1820.namprd12.prod.outlook.com (2603:10b6:3:10d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Fri, 16 Jul
 2021 19:43:10 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::7d) by BN9PR03CA0930.outlook.office365.com
 (2603:10b6:408:107::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend
 Transport; Fri, 16 Jul 2021 19:43:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 19:43:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 14:43:09 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 14:43:09 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Fri, 16 Jul 2021 14:43:01 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH RESEND 06/12] ASoC: amd: irq handler changes for ACP5x PCM dma
 driver
Date: Sat, 17 Jul 2021 09:30:53 +0530
Message-ID: <20210717040059.310410-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
References: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dc801df-9738-4a2f-0bac-08d94891f0f5
X-MS-TrafficTypeDiagnostic: DM5PR12MB1820:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1820722C338866A0B3DF3CE197119@DM5PR12MB1820.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:98;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJxjuGxV3AxnxJqaJPbkxVLUFIXcZxUFo59GE0uTsuUgMVbaqp444BpkUEE2n/aIq2XMjzWzmkXskhKhiq9j9CM8VsYtTB807CAowiUIVDIDbd0Z1L1QO5O8owZ1EDM5GugSd24W0uzAr6kwj0PQK/CPSOwbOeWKUa/2/6BI+KUYu2LS/iC1WXvfKmWLkY7NpWXT+pyJbymgC6/MMYP/Tm56fcL7udgKrN3sTHNqN9oZQQ6Oy8aKtkiUbUfjnaC+gNnSRlUorAtPkdKTPmPRN8COVXM67BvJutWhughrU9/covvcZ9QfKfSe6yWwhsbTBZwfAvwir5HkVlI+2nqFZdi18NdNHJppTmUirHHPIPge/TRwz4ky4/IjBjrfc2UcaI1uACkLCfCnndZkfyCmgT25iG3WJh5mJ5Ya1DvPGAUcqhIFyKlCDMv9mK1RJGmygPODdbCGZL2KdoS6ZsxBmGOa6cFUiTvMstwH+MUdDULR5ZewD37vWHjYh/xePalGCJ6lsALuKyPbNw7NvCe8wR+toTu4qjGJUkOUrHfHHXh/pUj87b5M+Pos06RF19VygXbaRG/vB3fxwEbPevGPPlAMZUBeUnYZWHwbkwdmTz6WQl0zkKtsUVGw6D9g/KecMaVJUJUFk6mRkYgM6pTHkdC0xe4VM6p6VTkr1l3zMzAMCFYZ/+qCbW0eWLqJPBFchylzLHOjrKPijH9Fo+fr7Lf7VSUL6u/u7FqbmVNBfLENzrUG2JzbL/qsbl0XLoLO
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966006)(36840700001)(82740400003)(336012)(70586007)(478600001)(36756003)(70206006)(86362001)(36860700001)(2906002)(2616005)(316002)(5660300002)(1076003)(81166007)(7696005)(8676002)(110136005)(54906003)(356005)(426003)(4326008)(186003)(83380400001)(82310400003)(47076005)(8936002)(6666004)(26005)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 19:43:09.9155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc801df-9738-4a2f-0bac-08d94891f0f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1820
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 krisman@collabora.com
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

From: Vijendar Mukunda <vijendar.mukunda@amd.com>

Whenever audio data equal to the I2S FIFO watermark level are
produced/consumed, interrupt is generated.
Acknowledge the interrupt.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
v1 -> v2: use single flag for handling irq status
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 61 +++++++++++++++++++++++++++
 sound/soc/amd/vangogh/acp5x.h         |  9 ++++
 2 files changed, 70 insertions(+)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 2ff11bb88305..76a965a8ec3c 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -21,10 +21,57 @@ static const struct snd_soc_component_driver acp5x_i2s_component = {
 	.name		= DRV_NAME,
 };
 
+static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
+{
+	struct i2s_dev_data *vg_i2s_data;
+	u16 irq_flag;
+	u32 val;
+
+	vg_i2s_data = dev_id;
+	if (!vg_i2s_data)
+		return IRQ_NONE;
+
+	irq_flag = 0;
+	val = acp_readl(vg_i2s_data->acp5x_base + ACP_EXTERNAL_INTR_STAT);
+	if ((val & BIT(HS_TX_THRESHOLD)) && vg_i2s_data->play_stream) {
+		acp_writel(BIT(HS_TX_THRESHOLD), vg_i2s_data->acp5x_base +
+			   ACP_EXTERNAL_INTR_STAT);
+		snd_pcm_period_elapsed(vg_i2s_data->play_stream);
+		irq_flag = 1;
+	}
+	if ((val & BIT(I2S_TX_THRESHOLD)) &&
+	    vg_i2s_data->i2ssp_play_stream) {
+		acp_writel(BIT(I2S_TX_THRESHOLD),
+			   vg_i2s_data->acp5x_base + ACP_EXTERNAL_INTR_STAT);
+		snd_pcm_period_elapsed(vg_i2s_data->i2ssp_play_stream);
+		irq_flag = 1;
+	}
+
+	if ((val & BIT(HS_RX_THRESHOLD)) && vg_i2s_data->capture_stream) {
+		acp_writel(BIT(HS_RX_THRESHOLD), vg_i2s_data->acp5x_base +
+			   ACP_EXTERNAL_INTR_STAT);
+		snd_pcm_period_elapsed(vg_i2s_data->capture_stream);
+		irq_flag = 1;
+	}
+	if ((val & BIT(I2S_RX_THRESHOLD)) &&
+	    vg_i2s_data->i2ssp_capture_stream) {
+		acp_writel(BIT(I2S_RX_THRESHOLD),
+			   vg_i2s_data->acp5x_base + ACP_EXTERNAL_INTR_STAT);
+		snd_pcm_period_elapsed(vg_i2s_data->i2ssp_capture_stream);
+		irq_flag = 1;
+	}
+
+	if (irq_flag)
+		return IRQ_HANDLED;
+	else
+		return IRQ_NONE;
+}
+
 static int acp5x_audio_probe(struct platform_device *pdev)
 {
 	struct resource *res;
 	struct i2s_dev_data *adata;
+	unsigned int irqflags;
 	int status;
 
 	if (!pdev->dev.platform_data) {
@@ -47,6 +94,14 @@ static int acp5x_audio_probe(struct platform_device *pdev)
 					 resource_size(res));
 	if (!adata->acp5x_base)
 		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
+		return -ENODEV;
+	}
+
+	adata->i2s_irq = res->start;
 	dev_set_drvdata(&pdev->dev, adata);
 	status = devm_snd_soc_register_component(&pdev->dev,
 						 &acp5x_i2s_component,
@@ -55,6 +110,12 @@ static int acp5x_audio_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Fail to register acp i2s component\n");
 		return -ENODEV;
 	}
+	status = devm_request_irq(&pdev->dev, adata->i2s_irq, i2s_irq_handler,
+				  irqflags, "ACP5x_I2S_IRQ", adata);
+	if (status) {
+		dev_err(&pdev->dev, "ACP5x I2S IRQ request failed\n");
+		return -ENODEV;
+	}
 	return 0;
 }
 
diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index d2853738eb17..18df2b5a4283 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -31,9 +31,18 @@
 #define ACP5x_HS_TDM_REG_END	0x1242824
 #define I2S_MODE 0x00
 #define ACP5x_I2S_MODE 0x00
+#define	I2S_RX_THRESHOLD 27
+#define	I2S_TX_THRESHOLD 28
+#define	HS_TX_THRESHOLD 24
+#define	HS_RX_THRESHOLD 23
 
 struct i2s_dev_data {
+	unsigned int i2s_irq;
 	void __iomem *acp5x_base;
+	struct snd_pcm_substream *play_stream;
+	struct snd_pcm_substream *capture_stream;
+	struct snd_pcm_substream *i2ssp_play_stream;
+	struct snd_pcm_substream *i2ssp_capture_stream;
 };
 
 /* common header file uses exact offset rather than relative
-- 
2.25.1

