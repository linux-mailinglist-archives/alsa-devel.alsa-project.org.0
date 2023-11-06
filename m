Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D947E1EB2
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Nov 2023 11:43:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 136471F3;
	Mon,  6 Nov 2023 11:42:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 136471F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699267381;
	bh=vd5YW4KLFIfIobi6uZbsgtcVcLeruWFYRPMzBtcVP7o=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OZwJBsGXX0RkMUnD0Qiq33w+P9QcYVxJVgqEyhD3u1Y2h02Ed5LE6eUw9s+7fOg3u
	 71GKYtpRXI/QcBWJZTYuVFI0lBYDlcN4dcEkIwUJPQyQzy84mMj7hQ8ozFyD+YI+x0
	 Kt+uHb46vEhNNkzVIixYlsOnKT6Ll6741bVJlDMY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0E2CF8057B; Mon,  6 Nov 2023 11:41:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDA5EF8016D;
	Mon,  6 Nov 2023 11:41:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 939ECF8016D; Mon,  6 Nov 2023 11:40:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7197F80100
	for <alsa-devel@alsa-project.org>; Mon,  6 Nov 2023 11:40:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7197F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Agf443aT
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9d2e7726d5bso631419566b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 06 Nov 2023 02:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699267221;
 x=1699872021; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nbjwm+H7hl2EuKWl07XyZwpvz3KlHSIgvjF5mlsdjpY=;
        b=Agf443aTS6YGjx33Y/aU1rNeEHzWeAWCDALF6T75yh8u0+u+bz3Q8aSLeoGZN0bBMC
         MKQYNU4qiWAMiSf3GaYcQx9tfZn3qU77p9iSIwr9vLLTrlRD2AX5xLRlN97eC+R5kVfr
         MukmuBDGN6m+sUbZjwINPidJWQt55NiB68OLbI9HAPXYsEUaVHx8iKUYgpEEL764m8+B
         VCDqNeb6//DRW7c8G1VcxjULQDBTrduD2Zw39rYDdK18jsrHcTNCHzythvTdkrdXDRIK
         C5yLlEzi79kLsBtdgC1fJ73me8pEMidMkMCJVUcCcPDTKwWMKMyZHsJiAf72cXgZX3a3
         jS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699267221; x=1699872021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nbjwm+H7hl2EuKWl07XyZwpvz3KlHSIgvjF5mlsdjpY=;
        b=FMCr7aCH7zTupqxN8VyQ6q4S2OhjjIHNH2OHtT4ueC7pTsykcZMnHAafps189JAGEJ
         7+hTO+wIV9RSUm7BhUh6lbvGwcNzbYuIN4IdszJM+mM6g5NglHgCtREcCYfYwPqRaEOH
         ahQbFyw3PQO1B1Gb+PmOmT6qpDjS97Ebk18jvjtr1QIP+8388dz+NmS79p2ODPN24y7l
         eyeQWOG1bQcG7sgLhgWRNcTxucGRyiia7n34TcyjwEPsLoY6lWsEkpHp+xHaR2j+/VKv
         p3Sk2/8+rF0njoYA+jRVemTwbSqF14RJWqNC6t5zMGWg+52pOpWxIwW7z0QMN0HVjtnj
         LO2Q==
X-Gm-Message-State: AOJu0Yzp05XkeCfjxh/4uTLP9sbA+aJ/YuBZxtlofeJr7mrZaMicSDJg
	7h3TIyK0uV5ao78ccK3SaGd5iQ==
X-Google-Smtp-Source: 
 AGHT+IFQSEFW+kjzHL4YbOTboiy3Yei2pf8q/XEntCqWzMhAJfuTxx5YjXpbFrmK/nM3l/YHOn5kig==
X-Received: by 2002:a17:906:d554:b0:9ae:5db5:13d with SMTP id
 cr20-20020a170906d55400b009ae5db5013dmr14948952ejc.72.1699267221002;
        Mon, 06 Nov 2023 02:40:21 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fabf:ec8c:b644:5d3])
        by smtp.googlemail.com with ESMTPSA id
 jg2-20020a05600ca00200b004065daba6casm11876137wmb.46.2023.11.06.02.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 02:40:20 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: hdmi-codec: register hpd callback on component probe
Date: Mon,  6 Nov 2023 11:40:11 +0100
Message-ID: <20231106104013.704356-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JQUHWUAPPM5X52OXECTVPCNXHDEONJJZ
X-Message-ID-Hash: JQUHWUAPPM5X52OXECTVPCNXHDEONJJZ
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQUHWUAPPM5X52OXECTVPCNXHDEONJJZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The HDMI hotplug callback to the hdmi-codec is currently registered when
jack is set.

The hotplug not only serves to report the ASoC jack state but also to get
the ELD. It should be registered when the component probes instead, so it
does not depend on the card driver registering a jack for the HDMI to
properly report the ELD.

Fixes: 25ce4f2b3593 ("ASoC: hdmi-codec: Get ELD in before reporting plugged event")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/hdmi-codec.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 09eef6042aad..20da1eaa4f1c 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -877,18 +877,13 @@ static int hdmi_codec_set_jack(struct snd_soc_component *component,
 			       void *data)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
-	int ret = -ENOTSUPP;
 
 	if (hcp->hcd.ops->hook_plugged_cb) {
 		hcp->jack = jack;
-		ret = hcp->hcd.ops->hook_plugged_cb(component->dev->parent,
-						    hcp->hcd.data,
-						    plugged_cb,
-						    component->dev);
-		if (ret)
-			hcp->jack = NULL;
+		return 0;
 	}
-	return ret;
+
+	return -ENOTSUPP;
 }
 
 static int hdmi_dai_spdif_probe(struct snd_soc_dai *dai)
@@ -982,6 +977,21 @@ static int hdmi_of_xlate_dai_id(struct snd_soc_component *component,
 	return ret;
 }
 
+static int hdmi_probe(struct snd_soc_component *component)
+{
+	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	if (hcp->hcd.ops->hook_plugged_cb) {
+		ret = hcp->hcd.ops->hook_plugged_cb(component->dev->parent,
+						    hcp->hcd.data,
+						    plugged_cb,
+						    component->dev);
+	}
+
+	return ret;
+}
+
 static void hdmi_remove(struct snd_soc_component *component)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_component_get_drvdata(component);
@@ -992,6 +1002,7 @@ static void hdmi_remove(struct snd_soc_component *component)
 }
 
 static const struct snd_soc_component_driver hdmi_driver = {
+	.probe			= hdmi_probe,
 	.remove			= hdmi_remove,
 	.dapm_widgets		= hdmi_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(hdmi_widgets),
-- 
2.42.0

