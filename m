Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33323223D8F
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 16:02:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C53E81660;
	Fri, 17 Jul 2020 16:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C53E81660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594994523;
	bh=vPAEKimRlNK0+JYyE6wPljqtr3bbFMhbInC1pha4NFU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d6Mvk3v45KVGyA3GpDTnB79bgpdl1mgcyJ8vjrJ4d8Mp7+y3eiS0mSzHP8feH++3P
	 kINJENYPREB8DjEWIOe8iuypR/x+YoPk+cItcPrNrG9tEKNcDpX9Snx/jfeZDpRVdB
	 jadKS/tivFq1ICv1/s2KKhCX5b/i8+lAd4H8YG4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0DAEF80110;
	Fri, 17 Jul 2020 16:00:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F727F80217; Fri, 17 Jul 2020 16:00:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E639EF800E4
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 16:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E639EF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="idCHr4yl"
Received: by mail-qv1-xf41.google.com with SMTP id t7so4254598qvl.8
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 07:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Rtt+xQUP7mTHI4DioR/i97R18MRBaCnmRQBT5V87sdw=;
 b=idCHr4ylZq+hczji8GtY9Jsbbmrp/t1KDkLZnjanp1o23gLgR0sg6niyqBJ3KSzZ5g
 aXXuXWA7zGTtqlCvtbn/JicrJjigY4+MLoTxVIMiAC/iEEUQqxU4X6Mc6XEWqNpAquVm
 V1FOzDy43EISh+lkI5/Ln9CS5yP9hkWelRoXQ9/dyi7mPwn5WDKp09t3iln9RHoK2cwu
 ZdSgZWA1q5w0jlhm35n15+RTqYJ2Z07dkiVYEu9yq47o9C1Pr0ORqa+nqzkE2RRSP8CP
 x+hG8VpnXaadmI6YmYQC5Rk+9aCZNaBhorKA+IJZdqyoeJi/apg0p/cvk96KV6owt2Bn
 pqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Rtt+xQUP7mTHI4DioR/i97R18MRBaCnmRQBT5V87sdw=;
 b=pgran89h8EfzdRTHBGPz32N0w/FwLbGqatwowVuYfCpH2KH5QVGN9cSB43dLXXNEmg
 /ZEtqQWp/208XndUDye2LJtEdeGPLygmxpvswWTH58zyv7j51Iz5nKaeyGR2hi5B2wfB
 izjie+jcLKePUaTY9qxHcg0d/bTBp4vjTTRRfDM9v5f4xw99BcU125pBaguad0SFj2Es
 tsxf5W2aVN5AJFLvTqe1WiMYFgifScEjGwL6GnynerJSWh12G8g/Ffgi6xhRfKaS+bzh
 16h/GZV3pIzxdsMRI21GXVpJANuNgqjMROf4M8l8LMBgCsfVjQBEt4v8JWIHyEIu/wH9
 rE0A==
X-Gm-Message-State: AOAM531YyQj5O2wASeo/AyHvWvjt+i53fsmtJprh3loudv9Xz4gMj+Yd
 Dqj/kxrwIBtEfghdfLejCZ0=
X-Google-Smtp-Source: ABdhPJzO1h9cf8LteMu0XB1fJXt141KE9lqg1tGdBuI7K6ZyamnOF63wPZ90gZNZUTo3+dDs8Tdy0Q==
X-Received: by 2002:ad4:4a64:: with SMTP id cn4mr9050814qvb.199.1594994411354; 
 Fri, 17 Jul 2020 07:00:11 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:92b:9ccd:152f:e1b3:950f])
 by smtp.gmail.com with ESMTPSA id
 l202sm10283672qke.109.2020.07.17.07.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 07:00:10 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: wm8962: Do not access WM8962_GPIO_BASE
Date: Fri, 17 Jul 2020 10:59:59 -0300
Message-Id: <20200717135959.19212-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Fabio Estevam <festevam@gmail.com>, shengjiu.wang@nxp.com,
 ckeepax@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com
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
---
Hi,

There is still one more soc_component_read_no_lock error left on register 48.

I can get rid of it with the below change:

--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -151,6 +151,7 @@ static const struct reg_default wm8962_reg[] = {
 	{ 40, 0x0000 },   /* R40    - SPKOUTL volume */
 	{ 41, 0x0000 },   /* R41    - SPKOUTR volume */
 
+	{ 48, 0x0000 },   /* R48    - Additional control(4) */
 	{ 49, 0x0010 },   /* R49    - Class D Control 1 */
 	{ 51, 0x0003 },   /* R51    - Class D Control 2 */
 
@@ -841,7 +842,6 @@ static bool wm8962_readable_register(struct device *dev, unsigned int reg)
 	case WM8962_SPKOUTL_VOLUME:
 	case WM8962_SPKOUTR_VOLUME:
 	case WM8962_THERMAL_SHUTDOWN_STATUS:
-	case WM8962_ADDITIONAL_CONTROL_4:
 	case WM8962_CLASS_D_CONTROL_1:
 	case WM8962_CLASS_D_CONTROL_2:
 	case WM8962_CLOCKING_4:

I haven't submitted it yet because I don't know if this is the correct
approach.

Please advise.

Thanks

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

