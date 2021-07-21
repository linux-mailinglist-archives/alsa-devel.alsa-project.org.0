Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F6F3D157E
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 19:50:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 572BA170E;
	Wed, 21 Jul 2021 19:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 572BA170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626889834;
	bh=DHgwXuHHSGhIYcbZ4uPZJ/oTJ32XDDtKFDsOEW60ibs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MwvNVuPWhmkLuBwWadj/4tNVysoktTCP9i2rDRbMk+wUSIsNDk5oldXkAuA6vuIOJ
	 3eZ4YIyiZSmBMgTGFh6/JWYJ3RxSayCryCGet7pMy8yxbRz+j255m149Sa7p4+Bqkq
	 vTATkdzOrZonWSUPZmQAmzkI+PQzX7unB9g8gTFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB334F804DA;
	Wed, 21 Jul 2021 19:48:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2EFAF804BD; Wed, 21 Jul 2021 19:48:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2087.outbound.protection.outlook.com [40.107.95.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDA11F800FD
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 19:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDA11F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="ZDXdfm52"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XW7jq6AJj/WHsxixoabkzO9nR1S1cbz7uSnGzp1qaMALa74vaWjCP6+FR4SKRL7IK2X1uCxNeKTqMMMIhKyBW67jHymh6BpfWYmvUjUKR8m+kE/JWuOzxg8t1QY9Y7uSJGQ5pOp+aeTf7o3t6lxLvSolKX1iMBKc9umMqLsJFPH1dbdoyGlDDzsDkIkw//5rF+UwESUS9NC8G+4EIDn6CVbefF69IWV32Sre0rbW4qxfy9GXF8SsQirovY+noDMknMTNXR3vWYKsfChcIi+gGKXVUglDLCqaEqQlouAehzHqxVmdcyfYFSEuJo11KfU58SmA1EjCZTSt1hdmttJScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qu+BWUFM7tj4+sUruvt0nSTe0JUeZx9Izxk2XymwQzk=;
 b=ZDqNaza7tbHB+0osDTXIznreFefs/0pZ1szSLfOyb2QGtUOZZn7iXOO7DCPWr2bKvn0REy8PvBLKC9q0ko3Zt/IOQlhckNqrnIpJHROSMxrRh0u2sZVJvH1Skg6CU2B1PgtF5af4d2/k7X+rTsipcm8wMQgA954apSeF129UiOIefLBmqzn3vDn2wjuRCwS3FouzVuBRYsIxKCml2jmR7b4sBsbTkl1/zId1kl9C+QwmGw/qecnB3Dqw5vRkVM4LFmtZ6ROga8ddE/ZgSgrW/DiXhSFqVWRCzIL0tLhCdll3D2aBSn6ODyvhMwpUwEQ+3iKpDW/7/jnfsxN1kVYMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qu+BWUFM7tj4+sUruvt0nSTe0JUeZx9Izxk2XymwQzk=;
 b=ZDXdfm52o6E1Pl+Dj/Zas5swL1wB8iXMbpbCcefRoJFM21zuOcj04XWYWmug1C+gJnHJ6DjDEzqPj9G9fHuN+OczQrEOrSrE1+FyrCLBMVAyYMAndhnOfSQp3b+bsH2/a7CvgIf03LmJxBXe4VPzJ+AgnKCqhwEvpHXTqqkMKws=
Received: from DM5PR07CA0037.namprd07.prod.outlook.com (2603:10b6:3:16::23) by
 BY5PR12MB5527.namprd12.prod.outlook.com (2603:10b6:a03:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 17:48:29 +0000
Received: from DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:16:cafe::f8) by DM5PR07CA0037.outlook.office365.com
 (2603:10b6:3:16::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Wed, 21 Jul 2021 17:48:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT036.mail.protection.outlook.com (10.13.172.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 17:48:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 Jul
 2021 12:48:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 21 Jul
 2021 12:48:28 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 21 Jul 2021 12:48:24 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v5 06/12] ASoC: amd: irq handler changes for ACP5x PCM dma
 driver
Date: Wed, 21 Jul 2021 23:34:22 +0530
Message-ID: <20210721180430.11571-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210721180430.11571-1-Vijendar.Mukunda@amd.com>
References: <20210721180430.11571-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cefab1d-a87e-459c-c41a-08d94c6fbfba
X-MS-TrafficTypeDiagnostic: BY5PR12MB5527:
X-Microsoft-Antispam-PRVS: <BY5PR12MB5527707AE9CD61A5466E89C097E39@BY5PR12MB5527.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:45;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r3vtnZ5Cbd6dO2Y3h97Xs7vnBpRfXpM4MyeSp+ZSBoAwk55fJgGE2nyFZqsGnl5RMCvkxQyhVim29OdCqOYujIgJwtuvMVgM23OidU3nv2X0vsfmlBsZ3YLqxe9JfO1f2hlCI26Z92IBxtRCXqycyPze9S4GQqoZxsjcjZJwn3Jrs7kdB6lcoG2Px4e/REPT254dqg+unlYBC8ZklmHYuDw9f2YtA28B6gUFJiyoD/X+nGolYMpQth5whFmj61j4Nf8ekua1BUuq6/g7sG6Cj/D1oVw6VpRouA8SJYqDqSYGiIFVwS0RFThRZgk8i2XLuQc/AV9HzkUKNHtdezlhQkO8TMEfYVZ3iMSTZG9Ui9KprDep8pzLTq3UYxeMc9NOhccwGwUE3E3uvr7flgI6386VheEtq69QoTd+/bxSMCA0Aq8q5noYwjDO3ZmbJOKaurBwnRNVqnF1ad506w8Tgr7PCDn1T+brwK3/foh6pUL3Ad3j5KykG4ENrlpkz5FRrhY/OiFGhsaSZscb1O2sE23EEmiG9awrRXlAIRk8TagsvCPQwBPxxEJE1XietCKr9ou1nbCWljnuU/zmebic3XRRhloOK+nak0lWcjoyAPG0nx8ljOCOxrNUBzHCx8ruhtqMOLRrSwa8l5SYDBWg1wF/UDQn/zLlU9CrijJ/EkPNg8LY1pWbijw+ne4jZdM5QbuCRVsJdd2a5LEtsy9ZwFvZVR/zz3+QGPaB39lqMqv5CXxyiIHFKUvrxLB+twpo
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(36840700001)(46966006)(2616005)(478600001)(81166007)(8936002)(4326008)(47076005)(26005)(8676002)(336012)(36860700001)(110136005)(356005)(54906003)(2906002)(426003)(7696005)(70206006)(36756003)(316002)(82740400003)(5660300002)(186003)(70586007)(1076003)(86362001)(82310400003)(83380400001)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 17:48:29.0305 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cefab1d-a87e-459c-c41a-08d94c6fbfba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5527
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 pierre-louis.bossart@linux.intel.com,
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

Whenever audio data equal to the I2S FIFO watermark level are
produced/consumed, interrupt is generated.
Acknowledge the interrupt.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 61 ++++++++++++++++++++++++++-
 sound/soc/amd/vangogh/acp5x.h         |  9 ++++
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 60d752adfb81..952d5fd83653 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -21,10 +21,55 @@ static const struct snd_soc_component_driver acp5x_i2s_component = {
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
+	if ((val & BIT(I2S_TX_THRESHOLD)) && vg_i2s_data->i2ssp_play_stream) {
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
+	if ((val & BIT(I2S_RX_THRESHOLD)) && vg_i2s_data->i2ssp_capture_stream) {
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
@@ -47,12 +92,26 @@ static int acp5x_audio_probe(struct platform_device *pdev)
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
 						 NULL, 0);
-	if (status)
+	if (status) {
 		dev_err(&pdev->dev, "Fail to register acp i2s component\n");
+		return status;
+	}
+	status = devm_request_irq(&pdev->dev, adata->i2s_irq, i2s_irq_handler,
+				  irqflags, "ACP5x_I2S_IRQ", adata);
+	if (status)
+		dev_err(&pdev->dev, "ACP5x I2S IRQ request failed\n");
 
 	return status;
 }
diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index e450fb32d680..a0d898e47bb8 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -32,9 +32,18 @@
 #define I2S_MODE 0
 #define ACP5x_I2S_MODE 1
 #define ACP5x_RES 4
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

