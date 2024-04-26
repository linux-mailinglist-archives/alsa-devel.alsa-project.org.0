Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 695D48B3BAB
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:34:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE311E0D;
	Fri, 26 Apr 2024 17:34:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE311E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145658;
	bh=hMVnOvoSMf+JRMF8t9uSLpRgdcu8Yz7Hi23L/8tCSL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qtrHTk4O1lLZJZ6+8n1F8RURq+bSPSCpYxcs/P33+D1IIJlwp2xqWSUcXDMpYbCse
	 nhvav2YVcVQX8GgOVQo8fQ4zvUmSbPU5RWSby/bKf3PD6+D/GHjHVmGP6Tl+HGGJwQ
	 OYuznm4ai4kLhHu1bJo56XyTKhAsWo817tooehMk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02ADCF806B6; Fri, 26 Apr 2024 17:30:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54756F806A5;
	Fri, 26 Apr 2024 17:30:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39847F80601; Fri, 26 Apr 2024 17:30:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1C1AF80423
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:29:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1C1AF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=izxBXNIY
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55e9so4048155e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Apr 2024 08:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714145396;
 x=1714750196; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdxkC9xy0JdUlM4HJdidG8uU38VPySKk64XDlad2PLg=;
        b=izxBXNIYPsQkUvHcOYZxP/CxbcRMXcVYFK6jtIkU6DhoZsxmVSSdCad167WgqNm2yk
         Ys4QOeHvKEUQDt/Hby4Fy4c6TGt3Mcb9stnPfy5OWmUEXuEQsCF5BakuEiREFgKMZBR/
         46vEl09v/EZ4hXhs2sTVoeB+n2fpVfFnFjBJDeSESBfAwRyeQKmoMtDGawg14kz5jw1d
         a4dYQW8uZ7FmEuwMRXIeDGSITynTpILxf/Zywf4JqgmSEwow9ZoEWfrhRcSMFQPMWJJP
         0xLygQHgtY/ng5L80P5Cjcox2WAqEpkU6mc9O0xJG5vsbAUr2e8ciJLKOK/xhBH4gdQi
         H2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145396; x=1714750196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdxkC9xy0JdUlM4HJdidG8uU38VPySKk64XDlad2PLg=;
        b=dv3hfpe0EzZ/WGA3MQiG5y3LEPVWKaWWXZRseWV8aG9qojjWt36ixB/4463Fw0uZ4K
         YPVgfQYpKHVJvr+NN1ulKM+ZdO08fIBFAMEVwsgqVkBC3cMIdTFN4X/TXNVK2UIcVMjD
         KkFDE/5clXfsVs9iilMrrW8C0g/rWXlgDL3TdsWHqJPV+R5ipIMvDWes5Op6TjPn+gnP
         HLQ3m6/1Ue2i3J5e2zN/OB7XM+9Zcu1VZKzFiJeo8EWevE7Eh71lNYPhDZwif7Fq8juZ
         VK4+EyuknU+g5TRwzwKDhxBhNL5bHCaerhCh7HaPZ2C9Cuda4IJkAuRC0VimB+/pjVEM
         ge1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCULCXsgPMXBbGXVgEVNi6lbXVulFzHMPnVgOlZM/ss2ilGU6GXUjquJDUoXwkOltw4zQco2LdjEHruh3o3zljtkFT48eWFX/MAuXwE=
X-Gm-Message-State: AOJu0YxI+3P9PAaTF3iuaZW2Njf/pATV9vDo3SNNSMn5yBJXZYyB/aDc
	FxWx61Z3PCc9tujXa23u3qm0VY8bWjWu3F1APyEJmKNFAJPRtMk9kPRWIqCSbmE=
X-Google-Smtp-Source: 
 AGHT+IHPpBP3QSa57mdn7C6mGnSnPPrJ1b15kSZTPSoFNzWhfVV6qwoJcqsNBhnR4twzoAilz89DKA==
X-Received: by 2002:a05:600c:4ecf:b0:416:bc18:2a00 with SMTP id
 g15-20020a05600c4ecf00b00416bc182a00mr2136057wmq.38.1714145395834;
        Fri, 26 Apr 2024 08:29:55 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
        by smtp.googlemail.com with ESMTPSA id
 i13-20020a05600c354d00b00419fba938d8sm22628687wmq.27.2024.04.26.08.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:29:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 1/4] ASoC: meson: axg-fifo: use threaded irq to check periods
Date: Fri, 26 Apr 2024 17:29:38 +0200
Message-ID: <20240426152946.3078805-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426152946.3078805-1-jbrunet@baylibre.com>
References: <20240426152946.3078805-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YQKFAPAXRV473M4A5P3LXVIWUZ5RYRA5
X-Message-ID-Hash: YQKFAPAXRV473M4A5P3LXVIWUZ5RYRA5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YQKFAPAXRV473M4A5P3LXVIWUZ5RYRA5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With the AXG audio subsystem, there is a possible random channel shift on
TDM capture, when the slot number per lane is more than 2, and there is
more than one lane used.

The problem has been there since the introduction of the axg audio support
but such scenario is pretty uncommon. This is why there is no loud
complains about the problem.

Solving the problem require to make the links non-atomic and use the
trigger() callback to start FEs and BEs in the appropriate order.

This was tried in the past and reverted because it caused the block irq to
sleep while atomic. However, instead of reverting, the solution is to call
snd_pcm_period_elapsed() in a non atomic context.

Use the bottom half of a threaded IRQ to do so.

Fixes: 6dc4fa179fb8 ("ASoC: meson: add axg fifo base driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index bebee0ca8e38..ecb3eb7a9723 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -204,18 +204,26 @@ static irqreturn_t axg_fifo_pcm_irq_block(int irq, void *dev_id)
 	unsigned int status;
 
 	regmap_read(fifo->map, FIFO_STATUS1, &status);
-
 	status = FIELD_GET(STATUS1_INT_STS, status);
+	axg_fifo_ack_irq(fifo, status);
+
+	/* Use the thread to call period elapsed on nonatomic links */
 	if (status & FIFO_INT_COUNT_REPEAT)
-		snd_pcm_period_elapsed(ss);
-	else
-		dev_dbg(axg_fifo_dev(ss), "unexpected irq - STS 0x%02x\n",
-			status);
+		return IRQ_WAKE_THREAD;
 
-	/* Ack irqs */
-	axg_fifo_ack_irq(fifo, status);
+	dev_dbg(axg_fifo_dev(ss), "unexpected irq - STS 0x%02x\n",
+		status);
+
+	return IRQ_NONE;
+}
+
+static irqreturn_t axg_fifo_pcm_irq_block_thread(int irq, void *dev_id)
+{
+	struct snd_pcm_substream *ss = dev_id;
+
+	snd_pcm_period_elapsed(ss);
 
-	return IRQ_RETVAL(status);
+	return IRQ_HANDLED;
 }
 
 int axg_fifo_pcm_open(struct snd_soc_component *component,
@@ -243,8 +251,9 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
-	ret = request_irq(fifo->irq, axg_fifo_pcm_irq_block, 0,
-			  dev_name(dev), ss);
+	ret = request_threaded_irq(fifo->irq, axg_fifo_pcm_irq_block,
+				   axg_fifo_pcm_irq_block_thread,
+				   IRQF_ONESHOT, dev_name(dev), ss);
 	if (ret)
 		return ret;
 
-- 
2.43.0

