Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A22E52F7DA3
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 15:05:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C9E017B3;
	Fri, 15 Jan 2021 15:05:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C9E017B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610719552;
	bh=4qQlYRc5e6UhkM8eI9z4hnthnrqsVDrL0N6CsXRkDEo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X8nHY2jLiIT+aF2na2PUhnpsMmU+d51mgc0dU3XKa6HDYYxZqd/uE/zF7gV5c/guX
	 i3ZBtB91L2gENEJWBTt9dfioAoUPeLoLKqM02e2bFWiCFuzsv9RW6Qj3dGKqRpUgZS
	 Tq17Ih+gltjJiPvLbhWikY1XPnn5POK4kOAjnyhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C2D7F80134;
	Fri, 15 Jan 2021 15:03:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DCF1F80254; Fri, 15 Jan 2021 15:03:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 935B1F8016D
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 15:02:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 935B1F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IxNGpxLJ"
Received: by mail-lj1-x236.google.com with SMTP id f11so10480329ljm.8
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 06:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AugsGgJqZ1BGVrmdxP2mTwl2YppbUHC2dM5EBDLuhDU=;
 b=IxNGpxLJ3m1M2ajO7Sje8u8SQld1M1P1+ZaI/Xsr1LmnLk2Nqt1EpCUbZK1RIQPrJW
 ksb9hj/PLf/vm0Qqo45QdeCPjv0WBJso39ru6vsSvFglRz7lwXsqJuuX8D2LcK2JyIn6
 sq+aHBYkkcLWMD/kpi+cScaLD59QR1brKUckuLke2Y8GvjJG2yd6V6H4pky+sXpmA4sK
 8nOiDvzQyV0Fgn0GuukuIGZgN0iH06+71ii7o1nPEqwAeDEpXKbfst0Rzr2MNz5YoYa5
 TNMEsOVtjkA5JijE+cunlCi6vV+hLg9Juiuv/yfMGhntTe6ONmOpvJwiVPprK8kcj2En
 9OsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AugsGgJqZ1BGVrmdxP2mTwl2YppbUHC2dM5EBDLuhDU=;
 b=mAohAJCyGGQOlEINWgJBt9iT2Gf9jloG+wq6+oC1vAvNgdRdf0EHrGt6Vmvs1yVAP3
 7etbDTCGnTl2dBWtb7tolIOTjtxzT/6xoS3vQ4GgAwpydP+hkOqCdmsBre/5jqugdzga
 m+Kzsb6xqZ2Yh8uyTmf28/BhbAF5vooC0PLcieY+OPeNUKYidofGQSCZruT6wB6J8Xjg
 sJkNKu+t7vrV2LKAld1paIkEEozGF4e6ohFd1IED7NRiFn2ftMUzMFYvBzkOD2jpB7fX
 vDS45vhMrcFnQl61DJ2B0N3mvOZxGyX0VTqIwhsGJKvSEpz//WEZ4oEeKuoB2VW8BVD2
 uuKw==
X-Gm-Message-State: AOAM531GU5426wrYaWk1OKFObtuUJeAUYvoJ4WBLTgazDInta6NmBvGl
 Gdz3FZnljZG/KrhC1YFn4VI=
X-Google-Smtp-Source: ABdhPJw36bp85tyShH9IZv6D27k2onC6FL7LnhG43lJklst0eAgRiXi+nIWQqrkwJw8FRJW6560yJg==
X-Received: by 2002:a05:651c:87:: with SMTP id 7mr5415923ljq.312.1610719325486; 
 Fri, 15 Jan 2021 06:02:05 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.gmail.com with ESMTPSA id f132sm906852lfd.252.2021.01.15.06.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 06:02:05 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 2/5] ALSA: hda/tegra: Reset hardware
Date: Fri, 15 Jan 2021 17:01:42 +0300
Message-Id: <20210115140145.10668-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115140145.10668-1-digetx@gmail.com>
References: <20210115140145.10668-1-digetx@gmail.com>
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
index a25bf7083c28..1467725e390d 100644
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

