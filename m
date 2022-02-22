Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5F64C0175
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 19:36:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4801817F5;
	Tue, 22 Feb 2022 19:35:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4801817F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645554964;
	bh=wGGQdJU3k7afG5L5S8T/FIzIFEg5WVcLYVg9kmOtOS0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vh2pTqT6a1GnDMJZfcVM/8yleA+ieKrmlC3mCV2g7tRezPFu+gVNKSBPR59VVOky8
	 FHHB4dqdno6uW98HrvwncQumL8HLykk86HNTfwQZhC1iL9gAxwBYFH74FOFMVMWxpJ
	 czPKW0eUOT0R4nLfTHd177W2OyG/+41eb1F/+xwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA44EF8053A;
	Tue, 22 Feb 2022 19:32:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0227FF80525; Tue, 22 Feb 2022 19:32:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CADFF80518
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 19:32:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CADFF80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LOawPkVn"
Received: by mail-wm1-x333.google.com with SMTP id
 p14-20020a05600c1d8e00b0037f881182a8so2633997wms.2
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 10:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KSXL61TJ4FNLzWo1z0RhBOi7zjEjelC9n+5VWaG+Gtc=;
 b=LOawPkVnk1MoWqXpWg+WWqin6xRMXhzW4CLjSSOhnuq+96bpU6bSNdNC/i2q8xxCxU
 pD7o8rNuHyRITWoTZzNmgrO8VQX0+5qvwi6++2BjpM8LQbsaC8GVdmwGyGDyp2qdaW/A
 nwPt+QvZNxnUnk7uGrfM/jc4F7I6LjHiST6yseSPN84zlakeiK/xAmzG8elnlIWDNFF6
 aXuyrcOwDCwH+2AjdPF/Q0uQo+KRibmh8Bfajko2eqMdVqXRQe8bCviaLxssJFnHJAvA
 BrVdS30ex+AOTwkyt0kivVyTgcU84ldmZDLMxz4/jyCeO3CzYRATJKgmy1Y8ZPnZikX3
 PjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KSXL61TJ4FNLzWo1z0RhBOi7zjEjelC9n+5VWaG+Gtc=;
 b=cIsnrJDPCeKu/pcu8xCujUQ/UW4C0kXhmJZQGd7D6YiGg5MHajf5tEt9srM1HbIm4A
 bkNpAoUfG6wDGTj4D+5ukc8a+zmv89UJmqtdvulypzo7+5n/62Dm5CcZlg7rMDykWbw+
 ZjAxPAjNSGPKsGLz4WVdUUavyfSVrwzyb8BOY1hc3SEKbsdYZrvL2T92pw18F/C7w4BB
 ojIXHQYNQs1mCV4re/3mZQ/Zv1CdGYNVsHHkJ3jRVzHWA44KzhCxzgU3m6kcCm4qbVYM
 hyUGBJRynFLfIQZuteysVkYO7+RIxSpYe8Z342+oVs4zja9MZbwGweumG/MjYX9S17Jz
 /PXg==
X-Gm-Message-State: AOAM533i2Ut3Ye2dLi1HUFHPoZzV0P4sckCW/RstShAXeF824KoBn9tJ
 2ms1JEMEVxuGDw5ODOzsoBzqDg==
X-Google-Smtp-Source: ABdhPJzdgtosvehWqrOxuEsYt+VvH5/nC7aOJ9BODdKou2VckN37w33Q/6riYz0ejmzxIro7uicoJA==
X-Received: by 2002:a1c:a915:0:b0:380:e3de:b78f with SMTP id
 s21-20020a1ca915000000b00380e3deb78fmr1724213wme.19.1645554755595; 
 Tue, 22 Feb 2022 10:32:35 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id l28sm57642165wrz.90.2022.02.22.10.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:32:35 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 9/9] ASoC: codecs: wcd934x: fix return value of
 wcd934x_rx_hph_mode_put
Date: Tue, 22 Feb 2022 18:32:12 +0000
Message-Id: <20220222183212.11580-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220222183212.11580-1-srinivas.kandagatla@linaro.org>
References: <20220222183212.11580-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

wcd934x_rx_hph_mode_put currently returns zero eventhough it changes the value.
Fix this, so that change notifications are sent correctly.

Fixes: 1cde8b822332 ("ASoC: wcd934x: add basic controls")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index f2674905a4a7..40b414867872 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -3308,13 +3308,16 @@ static int wcd934x_rx_hph_mode_put(struct snd_kcontrol *kc,
 
 	mode_val = ucontrol->value.enumerated.item[0];
 
+	if (mode_val == wcd->hph_mode)
+		return 0;
+
 	if (mode_val == 0) {
 		dev_err(wcd->dev, "Invalid HPH Mode, default to ClSH HiFi\n");
 		mode_val = CLS_H_LOHIFI;
 	}
 	wcd->hph_mode = mode_val;
 
-	return 0;
+	return 1;
 }
 
 static int slim_rx_mux_get(struct snd_kcontrol *kc,
-- 
2.21.0

