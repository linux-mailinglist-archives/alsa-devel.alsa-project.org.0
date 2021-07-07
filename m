Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DF73BE2C6
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 07:44:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1F1F166A;
	Wed,  7 Jul 2021 07:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1F1F166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625636659;
	bh=E19KCxoYizWnhp187Ubt9lj5dG8KFv5GsiyQo2EKRdM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fdBH3y8BLfnLKERRflupDF74+ThHUG0KjPvd1LjaUsu72OuDtVafWgq/vrVmYjVz9
	 JuKxU6OJkVCv3qg41jdl0TEWsZNcqAqvI6RC8KMOstJn7bJiIYphqUY3zF5n6cwpj3
	 TGSjJMyQwqHhiRjgOcmLpn+GAmKWvKpRT162obH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4B3FF80300;
	Wed,  7 Jul 2021 07:42:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E6F1F80302; Wed,  7 Jul 2021 07:42:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2058.outbound.protection.outlook.com [40.107.95.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 339C5F804E7
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 07:41:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 339C5F804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="mSF5mIsA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXchzmfBGTlvOwiAjH+cfhfgVwqQEC5UfRFV8mmnkY8JUNV41Lst0DCxWnIY+ac1nOVEhS6L9oLXfh+/r2KRsFLYSLAk9whelwvQV/43ubyeeLRbI0+CDuOedoyYOlHEZ5FDekDd7R7OjyKvBzOCg6VZdasao0QxLjL3cRPWPSzPvPqoN/fcVNEpJD9uNxwzELtAnoFGQ2lhyNEpyv4zcHGYTB+a7aSDA44AkYiimf5kGJRI+OrplS9LRGhpK2nGtoHVaID9P1+rAkCS4QbA1JKafe9GIIOFe1uRWKuKskqygSNv7j6GLBCbDOnVzrIstoeMoiu1dVSEm9Gd0PmZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MApu1/JhC7v9MUlb6wlrLqFZ66aZ8DUS13IcCc6omMg=;
 b=B+zGMJ0dTTJQKeNMKBAISSqMTMAZmoKc6QFjs5TBAStsPFNGc4JGO87A0iZcFw42CUiwlFMElEUL7M+QG23T0GBNR0l+M/Sn5AbCsTNuYpeps5F1DPN5P/XwVCMyMcQ3zd51qf0nRjmjNikK/SwAjrHM3HhB9LnuRWDPltTkfoSLngN0HInUk4A+PPBlmpt786OlwCSXOgQ/o7FtaZ5HIrp12gczOSuFuAzMVtUNxYOCFaov9NC/Es2V84SvsUoUT1AF5JXS29vyf5N2WGXILy+B726y+8+prVGceSfGMQip7HdhAfk+X04LsugZfKc/Bf3paHM102vYJOZ7kurzzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MApu1/JhC7v9MUlb6wlrLqFZ66aZ8DUS13IcCc6omMg=;
 b=mSF5mIsAFVCvIk/foiihpG7IpLlZtgdkSWRyVsFHJ4CfYTSYxEgI67qkQdENqoWZLcllarC1gLNPgnMN8vuODYnbq7NEOZybKdxQD/e+HXm+6AnHT9Uu9nLM9IV6Z6Iechvx53PfEuyRyvgWEY6cbeYg/0l5/ZUqlWOURmgUFEM=
Received: from MWHPR1201CA0024.namprd12.prod.outlook.com
 (2603:10b6:301:4a::34) by CH2PR12MB3831.namprd12.prod.outlook.com
 (2603:10b6:610:29::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 05:40:57 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4a:cafe::c6) by MWHPR1201CA0024.outlook.office365.com
 (2603:10b6:301:4a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Wed, 7 Jul 2021 05:40:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 05:40:56 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 7 Jul 2021
 00:40:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 6 Jul 2021
 22:40:55 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 7 Jul 2021 00:40:46 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 06/12] ASoC: amd: irq handler changes for ACP5x PCM dma driver
Date: Wed, 7 Jul 2021 11:26:17 +0530
Message-ID: <20210707055623.27371-7-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210707055623.27371-1-vijendar.mukunda@amd.com>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dd014c6-8fe5-48a8-739a-08d94109cb1e
X-MS-TrafficTypeDiagnostic: CH2PR12MB3831:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3831EED9EAF49CFAF2DE6DB9971A9@CH2PR12MB3831.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:45;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /zOx5SCzdjvjo9z8K+hyOSTYCUFecLLu6W8MdAN30N2purwmbZs7e8KYaS8H1AB3KDGdNNIxQqTTSpA5DgJKjgvn9PC3aeB33JNvbg7AXeTIv9crvvWizi6hF0oSdjOKX8fj3AtkJwS21dFT6TCL47pjxJ1dfz7gyZEyfATj6XdNPQxeC3F3Gz4jYmAAsCCCeWj8BVFlORRq68r8hDDeuPuiqqVY42iY2Zn2XEFfg4M3yhYszUw2wy8aSyTRzsxdn1OXe1cWhppkWTvl/ph8vU96AgMm/iDsDVCBe6quhSW43qEXwSXu1/c8PEBdyGwBlYBCAP69Mv/EvZr5FuU9Bmts4wAwB1XvpSVZaaINCmZ6SldJVBQf6prZbn9u9b3hAKHipBXX/h5d9cCgsgnoEnUN0AJskuA4m1DyOh9WK9gP+E8zUYI7PjnoSLHzkqGlkdQ+pE1GzWA/h9zwHPTleupzDZFutORcVg030qoS9ie6PK9xC9YBY0zgeSiBmv82RingMgoLn9PVbBdcz158ZPFtjnnWfN7zQIPWkW8SQeABHOgns4NbtmvL/2QMmf4hPsW4MRqGkrsjVHBZQ9+slWwtjOWTQVKGGiZEzFWUrmmIyC78NwzcZMeKzJ7Lh3NgxyYBm3QfbEKdeqQzvNp2fFn9SiXeW6D1gifAUWiJLulJOUjWJqUvkY4A7by/z4VF7WRdgFf0d1XhKYiajr/ZnejHyEh+cuHISeiTa07+pDfuo7ucFN7gItbTbdcEYtWr
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966006)(36840700001)(26005)(426003)(6666004)(54906003)(36860700001)(2616005)(316002)(82310400003)(110136005)(36756003)(2906002)(4326008)(8936002)(44832011)(7696005)(478600001)(82740400003)(70586007)(70206006)(47076005)(336012)(1076003)(8676002)(86362001)(356005)(81166007)(83380400001)(186003)(5660300002)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 05:40:56.6168 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd014c6-8fe5-48a8-739a-08d94109cb1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3831
Cc: Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com
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

Whenever audio data equal to the I2S FIFO watermark level are
produced/consumed, interrupt is generated.
Acknowledge the interrupt.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 62 +++++++++++++++++++++++++++
 sound/soc/amd/vangogh/acp5x.h         |  9 ++++
 2 files changed, 71 insertions(+)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index efcf01eb89ae..d79712587d30 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -21,10 +21,58 @@ static const struct snd_soc_component_driver acp5x_i2s_component = {
 	.name		= DRV_NAME,
 };
 
+static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
+{
+	struct i2s_dev_data *vg_i2s_data;
+	u16 play_flag, cap_flag;
+	u32 val;
+
+	vg_i2s_data = dev_id;
+	if (!vg_i2s_data)
+		return IRQ_NONE;
+
+	play_flag = 0;
+	cap_flag = 0;
+	val = acp_readl(vg_i2s_data->acp5x_base + ACP_EXTERNAL_INTR_STAT);
+	if ((val & BIT(HS_TX_THRESHOLD)) && vg_i2s_data->play_stream) {
+		acp_writel(BIT(HS_TX_THRESHOLD), vg_i2s_data->acp5x_base +
+			   ACP_EXTERNAL_INTR_STAT);
+		snd_pcm_period_elapsed(vg_i2s_data->play_stream);
+		play_flag = 1;
+	}
+	if ((val & BIT(I2S_TX_THRESHOLD)) &&
+	    vg_i2s_data->i2ssp_play_stream) {
+		acp_writel(BIT(I2S_TX_THRESHOLD),
+			   vg_i2s_data->acp5x_base + ACP_EXTERNAL_INTR_STAT);
+		snd_pcm_period_elapsed(vg_i2s_data->i2ssp_play_stream);
+		play_flag = 1;
+	}
+
+	if ((val & BIT(HS_RX_THRESHOLD)) && vg_i2s_data->capture_stream) {
+		acp_writel(BIT(HS_RX_THRESHOLD), vg_i2s_data->acp5x_base +
+			   ACP_EXTERNAL_INTR_STAT);
+		snd_pcm_period_elapsed(vg_i2s_data->capture_stream);
+		cap_flag = 1;
+	}
+	if ((val & BIT(I2S_RX_THRESHOLD)) &&
+	    vg_i2s_data->i2ssp_capture_stream) {
+		acp_writel(BIT(I2S_RX_THRESHOLD),
+			   vg_i2s_data->acp5x_base + ACP_EXTERNAL_INTR_STAT);
+		snd_pcm_period_elapsed(vg_i2s_data->i2ssp_capture_stream);
+		cap_flag = 1;
+	}
+
+	if (play_flag | cap_flag)
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
@@ -47,6 +95,14 @@ static int acp5x_audio_probe(struct platform_device *pdev)
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
@@ -55,6 +111,12 @@ static int acp5x_audio_probe(struct platform_device *pdev)
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
index eca642614b4f..44662e54bd34 100644
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
 
 static inline u32 acp_readl(void __iomem *base_addr)
-- 
2.17.1

