Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 757BC1D8001
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:23:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44C4B1762;
	Mon, 18 May 2020 19:22:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44C4B1762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589822589;
	bh=zn0xuLs8EO7I3rBGHtUBfuOXUsdHVwSyJ7vOP8Tw+W8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lme+dYY5LBdu+FU/F05RSqrFiap56Qui280w9aXxB5ctYzKAIrZg/l0tWNVjjuU7G
	 5WXYJUyw1R0Q7s00OS4i1ajrYEkqBQ1z+dCEg6sjf9jFC086kVLrg1Jcn/xAWENjZP
	 O3D1+Hitac6CuHOfv4bGrf97fzBVA3sfSSS8LhQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED1D7F802F8;
	Mon, 18 May 2020 19:17:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55760F802C4; Mon, 18 May 2020 19:17:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85F77F8028E
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85F77F8028E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="OfsmWyOM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Umv7zFVyoBY8XXjA74w4Fm9AVXFT8vVAenLk1xUfIJaYnYcQE01V17noa93dXCIKTqVyh4XkxWZezulTOf/wZLFU1ti1MYUbWjUQIMAEJxkYD23tD+BGpT1PVUio1G1T43yP9miprpEPxZmiD7+e2yRJL1AX+rEU+i8MFClhnyCjgMwAFrS6NyLReYfTi5fKH7MVKGqzcLPJwYCvDmIGK/vf6JwtilocJGrwqSiRXCbW07IktGNKW0xndy6MLFLBlpNgZOKAmvzd0pRviSLr30R7xdkiz6dBO8ncbyJEaxeOvjjvTUQZihj8M4NXxS28bdHOhGXxEl8pHFdELsFxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDx0l9pCMLeKGZeE0SzLc14hGmJUgqOzutzu8OZ2Vlg=;
 b=EgE0QZlpTbJJrWZoeAV6XPtuFILholka/Mcy+bCPK6/oNoD2zmtuZWok5HDLLjVM+k915Rqm7hO+pnxQWzApm918+kydXhJv06USu05YTAIcMxUzXpwwPUOEvNNbMkg81TJz0qd9CO5OZ4vxrkWC/UmKE52urLO3XsZcGGblWXa9H7qx/ct7KKRf2wSRpA2D4mjqMuiF6sEicdABgPxUh+VdhjIn/S/asSKb0SD7upmDuukxi/vVO/nObT+6EvgLE6uC63i1lVE0/PG9IBAQWVHZDT51RM5R1DWCdMI28KSucu26y0DnimrCy7C3vf/5AAzV0l7tEWtRwa5jzro9kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDx0l9pCMLeKGZeE0SzLc14hGmJUgqOzutzu8OZ2Vlg=;
 b=OfsmWyOMwezm4WWbT6fgilLJtizXZOCtBgPzSjOuUNU3kMKaY/bvL21SbrrmVR9uW0giZIQaQSxxKWruyNYBymdCCI/ALiak0WgZ+NimyOJ9XxQ/mKgZffnYBEuZZIbw3eooVsr2oVLf5h1MjRla5LjHgPCWNOnSnRr2FSlf0TQ=
Received: from CO2PR06CA0073.namprd06.prod.outlook.com (2603:10b6:104:3::31)
 by MW2PR12MB2553.namprd12.prod.outlook.com (2603:10b6:907:9::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Mon, 18 May
 2020 17:17:20 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:3:cafe::ad) by CO2PR06CA0073.outlook.office365.com
 (2603:10b6:104:3::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26 via Frontend
 Transport; Mon, 18 May 2020 17:17:20 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 17:17:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:18 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:18 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 18 May 2020 12:17:16 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH v3 06/14] ASoC: amd: irq handler changes for ACP3x PDM dma
 driver
Date: Tue, 19 May 2020 01:16:56 +0800
Message-ID: <20200518171704.24999-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(36756003)(1076003)(4326008)(6666004)(26005)(356005)(81166007)(478600001)(2906002)(5660300002)(186003)(82310400002)(2616005)(70586007)(336012)(8676002)(8936002)(82740400003)(70206006)(7696005)(86362001)(54906003)(316002)(426003)(110136005)(47076004)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd230883-262c-4108-847e-08d7fb4f51e3
X-MS-TrafficTypeDiagnostic: MW2PR12MB2553:
X-Microsoft-Antispam-PRVS: <MW2PR12MB25531E9A7824B4866A21EB4497B80@MW2PR12MB2553.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KFT1qtAJep74FK1QWQxsPjIeNytF0fPodt1Vug5jTM1ctP9PpcH1U/CSHXhoIg+lwKW2PvawM/tD9qkKwJd8mumYHpFp6agzjEIfUeZ0LUGUuhlX95G8Z2ikLLYZEMRwHEIX67ZOiWKF7vs/355uTiuxC9JtNw/0P8RbxLlMHR5IS/RSeWZtaVJ/TiHMOhkCWyDEgxmPJB7ef+lhtUuu2NMe6ipuYr1tHUM8v+pg/PLQzT8g4EYKCDPwOk9Ou1pjBsx1mMJCrGjc6cZ5hDRqdfOwb7FJWXB/vKoL+VRik0U3vfN//277XXbAfuZDngy4S2o9EULMmKXCgr+1PjZqDBF2kn5G4bg+qWwny9NX2oTSL6s736V7QRgrLYopzX9YIR0rR3e2fC91CWxSWBWvhrV2vQW+Fg9WPmDrsU+gg8WYxv3hFlvecDQ8hppHqJatBENWTz7d/aEd3hj5OvxbGEzLEzFh+8ZFLPLwod5PV09q4belt8jJJOhyUN6u6j6nEx5IQbu6p0luXaFJGwHqSzBKRR/1y1eT6nRROKmp140=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 17:17:18.9338 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd230883-262c-4108-847e-08d7fb4f51e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2553
Cc: Alexander.Deucher@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Whenever audio data equal to the PDM watermark level
are consumed, interrupt is generated.
Acknowledge the interrupt.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/renoir/acp3x-pdm-dma.c | 38 ++++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h      |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index 1dda8cf2edd2..fdac2c1e3acd 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -16,6 +16,31 @@
 
 #define DRV_NAME "acp_rn_pdm_dma"
 
+static irqreturn_t pdm_irq_handler(int irq, void *dev_id)
+{
+	struct pdm_dev_data *rn_pdm_data;
+	u16 cap_flag;
+	u32 val;
+
+	rn_pdm_data = dev_id;
+	if (!rn_pdm_data)
+		return IRQ_NONE;
+
+	cap_flag = 0;
+	val = rn_readl(rn_pdm_data->acp_base + ACP_EXTERNAL_INTR_STAT);
+	if ((val & BIT(PDM_DMA_STAT)) && rn_pdm_data->capture_stream) {
+		rn_writel(BIT(PDM_DMA_STAT), rn_pdm_data->acp_base +
+			  ACP_EXTERNAL_INTR_STAT);
+		snd_pcm_period_elapsed(rn_pdm_data->capture_stream);
+		cap_flag = 1;
+	}
+
+	if (cap_flag)
+		return IRQ_HANDLED;
+	else
+		return IRQ_NONE;
+}
+
 static struct snd_soc_dai_driver acp_pdm_dai_driver = {
 	.capture = {
 		.rates = SNDRV_PCM_RATE_48000,
@@ -60,6 +85,13 @@ static int acp_pdm_audio_probe(struct platform_device *pdev)
 	if (!adata->acp_base)
 		return -ENOMEM;
 
+	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
+		return -ENODEV;
+	}
+
+	adata->pdm_irq = res->start;
 	adata->capture_stream = NULL;
 
 	dev_set_drvdata(&pdev->dev, adata);
@@ -71,6 +103,12 @@ static int acp_pdm_audio_probe(struct platform_device *pdev)
 
 		return -ENODEV;
 	}
+	status = devm_request_irq(&pdev->dev, adata->pdm_irq, pdm_irq_handler,
+				  irqflags, "ACP_PDM_IRQ", adata);
+	if (status) {
+		dev_err(&pdev->dev, "ACP PDM IRQ request failed\n");
+		return -ENODEV;
+	}
 	return 0;
 }
 
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index 0b450882c6c4..1ad8a7845fda 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -28,8 +28,10 @@
 
 #define ACP_ERROR_MASK 0x20000000
 #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
+#define PDM_DMA_STAT 0x10
 
 struct pdm_dev_data {
+	u32 pdm_irq;
 	void __iomem *acp_base;
 	struct snd_pcm_substream *capture_stream;
 };
-- 
2.26.2

