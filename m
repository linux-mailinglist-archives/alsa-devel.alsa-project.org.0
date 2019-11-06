Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F430F0B8B
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 02:17:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B493E16ED;
	Wed,  6 Nov 2019 02:16:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B493E16ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573003064;
	bh=rWjIqq1aEy0xlRe2A2UpCbGBGFiR2TofA47qo1jsgE8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uNRltOevuqNqYGkRuET0w+BX5pq6gWU4MJxl1NGrqEHV2cdO5buIZqR8PgkDcrCOT
	 Pm89Eo6E0IOlyVuztE1MNiKWa6/+5PZmmXhbwKtidRsxuT1hdsHDi9lADdDtiPiWWF
	 1nfPQOGZDWMG7l9SDB7ile0tZMQjsvez+aPsLwsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20819F8063B;
	Wed,  6 Nov 2019 02:14:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B120EF8063A; Wed,  6 Nov 2019 02:14:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49BF4F80634
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 02:14:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49BF4F80634
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="PuSVAmgY"
Received: by mail-pl1-x642.google.com with SMTP id e3so8488274plt.7
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 17:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=senrpqtpNhZiCRC9mCy2gIjLBlmF7QVNkBxH7x1ySVA=;
 b=PuSVAmgY/KvGGDg6nBHoRYH5UrSTimRtjKUCk//LvGboN+IAtac07cuQnsiUPq3sHy
 X5oxp1TVPMymrTpIFlHMkfwkFWW+G+7WkFuuiK0gqfdC7Y64p1FBTxxu0bJl5sKkC6le
 qC3XIjRUIuED1yd35P2BgJD8NEi97dQTsbgkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=senrpqtpNhZiCRC9mCy2gIjLBlmF7QVNkBxH7x1ySVA=;
 b=cLBJyCXH4JKSiq8LdXLeLsQ/D/Xz8jSmM9ze14xH8tEnDVA00kF7YfwsIRShlJkvlu
 6yNpADdBhD13ZLP+SMh12G5Zj0Nb0W5KdS5AkDzVk6B4RKAFoQ1z5Dm+lE44YQy534Mw
 nHcO0oQQBPvOpyOaqVlVwHNqG+Z0QY+Emm2Utrl80Ty13dyIvJtr1a8cNXpz8EvrjwZ0
 dA5JNeNYC9gQ8kuBAwkSsH2ARbf7IxijRN9uXfeiTPwyb/pJ+R0zb9fkEQiPYavkXaF7
 m+SWoQW9FFa5fbOfxDjjMIb2LDBI9mD0y5HTiMAFhqCRkFoD/7ffRXtnnC+fr4j/2mb5
 9RTA==
X-Gm-Message-State: APjAAAX8ra9b0SfoM6dCR7d6+VbmvJEmeskY3nM86nzmZTJ4h/xV5uPY
 BcD1zbQ3kkqzsIAWFHuovzhWk0HPJsHW
X-Google-Smtp-Source: APXvYqwHIOC0UnJBy8cfqDrV1aYVBJ2DqLXLDNsnnw0X9U9KqhWP27VXe1v4HPfRHY/Zyz55EukkGg==
X-Received: by 2002:a17:902:9302:: with SMTP id
 bc2mr18650659plb.148.1573002839216; 
 Tue, 05 Nov 2019 17:13:59 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id j4sm632553pjf.25.2019.11.05.17.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 17:13:58 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 17:13:29 -0800
Message-Id: <20191106011335.223061-5-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191106011335.223061-1-cujomalainey@chromium.org>
References: <20191106011335.223061-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v3 04/11] ASoC: rt5677: Add DAPM audio path for
	hotword stream
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

From: Ben Zhang <benzh@chromium.org>

Add a DAPM audio path from "DMIC L1" to "DSP Buffer" so that
when hotwording is enabled, DAPM does not power off the codec
with SND_SOC_BIAS_OFF.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 48955b22262f..ea235f3874ca 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -707,6 +707,13 @@ static void rt5677_set_dsp_mode(struct rt5677_priv *rt5677, bool on)
 
 static unsigned int rt5677_set_vad_source(struct rt5677_priv *rt5677)
 {
+	struct snd_soc_dapm_context *dapm =
+			snd_soc_component_get_dapm(rt5677->component);
+	/* Force dapm to sync before we enable the
+	 * DSP to prevent write corruption
+	 */
+	snd_soc_dapm_sync(dapm);
+
 	/* DMIC1 power = enabled
 	 * DMIC CLK = 256 * fs / 12
 	 */
@@ -3167,6 +3174,7 @@ static const struct snd_soc_dapm_widget rt5677_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("AIF4TX", "AIF4 Capture", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SLBRX", "SLIMBus Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SLBTX", "SLIMBus Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DSPTX", "DSP Buffer", 0, SND_SOC_NOPM, 0, 0),
 
 	/* Sidetone Mux */
 	SND_SOC_DAPM_MUX("Sidetone Mux", SND_SOC_NOPM, 0, 0,
@@ -3701,11 +3709,24 @@ static const struct snd_soc_dapm_route rt5677_dapm_routes[] = {
 	{ "SLBTX", NULL, "SLB ADC3 Mux" },
 	{ "SLBTX", NULL, "SLB ADC4 Mux" },
 
+	{ "DSPTX", NULL, "IB01 Bypass Mux" },
+
 	{ "IB01 Mux", "IF1 DAC 01", "IF1 DAC01" },
 	{ "IB01 Mux", "IF2 DAC 01", "IF2 DAC01" },
 	{ "IB01 Mux", "SLB DAC 01", "SLB DAC01" },
 	{ "IB01 Mux", "STO1 ADC MIX", "Stereo1 ADC MIX" },
-	{ "IB01 Mux", "VAD ADC/DAC1 FS", "DAC1 FS" },
+	/* The IB01 Mux controls the source for InBound0 and InBound1.
+	 * When the mux option "VAD ADC/DAC1 FS" is selected, "VAD ADC" goes to
+	 * InBound0 and "DAC1 FS" goes to InBound1. "VAD ADC" is used for
+	 * hotwording. "DAC1 FS" is not used currently.
+	 *
+	 * Creating a common widget node for "VAD ADC" + "DAC1 FS" and
+	 * connecting the common widget to IB01 Mux causes the issue where
+	 * there is an active path going from system playback -> "DAC1 FS" ->
+	 * IB01 Mux -> DSP Buffer -> hotword stream. This wrong path confuses
+	 * DAPM. Therefore "DAC1 FS" is ignored for now.
+	 */
+	{ "IB01 Mux", "VAD ADC/DAC1 FS", "VAD ADC Mux" },
 
 	{ "IB01 Bypass Mux", "Bypass", "IB01 Mux" },
 	{ "IB01 Bypass Mux", "Pass SRC", "IB01 Mux" },
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
