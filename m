Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 144214FA912
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Apr 2022 16:41:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ED03173D;
	Sat,  9 Apr 2022 16:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ED03173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649515272;
	bh=Ss7dIghfZmGX4GdyI/1emD/Oq3aIXX4S8Yp9iWlYrpA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lOEXSe4aMtIaqdxIo2c2kCOS3t70w4zz0B29bqaTOajy+m8OLtSJs1DUoIGC0XJK0
	 h7Wqh0j5kQgzWtwh9lHAbL5xQmqFBRsKblblyZ3UJQBplKjGK0f3mCPqIy6ACV/T0v
	 P0fqMhfzB+rQaLl4qGffDE25b9T4WDifeaSAhQtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A14CF80254;
	Sat,  9 Apr 2022 16:40:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3413F80253; Sat,  9 Apr 2022 16:40:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4B03F80054;
 Sat,  9 Apr 2022 16:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4B03F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FcErb1/a"
Received: by mail-pf1-x435.google.com with SMTP id h19so10864493pfv.1;
 Sat, 09 Apr 2022 07:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JU41SxMqoMbPQ8QDWJHCi79lbMEbsjN5J5bWfMPCK44=;
 b=FcErb1/aURM81N0KQMBD4HiiOBV3ZvN/fKTZEZCoVKB4fpu3Yz2xPUczF6QvdYRNoF
 l+8SzpOuuPgzj9fkGjH7uHoEDVg6+VdDH3GC1qA12fmXurrcYKgEoPirQCHDPkJu4dXQ
 5rL0z9yh/sslZFzBAJzMffuqGGMwyMD2W6lKYPxOhQY18mH85wVuYt05zPRxlAZy+YL0
 7YUyl9TJAHE+6zeWsNamzUdjJrZ2COO12vYK50DkZRQ8W/qF6LLVd8sfozz2w9YtxjcD
 2Jew7Cb4adTIRU62EqpBj28FQcMTLFaTchc3ZaKVl28JgkAhGkyx8mH2l/9dXfP+ah1v
 JDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JU41SxMqoMbPQ8QDWJHCi79lbMEbsjN5J5bWfMPCK44=;
 b=5V1rlSVWfpSldMtLCyA+ib3aaJqf8aTTA+zDaBXBWSKKhtVUXsYk14CB6tYmIT5blx
 b6RSyeL/jKBNt3g8MaCe8BaBnxbC2bhxk0mhDM9NlnneFQYDdFy3720YOB7VN6tbAtoN
 /hR9PFs1AvS5TmpTuqL56y3PMRm4xYigFXuS03RNot/0DawY+7ncBh6nLibleVUQOiL6
 9ZoU7U0kFgzc6fg0Nm/NMpbtplm1obzNBUerhL1RSnkYHt8bsVc79qydkqrXsvWtU+PK
 Uqu7gk5mzKsdRKDYLMbQhbUWPyu9P6lJ5NzNqsAtJz/AoGZxHWNj8Fx8PYUx1aiF3skI
 SacQ==
X-Gm-Message-State: AOAM532qx6XFhxiP5QVOjEyL7UrQIn9mEYSLCwzrgxaF7ODynJM39KrN
 UCllUfG+6654EYP/c/LrCQ==
X-Google-Smtp-Source: ABdhPJzsW+eToTWCrP8SHQ9RBgakFlrWo4D3JSdC6x9/gCg055Ug42/f1pZhPJGIslBLxzrw0/4W8A==
X-Received: by 2002:a05:6a00:b47:b0:4fd:a5b5:a279 with SMTP id
 p7-20020a056a000b4700b004fda5b5a279mr24556558pfo.19.1649515204528; 
 Sat, 09 Apr 2022 07:40:04 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056a001acf00b004fb2ad05521sm29225307pfv.215.2022.04.09.07.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 07:40:03 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: Check the bar size before remapping
Date: Sat,  9 Apr 2022 22:39:50 +0800
Message-Id: <20220409143950.2570186-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Zheyu Ma <zheyuma97@gmail.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
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

The driver should use the pci_resource_len() to get the actual length of
pci bar, and compare it with the expect value. If the bar size is too
small (such as a broken device), the driver should return an error.

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 sound/soc/sof/intel/pci-tng.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 6efef225973f..7d502cc3ca80 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -75,7 +75,11 @@ static int tangier_pci_probe(struct snd_sof_dev *sdev)
 
 	/* LPE base */
 	base = pci_resource_start(pci, desc->resindex_lpe_base) - IRAM_OFFSET;
-	size = PCI_BAR_SIZE;
+	size = pci_resource_len(pci, desc->resindex_lpe_base);
+	if (size < PCI_BAR_SIZE) {
+		dev_err(sdev->dev, "error: I/O region is too small.\n");
+		return -ENODEV;
+	}
 
 	dev_dbg(sdev->dev, "LPE PHY base at 0x%x size 0x%x", base, size);
 	sdev->bar[DSP_BAR] = devm_ioremap(sdev->dev, base, size);
-- 
2.25.1

