Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 207A7214595
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 13:44:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C946416B5;
	Sat,  4 Jul 2020 13:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C946416B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593863058;
	bh=Dh2Ivc+I2qCPIC+zM6LbZGFaTjXcVOT0417OlMN6sto=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H+4EEcSlxhwQp2O6nbN1qug4XsL4Qryt3B29/Ea2sxqCX131WIqXR3Z1ximo1fTRw
	 gKTG3ma17EREHTRvf1q0KULBjkE279pFeDgyeCoNkq+UlybDOSyQCgxbBPwetDm/LZ
	 P6HWDRu21YqWtNczaUPw+Pl7Ahj/w/RAX2TEfOmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B70EF802E7;
	Sat,  4 Jul 2020 13:39:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D84ACF802E3; Sat,  4 Jul 2020 13:39:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A232EF8022B
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 13:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A232EF8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XtFrKdEp"
Received: by mail-wr1-x442.google.com with SMTP id q5so35410401wru.6
 for <alsa-devel@alsa-project.org>; Sat, 04 Jul 2020 04:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6srjU/ZvMImw58RSlWml1hSuOXhUjM1f+LvigtsjUM0=;
 b=XtFrKdEpb8bM+H8QddJjKQH5JC/VHoJSwNcO8OBf/L+QWdA26GqLvH11+AYVmuRzf7
 ROsysFD/uvNR1V9BVbVkxhgRR6fSKMl889u5A8Ah/9nseslR/JnSdVo6IHY+GgWas1PX
 RcRpZf2BY/wSGyagBdkI3/LAHRt0WY+NfYjLUxCWy+6lsxsGZqkWLq0jjwi6n6e6cpgu
 I6pTE1xqoHcSZ0z3W3fSd4Kv4DjvelmrAEcFKzBPofWi7cvp7RTPHUuRKrfil8RbMOR8
 SjIh2IG44xkvhbQ4EO6URcl+EysjVlf3KK95SjIXJJigqokxZdB+2d4CU4a4JMYtvoqa
 ZhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6srjU/ZvMImw58RSlWml1hSuOXhUjM1f+LvigtsjUM0=;
 b=Y5luCJ0RgZ1ivzTr5P03Zj+olXbaeppVo+aTTE0s7i6MXGVJNqe/mYkyWFiMxu0tBt
 NGCfjpTfUmaTWi2jnORKTmkPCj8d9Ax1Pe9uul61Z6Z4ezLMIL1zVZvDSOzZPrazbA+F
 tyRzu6om2WZBe1JdE10YPP12NIoneTuCpndRVnYzVS2oF6NLpYor8J9fw6M8+vEsHWv6
 vhxK8K1889I9D3k5DzlWXJRbyxDVVFg1nvmfHkE6da0dZDLg0/Y4dfpiqp0NSCEl4Ykp
 MZFZbya845ITNtjUX+kYGCWWBpM3f/BUMHYPc4qr83b4ob+D6vXzxklyvClsJTyH/L/T
 Uo+g==
X-Gm-Message-State: AOAM532OCSxsAyxX66Q4vxJtOB/OW1XCqhbn0XqUsqhsmS+dc1UUdWMy
 kGEPLNPORaGOvGXXKdh/agc=
X-Google-Smtp-Source: ABdhPJwK6E1iUiYqMoIAXl71mOL+4VQsJk1OxMZ+u6k8BriUd2J7xo3i7cKAuCBEKWDBXnm86Zm6gw==
X-Received: by 2002:adf:dd8d:: with SMTP id x13mr39861926wrl.362.1593862754105; 
 Sat, 04 Jul 2020 04:39:14 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id j24sm18657373wrd.43.2020.07.04.04.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 04:39:13 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 07/16] ASoC: sun4i-i2s: Fix sun8i volatile regs
Date: Sat,  4 Jul 2020 13:38:53 +0200
Message-Id: <20200704113902.336911-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704113902.336911-1-peron.clem@gmail.com>
References: <20200704113902.336911-1-peron.clem@gmail.com>
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

The FIFO TX reg is volatile and sun8i i2s register
mapping is different from sun4i.

Even if in this case it's doesn't create an issue,
Avoid setting some regs that are undefined in sun8i.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index d7484c7e8fa2..109c10296d83 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1147,12 +1147,19 @@ static bool sun8i_i2s_rd_reg(struct device *dev, unsigned int reg)
 
 static bool sun8i_i2s_volatile_reg(struct device *dev, unsigned int reg)
 {
-	if (reg == SUN8I_I2S_INT_STA_REG)
+	switch (reg) {
+	case SUN4I_I2S_FIFO_CTRL_REG:
+	case SUN4I_I2S_FIFO_RX_REG:
+	case SUN4I_I2S_FIFO_STA_REG:
+	case SUN4I_I2S_RX_CNT_REG:
+	case SUN4I_I2S_TX_CNT_REG:
+	case SUN8I_I2S_FIFO_TX_REG:
+	case SUN8I_I2S_INT_STA_REG:
 		return true;
-	if (reg == SUN8I_I2S_FIFO_TX_REG)
-		return false;
 
-	return sun4i_i2s_volatile_reg(dev, reg);
+	default:
+		return false;
+	}
 }
 
 static const struct reg_default sun4i_i2s_reg_defaults[] = {
-- 
2.25.1

