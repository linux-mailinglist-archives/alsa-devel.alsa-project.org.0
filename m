Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0334EA12
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 20:27:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EF4F1670;
	Mon, 29 Apr 2019 20:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EF4F1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556562466;
	bh=QTVToA0jHgCQo/T68Y5EzaBKC0pLpfT7QkptE+M8dp8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sp2OxB6khQ3uE4QFpIlZwAjA7V4YJ0ym5Yiui9wT+3SFXRMY0nDy2MqhLNap9XaX9
	 Xm+7Xs2yTenaHE3t+4oaSP2TJn95+G1a8XY/UZgMlqxdkkC4pg+P5PJ/5yGXRtqJgs
	 qBF2B4Sr5rzgPuLNaJJhyMu7SAlHdmTnD+8zR+ug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1308EF8962A;
	Mon, 29 Apr 2019 20:26:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE7A4F80CAB; Mon, 29 Apr 2019 20:25:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-it1-x142.google.com (mail-it1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A098F806E7
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 20:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A098F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="J4S+dRaE"
Received: by mail-it1-x142.google.com with SMTP id v8so634191itf.0
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 11:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YaQCnzzh+3p/v5Fojy+snkCdhoa+2CZox1xOwkyLqvU=;
 b=J4S+dRaERgYYJqnVpVLtPqQznX5dFlnBdW1GSin1hyFvVPaVFzBMJJghFLtjWDxjRT
 v4iQjjYiEm5qqJHFhcTf+I2XtMweu48chGehJmqyEzO/Qd5UGSJCqE5O7ITg1jCUrp1O
 sLkB+tB1sLss3OVRYXkzt7MWCq2RCJl+FymYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YaQCnzzh+3p/v5Fojy+snkCdhoa+2CZox1xOwkyLqvU=;
 b=Rfo8NmWhQ3Ha9wi/pM87njLp61NISa/kIjWRw1jhj+Iv81zETUnrCQWG9xSTJvBJNh
 iR22jGU3OmiHsiCsSDE9esSmYAUjK4iGlsRS/WehGbU6HDtk0y19uglwsjh94UAxpIk8
 dXc/1vkobru/2I65fPMeTTpoWyDsSpFAZ8tUyQEpbE9fVl+DoCF2JFHsn9QAKjmOWmky
 GzJH62NndQXW34CYVFQlzMPDetdRpVS0O9go8THggdbFnbalZSgeamwfRcRLZeNdjP1A
 IERrOZLAsbfIzLRMAxZ1ejj4c53lBalRBBLlOHLDwB0SK99EKYlMq9DFNpjXvT6i/RZl
 eJhQ==
X-Gm-Message-State: APjAAAUwoBUsizFb2tjreXcNJVnmBZgtioyGJwAQ8rJguM9KtkMhryUN
 zDISnHMPQLBhX2g19egShDtL5w==
X-Google-Smtp-Source: APXvYqwBCurYe1oxJjzdJiVGjz+EDb8ToH9Z6RTcJkNpjitcglw/xKq/Iljl45Uzy6HrBv+Pj9q+6w==
X-Received: by 2002:a05:660c:24e:: with SMTP id
 t14mr371088itk.50.1556562352791; 
 Mon, 29 Apr 2019 11:25:52 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:855f:8919:84a7:4794])
 by smtp.gmail.com with ESMTPSA id y199sm12894585iof.88.2019.04.29.11.25.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 11:25:51 -0700 (PDT)
From: Ross Zwisler <zwisler@chromium.org>
X-Google-Original-From: Ross Zwisler <zwisler@google.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org
Date: Mon, 29 Apr 2019 12:25:17 -0600
Message-Id: <20190429182517.210909-1-zwisler@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <0b030b85-00c8-2e35-3064-bb764aaff0f6@linux.intel.com>
References: 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Ross Zwisler <zwisler@google.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 stable@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v2] ASoC: Intel: avoid Oops if DMA setup fails
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

Currently in sst_dsp_new() if we get an error return from sst_dma_new()
we just print an error message and then still complete the function
successfully.  This means that we are trying to run without sst->dma
properly set up, which will result in NULL pointer dereference when
sst->dma is later used.  This was happening for me in
sst_dsp_dma_get_channel():

        struct sst_dma *dma = dsp->dma;
	...
        dma->ch = dma_request_channel(mask, dma_chan_filter, dsp);

This resulted in:

   BUG: unable to handle kernel NULL pointer dereference at 0000000000000018
   IP: sst_dsp_dma_get_channel+0x4f/0x125 [snd_soc_sst_firmware]

Fix this by adding proper error handling for the case where we fail to
set up DMA.

This change only affects Haswell and Broadwell systems.  Baytrail
systems explicilty opt-out of DMA via sst->pdata->resindex_dma_base
being set to -1.

Signed-off-by: Ross Zwisler <zwisler@google.com>
Cc: stable@vger.kernel.org
---

Changes in v2:
 - Upgraded the sst_dma_new() failure message from dev_warn() to dev_err()
   (Pierre-Louis).
 - Noted in the changelog that this change only affects Haswell and
   Broadwell (Pierre-Louis).

---
 sound/soc/intel/common/sst-firmware.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/common/sst-firmware.c b/sound/soc/intel/common/sst-firmware.c
index 1e067504b6043..f830e59f93eaa 100644
--- a/sound/soc/intel/common/sst-firmware.c
+++ b/sound/soc/intel/common/sst-firmware.c
@@ -1251,11 +1251,15 @@ struct sst_dsp *sst_dsp_new(struct device *dev,
 		goto irq_err;
 
 	err = sst_dma_new(sst);
-	if (err)
-		dev_warn(dev, "sst_dma_new failed %d\n", err);
+	if (err)  {
+		dev_err(dev, "sst_dma_new failed %d\n", err);
+		goto dma_err;
+	}
 
 	return sst;
 
+dma_err:
+	free_irq(sst->irq, sst);
 irq_err:
 	if (sst->ops->free)
 		sst->ops->free(sst);
-- 
2.21.0.593.g511ec345e18-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
