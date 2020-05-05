Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4EC1C6287
	for <lists+alsa-devel@lfdr.de>; Tue,  5 May 2020 23:00:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FE7B175E;
	Tue,  5 May 2020 22:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FE7B175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588712410;
	bh=uAw0IC0NI4YQDcxcsx1GJMYIumgNax7o1qnQmEvzo44=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZetiVb0akWmTmRUb0Gs54cHYGP2WQA0nwld/0dJCzlF8RXZxj1U4DnwUpkT74BLXl
	 X5aFj10wQYwwMGV2TB9ruenroUOJH54utSUzHD7svWSXy47MG5IkHaVE/Z8BkkQXqq
	 OSc57zlOWmi4w7NnfspzHtrHHoNNnxkY5VFB8zcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36692F802E9;
	Tue,  5 May 2020 22:54:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BD74F80299; Tue,  5 May 2020 22:53:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F673F800AD
 for <alsa-devel@alsa-project.org>; Tue,  5 May 2020 22:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F673F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fiGiCC9H"
Received: by mail-qt1-x841.google.com with SMTP id x12so3257853qts.9
 for <alsa-devel@alsa-project.org>; Tue, 05 May 2020 13:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lp7ePWWo4Ff5Ikft81MmFAIS+tmYW04Gkmb1noWm56M=;
 b=fiGiCC9HJvpPa2ByWV6t9Z5TT0X1vckrrmPzsmdZeGqNiTmW7tjxTRIbrrvPGhIEyb
 pkUE7HWJYLeHn1IOmUA/c9HiR3wTeQbHpKK+PIVwgp2jl2SqJxXYbtHjX86Ck3sHdlkg
 0VOjMbQZ2GfJGdt7yHfCXn6PlLj41L7c/cDzEVfAss5bfOMiJgqKy1B4JzDVOJ9Oz/W7
 VgR9g8ONPIscqyF0LXNj4wYbDwnVDjqC3Tj4GOoKcCHvcWqkFNMDC/+URopva+qMJoqb
 xMn1ev3Eh0/LF8LKr5CFzv5J2Nbe671hjUVTAQuS85jYhF3FSUflPvx1oQGhyvRvjkkA
 nOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lp7ePWWo4Ff5Ikft81MmFAIS+tmYW04Gkmb1noWm56M=;
 b=Lq/aOWjlM7M/GtdXdPINGVkx71vfYHBYJgN7+oCldQhBwMQJTGN9ikbWBRuUZ9HTp8
 B6m0tuy7AHwsVUbvD7HUeQlWFtqw+NE8+rMmpyE854l/hG1P15bnCelNryYlRzNlt90/
 JI7rjHqWJwdkb8nCq0NMs6H+C2f9NiVWayLVgDH25N3s1ohbnnWQidnp6XZQr1Zskj+4
 quj3gW09dEA6uE7PdK8zlpMZ3TeMd+KF3Rlp98uJGKnHQIGAVzYtzq0Wx/gwkA+FBbfB
 eAZ0Zr9P3sSK+j0S4+sN2uEibZUMeM0Us2p4NmA5nfmuKuxnYN2sRc9rs7gdysQgMV8V
 P8tA==
X-Gm-Message-State: AGi0PuYVBEFxF03bBWzBJgzZFtlMM6vL72P1wadTnvQaxjo72BI+LcBo
 6yLj3n7tiUG+7l02YzNfyXWyon/i
X-Google-Smtp-Source: APiQypJh23yHgt4aOKKEVWKJPUe2IXjw73ex+4OivZ2kqlFovVk97c79Si/ZZMDoxMq/K1ssc/3j3g==
X-Received: by 2002:ac8:2f2a:: with SMTP id j39mr4888255qta.295.1588712028290; 
 Tue, 05 May 2020 13:53:48 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id k58sm2972513qtf.40.2020.05.05.13.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 13:53:47 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, vijendar.mukunda@amd.com,
 tiwai@suse.de
Subject: [PATCH 09/14] ASoC: amd: add Renoir ACP PCI driver PM ops
Date: Tue,  5 May 2020 16:53:22 -0400
Message-Id: <20200505205327.642282-10-alexander.deucher@amd.com>
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

Add Renoir ACP Pci driver pm ops.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/soc/amd/renoir/rn-pci-acp3x.c | 48 +++++++++++++++++++++++++++++
 sound/soc/amd/renoir/rn_acp3x.h     |  2 ++
 2 files changed, 50 insertions(+)

diff --git a/sound/soc/amd/renoir/rn-pci-acp3x.c b/sound/soc/amd/renoir/rn-pci-acp3x.c
index 362409ef0d85..6d013a1bffa6 100644
--- a/sound/soc/amd/renoir/rn-pci-acp3x.c
+++ b/sound/soc/amd/renoir/rn-pci-acp3x.c
@@ -10,6 +10,7 @@
 #include <linux/delay.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
 
 #include "rn_acp3x.h"
 
@@ -233,6 +234,12 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 		ret = PTR_ERR(adata->pdev);
 		goto unregister_devs;
 	}
+	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&pci->dev);
+	pm_runtime_set_active(&pci->dev);
+	pm_runtime_put_noidle(&pci->dev);
+	pm_runtime_enable(&pci->dev);
+	pm_runtime_allow(&pci->dev);
 	return 0;
 
 unregister_devs:
@@ -250,6 +257,42 @@ static int snd_rn_acp_probe(struct pci_dev *pci,
 	return ret;
 }
 
+static int snd_rn_acp_suspend(struct device *dev)
+{
+	int ret;
+	struct acp_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	ret = rn_acp_deinit(adata->acp_base);
+	if (ret)
+		dev_err(dev, "ACP de-init failed\n");
+	else
+		dev_dbg(dev, "ACP de-initialized\n");
+
+	return 0;
+}
+
+static int snd_rn_acp_resume(struct device *dev)
+{
+	int ret;
+	struct acp_dev_data *adata;
+
+	adata = dev_get_drvdata(dev);
+	ret = rn_acp_init(adata->acp_base);
+	if (ret) {
+		dev_err(dev, "ACP init failed\n");
+		return ret;
+	}
+	return 0;
+}
+
+static const struct dev_pm_ops rn_acp_pm = {
+	.runtime_suspend = snd_rn_acp_suspend,
+	.runtime_resume =  snd_rn_acp_resume,
+	.suspend = snd_rn_acp_suspend,
+	.resume =	snd_rn_acp_resume,
+};
+
 static void snd_rn_acp_remove(struct pci_dev *pci)
 {
 	struct acp_dev_data *adata;
@@ -260,6 +303,8 @@ static void snd_rn_acp_remove(struct pci_dev *pci)
 	ret = rn_acp_deinit(adata->acp_base);
 	if (ret)
 		dev_err(&pci->dev, "ACP de-init failed\n");
+	pm_runtime_disable(&pci->dev);
+	pm_runtime_get_noresume(&pci->dev);
 	pci_disable_msi(pci);
 	pci_release_regions(pci);
 	pci_disable_device(pci);
@@ -278,6 +323,9 @@ static struct pci_driver rn_acp_driver  = {
 	.id_table = snd_rn_acp_ids,
 	.probe = snd_rn_acp_probe,
 	.remove = snd_rn_acp_remove,
+	.driver = {
+		.pm = &rn_acp_pm,
+	}
 };
 
 module_pci_driver(rn_acp_driver);
diff --git a/sound/soc/amd/renoir/rn_acp3x.h b/sound/soc/amd/renoir/rn_acp3x.h
index f63e232565af..f24a4da8c721 100644
--- a/sound/soc/amd/renoir/rn_acp3x.h
+++ b/sound/soc/amd/renoir/rn_acp3x.h
@@ -38,6 +38,8 @@
 #define ACP_PDM_DISABLE 0x00
 #define ACP_PDM_DMA_EN_STATUS 0x02
 #define TWO_CH 0x02
+/* time in ms for runtime suspend delay */
+#define ACP_SUSPEND_DELAY_MS	2000
 
 #define ACP_SRAM_PTE_OFFSET	0x02050000
 #define PAGE_SIZE_4K_ENABLE     0x2
-- 
2.25.4

