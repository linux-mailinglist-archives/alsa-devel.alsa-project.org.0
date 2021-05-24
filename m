Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6850D38E518
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 13:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0644844;
	Mon, 24 May 2021 13:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0644844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621854628;
	bh=UuNjd4Aun0I5ZwLHTfi60btQs4j2cHqaqe4SHIvqrGM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V/9gbZE9gqXPsBrd9gzHcgnz0arVCh8Al5yQr+JCinKLrDV46DHkQDl/iMCmiTXOI
	 lcjrKQUB7MUp70g4IIK212hXh459Jj/MkV42upA7qo3U3dGWfVO5VpqbBciN0Zf4wG
	 SgnxfN04JylOcXgxQHJtyrALmuEIfbrIRwAxACm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF972F804B0;
	Mon, 24 May 2021 13:07:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B27EF804A9; Mon, 24 May 2021 13:07:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09C94F800B8
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 13:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09C94F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="e0P9PDID"
Received: by mail-wr1-x431.google.com with SMTP id z17so28094479wrq.7
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 04:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1RUP68I3HwNhuXkqx8NfMcQ+Gf4uaCrCeHBt2iSVUE0=;
 b=e0P9PDIDn59yFnHeDut/LBVMSKTB+WulaHlndXolRHicxhZ3f9Qk0xoRkiXowaNubX
 8PP4jIbq2eo4TfxpoK1Ua1Uc1vYNRi6GBhXl8ImK4K8uF4yPn4fCIsZ+I+fURcsFXHfo
 hYqLJip34CignAkIoGkCWMlXrvT7kKVbqfzadC+MBKr7z4fOf90Vxw7P6+SVH/QpjX36
 JYOvW6NpUEo29tYON124o+Az8Mqv1Yr2v1TVWcvfvbqNECAyCnfw1lxUXOPqeDzw5GR6
 MLhdSk0XxwNY8guO8PA+yQTZuiIK8fE9TO6YhN4k/AE6wf/+ci9G1xPbcPfLSU/w12vM
 TJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1RUP68I3HwNhuXkqx8NfMcQ+Gf4uaCrCeHBt2iSVUE0=;
 b=OtTse6i78addQXb1I2KSj6u5D8ns1lreXK0H+6shhHI04CKRRfYWmvKMl2p+P1Zdgh
 rJd+Q4PAJbjQ28m9jCBjT+nGN5mu1Y4P8AJIO0kDj1teLpAwcDnATlh7i32S5PLZJoTm
 Pd7Y+sMQvcGCdlsH/LWsYu/WXAUdkJcYvu9049lct1xZ2hjVw8toL7DMw/r0NLgCXpNA
 pNX+BTtemg9Dv4lJSRB3+CrEnhNzuhrJ0bP/8L/yQP2TX+FaHmY4sJT/LnAY3P+0LWk3
 AUapWTZT/0Pum4JZZ43dyn513hdQJ/B4RyEq6PdT6eXIGQBR2r5An1ikuMTmwkE+QYTv
 8MDg==
X-Gm-Message-State: AOAM532eWGoMI0Dd6ALvzjwe125jQ8XccJVQ50UoVzQJayRVJ4SB8caA
 q/erAK4yGBX0hR4kydxyystkqA==
X-Google-Smtp-Source: ABdhPJzi9GLp/45oFFd8/DlCNBsAgZZOYebEDhB5FTTfCuIOj2L150Qtq6d1rT7Po8grL9X5EPpd0g==
X-Received: by 2002:a05:6000:50d:: with SMTP id
 a13mr20798928wrf.130.1621854437515; 
 Mon, 24 May 2021 04:07:17 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x4sm7590978wmj.17.2021.05.24.04.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 04:07:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 4/4] ASoC: qcom: sdm845: add jack support for WCD934x
Date: Mon, 24 May 2021 12:07:00 +0100
Message-Id: <20210524110700.27077-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210524110700.27077-1-srinivas.kandagatla@linaro.org>
References: <20210524110700.27077-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sdm845.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 153e9b2de0b5..0adfc5708949 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -288,6 +288,14 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
 			snd_soc_dai_set_sysclk(codec_dai, 0,
 					       WCD934X_DEFAULT_MCLK_RATE,
 					       SNDRV_PCM_STREAM_PLAYBACK);
+
+			rval = snd_soc_component_set_jack(codec_dai->component,
+							  &pdata->jack, NULL);
+			if (rval != 0 && rval != -ENOTSUPP) {
+				dev_warn(card->dev, "Failed to set jack: %d\n", rval);
+				return rval;
+			}
+
 		}
 		break;
 	default:
-- 
2.21.0

