Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D728D4BF7BA
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 13:03:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7216617B4;
	Tue, 22 Feb 2022 13:02:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7216617B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645531404;
	bh=Smc0hHMkWk2MfbJj2r2nDBrTAfS0RY2loBuD8DlZ844=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=anmJaXVLeKIC7Y5VPMI8a55fISQmzvsFDGFivop5uEkfYNSer/9ZXv/4BTivPxREA
	 24rLqL6ItzFpchM13kE/Nc49zFEFG6trZtyPYwHYsD38oPCQhGlBtYitnk6z1o81XZ
	 nNqoELKIWpKAYL4pFDMemY14U8wP5i2GA5MOB4Uc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 971E0F80536;
	Tue, 22 Feb 2022 13:00:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C3C0F8051B; Tue, 22 Feb 2022 13:00:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1675AF8051A
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 13:00:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1675AF8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MNCET+Ql"
Received: by mail-wm1-x32c.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso1613323wmq.4
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 04:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/v7fSBOaCbI8QU+K0IcaQnfo96v3GrLJ30LztRsyJ5g=;
 b=MNCET+QlGmQPanpZT4PW8Xckp97SRYGXNmqWF8PHeTF+q/fMJ3EjRHoltz4BANS63a
 36raoLXF48uS0eRqLHydIP69Jeoa5vGquoluLa1pPQkVH8UY6SiqEj0/LbslxpX+quXv
 VCBj+sTZA67FDJB4xmxwNRb2RKexFd9R0R4sSK2j+3hcYa6fYB7CYb7wxIHQX6xHSYRc
 G6xj9c97QI6G0+ZFzjuQ4f6COeQTWLSsMRQ/wLryyDvZiTnoE6b089OWuadmMpY6v59O
 yYtu5KrrKShNzIjtz02d1CXu8XYmSIeAbv5MpcB+FEesO4T4/6kFgBNfDejyWTOMu56m
 ZjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/v7fSBOaCbI8QU+K0IcaQnfo96v3GrLJ30LztRsyJ5g=;
 b=2Q9hbWGaJ2tNLsTwLuAQyWtIm65+Q5KkAB1TfwxRhz4KI/Pmxhs1ttxFUuM8ez6+CB
 l2sQielYEfTiB69uRsE97EcJIK6cGz4+w5dcrEYD46allmuFIb8D10iQoqDCqzcPqXfo
 aqYQymWhDwYV6gOhmvAUA/O+7Xk9j+Y/rJF6CRMQIeERK/JJ0IUyDJNST+Gs2VLeJ7mL
 EiSzTGjqtE89hpej8iHzJkP5jN3wA4XFIY/xv7Zf7+wpecCnyNUxJU6bxzfn4rr6m6oL
 4YnlGFi/eGta97CSei0CNBl7koIfRKVjfZvjFhd4yv830nGOafDVxGx+VUFje+Gf5/yA
 vV1A==
X-Gm-Message-State: AOAM532RVFRLN4rZz3V3AScRWmpaAuD8K3Xs8URdpaIYszkGdsuA8bv4
 LiZZ3q0zaxWT6XVMTf9LlQZHAt9vhHad9w==
X-Google-Smtp-Source: ABdhPJxm5KxVyTSngzgUaBGqqhFnBKRzEk5moazJ/aSxsnm0IlLurKgepYu3YSWeNUtxyAZEFPtoMw==
X-Received: by 2002:a1c:5451:0:b0:37c:71d:5c40 with SMTP id
 p17-20020a1c5451000000b0037c071d5c40mr3092013wmi.1.1645531199996; 
 Tue, 22 Feb 2022 03:59:59 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id a18sm50014661wrg.13.2022.02.22.03.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 03:59:59 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 12/16] ASoC: codecs: va-macro: fix tlv min max range
Date: Tue, 22 Feb 2022 11:59:29 +0000
Message-Id: <20220222115933.9114-13-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
References: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
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

on Qualcomm codecs gain tlv control specifies min max range as both
negative to positive numbers like

SOC_SINGLE_S8_TLV("... Volume", ..,  -84, 40, gain)

However with recent boundary checks added in commit 817f7c9335ec0
("ASoC: ops: Reject out of bounds values in snd_soc_put_volsw())
setting a value above 40 gain will fail.

So fix this min max range correctly to
SOC_SINGLE_S8_TLV("... Volume", ..,  0, 124, gain)
so that users can now set gain correctly

Fixes: 908e6b1df26e ("ASoC: codecs: lpass-va-macro: Add support to VA Macro")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 0fd0139e8229..555675690166 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1256,13 +1256,13 @@ static const struct soc_enum dec_mode_mux_enum[] = {
 
 static const struct snd_kcontrol_new va_macro_snd_controls[] = {
 	SOC_SINGLE_S8_TLV("VA_DEC0 Volume", CDC_VA_TX0_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("VA_DEC1 Volume", CDC_VA_TX1_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("VA_DEC2 Volume", CDC_VA_TX2_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 	SOC_SINGLE_S8_TLV("VA_DEC3 Volume", CDC_VA_TX3_TX_VOL_CTL,
-			  -84, 40, digital_gain),
+			  0, 124, digital_gain),
 
 	SOC_ENUM_EXT("VA_DEC0 MODE", dec_mode_mux_enum[0],
 		     va_macro_dec_mode_get, va_macro_dec_mode_put),
-- 
2.21.0

