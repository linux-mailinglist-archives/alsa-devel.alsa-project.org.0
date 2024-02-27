Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B089C8699E0
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 16:09:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F188868;
	Tue, 27 Feb 2024 16:09:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F188868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709046566;
	bh=CF9ksCBOv+MUtNkjns/I2Bo5e82H43x94XzTqTwRRCY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=r1FcPFOBuJ6u863/JY8Xwg+te27KuCNW6AyMpoksUSfuR+PBKpUiaIHsCFnar0uNh
	 4de2Oj56iBI/G6dKA65a+vW1Q0J9MjtDFArb3YrbApM7MhEAuw2i+vOyyXXiDz4Hpr
	 BNt5GTBuolJ/dnBdIQnDm78CumzA0FLCxeaJbTJk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2A38F80588; Tue, 27 Feb 2024 16:08:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B41A7F8059F;
	Tue, 27 Feb 2024 16:08:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1040DF801C0; Tue, 27 Feb 2024 16:08:48 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B8597F800F0
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 16:08:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8597F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=gf2pUAQE
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33d90dfe73cso2994286f8f.0
        for <alsa-devel@alsa-project.org>;
 Tue, 27 Feb 2024 07:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709046511;
 x=1709651311; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+v6m3GvEp/53IVFZlfJK0md8YDFfRhBDS5EvRlYK31M=;
        b=gf2pUAQEPSe3ppgS9kEw2hHuxJvn4FkFvk11FPDQc3ppIdrkwUFz8CNnz7YVn1wpSS
         fMXesvu/tv8sBFGyjnfQy2NJ+I1d3RYs1szfEcJvY02Rx3ksHeI5PaPDtYl8/SBsbo1P
         G9bXX4suofzKUkEWCDhNc8Ugp6xFtjY7kuSU9wLO4it8sp4skXEefMpl0G3YKLwtX2Kn
         wI6skIftulG5LcXagKuRX52miTY7CEgoH1J8cReyVTRLQYE3THSvS1NqTCn6TkzH4TPU
         tlSseCDfukSh1glKwXDTXqa8Uacl7TE3urkW2AJJu0bN7G9grRbAUfdZenwGR8CkPo/b
         19Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709046511; x=1709651311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+v6m3GvEp/53IVFZlfJK0md8YDFfRhBDS5EvRlYK31M=;
        b=gJoRp4b7Q4mumk3t0yE6bWZZQs6H505IGNhWsvv+0gszbhvCQyocEpO0vgn7y6wdyZ
         5ublaU8awRIuAHQbLJ2GSamsHyMhOo7TEf0+pRSTDdTqnpt3sA7xILdiAd5jdPon8qHS
         Oqqc9niVijbhKwlPB/dsLV+eaachz5QuXIGdpj2LihHctL6YJ7L8GxIVlfeUlWQQLceh
         ylf7u9YZQnUoUQk/lHzMWZOZzrawmS7F2x6hX4aRAuQBA75Joo+1OUnr7omU4TSCiJZe
         E7W7WHEMd67fxx/XHI/Kl4nlZpZMmorr+IyGZz/vmv8XT5BjnvPNAO/IQbDC9lMk/lN1
         +/WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpE1KBuDC3pNajGBeC5QnTNWSmJ90gTl/OVcssJjb6MiM9ONBzOlELKAynScXn/TFBE2iV+TyN532l3s2KCNjrq89YI8MmdSBgdQ0=
X-Gm-Message-State: AOJu0YzDgk5QTMH2DroPlU7rd5boaCdJ4/G725qR9xhj04tIC8LSCgJD
	J/ZHrbV+Nq5AzaSLhZVXVGsnyFtlakYayfAJqRLHVbpLHxLCaQngBxy4jy2aws8=
X-Google-Smtp-Source: 
 AGHT+IFm/XZg09NTqX5TssJ/3GJF0wzYhM9ccuLpqG2Z2vxwRZ4k+Ku7JKCZxOttih/m+MCrjG4sTw==
X-Received: by 2002:adf:ec01:0:b0:33d:e02a:c552 with SMTP id
 x1-20020adfec01000000b0033de02ac552mr5113789wrn.34.1709046511097;
        Tue, 27 Feb 2024 07:08:31 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:730:ce44:dedb:c94b])
        by smtp.googlemail.com with ESMTPSA id
 by15-20020a056000098f00b0033da933b250sm11847249wrb.5.2024.02.27.07.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 07:08:30 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2] ASoC: meson: axg-fifo: use FIELD helpers
Date: Tue, 27 Feb 2024 16:08:25 +0100
Message-ID: <20240227150826.573581-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IJJVN6KQIBD63RBEKEJHOBS2LWUTXFMP
X-Message-ID-Hash: IJJVN6KQIBD63RBEKEJHOBS2LWUTXFMP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IJJVN6KQIBD63RBEKEJHOBS2LWUTXFMP/>
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

Changes since v1: [1]
 * Add missing include <linux/bitfield.h> causing build error
   with x86 compile test.

[1]: http://lore.kernel.org/alsa-devel/20240223175116.2005407-7-jbrunet@baylibre.com

 sound/soc/meson/axg-fifo.c  | 25 +++++++++++++------------
 sound/soc/meson/axg-fifo.h  | 12 +++++-------
 sound/soc/meson/axg-frddr.c |  5 +++--
 sound/soc/meson/axg-toddr.c | 22 ++++++++++------------
 4 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 65541fdb0038..bebee0ca8e38 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2018 BayLibre, SAS.
 // Author: Jerome Brunet <jbrunet@baylibre.com>
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
@@ -145,8 +146,8 @@ int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
 	/* Enable irq if necessary  */
 	irq_en = runtime->no_period_wakeup ? 0 : FIFO_INT_COUNT_REPEAT;
 	regmap_update_bits(fifo->map, FIFO_CTRL0,
-			   CTRL0_INT_EN(FIFO_INT_COUNT_REPEAT),
-			   CTRL0_INT_EN(irq_en));
+			   CTRL0_INT_EN,
+			   FIELD_PREP(CTRL0_INT_EN, irq_en));
 
 	return 0;
 }
@@ -176,9 +177,9 @@ int axg_fifo_pcm_hw_free(struct snd_soc_component *component,
 {
 	struct axg_fifo *fifo = axg_fifo_data(ss);
 
-	/* Disable the block count irq */
+	/* Disable irqs */
 	regmap_update_bits(fifo->map, FIFO_CTRL0,
-			   CTRL0_INT_EN(FIFO_INT_COUNT_REPEAT), 0);
+			   CTRL0_INT_EN, 0);
 
 	return 0;
 }
@@ -187,13 +188,13 @@ EXPORT_SYMBOL_GPL(axg_fifo_pcm_hw_free);
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
@@ -204,7 +205,7 @@ static irqreturn_t axg_fifo_pcm_irq_block(int irq, void *dev_id)
 
 	regmap_read(fifo->map, FIFO_STATUS1, &status);
 
-	status = STATUS1_INT_STS(status) & FIFO_INT_MASK;
+	status = FIELD_GET(STATUS1_INT_STS, status);
 	if (status & FIFO_INT_COUNT_REPEAT)
 		snd_pcm_period_elapsed(ss);
 	else
@@ -254,15 +255,15 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 
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
index 98140f449eb3..e97d43ae7fd2 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -7,6 +7,7 @@
  * This driver implements the frontend playback DAI of AXG and G12A based SoCs
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/regmap.h>
 #include <linux/module.h>
@@ -59,8 +60,8 @@ static int axg_frddr_dai_hw_params(struct snd_pcm_substream *substream,
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
index 32ee45cce7f8..e03a6e21c1c6 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -5,6 +5,7 @@
 
 /* This driver implements the frontend capture DAI of AXG based SoCs */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/regmap.h>
 #include <linux/module.h>
@@ -19,12 +20,9 @@
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
 
@@ -76,12 +74,12 @@ static int axg_toddr_dai_hw_params(struct snd_pcm_substream *substream,
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

