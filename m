Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6ED3CFF40
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 18:25:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 861AD16AA;
	Tue, 20 Jul 2021 18:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 861AD16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626798322;
	bh=NYHsl2yZUlLb+yCmMR6jh5BtwZWnBm4xIowzScvtVbg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B9Its/MARawpf6ueek8h124NeZqUadMoBuwGWJcUtuGaNBq+rNmiuOb5ijEF7Hj0t
	 NRTdt7fAGKxSXIL42DMSgIhdbWAUINb9g7B4Bga6SUJ+MvhjCfxrjn5HsIAnN0jnoB
	 fRCOEdrSGKo4aRPkoPWd7HIEiyAJOUZ4SxQybM6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 525EAF80526;
	Tue, 20 Jul 2021 18:22:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CD0FF80526; Tue, 20 Jul 2021 18:22:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 547D9F804DA
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 18:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 547D9F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="dfidu0wD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DB4+CQVm3eftPe/P8OoBPJcLLbIrCsuQL28nzw+V6cbwEmWVTSe9JnmHPklB+xR0YfjH6t0A8C2RETiEaClRju6/8pWLi80c0x5aurQWlgBVHeYfBdmLeW6d5BifsKPWZgzRySx9HeTvj7fF+u+9cDbAx4jY30/c9GlrnmWguvmi+gTqA+/MXd2fvErHUBJLPR5pgWysDFsySf98I2PBKYX8cUryEVbb0/4IlQfrIKroj7DagcO8vP4XAwlwKcvwYzWsh4lj9dHO06wNOUKY0PRKYKUfyFjeq/gzNxofH148rmwwwdlKieypkzFQSvIFaVvK5mgXZtZ5hLud3zHL7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R24IyrcLXC4EOQrKNoLsLOydMVGnJ5VoiKBgjj8ZTmY=;
 b=ZX5H9flwBkAmLSQuP9nQWvSwCdKCgT9FQe2U97caTlzRZpY1jwxKgiP9faEpwtuVheG1+MYBVwLhK5XWeZudy/BGKFELaaiHWXCMhHsk8JT5vTRwAVedPf7NAqS67wkztJvR0oP15PnY+E+n9BhoVnqnLxhxTkdVLEdKa4YXnOXu22YoG4ug5YaXz3D6aOeruB4WpA9SZZ4zyms9qqRo1LL2S6R9XUl741Q++Fiv260K7fMuUMr9+5VCa3y20k58nGRTPo9AkwYLOPDy/8fb0U2TAv3yFjuNmZVCiwhUxRNAJ4ye6NOZ6+ZICKFisqG5g+DlI3nLmUSYyNmsVa5cSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R24IyrcLXC4EOQrKNoLsLOydMVGnJ5VoiKBgjj8ZTmY=;
 b=dfidu0wDMVG11ndX4gz2Xl2lD16lH1UUDYBQH1nYqEW+EJvIGxnxGsL0ePkKNvzYX9jw1GY7X9CtsyFw/YyzLYqRCCIFmX/IttbcEKT7VrNY0FhQZqy7M08I2LxrFl5qWOkiH+1uGVce10K2Gj3eieHfjA8XZAD0Q4/uq1B11jU=
Received: from MW2PR16CA0010.namprd16.prod.outlook.com (2603:10b6:907::23) by
 BY5PR12MB3650.namprd12.prod.outlook.com (2603:10b6:a03:1a3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Tue, 20 Jul
 2021 16:21:55 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::1e) by MW2PR16CA0010.outlook.office365.com
 (2603:10b6:907::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 16:21:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 16:21:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 11:21:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 11:21:53 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 20 Jul 2021 11:21:49 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4 11/12] ASoC: amd: add vangogh i2s dma driver pm ops
Date: Tue, 20 Jul 2021 22:07:31 +0530
Message-ID: <20210720163732.23003-12-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
References: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c7e97d3-227d-4075-db3b-08d94b9a7d8b
X-MS-TrafficTypeDiagnostic: BY5PR12MB3650:
X-Microsoft-Antispam-PRVS: <BY5PR12MB365086D0AE8CC2F4B9C7C15397E29@BY5PR12MB3650.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rdsuyy0WUX1jeDuXAP6twW0wbmhbFk+cZO42LnLVxWag/75W9j7+yTlmV6GRDmqjChwTCfQVStXW8jGpXEHjqKvS1Qj7qRGDP1wlgV988rXBlaAcHzn8bg2Zhml2rrnurVy08sweKwUr2JjQLppmVqT9NZHdP/l9Z/uokY0yu8aKISK6JS1hQhNuLoyFWbn18yV1lbFlzimr5yQthf/xDJwDsxpTX0IlAgAb2r1yn1H4A1sBICKNAGtTm+0fVlRL2jGXb79VHRqIPAd9l1zytz/k3RZWyw0SGH8c3DHTA0uNwqJDEJh0cqRXHi9NABM+s/niWYU5R+U1Ux8bnsQuKz2ahu8ZUqLj0dORSFdglSiCqM+qgcTHgVgTv/eXc0SNpo2hoZ+50MCe2xGZ296rQakBjGUKrZ2yWCH/7kzzvGpEv+pFAn737ZYAkw77jSCj/dCwcd5AWXNPeHfK2Uqj0+MaZDA/uPMUyAnyhxV0mukDiYceuRoBNatpBw0BfAHqz4EAkY2mDCxDKAN81AfVFd+KMMFRB5C/6OaFtZUnJQs4bsYjLSdqlZ7Yesxyei11ycmw4dZIXYpbhOktSfiG1Rh5RigJ0eiQYuRYe4jNIYj/uaJF4FaQLFU0783RujYlb9r9szxyGfJgBbcgyRWp9222Tg4OkcHK0XL931UpzTvM7ElFeuXJqfoFeSLq44PM+gQd6I1+mPfvKHgG9XCcH8xuStsQ5ZNfV/TKdsebjw8=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966006)(36840700001)(5660300002)(81166007)(316002)(82740400003)(82310400003)(356005)(186003)(54906003)(36860700001)(8936002)(7696005)(26005)(86362001)(83380400001)(4326008)(110136005)(478600001)(426003)(1076003)(8676002)(6666004)(47076005)(70206006)(70586007)(36756003)(336012)(2616005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 16:21:55.0441 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7e97d3-227d-4075-db3b-08d94b9a7d8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3650
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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

Add Vangogh i2s dma driver pm ops

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 96 ++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 57a1a1f54155..cad640ea0fff 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/pm_runtime.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -411,16 +412,107 @@ static int acp5x_audio_probe(struct platform_device *pdev)
 	}
 	status = devm_request_irq(&pdev->dev, adata->i2s_irq, i2s_irq_handler,
 				  irqflags, "ACP5x_I2S_IRQ", adata);
-	if (status)
+	if (status) {
 		dev_err(&pdev->dev, "ACP5x I2S IRQ request failed\n");
+		return status;
+	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
+
+	return 0;
+}
 
-	return status;
+static int acp5x_audio_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+	return 0;
 }
 
+static int __maybe_unused acp5x_pcm_resume(struct device *dev)
+{
+	struct i2s_dev_data *adata;
+	u32 val, reg_val, frmt_val;
+
+	reg_val = 0;
+	frmt_val = 0;
+	adata = dev_get_drvdata(dev);
+
+	if (adata->play_stream && adata->play_stream->runtime) {
+		struct i2s_stream_instance *rtd =
+			adata->play_stream->runtime->private_data;
+		config_acp5x_dma(rtd, SNDRV_PCM_STREAM_PLAYBACK);
+		switch (rtd->i2s_instance) {
+		case I2S_HS_INSTANCE:
+			reg_val = ACP_HSTDM_ITER;
+			frmt_val = ACP_HSTDM_TXFRMT;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = ACP_I2STDM_ITER;
+			frmt_val = ACP_I2STDM_TXFRMT;
+		}
+		acp_writel((rtd->xfer_resolution  << 3),
+			   rtd->acp5x_base + reg_val);
+	}
+
+	if (adata->capture_stream && adata->capture_stream->runtime) {
+		struct i2s_stream_instance *rtd =
+			adata->capture_stream->runtime->private_data;
+		config_acp5x_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
+		switch (rtd->i2s_instance) {
+		case I2S_HS_INSTANCE:
+			reg_val = ACP_HSTDM_IRER;
+			frmt_val = ACP_HSTDM_RXFRMT;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = ACP_I2STDM_IRER;
+			frmt_val = ACP_I2STDM_RXFRMT;
+		}
+		acp_writel((rtd->xfer_resolution  << 3),
+			   rtd->acp5x_base + reg_val);
+	}
+	if (adata->tdm_mode == TDM_ENABLE) {
+		acp_writel(adata->tdm_fmt, adata->acp5x_base + frmt_val);
+		val = acp_readl(adata->acp5x_base + reg_val);
+		acp_writel(val | 0x2, adata->acp5x_base + reg_val);
+	}
+	acp_writel(1, adata->acp5x_base + ACP_EXTERNAL_INTR_ENB);
+	return 0;
+}
+
+static int __maybe_unused acp5x_pcm_suspend(struct device *dev)
+{
+	struct i2s_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	acp_writel(0, adata->acp5x_base + ACP_EXTERNAL_INTR_ENB);
+	return 0;
+}
+
+static int __maybe_unused acp5x_pcm_runtime_resume(struct device *dev)
+{
+	struct i2s_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	acp_writel(1, adata->acp5x_base + ACP_EXTERNAL_INTR_ENB);
+	return 0;
+}
+
+static const struct dev_pm_ops acp5x_pm_ops = {
+	SET_RUNTIME_PM_OPS(acp5x_pcm_suspend,
+			   acp5x_pcm_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(acp5x_pcm_suspend, acp5x_pcm_resume)
+};
+
 static struct platform_driver acp5x_dma_driver = {
 	.probe = acp5x_audio_probe,
+	.remove = acp5x_audio_remove,
 	.driver = {
 		.name = "acp5x_i2s_dma",
+		.pm = &acp5x_pm_ops,
 	},
 };
 
-- 
2.17.1

