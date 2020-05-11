Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2899A1CE75E
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 23:24:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C73EB166B;
	Mon, 11 May 2020 23:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C73EB166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589232243;
	bh=0EYbdopYj6alxs/Dfd4us8F1i/ks4MyrmgyUM/6xaxY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YKMhMAfN56qlyeHcad3y091FrUaUKD+kIOPhEQik9AqMYGfWQOnWAPNFgez59C9qa
	 HODfsSNj7lGT55L0azN6ZwrOdioMuAZOMkNmQscCiIvU2Nhk1juiR603STmSITK1Vs
	 O1licBfnVyq3x4V7UbPot1+rkD67M+FNh/4dgjo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8623CF802A2;
	Mon, 11 May 2020 23:20:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 607BAF802A0; Mon, 11 May 2020 23:20:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4534FF801F2
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 23:20:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4534FF801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bmTlDGNW"
Received: by mail-qk1-x743.google.com with SMTP id c64so11436293qkf.12
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 14:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vrfbre8KV9oiNRLUqxXtQBOjfj6UL9MsuDVhs+DbU3E=;
 b=bmTlDGNWrEQ2U7M4t07zCzRiQwjyR1f30zjTHvhLKzA4LdbrgH0AFPRXj/0J1bNLSP
 d1WfSriAXSQlIUH5CVZX0ny9ftP14tJ0PXVpp6sOFTDgm+LRGG11xt+Z3o4mc2eYHqip
 2tg0LfRg4SMWbudTF7LyCeoi4R19tL2dK+YQ7Mq58nEUqvMPygffklOjVaadTOCBNKAy
 l8pSJEQe8CF76pEcuSSyGEheXVSWSt3oa4cunO3xtPz3i9QTyOkjZNMI2mqB5LJRi7Qu
 5fAt2xJoMYsSGDAUecAAgIG0EjHl8+5drsHU4pBsqIWpPn2MmS/jb+WukhmPwG8Muzpk
 28fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vrfbre8KV9oiNRLUqxXtQBOjfj6UL9MsuDVhs+DbU3E=;
 b=Fwkm16OJufajajwDgZrD75aZSr6YAMxzT5vvCGjMwqqgTVJuJeFZ9Dk7XEuvJHNq/S
 UPw7hXyt000ZxbceoaA/rrKV4WwjFwo6bjS8p0w+kT+h9zuZVS7WBdFf/vAk8OPpWP1+
 lOc/DGxvGfNKiRR+QZ5oIuw3tYgytFPJnQoPZbfmOar3fDSgF7rMkFeYp41AOZ5n7eJJ
 Dzs6CloOyhXjRVGyQ2iq8JioAwKBitI/dBbX8rWOUM4mZ140VM8UtLhADfagA0vgpXmq
 gtsxfJvVW/lQyBqRSqxPOexN0uh8eYoFb1ev/vr2RuaKC3Dm7HkCxpKxGr7IOXvFFf3b
 vk1A==
X-Gm-Message-State: AOAM533izAtPRoGZa9GoSxNGq4PxS+jVItqXFDLwhOjgPkGdXfPIh9nE
 7ZeZ662H06csKCftY4S7mdZVvqlI
X-Google-Smtp-Source: ABdhPJxm2raXlDDr5pcAaZN9BzWEz2ubOCDp6RAIILSAMsl6tGG0dOazKiP5uwW3ye6CbTw4+j4B3A==
X-Received: by 2002:a37:628a:: with SMTP id w132mr3864309qkb.294.1589232027210; 
 Mon, 11 May 2020 14:20:27 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id c26sm9148691qkm.98.2020.05.11.14.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 14:20:26 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH v2 03/14] ASoC: amd: add acp init/de-init functions
Date: Mon, 11 May 2020 17:20:03 -0400
Message-Id: <20200511212014.2359225-4-alexander.deucher@amd.com>
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

Add Renoir ACP PCI driver init/deinit functions.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 143 ++++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h     |  16 ++++
 2 files changed, 159 insertions(+)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 56b76e355cd4..429813f6ba1c 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -7,13 +7,146 @@
 #include <linux/pci.h>
 #include <linux/module.h>
 #include <linux/io.h>
+#include <linux/delay.h>
 
 #include "rn_acp3x.h"
 
+static int acp_power_gating;
+module_param(acp_power_gating, int, 0644);
+MODULE_PARM_DESC(acp_power_gating, "Enable acp power gating");
+
 struct acp_dev_data {
 	void __iomem *acp_base;
 };
 
+static int rn_acp_power_on(void __iomem *acp_base)
+{
+	u32 val;
+	int timeout;
+
+	val = rn_readl(acp_base + ACP_PGFSM_STATUS);
+
+	if (val == 0)
+		return val;
+
+	if ((val & ACP_PGFSM_STATUS_MASK) !=
+				ACP_POWER_ON_IN_PROGRESS)
+		rn_writel(ACP_PGFSM_CNTL_POWER_ON_MASK,
+			  acp_base + ACP_PGFSM_CONTROL);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = rn_readl(acp_base + ACP_PGFSM_STATUS);
+		if (!val)
+			return 0;
+		udelay(1);
+	}
+	return -ETIMEDOUT;
+}
+
+static int rn_acp_power_off(void __iomem *acp_base)
+{
+	u32 val;
+	int timeout;
+
+	rn_writel(ACP_PGFSM_CNTL_POWER_OFF_MASK,
+		  acp_base + ACP_PGFSM_CONTROL);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = rn_readl(acp_base + ACP_PGFSM_STATUS);
+		if ((val & ACP_PGFSM_STATUS_MASK) == ACP_POWERED_OFF)
+			return 0;
+		udelay(1);
+	}
+	return -ETIMEDOUT;
+}
+
+static int rn_acp_reset(void __iomem *acp_base)
+{
+	u32 val;
+	int timeout;
+
+	rn_writel(1, acp_base + ACP_SOFT_RESET);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = rn_readl(acp_base + ACP_SOFT_RESET);
+		if (val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK)
+			break;
+		cpu_relax();
+	}
+	rn_writel(0, acp_base + ACP_SOFT_RESET);
+	timeout = 0;
+	while (++timeout < 500) {
+		val = rn_readl(acp_base + ACP_SOFT_RESET);
+		if (!val)
+			return 0;
+		cpu_relax();
+	}
+	return -ETIMEDOUT;
+}
+
+static void rn_acp_enable_interrupts(void __iomem *acp_base)
+{
+	u32 ext_intr_ctrl;
+
+	rn_writel(0x01, acp_base + ACP_EXTERNAL_INTR_ENB);
+	ext_intr_ctrl = rn_readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
+	ext_intr_ctrl |= ACP_ERROR_MASK;
+	rn_writel(ext_intr_ctrl, acp_base + ACP_EXTERNAL_INTR_CNTL);
+}
+
+static void rn_acp_disable_interrupts(void __iomem *acp_base)
+{
+	rn_writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp_base +
+		  ACP_EXTERNAL_INTR_STAT);
+	rn_writel(0x00, acp_base + ACP_EXTERNAL_INTR_ENB);
+}
+
+static int rn_acp_init(void __iomem *acp_base)
+{
+	int ret;
+
+	/* power on */
+	ret = rn_acp_power_on(acp_base);
+	if (ret) {
+		pr_err("ACP power on failed\n");
+		return ret;
+	}
+	rn_writel(0x01, acp_base + ACP_CONTROL);
+	/* Reset */
+	ret = rn_acp_reset(acp_base);
+	if (ret) {
+		pr_err("ACP reset failed\n");
+		return ret;
+	}
+	rn_writel(0x03, acp_base + ACP_CLKMUX_SEL);
+	rn_acp_enable_interrupts(acp_base);
+	return 0;
+}
+
+static int rn_acp_deinit(void __iomem *acp_base)
+{
+	int ret;
+
+	rn_acp_disable_interrupts(acp_base);
+	/* Reset */
+	ret = rn_acp_reset(acp_base);
+	if (ret) {
+		pr_err("ACP reset failed\n");
+		return ret;
+	}
+	rn_writel(0x00, acp_base + ACP_CLKMUX_SEL);
+	rn_writel(0x00, acp_base + ACP_CONTROL);
+	/* power off */
+	if (acp_power_gating) {
+		ret = rn_acp_power_off(acp_base);
+		if (ret) {
+			pr_err("ACP power off failed\n");
+			return ret;
+		}
+	}
+	return 0;
+}
+
 static int snd_rn_acp_probe(struct pci_dev *pci,
 			    const struct pci_device_id *pci_id)
 {
@@ -48,6 +181,9 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 	}
 	pci_set_master(pci);
 	pci_set_drvdata(pci, adata);
+	ret = rn_acp_init(adata->acp_base);
+	if (ret)
+		goto release_regions;
 	return 0;
 
 release_regions:
@@ -60,6 +196,13 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 
 static void snd_rn_acp_remove(struct pci_dev *pci)
 {
+	struct acp_dev_data *adata;
+	int ret;
+
+	adata = pci_get_drvdata(pci);
+	ret = rn_acp_deinit(adata->acp_base);
+	if (ret)
+		dev_err(&pci->dev, "ACP de-init failed\n");
 	pci_disable_msi(pci);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index da5715759646..ec2a85085163 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -9,6 +9,22 @@
 
 #define ACP_PHY_BASE_ADDRESS 0x1240000
 #define ACP_DEVICE_ID 0x15E2
+#define ACP_POWER_ON 0x00
+#define ACP_POWER_ON_IN_PROGRESS 0x01
+#define ACP_POWER_OFF 0x02
+#define ACP_POWER_OFF_IN_PROGRESS 0x03
+#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
+
+#define ACP_PGFSM_CNTL_POWER_ON_MASK    0x01
+#define ACP_PGFSM_CNTL_POWER_OFF_MASK   0x00
+#define ACP_PGFSM_STATUS_MASK           0x03
+#define ACP_POWERED_ON                  0x00
+#define ACP_POWER_ON_IN_PROGRESS        0x01
+#define ACP_POWERED_OFF                 0x02
+#define ACP_POWER_OFF_IN_PROGRESS       0x03
+
+#define ACP_ERROR_MASK 0x20000000
+#define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
 
 static inline u32 rn_readl(void __iomem *base_addr)
 {
-- 
2.25.4

