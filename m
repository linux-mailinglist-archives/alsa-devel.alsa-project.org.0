Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FBD2A0870
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 15:51:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1E281616;
	Fri, 30 Oct 2020 15:50:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1E281616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604069481;
	bh=8675unfo1Z2Jf0GRfffyx6sFyRD4zh1vzyldgoEFKjc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OgeAuSvOH7Q56zHqrPTzKkq0bdX6k6dMx3fUmF2L3puzfC3OTSHiVERk68GFyqS0W
	 7LVyDk/Kxye4edscDDA8PpoLABTW8+lwiEi7/0z4SwdlTMxxVhBJNIl9KZi3p8SsDk
	 /HzJuxCBrCvokM+Dr30tB7pqkF5EgBu2XEJTUNLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB925F804FC;
	Fri, 30 Oct 2020 15:47:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACFD4F804E1; Fri, 30 Oct 2020 15:47:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D650F804E1
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 15:47:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D650F804E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JDTfsx/6"
Received: by mail-oi1-x243.google.com with SMTP id k65so6874038oih.8
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=seaaLxuXC47KqE088aencrRQLeI5ux80vm71afqUdyA=;
 b=JDTfsx/667GOIoeFYPL8+ATV+JIP+HyQlZpIUdUyROlnl1laFM3ZrgazcxvxZ7z95C
 clBppZn1oOmwlHvERhmWPK9avsBm33h3wus6BFLujMt1WqDwO0UcENp8WkpCXHPJES6E
 gX3L6jK8L1QXL2AY8gagEA5kxWf26n0Hye3RM50qOy/LoyV7RoQ055PVTT6kqU+Arf14
 E3gQ1UfR5p4ZS+kK+WdnAaxFXwri6m02swS5DPntXxrbWWZXIuoVQRJAjTFz05OozT7h
 +U5qggs/lDF8JmRVaO34plp1RY4RThzD4g4vt1mjvTnwEywxeQfGCjOrog15NPa7D7jD
 GbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=seaaLxuXC47KqE088aencrRQLeI5ux80vm71afqUdyA=;
 b=FUPF3Om2hB+KHSAl3tpGxUDaXdXhT0KHw5rJOny3psjhkzMnHuIwspBvXqGLX9c+Kf
 OVw5V6S007uiCEbzIZs6El+Cmr/2fXzyEkkxb2JiwtrBv+3Fj837Jt+3uC7WO9h16WIQ
 I6BUk5JCaK4cXusUkG+oafDTFZ/JYZjSCJtdmuFrWSlrU4qCT9pbXv6c9/14AJOMqDOx
 W8zVMoFpPp/V9C1IODfpGpbBxbcfDrpGbm85dIUNZEKvcegXlFDi1e+fKySbbv6ich5s
 bAV/du9QBWQceNGIktml2IO/unqGf56RxGjqHZpwqIMLBMi+GBqlBh7bKclgB2s2m/A/
 GpaQ==
X-Gm-Message-State: AOAM532wC+p43P7JcGyLv2QZiYhph51m89Cf5tqPxRUUoe7oMF32KZDc
 EBdjW1f5CwkQm90/LsdWjLE=
X-Google-Smtp-Source: ABdhPJxb0Rgt0hrFUpPy/a6TWm63vy8fvs1PgpicFO1L/F9gNYJzJ+657M8+wq2gDmHjFHbdDHfXzQ==
X-Received: by 2002:aca:ec92:: with SMTP id k140mr1933772oih.173.1604069237021; 
 Fri, 30 Oct 2020 07:47:17 -0700 (PDT)
Received: from localhost.localdomain (213-245-241-245.rev.numericable.fr.
 [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s20sm1462856oof.39.2020.10.30.07.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:47:16 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v10 07/15] ASoC: sun4i-i2s: Fix sun8i volatile regs
Date: Fri, 30 Oct 2020 15:46:40 +0100
Message-Id: <20201030144648.397824-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030144648.397824-1-peron.clem@gmail.com>
References: <20201030144648.397824-1-peron.clem@gmail.com>
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

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 786731191d90..003610c0badf 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1162,12 +1162,19 @@ static bool sun8i_i2s_rd_reg(struct device *dev, unsigned int reg)
 
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

