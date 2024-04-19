Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9142C8AB136
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 17:02:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4F4FE82;
	Fri, 19 Apr 2024 17:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4F4FE82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713538955;
	bh=Yaor62sYcDjIvBNPTk74x1zdaU8YS2t8ezX+C3LnvTI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gOLVlkvsL5OCccZoMGONf8nyLAnYx/ZJ1/mpND+3vBBL2XnJklaLZMyr9S4y/eUol
	 M3PSvKl0qMIfIBwmO7UwWzYalku6QehCL1pslKIs9jQgiP077q/zU7hJ42dHSgBvrr
	 y3nJjT7oi8cbcbUYE0/zjbEZc9qhVbjfozrNP3VM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A48D2F8057A; Fri, 19 Apr 2024 17:02:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07DC6F8058C;
	Fri, 19 Apr 2024 17:02:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ABB4F80494; Fri, 19 Apr 2024 17:01:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34F33F801C0
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 17:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34F33F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QqthIG6/
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-419ca3f3dd0so2894075e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Apr 2024 08:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713538909; x=1714143709;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=du5C0hgzbqVxZXImYAbxQy35/QgbiTxBZrKV2sLLphs=;
        b=QqthIG6/qL193rJtPAS3qTNnjRnVEthV4ycLlj0Y+k46e6LIaPuysOgOgjVi6qU2s+
         D3xxaprCeMFakMFepfIlATrq5M1RIOhMEhaWlT8+MsdxT2JMt9cqcSzCsOg7eZ0aeN9q
         BKfkzrZojdmJUUa940bHeTY8u2MAH0wI6S/nffOt+n2juJ7W0UzvG7nAE65z+kCjl27Z
         eXy5blXFYB1ToXFbw9XBZH96/Tdrk5qPWJFnQ0L6vRNqCksofJTSmpE0PmbJZ1P0HznH
         suqD9XPsRnfyaGfJymQFypb3GdS8oq969hOHDj2hZ7QtpyWsLczMjT0BabKmi9Z+CLUd
         XgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713538909; x=1714143709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=du5C0hgzbqVxZXImYAbxQy35/QgbiTxBZrKV2sLLphs=;
        b=GWlHm5fEATbmPOQtAaoc2als1PbbmwEsPMHeagb0S12eZUUUcBbYNv/NWfk9RjCiWO
         cTUNS/wJ5MndqY3qX33keHCEIlgn01Fb0Obyx1bCeFhNU+vBFSJvIYQobFLtQ+bdRm4n
         8iJLNQjtUN+9dh9lxk8xi4affAeaAaWjC/PRjWk3OopGI8b4DGiYl48Fv+i6qzfFAI59
         GRWJ9Q8B8Jv54/GFudNBcl0z0/dQaVEpw1Txxlm6PYZDlzPPQrI3+N1TDCpu7bsiChZv
         eIWvS2W/SAXEcxSceVuOUQkSpoKI6msc4vCmvZKFDj7AQUjJ03V4L1xOE1oob0rQeDnV
         vMuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXusZKO2j4bC2mhpypQh6IyXKn2y64NJ1jNlfB1y+JLRe/wGnGCby0V0IMWtOGuH9JNibRR8ceQzrGZfVLXmGjrwtTIldktL6s28O4=
X-Gm-Message-State: AOJu0Yw3YJzPX+fQKqjssN4Dm2XTaYOt+UFLwtkCLHYF3Jtrv9yLMi0Q
	gZ0a/voOVdvdfmtHSDO4o/AHoMm11JujMu/Lj1MHyhn/io/Aw6Q7EaWuuTTs16caOgSoF8AMSie
	U
X-Google-Smtp-Source: 
 AGHT+IEIK53TDBowNSsIB8o/KBchyuj/pRPeFMmAXDj0MXN4/pA43aqm2tY0y8v2ZBLiX0IgHACxzQ==
X-Received: by 2002:a05:600c:3108:b0:418:b425:d7da with SMTP id
 g8-20020a05600c310800b00418b425d7damr2069794wmo.32.1713538909053;
        Fri, 19 Apr 2024 08:01:49 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b00417ee886977sm10660462wmq.4.2024.04.19.08.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:01:48 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	steev@kali.org,
	jenneron@postmarketos.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 2/4] ASoC: qcom: common: add Display port Jack function
Date: Fri, 19 Apr 2024 16:01:38 +0100
Message-Id: <20240419150140.92527-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419150140.92527-1-srinivas.kandagatla@linaro.org>
References: <20240419150140.92527-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CLXY6ATXLEHEIYZQDMZQQYNWLYYVPYQO
X-Message-ID-Hash: CLXY6ATXLEHEIYZQDMZQQYNWLYYVPYQO
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLXY6ATXLEHEIYZQDMZQQYNWLYYVPYQO/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Add a common function to add Display port jack, this can be used by
multiple board files and avoid any code duplication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/common.c | 30 ++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 747041fa7866..50abd4acaa3e 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -7,10 +7,14 @@
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
 #include "common.h"
+#define NAME_SIZE	32
 
 static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+	SND_SOC_DAPM_SPK("HDMI/DP0 Jack", NULL),
+	SND_SOC_DAPM_SPK("HDMI/DP1 Jack", NULL),
+	SND_SOC_DAPM_SPK("HDMI/DP2 Jack", NULL),
 };
 
 int qcom_snd_parse_of(struct snd_soc_card *card)
@@ -239,4 +243,30 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
+
+int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			   struct snd_soc_jack *hdmi_jack, int hdmi_pcm_id)
+{
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	char jack_name[NAME_SIZE];
+	int rval, i;
+
+	snprintf(jack_name, sizeof(jack_name), "HDMI/DP%d Jack", hdmi_pcm_id);
+	rval = snd_soc_card_jack_new(card, jack_name, SND_JACK_AVOUT, hdmi_jack);
+	if (rval)
+		return rval;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		rval = snd_soc_component_set_jack(codec_dai->component, hdmi_jack, NULL);
+		if (rval != 0 && rval != -ENOTSUPP) {
+			dev_warn(card->dev, "Failed to set jack: %d\n", rval);
+			return rval;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_dp_jack_setup);
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index d7f80ee5ae26..3675d72c5285 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -9,5 +9,8 @@
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
+int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			   struct snd_soc_jack *jack, int id);
+
 
 #endif
-- 
2.43.0

