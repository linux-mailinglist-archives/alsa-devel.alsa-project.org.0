Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B742FCC65
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 09:10:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 981F517D8;
	Wed, 20 Jan 2021 09:10:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 981F517D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611130258;
	bh=Rox+b31XUfmFBIV2tScdBycsItmOk3nlyxUoxlusdKI=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YAOSK0ENAnYaO9fQHsXTpoDo8JDxe+ElHBUGUQmGMtZopys1clNXfDdisr6ehALZQ
	 11c8jmRpYYrT5WVk+6lj1Fp8Y0Cp7gJMpeCxGnbi0YWh66E7I/OwiWFplS4AXWHn8m
	 rS5s9p+GIoSuAI9Z9f16THKLFpCQdrrBMbL+Rs/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15510F80227;
	Wed, 20 Jan 2021 09:09:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53CF6F8019D; Wed, 20 Jan 2021 09:09:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DBECF80227
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 09:09:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DBECF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="TT4sKjt+"
Received: by mail-yb1-xb49.google.com with SMTP id b62so19633260ybg.1
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 00:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=SmiqRyWwl+9YuN8tC28z3cuRSiSYFs1m5Wjro9iC9Ms=;
 b=TT4sKjt+gSjbsCN6+pFJiq4W7jnq2vEr5ZAJoj4n+MV7aD/ZAb/7zSNbnUoihwfwaF
 RVRq5rGq6g0pqX7kIIWCWZdEFASqCVfUeJu54j1nUGEu+V7d5mLdTT5DBBpicnbtSypm
 GvrikyajuQosd5G1B4w2ngQnytrhBWzNs09TUt85mIL8K40uzw7mgrXkXBxFk9wFA+D5
 WHf33hEVZ0wwAJn3g2IFXtZsFyMwm0IFHcOSDsFa1I9etxi57K5X/U+UI1yhv3krXZDI
 idv5WEOoZtJSap8l0eN6uA3AhEGKRcNBz/gROaELrpWXBNq975Qw/C6zPTqtnQJjR1dL
 U7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=SmiqRyWwl+9YuN8tC28z3cuRSiSYFs1m5Wjro9iC9Ms=;
 b=SmNVa998wtPKMygFjZavNSV9HT5Br/rX/438U7ULbdLRahHUBiNv8743FrCGQdJf0+
 bSu/EG2/4NSdVsONQlnd7VlMTncDntZvUnb3flZG/9qlTs/0WTM6YdsJmNsBw0wl9i98
 Wvt1GKIPFtGNfpTg61safzz6dspavwMd9Vk9raLldbCgcKcTEG1dcc+kT23+wHMtjxQv
 GTTgK+jJnIR7ttvrGGrddqRLdbS5fqGiyUhKMm2cA34WfIflC19ZNQeqEfDnl/2MLbil
 a7XQMwMBCJ5oRlu62Djhlaxb9BMplV92zMhIK1Jiv6krysFBtvTx4pqR/LtJAzCprOCU
 i94g==
X-Gm-Message-State: AOAM532YnAIYy/0V5bvqk6PNTTzMOYB21A9lJ17e7HJA7qRWxFhkkY6/
 KvfoGQbM7TecO3GxsNSdgAH1X6HjzLFx
X-Google-Smtp-Source: ABdhPJwgsQAWglOCEGtKoVUzqAnU2tsXXNDSVYHjY2bZzGFR74ahzBGi0FOePYDzZ4UL/6irz4aCUWlI3X8a
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:1164:8893:969a:b338])
 (user=tzungbi job=sendgmr) by 2002:a25:d84:: with SMTP id
 126mr11341755ybn.145.1611130154567; 
 Wed, 20 Jan 2021 00:09:14 -0800 (PST)
Date: Wed, 20 Jan 2021 16:08:48 +0800
In-Reply-To: <20210120080850.699354-1-tzungbi@google.com>
Message-Id: <20210120080850.699354-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20210120080850.699354-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH 3/5] ASoC: mediatek: mt8192: change mclk_multiple of TDM from
 128 to 512
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org
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

mclk = rate * mclk_multiple
bclk = rate * channel * sample_width

If TDM outputs 8 channels and 32 bits, bclk will be greater than mclk.

Changes the ratio from 128 to 512.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
index 8383536b7ae0..f5de1d769679 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
@@ -738,7 +738,7 @@ static struct mtk_afe_tdm_priv *init_tdm_priv_data(struct mtk_base_afe *afe)
 	if (!tdm_priv)
 		return NULL;
 
-	tdm_priv->mclk_multiple = 128;
+	tdm_priv->mclk_multiple = 512;
 	tdm_priv->bck_id = MT8192_I2S4_BCK;
 	tdm_priv->mclk_id = MT8192_I2S4_MCK;
 	tdm_priv->id = MT8192_DAI_TDM;
-- 
2.30.0.284.gd98b1dd5eaa7-goog

