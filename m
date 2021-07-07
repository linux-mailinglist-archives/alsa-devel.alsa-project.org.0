Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D39B3BE2C8
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 07:44:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD3581691;
	Wed,  7 Jul 2021 07:43:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD3581691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625636681;
	bh=9MBJGJmLvSAqQk/4OMlFMGl9fmnvomANZZjqDqbcyFM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I9QiPfAOQ8hEqwDn7GHgr1lC3KB4Jb5uzb6EoKMsCPA5bs3r4HXxCBNvioWkWuYCG
	 MOEC48wPdwjsc1RmciyFidIKXGC95NweQYdnmwyJq3pjwl0k5OEDXJK2BAHGjfsjxv
	 u0NDEleSCj1sQxWLgTBmbyGcWb3bbp9TxVIIffrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9450FF802E3;
	Wed,  7 Jul 2021 07:42:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87B43F804F3; Wed,  7 Jul 2021 07:42:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EE91F804E5
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 07:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EE91F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="MctCOZw6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXro5RUqH3OMl1PiyBHpfGK6hv+VHWg6jRu8yb3dHPDH8fbCGQ0TcvG8u8qyUN7vKHFpmk9/ZXwQanYU4RqQn3VrAjb9KytU02aJtpnPf8Z7gl2L0DpX0KESsWcrX57zbsIgjscoTWUOxGidw8XOrzYIoFRh8W2XkYP8EZ1+etluvQVOgcX5n+4btr1XsZjoyDx+sC28Vh2GrIqJYnhtaQl4ax1eBOxjlPA0olaMw8QzCVGYRYTci17tpn2zPqJaRIK5sg9uQ+3MBthRWcAoacR+msTTm1HqzlSk8fuWUoL9S/ZD78e+iPWfR92Pz+hqUgUx6hMx7WVPt2ZNUvxdsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CM5cK9pMEVqfUhTgDwJh5r1fzYxuFe4zoBc7J20VUXc=;
 b=gylukDAdazGkjzjgDa7U5D1kuKxMx9AcA3C8beeOEkjXfKQsLBuQH3/bNgzLGWV7elv66Rv3tSAGfvmkYq520Nu3C6E0xryOQ8sPkCcR3wD2ji85inNaFO9fBK8ZG/IytVn5vpmjd05WditVq171X8fZ1q6Iz4Bqip7Cn0yvvmUSk3QrrfujMn/aPzwJM80uxR3DCXo2u+oowQr7ehoP0vml6xRpgk4CCZFJYaDelIBTmtR5dkKFYy5CqKl9fED9X5ug/kxwXz+jZNTSv+e7Mjx+3YSQUIUvcmZ5cmUICKpa5TnTE6QWMATWvDraE0FmVmkMZXiKt9mhX1cyGgp/sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CM5cK9pMEVqfUhTgDwJh5r1fzYxuFe4zoBc7J20VUXc=;
 b=MctCOZw6IZGQ92tJ5STwewZokElhgx11v+VmMWbmEp8u+/J/X1NqL4btHpGp9hYr93YHps+kdDic+LUrRUZZ3eAZmdAoR3z0TzJRAx/C850QAZP+dJUhrqK3vqtqXI993CFDVbTEaF8Ag9Ukp+7cEHVlr1kVemU0t7+aXc8pQ+U=
Received: from BN6PR1201CA0007.namprd12.prod.outlook.com
 (2603:10b6:405:4c::17) by MN2PR12MB4080.namprd12.prod.outlook.com
 (2603:10b6:208:1d9::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.32; Wed, 7 Jul
 2021 05:42:20 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4c:cafe::9a) by BN6PR1201CA0007.outlook.office365.com
 (2603:10b6:405:4c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Wed, 7 Jul 2021 05:42:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 05:42:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 7 Jul 2021
 00:42:19 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 7 Jul 2021
 00:42:19 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 7 Jul 2021 00:42:08 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 11/12] ASoc: amd: add vangogh i2s dma driver pm ops
Date: Wed, 7 Jul 2021 11:26:22 +0530
Message-ID: <20210707055623.27371-12-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210707055623.27371-1-vijendar.mukunda@amd.com>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c87193f-7c33-47b3-401e-08d94109fcba
X-MS-TrafficTypeDiagnostic: MN2PR12MB4080:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4080F189721D0DE1DD578F23971A9@MN2PR12MB4080.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wGPS93LrQC+dJMl0xJHEg4jfjYjvPjX4PFzEp2XpJEB0DI0z1UfSZ8znV0opshkvpxNFXsOdSc4qrglq/4BoNLBzWntO9B4inZfh0elkMPimW7v19wmJ3QXAZz5grHThWHgDaAnlSUqMLKLC2Sf8VrBg9YsVx5RcKz4GjgK6fW8vIZFdTF7GJ6t6LQ9ykdIvbmrcW8yxTZYmkAxzT4+fUT3kREAg+0mDvWTej8J6wxX9UsXhJB+6zToIU6hN6HuuaOMg9oy71gBgYD4p72OaH6iJmUmf80qINfFYLYSvH7P0Zil/PGnuzAVqwk9vm8ZmJajxPPtQxtMD+mD8zDfX/66W3nRKOEnh3XQHyVXJwro7WwX/i6Uh9HFF9WEwy8CaEUQwNdGs0pqtmGlKun1Rf9OSN/VTnVAzdfuOox87XRNrPrPYGUIi2+PrqDHVp6UGHKG2WyuN5JwU0lIZ6H/GDC23Ig/gU/aCdGuMkMuQfRq341W4iVDfnKFx3oaoTZxWhx0UZGg0RBYibT/Grx73Chsz5wfTkDeGyEYasqGY2dviAOYz/5hUjodU416TkszSOUh2xQGLMD0pmg4DG4tXwNAVA5N2ZYWFmvdpV+/efqNoxpwua7DYnFubavIaiSV2YyVAOaV4cH+jsH+dsmA2aHWHT7c7prK7PylpUzerl/BtoEpYrPPfzF+e42rUfSn+wH1hdiDZKXKmC3vC5QimBWyGb9+QIkXB2nOTr9seAxw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(36840700001)(46966006)(186003)(316002)(54906003)(36756003)(336012)(86362001)(6666004)(8936002)(2616005)(82740400003)(44832011)(2906002)(83380400001)(478600001)(110136005)(26005)(356005)(426003)(82310400003)(36860700001)(1076003)(5660300002)(70586007)(70206006)(81166007)(8676002)(47076005)(7696005)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 05:42:19.9661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c87193f-7c33-47b3-401e-08d94109fcba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4080
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

Add Vangogh i2s dma driver pm ops

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 84 +++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index a4235cf33548..c90d9620e977 100644
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
@@ -419,19 +420,102 @@ static int acp5x_audio_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "ACP5x I2S IRQ request failed\n");
 		return -ENODEV;
 	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
 	return 0;
 }
 
 static int acp5x_audio_remove(struct platform_device *pdev)
 {
+	pm_runtime_disable(&pdev->dev);
 	return 0;
 }
 
+static int acp5x_resume(struct device *dev)
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
+static int acp5x_pcm_runtime_suspend(struct device *dev)
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
+	.runtime_suspend = acp5x_pcm_runtime_suspend,
+	.runtime_resume = acp5x_pcm_runtime_resume,
+	.resume = acp5x_resume,
+};
+
 static struct platform_driver acp5x_dma_driver = {
 	.probe = acp5x_audio_probe,
 	.remove = acp5x_audio_remove,
 	.driver = {
 		.name = "acp5x_i2s_dma",
+		.pm = &acp5x_pm_ops,
 	},
 };
 
-- 
2.17.1

