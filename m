Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D454431739
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 13:26:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0344F193D;
	Mon, 18 Oct 2021 13:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0344F193D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634556378;
	bh=KNBkgJRDR9SBfmBtJjrGuR5QWBIh0rqODHA2V3EPYKQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nzQW7j60zqJsE/q9WUAk3ihRYfPGILbAXT65b643gL6Wg3QFkbqzWWDM0NSlDbSGC
	 2tgdhC17qxaJMgnaA5hr1sKPMvvqon0EczCqnk78hqCGOR8hVIXHl5mPHLzftl6faf
	 xPPpldKZ+ve4empdlfZOSpQ98I2YbrMA56puhuEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D283F80535;
	Mon, 18 Oct 2021 13:22:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7738FF80534; Mon, 18 Oct 2021 13:22:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C890F804FF
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 13:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C890F804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="y+TVP+bL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TM/+Yom3v52CgTHgibKwgRB576gIVo0mNMlKaUh2TCOqGscbCtd0kpCZPvqRBGnZV9X+xc+WNEZ0RxrO5MEWYQZhefE5tP7VH9eQuUbWS5IuEI1e8Cc8cqxCkNirWcQ3Bec9LPGOsc46alwSX9GKgwero3iEoT07HpB948j/gqT/98JbbFdJP9STZf4j9iToFiAHu1IdQnQ08Uji4Bf3o6lNeyO5DztwdUgJvyOyB1zQQrWGRgtql3S3O+yZA71s5Ga1NCsR8YEooA4YZ3sJSAQAXQiDcBeB59iiv/4G/9AuU4P2EfGRGFJZg8E4b2lK+LzTLMHbWNf0enet7a00ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IdDdV9EE8vhhsdwHG2ckpEEs/Q68mTyUnuY+Y8rJNxM=;
 b=NRKa2lUqZT/1wO4oFVrqet18QVDKLS7+d7g7x77D7h3zOwWbsvJMnNyQmGLQ8/R+3erYipchF8LTCLARs/jYvAbmqK7r6Y+KjX69toR524bumOUruxGaVFip2r05LmmGTvkWfMQZRE5xWGoFv9JqurMfhoz1SBnB6GI0cfs2OoJEly4boU4JylBfhN5K9tWdiQLeXoKAb6ZZ6xX5+8LtYanHyGPXbDTpUzjIf0d9faXf3DpWPI8ZRbWjroab8Bfc0JnUQLbJTQODoj6xV5Bfz7+jipytEpbTvrVGWiduN0invXl+P3hEx1xCGv6v+Nlzd9XeDfV25hyrGXbPmKDBFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IdDdV9EE8vhhsdwHG2ckpEEs/Q68mTyUnuY+Y8rJNxM=;
 b=y+TVP+bLA6Cg2BALT18+EvhPIDpfQIXGTBwb9ucJhZ8qynESKMhKr2EWYgryxSYqw0XSXutbTB5t2qiBQ3LEXeXDyJk1bQfvvLDnb4fHeKm66gPvJGSmrR2Q+8Z23dQMuOb/O9G3Sndgt27PUCHWGgzd7B7VrFyAdoAdZ5LHCss=
Received: from DS7PR03CA0135.namprd03.prod.outlook.com (2603:10b6:5:3b4::20)
 by BN8PR12MB3572.namprd12.prod.outlook.com (2603:10b6:408:47::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 11:22:43 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b4:cafe::81) by DS7PR03CA0135.outlook.office365.com
 (2603:10b6:5:3b4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 11:22:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 11:22:42 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:22:42 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15
 via Frontend Transport; Mon, 18 Oct 2021 06:22:38 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 09/13] ASoC: amd: add acp6x pdm driver pm ops
Date: Mon, 18 Oct 2021 16:50:40 +0530
Message-ID: <20211018112044.1705805-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
References: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d61ba91c-a214-44a9-e32b-08d992299a3f
X-MS-TrafficTypeDiagnostic: BN8PR12MB3572:
X-Microsoft-Antispam-PRVS: <BN8PR12MB357299C054256029F5216D3C97BC9@BN8PR12MB3572.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8hFAjV5Y0rKBvcswAUZJNdh7jX99b7Jr/ihy07uDj45PS/9nYMM/p+u4r9U3mEn8B2wFjouJfk/1ETysYU4PM/cCJu9/BQ7qAT1FL3mvOjKkygdPS/FxXyQHOQsoQb1omJbmb6vteyaIMmr3c8RGSD8EjEIKRKOGF5vzul5hEfaal9LRChvPlkHKVp/Wi78oSBUYlX6w6sZW3R5wy6qoAnjysBSA26lspnXwRg0ZB37RWR54WTGGqtKA9ySe7jTiV30lZyiJANShLjDlzP8GE1qxkrfTayydSUcCl6Ufi2mmX7QcYwNtwOrwbBElbC1RfHaoEFMpJZdKQqQI4NRzU2eJSY3hSpWnF7iF2esH72K8vaPrQjOskZ3sf//Kce5CVuNwU7M9UGgFfu2/hZWIIdXhOULJahpapx0SvgCL6YIqioxurphEV+Ap2p7X2LMjeHMtB9PWhQLXM2zTciw4aA+QsM/smGrwdEHd5VYKteHK7D9Ibvj/RwYjMNf86XwMWjsehywS1cVCt/KHGfNP/dVXU3d7llijhF+KZTngcrJXhCjGY7yw6rEb2La7Bo7pXCqk1PbEyJ+H4E0dP06Fr6CflBE1lxm5GPvUP3GvYU5eyEiMvbjGloshqm0GR4O7CjWOIMo5aKZN57qcsS8jpMUN/u4NvIH4xSVsnsL+QGMdGrmCsnZVsYdbZ1c4PABugSpXgegiWbCR3t35VR0NpiX7KkyfBPzMkqXQPPgLKnU+ZsKKpAPrk/FUJsdckCmVaKvOyA4UV+TLROBzXQBD/A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(83380400001)(36860700001)(81166007)(82310400003)(356005)(47076005)(26005)(1076003)(36756003)(2906002)(2616005)(86362001)(426003)(336012)(7696005)(8676002)(6666004)(8936002)(186003)(508600001)(5660300002)(316002)(110136005)(4326008)(70586007)(54906003)(70206006)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:22:42.7968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d61ba91c-a214-44a9-e32b-08d992299a3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3572
Cc: Sunil-kumar.Dommati@amd.com, mlimonci@amd.com, richgong@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>
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

Add acp6x pdm driver pm ops.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/yc/acp6x-pdm-dma.c | 57 ++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index dc7c7ea5ea1a..e604f4ea524f 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -12,6 +12,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
+#include <linux/pm_runtime.h>
 
 #include "acp6x.h"
 
@@ -373,13 +374,69 @@ static int acp6x_pdm_audio_probe(struct platform_device *pdev)
 
 		return -ENODEV;
 	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_allow(&pdev->dev);
 	return 0;
 }
 
+static int acp6x_pdm_audio_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+	return 0;
+}
+
+static int __maybe_unused acp6x_pdm_resume(struct device *dev)
+{
+	struct pdm_dev_data *adata;
+	struct snd_pcm_runtime *runtime;
+	struct pdm_stream_instance *rtd;
+	u32 period_bytes, buffer_len;
+
+	adata = dev_get_drvdata(dev);
+	if (adata->capture_stream && adata->capture_stream->runtime) {
+		runtime = adata->capture_stream->runtime;
+		rtd = runtime->private_data;
+		period_bytes = frames_to_bytes(runtime, runtime->period_size);
+		buffer_len = frames_to_bytes(runtime, runtime->buffer_size);
+		acp6x_config_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
+		acp6x_init_pdm_ring_buffer(PDM_MEM_WINDOW_START, buffer_len,
+					   period_bytes, adata->acp6x_base);
+	}
+	acp6x_enable_pdm_interrupts(adata->acp6x_base);
+	return 0;
+}
+
+static int __maybe_unused acp6x_pdm_suspend(struct device *dev)
+{
+	struct pdm_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	acp6x_disable_pdm_interrupts(adata->acp6x_base);
+	return 0;
+}
+
+static int __maybe_unused acp6x_pdm_runtime_resume(struct device *dev)
+{
+	struct pdm_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	acp6x_enable_pdm_interrupts(adata->acp6x_base);
+	return 0;
+}
+
+static const struct dev_pm_ops acp6x_pdm_pm_ops = {
+	SET_RUNTIME_PM_OPS(acp6x_pdm_suspend, acp6x_pdm_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(acp6x_pdm_suspend, acp6x_pdm_resume)
+};
+
 static struct platform_driver acp6x_pdm_dma_driver = {
 	.probe = acp6x_pdm_audio_probe,
+	.remove = acp6x_pdm_audio_remove,
 	.driver = {
 		.name = "acp_yc_pdm_dma",
+		.pm = &acp6x_pdm_pm_ops,
 	},
 };
 
-- 
2.25.1

