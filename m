Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D68B453134
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 12:48:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 215D0168E;
	Tue, 16 Nov 2021 12:47:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 215D0168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637063323;
	bh=IvIk8wIHcZSDwreGliP4UeDlnWFDrpIwvbx1FpHujrc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vxp5jUabtIFhj43jtQoDrU2yjVDQubljy5M/PrdZlsfJBFe0TQNNCgeZzxiLMiD4l
	 d0ne4W1m3ukuyRrIh+o4P9ZemDzH9nxKAlpFZNiS3fY/AsyHn8wBqa2QDd/hJ3YHAq
	 PTdVo3ppmfc+tcJo50icZzgYZ7VW7InUBzK+/5vA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EABCAF804EB;
	Tue, 16 Nov 2021 12:46:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08A50F804EB; Tue, 16 Nov 2021 12:46:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C914FF80423
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 12:46:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C914FF80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jjxHofpH"
Received: by mail-wm1-x32e.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso1700421wms.2
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 03:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t7SqZxtta+mFLRYTDvdmuGnMtffgbWCF/KOCCvJj+EA=;
 b=jjxHofpHAKBd0KHns0B1Gry9ElbrUXFC1jp7j94izHFvYPTk0lRL/PU8Wyy7XJIuTG
 h/gsZH0mtINoyfoFW5dou62IzP4dP5F3kXlJpUk+Bqu7Gf7Hd21U8WOBQNhjK/MnJ4vn
 kzQIBUzp1g03B+ZgEiR/6Kxj7bqp3W7Z9BSMV5ip9Lm9Ee/rgEbh78ERAFKQEtFADves
 RkIdzggXJNT1G42ngFVQMyI1uUEJRCH1PT91ObDmouyQwkxmnaJOzBhG7eOnyChPXnqi
 jC8Upmz+MKR+shhNP8yyGm1dzS5Ye/w56KStFeke3k2E1vYF7ySvmgFvsOGypX8kc8ZL
 iG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t7SqZxtta+mFLRYTDvdmuGnMtffgbWCF/KOCCvJj+EA=;
 b=LwHwSjHoPTm1Gd0zwv1dQtYKvT29tNBjefC/6N3HQtMkNE+2HpC1xIXZDGtB4D2m80
 fcz2tP1n8f6JKLej1EIPOyyallDlKI8po4COY903TH/qQCzjddEIzQA+sQAiEcpvehVh
 K+rafi8aLwe3DkwVzty6yVKBJQyf5zaXgE5CxIfNNJHD6aTzgrp/Ffw0nvZSulnhrjsd
 bs3xDWR2ribTUUSjfAogIQiVdGKuRhUr6U9qBiPgGLZJEq09Q/vFPWLVTn6SNdSo3hWc
 7rZ2ASLY7e5/+TXh4tY81g5nsurbclZOM+uVoQIxxgYCEByVEVoo35q+y5yR8dzyofIp
 cQZA==
X-Gm-Message-State: AOAM5332iLW5OmigHNUeBJ9ax9Q26xFTyKVnwwdiSyjm8Xk+OnaSjPyA
 EFzFcaHuhhWZ9j8vetRnux0+vQ==
X-Google-Smtp-Source: ABdhPJxc/BBjcLSYDlxo9++43Rv4L1uBuM0AajhwiPP2EDZv6VCN+s2RVJhXAa/UGahI9gvifaNVTA==
X-Received: by 2002:a05:600c:5125:: with SMTP id
 o37mr6988822wms.81.1637063199925; 
 Tue, 16 Nov 2021 03:46:39 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id z11sm16934698wrt.58.2021.11.16.03.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:46:39 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 3/3] ASoC: codecs: lpass-rx-macro: fix HPHR setting CLSH mask
Date: Tue, 16 Nov 2021 11:46:23 +0000
Message-Id: <20211116114623.11891-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211116114623.11891-1-srinivas.kandagatla@linaro.org>
References: <20211116114623.11891-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

For some reason we ended up using snd_soc_component_write_field
for HPHL and snd_soc_component_update_bits for HPHR, so fix this.

Fixes: af3d54b99764 ("ASoC: codecs: lpass-rx-macro: add support for lpass rx macro")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 2bed5cf229be..aec5127260fd 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -2188,7 +2188,7 @@ static int rx_macro_config_classh(struct snd_soc_component *component,
 		snd_soc_component_update_bits(component,
 				CDC_RX_CLSH_DECAY_CTRL,
 				CDC_RX_CLSH_DECAY_RATE_MASK, 0x0);
-		snd_soc_component_update_bits(component,
+		snd_soc_component_write_field(component,
 				CDC_RX_RX1_RX_PATH_CFG0,
 				CDC_RX_RXn_CLSH_EN_MASK, 0x1);
 		break;
-- 
2.21.0

