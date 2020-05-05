Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE0B1C627D
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 22:57:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D0211752;
	Tue,  5 May 2020 22:57:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D0211752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588712276;
	bh=ROwtKVd8GbeikVXqx9Pl525jmsKE4NJeFJ+2Ruxs6BU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nBV8QxZLJNlJwDuhfeI6Pl5SfDIPqtanJNJVlZ1LiQh3JUrOkrdRCvPJvytgon+AB
	 erAqwQPit23wICygDrO/6jQfzJhhLw/jUNaMu8Le56uRX0D/7/VNyngvx5xGDndjuU
	 C2zq9fLo91IPvW000g7NEoLF2rz5qYJzccygke3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3A63F802C3;
	Tue,  5 May 2020 22:54:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB6D5F8029A; Tue,  5 May 2020 22:53:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68D5AF8023E
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 22:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68D5AF8023E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QnGyxC9u"
Received: by mail-qk1-x742.google.com with SMTP id i14so3852927qka.10
 for <alsa-devel@alsa-project.org>; Tue, 05 May 2020 13:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C5T0qnI2z1bxkyAKqDn4v988108KSakkB8A7lVyq4P8=;
 b=QnGyxC9uiCD0tIaTiONrl8OeD6O+Mput3i3edRa7KHMq849ygAY9AXb5wcA44ZjCqY
 3wpC/iYDAl+pasTa/0NlSkPSTGAXHK0Sa5KRRiKmqHc+1DhG+876PwKuffxpsh2d2nQk
 2uucjG9FmMwAyfvRMeIRslQVWelkxh8Q6jX9IOu5oyA5PDePwyRZ+pgGjQPTOs89yCyX
 8PdU9maahZ6DUkLrEVGuiI//QXtI6MV/WfmzZaGnukTPzmPMwRbyqW9Y0qGvF1PpRS/V
 yCZeEUVaBPEcAMUZBQVy6+PAt/F/cGRTwRpFvzc4jldK0ywnAaMNkOf/UDGm4VMNavaz
 encA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C5T0qnI2z1bxkyAKqDn4v988108KSakkB8A7lVyq4P8=;
 b=nGdncqFqd/ScjCf4Uc6qFtOMp2k2SA0NH1CKZ4m29j6tJGUH0OLjR1Z9FfotoKJPzH
 psGP9I3pwZ9KYjj2DwHdBwxU7Uj1+B530W7IoSciTMrINRTaKofrFF9Ti5qe0XaBL/JQ
 X1vdNM2QLiPwWx/3xaGZ61+DVEvmD5KiLg9AKYkj5BDW8zD+RO9M8la2L6ta+U7QkjIr
 89dT7w/N5AUENLAczqAvwcqjCL/A+hMH/eLPz/HsYdbeoCfUQcZsWZw56Ro1QmsgxNd9
 CzGE+AFjVTPq3oUgShM7udGYGmc9Vthqen9BoH13mdZmSNphV/frWcENWCC/m9uNDzw0
 9WAg==
X-Gm-Message-State: AGi0Pub21z6ysdLiO0QPtWbuqHzvUOpqYhqt0MySAmyRlAQq/bEEMDMN
 vRd1JdHZQrBwJ8UnNeqnwQOzCdGG
X-Google-Smtp-Source: APiQypKISeZgnreud0ex0oWep3TO/0xHGCRsSLGfAp0IpWZDWyNBw0iNbIrTxNOFHdunQ2XmbftGPw==
X-Received: by 2002:a37:b5c3:: with SMTP id e186mr5300792qkf.158.1588712018172; 
 Tue, 05 May 2020 13:53:38 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id k58sm2972513qtf.40.2020.05.05.13.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 13:53:37 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH 02/14] ASoC: amd: add Renoir ACP PCI driver
Date: Tue,  5 May 2020 16:53:15 -0400
Message-Id: <20200505205327.642282-3-alexander.deucher@amd.com>
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

