Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CDC4C2ACB
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 12:22:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4874F1838;
	Thu, 24 Feb 2022 12:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4874F1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645701778;
	bh=sf/C1D3uZu2irFWKc3hKP9pwQ55D0OiPpXYgIvqHxb4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o1Ppzk32d+p3nl/FUiFbY/IVCRfJqgALlAvqGGL4k01o9KVPZ9IGIfDHFv3D1HVMs
	 U28HqRemk5a2dNdj7B5xBRt8FcmYIbfQpYOCTnw0iN5dFSMewms0/l22xQBg2Fvy4g
	 ef2uulUjC2IkC2tQ/pFRsLMtzKWtvWLTWZKimrMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60E01F8057D;
	Thu, 24 Feb 2022 12:17:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A080FF8053D; Thu, 24 Feb 2022 12:17:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 474A5F80535
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 12:17:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 474A5F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FhYFTNt+"
Received: by mail-wr1-x436.google.com with SMTP id u1so2413176wrg.11
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vyVwZE5kS8xGdR91o+WjovvMprsI53ZLyaYZnmErV2U=;
 b=FhYFTNt+x3zszGAAc6gGVhzw88T2nJfziV8IMyz+t5pRZHT/uQUpG/qBROnyUaOInX
 t6ydRexMU9xeDqLPuLmfDwCcCcley4x4U48EGfc4N6WukdVvYf8DZlawzrDNKd8C7FFV
 piEKh1CH2rdUJ1/FKZ0wmHE4/5BGxIbZHJG5Ki926kOMial7fMtmRNM3mz5ZKagcqQjk
 tL4T4laIIAgpVqkFPZUZZNUePbs6aG+cQbu0t7oetR3A6Br0XbUtDfDTA3TY2Orv2o9P
 yyD0rt+BDpSTqiVwmhzn7HbDPMIxaJxxqu9Fsoa9qSLz8xyqDGQHvgI9lumtnZ6NGpm4
 c+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vyVwZE5kS8xGdR91o+WjovvMprsI53ZLyaYZnmErV2U=;
 b=khG+Zr7a0OvNI8TVG03mNz/UOhZ8pr1mKNOsgTVbDja0/otBqZVnBEzj5nXfIfw15e
 C3JpBSymOOrWO3wLtw4nVoiHYVkRAPvXeVWGeDd5q4B12vi6w91T4Lb0SWs83+VybqpW
 GOitWuH3fAQGis5EYs0JoAxVo47tDvISj+uK8gh19+35yO0yofzAMxiTPLfYkG+6/oKq
 qfCTOlTXtC8Vg7G7tsLBPC509O4lU7tc/tyshV1cIJut46Gf9RHZvTH404pzCxG8diom
 xrTrj9X4tN6QJb8566hPfSyCCHR1eLl/XFWSrBlXwg3hH5OHbIwv3jTWNsq5cNszh3U+
 c8aw==
X-Gm-Message-State: AOAM530DnYQCpDCmvMRv1t8hmc3e0nojzhbG+LSLrk3RJs15qFdskpzC
 bZsHhM9eP2BYc9bxLNdT07Nwog==
X-Google-Smtp-Source: ABdhPJyAAhwj8cEam23zueLna4wetFnGKEXHXXgZhuqBgsSnzAi5Elri6zJEPYc0C7b8nXQqOuN60A==
X-Received: by 2002:a05:6000:2ad:b0:1ea:793a:3284 with SMTP id
 l13-20020a05600002ad00b001ea793a3284mr1835943wry.63.1645701460101; 
 Thu, 24 Feb 2022 03:17:40 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id t4sm2245737wmj.10.2022.02.24.03.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 03:17:39 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 16/16] ASoC: codecs: wcd-mbhc: add runtime pm support
Date: Thu, 24 Feb 2022 11:17:18 +0000
Message-Id: <20220224111718.6264-17-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
References: <20220224111718.6264-1-srinivas.kandagatla@linaro.org>
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

under low power state a SoundWire Wake IRQ could trigger MBHC interrupts
so make sure that codec is not in suspended state when this happens.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 7488a150a138..c53c2ef33e1a 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -5,6 +5,7 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/device.h>
+#include <linux/pm_runtime.h>
 #include <linux/printk.h>
 #include <linux/delay.h>
 #include <linux/kernel.h>
@@ -711,6 +712,16 @@ static irqreturn_t wcd_mbhc_hphr_ocp_irq(int irq, void *data)
 static int wcd_mbhc_initialise(struct wcd_mbhc *mbhc)
 {
 	struct snd_soc_component *component = mbhc->component;
+	int ret;
+
+	ret = pm_runtime_get_sync(component->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err_ratelimited(component->dev,
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
+				    __func__, ret);
+		pm_runtime_put_noidle(component->dev);
+		return ret;
+	}
 
 	mutex_lock(&mbhc->lock);
 
@@ -751,6 +762,9 @@ static int wcd_mbhc_initialise(struct wcd_mbhc *mbhc)
 
 	mutex_unlock(&mbhc->lock);
 
+	pm_runtime_mark_last_busy(component->dev);
+	pm_runtime_put_autosuspend(component->dev);
+
 	return 0;
 }
 
@@ -1078,10 +1092,19 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 	int output_mv, cross_conn, hs_threshold, try = 0, micbias_mv;
 	bool is_spl_hs = false;
 	bool is_pa_on;
+	int ret;
 
 	mbhc = container_of(work, struct wcd_mbhc, correct_plug_swch);
 	component = mbhc->component;
 
+	ret = pm_runtime_get_sync(component->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err_ratelimited(component->dev,
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
+				    __func__, ret);
+		pm_runtime_put_noidle(component->dev);
+		return;
+	}
 	micbias_mv = wcd_mbhc_get_micbias(mbhc);
 	hs_threshold = wcd_mbhc_adc_get_hs_thres(mbhc);
 
@@ -1232,6 +1255,9 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 
 	if (mbhc->mbhc_cb->hph_pull_down_ctrl)
 		mbhc->mbhc_cb->hph_pull_down_ctrl(component, true);
+
+	pm_runtime_mark_last_busy(component->dev);
+	pm_runtime_put_autosuspend(component->dev);
 }
 
 static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
-- 
2.21.0

