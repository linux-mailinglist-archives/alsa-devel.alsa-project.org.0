Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC1D29E575
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:59:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF34A16D7;
	Thu, 29 Oct 2020 08:58:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF34A16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603958349;
	bh=EAYw6rEnFopCzwr4McQXkQclUPvkVmqO0x0kPQIxN7o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VFZUMWHtjN8W4cs4JPP9ERGTFXu0IwyY0iVmTJtNMtjAPgR/+WzRKGddjqEkr1buo
	 dN4CzWAgtFgkYZg+7LEbNDJT8+eaoBp6vwO0xE9i8/vY2UTOsboDe4A9/d8zkFCqtv
	 l7p5cCykjhe/fachMHf83Nw6w069k1XQF4CxmyoQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F128FF8055C;
	Thu, 29 Oct 2020 08:50:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26BB4F8020D; Thu, 29 Oct 2020 08:46:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69538F80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:46:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69538F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MnncO8tP"
Received: by mail-pl1-x643.google.com with SMTP id t6so888081plq.11
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DqWaovVCPL/Bqrn37hn7W1rsqDZ6SlCUd1zEodOEgN8=;
 b=MnncO8tPOgIhA9PC4r2IzlM9lcXfkaicR8JQE4AgbFDrgX9Pu5cBANM6HRnFoLMn0c
 rSCotDOjsH0zi6C/Hnvdy/Cv6zcU5KLe2NP5Y85IHMM44pj1Dgqj77aNn4QD+3UjuQUb
 pgmk2DmksmAuOeOi8yWK9HnhjMwEkuI6AoAd9cPAtmecKboFqtUzeZCjU+t6eWTojnhr
 QgCgLo/11V8nr1KO+WiTSMA4eVzucOFdXZpi9lg8V4c/tYw7GhaT8QUNUerXvgv2Qk4r
 xAc3x5+KWJ6J3oyNyiwQHcNAm5KWCfcTersQXPCm4M7elwAViUne+RPUkLhZX54ZaZ/i
 g5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DqWaovVCPL/Bqrn37hn7W1rsqDZ6SlCUd1zEodOEgN8=;
 b=lQg6206MZyQG2pQrt0icDOgyzyM+kUqxpyI7oj1gtz0LdwVuM1DXTM0ygtCSusZB7Q
 FQER/pq3qBA6IUegPRRHxDZx3zqgqWbc98cyq517HzPlWuqv2tw9tEXkFWNpBrOgo3cv
 rNO7yUhIHqf1ozF8GatzXdyQApFkHuLXltB0gNIOjmbHG7qXzCGq/k6rj30359kbZutS
 tumfm5uNfW7pUMJH+04r0C2IVNdv4WTXIhHfJO/AhZ/6Al0XfnNMcBSP3bVd4YwR5tI6
 lwlAcptu5WqZX/ZxAfTGjH8OIFXADmdANMRCPsw4Jx9FYh7bX2ojR3W7jbaO5pW5BaAZ
 u+OA==
X-Gm-Message-State: AOAM533VSK9dKAABs3Bj8nmMJ+tlVguQi49VIDe4wBhXhZ4XaEB/qfgE
 E4bhrN1vErk+TNnok63HGzc=
X-Google-Smtp-Source: ABdhPJy+M1UIinoo2AEmLXQsGG3cg9gop3Jegb7FgZ80OjLmb5b3L8AQ0Sdx44L9Pm8IEoN6rwHMWw==
X-Received: by 2002:a17:902:740b:b029:d5:cbb0:fbe7 with SMTP id
 g11-20020a170902740bb02900d5cbb0fbe7mr2792992pll.27.1603957578094; 
 Thu, 29 Oct 2020 00:46:18 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id ev5sm2462381pjb.2.2020.10.29.00.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:46:17 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 22/25] ASoC: max98927: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:58 +0800
Message-Id: <20201029074301.226644-22-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:55 +0100
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>
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

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/soc/codecs/max98927.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 8b206ee77709..48c6aa78a410 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -794,7 +794,6 @@ static int max98927_probe(struct snd_soc_component *component)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int max98927_suspend(struct device *dev)
 {
 	struct max98927_priv *max98927 = dev_get_drvdata(dev);
@@ -813,7 +812,6 @@ static int max98927_resume(struct device *dev)
 	regcache_sync(max98927->regmap);
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops max98927_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(max98927_suspend, max98927_resume)
-- 
2.28.0

