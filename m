Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94695468C8A
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Dec 2021 19:10:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1458C1FE6;
	Sun,  5 Dec 2021 19:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1458C1FE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638727818;
	bh=HVRiSdzyaAhHEqNjYsCiyF/YVqzF8HUB8m4HmLS2fa4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RB+s8j8XNSEqL8cW3N92zsZYGwwGY1USUgM0t/DViTZL/6A7vyF3b+WfXqpWKnL8m
	 GnBCFZs4XtUJU8nnr3vCu/kJbnvAukaMokQoc+YXRlqoUd2sA+u2sb1Gy11vTa5d9A
	 ERQjzANNb21iCJ5bHaSu6McsbBf9z9kGezAYDU04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC492F8032B;
	Sun,  5 Dec 2021 19:08:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AC4FF80259; Sun,  5 Dec 2021 19:08:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61EB1F80217
 for <alsa-devel@alsa-project.org>; Sun,  5 Dec 2021 19:08:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61EB1F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.b="el1s2Fn6"
Received: by mail-wm1-x32c.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso8756631wms.3
 for <alsa-devel@alsa-project.org>; Sun, 05 Dec 2021 10:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rF5hjb+HWpI1Ih1xwXVy9ddAAkLWiFGmzep35P6NJa8=;
 b=el1s2Fn6aF3tZlnWmb8zajw9s3UfJDaH4P7gRXmjfZ0zEuwgbQ10kfgx4IMio5hn1p
 Uu01lLR2bp1mP5HcalLld668UrcpEogLnqglK6gQCNhsPWYfbVpdwz9cJObju0IwJkgt
 2in494V04RNe3zH+i10XdrbAXd6bPXEGKLAZGg7DNpMw1IDcQNMYGoI59YjQEBOv5MaW
 xrfgtJ7jhiSODqLz00ZmPrE7MECID4hKFta7CvplgqryADVCiT3PF43MxF7tSnrgBrr0
 FB7KKHgoNBy1H004sZN+ugdwQY4TeZtSiEMQv4aYM5JaHO3omtBdMj03KvEsC5cavoC3
 m2ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rF5hjb+HWpI1Ih1xwXVy9ddAAkLWiFGmzep35P6NJa8=;
 b=t0AYTlNtGx7hm+3VVmoZ5/MvwKZAUsV4AaFdHdFSea2K4ZAI0KX2rM91XaoQ9KGoid
 YLrbQavukVNJr2FXey6DSKIoY4bwO+gkuwsLcscqv42T9FCMKdiA7XtlfvVmwhWUkaD0
 kdMOZ2CFy2MfNkyRpfUscNIyV+bo4dM4E6TWqEId2nS5CogXurz0hUSbvuGii8I5uwT/
 Nip9K46sU1lsjFu66GsWydkvR8vBn7KKD5e4iayVXtJZo6o08shM7zwIo/LzGxx6AR01
 bVovV0f7hmV6k4qarSRgh4glh0rnZbl5/0xQu7IzBv3/yQFIiBlZTZYqrC0F0r5CrQZO
 iW3g==
X-Gm-Message-State: AOAM530FPUCrnGvllETe8dE8m2zc056Z/PKMx72wFYum89ERxrbk14mZ
 USRwdhU+fc/oJKWY9yBoXYM=
X-Google-Smtp-Source: ABdhPJxFtMAxnY+guAh4BzBOqq0b0PVbyY4w9h4fGaJTVCB19FDi+PDoMvxlhtL74NWjjqZg6FhP0A==
X-Received: by 2002:a1c:20d3:: with SMTP id
 g202mr33026556wmg.129.1638727706049; 
 Sun, 05 Dec 2021 10:08:26 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c11b-a200-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c11b:a200:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id x13sm9250551wrr.47.2021.12.05.10.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 10:08:25 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 alsa-devel@alsa-project.org
Subject: [PATCH RFC v1 0/2] ASoC: meson: aiu: two fixes
Date: Sun,  5 Dec 2021 19:08:14 +0100
Message-Id: <20211205180816.2083864-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hello Jerome,

in this series I am proposing two fixes for the "aiu" driver, used on
Amlogic Meson8, Meson8b, Meson8m2, GXBB, GXL and GXM SoCs.

The first patch is the result of me trying to understand the way how
we get the DMA buffer and address for the audio data. I'm not an expert
in terms of DMA. From what I understand we need to inform DMA core
about the limitations of the hardware. In case of AIU it's DMA address
registers only take 32 bits, so DMA core should be aware of this.

The second patch is what I could come up with to fix the infamous I2S
buffer underrun issue, also called the "machine gun noise" (MGN) bug.
After a lot of testing, debugging and comparing vendor code with the
upstream "aiu" driver I have come up with this fix. I have written down
my thoughts in the description of that patch. To be clear: these are my
thoughts, unfortunately I have no way of proving this other than asking
other people to test this patch (off-list I have already received
positive feedback along with confirmation that both 2-ch and 6-ch audio
are still working fine. Even with Kodi's menu - which is an easy way to
reproduce the MGN bug - sound output is fine with this patch).

Please let me know what you think about these patches and especially
the patch descriptions.


Martin Blumenstingl (2):
  ASoC: meson: aiu: fifo: Add missing dma_coerce_mask_and_coherent()
  ASoC: meson: aiu: Move AIU_I2S_MISC hold setting to aiu-fifo-i2s

 sound/soc/meson/aiu-encoder-i2s.c | 33 -------------------------------
 sound/soc/meson/aiu-fifo-i2s.c    | 12 +++++++++++
 sound/soc/meson/aiu-fifo.c        |  6 ++++++
 3 files changed, 18 insertions(+), 33 deletions(-)

-- 
2.34.1

