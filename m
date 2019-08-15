Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F88D8F248
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:33:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B25FD852;
	Thu, 15 Aug 2019 19:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B25FD852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565890399;
	bh=Q6xJ0J8UzPBqz/y2yq/j+JwJSrXnMPKpeDwPIaXahEw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CL85qE6neJbMoXZsvXVHF5+z2eghtE3Np3AHcYRvChUBHNnULLDLba43/3QDKuOI7
	 2b+WS8uRrneDPVzfBAOY9oSmnCOPde6CKOiCiEsBZk3JZuClzWpMukrd/C03+I0Rhb
	 fEMsLqfbFnFCDCDsxmOcm9ZSIpy7B6MQyJ/Z8S1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E31FF8086C;
	Thu, 15 Aug 2019 19:16:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 919DEF8070B; Thu, 15 Aug 2019 19:15:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f98.google.com (mail-wr1-f98.google.com
 [209.85.221.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82F5FF805FA
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82F5FF805FA
Received: by mail-wr1-f98.google.com with SMTP id b16so2848100wrq.9
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=dXH5iCrajVuHNaQjRFbCRi3wnS4PzGsd3NOsiMm0Dhs=;
 b=OdMF64Z1b4Cq5rORxBvajplVriW12icMXCl1CEHTPAd6sRXITzbvHTDbvpqfP6wx1S
 1O5+IhyzPfIe/k9erVRByIht0yY6y4GjlPb844GTuICZ4R3HrMW1C3Zpy2TPpzfUNN4N
 vS1tWpE5qUan4FjrDuQ47aVIZoOaEmYQzNR65JbTh0qMVEkZIEWbLPlITRkpQavVC0yn
 705fGSSxJGVMN/woLCQzhA8Jig9998cW9d1vAAIBle7h/xLZqp7/gXixfNBPgPjzuOV5
 X5Rh0g5DdIj5EcT4g6XIIM52UQC7Af3dvnbhh63B74Y06fhLzBO29sqrhDXYyhqWb4Cd
 QCJQ==
X-Gm-Message-State: APjAAAWoQNIjnOGd6aRo1qLTTppwagmrXYSa8iNLlxlCrmNyi62cP0zv
 uinf1Q9pFV0gnIH17GmfCLIRWVw86oOWGdi+M+VWYDskng4RyDdJQ1dhNJBTVYuiXQ==
X-Google-Smtp-Source: APXvYqzdUat/m0ESOjrmVH6XsjvmuVYd5FZiZgx9NSQRpwZI4Y9N9JZMF8QNa37wGKT1mshgc86AuIZ3pySu
X-Received: by 2002:a5d:4310:: with SMTP id h16mr6602997wrq.212.1565889267391; 
 Thu, 15 Aug 2019 10:14:27 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id c128sm12461wma.50.2019.08.15.10.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:27 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKV-00052G-3O; Thu, 15 Aug 2019 17:14:27 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 93A0C2742B9E; Thu, 15 Aug 2019 18:14:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190815091920.64480-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171426.93A0C2742B9E@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:26 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>, tglx@linutronix.de, info@metux.net
Subject: [alsa-devel] Applied "ASoC: wm8737: Fix copy-paste error in
	wm8737_snd_controls" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: wm8737: Fix copy-paste error in wm8737_snd_controls

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 554b75bde64bcad9662530726d1483f7ef012069 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Aug 2019 17:19:20 +0800
Subject: [PATCH] ASoC: wm8737: Fix copy-paste error in wm8737_snd_controls

sound/soc/codecs/wm8737.c:112:29: warning:
 high_3d defined but not used [-Wunused-const-variable=]

'high_3d' should be used for 3D High Cut-off.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 2a9ae13a2641 ("ASoC: Add initial WM8737 driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20190815091920.64480-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8737.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8737.c b/sound/soc/codecs/wm8737.c
index 0c246fb5e5ac..7a3f9fbe8d53 100644
--- a/sound/soc/codecs/wm8737.c
+++ b/sound/soc/codecs/wm8737.c
@@ -167,7 +167,7 @@ SOC_DOUBLE("Polarity Invert Switch", WM8737_ADC_CONTROL, 5, 6, 1, 0),
 SOC_SINGLE("3D Switch", WM8737_3D_ENHANCE, 0, 1, 0),
 SOC_SINGLE("3D Depth", WM8737_3D_ENHANCE, 1, 15, 0),
 SOC_ENUM("3D Low Cut-off", low_3d),
-SOC_ENUM("3D High Cut-off", low_3d),
+SOC_ENUM("3D High Cut-off", high_3d),
 SOC_SINGLE_TLV("3D ADC Volume", WM8737_3D_ENHANCE, 7, 1, 1, adc_tlv),
 
 SOC_SINGLE("Noise Gate Switch", WM8737_NOISE_GATE, 0, 1, 0),
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
