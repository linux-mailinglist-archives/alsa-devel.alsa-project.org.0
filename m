Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE40431732
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 13:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6D571921;
	Mon, 18 Oct 2021 13:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6D571921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634556309;
	bh=l+2t951ozm65cQmfensLaeGzAOSXcV8rapMMbHMgUxo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mjZGIDZiv3Wnpy2vjtWoiyU3AzOKHkp9+zcgs8f5Jykz9vDng8A0Ke+KmlSZaBoj7
	 KcuQ3m80RI4yqHj1JyGJ9XONPWpLjSRgVYkNKpxKOtkbOTg8D3lLTHRtZXZM9b32fO
	 usGKP5uRHnqvpRgenGQxOS8XTFSnqHRnAB7FhFqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02852F802DF;
	Mon, 18 Oct 2021 13:22:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF21FF80253; Mon, 18 Oct 2021 13:22:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADD0BF80525
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 13:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADD0BF80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="xUYWBBjF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFzghLAV60AtdThQpWU8K1cIkzKCg06bC9YdbcHz7iEP3P8NqBIVdDSAD6rluHOFhjEBq2yKlJp6dbi2unXdVQOLddSdOPfmKR4dZ7G0/sqK41zkHrxWyDhrh8rD+C8O2wEwyUlHYv7jVItdVQNBuG2rZz0D9ZyZkjdxo8rjgMGahwzcoxMFEqQu+wUQWQKo41+K86rcNpT9vX11ntoGexKQLwNzJqQRMv8IElk9uK327//H152EIFOT2tdB3vjhCbUxtuOLD21bkCsEOUikpLd17zn9FiIt+AKHTBiSsltvwHDGIVnWAkiSY4pyRTg1q89xqKMPAATMNTFpdZ8PFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzJfg565ecP0jDdDySUtWKxq0NCNezY47QMNuN8FyQI=;
 b=UgamHvCqsFhOauMvesylRvZ4qDmrF/vBx4AP/oBU7Gdcj9F6uH6YmgTulBuHaqnCt2aPsT0YaVJhpIq/fdy9DGjxKH4IAIb1SPYpAh2uhukTmNVvql5RjYmYGAGXenNXju9im3/6mU6jngjtGK6qK+KSeD6MwB1TRPtykuinrFB+up8qIuqgScKiHqBYzn3Z25zYwOH/6RrG2bEfTGyRDxnOzHpigL+PiUMFAxt16IgXwkH+pRBgXtscN7YShTa/pqUAzIONH7ETgHdYUx+F7ioVWJTkOThqPbzo/PqCJjoLOyOQtMzGCZ4N9lKNODqIcrPYowNupZi9XxMqbstGjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzJfg565ecP0jDdDySUtWKxq0NCNezY47QMNuN8FyQI=;
 b=xUYWBBjFljRUcRVLQyAS7rCH1LPljHNuJKLu0sK96JMUXOyuK14jTouwPmaYEOj7C3wsgxmkGgt61+zlZdXR4/1+HbNxDMzJfqBu3EHCMF+4/CivchlvY8R2rzRcrUnf2BhPgpQAyIPxDdTvE7Ea89K65Xkmt+LXufpmdTieFHk=
Received: from DM6PR13CA0049.namprd13.prod.outlook.com (2603:10b6:5:134::26)
 by MW3PR12MB4523.namprd12.prod.outlook.com (2603:10b6:303:5b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 11:22:20 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::38) by DM6PR13CA0049.outlook.office365.com
 (2603:10b6:5:134::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Mon, 18 Oct 2021 11:22:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 11:22:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:22:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 18 Oct
 2021 06:22:18 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2308.15
 via Frontend Transport; Mon, 18 Oct 2021 06:22:15 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH V2 06/13] ASoC: amd: add acp6x irq handler
Date: Mon, 18 Oct 2021 16:50:37 +0530
Message-ID: <20211018112044.1705805-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
References: <20211018112044.1705805-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea3ec45f-51f5-476a-4c3a-08d992298ca2
X-MS-TrafficTypeDiagnostic: MW3PR12MB4523:
X-Microsoft-Antispam-PRVS: <MW3PR12MB45230056F547FA8DAC38B84E97BC9@MW3PR12MB4523.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m3jlQQVwJWx+xpI1OzccPDhqhJOCacVIemsrwoQL/IfgzmaZR4+JQ7cQrPK8dV0tkA1Pro8MK4ZLjHEgct/fKAl5y+ZjWzhGaDvccuNg8Z4x/btVNRmuz+684uqWTcsoGN4PADgIG6R8gAL6O5v4CAgsKwuOZJfADG/hNhEyW3oSbiXlQtSYU5ZY4bUq7PlvqyFjUCsexHaLt8BKuaH5tzCG97D4ei+/vx7qfOt7knWjMeUsXpIK0O0gP4IQ8vo62A6zj8AyuW0PcejAQO9IOt1XpKL75vxhtPuxiTHfAOv0QlUqri754ZXTUn90riwNUhLY7XZw4momZuq+eZ+zgGPJp36AjhtPzKoOxLYLllbCfqOOdTsWG9WBcsLSsF3Lmvis9FyLZQNdJ9qWums6TT6mavDseWWHLgb5UVCSi5f6brDgdPa5QFupJ9Tc2nnyiffxnmtN40Tgq4Xq1aT51bdtUgSwPA1q6pSyesDSmS6/aRcDfgUPZRSkXtS8/fyr3nsu1oFxY1eIkEPO+ogx0XteyIOuP+fXcvMPkhivqJOkUw1xCE9Xfq+k8J6bwz7GIj7ZSi+lfTjjl+ffVm/PowhYvy0H/sCR6qSLge95O/h+ZxUVUfjZW128SEsuLSXbW7oas7hZQ9KqTqzltutuxBIFNI1epDzLELJdExWjjr9uH3NsZlKLIzbS7k6PTs/XZ3eG9X4A9FzR4KQCh7dXOcAyfZAZmfBjIpk3HP0HEI7o5RIRFG98Iqd3ECCW71wKPcNPHW4YOlDFqVdou36+xA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36756003)(47076005)(82310400003)(186003)(110136005)(8676002)(26005)(508600001)(7696005)(5660300002)(316002)(83380400001)(70586007)(2906002)(2616005)(1076003)(70206006)(54906003)(8936002)(356005)(336012)(86362001)(36860700001)(6666004)(426003)(81166007)(4326008)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:22:19.9597 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3ec45f-51f5-476a-4c3a-08d992298ca2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4523
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

Add ACP6x irq handler for handling irq events for ACP IP.
Add pdm irq events handling.
Whenever audio data equal to the PDM watermark level are consumed,
interrupt is generated. Acknowledge the interrupt.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/yc/acp6x.h     |  2 ++
 sound/soc/amd/yc/pci-acp6x.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x.h b/sound/soc/amd/yc/acp6x.h
index d6b2c70ce9c8..4ea37794db84 100644
--- a/sound/soc/amd/yc/acp6x.h
+++ b/sound/soc/amd/yc/acp6x.h
@@ -25,6 +25,7 @@
 
 #define ACP_ERROR_MASK 0x20000000
 #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
+#define PDM_DMA_STAT 0x10
 
 enum acp_config {
 	ACP_CONFIG_0 = 0,
@@ -46,6 +47,7 @@ enum acp_config {
 };
 
 struct pdm_dev_data {
+	u32 pdm_irq;
 	void __iomem *acp6x_base;
 	struct snd_pcm_substream *capture_stream;
 };
diff --git a/sound/soc/amd/yc/pci-acp6x.c b/sound/soc/amd/yc/pci-acp6x.c
index bb66b4c670cd..baf875c603fa 100644
--- a/sound/soc/amd/yc/pci-acp6x.c
+++ b/sound/soc/amd/yc/pci-acp6x.c
@@ -10,6 +10,8 @@
 #include <linux/io.h>
 #include <linux/delay.h>
 #include <linux/platform_device.h>
+#include <linux/interrupt.h>
+#include <sound/pcm_params.h>
 
 #include "acp6x.h"
 
@@ -117,6 +119,27 @@ static int acp6x_deinit(void __iomem *acp_base)
 	return 0;
 }
 
+static irqreturn_t acp6x_irq_handler(int irq, void *dev_id)
+{
+	struct acp6x_dev_data *adata;
+	struct pdm_dev_data *yc_pdm_data;
+	u32 val;
+
+	adata = dev_id;
+	if (!adata)
+		return IRQ_NONE;
+
+	val = acp6x_readl(adata->acp6x_base + ACP_EXTERNAL_INTR_STAT);
+	if (val & BIT(PDM_DMA_STAT)) {
+		yc_pdm_data = dev_get_drvdata(&adata->pdev[0]->dev);
+		acp6x_writel(BIT(PDM_DMA_STAT), adata->acp6x_base + ACP_EXTERNAL_INTR_STAT);
+		if (yc_pdm_data->capture_stream)
+			snd_pcm_period_elapsed(yc_pdm_data->capture_stream);
+		return IRQ_HANDLED;
+	}
+	return IRQ_NONE;
+}
+
 static int snd_acp6x_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
@@ -125,7 +148,9 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 	int ret, index;
 	int val = 0x00;
 	u32 addr;
+	unsigned int irqflags;
 
+	irqflags = IRQF_SHARED;
 	/* Yellow Carp device check */
 	if (pci->revision != 0x60)
 		return -ENODEV;
@@ -209,6 +234,12 @@ static int snd_acp6x_probe(struct pci_dev *pci,
 		}
 		break;
 	}
+	ret = devm_request_irq(&pci->dev, pci->irq, acp6x_irq_handler,
+			       irqflags, "ACP_PCI_IRQ", adata);
+	if (ret) {
+		dev_err(&pci->dev, "ACP PCI IRQ request failed\n");
+		goto unregister_devs;
+	}
 	return 0;
 unregister_devs:
 	for (--index; index >= 0; index--)
-- 
2.25.1

