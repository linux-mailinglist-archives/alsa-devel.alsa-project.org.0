Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0433CBCF4
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 21:47:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C02016EF;
	Fri, 16 Jul 2021 21:46:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C02016EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626464860;
	bh=NupU+UTUz73GLQpZF7pup/Ky2EzamRxKLBl36aUvgUs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pjB2mmgY4UM5e/e0gAd/HvV+lkpJ/YG0q2B7XYp9hBtRWfybaY4ruViNZpGC52Ub/
	 h64ukNZAUfPeNlJJOdV49lm3774zstF4t9j/VMNQ6ZJ1lDs27r5H255fCce0BoOecR
	 IiO6YruZukp5A87iGD8gU98m7GK8FBAPLyHLqFxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3B64F804F3;
	Fri, 16 Jul 2021 21:44:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45BC2F804F1; Fri, 16 Jul 2021 21:44:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2792F804E5
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 21:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2792F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="P1X9g9DS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ub4XWOZgd1hvr1rhzi0pefas3llT2yK0sMQoDz9+6zE8hpscEl2oonDf0tt8l2+PTm61E1FJb8hQyfBQMSj0d/7Bo6ij2vGXUUx7wig2jaWInISuWZk1xAVdbubDQZAE5EJBLrarG1VaAyX2mdeK+BtxoWGykuMQVj03Iz070VmyYEWplRCMLXGcdmlOf9pR64vtJCeMu8MFoZxVZsWvWgAcgSSJipx2xgn4cxO3UIhuJD+9w1Rn5LWEH8fwkiVhLoECLMJZEX5tt4rg9GGvPZR1z8WAibFkp/mILL0YoQOtittKKt0tXqqJLfOkYsceXZq7NU3a5ma3Ahdky/1tag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YogIrA6E83LO5tg9JwjCVmNrwOOONkZWOZSGK0pZ4ac=;
 b=dIGfmrWAjsaegH/6cgYnK7YNf6ci0qNXkYYUs81Cz+fb8qk3SXjjsPIRkht1tEoqjzaMBInJjre3Cnmme+5W4A5+S4r/y723ppEHDCctW8PsUXdTTNydakMgCnYGl8XXVnDCuXijZhwYrqLpIY+jO457RNAb8TXaMVeqeg2rWemNAioRrMV3NXijHRkzftESw0xzZEW2SeZnspdk5VuQFSb8bYAjQ5uCLRg3Ii6gwmulIT9gCqKqS24ruNIhk/FARFeu2UxP16mxh44pI87ev+Yuoz6gbnQIC0CqpbJV456H/64ZxESn1e0Ui3AIj4t/OoBNrPfV4QqosGDhxgTb0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YogIrA6E83LO5tg9JwjCVmNrwOOONkZWOZSGK0pZ4ac=;
 b=P1X9g9DSZ+hALe1tIb43Likb3cRdP1hbQx4qtvfHDtvJ7gHIko1Ye+B28OVMCIhV/df5g/lpTvdhcas5BqzlVee2GB8Mj+CSeqm7fgl7vkS2ukhvffOPPSnvnDxhElVLw/+IdZMX30Q/Yu8hEynPHcQNcyhQNjAqI7abnp08SMc=
Received: from MWHPR1201CA0001.namprd12.prod.outlook.com
 (2603:10b6:301:4a::11) by BN8PR12MB2961.namprd12.prod.outlook.com
 (2603:10b6:408:65::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Fri, 16 Jul
 2021 19:44:13 +0000
Received: from CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:4a:cafe::c6) by MWHPR1201CA0001.outlook.office365.com
 (2603:10b6:301:4a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 19:44:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT011.mail.protection.outlook.com (10.13.175.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 19:44:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 14:44:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 14:44:11 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Fri, 16 Jul 2021 14:44:03 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH RESEND V2 11/12] ASoC: amd: add vangogh i2s dma driver pm ops
Date: Sat, 17 Jul 2021 09:30:58 +0530
Message-ID: <20210717040059.310410-12-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
References: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecb0f11a-25b7-4dc5-f6a3-08d948921694
X-MS-TrafficTypeDiagnostic: BN8PR12MB2961:
X-Microsoft-Antispam-PRVS: <BN8PR12MB296170DB4037F5930944BFAB97119@BN8PR12MB2961.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TLPcD0T0S4c9sDly0qTmqHbBogdtoz+Ts47n+lNBQQB4ezaWBYvTorbQt5OO2BwJuwHtJP/66JFa830QsWe8Zp4YxmB+0gsL0nkm7sRZqZOlcpKPFV+N8XaEjy81pCyWaOAdl9eAKJlcGllrxTC+d2o5ymXpWXBlkKCxKo47nfTLuON8oZxrdJJ2aePB1ALGH4PJM1yCQZppWG773gRX8TbfCPtuDtTENVnViEl3rYSDCXQYgxrhkqdtAQ2Z/2zYz3Rgal8Rx7qxs6uz85XmCpaZkbev07yfmmOcnV66nZY61183RmmI5axsXGZHTx2+nSHz7Z7WdLmcc5A8EZVmBZOvzthcrZG+H6rojp58gCpINuaHA6KYwPE9g+nW3lqJ0NmelW/4kIDwl6wYtan0KlHjWgf+Ri484KvJFjlJTwx4MQmAkKd8B+CtVuRDn1mRJbLXdFkW0ythr0kPt+F8cyseWtzjrSfQtG2UsGZBLhWWrplGCh3LuUM0AeRJLaHzDPPf/Eh8yKFC58zZIuu7spPrglWmKCeV+AvxUOvwUVP1qLIgtd4PXYPd4KW11PPCHb/Fm9HBlv4obqf5vUWpmp6vM72ndaEj+fWXxZYjCJS4jtmzPQH1cLJH/A2mT8FvzoYPA8O3ypEkLBK6xlhIuZIoJIDwc2ocQ80ffIBMnd63ch9XJzcsHU3BvMyOIUtIBqxxr6lHgUzpR6V6Aa9Xb+ShtElf++U2CWcaIFyxbxc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966006)(36840700001)(6666004)(316002)(7696005)(1076003)(86362001)(54906003)(478600001)(83380400001)(186003)(81166007)(82310400003)(356005)(110136005)(5660300002)(47076005)(26005)(36756003)(82740400003)(2906002)(426003)(70206006)(70586007)(336012)(36860700001)(8676002)(8936002)(4326008)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 19:44:12.9213 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb0f11a-25b7-4dc5-f6a3-08d948921694
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2961
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

Add Vangogh i2s dma driver pm ops

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
v1 -> v2: use PM related Macros
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 90 +++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index a2bd53dc86b9..260b6ae0fb2f 100644
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
@@ -417,13 +418,102 @@ static int acp5x_audio_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "ACP5x I2S IRQ request failed\n");
 		return -ENODEV;
 	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
 	return 0;
 }
 
+static int acp5x_audio_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+	return 0;
+}
+
+static int acp5x_pcm_resume(struct device *dev)
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
+static int acp5x_pcm_suspend(struct device *dev)
+{
+	struct i2s_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	acp_writel(0, adata->acp5x_base + ACP_EXTERNAL_INTR_ENB);
+	return 0;
+}
+
+static int acp5x_pcm_runtime_resume(struct device *dev)
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
2.25.1

