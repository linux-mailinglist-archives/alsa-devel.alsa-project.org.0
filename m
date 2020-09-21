Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A1427213F
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:35:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3C0116F7;
	Mon, 21 Sep 2020 12:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3C0116F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684515;
	bh=JSYUuxqyR7L0JutcxKz9SrjvS6niDrE7O917SS8zhBE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M+7sYle0o8ibv03Oc5qXo8vOLRu2kE3gaekmKwNRtzGHZ2mcI6ThgK70cJ16uZyH3
	 AB8OCd1lfSWZZTILA81kNBgRsAyUw7wH2tFEHwakDauL0T/Pt8dOZURDNMN52dHFOX
	 boKh4S0y4gBG2EVBXp2iQ4Ha5+yf8NF0ydFBvV3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5900F80333;
	Mon, 21 Sep 2020 12:28:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 937AFF8028E; Mon, 21 Sep 2020 12:28:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07E5BF8028E
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07E5BF8028E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GQrVMr02"
Received: by mail-wm1-x344.google.com with SMTP id k18so12040563wmj.5
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=403l/Us7aRgOIyQKfBkM8buNZnuotwhLbaKDtAVk4oo=;
 b=GQrVMr02cQ1BeZlZeb2WVDwVRAOjy0EPLcpnRVoxLErUQ8L8BbXzAgcou4DBLILshT
 voB4HL19k+K58pZ9bWoiXJcWXcWdo4aTCYu8xUzFOIbsFPR1zHQXm2G7WqGccB8DtNKL
 GFUo276bbhz+KJWMWgKxOTcYQJKeRVpyTG4A+1AxMAWukIh/cDo1CPBA9oH1DE7LReQ2
 J5nNNz0F2YJsVRKfKgl/sXXvpnPkFxsHI5HGyED3UkulTOrGyx85O52YBiuqzeZzDZPK
 0UBMepEcvgqiP0vW1f8hWTuvUbQ54SPeh3/qTspCZfjP+qEvLo1FAuJry9vXmYnLzZoM
 FSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=403l/Us7aRgOIyQKfBkM8buNZnuotwhLbaKDtAVk4oo=;
 b=Z3WwfH6EgOCg79l2oVzl9a3dbV71Y57Bvqm9/SQ5H/nZ0r6wMv7VS1taZytI1ykheJ
 CvGLlyY6WqV8NAOOl7znyOTyN8KsjCRmn5SpRKrUbA9rm8dvY7Q+BD0buqVawe7lHcUY
 qZB9aD1cAYzxc3ai8S65fVZrT8V7rTXq9Px+5QPKIuTOkLOIQ5YeiMvtJBpHJPDyWxm9
 Xx19He3EYzN0FiiRSoSezbSjd0a6Myxt3pIE5b1bKEdYtT0mg/wXDgaq21nlAP+UOTYP
 TykeiB43HB9rr8EYB3VrZQrFe3CyFIenSTfZGvl/WolagS0BbowxV0dr8IGdiD1T4xr3
 dxag==
X-Gm-Message-State: AOAM5318n8uOOaZMooJgI6gLVWmfz9j8gwehfBbKQHXQVZM63fDrMfY/
 vZ3qNwXWyp8ISGw53s3wCbo=
X-Google-Smtp-Source: ABdhPJwUf0cjcKP8Yw3D8f2JCJ2cf8UwK0nPxw2utggNBtLI1lebBlr4qIJnkeYxSyYALo3fFnCvLw==
X-Received: by 2002:a05:600c:2257:: with SMTP id
 a23mr30634579wmm.102.1600684064389; 
 Mon, 21 Sep 2020 03:27:44 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:43 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 07/22] ASoC: sun4i-i2s: Fix sun8i volatile regs
Date: Mon, 21 Sep 2020 12:27:16 +0200
Message-Id: <20200921102731.747736-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921102731.747736-1-peron.clem@gmail.com>
References: <20200921102731.747736-1-peron.clem@gmail.com>
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
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 60b2fec1bbe9..3f9110d70941 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1152,12 +1152,19 @@ static bool sun8i_i2s_rd_reg(struct device *dev, unsigned int reg)
 
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

