Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEF78ACE95
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 15:44:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33BDFEC7;
	Mon, 22 Apr 2024 15:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33BDFEC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713793493;
	bh=QPGkywHhxJwbRVmkKg4yvrDXLaFojPp13JVOp7ayaxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=un+I0Z6JsqFAp7BS0qDAxs9ZWJ4JStBuzfJk6mRdJuK5K+GXD1jYHw01MLewBs53J
	 YCSbP1cdVqyIwgwsJyxW2VvMjXe9aExbgHYHDsYA/J1LcpD845VTvjt6V/AgOw08J8
	 PRInnpCI/fW8qz3iiYmvEpTpRsxVHMcdLpzzH74s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E14DCF805E7; Mon, 22 Apr 2024 15:44:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A88D6F805BB;
	Mon, 22 Apr 2024 15:44:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4638AF80423; Mon, 22 Apr 2024 15:44:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 700F4F8003C
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 15:44:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 700F4F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=H5eWbWr2
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-34a32ba1962so3100529f8f.2
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Apr 2024 06:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713793442; x=1714398242;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DCZ+LurAPUpbkstxc4dh5F2TeDg5m/lAZJCQ3k7AMU=;
        b=H5eWbWr2A+LRv+viYcRvjRV0ayhFW8yXYLqbM2ee/WrTzzslZg8cZ0NKGnwilmNJ4b
         Rm+W/UmRvAcQ8kUWZtg43eAymoYqoMzFowUv9tgToj5n0Ed2U96Dw1xfeXpkNYAIHUmi
         K1WoMReaQUt+usjVGjmMXD3QboySSanRgYGHm4dE+fK05wsMyB55m7//LalQTABTiDBm
         9+zuDuKcqDjM3/5sjLmIhocjG5KhCDIva8uUvwCf5Xgv695jB8rhJhqtamcOPJxkQOhb
         BssPQjUKSleHMFpo5pzHC69wYYGA+PG0kzCEHjXBHd9jJQYv8WWk7KrDuQVb0V69/NSH
         LsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713793442; x=1714398242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4DCZ+LurAPUpbkstxc4dh5F2TeDg5m/lAZJCQ3k7AMU=;
        b=TO2+cBlhvbYG3r0QBtlAYojlrsOX1T+O37cY3NWNPhfzO0yY/WDZkewyk6f1Ug3qC8
         frL2Iw6KemfhKdLNRWdvncx2e1yCycO7CjS7cxngYdsqz5Nk3hsZlbdOa8E+ks0Hxe5j
         q152XZBlQOOczvfLtk7/2rYibh5hH+ujMokqefc69iM1LBoydPgTFQxfxH32+N4+kixv
         83QzqQPuwktPICrHBiKhUln/uHL8P7h80/QUly3mlPyZlS4TXr4yzbR8QEguJPga6qru
         4N8LIyq4jJQmJUE+ZtSUzRtLrA67faO4SxBuwhhY6bJ0qEBgfxw8i9qbgBFqCHLZflT4
         /GmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQtVLH9F5tRxPj7WzuALYpYzQByIa/GEcGFZhyNmDfwIKKGPxYuoWtgZf052BCvaTwxIR9nVci9in2Oz7M1A1pNYJlFLGzkd4J/GE=
X-Gm-Message-State: AOJu0YyccCzhGg4SHqDzUr69Pm3LWg6lZzrSYoxKgrtwF3vAsYn8YxfI
	bGjlbsb7WMpkXaTODvPgk/v2sdYsQsOiT9eSr90aS5++E//3X96K7Pd6Vv8dXy2laUPnhnLcAQI
	U
X-Google-Smtp-Source: 
 AGHT+IEq1VrIPR3upvHPe1XfDjkR/T391HRzjxsXogocBrP/QBTphSY+BSVPlcXSaBcwT4MucQNb0w==
X-Received: by 2002:a5d:6a07:0:b0:343:77f4:e663 with SMTP id
 m7-20020a5d6a07000000b0034377f4e663mr6457055wru.18.1713793442317;
        Mon, 22 Apr 2024 06:44:02 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c4ed200b00417d624cffbsm20731069wmq.6.2024.04.22.06.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 06:44:01 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/4] ASoC: qcom: common: add Display port Jack function
Date: Mon, 22 Apr 2024 14:43:52 +0100
Message-Id: <20240422134354.89291-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AHTJETL5R2JPV3DCG7SGGJNP4LIDOSHF
X-Message-ID-Hash: AHTJETL5R2JPV3DCG7SGGJNP4LIDOSHF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHTJETL5R2JPV3DCG7SGGJNP4LIDOSHF/>
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
 sound/soc/qcom/common.c | 29 +++++++++++++++++++++++++++++
 sound/soc/qcom/common.h |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 747041fa7866..3bfe618e7bd7 100644
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
@@ -239,4 +243,29 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
+
+int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			   struct snd_soc_jack *hdmi_jack, int hdmi_pcm_id)
+{
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
2.25.1

