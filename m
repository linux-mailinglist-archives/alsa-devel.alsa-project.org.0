Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB738619292
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 09:17:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA4CA167B;
	Fri,  4 Nov 2022 09:16:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA4CA167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667549865;
	bh=7ucb8BPK0zlQNy7Zr3kpJxiV+K4vaiF2ELEMLb9fFms=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ns/T7hvm2XS5q19eGQj3PWKpwo9w0eqrLZU0UJFXILQWqL6oIrBqWpGkqlif8TIM/
	 6+uKu5E8zUxHQjZR1EZQ+aoJbcBrzsPurg4HR8QApLzJ65m1HSGYQ1CNIesaG67GQ+
	 rUdr8Ob9X9VatsMrObMuax6bpwcT5wd8E4kFs1/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C437EF80552;
	Fri,  4 Nov 2022 09:16:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFE2EF8051F; Thu,  3 Nov 2022 14:15:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAA21F800BF
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 14:15:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAA21F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="JUHecEph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667481347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uxs3/q0q6AMOjvn/NBkbxt+h2qoRa/eYcqVm0+4ic8c=;
 b=JUHecEphmVg5HCrUt5LAwRtLoPNulFO0pq/OM02xXZyr2LcIdEpu2qnk2e13FyVA2DtMgj
 gRf4kcTfqS2QICgluHaDTtGoCOfjxQxe1Odtm0DMxwkofjtIQlWUymfO06Oel0QylH1K+0
 i/PC3ZaXmxGp843c/Wv+O7XAs5oqAWM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-383-JLwpPHJMM-Ceg4UdFlTmUA-1; Thu, 03 Nov 2022 09:15:43 -0400
X-MC-Unique: JLwpPHJMM-Ceg4UdFlTmUA-1
Received: by mail-qt1-f199.google.com with SMTP id
 fz10-20020a05622a5a8a00b003a4f466998cso1782572qtb.16
 for <alsa-devel@alsa-project.org>; Thu, 03 Nov 2022 06:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uxs3/q0q6AMOjvn/NBkbxt+h2qoRa/eYcqVm0+4ic8c=;
 b=hBBoKMsveVNcyo+SOlIdCdRf5mVW+oYCWNmDUWYTXhG6DfucLoy3eLxvYWtTdtbNQn
 ymWg/OeHHKI+NRoXIANGJ5PeVr0XI3ER00YBrDaCyZdiwlnrqf+1AwAag7pfvyv7sTh1
 OXBzUpoA8OSMwhzsRApm8nT2Tv/M5h/d5hw9xjMqVtWe17d1U+V9cT5Qu8Mva207+Yzi
 Thb6eNgB8G2cEHvE5jmHAEmbTz6z7dcswqY60Aquje6tvS3PG2RoxBo1AReB8X/+Gzmk
 qVUUCnI+9+lVYMf/nObdp49eOsOrUGhA0wI0OY8fBzwHjSYJkEFeqVTrzkAoDKA9avSE
 4ylQ==
X-Gm-Message-State: ACrzQf2k7936JjxAiaXZ5QKQDK2xV/LafLR4oCuvYkd6L9XjqcFOK4sY
 ol5kIk3aju8eH4rdDNN/pgx87JTpuz8veYVuVuffOh1CrwbY1UKp/mS+A3vJk47XL06OgI3GIzq
 eCMaumo0DE1ry+QOkHptN4j0=
X-Received: by 2002:ad4:5763:0:b0:4af:b800:be6b with SMTP id
 r3-20020ad45763000000b004afb800be6bmr27135106qvx.70.1667481342768; 
 Thu, 03 Nov 2022 06:15:42 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7wkWwSvE6CHEup2Ef6gKWqj9ltK6zJLHkALp15tzqRFgB62fZSsYulXaxwOSpn1PVBkiMlpw==
X-Received: by 2002:ad4:5763:0:b0:4af:b800:be6b with SMTP id
 r3-20020ad45763000000b004afb800be6bmr27135055qvx.70.1667481342442; 
 Thu, 03 Nov 2022 06:15:42 -0700 (PDT)
Received: from p1.montleon.intra (066-026-073-226.inf.spectrum.com.
 [66.26.73.226]) by smtp.gmail.com with ESMTPSA id
 s8-20020a05620a16a800b006ed30a8fb21sm715086qkj.76.2022.11.03.06.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:15:41 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: pierre-louis.bossart@linux.intel.com
Subject: [PATCH v2 1/2] ASoC: rt5514: fix legacy dai naming
Date: Thu,  3 Nov 2022 09:11:43 -0400
Message-Id: <20221103131144.2942-1-jmontleo@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <87v8nwmgso.wl-tiwai@suse.de>
References: <87v8nwmgso.wl-tiwai@suse.de>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Fri, 04 Nov 2022 09:16:01 +0100
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, regressions@lists.linux.dev,
 jmontleo@redhat.com, cezary.rojewski@intel.com, tiwai@suse.com,
 broonie@kernel.org
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

Starting with 6.0-rc1 these messages are logged and the sound card
is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
it to function properly again.

[   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
spi-PRP0001:00 not registered
[   16.928561] platform kbl_r5514_5663_max: deferred probe pending
---
 sound/soc/codecs/rt5514-spi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 1a25a3787935..362663abcb89 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -298,13 +298,14 @@ static int rt5514_spi_pcm_new(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver rt5514_spi_component = {
-	.name		= DRV_NAME,
-	.probe		= rt5514_spi_pcm_probe,
-	.open		= rt5514_spi_pcm_open,
-	.hw_params	= rt5514_spi_hw_params,
-	.hw_free	= rt5514_spi_hw_free,
-	.pointer	= rt5514_spi_pcm_pointer,
-	.pcm_construct	= rt5514_spi_pcm_new,
+	.name			= DRV_NAME,
+	.probe			= rt5514_spi_pcm_probe,
+	.open			= rt5514_spi_pcm_open,
+	.hw_params		= rt5514_spi_hw_params,
+	.hw_free		= rt5514_spi_hw_free,
+	.pointer		= rt5514_spi_pcm_pointer,
+	.pcm_construct		= rt5514_spi_pcm_new,
+	.legacy_dai_naming	= 1,
 };
 
 /**
-- 
2.37.3

