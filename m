Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEC61CE75B
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 23:23:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6398165F;
	Mon, 11 May 2020 23:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6398165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589232185;
	bh=ROwtKVd8GbeikVXqx9Pl525jmsKE4NJeFJ+2Ruxs6BU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=myND+Tqr72TKbF7zcrTJlXSpiP+u21uYS9OoAqCuEWLG13kN0DY9VdLM5j4dwp8EI
	 fF6kpbA9MOIhCs1yD1RolrfKm+uBHRsYW21+2JktycQlitw9PsvO2RiDKWzrgtoQcs
	 kGlmFMcuf0CHfIsAypLPx+Z5zHpQHMmt4yZMH+34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EE59F802A0;
	Mon, 11 May 2020 23:20:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C179AF80292; Mon, 11 May 2020 23:20:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A74BF80157
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:20:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A74BF80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QrSE7gCs"
Received: by mail-qt1-x842.google.com with SMTP id p12so9308554qtn.13
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C5T0qnI2z1bxkyAKqDn4v988108KSakkB8A7lVyq4P8=;
 b=QrSE7gCs90mt9VFno+ftBbYs70rzyYbVdkX1SaiVna7xegJF0VlLEGSafY1aF2whk/
 +BepdMonNiAcXmG10V3+uGDE7B3iOX7kXiJGfsV9Ate5lLYSlmy7/3hZ8yKKJoZNycLI
 JGqx+m8MDd/8mQ9rmXIUyUJKaE5FlWF32wQKzqnnte6d3DLhxdwf9ldeYL2DZyPSfPqt
 NpRffutQ2CVPoD9x5oC5sUqC+4Z2VnOGpbsmnbsD5SrbUz9wUbYtDdT7bWL4Po8tW6cc
 1e+FegFeQ09mBdibUv6hZpZTMoClbdW55AjvBr0lvxKeTCMy0TxlpZEEG2hY3tLzgiHJ
 KWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C5T0qnI2z1bxkyAKqDn4v988108KSakkB8A7lVyq4P8=;
 b=YaXFMZUQ/KlVW9Ahxcq/z/QytREhkHVEikOj1S4PeBFCF7NRO/aNJKaDoxEU/mYqKX
 wukvVbrEIFLnTa0vNJriVAPyipNQByRwlklMH97+8YE1dbf8KYKP/3+gDgdyQ5fWsLsE
 pv/WDomGJUygVMpFzoGg78hgZf+jKyV2/dSFdlJUjGOtLgH8DTI2/M+Ommb7b9rwQK6I
 6h6C6wrn0rl4Qps+ZtVdMjqyySDdl9nPUdiTgk3bQtrIjT+oLqM9FBnI+lHz0eGzEGQw
 s42dL1f14xzeoBBGoi+sVjeudtzLiBOn8eSjMi183RKdimKKc+5aA8Im66vxcDcGW6OI
 dEDg==
X-Gm-Message-State: AGi0PuYi4gCLvh6v/3GJqliuyY0TH4lagg+AvjMNsSQCRyo8AV9o5geE
 XrwPHXKtKbJZ4xQSkg/It9cH63YZ
X-Google-Smtp-Source: APiQypLPMen8dn7ZUWzcA4M2eyVEy7TrJU364jxGE0CjNjpntI1h+3dMcsTNWFUxTUQfnoa+Eoo1Rw==
X-Received: by 2002:ac8:3383:: with SMTP id c3mr18520786qtb.220.1589232025779; 
 Mon, 11 May 2020 14:20:25 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id c26sm9148691qkm.98.2020.05.11.14.20.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:20:25 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH v2 02/14] ASoC: amd: add Renoir ACP PCI driver
Date: Mon, 11 May 2020 17:20:02 -0400
Message-Id: <20200511212014.2359225-3-alexander.deucher@amd.com>
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

ACP is a PCI audio device.
This patch adds PCI driver to bind to this device and get
PCI resources.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 87 +++++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h     | 21 +++++++
 2 files changed, 108 insertions(+)
 create mode 100644 sound/soc/amd/renoir/rn-pci-acp3x.c
 create mode 100644 sound/soc/amd/renoir/rn_acp3x.h

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
new file mode 100644
index 000000000000..56b76e355cd4
--- /dev/null
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// AMD Renoir ACP PCI Driver
+//
+//Copyright 2020 Advanced Micro Devices, Inc.
+
+#include <linux/pci.h>
+#include <linux/module.h>
+#include <linux/io.h>
+
+#include "rn_acp3x.h"
+
+struct acp_dev_data {
+	void __iomem *acp_base;
+};
+
+static int snd_rn_acp_probe(struct pci_dev *pci,
+			    const struct pci_device_id *pci_id)
+{
+	struct acp_dev_data *adata;
+	int ret;
+	u32 addr;
+
+	if (pci_enable_device(pci)) {
+		dev_err(&pci->dev, "pci_enable_device failed\n");
+		return -ENODEV;
+	}
+
+	ret = pci_request_regions(pci, "AMD ACP3x audio");
+	if (ret < 0) {
+		dev_err(&pci->dev, "pci_request_regions failed\n");
+		goto disable_pci;
+	}
+
+	adata = devm_kzalloc(&pci->dev, sizeof(struct acp_dev_data),
+			     GFP_KERNEL);
+	if (!adata) {
+		ret = -ENOMEM;
+		goto release_regions;
+	}
+
+	addr = pci_resource_start(pci, 0);
+	adata->acp_base = devm_ioremap(&pci->dev, addr,
+				       pci_resource_len(pci, 0));
+	if (!adata->acp_base) {
+		ret = -ENOMEM;
+		goto release_regions;
+	}
+	pci_set_master(pci);
+	pci_set_drvdata(pci, adata);
+	return 0;
+
+release_regions:
+	pci_release_regions(pci);
+disable_pci:
+	pci_disable_device(pci);
+
+	return ret;
+}
+
+static void snd_rn_acp_remove(struct pci_dev *pci)
+{
+	pci_disable_msi(pci);
+	pci_release_regions(pci);
+	pci_disable_device(pci);
+}
+
+static const struct pci_device_id snd_rn_acp_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, ACP_DEVICE_ID),
+	.class = PCI_CLASS_MULTIMEDIA_OTHER << 8,
+	.class_mask = 0xffffff },
+	{ 0, },
+};
+MODULE_DEVICE_TABLE(pci, snd_rn_acp_ids);
+
+static struct pci_driver rn_acp_driver  = {
+	.name = KBUILD_MODNAME,
+	.id_table = snd_rn_acp_ids,
+	.probe = snd_rn_acp_probe,
+	.remove = snd_rn_acp_remove,
+};
+
+module_pci_driver(rn_acp_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("AMD ACP Renoir PCI driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
new file mode 100644
index 000000000000..da5715759646
--- /dev/null
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * AMD ALSA SoC PDM Driver
+ *
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ */
+
+#include "rn_chip_offset_byte.h"
+
+#define ACP_PHY_BASE_ADDRESS 0x1240000
+#define ACP_DEVICE_ID 0x15E2
+
+static inline u32 rn_readl(void __iomem *base_addr)
+{
+	return readl(base_addr - ACP_PHY_BASE_ADDRESS);
+}
+
+static inline void rn_writel(u32 val, void __iomem *base_addr)
+{
+	writel(val, base_addr - ACP_PHY_BASE_ADDRESS);
+}
-- 
2.25.4

