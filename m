Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 067FF25CA8B
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:33:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0DA61938;
	Thu,  3 Sep 2020 22:32:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0DA61938
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165200;
	bh=pb1hwvyuLU1Ze/XQrAgcMlg+2b5W5F2aeoRwka9kXF4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k5GL5/uKt8ZWq4+NryNQkvQh0s0FhimfHGUIin6PT61JNjffClXYJqpvrluz3aYFc
	 gV+UUAMuaxMOeO4gXUuEAMp+MRvqQyvamlJivhBzxAgU5ypYzTS7iSNuoSKEdYQz0y
	 qTkZ1Nb/+ihw+I5AFsS58VRj+PzgrJjnaFkrofF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F62AF8020D;
	Thu,  3 Sep 2020 22:30:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B11CF802A1; Thu,  3 Sep 2020 22:30:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE121F801DA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE121F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JFMsoPly"
Received: by mail-wm1-x343.google.com with SMTP id l9so4131786wme.3
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 13:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UhOFrQ6qfsRT/zbm84NK9LroiUxtwPSR9pzAEC7Suno=;
 b=JFMsoPlyGtgBGt24O6d0Z2GCxKVLK+IYNemL5MJdARV1G8W1XXtfyOdWLa0GApOIn4
 CbbB6eEVcn6k9FawxC6TrC292zmqD021A1fz4iyUM4ZUqlccNtkLAnxn9HDCP8x8uQoG
 rbWgJSA8VYpnR74P4O6uHsWRnuKOmrNdffp1LIf+RVxfNm138dSYu0OfSBPgoUWwQIS0
 OYVRot6DoyQST1V4eijt6BQHY6tW4rhRhLmhAm1tZC154OYTIJ0voy7Fu55++YjW7ZFu
 B9MiGteEt/IldzUGwKeT3fLpzwOgnnyAJ952vLn1zPjKcM2q24YqD4QvexL2SevOtytE
 dOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UhOFrQ6qfsRT/zbm84NK9LroiUxtwPSR9pzAEC7Suno=;
 b=loajI0qDOCYh2bBM9S4l6D+nQhQeACvjGZUc9Qzgy4h6tDpInxZk85bogNGRxmrydt
 In/FvaoBSV180tGB3qeRsrmv0WfRMtwaxQ4XEjgqGfLqYOgOCRgid1Tr9f8tffe+OBGR
 kJdufeONy0KHDIYY34CAM8LeDKyC9PZYPv6BrPSa7vdZuvn6nAwtY0dNGWDWkHknZxkE
 xKEWX8eRMrfy/2ePZvypvgOLdvdy5uJybr0ZQSVUYjscnx6xEPwcSBRAZa9Ou10iiYrX
 nnLiNna9h4tBsa0rykxNStD+cPseLfeaZt8Y3LOWH9DBXFhsS2QmR/mIXYktXWMfqmk/
 ymxQ==
X-Gm-Message-State: AOAM531kUwZY+v8K6sUtNzmUlSW2FWD/8EzWCme7goe+nXS9U8Unvj1O
 2yCKl11ckluOK0tj4wvp4nc=
X-Google-Smtp-Source: ABdhPJxFPdJWP5bs+Yfd6VN8HjhX9dy6LULxDIz3bk0NEQYa1SFSpokHHgBIJt0OuBT3VbISemQnkQ==
X-Received: by 2002:a1c:7405:: with SMTP id p5mr4197688wmc.35.1599165044454;
 Thu, 03 Sep 2020 13:30:44 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id q186sm6818274wma.45.2020.09.03.13.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:30:43 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 01/20] Revert "ASoC: sun4i-i2s: Fix the LRCK polarity"
Date: Thu,  3 Sep 2020 22:30:15 +0200
Message-Id: <20200903203034.1057334-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903203034.1057334-1-peron.clem@gmail.com>
References: <20200903203034.1057334-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
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

This reverts commit dd657eae8164f7e4bafe8b875031a7c6c50646a9.

There was a misinterpretation of the analysis using a scope.
After rechecking this using a logical analyzer the LRCK polarity is
fine.

Fixes: dd657eae8164 ("ASoC: sun4i-i2s: Fix the LRCK polarity")
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index f23ff29e7c1d..fabff7bcccbc 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -603,29 +603,23 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 	u32 mode, val;
 	u8 offset;
 
-	/*
-	 * DAI clock polarity
-	 *
-	 * The setup for LRCK contradicts the datasheet, but under a
-	 * scope it's clear that the LRCK polarity is reversed
-	 * compared to the expected polarity on the bus.
-	 */
+	/* DAI clock polarity */
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
 	case SND_SOC_DAIFMT_IB_IF:
 		/* Invert both clocks */
-		val = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED;
+		val = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED |
+		      SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
 		break;
 	case SND_SOC_DAIFMT_IB_NF:
 		/* Invert bit clock */
-		val = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED |
-		      SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
+		val = SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED;
 		break;
 	case SND_SOC_DAIFMT_NB_IF:
 		/* Invert frame clock */
-		val = 0;
+		val = SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
 		break;
 	case SND_SOC_DAIFMT_NB_NF:
-		val = SUN8I_I2S_FMT0_LRCLK_POLARITY_INVERTED;
+		val = 0;
 		break;
 	default:
 		return -EINVAL;
-- 
2.25.1

