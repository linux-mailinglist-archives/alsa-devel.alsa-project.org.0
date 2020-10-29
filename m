Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4469829E56F
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:58:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE33916C6;
	Thu, 29 Oct 2020 08:57:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE33916C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603958288;
	bh=fIA8NC95XCMYZgXwXD/vbnF35MHrIy6y4wPssVEV6xk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WSCMesjtLcVwWuNBBVN4OIsMm7C8gocWG1eSnK3uYKtfojY3G76e8nZ1Of0esKa0I
	 LQN+28L3OqvwP+MLIrSzwgoIPr5tIbkY3PfHfa9Ji/n06MHVGm0sucY8KO7baxDwyR
	 T+nnqpICeYMTSM1gxg0fgd8hqNzjAor0EpDJrcYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B471DF8053C;
	Thu, 29 Oct 2020 08:50:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1E5CF8020D; Thu, 29 Oct 2020 08:46:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD8B6F800FF
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:45:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD8B6F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Zvww3hgN"
Received: by mail-pl1-x644.google.com with SMTP id f21so903855plr.5
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Srt9Zr3sbLPIZI2HZoMYv5lnjbmkxnLms7pVPF5Blnw=;
 b=Zvww3hgNnlo7R8RXwg3FMc6GgW//WUoWYaeeb+tehUfljZXqY13AQsHzLcoEbLdYZA
 kg5DXmd3ZuwmTcwsZiw8aqCFCvbfqN9xIw2VMXx0bbY4xlbNEEwJXE2K8Eqq4hEMqxLw
 6nSTktTnvIh8FvzhCAaOPwR/KpXgXRgS6XRqUvoRSaB9/EO3B4GNOSPMBpzpnJpWMNuY
 hUBdxcl86x0a2vzgffUal9Aht4eFqe69Zmotg9OHgBvs2/G1KuA61XJ5g2khkHb5SAGv
 KQpun9GiE7hZSIc3hFygJFY2BW5yEyLacpcJat7zdpad1+0z69MFlryNwKPz74H2Lzlx
 qcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Srt9Zr3sbLPIZI2HZoMYv5lnjbmkxnLms7pVPF5Blnw=;
 b=Clbmg4N3duNNiIlWY0LKRxOYLC6+f1hLcK8LPT329YIO4qjoZP8xSm4+Hq2h7aHvt/
 4f6kKrZERzOexm96fztX04s+DBI1vy9VqLggwO1wczA3K7QgOF/+ORNz/DGb+2gSTEsR
 T3EzbkU91GCo51jnxed2qdXcjsrLVXQtWTqfm6ej1Ohwg2DZSawiVy/f0GmH6qzCqy4b
 mZBslGQT3mtxHMA38QMFiURbVd9xUZr76mNlSRcr0AHRnDcZfxlB7TUuoqrEuBBcvNIH
 eUOxrQ2xZMypEdxJC15Icpqt2eR5Vg2JIdVj6xfOvHoSNjA/8AsJItI9wz398ryDigAE
 /oSQ==
X-Gm-Message-State: AOAM531EqnGCGA42tLztxmn8QGj1hfesVr0Pei1yYS6w/ne+ixdMJw1C
 M5NtFRVXVi5S6IJD9iFXtPE=
X-Google-Smtp-Source: ABdhPJy/XS1AXFlInVXO533UQqzhqOpm34bFyUnt7mcdz6zM+v9F9snWZUyres15CNwXot89r2kIAA==
X-Received: by 2002:a17:902:c113:b029:d6:944e:fdb3 with SMTP id
 19-20020a170902c113b02900d6944efdb3mr12157pli.4.1603957555029; 
 Thu, 29 Oct 2020 00:45:55 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id n7sm1599220pgk.70.2020.10.29.00.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:45:54 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 19/25] ASoC: sirf-audio: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:55 +0800
Message-Id: <20201029074301.226644-19-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:55 +0100
Cc: Barry Song <baohua@kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/CSR SIRFPRIMA2 MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
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

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/soc/codecs/sirf-audio-codec.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/sirf-audio-codec.c b/sound/soc/codecs/sirf-audio-codec.c
index a061d78473ac..b6a101ec6e7c 100644
--- a/sound/soc/codecs/sirf-audio-codec.c
+++ b/sound/soc/codecs/sirf-audio-codec.c
@@ -522,7 +522,6 @@ static int sirf_audio_codec_driver_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sirf_audio_codec_suspend(struct device *dev)
 {
 	struct sirf_audio_codec *sirf_audio_codec = dev_get_drvdata(dev);
@@ -552,7 +551,6 @@ static int sirf_audio_codec_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops sirf_audio_codec_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(sirf_audio_codec_suspend, sirf_audio_codec_resume)
-- 
2.28.0

