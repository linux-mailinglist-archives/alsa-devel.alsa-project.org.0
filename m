Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94825228698
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 19:02:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F1E01664;
	Tue, 21 Jul 2020 19:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F1E01664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595350925;
	bh=kzmAqPPxibceeYYrnSClV1X0tTj1jQnUEjOh7vlv9v4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jz1B81yK12fPBrh79UUkx0RsQca7n615ZtcpGsTYlhNVqcVsSY/LlRNk6AcZRdFLy
	 NA3xS+uiJvsZJg2j771s6vKKJQibhO4SFbJf+CVe0ypkXUEV6Ug/c6HhDQP9mtuqFT
	 k30Ag4IYsNfI4qb9L2vLniqP+1H3domebWiNlmuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A739F8028D;
	Tue, 21 Jul 2020 19:00:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45D8FF8028C; Tue, 21 Jul 2020 19:00:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BF8AF800CE
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 19:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BF8AF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xUCw3RVo"
Received: by mail-wm1-x341.google.com with SMTP id 17so3605280wmo.1
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=29yfJ1iVy+Hi6g3ZFLKBYwMLLHqUdPID3gr+X5nhlQE=;
 b=xUCw3RVo9rgBVXxyK05KyzX+F+UEoCmKIdZ/zHQJDYM2hP4Z+669hm5koy0s34lI2B
 IV9kS+QFWRnLLNHlCEmI6QiCgV0euvZmz6ldotibeSGKE/ScbaHBTGNckYjtF9vKq0Wv
 8njmiz3BcPLCGI/e3NZ4Zi7TuzbsFwqOky/dKWuXgZVtHsIagRXvYQl/bXzhlYP991a0
 yOdi5hpvIoZJDqDCEDX+C0Aue50qp1MaeYxGtQP0dMZItXbB2/2ev5CUcEEyShXOry6L
 hsdOdLFc5HArkLtNWcd8JrPQ2cKrzrWNZesGbEqLp2wsu6IaIH95o4JJUDfsNnXjzFjy
 EoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=29yfJ1iVy+Hi6g3ZFLKBYwMLLHqUdPID3gr+X5nhlQE=;
 b=olb+d7fABzwW7dzQdP4bHTrNBLbKhb68+QymUvCLqgMgk3aBhYOrIQUREnwKOULIkn
 iedzr+Z/49SLT7+eMzrcJRq4V2mvSkHOjrPXwXnnnp2UGE6FY/KW6sZEWBiXINJHqpZE
 sRHCmkGXVM/eCJ48IuYKyPdqwFVW/0GSzg73Cwh7x9VGlb3T3rWOSJJ/LHCwGSPNNboa
 qJqTwhk+oKQv2vQgGKeDkJcEyK/pcFBrMYo9QxKL8RNa2d6fjsTPIlaIBaBDvfD8Y316
 CNY0Yur0MRh3DMinVWVA0o4ogndRVViMYOUT6bFQEj2vjj5hLpUffgOKQK5QMNsqEDyl
 wMfQ==
X-Gm-Message-State: AOAM531OAl6MRKUSx+amL5bgUMy4b/GhonsPZ/M1xVoB9Mn7VLP1vu8M
 2WnwQKlSaJYVrxlypD7NZPG3smKncx8=
X-Google-Smtp-Source: ABdhPJxd9qOgR1HG0URRCj3/zigqsoR04LiAQhM1WvcGVT/Zw5yPyzOn4ePe9YMuRmMcbgOc/oKw+w==
X-Received: by 2002:a05:600c:414f:: with SMTP id
 h15mr5200889wmm.82.1595350813907; 
 Tue, 21 Jul 2020 10:00:13 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id h11sm15526327wrb.68.2020.07.21.10.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 10:00:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [RFC PATCH v2 1/6] ALSA: compress: move codec parameter check to a
 function
Date: Tue, 21 Jul 2020 18:00:02 +0100
Message-Id: <20200721170007.4554-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200721170007.4554-1-srinivas.kandagatla@linaro.org>
References: <20200721170007.4554-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, vkoul@kernel.org,
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

Move codec parameter checking to dedicated function so that other
callers do not duplicate it. This is in preparedness for adding
snd_compr_set_codec_params() support.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/core/compress_offload.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 0e53f6f31916..af5824113246 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -566,6 +566,18 @@ static int snd_compr_allocate_buffer(struct snd_compr_stream *stream,
 	return 0;
 }
 
+static int snd_compress_check_codec_params(struct snd_codec *codec)
+{
+	/* now codec parameters */
+	if (codec->id == 0 || codec->id > SND_AUDIOCODEC_MAX)
+		return -EINVAL;
+
+	if (codec->ch_in == 0 || codec->ch_out == 0)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int snd_compress_check_input(struct snd_compr_params *params)
 {
 	/* first let's check the buffer parameter's */
@@ -574,14 +586,8 @@ static int snd_compress_check_input(struct snd_compr_params *params)
 	    params->buffer.fragments == 0)
 		return -EINVAL;
 
-	/* now codec parameters */
-	if (params->codec.id == 0 || params->codec.id > SND_AUDIOCODEC_MAX)
-		return -EINVAL;
+	return snd_compress_check_codec_params(&params->codec);
 
-	if (params->codec.ch_in == 0 || params->codec.ch_out == 0)
-		return -EINVAL;
-
-	return 0;
 }
 
 static int
-- 
2.21.0

