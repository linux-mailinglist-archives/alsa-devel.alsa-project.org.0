Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7972F2FBA
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 14:01:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78E981720;
	Tue, 12 Jan 2021 14:00:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78E981720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610456466;
	bh=mRMTNIjb3rF7gdibI515Rx9WhGRO+QKnRbTP5NwnX1M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EQ4/C0tyzDqi0PPKJPNa8HQzll8iUlozd7YtgEuRbU25wRV+QQIh6TooJrcpzx5Ep
	 rxHT95v5qWqr6kjX2syh33Y+FOEPCOESuMeTusQ2akezsDpCpFx7rsj7b8+ieh3+HN
	 6oM3r5aLn5Q7uBEwql92NWA5Fj1btQn5RvpBfyEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A83CF800EB;
	Tue, 12 Jan 2021 13:59:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E81CF804AB; Tue, 12 Jan 2021 13:59:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CCD5F804AB
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 13:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CCD5F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="H368JGk7"
Received: by mail-lf1-x134.google.com with SMTP id u25so3246332lfc.2
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 04:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lg8D+6k5px/5X05zXz+RxGeDF297I8gzkoxsJjGQbFo=;
 b=H368JGk7iitiesfWx27XMaxrW3JztEyAntacKIDIzEvx4fBR2dR3M9bQ4t3j5plvCF
 G3euq9OBw5FVVxBx5VeX8I5FjyR935xO8+LJLWPfwfIFcNwYnhSMOjUyiICyuFbWOiIn
 dIhW/zSJmJQNN6c64J/oWNUQjpafNa77LEABfVtI1ijhOhCD8V0wB9tFISPZSo9APbrJ
 LhJMBYbRDfq0+BDsNcpxfYL8B/ecivFdq/UHD/e5JOthDmm6yhiM8EvHX8PJ6VPQnFAa
 Fmkr5DM6ZrD2VfmmPbz0hLLWoKhLawAKiv0MwgNNOoUF9i8NmBUkljQd0On7pU2NVYBG
 VWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lg8D+6k5px/5X05zXz+RxGeDF297I8gzkoxsJjGQbFo=;
 b=SXGL+fv9e1a0aLDJSzqJS/S4hBgNS5kHskwk/4vZgRIQzz3WkH0PbK3VESna5uVisS
 5YinGPg/5MlPUFS5XQpUGRQxVz0WeHFulYjGWDRqazRe+zLCIrfIM+w+IEJHnKWJyDJW
 gJAWfS2L1ArJfcKowSy94TII3Kr/Fdl3RnqN2ZMw7pb+uKfWqBHIvody0zXZ7Qy/MkjJ
 pZcs3AUjFX7KfRpIKI0n+10b25Or40VGD9+u0yIWemlJ4Aa2gThCmuvLVROwd5cDJ2l8
 kutnMRB83luWj2XXs0rB24s688ZFb+G74nASJaQ/Akavk1Ym5161lF71enbDdxu+04zZ
 B09w==
X-Gm-Message-State: AOAM530c/9z+CLR+hyh0LDqcjqeTc1X8op1v50zmJCvWh4TOPRF92gXs
 NdtA7+C7wsIsTpMZV/Il188=
X-Google-Smtp-Source: ABdhPJxuONy2OXLST4ArDFBkn4J6Yegat6lHb2aCHoJzj6SLlnQmMD6UEqiQLnFGX7uycRMM3Jqphw==
X-Received: by 2002:ac2:5612:: with SMTP id v18mr2242856lfd.584.1610456363250; 
 Tue, 12 Jan 2021 04:59:23 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id 192sm384211lfa.219.2021.01.12.04.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 04:59:22 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v1 2/5] ALSA: hda/tegra: Reset hardware
Date: Tue, 12 Jan 2021 15:58:31 +0300
Message-Id: <20210112125834.21545-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112125834.21545-1-digetx@gmail.com>
References: <20210112125834.21545-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Reset hardware in order to bring it into a predictable state.

Tested-by: Peter Geis <pgwipeout@gmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/pci/hda/hda_tegra.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 4c799661c2f6..e406b7980f31 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -17,6 +17,7 @@
 #include <linux/moduleparam.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/time.h>
 #include <linux/string.h>
@@ -70,6 +71,7 @@
 struct hda_tegra {
 	struct azx chip;
 	struct device *dev;
+	struct reset_control *reset;
 	struct clk_bulk_data clocks[3];
 	unsigned int nclocks;
 	void __iomem *regs;
@@ -167,6 +169,12 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
 	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
 	int rc;
 
+	if (!(chip && chip->running)) {
+		rc = reset_control_assert(hda->reset);
+		if (rc)
+			return rc;
+	}
+
 	rc = clk_bulk_prepare_enable(hda->nclocks, hda->clocks);
 	if (rc != 0)
 		return rc;
@@ -176,6 +184,10 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
 		/* disable controller wake up event*/
 		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
 			   ~STATESTS_INT_MASK);
+	} else {
+		rc = reset_control_reset(hda->reset);
+		if (rc)
+			return rc;
 	}
 
 	return 0;
@@ -441,6 +453,12 @@ static int hda_tegra_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	hda->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
+	if (IS_ERR(hda->reset)) {
+		err = PTR_ERR(hda->reset);
+		goto out_free;
+	}
+
 	hda->clocks[hda->nclocks++].id = "hda";
 	hda->clocks[hda->nclocks++].id = "hda2hdmi";
 	hda->clocks[hda->nclocks++].id = "hda2codec_2x";
-- 
2.29.2

