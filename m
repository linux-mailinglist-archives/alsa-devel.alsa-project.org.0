Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D4F39B886
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 13:55:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 712A81731;
	Fri,  4 Jun 2021 13:54:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 712A81731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622807719;
	bh=UuNjd4Aun0I5ZwLHTfi60btQs4j2cHqaqe4SHIvqrGM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XvToTLjUqlkwjfNZJixNlOUJgXsuP87d4JUPxTEzxwTLaAd0EGaYUyj2vh/9Zf0tZ
	 xNMHMyqBA/ZD6xEDdIGfZFPyaoQ5WCwjAV2V+bTACOuDA79gO69JAbmQ73Ii10TGRO
	 t2QNuwsvX5Ed5R1b8ce0TejgJn/e6NarkouwaW2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57106F804C1;
	Fri,  4 Jun 2021 13:52:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D474AF804BD; Fri,  4 Jun 2021 13:52:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4B1EF80431
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 13:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4B1EF80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="f9JycFgO"
Received: by mail-ed1-x52d.google.com with SMTP id g18so8795589edq.8
 for <alsa-devel@alsa-project.org>; Fri, 04 Jun 2021 04:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1RUP68I3HwNhuXkqx8NfMcQ+Gf4uaCrCeHBt2iSVUE0=;
 b=f9JycFgOvdiHQiHOBO/jYEJjkIyxvmi829WYnht/Iug8GevPoV+bkkrt2d2T6GQEDG
 o8xbcOwQo0j+SDXJtjWqT6oDDc8LWq76ZEU8sXN48T7CAxlKwd4MByqTnxQxoVwU77Vd
 klP5SCZJKwN3B7ddQAHBF1hb37VKUkc8fSPMhJBq5NqdY9VmjsOrvZVuqC6a4zNAy1ze
 62Kq/ORU21mrHljkgdHmuWh+dVd8LcsnGoc/c4od4E8BX/lJqcEPbRJYFUoEFC2QjfZq
 g496bfFMlFa+MdJRDklyDAyTsv+fMuHR2cr3EgPHo/qMV7vj2nEJTREYWJ7vM6MBnhVN
 gMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1RUP68I3HwNhuXkqx8NfMcQ+Gf4uaCrCeHBt2iSVUE0=;
 b=GWyhD7JpKx9Ju8LlZYGvvsILP9OrFUjTjbZ4RX6533Wu8RMTm6kpiHGdUkOjDbLpfC
 jgKvQWW9j9qua1eluWucDS7rgsdZDwnctCo2585oOjVYrn9GaC9bHtiWNmoWz+0XbVGf
 0BKwp8ZFpRWtgjxc3abFmep/sUX3ZC75wq9bCvPUoB1xfnA5gw80SrPSx6NkuOlLETQP
 fUQr5iRdy2C/CI4xgwXziyV7xTukLlJN+vpYbPlHJfA1RApPlQCpQUzYt1dMfUDyxHpI
 khdolTq5MZPYffcZRlo9tEAXRC0WQNEeV73q9+myE78qNYvYq2Zvlo0TYxhS2fEvo4I3
 Hqiw==
X-Gm-Message-State: AOAM5334jdrIgQ5mTsvoYVi1XO85gicbIuS6NSWIMQI3hvu8sKo2E0hU
 JCxXM1VGTnWv4w7n8g2G8owG7Q==
X-Google-Smtp-Source: ABdhPJzDgNHamWELP1ANrh5hTiuWCkMg/JkfPPGz4kOH6i8YxZ8+Sf0m2C8gWpLOblkVy4xTKvqUjw==
X-Received: by 2002:a05:6402:40c:: with SMTP id
 q12mr4242123edv.0.1622807562067; 
 Fri, 04 Jun 2021 04:52:42 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x9sm2805527eje.64.2021.06.04.04.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 04:52:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 4/4] ASoC: qcom: sdm845: add jack support for WCD934x
Date: Fri,  4 Jun 2021 12:52:30 +0100
Message-Id: <20210604115230.23259-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210604115230.23259-1-srinivas.kandagatla@linaro.org>
References: <20210604115230.23259-1-srinivas.kandagatla@linaro.org>
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

