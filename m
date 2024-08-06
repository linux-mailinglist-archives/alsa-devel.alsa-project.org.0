Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5FA948CDF
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 12:34:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D687436CC;
	Tue,  6 Aug 2024 12:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D687436CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722940461;
	bh=Xa7ikL07CwO7v5NvJFdMz+B9/6IHLNqvB3+OJfxa9Ig=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tCfsZZfDNVOK0E5WD1j23cLhLf48pl4cBtWILR318anc7EHf3TDZUvkOQeZW7bH5G
	 usBuD7TCgByYjBqUmADzefDhRIz76TkoAUt8q5iMr6U4qqrm1pneQY6txCVzPJ2hHt
	 JD+kPZwRYwFivBefU9ofiiVfLcMQiIf35IjaDMuY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 895D3F805AA; Tue,  6 Aug 2024 12:33:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF0A8F805AE;
	Tue,  6 Aug 2024 12:33:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3486F8023A; Tue,  6 Aug 2024 12:29:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C6C7F805D8
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 12:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C6C7F805D8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=pilJ/Ebi
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ef27bfd15bso4136311fa.2
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Aug 2024 03:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722940035;
 x=1723544835; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PWPNsrWX2yOQoNoUJ3eWdP1AwzsknTGOk+n/VwMy71Y=;
        b=pilJ/Ebi0vhB72gKVFd8ewWIg+WoZzTDESTYzbUhRT6zSDCVQqi7BJ7GOzHiZWPU+i
         23ymxVcZXekY429AfaUsgMfiH0XuBFCTqPuWXEoA57C/NC66YtoRYm9IZyllmkJVukXE
         H7QbEDYi/2XP24+6ILMrmcs4OAo2Df5dtdwhZzn6+b57bD98f1n0ONr+7O2jn/HFfUiO
         bJBjWaX7tkc0Hs4+ebQLUgd2UVh57N56SVWzTNk91sJqhIvNbEqvqFO6zl+WYdiuC+0e
         J0iZg+pywKgZsL6HziFuNMQ5jCIo1ub0wVAnimCERMjIzvaZUxyhrV5vY68/Qqs3XD1A
         zhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722940035; x=1723544835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWPNsrWX2yOQoNoUJ3eWdP1AwzsknTGOk+n/VwMy71Y=;
        b=Kv/K0hhOhdHezOKBB48LJ/jD2BBr51C11qbUk6hQDTYq6M4u0UYTkEBoJYxnTSmmBi
         xBfO0HeLQ5mNHMhK6B+RA3MtyYSY5IX3qrF6vw4GUQdvhWUzpetduersLJE6CIvHdOxz
         uO11L+Cry/gf5XZoS/vlbl0EfxbOM/tI6qD/I3Y+f2mIRdJAXiqbTZN559c94b34loLp
         IFSHp+pIv9tcoyIrsi+6k52K70X+sart9KIq1T6SAI4MpRswQUGkMcuhiAB5WU1Vo16m
         Xg+Njc9SXQWYX7N67rS8somyGgkkYjM1g0Wmwsu4w6A+pEdzYQ0DYfr5Q8mWwg5/ogb2
         Gvvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+11J4ketQ/tPnN816HTsly2gBF2g86Cl6pjAdX7D3OKkt/fYWmNgIp3ZG4MbPECjJnhvI7Xtn+5iq@alsa-project.org
X-Gm-Message-State: AOJu0YyYSqkfcTDi4UWbXD5cdVr3qlZ0ZEOhNVjhCfnqbAAXY+J1A7XD
	kwezjmiycnhMb+1TZeml8xnAYq06Ux7Z3Cz5TUC2czFtUec5NPohKhTCgUQChqY=
X-Google-Smtp-Source: 
 AGHT+IFLNq6D7zUmhFznmLMT/7z1PKPJ2cAodH71RSFK2iNObFZv9SHqiiRmAW23aOKp+qbcYsfsJQ==
X-Received: by 2002:a2e:8696:0:b0:2ef:246e:d04c with SMTP id
 38308e7fff4ca-2f15aab265dmr99425811fa.26.1722940034418;
        Tue, 06 Aug 2024 03:27:14 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:c541:c0a5:2f43:ca78])
        by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-428e4073f7bsm195890475e9.18.2024.08.06.03.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 03:27:14 -0700 (PDT)
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
Subject: [PATCH] ASoC: meson: axg-fifo: fix irq scheduling issue with
 PREEMPT_RT
Date: Tue,  6 Aug 2024 12:27:03 +0200
Message-ID: <20240806102707.3825703-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: USR4OQPLQHHF75G4LAVYWFEA37R53S5Z
X-Message-ID-Hash: USR4OQPLQHHF75G4LAVYWFEA37R53S5Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/USR4OQPLQHHF75G4LAVYWFEA37R53S5Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With PREEMPT_RT enabled, spinlocks become preemptible.
This is usually not a problem with spinlocks used in IRQ context since
IRQ handlers get threaded. However, if IRQF_ONESHOT is set, the upper half
of a threaded irq handler won't be threaded and this causes scheduling
problems if spinlocks are used in the upper half, like with regmap when
'.fast_io' is set.

In this particular instance, it is actually better to do everything in
the bottom half and it solves the problem with PREEMPT_RT.

Reported-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
Closes: https://lore.kernel.org/linux-amlogic/20240729131652.3012327-1-avkrasnov@salutedevices.com
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Fixes: b11d26660dff ("ASoC: meson: axg-fifo: use threaded irq to check periods")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 7e6090af720b..d0d05fa44d66 100644
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
+	/* Use the bottom half of a threaded irq with non-atomic links */
+	ret = request_threaded_irq(fifo->irq, NULL,
+				   axg_fifo_pcm_irq_block,
 				   IRQF_ONESHOT, dev_name(dev), ss);
 	if (ret)
 		return ret;
-- 
2.43.0

