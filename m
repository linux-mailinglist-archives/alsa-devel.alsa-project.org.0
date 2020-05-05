Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 537751C6285
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 22:59:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2C47175A;
	Tue,  5 May 2020 22:58:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2C47175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588712377;
	bh=OSMlVxAeryZGIvN2omNkzs9oDfXv8KrWHR0t4CCKJ2A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MP99QFAqmG7TFThBWSDe/71ZMU693iEOY0OZcCqBpcH+1OUwz8InNme6UUKpd96j6
	 kEFVD2sZFDNFI/4X0aBgmgb8zEI3FE9ykyTgymvnY8Tg6mo5kWpRExryP6v+upYrFV
	 ZUFPhoB37h93sZ9N3mUvroItbk6pOxAEzQrlatPs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37059F802E2;
	Tue,  5 May 2020 22:54:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9548F8029A; Tue,  5 May 2020 22:53:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 551B6F80162
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 22:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 551B6F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Eg7oMUJk"
Received: by mail-qk1-x741.google.com with SMTP id b6so3856890qkh.11
 for <alsa-devel@alsa-project.org>; Tue, 05 May 2020 13:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jr4QKPl9zswNTG8ncCPUGYjlDOVxBACl8jNl7qI7o7A=;
 b=Eg7oMUJkmOS80qkb0s6wvmW9SbZpO2agses9laYBZiVC6b06Bj7rFe6ciN9v5Dzphc
 A2QXEWhELNxrrzj66FS4DvaW8IB6gAAyX8Uk/QF5hjRXVscA4Ac3gVEHCxRtfa+rfdX8
 FPf7IMMX9V/bQiPVcYZcjjO88LCDfT6PPc5RzfVWFhKTc3ylOcBtPlCIU31iRhssalcL
 xtZ8avoMzUwJmYgdMXJbh5hP7btJZ2j1PMqJIcTSct26ddyQ2L1Ua7tHRGVclUFOpe7+
 9/T7ZVexe7+GdGxHyE1dd4N7x3u8QZiH4CZ4aw7m7XIuwWnN+DzIVAzB/n5fEEDyVXdf
 yhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jr4QKPl9zswNTG8ncCPUGYjlDOVxBACl8jNl7qI7o7A=;
 b=HjHx7SXzHfwddDz0hyNQcCLhor4XG7TJkwo0ZziFiENiC3ssWpkDlU3tnxaeJ3/zbk
 PmPe4CGUA4EKmlU4IH8exq4uKyHFeOiONOKbV+ZU+InNQAlG/3SWrjxHPTtylcPxYws2
 tCJ4f1l+4fSA+J0UiC7xS4mVjkaiHYY0/RrF6OtJAUci7gpt8cVmprUIsMVsMKYucdis
 rImoJeqROb8p1b78R6S4J30+B9eWvC92GurjXL+aKIF1tFy31jlPhKT/RVQ/PweRkzJ+
 rHj84Xtsa20l9g8asP5EJbjw8+ky/LnqFA70QKGboeB+QRpvsjzYfIM7ZeaxISAxuyRa
 pxgg==
X-Gm-Message-State: AGi0PuYYW0bYjYkVtM5NhSd165DPg7ruKtobYa8mR6qIXVd+oQ+CUGjM
 V1dW5t09t5d+Wm3CRGfytWyGfud8
X-Google-Smtp-Source: APiQypI3u73n+0GTv8KJI4oULQCncn26MGuZOLS4JkGRkbTAuG3l6JqZ070zswgxQpp/lUfPo7FrFQ==
X-Received: by 2002:a37:bd81:: with SMTP id n123mr5383148qkf.57.1588712020823; 
 Tue, 05 May 2020 13:53:40 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id k58sm2972513qtf.40.2020.05.05.13.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 13:53:40 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH 04/14] ASoC: amd: create acp3x pdm platform device
Date: Tue,  5 May 2020 16:53:17 -0400
Message-Id: <20200505205327.642282-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200505205327.642282-1-alexander.deucher@amd.com>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

ACP 3x IP has PDM decoder as one of IP blocks.
Create a platform device for it, so that the PDM platform driver
can be bound to this device.
Pass PCI resources like MMIO, irq to this platform device.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 61 ++++++++++++++++++++++++++++-
 sound/soc/amd/renoir/rn_acp3x.h     |  3 ++
 2 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 429813f6ba1c..362409ef0d85 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -8,6 +8,8 @@
 #include <linux/module.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
 
 #include "rn_acp3x.h"
 
@@ -17,6 +19,8 @@ MODULE_PARM_DESC(acp_power_gating, "Enable acp power gating");
 
 struct acp_dev_data {
 	void __iomem *acp_base;
+	struct resource *res;
+	struct platform_device *pdev;
 };
 
 static int rn_acp_power_on(void __iomem *acp_base)
@@ -151,6 +155,8 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 			    const struct pci_device_id *pci_id)
 {
 	struct acp_dev_data *adata;
+	struct platform_device_info pdevinfo;
+	unsigned int irqflags;
 	int ret;
 	u32 addr;
 
@@ -172,20 +178,70 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 		goto release_regions;
 	}
 
+	/* check for msi interrupt support */
+	ret = pci_enable_msi(pci);
+	if (ret)
+		/* msi is not enabled */
+		irqflags = IRQF_SHARED;
+	else
+		/* msi is enabled */
+		irqflags = 0;
+
 	addr = pci_resource_start(pci, 0);
 	adata->acp_base = devm_ioremap(&pci->dev, addr,
 				       pci_resource_len(pci, 0));
 	if (!adata->acp_base) {
 		ret = -ENOMEM;
-		goto release_regions;
+		goto disable_msi;
 	}
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
 	ret = rn_acp_init(adata->acp_base);
 	if (ret)
-		goto release_regions;
+		goto disable_msi;
+
+	adata->res = devm_kzalloc(&pci->dev,
+				  sizeof(struct resource) * 2,
+				  GFP_KERNEL);
+	if (!adata->res) {
+		ret = -ENOMEM;
+		goto de_init;
+	}
+
+	adata->res[0].name = "acp_pdm_iomem";
+	adata->res[0].flags = IORESOURCE_MEM;
+	adata->res[0].start = addr;
+	adata->res[0].end = addr + (ACP_REG_END - ACP_REG_START);
+	adata->res[1].name = "acp_pdm_irq";
+	adata->res[1].flags = IORESOURCE_IRQ;
+	adata->res[1].start = pci->irq;
+	adata->res[1].end = pci->irq;
+
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+	pdevinfo.name = "acp_rn_pdm_dma";
+	pdevinfo.id = 0;
+	pdevinfo.parent = &pci->dev;
+	pdevinfo.num_res = 2;
+	pdevinfo.res = adata->res;
+	pdevinfo.data = &irqflags;
+	pdevinfo.size_data = sizeof(irqflags);
+
+	adata->pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(adata->pdev)) {
+		dev_err(&pci->dev, "cannot register %s device\n",
+			pdevinfo.name);
+		ret = PTR_ERR(adata->pdev);
+		goto unregister_devs;
+	}
 	return 0;
 
+unregister_devs:
+	platform_device_unregister(adata->pdev);
+de_init:
+	if (rn_acp_deinit(adata->acp_base))
+		dev_err(&pci->dev, "ACP de-init failed\n");
+disable_msi:
+	pci_disable_msi(pci);
 release_regions:
 	pci_release_regions(pci);
 disable_pci:
@@ -200,6 +256,7 @@ static void snd_rn_acp_remove(struct pci_dev *pci)
 	int ret;
 
 	adata = pci_get_drvdata(pci);
+	platform_device_unregister(adata->pdev);
 	ret = rn_acp_deinit(adata->acp_base);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index ec2a85085163..5e4fd99397d5 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -8,6 +8,9 @@
 #include "rn_chip_offset_byte.h"
 
 #define ACP_PHY_BASE_ADDRESS 0x1240000
+#define	ACP_REG_START	0x1240000
+#define	ACP_REG_END	0x1250200
+
 #define ACP_DEVICE_ID 0x15E2
 #define ACP_POWER_ON 0x00
 #define ACP_POWER_ON_IN_PROGRESS 0x01
-- 
2.25.4

