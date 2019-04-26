Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C8BB585
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 09:35:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A575087A;
	Sun, 28 Apr 2019 09:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A575087A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556436929;
	bh=3ONYRIXExnr1Bc85cxSxy3reQBnHHhUmTc63wU0owIQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iN2v2sLaqLdphWnHE81BWKoib7/Hq3w3CP9QzhQD+lCyn7v/wkvyKVwrqoJakroBI
	 YB3HIJQWJoeo5+yx/6IYCZlyLplUvfa4TUVUPyrXhVKzV31VGa0dSclgI55Q2vkEGY
	 yiqCJf+sIKnpcgBEppxXuRixw2hRyzdutIxFwVSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1D91F89732;
	Sun, 28 Apr 2019 09:30:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21150F896DF; Fri, 26 Apr 2019 18:47:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DFD1F8961C
 for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2019 18:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DFD1F8961C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="dNgKICUg"
Received: by mail-it1-x143.google.com with SMTP id a190so6893042ite.4
 for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2019 09:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QqnKyrp3mArwKqL8dFKZ2FJ7oLbcOYhGCMtzg+mpDC0=;
 b=dNgKICUg+IWEQxdmdCtJcSez1ZKhkhiV71QuC+EpBG0rrvhfwciZwGars1KO58Cvx7
 cC/N/dbiY2Tk8bLLCVEjOPfJTHuhO/BOZBliSuw4Iu67sG25vzU1leEOdJ5g1qvPHpnJ
 OhqOFs8RWHCLFKgcenGaqdCJZzmSoaQKRVBPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QqnKyrp3mArwKqL8dFKZ2FJ7oLbcOYhGCMtzg+mpDC0=;
 b=fRgejdqLaK/u4ybeqevgzsPbo5fHn1yprzoGf2QFC4KLNp+PfWFy8KrHSlndUfCXBf
 3k5QCusF+2bSow2VzYS4i9hwJTnH0ZDbFG5yG26Nz+eJ8aUf3+MRA21ZczBi7BaJ9+Oo
 JfUX5Cf5b81Bwu4Pnlp2kAx4vuXg2zJcp/oF3vlr6ZcIhafwOdRPvrTq98/a2tQwpDtE
 /sl0TocOctqYfCeWtvq02LHvHpReA7rqJQ3hVNnP5M2ZiExZpbnYRuWKWnA9l6lnQ9ix
 7Ry4jnMJ28OSdlZDCE81WVrNj4fCmXD8q+7VHq05GAZMFZYp24XO3d0i1jhvNAiy0Zzi
 eDxw==
X-Gm-Message-State: APjAAAUNfqdUaQ1q/oPOrPfrD1CumBd9vAW5PVIyhJmUawzSKF44CrGC
 F1dAV/OKA5O9ZgKIAK7AjrifHw==
X-Google-Smtp-Source: APXvYqy8i51neYtN3ZGXSleDs3Z783iB7tHbyaZ89nWCeKFCHDGb6h+c4WkCrQzNOBNX1Rk1Nh9slA==
X-Received: by 2002:a24:2fcb:: with SMTP id j194mr9671987itj.14.1556297265229; 
 Fri, 26 Apr 2019 09:47:45 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:855f:8919:84a7:4794])
 by smtp.gmail.com with ESMTPSA id q22sm8856679ion.15.2019.04.26.09.47.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2019 09:47:44 -0700 (PDT)
From: Ross Zwisler <zwisler@chromium.org>
X-Google-Original-From: Ross Zwisler <zwisler@google.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 26 Apr 2019 10:47:40 -0600
Message-Id: <20190426164740.211139-1-zwisler@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 28 Apr 2019 09:30:26 +0200
Cc: alsa-devel@alsa-project.org, Ross Zwisler <zwisler@google.com>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: Intel: avoid Oops if DMA setup fails
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

Signed-off-by: Ross Zwisler <zwisler@google.com>
Cc: stable@vger.kernel.org
---
 sound/soc/intel/common/sst-firmware.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/sst-firmware.c b/sound/soc/intel/common/sst-firmware.c
index 1e067504b6043..9be3a793a55e3 100644
--- a/sound/soc/intel/common/sst-firmware.c
+++ b/sound/soc/intel/common/sst-firmware.c
@@ -1251,11 +1251,15 @@ struct sst_dsp *sst_dsp_new(struct device *dev,
 		goto irq_err;
 
 	err = sst_dma_new(sst);
-	if (err)
+	if (err)  {
 		dev_warn(dev, "sst_dma_new failed %d\n", err);
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
