Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7541759609E
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 18:53:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F7B9163F;
	Tue, 16 Aug 2022 18:52:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F7B9163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660668821;
	bh=cOKOW6Qr6mDNo1tkDlsuY3XufA0SBz6ZJJlulea/tLA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dSPK33Kr8T/BCbF+GJadh0xVRPdY+bKvW++GUPs0k7yvDGpPXrjUQeXXMew9tockY
	 XPHhR7SRTwfJEWASNPaZZUbuHwU5L+6JebJ+kivvfnLSVvXHJpH66ag0kdU0MrNQji
	 sDIRRZn41NEM4VpRqU/jY9URsUa4l4ssnV/DgzrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 766A6F80424;
	Tue, 16 Aug 2022 18:52:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6EAAF8032D; Tue, 16 Aug 2022 18:52:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93801F80095
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 18:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93801F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="V6A6g0GV"
Received: by mail-wm1-x331.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso9707142wma.2
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=DCMW1NXMabz4d7Mt9akRmoqhQw6B70MamDwewtnPONg=;
 b=V6A6g0GVs5szfnz9eYHa8aWujK31+oD1w5CpP91pD2Dg4rVd8rdW3jyBo4gQ1PLEfx
 D0bwtTNo2Xw8x6Rww+vExhisQwkqq8AU2GVMBZDyJlpyIsvl5oCGmmfXpLzhFPXLARdO
 KYfjbUCnozsb9yXwR6fObT81/f9PECJmvIt81fn/u5Zmx3kC69RhMrxmK/FkWCUqC6vr
 VabNqwaVo05eznTVl67h5kc+xOmzuITZsHXzqJeU7WFp4wNUb08p/PE2ME5BdQwYK3g0
 530enDnxTssbmOr0DIuUqrWy6TcKbFu5SVNNWTjJ8J22nR0poXwqIaHZg17gQ1kIyC8M
 7dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=DCMW1NXMabz4d7Mt9akRmoqhQw6B70MamDwewtnPONg=;
 b=qL3oUfNg/9+DpTGJZQQvjQXRUQRyh0KCRKzfaQY8E1FTP2zbR2E7jC7DpR7QM7oCEj
 R71i9R+XjKBiXgKgSDIhw85NybhKCWTDMXJVCOaaBrahSkayuZ2j4XIuZIx/TuAzG06l
 zNpkpcCP6TDVgKI3+OHtkWbHFf1h93DRT3uRG2Y4fAqfJLtf/W8+xAPUBzBfq0bT9qDf
 lh7TSZ2rQ7ekPgOvY6hU7hn/ldal/n2nBPGuq3D44o8KCi7Vn2e+P/vOPtcdhuqdUpxO
 +vH3f/Jo4gcp8sPmKIaGI3L0R7FQWXeqTQX9oke1RV4S/WyW8maXrpyPYOd/80OCnX79
 VKCg==
X-Gm-Message-State: ACgBeo2cD/hyWalKwU92q6QljU48WhaKjd0p/6IF5o1Oka8Q7EjzilY7
 cz6E4CmEmE4vvtq6e0Kc7gYWNw==
X-Google-Smtp-Source: AA6agR4nlB/t63qkFK4MGf1n9FcJ+A0CvhVhjfGi1x+17RqPXfU5eUnRpAHO9e5OZS2IYBrt3YUZjQ==
X-Received: by 2002:a05:600c:198e:b0:3a5:d4a2:8896 with SMTP id
 t14-20020a05600c198e00b003a5d4a28896mr11652760wmq.140.1660668752783; 
 Tue, 16 Aug 2022 09:52:32 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a056000124100b00220592005edsm10536525wrx.85.2022.08.16.09.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 09:52:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: qcom: sm8250: add missing module owner
Date: Tue, 16 Aug 2022 17:52:29 +0100
Message-Id: <20220816165229.7971-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Add missing module owner to able to build and load this driver as module.

Fixes: aa2e2785545a ("ASoC: qcom: sm8250: add sound card qrb5165-rb5 support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index ce4a5713386a..98a2fde9e004 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -270,6 +270,7 @@ static int sm8250_platform_probe(struct platform_device *pdev)
 	if (!card)
 		return -ENOMEM;
 
+	card->owner = THIS_MODULE;
 	/* Allocate the private data */
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
-- 
2.21.0

