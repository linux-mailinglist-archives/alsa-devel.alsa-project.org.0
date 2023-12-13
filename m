Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6D38132FE
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 15:24:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39C7EE76;
	Thu, 14 Dec 2023 15:24:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39C7EE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702563853;
	bh=Fuj0acgS9892OPPT3C9X19AoFtGTRRk5+byYLdewqCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OYCHDJwuaXhn5tX7KY/nDaP5SHKQRjK3cEwUuGMF03no/yFeVJj2k5O+y7fEORqN+
	 KYP/TN7/wJnBONqnFXp5vR/h1RcgpSJR85ix2p3t3r931HyShye09K+DW2Yjcpz5MC
	 QiQwefTTYqUUrK24tU4abvXb6sI2o5TVoID472zk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8A5EF80604; Thu, 14 Dec 2023 15:23:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7807F80609;
	Thu, 14 Dec 2023 15:23:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4AA3F8016A; Wed, 13 Dec 2023 13:36:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42987F80166
	for <alsa-devel@alsa-project.org>; Wed, 13 Dec 2023 13:36:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42987F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GtphP0xq
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6ce934e9d51so4273603b3a.1
        for <alsa-devel@alsa-project.org>;
 Wed, 13 Dec 2023 04:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702470996; x=1703075796;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6o9+b/zVNvA4/sI4WpDCuE/Pf6Swn7qoeIeF6jMIaTc=;
        b=GtphP0xqCXLoNqLXMlFXxM57Y5Y/xjQeYLxAl66Mkinf9H7QWg8DGMODZtJmaQIsVB
         OlEROZJHOoH3fuD+qBgVvBkVhA9IzOt7rFWu2Njx8/H1hMiskPN/5yO61o1gk6WAxGTF
         pHjOVWQkbM3pWKCwuiUSIOWZ+M+r5aBPXcB+9qXvdyY+5gRxdaYlI/gJQMmfoqa/fx+3
         xOnFjtsOexwzhzopi4RZ6I7DE5MyiV89o78oHaUO8m8cy1khLFLuyJWaLBYVCYrnZO9k
         KmqJBUBTfS+lfOjyv/1NYgESLm7mbMXfOYuJuc1HxZrYLfddlNZWrJtI7SPMQ4oppuIx
         Wbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702470996; x=1703075796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6o9+b/zVNvA4/sI4WpDCuE/Pf6Swn7qoeIeF6jMIaTc=;
        b=JeW5NufHgfyPQRQwAaxDQjjgBqKHQyHH1lC3+NwsUCHnxe8LIy8MC+7rWMCL4EQtjm
         1gBgknyHtJSrj5xj/X92hqQjG8DgHTGSjP4kvYplan9tymCm+6hqfrXN7HKw0o03JsGg
         ucdRJv6FQOvlfWHoQnGaSyFbE5Q5QMmbf0+vhekn17J0FzR4aiyPQiPE0u7XUf6UqOVc
         n1bKhXcx21ebpOGBdX9R7z93/uHBUBjPVBD9zYUPvQ/62V9rFTu8wlDHuP51a1q2pH2+
         /v1QSuVLcUnB1+CVf1DqDxaX/Uj2nHoxdk3+j7EoFJ+HGsrPj05KKgpAVF4SiRQmEbl7
         sfvw==
X-Gm-Message-State: AOJu0YwS6w+tPQb7LQVYUvZ7GqPSO2pnQHVvTADl4GJl8I9QjEKn5COy
	JomNqkMK9OCsEHwsaiWYCN4=
X-Google-Smtp-Source: 
 AGHT+IGoI9nmTylJCkQMFXcqOVFTf2O9jztpOZQGEDTcSur6zbqLpwGGseS6UD76b141XTMjdovkrQ==
X-Received: by 2002:a05:6a00:3305:b0:6ce:6007:9bb with SMTP id
 cq5-20020a056a00330500b006ce600709bbmr4308409pfb.60.1702470996273;
        Wed, 13 Dec 2023 04:36:36 -0800 (PST)
Received: from localhost.localdomain ([117.189.237.103])
        by smtp.gmail.com with ESMTPSA id
 x3-20020a056a00188300b0068fe5a5a566sm10193584pfh.142.2023.12.13.04.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 04:36:35 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH v3 3/4] Asoc: qcom: sdw: Add TDM support
Date: Wed, 13 Dec 2023 20:35:55 +0800
Message-ID: <20231213123556.20469-3-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231213123556.20469-1-lujianhua000@gmail.com>
References: <20231213123556.20469-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XK3CS77CDZJKZ3EETQGAMMXNY4QOUS2S
X-Message-ID-Hash: XK3CS77CDZJKZ3EETQGAMMXNY4QOUS2S
X-Mailman-Approved-At: Thu, 14 Dec 2023 14:22:55 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XK3CS77CDZJKZ3EETQGAMMXNY4QOUS2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Setup TDM ports when dai id is matched to *_TDM_*.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
Changes in v3:
  1. split qcom_snd_tdm_hw_params function to common.c

Changes in v2:
  1. remove EXPORT_SYMBOL_GPL
  2. remove static modifier

 sound/soc/qcom/sdw.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 77dbe0c28b29..c07d878a1c18 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -5,6 +5,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <sound/soc.h>
+#include "common.h"
 #include "sdw.h"
 
 /**
@@ -109,7 +110,7 @@ int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime;
-	int i;
+	int ret, i;
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
@@ -125,6 +126,14 @@ int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
 				*psruntime = sruntime;
 		}
 		break;
+	case PRIMARY_TDM_RX_0...QUINARY_TDM_TX_7:
+		ret = qcom_snd_tdm_hw_params(substream, params);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to setup TDM err:%d\n",
+				__func__, ret);
+			return ret;
+		}
+		break;
 	}
 
 	return 0;
-- 
2.41.0

