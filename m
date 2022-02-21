Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD5C4BD9D3
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 14:13:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABA5516BB;
	Mon, 21 Feb 2022 14:12:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABA5516BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645449194;
	bh=sf/C1D3uZu2irFWKc3hKP9pwQ55D0OiPpXYgIvqHxb4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vlblvKZj8TPlMaPYX5NDQe6LplUUfT9Uam6XvlmvEFiTv56FLTfxOaezSOkrP8TrH
	 DkSNDHGcsuncNsa5rY93tUfIb82H6fJyllwUM0srmPM4LKGYjkHOvShas6eWgX5Bdw
	 raW/KAB+fudU6tfYZXfP5oQd4skX/6zQ0RZLda6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11CB2F80528;
	Mon, 21 Feb 2022 14:11:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 298F8F80520; Mon, 21 Feb 2022 14:10:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1BBDF8047C
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 14:10:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1BBDF8047C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="T5M6rVpQ"
Received: by mail-wr1-x42f.google.com with SMTP id o24so27025825wro.3
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 05:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vyVwZE5kS8xGdR91o+WjovvMprsI53ZLyaYZnmErV2U=;
 b=T5M6rVpQg5CiNr0ALeXidXgJ27NA+ORiCY2Lluwps+MNSbQ6BG7XRz9qUUmz9jpiAk
 lO8F5HA6p6nn2XwUZ2QXVPvwzILoFklTOwYzQ8dj7F5STNqv3ZWHXR6BK/iyTsyfx/q1
 qtH7bL/pdBvtx40noEamhS+8PkOAm1+FOXNWMGzCUXt4ls3KcE8E6sEKlbKgoXHS2ygq
 fZFtH8gyBLWxsUoMTZ4g9ekdM4Lwxip+0iYdGeSZCqcdm867uR2YqICwSm9R/ih6nvvk
 E9h2iZT2/iZyOQjcSTxyVGT7WHaZaH6Bf7vvtdF/t0PBj4wTAFens0KXhPeOFwqL9/fB
 fz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vyVwZE5kS8xGdR91o+WjovvMprsI53ZLyaYZnmErV2U=;
 b=HbuuJu2IIbrzgfv6LALnmYg5eQm5R6sYmlt8qf6rJXGmWSFNvz8BmZZXBfCPrsRUiO
 B0luHNONV7/vxBcieXjTnu/+ph0etBg1VaSU9skZw9XRz9Oft4GQ5oOwSBHkm+RP6uKZ
 yzXCGybUjG1byFVDXY7iBxSOyb7FxyPkNXTLd4WT6jb9lKMMW8ml9QV8n3h0Yi3vHAnt
 aL2s7H6ii9Zk9sCXFsb6K7wgVh+3y09kBzt+mzEYUGERud8jPgQixdAiofPSzUZm4zjl
 rTGanmo8zUxtgTYDkVupLvp4+lutAKoz+IOYYapZkE3iWsdEvv2jAX+vQuFVKcMGfX4N
 F3hQ==
X-Gm-Message-State: AOAM532fDVeiH+Y9HXWj+tv8XV8xl/Rt8pgF5ucbHkzcepuTMyPP2f+1
 1/oWEcfSVGClyptHsRIorvOWkw==
X-Google-Smtp-Source: ABdhPJzoGZPyDMK/rd4UpWIt18POgV1l3Mt9/on0ljpwn4kVUcoE59SuHBLlq6qeR6BQ5cDdBUGS3A==
X-Received: by 2002:a5d:6488:0:b0:1ea:7bfa:41e1 with SMTP id
 o8-20020a5d6488000000b001ea7bfa41e1mr394408wri.563.1645449048801; 
 Mon, 21 Feb 2022 05:10:48 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id 3sm49412801wrz.86.2022.02.21.05.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 05:10:48 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 07/10] ASoC: codecs: wcd-mbhc: add runtime pm support
Date: Mon, 21 Feb 2022 13:10:34 +0000
Message-Id: <20220221131037.8809-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
References: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
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

