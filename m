Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0CF80CB38
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 14:38:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5455ADF1;
	Mon, 11 Dec 2023 14:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5455ADF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702301936;
	bh=4JIESV9AsPIAldIGmu0p3weNFh9/RZ3K/PURDPyedJY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=V3lg4u8Hl04J2o31LERr0ixxJrOaFMn8+uSKlGYeqDpw05feLP90mYpmxc5u8QAAU
	 473h/NCf/z6l0ECe7H7XVXT8pR3IwQ7I8mWzQiDYi3thSwpbknOpl22IcPK+BJhz9b
	 Og2Q2Ik9+z53A/TZYLRsy3IjzTsfhMXU+R1kYS+c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A098FF80651; Mon, 11 Dec 2023 14:37:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AE2FF80631;
	Mon, 11 Dec 2023 14:37:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 711D2F80166; Mon, 11 Dec 2023 10:54:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9F1AF800D2
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 10:54:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9F1AF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RafuP96K
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1d0538d9bbcso39384425ad.3
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Dec 2023 01:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702288449; x=1702893249;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1CAjGizWvzIdnxcqD28quz07hmswkxp+9z0Y4S9z6jE=;
        b=RafuP96K4D1DwOh9RM9GCesb2CTsYgE7wqAn3vsVs9XJ7LZmuV4ZXrZ3CTfL/JjQef
         UiXqUvllc8ruZSxZpASya5ytiaRpFXBxdX3/Zr0wm+13dnJOEdzH4a2312pumyZd2z+6
         fHT+vEujRiCEBFePx2cU+uKBaXGR2OOp5hzXoz/t5oISluQfITlsbCwdE4WXJf5Zj7vs
         Il0N0Qm/Hm0bXCI/9UB5ZSHuh9wJbwBcqyDzZaXHGVy+rgQ59iBsp/hI9Mou4TJfaT/B
         Z68iMyG2Usb1AaDD8jv3uaqQF8wM5EbopGEYXJ51NIdC99MXQwSt6yhavdBaX2JdCvv+
         yGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702288449; x=1702893249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1CAjGizWvzIdnxcqD28quz07hmswkxp+9z0Y4S9z6jE=;
        b=wQqZ2RrHcuHqP/SrE+mAtHQItEoSc5GSLrKvI1DZ4brrbHoXFT2YCDPzNPKetunA4+
         bzc5mTIlqaulAXihTePbzPqwz26ClNixhB2Ci1o4T04AWmrIcUYmIsUsbE26NGxuC/2u
         077NSIYqpIAwGg8mjhNMJC+Hplop42S+rfNJK3H3tppu62dKuugFtI8DqoTW33H7SvXD
         iqYZvcHyi3quZ/4wojoMi4koWEMxKTFt0dv5fOrnv3ET6DX5sQPAzekoeJtGx2lyCXx0
         eVi/2t2q9qIdoWdM7v7JySBLcAH47gKPLeYHi8+a78VIGJAwReZTT+FytBSk4rxtMRle
         TFpQ==
X-Gm-Message-State: AOJu0YwxJfrofOVInJ8B5ilDzIop41ZeKDX6hBZQ1jy2pS8cumtTc514
	5IgFuEnGMFKY+e7y247aPEQ=
X-Google-Smtp-Source: 
 AGHT+IH4q9rRR48G64b0jTRAPHAn8Y3eZCGFF3OJxV+1DOpUKTGLJ4/QgeKp2uKXk6ZrqJyn5wInjQ==
X-Received: by 2002:a17:90b:1c0a:b0:286:815b:8c87 with SMTP id
 oc10-20020a17090b1c0a00b00286815b8c87mr2823495pjb.13.1702288449037;
        Mon, 11 Dec 2023 01:54:09 -0800 (PST)
Received: from localhost.localdomain
 ([2409:8a6a:5426:70b1:a6fc:77ff:fe50:e63d])
        by smtp.gmail.com with ESMTPSA id
 mt20-20020a17090b231400b002853349e490sm8149734pjb.34.2023.12.11.01.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 01:54:08 -0800 (PST)
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
Subject: [RFC, PATCH 1/2] ASoC: qcom: sdw: Add TDM support
Date: Mon, 11 Dec 2023 17:53:56 +0800
Message-ID: <20231211095357.4629-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: lujianhua000@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XDRAUW4OBWYQB5BL72YXZ5S2QVFPQAZA
X-Message-ID-Hash: XDRAUW4OBWYQB5BL72YXZ5S2QVFPQAZA
X-Mailman-Approved-At: Mon, 11 Dec 2023 13:37:05 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XDRAUW4OBWYQB5BL72YXZ5S2QVFPQAZA/>
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
 sound/soc/qcom/sdw.c | 64 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index 77dbe0c28b29..267a8cff01a4 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -4,6 +4,7 @@
 
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
+#include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include "sdw.h"
 
@@ -101,6 +102,66 @@ int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
 
+static int qcom_snd_tdm_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	unsigned int tdm_slot_offset[8] = { 0, 4, 8, 12, 16, 20, 24, 28 };
+	int channels, slot_width;
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
+		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3, 8, slot_width);
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
+		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0, 8, slot_width);
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
+}
+EXPORT_SYMBOL_GPL(qcom_snd_tdm_hw_params);
+
 int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params,
 			   struct sdw_stream_runtime **psruntime)
@@ -125,6 +186,9 @@ int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
 				*psruntime = sruntime;
 		}
 		break;
+	case PRIMARY_TDM_RX_0...QUINARY_TDM_TX_7:
+		qcom_snd_tdm_hw_params(substream, params);
+		break;
 	}
 
 	return 0;
-- 
2.41.0

