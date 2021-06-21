Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C393F3AEA4D
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 15:47:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50455169B;
	Mon, 21 Jun 2021 15:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50455169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624283222;
	bh=g5oFni9C9CqwROR85bD11vcyrwu7XQNT/mfxNMGAvnU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PmlluLs+58PY+dBZnsC2k3hTADCX55jdNo3GUkSbaTtust5lEhp6jFqFuBKBldQJs
	 s5AbkFPNu/U6ond62DR/H9UX7ERWgj39ClIFOUUcSoUkcSqEooIAQmcbxj1b1aDlff
	 fxj+cUgK5jMLTabw/d9K/rSdB4MmQlP2a7jmEVz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6F2FF80111;
	Mon, 21 Jun 2021 15:45:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0665F8016D; Mon, 21 Jun 2021 15:45:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3E27F80111
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 15:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3E27F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="guTJc7On"
Received: by mail-wr1-x430.google.com with SMTP id i94so19732654wri.4
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 06:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pAIv5ocE40xJoNsZIv++9AOR0LE9aTCfg1rxh8nwgxg=;
 b=guTJc7On2LFjGZ8lVBDXOxGeqL73iRh1QfAJ4/zOF77kF1Vuv6T8g7+fXFso128+rP
 AFmyyKFZ+s8abFjozMOsjWke5t9c6dqWsIQigTCNAzDmJ96ioGg5W+Iu961Vb7dozbYA
 0Vop3UqBcs4Ymen7/ud9QmkaDXlr19OMJikECXQDPisLTFJ2iqP7Bv1hldki3gEwgbl3
 70VJZhSBSwE9LFe6jSQtSmcNSl+LqHORSNKoJWBDrg6hjO84P/86h0A/97QB+0Cm4cn7
 vHASX1tcgta7wWNcxebVYwkCaeJcCb8Jz97iZSIi5bOb5AA6nvbDDVqEc0yXkJcOY/I5
 kpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAIv5ocE40xJoNsZIv++9AOR0LE9aTCfg1rxh8nwgxg=;
 b=K4yz5gGEpavgae0GDYRVZSE4OE5TRM2HSzZhKMu1IUW3+lYSNQ+GlrZ5D6c6Y1PjY9
 QMo6g7SOTh2trFtABNOlUJ3hz9oMSGFYv5pgARdreRkjvobMfWGiz1hh0KmaI3zhOi1i
 3C/gu+eUM/McBJwTyNwVZVDzgKwu2WF1/jdItZ4uiHGgk5kIDbFdyGPvMfwfJm270tu9
 3OlfbRZdxLQP9BRU/CEh5rxdI71an2HE8SnuiFZM8PUfSqTDZSgp9mp82xZ3OJS95YxZ
 nM3qHV81Y0VrHrAVmbLm/S61d69/MD5ewlZsg4ZMea2lfaS5X7W37yeWJTGAlRvsoNEU
 9Y/w==
X-Gm-Message-State: AOAM531kuULIXTR6W8aepbuCDZT2E6luWZCumQ10eojJ03GDX1dsRMz4
 NiGYi1y/uJK6bO+el3JJ+dF5fw==
X-Google-Smtp-Source: ABdhPJyCzCj448Bpy2dWzTq6/4ovn/wNNa/MVJP9R68doPFkJ0EIVoTaBHtXNlIatz+aS7V6a9CVOA==
X-Received: by 2002:adf:eace:: with SMTP id o14mr25889416wrn.159.1624283124401; 
 Mon, 21 Jun 2021 06:45:24 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id e38sm12848741wmp.4.2021.06.21.06.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 06:45:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: codecs: wcd938x: fix uninitialized symbol warnings
Date: Mon, 21 Jun 2021 14:45:02 +0100
Message-Id: <20210621134502.19537-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210621134502.19537-1-srinivas.kandagatla@linaro.org>
References: <20210621134502.19537-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>, lgirdwood@gmail.com
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

This patch fixes below two uninitialized symbol warnings

warning:
	sound/soc/codecs/wcd938x.c:2092 wcd938x_tx_swr_ctrl()
	error: uninitialized symbol 'rate'

	sound/soc/codecs/wcd938x.c:2189 wcd938x_tx_channel_config()
	error: uninitialized symbol 'reg'.

First one my brining in check to already existing if condition and
second one by adding a default switch case to avoid any access to reg.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 427f51fade37..11315262391e 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -2086,11 +2086,9 @@ static int wcd938x_tx_swr_ctrl(struct snd_soc_dapm_widget *w,
 			}
 			rate = wcd938x_get_clk_rate(i);
 			wcd938x_set_swr_clk_rate(component, rate, bank);
-		}
-
-		if (strnstr(w->name, "ADC", sizeof("ADC")))
 			/* Copy clk settings to active bank */
 			wcd938x_set_swr_clk_rate(component, rate, !bank);
+		}
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (strnstr(w->name, "ADC", sizeof("ADC"))) {
@@ -2185,6 +2183,8 @@ static void wcd938x_tx_channel_config(struct snd_soc_component *component,
 		reg = WCD938X_ANA_TX_CH4;
 		mask = WCD938X_HPF4_INIT_MASK;
 		break;
+	default:
+		return;
 	}
 
 	snd_soc_component_write_field(component, reg, mask, mode);
-- 
2.21.0

