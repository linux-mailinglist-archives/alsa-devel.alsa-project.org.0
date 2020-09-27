Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0237927A2C5
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Sep 2020 21:33:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36B031930;
	Sun, 27 Sep 2020 21:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36B031930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601235217;
	bh=LP+ukeao2wFWPrDmvkkQRi6TuTriSEE0BclSACp990k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JHzcyA7ptWQOHhxCPmlh8EH/xz5P6v5dqiaW7SUSfpIrGnCoAuKZ/NTfOMjCK9OkX
	 2QYuYZ353LIUr1MO5nSUOckcfwUT4C4tUwjYhmEpQtg2z4ySycxSubePAIkf966QF2
	 MNqx3qJZeOrJSNaF0CGcPXcKPKHZY49qBoql1oQc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63E59F801F5;
	Sun, 27 Sep 2020 21:29:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 336CDF802D2; Sun, 27 Sep 2020 21:29:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40A9BF800B5
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40A9BF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VpmgE9hK"
Received: by mail-wm1-x344.google.com with SMTP id s13so4377609wmh.4
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 12:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LfoOimVfCN8iFpUENEv9ik5I5IDM2MMc9g699qzOgnE=;
 b=VpmgE9hKsKx/id8FAUpypRINdZZZJDQA2g5lwliDvvPG9+wLh7mwSHeREEXM+3IGo6
 JM4Zsn9otlHItLDUZVOeoSoYYSelVp8w6u84cVugy6ngjkiT0vVSotxMPshnjYhjQKce
 rsy3mzyWMgCzDJ/9o5OkR+MnDXsWjR6EBkFkRT5xUzbWShpRXN/kKk2IvkG+1yG7lCg8
 5/QR7CLhtajvWc3epZeTnRoDNPjefVyXdAQUK08bHmvw4Mj5n1ais1esclJnVyskfSiy
 +bBKwryUU+zccngaYsykzxsW7MX72TzEyen+G0f+zx8+POtGMz4mDz0clZzuF+00Az8I
 rBSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LfoOimVfCN8iFpUENEv9ik5I5IDM2MMc9g699qzOgnE=;
 b=JQYanGvRGDfM7qfHTUNCq6cmJ9uhRRrk2VMCLIrBcbnLGlIk46XExXl3Uv7UO7FGgF
 J0kYFiGlbDFnXszysvfOpTV5ul4vgt3eHBtDDifEv+cINUn0i6OcMnFS/Onmuar7wlNL
 rOMDVQTVhe6BweWIQqvuUnsTqDIbOx2wGKsWDOwckVZL7quPB7pr3J6ZroGa+GIqnQVk
 f3TByadxLlK6p2p4F30ylaanvCIoFY45t/iszW66xopT6YUWO4nEJwqsqWVngYDEDehw
 2Bw4Glfsrt6k0CvGiX6cb4AXb+hnubG4D0l26aihZd6LX4IgePKMMuWou94EsfHupOwf
 CsyA==
X-Gm-Message-State: AOAM530e2soCd6YKm9kjsa7Ysl/0C9HO8haokSnPUzhfj0VHNV9Q2U+s
 TD1JAW5jL35RnVQ18sTUQPM=
X-Google-Smtp-Source: ABdhPJw3iZIupzVBEAEZQV7hiP0OWDYQ3Rq8IdNg9/nxOE6mZ0V/lg0E7tgNoNIB3xWEaiYI1jaNUQ==
X-Received: by 2002:a1c:6a14:: with SMTP id f20mr7949339wmc.81.1601234961223; 
 Sun, 27 Sep 2020 12:29:21 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id n21sm6149609wmi.21.2020.09.27.12.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 12:29:20 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 03/20] ASoC: sun4i-i2s: Change get_sr() and get_wss() to be
 more explicit
Date: Sun, 27 Sep 2020 21:28:55 +0200
Message-Id: <20200927192912.46323-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200927192912.46323-1-peron.clem@gmail.com>
References: <20200927192912.46323-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
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

We are actually using a complex formula to just return a bunch of
simple values. Also this formula is wrong for sun4i when calling
get_wss() the function return 4 instead of 3.

Replace this with a simpler switch case.

Also drop the i2s params which is unused and return a simple int as
returning an error code could be out of range for an s8 and there is
no optim to return a s8 here.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 69 +++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 0633b9fba3d7..11bbcbe24d6b 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -175,8 +175,8 @@ struct sun4i_i2s_quirks {
 	unsigned int			num_mclk_dividers;
 
 	unsigned long (*get_bclk_parent_rate)(const struct sun4i_i2s *);
-	s8	(*get_sr)(const struct sun4i_i2s *, int);
-	s8	(*get_wss)(const struct sun4i_i2s *, int);
+	int	(*get_sr)(unsigned int width);
+	int	(*get_wss)(unsigned int width);
 	int	(*set_chan_cfg)(const struct sun4i_i2s *i2s,
 				unsigned int channels,	unsigned int slots,
 				unsigned int slot_width);
@@ -381,37 +381,56 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static s8 sun4i_i2s_get_sr(const struct sun4i_i2s *i2s, int width)
+static int sun4i_i2s_get_sr(unsigned int width)
 {
-	if (width < 16 || width > 24)
-		return -EINVAL;
-
-	if (width % 4)
-		return -EINVAL;
+	switch (width) {
+	case 16:
+		return 0x0;
+	case 20:
+		return 0x1;
+	case 24:
+		return 0x2;
+	}
 
-	return (width - 16) / 4;
+	return -EINVAL;
 }
 
-static s8 sun4i_i2s_get_wss(const struct sun4i_i2s *i2s, int width)
+static int sun4i_i2s_get_wss(unsigned int width)
 {
-	if (width < 16 || width > 32)
-		return -EINVAL;
-
-	if (width % 4)
-		return -EINVAL;
+	switch (width) {
+	case 16:
+		return 0x0;
+	case 20:
+		return 0x1;
+	case 24:
+		return 0x2;
+	case 32:
+		return 0x3;
+	}
 
-	return (width - 16) / 4;
+	return -EINVAL;
 }
 
-static s8 sun8i_i2s_get_sr_wss(const struct sun4i_i2s *i2s, int width)
+static int sun8i_i2s_get_sr_wss(unsigned int width)
 {
-	if (width % 4)
-		return -EINVAL;
-
-	if (width < 8 || width > 32)
-		return -EINVAL;
+	switch (width) {
+	case 8:
+		return 0x1;
+	case 12:
+		return 0x2;
+	case 16:
+		return 0x3;
+	case 20:
+		return 0x4;
+	case 24:
+		return 0x5;
+	case 28:
+		return 0x6;
+	case 32:
+		return 0x7;
+	}
 
-	return (width - 8) / 4 + 1;
+	return -EINVAL;
 }
 
 static int sun4i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
@@ -572,11 +591,11 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 	i2s->playback_dma_data.addr_width = width;
 
-	sr = i2s->variant->get_sr(i2s, word_size);
+	sr = i2s->variant->get_sr(word_size);
 	if (sr < 0)
 		return -EINVAL;
 
-	wss = i2s->variant->get_wss(i2s, slot_width);
+	wss = i2s->variant->get_wss(slot_width);
 	if (wss < 0)
 		return -EINVAL;
 
-- 
2.25.1

