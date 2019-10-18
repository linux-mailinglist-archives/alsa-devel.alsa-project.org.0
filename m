Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C32DCFC6
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 22:10:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89F7E1676;
	Fri, 18 Oct 2019 22:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89F7E1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571429412;
	bh=RSqEabOKOuN2GiDOy+nv0oZDZZtJY+OG806x+pnoFI4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rqg3FgqZPbqci6hjUgUhsVamlhS1IeH3OTPJ6A8jm4+/ZU+C0vLkpmDUBm/I98D0O
	 NWxWP/Xq/LcQ6x+NafhG8wP0dtJ3HRM46TIkG5PXPwkLdlAKIDg5pEnbSHV/LdyQX8
	 BtqIjhYHCVCuRyyGkgFbwjDX/jWMoxmaiYC50IKA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9DA3F8065A;
	Fri, 18 Oct 2019 22:05:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F18E9F8063C; Fri, 18 Oct 2019 22:05:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8888AF805FA
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 22:05:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8888AF805FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="HzK8LUhP"
Received: by mail-pg1-x541.google.com with SMTP id p12so3934935pgn.6
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 13:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LSVpKtImNndsj7cadCEdoTW/XnCDnyIt8BuaDi/i9JQ=;
 b=HzK8LUhPTJ1EaJq+RVnP9/j/nIyzUKxASQyMksXS3uT1GLEhDiN8zsXsn5R94P3K3t
 BB9XXsVB56pM4ZvyKb9SCR9gWgBEwqAkyN5b0E3SBICv0Uu6gtI/tVyH3p3y3yeSnKSB
 QyFvWwOqrmZNqvEyAzUynLcFXlqauRNZJRZqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LSVpKtImNndsj7cadCEdoTW/XnCDnyIt8BuaDi/i9JQ=;
 b=VQ/aYuFQ0G6cbV8KOfCbuDI7DTcgSeSZcWmRCDkWhcehD6WXMIdlvy1yVUfnTrUU2N
 3gX37SAgfKZXABdlwqWA8B0esH75qASZ2pLSlMXa2CtLE0ZvY6RHYIhWx9YEH8ZKP35F
 KBqi8b34l6nB1KCR+Lx18ILVA2Cb4NgarlDbIMBwc6D8i4VuuW3U7IH8JTVnsfIvWMVN
 QrM89xjkQUPxIwzzix/n5arS9NIpCtDB9ptGVCtDL8LKa5swf9JAl0oZGThWGQjGp4iq
 QCC0I8Yv5awTbiX0yvlWQNKISrG9AqihiWep7vKRG6Kta93zMyB8ViD9BpExgqw35mXe
 US9w==
X-Gm-Message-State: APjAAAVqVDEZVY5+bIRBi/OsEC9bn4cATE1thVIz+dOR3/nBL4zZL0n3
 EbkRV8+Xo/Juw35JkT+hP2wrfOVJQAYv
X-Google-Smtp-Source: APXvYqx6/+Afb+AXVtaawvKMGfrgr16kkKJwGTbsq8f3dHYAF1pFiMg7jgx9tCdVyNSSrAjB836+yQ==
X-Received: by 2002:a17:90a:cb88:: with SMTP id
 a8mr13194075pju.85.1571429110673; 
 Fri, 18 Oct 2019 13:05:10 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id 16sm6786964pfn.35.2019.10.18.13.05.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 13:05:10 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri, 18 Oct 2019 13:04:42 -0700
Message-Id: <20191018200449.141123-6-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191018200449.141123-1-cujomalainey@chromium.org>
References: <20191018200449.141123-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v2 05/12] ASoC: rt5677: Add DAPM audio path for
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
 sound/soc/codecs/rt5677.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 48955b22262fa..abb83f2e9974f 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -707,6 +707,15 @@ static void rt5677_set_dsp_mode(struct rt5677_priv *rt5677, bool on)
 
 static unsigned int rt5677_set_vad_source(struct rt5677_priv *rt5677)
 {
+	struct snd_soc_dapm_context *dapm =
+			snd_soc_component_get_dapm(rt5677->component);
+	/* The hotword audio path is from "DMIC L1" to "DSP Buffer".
+	 * "DSP Buffer" is then connected to "DSP Capture" which is the
+	 * rt5677-dsp-cpu-dai with a PCM interface in rt5677-spi.
+	 */
+	snd_soc_dapm_enable_pin(dapm, "DMIC L1");
+	snd_soc_dapm_sync(dapm);
+
 	/* DMIC1 power = enabled
 	 * DMIC CLK = 256 * fs / 12
 	 */
@@ -3167,6 +3176,7 @@ static const struct snd_soc_dapm_widget rt5677_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("AIF4TX", "AIF4 Capture", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SLBRX", "SLIMBus Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SLBTX", "SLIMBus Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DSPTX", "DSP Buffer", 0, SND_SOC_NOPM, 0, 0),
 
 	/* Sidetone Mux */
 	SND_SOC_DAPM_MUX("Sidetone Mux", SND_SOC_NOPM, 0, 0,
@@ -3701,11 +3711,24 @@ static const struct snd_soc_dapm_route rt5677_dapm_routes[] = {
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
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
