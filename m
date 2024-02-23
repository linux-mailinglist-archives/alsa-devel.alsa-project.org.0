Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 161A0861AA2
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 18:52:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 644AD839;
	Fri, 23 Feb 2024 18:52:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 644AD839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708710750;
	bh=j16zsMD+HTWYyVy/k1AZwAJ7XoBtLsYNzq4+rvXeU68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y3nJq2SjbhImphIHwC8PlHPtEFShvVVfO/a1D2xFxVaUQt33018PGOAlz9AOyPacU
	 e8RXW3F10GVn9p18WKNxGMHdA2fKFr2hXYP/AxkS011PIwuYpN0LhbMvKv0nu/hCIe
	 TfQ2bRAIPDNhAz/5n7YSWEAM6+Wokq+bCIIq/8Oc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E728F805C0; Fri, 23 Feb 2024 18:51:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4012F805C9;
	Fri, 23 Feb 2024 18:51:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7841AF8056F; Fri, 23 Feb 2024 18:51:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8917F8047D
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 18:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8917F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ZNbbe4sG
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41294021cd8so4588185e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 23 Feb 2024 09:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708710683;
 x=1709315483; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2ahiTP/lW6MiTpxUmavX+y9bbyFd7JEgWLGkKtHM5s=;
        b=ZNbbe4sGHE+newfhDnDEt4+lrYgV5CuR17Ux54r56LNqBdATPvRs1pSLtEAgXU4kGg
         Ba9nlWN7VzLCfWDJ7wuNB/yh3i2t5Z3qV134HTcmDEGxZPrFL4nrRaZFEeY2qDr+VAWp
         v8K0xIzRBD5mpw/wZDdL6KZ52rZL6Yz1oGKjndUl7x5MdTHZP2K/zbNsb8Mcc7XbRrsb
         EoS5Etf3bxOfXAer1HNSKUJsFk5M6kQTtRoZZP/jr5Z9s8QU3uMCrQ/Lnqysi0fUOs9f
         caDoLUZTfe/2TKkgrT/bcDaxVStrBo1Kz893RA1zDHsmQ9w1DWC7+l6Zts1PFvKXctfR
         XQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710683; x=1709315483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n2ahiTP/lW6MiTpxUmavX+y9bbyFd7JEgWLGkKtHM5s=;
        b=Br3RAdd77CsuJv0Rx+p+wSKC5Iha4+uRczfME/MI1DSHLJEaI02DfpmxN6GsJGIrt1
         auxnm4v0vNUffY1sdm4ftwZxnkExIWkBNEnwZYqqZMYgdUReQ5xCXkOLHqvaMxJxnylh
         Tifu4I29TzTzXvfWhOCi8UvCaZY4ulxCssIfarhDZIBmU/tIONsIgrlOmTM0+VYqOGaP
         cE7rOzHs9pw7uwTngUhV3KERpKpnof5H4/mws9U0CUVHLv5wDZTgbdsXx/xTPC4SrjhU
         uu1YJuvvETo8LV/7ZrZxvnWUJDKt9qzwOYc/IbbBnweO+h9QrNuS4zkGR1uegxvkctez
         BwMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQw0SwPtxqM8goBMfOBdC23LPZTUI3ePEdvvuQStOQJEf1i87Gbivwfp08FWuvTIlFxCnoJuvdHYwDx0ztJmkCfPfx/pu3L2AI+50=
X-Gm-Message-State: AOJu0Yz4lwYawbb9QVwr1tXbWwo79hyXLRV0rVLpsVUyZPKAdM5y0Vxw
	22/03P8qwjUOxf0xO8zw340qxqc6FMy//HxtPdXRTj1zobfsz7jEoXtV8QmcCgQ=
X-Google-Smtp-Source: 
 AGHT+IGqnoqMSxnWyvarUuiuXtt8jg0EPFcrolAZQBwRrHQk3pPFoxvi/xtJ821ZsNJVMnK4y5tzhw==
X-Received: by 2002:a05:600c:5114:b0:412:9830:a259 with SMTP id
 o20-20020a05600c511400b004129830a259mr383837wms.25.1708710683406;
        Fri, 23 Feb 2024 09:51:23 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e8a0:25a6:d4ec:a7ff])
        by smtp.googlemail.com with ESMTPSA id
 bo10-20020a056000068a00b0033cddadde6esm3711524wrb.80.2024.02.23.09.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:51:22 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/6] ASoC: meson: axg-tdm-interface: add frame rate constraint
Date: Fri, 23 Feb 2024 18:51:08 +0100
Message-ID: <20240223175116.2005407-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223175116.2005407-1-jbrunet@baylibre.com>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CHV6V6RSO3HQ5H4HKTN4FJ66HZZYGTAL
X-Message-ID-Hash: CHV6V6RSO3HQ5H4HKTN4FJ66HZZYGTAL
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

According to Amlogic datasheets for the SoCs supported by this driver, the
maximum bit clock rate is 100MHz.

The tdm interface allows the rates listed by the DAI driver, regardless of
the number slots or their width. However, these will impact the bit clock
rate.

Hitting the 100MHz limit is very unlikely for most use cases but it is
possible.

For example with 32 slots / 32 bits wide, the maximum rate is no longer
384kHz but ~96kHz.

Add the constraint accordingly if the component is not already active.
If it is active, the rate is already constrained by the first stream rate.

Fixes: d60e4f1e4be5 ("ASoC: meson: add tdm interface driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index cd5168e826df..2cedbce73837 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -12,6 +12,9 @@
 
 #include "axg-tdm.h"
 
+/* Maximum bit clock frequency according the datasheets */
+#define MAX_SCLK 100000000 /* Hz */
+
 enum {
 	TDM_IFACE_PAD,
 	TDM_IFACE_LOOPBACK,
@@ -153,19 +156,27 @@ static int axg_tdm_iface_startup(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	/* Apply component wide rate symmetry */
 	if (snd_soc_component_active(dai->component)) {
+		/* Apply component wide rate symmetry */
 		ret = snd_pcm_hw_constraint_single(substream->runtime,
 						   SNDRV_PCM_HW_PARAM_RATE,
 						   iface->rate);
-		if (ret < 0) {
-			dev_err(dai->dev,
-				"can't set iface rate constraint\n");
-			return ret;
-		}
+
+	} else {
+		/* Limit rate according to the slot number and width */
+		unsigned int max_rate =
+			MAX_SCLK / (iface->slots * iface->slot_width);
+		ret = snd_pcm_hw_constraint_minmax(substream->runtime,
+						   SNDRV_PCM_HW_PARAM_RATE,
+						   0, max_rate);
 	}
 
-	return 0;
+	if (ret < 0)
+		dev_err(dai->dev, "can't set iface rate constraint\n");
+	else
+		ret = 0;
+
+	return ret;
 }
 
 static int axg_tdm_iface_set_stream(struct snd_pcm_substream *substream,
-- 
2.43.0

