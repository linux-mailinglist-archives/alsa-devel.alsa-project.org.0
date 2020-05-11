Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E131CE765
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 23:25:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB17C886;
	Mon, 11 May 2020 23:25:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB17C886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589232350;
	bh=OSMlVxAeryZGIvN2omNkzs9oDfXv8KrWHR0t4CCKJ2A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dJ/2/Dz1T6qm/JULrkpv3ENphAXrY+3FU9u9V/+VY5r7ooLXQogHzUPGyO5dgYE3T
	 c67y5HzM2561/M+GFzgwhlipLB37gXfmEe+i6j4u6gRvMmTM6FqI6nIRw4LgQnzYJi
	 x9q32sT0I3IuYKoAXoLe4hPbznpBvXu54dCpuC8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FE7DF802E7;
	Mon, 11 May 2020 23:21:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C661F8029B; Mon, 11 May 2020 23:20:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45263F80107
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45263F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ta2fSc9c"
Received: by mail-qk1-x742.google.com with SMTP id a136so2508439qkg.6
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jr4QKPl9zswNTG8ncCPUGYjlDOVxBACl8jNl7qI7o7A=;
 b=Ta2fSc9cnAOHmJoTui8PQO3j8lFEE9o5Fqum8mUsuIDSI4Wlxd6cD3KEYcSBSbWvOI
 S4+HK1DxBX1J30zuZ6Fr1z+uIleEMYzFlxeNolQaXi6W2Hrtv/UuwYwD9b96SYOT1hzd
 cdHYAd0J3Yk2WpK7xEo1xB4foi+OSZFRbi+gGOKTnCUHSwH/VMMS+CdU4VKRsiT4fRPi
 OLL+Xujz8QvAl5YA+eIQk8PSp5baiA3HSaWCCk9UPoQSDFk4Yke1IdsYhSvYNAD1ivAK
 61RQMrsNKk+mVoeeS0IHwZHb66shVhfbBx/Lg5em/DlFyc7fgGpwjoX872dW2DVep1q8
 2P0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jr4QKPl9zswNTG8ncCPUGYjlDOVxBACl8jNl7qI7o7A=;
 b=CUtZPNurscwlaRYPkVqrqy14a6Wz+0414vgOaFLE+vjHob8ZGB6Lq24wP18fwHoPZq
 cSnCH5AI7lb1KKqvIHDmquwAchjS2A66X2tu/AOVJNypB8GdmNEOUqmv5fhbTShN6HVr
 wRoDmv4TfD/CSdxSv0/8fTXiELM3VgHSy6RZHyPp2oD+0EdlnwFsQORQUrvaFEaadXOr
 VGXDvG4x2qcUdAEk1sG8ikyfCxxj0w3Uu3zf0hb7w083hxIzi4PI54O7U7UrmKocpvy0
 AjoZSwOHr5GiyHhedhw0Q+Qxxr6/IPkhK2aMgeVZ2vOF4aQVb1aUvnNyxYzqo1yUUcWV
 tpfQ==
X-Gm-Message-State: AGi0PuZQXixg0U65V9cZappsBkCJtXsH6o4pdUW1g/Pf9bJEEax1NdoO
 M/0j3OPifjtQejFehndUAwAgm4vK
X-Google-Smtp-Source: APiQypJ4GDGLtlHLI47yYOTlJyKPSpQoubIUGdDUFCnm4TaQU651X3jmeepFZeLbHVLI9E+5CNf3GQ==
X-Received: by 2002:a05:620a:16d6:: with SMTP id
 a22mr16976483qkn.291.1589232028432; 
 Mon, 11 May 2020 14:20:28 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id c26sm9148691qkm.98.2020.05.11.14.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:20:27 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH v2 04/14] ASoC: amd: create acp3x pdm platform device
Date: Mon, 11 May 2020 17:20:04 -0400
Message-Id: <20200511212014.2359225-5-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200511212014.2359225-1-alexander.deucher@amd.com>
References: <20200511212014.2359225-1-alexander.deucher@amd.com>
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

