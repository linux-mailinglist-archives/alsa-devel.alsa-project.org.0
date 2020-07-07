Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 457DD216A18
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:23:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E12A61665;
	Tue,  7 Jul 2020 12:22:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E12A61665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117422;
	bh=H/tdZ8ilfYBgwOZ3cM2RmrdmhVzeUghpK04gZ6y3CJM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IzJ6yRPaja/vdBdysUmT7WMkcCijYqJjASCLohpnCAFgmb4CEXe6FN7jDxDIxfPMo
	 EpB2CaHz3vR4U9DPvdoMFY8vMrwyH7ii4SUIzawyGUYhJcjM7VKF51+2sy/q/i8f4p
	 C0wvDfdlEawydHwrADQ4jRWSAH7iDcCMxZdaAs7I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06EDAF802F8;
	Tue,  7 Jul 2020 12:17:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B49FF80307; Tue,  7 Jul 2020 12:17:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70F35F802DB
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:17:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70F35F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VNmHdT5a"
Received: by mail-wr1-x441.google.com with SMTP id q5so44517657wru.6
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ceIee8YBFX9kzqJWoK/1iqOS7aaLJ7GoK8i5sFpusg4=;
 b=VNmHdT5aOvG5QcaUjgLr53ubScedW6+ksFA4XxzupsIrEYDcgzzUzddsvpTVB9+XBd
 Ry1c1rkjcL2OrFOHVSR5WsUH1Zte6YIqm83zgl4a8K4ORxMhKnyNnv+a+uocR+ceVe7d
 xSvPRKPxzLXNAG8kwS1XjuRA68zvHf8U6dL/SIXIee0ZAa7JMk85f5nO7LCsI2Nw0k0P
 Yrd5NXh0wSnDfPpx4/l6Q9a4OlDOxl6oJ1wrFcS002d6H5/bblBAdZvP2iJbJ1PiCx3s
 5HiwZQ/XzuOK93xWUiz73N1/WL6mKyRf1RVnJD+SfQcACuO9YfuphgOAaSE3clIFgaah
 BH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ceIee8YBFX9kzqJWoK/1iqOS7aaLJ7GoK8i5sFpusg4=;
 b=KGZKm/K1JjsSZt7XXhMFDXxvA8QcekmDdEWC2mz3ALoWBZCkTvYYnfs/LtaNJ5OqUA
 s67Tm8TzEZFkSh16ezMmm1Fgo9E02w6ceJUWARlJtjP8k1NGPBTe5bE39LzAOsi7JJkD
 IQWxKpC+5V9MzLwI38J9yRyDqkn551i4DRc1qoXICPP013aNMIDO1UWvCuGjeXdBkSFI
 AaADzzt7XRNfRRAIK5vB22/MuC4yoN0HlKu5BKUAh3otS3SrKNcofulOtSR+eqgTOM8+
 nHtjkcdr9y3zoh57/dxLdgzOsujJ2nGUIcuo7gld0GiPDf9vaIAyAHNlXK8uWM6L6Rjg
 lwRw==
X-Gm-Message-State: AOAM531b646m7ZVBJd1Xl5vPCjVhXnlMFpaVTj42db7/e5hRfFoSRdMA
 nS2grR/TwRVcesn74VF641oWTw==
X-Google-Smtp-Source: ABdhPJwX2C88MDS9oCo6CUBN9iE8kRApkiJqgBaHVMS9ZR3zrmhkp/rOi+eiD5PYlCH7fNBq+FuNpQ==
X-Received: by 2002:adf:c441:: with SMTP id a1mr52516736wrg.130.1594117020948; 
 Tue, 07 Jul 2020 03:17:00 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:17:00 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 10/28] ASoC: fsl: fsl_esai: Add descriptions for 'tx_mask' and
 'rx_mask' to 'fsl_esai'
Date: Tue,  7 Jul 2020 11:16:24 +0100
Message-Id: <20200707101642.1747944-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
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

Fixes the following W=1 kernel build warning(s):

 sound/soc/fsl/fsl_esai.c:86: warning: Function parameter or member 'tx_mask' not described in 'fsl_esai'
 sound/soc/fsl/fsl_esai.c:86: warning: Function parameter or member 'rx_mask' not described in 'fsl_esai'

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl_esai.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index bb3c405df623c..3f67f4a465780 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -49,6 +49,8 @@ struct fsl_esai_soc_data {
  * @fifo_depth: depth of tx/rx FIFO
  * @slot_width: width of each DAI slot
  * @slots: number of slots
+ * @tx_mask: tx register mask
+ * @rx_mask: rx register mask
  * @channels: channel num for tx or rx
  * @hck_rate: clock rate of desired HCKx clock
  * @sck_rate: clock rate of desired SCKx clock
-- 
2.25.1

