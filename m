Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0848F1F586
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2019 15:23:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9060B16DE;
	Wed, 15 May 2019 15:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9060B16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557926612;
	bh=1+kGFF75eVIk7FS1qQHEdNYmPiVcbtAv58eZ7AOta6g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aA4MMEylbFmlLgu4RLqTSSHV4zVTxS2p3SPwJo7TtN42c+BhoZIh7BgEFIrEV91u4
	 0vqF4yl1kAS8/AA+sD1Rk1M7HNqcNa+H0ADJglHAMh05jEMExXdZfwt8xGGpQSR0JQ
	 vhvrLD7hOpsNb9MscJ+qDmfi4/Fwj+xd7AVrXviE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2603CF8973D;
	Wed, 15 May 2019 15:19:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE20BF8973C; Wed, 15 May 2019 15:19:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2726F896B2
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 15:19:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2726F896B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="yMl0eoA6"
Received: by mail-wm1-x341.google.com with SMTP id c66so4696501wme.0
 for <alsa-devel@alsa-project.org>; Wed, 15 May 2019 06:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bgxe1GRX/w2wrtefgULdeMfRiILdFJq82pUWP1dCMsw=;
 b=yMl0eoA65BOO2y5I3UtLa9IGCL5g/V97Lh8F7pAYnMofU0OqB+DIOWkgA2URKybltp
 H7qbZR+c/pQ5kg8Jh64jQWDo3qjvnPG5gXyHa1RJQEKTLZfVemrF0Ar/ngXN5HpkQa6X
 5KOSaON+QtfoQeSlXGJyzu0XWA3OzS1TPtloWRjxcSGfHYcOeaOhjxuJxfjypNfj0Qdb
 ycBdmXHDROw1d4BPZCaRserlLAhGbSb+L1o3j1Ky7n9KyiOytriN3Pj+KsBu2u03vCX4
 0Lyf6UnNjgpbUvuHwezCqrLu9sFkfWKa0YzOGa1HjNyARC0N3+KMc6ai62nlzhSuD9uR
 Pbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bgxe1GRX/w2wrtefgULdeMfRiILdFJq82pUWP1dCMsw=;
 b=jIVfbx7YbZz4PctZsTrjiW09m7o2ixBM0ZLQioA0CBRxmBWekixwOf0dtmLZtS8pUx
 dnuFoJMhifObsX4xC1urvLar/wiwZBzRnCg+b0GSCzwL0jDbe/fL+YhzylaXhVnLAUUi
 BgvYEc20gZF/XPXOMeoSgJGSPXIMgyjTU5xLu9ajFWv4NVhLQt4lOD0vIfdVdHoHc7lV
 Tuk1PSFMC0G5xnuavQQuc9Po2fmsSWDHbxxbGgKSZwgADvN4icRtLsPNoVQN3j7gZuRw
 SVBfkLW8h1fog03Rm25ggzu5Dt4Nd7qVR0LPuBmr+PhidXmbIzDNLCvpyQY3RPV522nt
 2wlA==
X-Gm-Message-State: APjAAAXDF+6VGFfKuRbHG9Z4AuZAyl4Vvmm29qr5vIwBIbn+m6N4KB5G
 qMOVL+SAPgZkrSJ8PkX5Dwan9g==
X-Google-Smtp-Source: APXvYqxC3WiRwd3tKaX9tLKESnKaHtepk6/HtpPVFWaY2/GLrIXfw8TZB9PS3JtGTCSqZMvaoTXs/Q==
X-Received: by 2002:a7b:c549:: with SMTP id j9mr722446wmk.122.1557926347157;
 Wed, 15 May 2019 06:19:07 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id b206sm2789848wmd.28.2019.05.15.06.19.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 06:19:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed, 15 May 2019 15:18:57 +0200
Message-Id: <20190515131858.32130-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190515131858.32130-1-jbrunet@baylibre.com>
References: <20190515131858.32130-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 4/5] ASoC: meson: axg-card: add basic
	codec-to-codec link support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add basic support for codec-to-codec link in the axg sound card.
The cpu side of these links is expected to properly set the hw_params
and format of the link.

ATM, only the tohdmitx glue is supported but others (like the
internal DAC glue) should follow.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 5c8deee8d512..db0a7fc18928 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -29,6 +29,18 @@ struct axg_dai_link_tdm_data {
 	struct axg_dai_link_tdm_mask *codec_masks;
 };
 
+/*
+ * Base params for the codec to codec links
+ * Those will be over-written by the CPU side of the link
+ */
+static const struct snd_soc_pcm_stream codec_params = {
+	.formats = SNDRV_PCM_FMTBIT_S24_LE,
+	.rate_min = 5525,
+	.rate_max = 192000,
+	.channels_min = 1,
+	.channels_max = 8,
+};
+
 #define PREFIX "amlogic,"
 
 static int axg_card_reallocate_links(struct axg_card *priv,
@@ -517,6 +529,11 @@ static int axg_card_cpu_is_tdm_iface(struct device_node *np)
 	return of_device_is_compatible(np, PREFIX "axg-tdm-iface");
 }
 
+static int axg_card_cpu_is_codec(struct device_node *np)
+{
+	return of_device_is_compatible(np, PREFIX "g12a-tohdmitx");
+}
+
 static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 			     int *index)
 {
@@ -540,6 +557,8 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 
 	if (axg_card_cpu_is_tdm_iface(dai_link->cpu_of_node))
 		ret = axg_card_parse_tdm(card, np, index);
+	else if (axg_card_cpu_is_codec(dai_link->cpu_of_node))
+		dai_link->params = &codec_params;
 
 	return ret;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
