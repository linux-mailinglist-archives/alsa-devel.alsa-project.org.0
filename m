Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA8394AE4E
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 18:42:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D31020C5;
	Wed,  7 Aug 2024 18:42:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D31020C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723048941;
	bh=Ng+/JCc1gUQ4aifD/rVtKKq53bnVZwaYRNuOqvikte8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CgCuL8NG+grN34qPLP5cwD98Z9DSe/HXm7FRrrXExqLn+MAOijx70ux9YgBILx7ve
	 tKI8WawRse+1kaVMdoNCs5TxdN5b+Gc+uHB0sJZLpF5qwZGLZVbis+2jz1fAO+wbU6
	 5vWi0JafnMnJ2JUdldXvVvSvpdlHz4lUtGDErMp8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FE3FF80589; Wed,  7 Aug 2024 18:41:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ACCDF805B5;
	Wed,  7 Aug 2024 18:41:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7E9FF802DB; Wed,  7 Aug 2024 18:32:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,TIME_LIMIT_EXCEEDED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF69BF8023A
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 18:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF69BF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=2al10gmv
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-368712acb8dso11577f8f.2
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Aug 2024 09:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723048036;
 x=1723652836; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x+dBIqzE9uz4423Miwg6qL/QPsaguESKxdu18p0e9Wk=;
        b=2al10gmvSAai4iry2TTkVG52GLc3t6CWJ/L8OOwQFVdQ8xa8jVsuYyH+OKF/d8xrEZ
         4kCpimrfiaXS7z0hI8V/MMAC0TCKK9/X+T2DyPN/vm1Rz6rW4Kttx7nxXGX13VIubWyL
         CgO6Z/OrG5MAaDN8eyvnYOuj2wTu+RGG2orlKUU5WbCRH7YxNrlBe4C4QUPlgVPRHc1D
         sPLP7W13TlCb4ez4KjCeZaVpdtf2ZUVZMECZKqGq38uBRHCKyNi3flT+jKyoIMzdcZ+w
         VgyNkT1rzPTxdW8on5L6C6BPSiplxINa2DnYRbb2uOsE+XmHXyCGelyCV0E0NZWSg3Mf
         8C1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723048036; x=1723652836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+dBIqzE9uz4423Miwg6qL/QPsaguESKxdu18p0e9Wk=;
        b=hVqBvGI57H4a1OF6lHVQJTK8/x2eE+N7NzrTRJXJ6mZbUKxpb91c3IkPb0CO3jX0+U
         Iz9MmbL5RPbCVhuZW7X5LAb9KMZfFFKFHpzTPhC57zfztFlIT+u5Bn+t4ZueTlQ1tIN+
         eTIaZZIaZX3Q5xi6ZbxOtAXrUyyliQI9Trys36tCnsmEeUqehf1d1ukgK+fK8cPfOaBx
         ru6o48oKXQEXOTv8K4VmDK5Z0ZB05tr2gMPeQOKyw+T4lYSCFKnYpsGSgOT1KdODJcaC
         S/zs6K/zHnJZyxB0EPzDLWYRXAs804l9WEoEZ5w9kqjuTJGvb8EcKey/x9Yw3dtGRMwb
         YxsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN9Cf/lELjHaxYCJFOMIGtSIJ8LSqKZzTJlLZZdYkTSCHUvHrmoAEJ2Mk2/54PyRyVhd8IpQuOH4u0SKWLdEjT0FalBoQPiHjXz88=
X-Gm-Message-State: AOJu0Yw11oYqUGrXQxidRjZyoW2H3rgpsyA0MtC1HFCR/BNKe3hYEtIe
	jtWj49QqzdEsn1wbc2TJvnRwmPAkz/WFc4S1erckbCFdXMcNbasecl5H0jHugoE=
X-Google-Smtp-Source: 
 AGHT+IFwKsKtdGBREmHTq2kOs7k4+/3e+X9EV8QnAXRSEkHZm0dwuN3Fu+VfeXznpGNYYLj47KdTtw==
X-Received: by 2002:a5d:5c87:0:b0:36b:bd75:ed73 with SMTP id
 ffacd0b85a97d-36bbd75ef23mr13891573f8f.23.1723048036168;
        Wed, 07 Aug 2024 09:27:16 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:90f1:3c4c:261c:b0f5])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-36bbd169697sm16494184f8f.107.2024.08.07.09.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 09:27:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2] ASoC: meson: axg-fifo: fix irq scheduling issue with
 PREEMPT_RT
Date: Wed,  7 Aug 2024 18:27:03 +0200
Message-ID: <20240807162705.4024136-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7J65LMCSWYYE7X75OBEFM2W6G6Q2BSXH
X-Message-ID-Hash: 7J65LMCSWYYE7X75OBEFM2W6G6Q2BSXH
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7J65LMCSWYYE7X75OBEFM2W6G6Q2BSXH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With PREEMPT_RT enabled a spinlock_t becomes a sleeping lock.

This is usually not a problem with spinlocks used in IRQ context since
IRQ handlers get threaded. However, if IRQF_ONESHOT is set, the primary
handler won't be force-threaded and runs always in hardirq context. This is
a problem because spinlock_t requires a preemptible context on PREEMPT_RT.

In this particular instance, regmap mmio uses spinlock_t to protect the
register access and IRQF_ONESHOT is set on the IRQ. In this case, it is
actually better to do everything in threaded handler and it solves the
problem with PREEMPT_RT.

Reported-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
Closes: https://lore.kernel.org/linux-amlogic/20240729131652.3012327-1-avkrasnov@salutedevices.com
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Fixes: b11d26660dff ("ASoC: meson: axg-fifo: use threaded irq to check periods")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 7e6090af720b..75909196b769 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -207,25 +207,18 @@ static irqreturn_t axg_fifo_pcm_irq_block(int irq, void *dev_id)
 	status = FIELD_GET(STATUS1_INT_STS, status);
 	axg_fifo_ack_irq(fifo, status);
 
-	/* Use the thread to call period elapsed on nonatomic links */
-	if (status & FIFO_INT_COUNT_REPEAT)
-		return IRQ_WAKE_THREAD;
+	if (status & ~FIFO_INT_COUNT_REPEAT)
+		dev_dbg(axg_fifo_dev(ss), "unexpected irq - STS 0x%02x\n",
+			status);
 
-	dev_dbg(axg_fifo_dev(ss), "unexpected irq - STS 0x%02x\n",
-		status);
+	if (status & FIFO_INT_COUNT_REPEAT) {
+		snd_pcm_period_elapsed(ss);
+		return IRQ_HANDLED;
+	}
 
 	return IRQ_NONE;
 }
 
-static irqreturn_t axg_fifo_pcm_irq_block_thread(int irq, void *dev_id)
-{
-	struct snd_pcm_substream *ss = dev_id;
-
-	snd_pcm_period_elapsed(ss);
-
-	return IRQ_HANDLED;
-}
-
 int axg_fifo_pcm_open(struct snd_soc_component *component,
 		      struct snd_pcm_substream *ss)
 {
@@ -251,8 +244,9 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
-	ret = request_threaded_irq(fifo->irq, axg_fifo_pcm_irq_block,
-				   axg_fifo_pcm_irq_block_thread,
+	/* Use the threaded irq handler only with non-atomic links */
+	ret = request_threaded_irq(fifo->irq, NULL,
+				   axg_fifo_pcm_irq_block,
 				   IRQF_ONESHOT, dev_name(dev), ss);
 	if (ret)
 		return ret;
-- 
2.43.0

