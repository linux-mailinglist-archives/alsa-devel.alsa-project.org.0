Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3AA15D83C
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 14:17:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58FB91684;
	Fri, 14 Feb 2020 14:16:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58FB91684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581686243;
	bh=UVzP5RvHDBAYoEi7lz8ApEc8CXA91iuSGEzWRV5ISCg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kgE815II9C7bkIOvWuxlk4mQ1MEUiOB85UnFRqz8ntq5lM0sNPXv0C/8HFX00R8oq
	 27t6tyC/M4pM7IogKd8CLRnVZAstURsXaP068Q+24syYxnM3LD4iPoN1py2iNDZ6ru
	 Mykys32sFf0fBwbcjoGYClFxBhiEZO6RTf7SDvT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16F56F8027C;
	Fri, 14 Feb 2020 14:14:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD899F80276; Fri, 14 Feb 2020 14:14:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A373AF8014F
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 14:13:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A373AF8014F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="TSTqqQMF"
Received: by mail-wr1-x441.google.com with SMTP id t3so10856263wru.7
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 05:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vuwuzpsX5RzClpZoSCXE8jPlP14S0+i5Nh9kd/OQAlU=;
 b=TSTqqQMFRXUb+avCLPyEtyy/SXMFgBkz3pOzmJbAzGCp49zkBAxH+R1F/rhbnNxTFD
 Lk+85ejQ9VGaB7p/I4fQH7B7SdZAVt7MLVbNYuC7JYW+x61DQrc2AWz8LSevDK05D5eM
 HcrXJxXWzTXuLSNhEvuWHScbTYgK6y1xzaKe5Lcg9UBtw6PwP9hs115Own9COoQ83NFd
 Ywc8T0gKKEGTgQ/6RHwKCvpXT0LlDeHmBbnWaLQQ+hrEcvsTBE7pSSdiTIZhk4an+wBg
 3pSd5O99tNdGusYKMLiX2H6bckHhb5Oj10pHRP/mJwt2i895/6nWHO18IV24BQyvxVdJ
 /THg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vuwuzpsX5RzClpZoSCXE8jPlP14S0+i5Nh9kd/OQAlU=;
 b=Vz21V/9jTasVAcFkYuMy98cI1FVf50NjxVUYHxVbEIalZPjo0O/0fKMu94UYxjq1qZ
 tlZSOjcOK4YWX1BaVSBtAMuYGJ4AhkYuZQw28fn04+bvexm1xJmvYq2SC/Zx7rmE1awt
 1G5qbNmuqNY2dbayMvoEnHYN5NHlkpVF9eJccLpfcIDNC9bl6iznqKVBDyAe/ej7/nnN
 SWLxjinqAqbES4mYvR2bK94WXRP/p0rv/pcy0jgKsujLxh9MKN/dBXKtADqsypgfOoRe
 JZ3g5RKbW5ym8kB2ip2K4FhdDm4z33/edqvslWP+ihFbAcQ0Ak0Ehrsp9F0/MDfMWPp0
 JH9g==
X-Gm-Message-State: APjAAAUDEaTw9XvBDIY0U3ucNHVHdO0aT8ERtK9+1EvtYpFq6SqzpMKb
 TH7whkpiBlOgxPsUL6WHW6u5HA==
X-Google-Smtp-Source: APXvYqxMHOnNCwLIWDmiOvwhVwAWtwAZf5cc+Xtor4Tr9qkozMweqEkbj+d370UvqeuQ9mcLgqpjyA==
X-Received: by 2002:a5d:5088:: with SMTP id a8mr3985658wrt.162.1581686037685; 
 Fri, 14 Feb 2020 05:13:57 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm6760792wmi.9.2020.02.14.05.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 05:13:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Fri, 14 Feb 2020 14:13:48 +0100
Message-Id: <20200214131350.337968-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200214131350.337968-1-jbrunet@baylibre.com>
References: <20200214131350.337968-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kbuild test robot <lkp@intel.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 3/5] ASoC: meson: aiu: fix irq registration
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

The aiu stored the irq in an unsigned integer which may have discarded an
error returned by platform_get_irq_byname(). This is incorrect and should
have been a signed integer.

Also drop the irq error traces from the probe function as this is already
done by platform_get_irq_byname().

Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu.c | 8 ++------
 sound/soc/meson/aiu.h | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index de678a9d5cab..34b40b8b8299 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -314,16 +314,12 @@ static int aiu_probe(struct platform_device *pdev)
 	}
 
 	aiu->i2s.irq = platform_get_irq_byname(pdev, "i2s");
-	if (aiu->i2s.irq < 0) {
-		dev_err(dev, "Can't get i2s irq\n");
+	if (aiu->i2s.irq < 0)
 		return aiu->i2s.irq;
-	}
 
 	aiu->spdif.irq = platform_get_irq_byname(pdev, "spdif");
-	if (aiu->spdif.irq < 0) {
-		dev_err(dev, "Can't get spdif irq\n");
+	if (aiu->spdif.irq < 0)
 		return aiu->spdif.irq;
-	}
 
 	ret = aiu_clk_get(dev);
 	if (ret)
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index a65a576e3400..097c26de7b7c 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -26,7 +26,7 @@ enum aiu_clk_ids {
 struct aiu_interface {
 	struct clk_bulk_data *clks;
 	unsigned int clk_num;
-	unsigned int irq;
+	int irq;
 };
 
 struct aiu {
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
