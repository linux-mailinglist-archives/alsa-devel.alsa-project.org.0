Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0D48B3BA3
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:33:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAF7221A2;
	Fri, 26 Apr 2024 17:33:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAF7221A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145626;
	bh=XL4wNAHbKdLtic6750ztJIoB/ro7CVmirV6b234wNGE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R4zk25gE0+v/fB/DM+kmFdP5+Q7m9e17Ays49MinXWafbEi2nqsr5hpXHHWLovbtQ
	 gm2gqK3TA94MQH4oHx6cHpathF9wRG5tY+5xSUVVIWrPbiPRYMTRP0hopX/9jWBCsE
	 HAUUqQe72DKVAl7UItjc460RTBQGTvBLyU5Pgpfs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D7C0F8065C; Fri, 26 Apr 2024 17:30:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E8C2F80659;
	Fri, 26 Apr 2024 17:30:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 076B5F80610; Fri, 26 Apr 2024 17:30:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8532EF805B2
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8532EF805B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=sCCVJSRR
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41b782405d5so10774125e9.2
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Apr 2024 08:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714145397;
 x=1714750197; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQ4CJQsXVTR1thlbAzx7uixAygG90ZyA723vL1wPyc4=;
        b=sCCVJSRRtP0j4/AqwxFywLOjvcvCRXEJn/IRI85PU0yyHSSgDmMy2KsaIA217vWxXX
         BAdA1BnE/wAIRH7S4MMW9IHEc3RQ656vFxDi15RvEPPG4eMVRvPTggyTM6Npmeap/sPq
         s7l1myVIQ2iLLx2lNzPcjo+LNBiqcbjSg14RNZOnc1GUAKG9vuKdSKNfv/Jnht96xWo9
         a3rWj1h17IqE6ibuku/L2FqbdTM635uiHKCFFw7gEHeWyymbS5O3BzofgRKY9LpMYcIo
         OSY5DQ2GD6oJI/ZWS8xDmhNqwZKaHUYRqcnFTD/qL6qAXIuV7GP1ALJhn6c5hF9AuGzz
         v9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145397; x=1714750197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQ4CJQsXVTR1thlbAzx7uixAygG90ZyA723vL1wPyc4=;
        b=uWyyYlRFSSi50lDRhIQDqxP5GJQLFBPkpU9hBk8IakhUsgXWu/D1G4u3hOPfQKUX3Y
         G/zAuepbYbqZLLK7szANNOL/xX7PXCM/IivqmSA1p2/ZHV+d9XqOpOf7iB0kzrDmls/p
         6vtopuPDql1E9mwR9nVW7viYs8ycyb4b2bQfGR+eA61zTWaXHfiIGxYloBSylt3ct1xd
         zPGlIIVuqRzxVFtXd272veKeZYtba7JtLp6dtYawJj1Jhx/Hq7lNjiMNp9l6X3GGMaKl
         MM9/c6fIjcmwHKo4i9QmIKEufVUzv2HZ4/Atlmki2cX+RQtkg1JauajbyxGkjsyWsUKk
         7Rnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOxpa6EdSIEvq/MFaoHsrnqYcqvfANY+ymjkfiBJMPHKnQo0wicOdjLAjjTNf5wqjUBm/ZWMr8gRUHBepO1XFD+A3bUCinPRA5W5s=
X-Gm-Message-State: AOJu0Yy/bF7TvOti/Jdzj6NdIhvFA6VSjch0CMJG/JSV0+QIjP2O+lXK
	3xo6tiFhXiUprUWAL9EJC1+jlaINr9Uverh3A5/vllLbEcEYQ31MRA83YcSkKOQ=
X-Google-Smtp-Source: 
 AGHT+IH1/5s5CRPWdPZqkFw1JsMyITFCO5/+y/SMhOfip3B1nJoETVweJYnD+9vnKbqKCb2dr/aCkw==
X-Received: by 2002:a05:600c:4508:b0:418:37e1:3f73 with SMTP id
 t8-20020a05600c450800b0041837e13f73mr3024524wmo.2.1714145397352;
        Fri, 26 Apr 2024 08:29:57 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
        by smtp.googlemail.com with ESMTPSA id
 i13-20020a05600c354d00b00419fba938d8sm22628687wmq.27.2024.04.26.08.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:29:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 3/4] ASoC: meson: axg-tdm-interface: manage formatters in
 trigger
Date: Fri, 26 Apr 2024 17:29:40 +0200
Message-ID: <20240426152946.3078805-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426152946.3078805-1-jbrunet@baylibre.com>
References: <20240426152946.3078805-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V7OKPSK6VSKQ5QC4VWFBSER4SKSKHBQS
X-Message-ID-Hash: V7OKPSK6VSKQ5QC4VWFBSER4SKSKHBQS
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V7OKPSK6VSKQ5QC4VWFBSER4SKSKHBQS/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

So far, the formatters have been reset/enabled using the .prepare()
callback. This was done in this callback because walking the formatters use
a mutex. A mutex is used because formatter handling require dealing
possibly slow clock operation.

With the support of non-atomic, .trigger() callback may be used which also
allows to properly enable and disable formatters on start but also
pause/resume.

This solve a random shift on TDMIN as well repeated samples on for TDMOUT.

Fixes: d60e4f1e4be5 ("ASoC: meson: add tdm interface driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 34 ++++++++++++++++-------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index bf708717635b..8bf3735dedaa 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -349,26 +349,31 @@ static int axg_tdm_iface_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int axg_tdm_iface_hw_free(struct snd_pcm_substream *substream,
+static int axg_tdm_iface_trigger(struct snd_pcm_substream *substream,
+				 int cmd,
 				 struct snd_soc_dai *dai)
 {
-	struct axg_tdm_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct axg_tdm_stream *ts =
+		snd_soc_dai_get_dma_data(dai, substream);
 
-	/* Stop all attached formatters */
-	axg_tdm_stream_stop(ts);
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		axg_tdm_stream_start(ts);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_STOP:
+		axg_tdm_stream_stop(ts);
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	return 0;
 }
 
-static int axg_tdm_iface_prepare(struct snd_pcm_substream *substream,
-				 struct snd_soc_dai *dai)
-{
-	struct axg_tdm_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
-
-	/* Force all attached formatters to update */
-	return axg_tdm_stream_reset(ts);
-}
-
 static int axg_tdm_iface_remove_dai(struct snd_soc_dai *dai)
 {
 	int stream;
@@ -412,8 +417,7 @@ static const struct snd_soc_dai_ops axg_tdm_iface_ops = {
 	.set_fmt	= axg_tdm_iface_set_fmt,
 	.startup	= axg_tdm_iface_startup,
 	.hw_params	= axg_tdm_iface_hw_params,
-	.prepare	= axg_tdm_iface_prepare,
-	.hw_free	= axg_tdm_iface_hw_free,
+	.trigger	= axg_tdm_iface_trigger,
 };
 
 /* TDM Backend DAIs */
-- 
2.43.0

