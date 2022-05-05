Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0889D51B5C4
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 04:22:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9858C1775;
	Thu,  5 May 2022 04:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9858C1775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651717336;
	bh=JHDOPDqk5fQDuz5QUmzjko5Ozg8PJ4/6UhJD27gjOso=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O1CCe2jOiOVOt6F0y0/uMNrOSDI4fuU0mgrY8rJreyJJqHLTVzqdjR+IExd4UunOu
	 BtmYt2SBjR8xhn0VAt3jvOV9ubr+0fgSI8bj7X6u3SeB7AyaiLXVcbp04DPu1OJTg1
	 SoWWbG9XKblnAdtNadAOZAqwxx41k7e5JzOWtpmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1757F8049C;
	Thu,  5 May 2022 04:21:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07366F8016B; Thu,  5 May 2022 04:21:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D8CEF800D3
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 04:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D8CEF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nsnFguKB"
Received: by mail-pj1-x1033.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so4755788pjb.1
 for <alsa-devel@alsa-project.org>; Wed, 04 May 2022 19:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L29beijmOBItkkHFe0zAs3en1lXL5wQ+ii6bOfyDx3w=;
 b=nsnFguKB2NLOrLnOrTZKwKhFp50jdrWPHzz6A8Y+5pjtxjvPbb9s1WBIppo7QlrXwD
 avUxyjTz7indRQhqjLDUmu5sbkeimM/DVnwNPjRFQOXQzD8aaKPOkVkeCvP8B8mZEkaj
 F1ND3RyphXaRjQ5/g1sRfVdm5zcnNIcYt3ZIjaojw42cxY6/Q3RWG9gTLu3oxxU6slK8
 T8xm3Tg8V2VUvIZRh42HUHHIif1w/NVb5o8IdFMkup7DhZYTmK8qYxOc1xBTQXnRqU35
 5G8Pu/PGDRyWDOiio8KEnZ4go+wl4QSM0pcwsxXDE80Et4U0lz2ccrxcP5oPvy5i2jHs
 dxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L29beijmOBItkkHFe0zAs3en1lXL5wQ+ii6bOfyDx3w=;
 b=Spg0/eBusDkqHtls6T77FscI8dQvf0VN/UAkCmpDpq6Q1txsxEfI8188DmB+4ysrqr
 WQOf5lYsiZz+mxhOae76LugIOYg3bLiRPLgtg85kwmD8KTrW3FJk7E5jl/80KG4U32ve
 cim79+YCcZNTgIdMw1rC7XzvHFGYNbikckKtObgOo0atxb95jHghwx0ArI4/bWqTssDe
 ueuLzJ3rrX5jxLVfB+vqNF4k1X8zK9EYhx+VMKEg8nhEqGaxyOB8o62F9atrEYce3Hud
 n/6QzUk10moKQQj3srO9KMbmEs175pDuf3RgPLgON6wYqByouvxyc7OoHnBtzCbEGZRo
 9YtQ==
X-Gm-Message-State: AOAM530EY8F2/5vX4pTVI60JdRf3p+YrtBzczXchY3l2/LKZuHdUb1Hw
 adGBwO82eZnHqVU0KgRqbzA=
X-Google-Smtp-Source: ABdhPJwnuY6Oc5ajFtJMUAPrBiE+7/kofVgYm1v0VyH9aYzBuzJEFEQA5gUvaeQyUiPKz/3ZOWN8Dw==
X-Received: by 2002:a17:902:c2d5:b0:15e:d84a:b24a with SMTP id
 c21-20020a170902c2d500b0015ed84ab24amr916063pla.69.1651717267153; 
 Wed, 04 May 2022 19:21:07 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 28-20020a17090a1a5c00b001cd4989ff41sm235507pjl.8.2022.05.04.19.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 19:21:06 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: pcm186x: simplify the return expression of
 pcm186x_power_off()
Date: Thu,  5 May 2022 02:21:02 +0000
Message-Id: <20220505022102.54650-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Simplify the return expression.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 sound/soc/codecs/pcm186x.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/codecs/pcm186x.c b/sound/soc/codecs/pcm186x.c
index 2c78dccb3f62..fda9d7ee3fe6 100644
--- a/sound/soc/codecs/pcm186x.c
+++ b/sound/soc/codecs/pcm186x.c
@@ -534,19 +534,14 @@ static int pcm186x_power_on(struct snd_soc_component *component)
 static int pcm186x_power_off(struct snd_soc_component *component)
 {
 	struct pcm186x_priv *priv = snd_soc_component_get_drvdata(component);
-	int ret;
 
 	snd_soc_component_update_bits(component, PCM186X_POWER_CTRL,
 			    PCM186X_PWR_CTRL_PWRDN, PCM186X_PWR_CTRL_PWRDN);
 
 	regcache_cache_only(priv->regmap, true);
 
-	ret = regulator_bulk_disable(ARRAY_SIZE(priv->supplies),
+	return regulator_bulk_disable(ARRAY_SIZE(priv->supplies),
 				     priv->supplies);
-	if (ret)
-		return ret;
-
-	return 0;
 }
 
 static int pcm186x_set_bias_level(struct snd_soc_component *component,
-- 
2.25.1


