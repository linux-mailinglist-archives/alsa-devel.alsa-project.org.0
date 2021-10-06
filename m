Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2F4424430
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 19:29:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF2691669;
	Wed,  6 Oct 2021 19:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF2691669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633541382;
	bh=CNfpsRXLK9TPE4J3pEErlimUeipeP2CmDKHuRUyoc6k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tf1PeJpOZt3gaNVh6brG4VPkLMmJn5GpeualLPLbHD2Rz7QPs0HCEsN0POEYCOTjH
	 tHkSu9x6eDlWJ/ZYpNPvW5E1om97DQmzLfVWfWmr4K+QJdKj/yg5OEfC/3APZjh1A2
	 MAVHehx+TbqiwnXrIwRpOd16WlNctXbl3TK2yRdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 188B3F8010B;
	Wed,  6 Oct 2021 19:28:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93D04F8010B; Wed,  6 Oct 2021 19:28:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B502F80229
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 19:27:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B502F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pXchB/eJ"
Received: by mail-wr1-x42d.google.com with SMTP id j8so11056070wro.7
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 10:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uxwyR1SSXYQBt6jgS0PCiuFdMHEtTjrNhaid3BJiZuI=;
 b=pXchB/eJd7RBAP0ZXlMZ6hZ/P8D6UHC17BiBmhNFrCAGEUd32MGMA7I/tmcjc+A8By
 0Gqvng6bC8GsB2asW9AW2OI2OHH/vyzkIev1eg+Pd1Ha7BinTVyY81ZPdmosHyw43Tog
 R0fZGOyZIssQKM7s2EVuOv3vsoqZ/YRUxA/BukU6w6gBsj7W79S9I7Kgvl3ys7ZIQcZH
 sz1lJvbtJx8XPy2BgZjRKTozVV+L+fQLMYhTBK0hpPYttp1tVN+9yKVC5LVZ7Lg1fpW2
 /eofFOolBpPzQEXMrLu22sNMysatwELRekS5nSFVi61sXTFpDhx3r5arQKIsXpoR/kT3
 3Wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uxwyR1SSXYQBt6jgS0PCiuFdMHEtTjrNhaid3BJiZuI=;
 b=lVH0rcfLEr5JMfHr3JxveyVniFJdjclbBqAkYh3gLRukpAaP2X64vikChCsObvKevp
 K9IMS9sHR+yCM3THxPyHEAhSDBCWgq7bNs7FhqdI2R0DH9/BEQL+3nI18aqLss1gPY7r
 ceaQN7IKWn9W82m5qhKO4otYTv0x5bgFLmgkU/nepK9twfxBWaUK1ZQSMmdXZmNi5J4s
 uK/ZLGFMqyQiznSEVd10OzwWv8Z8CxzgailpZJBgLsCY3VlGtE5Hz6+cEcVbkez2K4cT
 bBYkrgkVBL8oVoW9+dNaA56FHYnZx4x7YnYIS8gVvzAK23uLQWjU004lM2WLmFoIat8u
 HZRg==
X-Gm-Message-State: AOAM530lXBnIInT9qtZL7oXMJ+tq7KqTNQOnkMfwAJxcxTSaCl2whAs2
 lQqEStoMRVwH9Gcr0J4JvSsR2Q==
X-Google-Smtp-Source: ABdhPJx6URigulL9jxR4AWSH9dXjdVcRlIpD5s7kjpJfSYAqV17Eb4bKuI7JV+VOrllGgFem0Qsehw==
X-Received: by 2002:a1c:2b02:: with SMTP id r2mr11384374wmr.55.1633541275300; 
 Wed, 06 Oct 2021 10:27:55 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q204sm3976475wme.10.2021.10.06.10.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:27:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: qcom: sm8250: Add Jack support
Date: Wed,  6 Oct 2021 18:27:45 +0100
Message-Id: <20211006172745.22103-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211006172745.22103-1-srinivas.kandagatla@linaro.org>
References: <20211006172745.22103-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, tiwai@suse.de,
 plai@codeaurora.org, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
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

WCD938X on SM8250 MTP is connected via TX macro which has MBHC support,
So add this jack support in the soundcard driver too.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sm8250.c | 61 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 9f2f0598a222..b2ca2579810b 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -8,6 +8,8 @@
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
 #include <linux/soundwire/sdw.h>
+#include <sound/jack.h>
+#include <linux/input-event-codes.h>
 #include "qdsp6/q6afe.h"
 #include "common.h"
 
@@ -18,8 +20,66 @@ struct sm8250_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
+	struct snd_soc_jack jack;
+	bool jack_setup;
 };
 
+static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	int rval, i;
+
+	if (!data->jack_setup) {
+		struct snd_jack *jack;
+
+		rval = snd_soc_card_jack_new(card, "Headset Jack",
+					     SND_JACK_HEADSET | SND_JACK_LINEOUT |
+					     SND_JACK_MECHANICAL |
+					     SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					     SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+					     SND_JACK_BTN_4 | SND_JACK_BTN_5,
+					     &data->jack, NULL, 0);
+
+		if (rval < 0) {
+			dev_err(card->dev, "Unable to add Headphone Jack\n");
+			return rval;
+		}
+
+		jack = data->jack.jack;
+
+		snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_MEDIA);
+		snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+		snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+		snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+		data->jack_setup = true;
+	}
+
+	switch (cpu_dai->id) {
+	case TX_CODEC_DMA_TX_0:
+	case TX_CODEC_DMA_TX_1:
+	case TX_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_3:
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
+			rval = snd_soc_component_set_jack(codec_dai->component,
+							  &data->jack, NULL);
+			if (rval != 0 && rval != -ENOTSUPP) {
+				dev_warn(card->dev, "Failed to set jack: %d\n", rval);
+				return rval;
+			}
+		}
+
+		break;
+	default:
+		break;
+	}
+
+
+	return 0;
+}
+
 static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -192,6 +252,7 @@ static void sm8250_add_be_ops(struct snd_soc_card *card)
 
 	for_each_card_prelinks(card, i, link) {
 		if (link->no_pcm == 1) {
+			link->init = sm8250_snd_init;
 			link->be_hw_params_fixup = sm8250_be_hw_params_fixup;
 			link->ops = &sm8250_be_ops;
 		}
-- 
2.21.0

