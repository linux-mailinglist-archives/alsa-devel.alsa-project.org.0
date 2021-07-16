Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9A33CB929
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 16:54:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27B6C1690;
	Fri, 16 Jul 2021 16:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27B6C1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626447262;
	bh=OZoP35Ol4P17fC/hSrb9koi3zKzpwxXnT6SVoS3S2aU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aaab53p4acSQSCLsseQlwQ+6UQ9YbD+VTC7duBGf1/mrYdw795EQ22R2qVCuMQVyb
	 CxGAtsc19gVAWVVYP1rCtAuLS7e5SzniFzZqYUT/VE1idREXrXIbtwukvFqexeFg40
	 /9MMnSp39nClZLbcjkJ9yqXTtFBLgIVp2gVm8s9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6041F800FE;
	Fri, 16 Jul 2021 16:52:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3B7EF80424; Fri, 16 Jul 2021 16:52:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DAF7F800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 16:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DAF7F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="zTub17NM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cpkx4hzDggNyizrNsYBXVr08n2enP0MbZP4MW7SjO0WIxMglAMqAXYB86SD3RpkHHR0qrA1sOmbI6gN8yxCpOfAM/QTXy70Vz9berFF/nf2lT4ERZf/ATlhzOP67A3q0tywhIz2CI28Ab6pnw8zqcNs0NtUjImPyx1BYhKih9C6YKdfnTYI4lumJfKuSjZXUeZmZkM2ePRFf3J9l3WsTI7Vx0uHnIEv9pO63Er6lOy1eI9zRuZkGjE4epD9qzVM3WGSWVrEYRB9XQj7Jq7BndKITW5uiBFvH9qDOAwUwC1rkV2DiSyxr96Rumh/jGNjcsw8cuv7SzlxZwcUmiUuutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78LsY1SjKoxrfgLQHI4TP9sHpVfBeGtHqM80YoTfW6g=;
 b=AUk/LeoTRMPNbmVoUsCnvm855jzIud7ZOOGIYxMOmpPRSYvJwqNmrejtgz9VmFCV0gdPCDBGe3ugPUnJZlHF1GQrqf6UBXIRTgMe2Ld8xA39VtJmk18doSUjX/NRY4mpBLzO+G8C7mH8nJ5/Mb+0SprrzF1KXe4w7tFpH79aiyM4biWTebgykOoXM7eA5sNO0sKIoQHgU2fz5Q+uuaCLD4IYVGxQIQ6n5JLa1nsV1sWGC2C6XTfPiAjV4jFC6xsB80oZT6hfNpVPrP6BS0zKV3QHAU2aQWll6wSWHymp6GC17i3xAGfDc2iOjivqsR+a9hCOQNWFJg18VpqU/aSLcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78LsY1SjKoxrfgLQHI4TP9sHpVfBeGtHqM80YoTfW6g=;
 b=zTub17NMOB0oJHSApWpQbhEk2z3vEAvjXmMgqcidsyE9dah5jkMb0OSAFlA6fPeXMQHGFalgZNN8JtxS6cPlHwjCjQAmo2YDheZi+ZHBoYi7ussUThhHYP9tf58LXwuGcv8opZcwa+NjB+Ua16I6wle2XAdK0LezwqUpMNbRcug=
Received: from MWHPR08CA0039.namprd08.prod.outlook.com (2603:10b6:300:c0::13)
 by DM4PR12MB5184.namprd12.prod.outlook.com (2603:10b6:5:397::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 14:52:37 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c0:cafe::35) by MWHPR08CA0039.outlook.office365.com
 (2603:10b6:300:c0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Fri, 16 Jul 2021 14:52:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 14:52:36 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 09:52:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 07:52:29 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 16 Jul 2021 09:52:21 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 06/12] ASoC: amd: irq handler changes for ACP5x PCM dma
 driver
Date: Fri, 16 Jul 2021 20:38:03 +0530
Message-ID: <20210716150809.21450-7-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716150809.21450-1-vijendar.mukunda@amd.com>
References: <20210716150809.21450-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93468ec7-fa8c-4b74-9a6f-08d948695a09
X-MS-TrafficTypeDiagnostic: DM4PR12MB5184:
X-Microsoft-Antispam-PRVS: <DM4PR12MB51841EF39CE2F957FB84A3C197119@DM4PR12MB5184.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:98;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AZTs1roQ0LPpiKFusB5SDfrxtTNNyc7NnvXdyzrnNkPURgGw9GvghVNxelIjjBYcDEka9iwY+WAO3tYHVR73LLLKo4jQcYp8O8mDA66dCUEOy99Kqdjbd1t7afPgwN8OrAer1+fp9bSYp90r6ZsM9GTKdmzmsMoeSewk3QcOpuSzkuf662czkeL0O4IPIwFmK3y8t++DJyDMWSDncVP6uQXU5qcXtuDkTYu1pFY+CI7RsCxHWBF+OTx8juGTWiQsvuDzUr0a9wSQNNdnNCnF3EihOrjAPtNgL27r3MnXHeqgqHcbsAmjr72JFuVXLzlePOmanjoVZaSVJ375Y1UQ0o5E6oigkVFCrlCeOSPnpVFwjbUNYBg6wlhu/tKzDZKw1jebt9ARd0+mgtbMezVfCesaW5jtGCNXZ1p+ICFpjVNmd8UvsATbNi6wieYEjejawthCT84zMsoXkyen19WoyL31ko9D4gNwc50Qcpp+J5s1MLvg+8QRlziT6xy+oE5kTd+HJuLmHYyy5phbgKNrdyeWQcKCp794T+rf5gLN87SmsutLwdhE21rTjHK+dlIA0yKnXzpSCTm85B3rFyNz22yqwqMX01Ij4Vjp6iyjxcgJq7SGLJZFoThyX68vKdn/WGPdG+ntyswnbV2oaoceG+mhHW7+Hl+Y5P78BifYSzS27pGMawuvz6vDwPS6Bu85b969bkkW3rpauVGugtq7R1Vth0XL2tq4doyz6QsFbc0QmPpF6zNSqVBHW3UB7yVk
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966006)(36840700001)(1076003)(336012)(426003)(356005)(36860700001)(86362001)(70586007)(70206006)(44832011)(110136005)(316002)(81166007)(47076005)(54906003)(478600001)(8676002)(82310400003)(82740400003)(7696005)(8936002)(4326008)(2906002)(36756003)(26005)(6666004)(2616005)(186003)(5660300002)(83380400001)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 14:52:36.7311 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93468ec7-fa8c-4b74-9a6f-08d948695a09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5184
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
2.17.1

