Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56599861AAD
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 18:53:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F0CCDF6;
	Fri, 23 Feb 2024 18:53:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F0CCDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708710828;
	bh=pW74uAnucYIjrEPj94jKbVgAMVavsh0mwkAjnRlWePk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sqT9wMzW2KucCJUzaD9NBJzXYkVZv5dQPqvud7LOwoXwqZ8bLQCg5guEC+a9Cn0TQ
	 Nea4WdanLuAnn7/U5hjiNf24/YPPtFzj93drU6VPEJA7iV82xShtdYYvHvcAQg+aVO
	 +xX8fEG5xXSt7v5xztbb1Avf3AsCdFWrIPiEdXJ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C45FF806A5; Fri, 23 Feb 2024 18:51:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C7E5F80699;
	Fri, 23 Feb 2024 18:51:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FE68F805DA; Fri, 23 Feb 2024 18:51:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CE19F804B0
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 18:51:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CE19F804B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=gxyhoZun
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33d01faf711so1021022f8f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 23 Feb 2024 09:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708710686;
 x=1709315486; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1/AGt7uLQCyc0DA39X/n7sIWq1BnWpXSGWjqPrX0bo=;
        b=gxyhoZunqJxF+z9mpfpt47CN7UFHaJCpfK9wvM/S+h1pIdBc2hkl5CUeEBeJd2hB8t
         XOfhYDuxKXIdQXCmu304FWSdu6JZoDXQi3AGbtlxovuJ8S/+JBku2ulRIRMv6I9VIMJk
         b+tgkYkNGdsXhaU0aJr2/kMM9dH3vi0lYKvMb4DzMpa3NPHYHW3UGMsqP282GpXiGYjq
         iEmh/vs3kE7wU1MTs2YeiCminJtdHoB2krQ1ZT6sPbcjGYQPeVhqT6aQ861rCgkfrdO5
         /NV9RqcTF+tvEgUy4xcuIJ4/wM2IVH0vD+bVHOstiFmZbCDcOLQI66nR1H7hvzbChfHW
         4bBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710686; x=1709315486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1/AGt7uLQCyc0DA39X/n7sIWq1BnWpXSGWjqPrX0bo=;
        b=e67t+t9gkc74BmS9IaLbxRDpTjhIzp1zG+KxfF6tYuopbDp6KbQkBptiCjgzPXFuHG
         scE8KUUO15jgj5HBfVV0w51EMa/bIA+6uzdpQam827+LX1WuDxG41yN6uoAQpT/uYJWh
         Cp7SXWpPqtoxz3n97Y/fHVBl5c2tT8Po8jfa42E1f+kuy20lO13vYCFFBk9AWn/cBNnj
         A8syDIkhjfF6qxMpSpdheqaLKClIxpwVH8QzVbC7e0dpoKBFxAOYHkdgm0ifK4LvapMW
         hBPsXR4Shi9DKXiyHjLIb6YDNwxsC7jd0cHn3uuI6zqMXVodbmTk31syPhJbuMcz+XEy
         krbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8l+KU6Ag0mHnP2jWiOaK05hWZVwpzkNZ8echWPik+A/xUSwhT9OGHwWiHjAZ+OXi+JEpbcqDslb3ZnTNmO3O3NhlH93KGukW6HYY=
X-Gm-Message-State: AOJu0YzsldDyGx/XvFi1DxHn3zYYHYmNrUYw7hkwBn/2eaVQx3V2smLX
	V28wx73JHSmHfHf4DGP/59oQn77EGxVhwouSNJzSe9o2yJscQQWv8oI6O/oFw9s=
X-Google-Smtp-Source: 
 AGHT+IEPePMtPPf0gbB3B54/1cOa4I+uIJLCY5NUhl4hsQw9fY1wMXdm9tzTlTtsJfibzdZNlwi3Gw==
X-Received: by 2002:adf:f984:0:b0:33d:b2d6:b3a6 with SMTP id
 f4-20020adff984000000b0033db2d6b3a6mr300283wrr.48.1708710686707;
        Fri, 23 Feb 2024 09:51:26 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e8a0:25a6:d4ec:a7ff])
        by smtp.googlemail.com with ESMTPSA id
 bo10-20020a056000068a00b0033cddadde6esm3711524wrb.80.2024.02.23.09.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:51:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 6/6] ASoC: meson: axg-fifo: use FIELD helpers
Date: Fri, 23 Feb 2024 18:51:12 +0100
Message-ID: <20240223175116.2005407-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223175116.2005407-1-jbrunet@baylibre.com>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MQM3NAQP3BZARCQOYS3EKN4557GCMNJZ
X-Message-ID-Hash: MQM3NAQP3BZARCQOYS3EKN4557GCMNJZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQM3NAQP3BZARCQOYS3EKN4557GCMNJZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use FIELD_GET() and FIELD_PREP() helpers instead of doing it manually.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c  | 24 ++++++++++++------------
 sound/soc/meson/axg-fifo.h  | 12 +++++-------
 sound/soc/meson/axg-frddr.c |  4 ++--
 sound/soc/meson/axg-toddr.c | 21 +++++++++------------
 4 files changed, 28 insertions(+), 33 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 65541fdb0038..597fd39e6e48 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -145,8 +145,8 @@ int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
 	/* Enable irq if necessary  */
 	irq_en = runtime->no_period_wakeup ? 0 : FIFO_INT_COUNT_REPEAT;
 	regmap_update_bits(fifo->map, FIFO_CTRL0,
-			   CTRL0_INT_EN(FIFO_INT_COUNT_REPEAT),
-			   CTRL0_INT_EN(irq_en));
+			   CTRL0_INT_EN,
+			   FIELD_PREP(CTRL0_INT_EN, irq_en));
 
 	return 0;
 }
@@ -176,9 +176,9 @@ int axg_fifo_pcm_hw_free(struct snd_soc_component *component,
 {
 	struct axg_fifo *fifo = axg_fifo_data(ss);
 
-	/* Disable the block count irq */
+	/* Disable irqs */
 	regmap_update_bits(fifo->map, FIFO_CTRL0,
-			   CTRL0_INT_EN(FIFO_INT_COUNT_REPEAT), 0);
+			   CTRL0_INT_EN, 0);
 
 	return 0;
 }
@@ -187,13 +187,13 @@ EXPORT_SYMBOL_GPL(axg_fifo_pcm_hw_free);
 static void axg_fifo_ack_irq(struct axg_fifo *fifo, u8 mask)
 {
 	regmap_update_bits(fifo->map, FIFO_CTRL1,
-			   CTRL1_INT_CLR(FIFO_INT_MASK),
-			   CTRL1_INT_CLR(mask));
+			   CTRL1_INT_CLR,
+			   FIELD_PREP(CTRL1_INT_CLR, mask));
 
 	/* Clear must also be cleared */
 	regmap_update_bits(fifo->map, FIFO_CTRL1,
-			   CTRL1_INT_CLR(FIFO_INT_MASK),
-			   0);
+			   CTRL1_INT_CLR,
+			   FIELD_PREP(CTRL1_INT_CLR, 0));
 }
 
 static irqreturn_t axg_fifo_pcm_irq_block(int irq, void *dev_id)
@@ -204,7 +204,7 @@ static irqreturn_t axg_fifo_pcm_irq_block(int irq, void *dev_id)
 
 	regmap_read(fifo->map, FIFO_STATUS1, &status);
 
-	status = STATUS1_INT_STS(status) & FIFO_INT_MASK;
+	status = FIELD_GET(STATUS1_INT_STS, status);
 	if (status & FIFO_INT_COUNT_REPEAT)
 		snd_pcm_period_elapsed(ss);
 	else
@@ -254,15 +254,15 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 
 	/* Setup status2 so it reports the memory pointer */
 	regmap_update_bits(fifo->map, FIFO_CTRL1,
-			   CTRL1_STATUS2_SEL_MASK,
-			   CTRL1_STATUS2_SEL(STATUS2_SEL_DDR_READ));
+			   CTRL1_STATUS2_SEL,
+			   FIELD_PREP(CTRL1_STATUS2_SEL, STATUS2_SEL_DDR_READ));
 
 	/* Make sure the dma is initially disabled */
 	__dma_enable(fifo, false);
 
 	/* Disable irqs until params are ready */
 	regmap_update_bits(fifo->map, FIFO_CTRL0,
-			   CTRL0_INT_EN(FIFO_INT_MASK), 0);
+			   CTRL0_INT_EN, 0);
 
 	/* Clear any pending interrupt */
 	axg_fifo_ack_irq(fifo, FIFO_INT_MASK);
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index a14c31eb06d8..4c48c0a08481 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -40,21 +40,19 @@ struct snd_soc_pcm_runtime;
 
 #define FIFO_CTRL0			0x00
 #define  CTRL0_DMA_EN			BIT(31)
-#define  CTRL0_INT_EN(x)		((x) << 16)
+#define  CTRL0_INT_EN			GENMASK(23, 16)
 #define  CTRL0_SEL_MASK			GENMASK(2, 0)
 #define  CTRL0_SEL_SHIFT		0
 #define FIFO_CTRL1			0x04
-#define  CTRL1_INT_CLR(x)		((x) << 0)
-#define  CTRL1_STATUS2_SEL_MASK		GENMASK(11, 8)
-#define  CTRL1_STATUS2_SEL(x)		((x) << 8)
+#define  CTRL1_INT_CLR			GENMASK(7, 0)
+#define  CTRL1_STATUS2_SEL		GENMASK(11, 8)
 #define   STATUS2_SEL_DDR_READ		0
-#define  CTRL1_FRDDR_DEPTH_MASK		GENMASK(31, 24)
-#define  CTRL1_FRDDR_DEPTH(x)		((x) << 24)
+#define  CTRL1_FRDDR_DEPTH		GENMASK(31, 24)
 #define FIFO_START_ADDR			0x08
 #define FIFO_FINISH_ADDR		0x0c
 #define FIFO_INT_ADDR			0x10
 #define FIFO_STATUS1			0x14
-#define  STATUS1_INT_STS(x)		((x) << 0)
+#define  STATUS1_INT_STS		GENMASK(7, 0)
 #define FIFO_STATUS2			0x18
 #define FIFO_INIT_ADDR			0x24
 #define FIFO_CTRL2			0x28
diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 98140f449eb3..97ca0ea5faa5 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -59,8 +59,8 @@ static int axg_frddr_dai_hw_params(struct snd_pcm_substream *substream,
 	/* Trim the FIFO depth if the period is small to improve latency */
 	depth = min(period, fifo->depth);
 	val = (depth / AXG_FIFO_BURST) - 1;
-	regmap_update_bits(fifo->map, FIFO_CTRL1, CTRL1_FRDDR_DEPTH_MASK,
-			   CTRL1_FRDDR_DEPTH(val));
+	regmap_update_bits(fifo->map, FIFO_CTRL1, CTRL1_FRDDR_DEPTH,
+			   FIELD_PREP(CTRL1_FRDDR_DEPTH, val));
 
 	return 0;
 }
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index 32ee45cce7f8..5b08b4e841ad 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -19,12 +19,9 @@
 #define CTRL0_TODDR_EXT_SIGNED		BIT(29)
 #define CTRL0_TODDR_PP_MODE		BIT(28)
 #define CTRL0_TODDR_SYNC_CH		BIT(27)
-#define CTRL0_TODDR_TYPE_MASK		GENMASK(15, 13)
-#define CTRL0_TODDR_TYPE(x)		((x) << 13)
-#define CTRL0_TODDR_MSB_POS_MASK	GENMASK(12, 8)
-#define CTRL0_TODDR_MSB_POS(x)		((x) << 8)
-#define CTRL0_TODDR_LSB_POS_MASK	GENMASK(7, 3)
-#define CTRL0_TODDR_LSB_POS(x)		((x) << 3)
+#define CTRL0_TODDR_TYPE		GENMASK(15, 13)
+#define CTRL0_TODDR_MSB_POS		GENMASK(12, 8)
+#define CTRL0_TODDR_LSB_POS		GENMASK(7, 3)
 #define CTRL1_TODDR_FORCE_FINISH	BIT(25)
 #define CTRL1_SEL_SHIFT			28
 
@@ -76,12 +73,12 @@ static int axg_toddr_dai_hw_params(struct snd_pcm_substream *substream,
 	width = params_width(params);
 
 	regmap_update_bits(fifo->map, FIFO_CTRL0,
-			   CTRL0_TODDR_TYPE_MASK |
-			   CTRL0_TODDR_MSB_POS_MASK |
-			   CTRL0_TODDR_LSB_POS_MASK,
-			   CTRL0_TODDR_TYPE(type) |
-			   CTRL0_TODDR_MSB_POS(TODDR_MSB_POS) |
-			   CTRL0_TODDR_LSB_POS(TODDR_MSB_POS - (width - 1)));
+			   CTRL0_TODDR_TYPE |
+			   CTRL0_TODDR_MSB_POS |
+			   CTRL0_TODDR_LSB_POS,
+			   FIELD_PREP(CTRL0_TODDR_TYPE, type) |
+			   FIELD_PREP(CTRL0_TODDR_MSB_POS, TODDR_MSB_POS) |
+			   FIELD_PREP(CTRL0_TODDR_LSB_POS, TODDR_MSB_POS - (width - 1)));
 
 	return 0;
 }
-- 
2.43.0

