Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 809C1BF2BE
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2019 14:16:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F41811745;
	Thu, 26 Sep 2019 14:16:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F41811745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569500217;
	bh=bgq/YsCeXwwoX8IH6mqJkZCSZJWZ2d82KRGvd6y5OhY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L0NUgxucXiCpdWIhX4n7o0I1VCgVg/D2BVmfqTaSaYeGMZjDAXnlrGSNc4nZXlJbp
	 vUB9QY8OEhc3xayXh05+/tGRdjWJ21ffwmf43Xs9ZWyFLPnWAp3xU0rHUZ8070VXUk
	 iTXKYyGpByMiV82FQ5fqf9LDdKGAO7nSA1KL9GVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37ACBF802BD;
	Thu, 26 Sep 2019 14:15:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7C16F803F4; Thu, 26 Sep 2019 14:15:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750047.outbound.protection.outlook.com [40.107.75.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D535F80140
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 14:15:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D535F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="T026+s3E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwWISNINfAy5qseSNeah3l6eScgoYVv/90dWDPcShKV7RRGswObd4J/9rNI+f3Jpnio7MLqrhMJ1nh1JA6uWX6o99J1mGSc0ay46BBvYUAvwg5kAz0CLKgO84ZNGMVxgZZbgtMvr8VKmDkZVn/2yK5UNsvw+oN4aNSL+zvmDK6WjwE5boYt8dwpYBnH25U0hwDZiMQFlS0nED643ESw7Ajepg29VbHhqxXdhf6ByT7xhQoHrB56G6xnPTlUlP4Wm0+Qtd9NnNqF49xq5W1F6S0yEc1dpQHLwdFeLUUZF6DKijY+0IXvXaTNQrobZHF3YKhweGrOFURi+ReK/Il4vag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zu6BPbxMCYaxFZ4GKJqs+DNo5zuYElhJeQVzmZExJrk=;
 b=U+k4TwViUJeMWsacKrM6wcp/OIbao96mIWSK3L/s/JAkPV7/DsZq9L4kdLMV9EOAKLwhkUREq9e0T9xIlVI9CwlRbt3p0YV05BvQT6Zl6h3ZoxR/e30OIqnjt0/u0h9xh1Ar4twRR56UmYwjrOjoVRkl51iVP3XA9LMdyxaP27tFEgV7+LAvqgh4ELeXS1QQFxZCHcXYGWe/KiCBhRwGtPcaEBhg4yUfAn/ovII2YDERkJP5mlherRS9t7kNfkj+KX9UQ0qwnihNNOuF+oTyh/YVQyO48Qx9NORvkCoeeMd5giQoVv4G+poc4Uhsw4J9dW8zP1fRDgCT9n974/9avw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=canonical.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zu6BPbxMCYaxFZ4GKJqs+DNo5zuYElhJeQVzmZExJrk=;
 b=T026+s3EVyHkGVp9BbPsZ34Pi6HLDAEnGEn/OCN9ShTG2QtVHM3ZAHrdTfuMQIW5u+gsgp1+28y4XHkq6fH2D9xdwpZHHkZqKvZFj1Zunq4zHlPGyDZ32ZgBiJD9oIhLD4Hhi9akYXnxRmnG3oDsQlUwsbD0HK4jUmVyj+U/DQ8=
Received: from DM5PR12CA0007.namprd12.prod.outlook.com (2603:10b6:4:1::17) by
 MWHPR12MB1519.namprd12.prod.outlook.com (2603:10b6:301:d::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Thu, 26 Sep 2019 12:15:02 +0000
Received: from CO1NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::202) by DM5PR12CA0007.outlook.office365.com
 (2603:10b6:4:1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.16 via Frontend
 Transport; Thu, 26 Sep 2019 12:15:02 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; canonical.com; dkim=none (message not signed)
 header.d=none; canonical.com; dmarc=permerror action=none header.from=amd.com; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT026.mail.protection.outlook.com (10.152.80.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 26 Sep 2019 12:15:02 +0000
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Thu, 26 Sep 2019 07:15:01 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 27 Sep 2019 04:37:35 +0530
Message-ID: <1569539290-756-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(428003)(189003)(199004)(5660300002)(81166006)(305945005)(81156014)(8676002)(8936002)(109986005)(50226002)(2906002)(70206006)(4326008)(70586007)(486006)(47776003)(336012)(126002)(36756003)(426003)(478600001)(356004)(6666004)(53416004)(48376002)(19627235002)(476003)(2616005)(86362001)(16586007)(316002)(1671002)(26005)(51416003)(7696005)(54906003)(50466002)(186003)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1519; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 911b3319-8eff-4581-72c2-08d7427b2895
X-MS-TrafficTypeDiagnostic: MWHPR12MB1519:
X-Microsoft-Antispam-PRVS: <MWHPR12MB15199AF335C23D743C393C7AE7860@MWHPR12MB1519.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:24;
X-Forefront-PRVS: 0172F0EF77
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NvSagpV+KtTNSPMNwWME6pHr5xZhL76WqEGtUjIMaBaE74sZlHtR9L6BIWG2afdx7Jl9udYgUQBiABunkicV9wTqQn0t7thjAt+iC9TJ1aCtQYzX/tiDS8FpPKsl0Uhm8/FD4NDNIUErvQ0/BcVoWpX9BWqYMmdF1UQ5vBwDo1nKCt/D88wzxq/+H+90y1sGTBlcBOnazbISEWhNMoHkuCLwaukpj0c55o+yV3N7MTj6P45h566D3IkA+T89JV37Iqn4Fxpzm1Q01i6PCsyJIlm4K1nl+8SxSPplFLF35obIb0x95iLr0HrvlXao0NV4Hi84h1bRDfZH++KlnblW6k5tr2ZPB+7/XLOLLNEGdR0cm65O/rNSJn9txSS5P7FI7NcnPvIxBYfKnGScSnFSraIfZc4ko+ifp/gRdZ8HbUM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2019 12:15:02.2725 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 911b3319-8eff-4581-72c2-08d7427b2895
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1519
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Sanju R Mehta <sanju.mehta@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Colin Ian
 King <colin.king@canonical.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH 1/5] ASoC: amd: Registering device endpoints
	using MFD framework
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Removed platform based endpoint registering.
Now Registering DMA and multiple I2S BT playback
endpoint devices automatically by using MFD framework.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Reviewed-by: Vijendar Mukunda <vijendar.mukunda@amd.com>
---
 sound/soc/amd/raven/acp3x.h     |  54 ++++++++-------
 sound/soc/amd/raven/pci-acp3x.c | 148 +++++++++++++++++++++++++++++-----------
 2 files changed, 139 insertions(+), 63 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index 4f2cadd..3a27fc8 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -7,33 +7,41 @@
 
 #include "chip_offset_byte.h"
 
-#define ACP3x_PHY_BASE_ADDRESS 0x1240000
-#define	ACP3x_I2S_MODE	0
-#define	ACP3x_REG_START	0x1240000
-#define	ACP3x_REG_END	0x1250200
-#define I2S_MODE	0x04
-#define	BT_TX_THRESHOLD 26
-#define	BT_RX_THRESHOLD 25
-#define ACP3x_POWER_ON 0x00
-#define ACP3x_POWER_ON_IN_PROGRESS 0x01
-#define ACP3x_POWER_OFF 0x02
-#define ACP3x_POWER_OFF_IN_PROGRESS 0x03
+#define ACP3x_DEVS		3
+#define ACP3x_PHY_BASE_ADDRESS	0x1240000
+#define	ACP3x_I2S_MODE		0
+#define	ACP3x_REG_START		0x1240000
+#define	ACP3x_REG_END		0x1250200
+#define ACP3x_I2STDM_REG_START	0x1242400
+#define ACP3x_I2STDM_REG_END	0x1242410
+#define ACP3x_BT_TDM_REG_START	0x1242800
+#define ACP3x_BT_TDM_REG_END	0x1242810
+#define I2S_MODE		0x04
+#define	I2S_RX_THRESHOLD	27
+#define	I2S_TX_THRESHOLD	28
+#define	BT_TX_THRESHOLD		26
+#define	BT_RX_THRESHOLD		25
+#define ACP_ERR_INTR_MASK	29
+#define ACP3x_POWER_ON		0x00
+#define ACP3x_POWER_ON_IN_PROGRESS	0x01
+#define ACP3x_POWER_OFF			0x02
+#define ACP3x_POWER_OFF_IN_PROGRESS	0x03
 #define ACP3x_SOFT_RESET__SoftResetAudDone_MASK	0x00010001
 
 #define ACP_SRAM_PTE_OFFSET	0x02050000
-#define PAGE_SIZE_4K_ENABLE 0x2
+#define PAGE_SIZE_4K_ENABLE	0x2
 #define MEM_WINDOW_START	0x4000000
-#define PLAYBACK_FIFO_ADDR_OFFSET 0x400
-#define CAPTURE_FIFO_ADDR_OFFSET  0x500
-
-#define PLAYBACK_MIN_NUM_PERIODS    2
-#define PLAYBACK_MAX_NUM_PERIODS    8
-#define PLAYBACK_MAX_PERIOD_SIZE    16384
-#define PLAYBACK_MIN_PERIOD_SIZE    4096
-#define CAPTURE_MIN_NUM_PERIODS     2
-#define CAPTURE_MAX_NUM_PERIODS     8
-#define CAPTURE_MAX_PERIOD_SIZE     16384
-#define CAPTURE_MIN_PERIOD_SIZE     4096
+#define PLAYBACK_FIFO_ADDR_OFFSET	0x400
+#define CAPTURE_FIFO_ADDR_OFFSET	0x500
+
+#define PLAYBACK_MIN_NUM_PERIODS	2
+#define PLAYBACK_MAX_NUM_PERIODS	8
+#define PLAYBACK_MAX_PERIOD_SIZE	16384
+#define PLAYBACK_MIN_PERIOD_SIZE	4096
+#define CAPTURE_MIN_NUM_PERIODS		2
+#define CAPTURE_MAX_NUM_PERIODS		8
+#define CAPTURE_MAX_PERIOD_SIZE		16384
+#define CAPTURE_MIN_PERIOD_SIZE		4096
 
 #define MAX_BUFFER (PLAYBACK_MAX_PERIOD_SIZE * PLAYBACK_MAX_NUM_PERIODS)
 #define MIN_BUFFER MAX_BUFFER
diff --git a/sound/soc/amd/raven/pci-acp3x.c b/sound/soc/amd/raven/pci-acp3x.c
index facec24..c0b8fad 100644
--- a/sound/soc/amd/raven/pci-acp3x.c
+++ b/sound/soc/amd/raven/pci-acp3x.c
@@ -9,23 +9,49 @@
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
+#include <linux/mfd/core.h>
+#include <linux/pm_runtime.h>
+#include <sound/pcm.h>
 
 #include "acp3x.h"
 
+struct i2s_platform_data {
+	unsigned int cap;
+	int channel;
+	u32 snd_rates;
+};
 struct acp3x_dev_data {
+	struct device *parent;
+	struct mfd_cell *cell;
+	struct resource *res;
 	void __iomem *acp3x_base;
 	bool acp3x_audio_mode;
-	struct resource *res;
 	struct platform_device *pdev;
 };
 
+
+static struct device *get_mfd_cell_dev(const char *device_name, int r)
+{
+	char auto_dev_name[25];
+	struct device *dev;
+
+	snprintf(auto_dev_name, sizeof(auto_dev_name),
+		 "%s.%d.auto", device_name, r);
+	dev = bus_find_device_by_name(&platform_bus_type,
+					NULL, auto_dev_name);
+	dev_info(dev, "device %s added\n", auto_dev_name);
+	return dev;
+}
+
 static int snd_acp3x_probe(struct pci_dev *pci,
 			   const struct pci_device_id *pci_id)
 {
 	int ret;
-	u32 addr, val;
+	uint64_t addr;
+	int val, i, r;
 	struct acp3x_dev_data *adata;
-	struct platform_device_info pdevinfo;
+	struct device *dev;
+	struct i2s_platform_data *i2s_pdata;
 	unsigned int irqflags;
 
 	if (pci_enable_device(pci)) {
@@ -63,47 +89,82 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	}
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
-
+	adata->parent = &pci->dev;
 	val = rv_readl(adata->acp3x_base + mmACP_I2S_PIN_CONFIG);
 	switch (val) {
 	case I2S_MODE:
 		adata->res = devm_kzalloc(&pci->dev,
-					  sizeof(struct resource) * 2,
-					  GFP_KERNEL);
-		if (!adata->res) {
+				sizeof(struct resource) * 4,
+						GFP_KERNEL);
+		adata->cell = devm_kzalloc(&pci->dev,
+				sizeof(struct mfd_cell) * 3,
+						GFP_KERNEL);
+		if (!adata->cell) {
 			ret = -ENOMEM;
 			goto unmap_mmio;
 		}
 
-		adata->res[0].name = "acp3x_i2s_iomem";
-		adata->res[0].flags = IORESOURCE_MEM;
-		adata->res[0].start = addr;
-		adata->res[0].end = addr + (ACP3x_REG_END - ACP3x_REG_START);
-
-		adata->res[1].name = "acp3x_i2s_irq";
-		adata->res[1].flags = IORESOURCE_IRQ;
-		adata->res[1].start = pci->irq;
-		adata->res[1].end = pci->irq;
-
-		adata->acp3x_audio_mode = ACP3x_I2S_MODE;
-
-		memset(&pdevinfo, 0, sizeof(pdevinfo));
-		pdevinfo.name = "acp3x_rv_i2s";
-		pdevinfo.id = 0;
-		pdevinfo.parent = &pci->dev;
-		pdevinfo.num_res = 2;
-		pdevinfo.res = adata->res;
-		pdevinfo.data = &irqflags;
-		pdevinfo.size_data = sizeof(irqflags);
-
-		adata->pdev = platform_device_register_full(&pdevinfo);
-		if (IS_ERR(adata->pdev)) {
-			dev_err(&pci->dev, "cannot register %s device\n",
-				pdevinfo.name);
-			ret = PTR_ERR(adata->pdev);
-			goto unmap_mmio;
+		i2s_pdata = devm_kzalloc(&pci->dev,
+				sizeof(struct i2s_platform_data) * 3,
+						GFP_KERNEL);
+		if (i2s_pdata == NULL) {
+			kfree(adata->res);
+			kfree(adata->cell);
+			return -ENOMEM;
 		}
+		adata->res[0].name	= "acp3x_i2s_iomem";
+		adata->res[0].flags	= IORESOURCE_MEM;
+		adata->res[0].start	= addr;
+		adata->res[0].end	= addr +
+			(ACP3x_REG_END - ACP3x_REG_START);
+		i2s_pdata[0].cap	= 0;
+		i2s_pdata[0].snd_rates	= SNDRV_PCM_RATE_8000_96000;
+
+		adata->res[1].name	= "acp3x_i2s_sp_play_cap";
+		adata->res[1].flags	= IORESOURCE_MEM;
+		adata->res[1].start	= addr + ACP3x_I2STDM_REG_START;
+		adata->res[1].end	= addr + ACP3x_I2STDM_REG_END;
+		i2s_pdata[1].cap	= 0;
+		i2s_pdata[1].snd_rates	= SNDRV_PCM_RATE_8000_96000;
+
+		adata->res[2].name	= "acp3x_i2s_bt_play_cap";
+		adata->res[2].flags	= IORESOURCE_MEM;
+		adata->res[2].start	= addr + ACP3x_BT_TDM_REG_START;
+		adata->res[2].end	= addr + ACP3x_BT_TDM_REG_END;
+		i2s_pdata[2].cap	= 0;
+		i2s_pdata[2].snd_rates	= SNDRV_PCM_RATE_8000_96000;
+
+		adata->res[3].name	= "acp3x_i2s_irq";
+		adata->res[3].flags	= IORESOURCE_IRQ;
+		adata->res[3].start	= pci->irq;
+		adata->res[3].end	= adata->res[3].start;
+
+		adata->acp3x_audio_mode	= ACP3x_I2S_MODE;
+
+		adata->cell[0].name	=	"acp3x_rv_i2s_dma";
+		adata->cell[0].num_resources	= 4;
+		adata->cell[0].resources	= &adata->res[0];
+		adata->cell[0].platform_data	= &irqflags;
+		adata->cell[0].pdata_size	= sizeof(irqflags);
+
+		adata->cell[1].name		= "acp3x_i2s_playcap";
+		adata->cell[1].num_resources	= 1;
+		adata->cell[1].resources	= &adata->res[1];
+		adata->cell[1].platform_data	= &i2s_pdata[0];
+		adata->cell[1].pdata_size	=
+				sizeof(struct i2s_platform_data);
+
+		adata->cell[2].name		= "acp3x_i2s_playcap";
+		adata->cell[2].num_resources	= 1;
+		adata->cell[2].resources	= &adata->res[2];
+		adata->cell[2].platform_data	= &i2s_pdata[1];
+		adata->cell[2].pdata_size	=
+				sizeof(struct i2s_platform_data);
+		r = mfd_add_hotplug_devices(adata->parent, adata->cell,	3);
+		for (i = 0; i < 3 ; i++)
+			dev = get_mfd_cell_dev(adata->cell[i].name, i);
 		break;
+
 	default:
 		dev_err(&pci->dev, "Invalid ACP audio mode : %d\n", val);
 		ret = -ENODEV;
@@ -112,23 +173,29 @@ static int snd_acp3x_probe(struct pci_dev *pci,
 	return 0;
 
 unmap_mmio:
-	pci_disable_msi(pci);
+	mfd_remove_devices(adata->parent);
+	kfree(adata->res);
+	kfree(adata->cell);
 	iounmap(adata->acp3x_base);
+	/*ignore device status and return driver probe error*/
+	return -ENODEV;
 release_regions:
 	pci_release_regions(pci);
+	/*ignore device status and return driver probe error*/
+	return -ENODEV;
 disable_pci:
 	pci_disable_device(pci);
-
-	return ret;
+	/*ignore device status and return driver probe error*/
+	return -ENODEV;
 }
 
 static void snd_acp3x_remove(struct pci_dev *pci)
 {
 	struct acp3x_dev_data *adata = pci_get_drvdata(pci);
-
-	platform_device_unregister(adata->pdev);
+	mfd_remove_devices(adata->parent);
+	kfree(adata->res);
+	kfree(adata->cell);
 	iounmap(adata->acp3x_base);
-
 	pci_disable_msi(pci);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
@@ -151,6 +218,7 @@ static struct pci_driver acp3x_driver  = {
 
 module_pci_driver(acp3x_driver);
 
+MODULE_AUTHOR("Vishnuvardhanrao.Ravulapati@amd.com");
 MODULE_AUTHOR("Maruthi.Bayyavarapu@amd.com");
 MODULE_DESCRIPTION("AMD ACP3x PCI driver");
 MODULE_LICENSE("GPL v2");
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
