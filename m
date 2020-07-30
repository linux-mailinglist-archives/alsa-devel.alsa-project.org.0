Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 640A62329D1
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 04:11:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E33A41740;
	Thu, 30 Jul 2020 04:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E33A41740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596075091;
	bh=X/09oUjhz98VclAWvc0r/oKf50MFfsglwwLmYGPeUNE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dMYnvy4+j79cjO5cTLh4HBTy+UI2pjFU4OuoJ3Q63SuSX4jTWK/6toe4mJ3UpDx3O
	 P0hMa1uC2eMCDzUxtMlVdakAgs6u9EqXphJYrN0mr3BuKr1/guBggtp/ctHTWf64Ko
	 WJRT6yDvrkP3TCEgD/neuvVKp+SEC69UjTdZTxnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B4FBF80227;
	Thu, 30 Jul 2020 04:09:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B8BAF8021E; Thu, 30 Jul 2020 04:09:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3054F80111
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 04:09:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3054F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="k4XpWvZa"
Received: by mail-qt1-x841.google.com with SMTP id s23so19237220qtq.12
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 19:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Fs1DcfP+Rf98tWaIkqVPfKHWBrVish3r8O2xuyzbm6o=;
 b=k4XpWvZa7P0kmHBBZy4eIL/OTnFpcSu/A+lvHDx/I/Crsu6bs4H9neGQBrPUktSItv
 2f2CqGpBvdvKmTIxtf2SXAei1LcxGSVyvPa9spHPPoz17jCHiDcL6X6Hzo0JvISi07Vt
 F19vr4V9Gk/14PvVscm1nxKASmpwPCFlbTS9eMs26EGVYcV+cpC3SJVEhpE777Wb7l8e
 dJgxJTmAig0yr74uav2AghmqxwavguBjtIY+jU0KZfcmEqyM28uNB8HwYYGTKX83YEkI
 P9LqobwNbTQa50pfZ3fu3sbHAUp4LQXRnDHEk2kRPveeUmybvlXWBykH1hw/ftwYa29/
 uVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Fs1DcfP+Rf98tWaIkqVPfKHWBrVish3r8O2xuyzbm6o=;
 b=MFDbUZPXokbjc0EmKb5kBjhCq/72ynYoXbLABg4hPk+E5j1s3Ov22Pu1AnFPiiUcml
 HaA08gzcCzvoIJcDjWP99S9s+wkiulfvDsmGWIVl9W6PQ5/LZIsM+JIN4hCIk08waxAY
 HmtNS8samVacDuA3rPbyP36JSH7ncdO58q7gxwnGF4k1a7fqZKbepgeUyV6ym2dm0OVe
 vV1crQlYuASoyOIKxn03BW0E2meHTDuMy0ogHdPvvMiIvEt1IEfFKGlKlAbAuBMcj6L6
 lJHEv17T4oZmHDJm57Z4gZti0f/q3lVF89Ffx276GDoAADcfkwakFK73Mjx0ELOQhaLM
 sZVg==
X-Gm-Message-State: AOAM5321W5kVyAe/9dIuOIcIhUhA5QtnU1Ojo84NZkWE4rL3K2ItLrZM
 Cy51O8oKN7moHOOth6TN38Y=
X-Google-Smtp-Source: ABdhPJylNhIjwTCQJYrU0Llv0FEIStRbUm1xnVkFdzNvp1q2ZPgrCDWMA+hbRTKhaXGLdbyBwy890Q==
X-Received: by 2002:aed:29a4:: with SMTP id o33mr900765qtd.66.1596074978963;
 Wed, 29 Jul 2020 19:09:38 -0700 (PDT)
Received: from localhost.localdomain ([177.194.72.74])
 by smtp.gmail.com with ESMTPSA id 8sm3259706qkh.77.2020.07.29.19.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 19:09:37 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH RESEND] ASoC: wm8962: Do not access WM8962_GPIO_BASE
Date: Wed, 29 Jul 2020 23:07:18 -0300
Message-Id: <20200730020718.31700-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Fabio Estevam <festevam@gmail.com>, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com
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

According to the WM8962 datasheet, there is no register at address 0x200.

WM8962_GPIO_BASE is just a base address for the GPIO registers and not a
real register, so remove it from wm8962_readable_register().

Also, Register 515 (WM8962_GPIO_BASE + 3) does not exist, so skip
its access.

This fixes the following errors:

wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16
wm8962 0-001a: ASoC: error at soc_component_read_no_lock on wm8962.0-001a: -16

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/wm8962.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index df8cdc71357d..8159a3866cde 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -956,7 +956,6 @@ static bool wm8962_readable_register(struct device *dev, unsigned int reg)
 	case WM8962_EQ39:
 	case WM8962_EQ40:
 	case WM8962_EQ41:
-	case WM8962_GPIO_BASE:
 	case WM8962_GPIO_2:
 	case WM8962_GPIO_3:
 	case WM8962_GPIO_5:
@@ -3437,7 +3436,13 @@ static int wm8962_probe(struct snd_soc_component *component)
 	/* Save boards having to disable DMIC when not in use */
 	dmicclk = false;
 	dmicdat = false;
-	for (i = 0; i < WM8962_MAX_GPIO; i++) {
+	for (i = 1; i < WM8962_MAX_GPIO; i++) {
+		/*
+		 * Register 515 (WM8962_GPIO_BASE + 3) does not exist,
+		 * so skip its access
+		 */
+		if (i == 3)
+			continue;
 		switch (snd_soc_component_read(component, WM8962_GPIO_BASE + i)
 			& WM8962_GP2_FN_MASK) {
 		case WM8962_GPIO_FN_DMICCLK:
-- 
2.17.1

