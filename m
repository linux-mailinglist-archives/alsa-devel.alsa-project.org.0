Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC8C8132F1
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Dec 2023 15:23:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3764DDF4;
	Thu, 14 Dec 2023 15:23:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3764DDF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702563817;
	bh=S/04W22SUMMsskFK7t/1hkYGCYjmEWYt+My2rDblutk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ueA8/YobdlTdr9stWcHHmgkJZEL3MtXuCqdbHEJmW3R9hcD7QGC2yQcdYFNTRFkeY
	 OwP9esZw9qSyVSmjmgvrQSOlHh8q5IKU3TTSq38v5uRwpxNQGL6iBWGzcKxJysTwKy
	 /UkfBegLyH9QENwiqBUor4M165kNlg3/UOiGFIDY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54A9FF805BE; Thu, 14 Dec 2023 15:23:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DE33F80579;
	Thu, 14 Dec 2023 15:23:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6D54F8016E; Wed, 13 Dec 2023 13:36:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87B05F800D2
	for <alsa-devel@alsa-project.org>; Wed, 13 Dec 2023 13:36:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87B05F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Hb0ZbYG7
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6cea2a38b48so6071027b3a.3
        for <alsa-devel@alsa-project.org>;
 Wed, 13 Dec 2023 04:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702470970; x=1703075770;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rYGQmeoSqfkicHbElfiPvY8CF43myiqrL//zoYaASs8=;
        b=Hb0ZbYG75uY5QyDBUIEkwzyhBaonElqKBOX2FsLU0mJMlEE43k+z9LDvYs42bWEPxB
         yIL+hJDpIdHDqMzfaOlsiz6OjIrjFVBjQPqK8MHd8rbDlYauvQ/XP9jMQy2RhdvnE9xa
         2DGdaL/qSnlJR+KPIqZhsvmhnvMnIstfG4vmGpjGYaaxPfKPo9rod+ma6fqQHoKx08h0
         j2ojXNqo7bMqBDk1Yu40eX6O9RjHTVhnoIOS2eHFUSqWxnpKq6zkGY+w9VO32+9cHlIi
         1sarOtgR8W/ReCkpK/Xgrld/hcxcshbERRpgy0nLgfZOwd3EoAkfCI0YVX7DeimZkmI/
         k1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702470970; x=1703075770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYGQmeoSqfkicHbElfiPvY8CF43myiqrL//zoYaASs8=;
        b=JMSoIgEEF6jHP2bfr+IBdBCGt8r6fymFH96qVX8I5cbxpYb/OLaPVMFx+mCZFKd0hE
         Lk0pXa90wQ7CSOCRYb8Igr6EidgTb/uNTsHkLi/0briDNG1FnWySudl4FyGxVGcC4yVi
         wl0ctfe7/IvfmTc8dx1zIbwy6shS3CqDj77Vftw6owMPj6C370xjZDi4jcZiA+DPXswu
         rcVRIFwXc6NSqznOCrYk8GAE0tCNab5YfORPv7wLNUJYUFTiiCxSIhEZGj2v85a1u0MB
         d24T1zFHKTvezzwf2a8MmTCfHPz1lVklIDN+F4n32kSmy1UQRrnU5t7MvstsTJYebzT7
         tAug==
X-Gm-Message-State: AOJu0YzpC2p4Y0jpWq0Pm1YyOU2rxYVLxmP9CgoNHf+vHibI0WGgk0TE
	p9KeCQVQV5yQ+RU36ICfPqc=
X-Google-Smtp-Source: 
 AGHT+IEbx8JLvsojpRz5MPXpDktCT7We9sURVnTHr4RL4smgdlCApyjvryZnRRvdKFVASMyp0xtahg==
X-Received: by 2002:a05:6a00:2354:b0:6cd:e2c2:13d7 with SMTP id
 j20-20020a056a00235400b006cde2c213d7mr9982036pfj.23.1702470970088;
        Wed, 13 Dec 2023 04:36:10 -0800 (PST)
Received: from localhost.localdomain ([117.189.237.103])
        by smtp.gmail.com with ESMTPSA id
 x3-20020a056a00188300b0068fe5a5a566sm10193584pfh.142.2023.12.13.04.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 04:36:09 -0800 (PST)
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
Subject: [PATCH v3 1/4] ASoC: qcom: common: Add qcom_snd_tdm_hw_params
 function
Date: Wed, 13 Dec 2023 20:35:53 +0800
Message-ID: <20231213123556.20469-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DETUIL5XEACFDO5RWQTK3J36UG345QO7
X-Message-ID-Hash: DETUIL5XEACFDO5RWQTK3J36UG345QO7
X-Mailman-Approved-At: Thu, 14 Dec 2023 14:22:52 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DETUIL5XEACFDO5RWQTK3J36UG345QO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add qcom TDM setup function to support TDM ports for qcom platform.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
Changes in v3:
  1. new patch
  2. split qcom_snd_tdm_hw_params function from [Patch v2 1/2] to here

 sound/soc/qcom/common.c | 69 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h |  2 ++
 2 files changed, 71 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 483bbf53a541..c0ab201416ef 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -5,6 +5,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <sound/jack.h>
+#include <sound/pcm_params.h>
 #include <linux/input-event-codes.h>
 #include "common.h"
 
@@ -13,6 +14,8 @@ static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 };
 
+static unsigned int tdm_slot_offset[8] = { 0, 4, 8, 12, 16, 20, 24, 28 };
+
 int qcom_snd_parse_of(struct snd_soc_card *card)
 {
 	struct device_node *np;
@@ -239,4 +242,70 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
+
+int qcom_snd_tdm_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int slots = ARRAY_SIZE(tdm_slot_offset);
+	int channels, slot_width, tx_mask, rx_mask;
+	int ret;
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		slot_width = 16;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		slot_width = 24;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		slot_width = 32;
+		break;
+	default:
+		dev_err(rtd->dev, "%s: invalid param format 0x%x\n", __func__,
+			params_format(params));
+		return -EINVAL;
+	}
+
+	channels = params_channels(params);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		tx_mask = 0;
+		rx_mask = BIT(channels) - 1;
+		ret = snd_soc_dai_set_tdm_slot(cpu_dai, tx_mask, rx_mask, slots, slot_width);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
+				__func__, ret);
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL, channels,
+						  tdm_slot_offset);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
+				__func__, ret);
+			return ret;
+		}
+	} else {
+		tx_mask = 0xf;
+		rx_mask = 0;
+		ret = snd_soc_dai_set_tdm_slot(cpu_dai, tx_mask, rx_mask, slots, slot_width);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
+				__func__, ret);
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_channel_map(cpu_dai, channels,
+						  tdm_slot_offset, 0, NULL);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
+				__func__, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_tdm_hw_params);
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index d7f80ee5ae26..b583110f556e 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -9,5 +9,7 @@
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
+int qcom_snd_tdm_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params);
 
 #endif
-- 
2.41.0

