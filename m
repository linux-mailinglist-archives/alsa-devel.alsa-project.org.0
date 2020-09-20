Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1E32716F3
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:12:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0C001695;
	Sun, 20 Sep 2020 20:11:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0C001695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625560;
	bh=j+BKEfJOREYyEdQlSvCh7aZZfBrcW5DNWuSLMYVSK1E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h1w6rPEe2jhVRUwWxQEAKJwM30u+wqWdAGAsWR28xDSwXGM++InbHe1aKssyoiCym
	 ZuyWe0Fu0GShSduXaOZ9oydjPsow2IVg6PIcuXC4CDWbOSJe/qvRIB7RMYT4xbpuw7
	 4FNkBGL9YQ9PmjkqHBirs8Izntjeoxo1fxENuKeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A938EF802FF;
	Sun, 20 Sep 2020 20:08:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88845F802E7; Sun, 20 Sep 2020 20:08:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DE1CF802C4
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DE1CF802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fTiXttR4"
Received: by mail-wm1-x343.google.com with SMTP id a9so10343815wmm.2
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ufePw+jmujyM7bKS5oEc09TDH09iB+CFG7lQmMsfy8s=;
 b=fTiXttR4+SrMKv6pRz4j1hLVJNWbD3pjEezaDZ4Q7cU+HTfm/ceNNLOKA5zIxsErw1
 FZav675yawryyB5b6eUCOezng3zzDIKhPCgNwM05NjvamkYWryc3/OGtK8hdbwOSr6O/
 Wcy16e+QUFkQ5j9BjyxKphQOfRR/ZB+iPwmw/M8Ne9PMmHV/ayMCHRob83h/7VOXl1Qe
 IqEZbYxfvqHhhcF3RJ7sCXFA0XIuMkffFtEe4WNSykZZzLQaqM0ht8zvKSCjjSrxA3ez
 ZZIY9OtNObfqcqjFE9hXzdfmmvzyqyoy1mNpxuEnJ1c8gcytL5a7ppatvy0xlqctAX33
 5fbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ufePw+jmujyM7bKS5oEc09TDH09iB+CFG7lQmMsfy8s=;
 b=GNiHwyejoSVl5+jgmfImlJiE6ehJFko41aN+SfkQ7CuFyazoLMSEE+qdwFUCkHXdgw
 EVIZXb/RJv6ok5399wD9aFJwLXTkD7ZJQmrJ5HtBhA6XbrSxU3GvIzLle33dicjfHUv5
 /3hT+WftuoYDUuv9Qd9pGCDUZF406/eeJAKt0Y18yXcmIB7t6vCLwRcTLI4HGpxVWaYF
 4v6QNyK1Rwi3mxugJSeYfLabkbhY6a10Rit5/N7aEE1BxjoD1MGRWaeJ3NhiusNevuvG
 E6bKCe2IHs6sE/KXYDhA+IgGrxr5On5y1gNiqkMPhEWBFuafPPQKFHF/UA9tDHhVzdZw
 HWnA==
X-Gm-Message-State: AOAM530UuMqHPP+9sPxF5nC+URslYGHUUVh4u56egCkI6elDvUZtRPNV
 CRj38A5BSiEywA3/ovovxDc=
X-Google-Smtp-Source: ABdhPJzp/vYgSbX8IaYek55tU+mUWlz1LUiQywqZE+Vlkk/Ja4yCmVqanVd1u0be8fXbakq7ZChGCg==
X-Received: by 2002:a1c:9a57:: with SMTP id c84mr25899273wme.136.1600625296778; 
 Sun, 20 Sep 2020 11:08:16 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:16 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 06/19] ASoC: sun4i-i2s: Fix sun8i volatile regs
Date: Sun, 20 Sep 2020 20:07:45 +0200
Message-Id: <20200920180758.592217-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200920180758.592217-1-peron.clem@gmail.com>
References: <20200920180758.592217-1-peron.clem@gmail.com>
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
index ce4913f0ffe4..a35be0e2baf5 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1126,12 +1126,19 @@ static bool sun8i_i2s_rd_reg(struct device *dev, unsigned int reg)
 
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

