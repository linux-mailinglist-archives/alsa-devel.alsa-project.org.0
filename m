Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6305AC108
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 21:55:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EFF984B;
	Fri,  6 Sep 2019 21:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EFF984B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567799737;
	bh=enoPpq6zI++bUcLKm7CQYbxunNNRZUkvCXnfHWLC1oQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oJ+7ra3nmhYU38YWhWbsh0iF4q1ArluIKme5pIjFUzu/ePaCqQfHgeD+DdrCyLvTB
	 4N85r4R7utiZFsAYPhsA+Ct0rSBD+AQgnBKzsZgoEvzkit0I6j6iQ47i3y9TMg8PxG
	 NyCwIQlR7IucgowLQADCvvfXmA+86d1xbCbpZbYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CFDBF80390;
	Fri,  6 Sep 2019 21:48:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CBB8F80677; Fri,  6 Sep 2019 21:48:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D3AFF8065E
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 21:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D3AFF8065E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="cPJw9SwH"
Received: by mail-pf1-x443.google.com with SMTP id y72so5187284pfb.12
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 12:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k0zzTPlGcwPAw52gcXgnsH058VHFC5y6j8AIZUYPvUA=;
 b=cPJw9SwHetz+UQxgxCRZLpeNFUSrrPQNah7xYjpl/fBOuZQN2vxzkmacgchBBdfK6H
 DkrqZl7BHV40bLhAQfpd8BaBjbxJNIVrc/cg5bSJcYWCxlTWOkT/oaWqhLm5QbpHs8iW
 F6lpLsuWCe+rOWi4Kqk9sMLW2uYvbUS+T0m9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k0zzTPlGcwPAw52gcXgnsH058VHFC5y6j8AIZUYPvUA=;
 b=tUODLhN5Gje3wMBHsapO65OcMFNref/oqtopBW5v8ODqDjLug/0/nE0YHgzTN3rI7r
 wg5a4pr8BlnwqwPSN3WPPADNgNvkgbFYbzXWofJLB0Ck4v8j0lqQiwF1wCvIDJXItNcl
 i5IGHiqhLwe51N9/A0O4lepfO6JVXhYKRHLtM7UK5UOmgZGEZkSawf2dU8rnjXIhIWTr
 s8DyNw1rLFBQutKIQ9K1cfu08JRt3uXGMmjzvVO/GL1rRo3tnPq8htHb+oCxerLIHuLD
 QpRc7QZ0vMRzx5/aaU+xXM5MwTpL/l9ZVXEGWDM58VC9QjHKPRl5vQzo/GHkTBRRLGB1
 oCrQ==
X-Gm-Message-State: APjAAAVBfyln8JqgykuUGt8PONLPKHNdOBGcfM2Ya2jiXgiPJH0J7BGk
 KkjwdV6ww2JxUYzYxOWq+A8asgIVyg==
X-Google-Smtp-Source: APXvYqxYEyQZvfCbXuof2/m4j8jVEpvJX/ejSJSf++pCf2wLTPwPXitXw4L90LcjVie0zwe32bSx7w==
X-Received: by 2002:a65:690e:: with SMTP id s14mr4206758pgq.47.1567799288195; 
 Fri, 06 Sep 2019 12:48:08 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id t7sm10812873pgc.68.2019.09.06.12.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2019 12:48:07 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  6 Sep 2019 12:46:31 -0700
Message-Id: <20190906194636.217881-10-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906194636.217881-1-cujomalainey@chromium.org>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [RFC 09/15] ASoC: rt5677: Add DAPM audio path for
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
index f01fc9d44774..3db26cb242d2 100644
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
 	/* Mono ADC Capture Switch = unmute (default) */
 	regmap_update_bits(rt5677->regmap, RT5677_MONO_ADC_DIG_VOL,
 			RT5677_L_MUTE, 0);
@@ -3209,6 +3218,7 @@ static const struct snd_soc_dapm_widget rt5677_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("AIF4TX", "AIF4 Capture", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SLBRX", "SLIMBus Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT("SLBTX", "SLIMBus Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("DSPTX", "DSP Buffer", 0, SND_SOC_NOPM, 0, 0),
 
 	/* Sidetone Mux */
 	SND_SOC_DAPM_MUX("Sidetone Mux", SND_SOC_NOPM, 0, 0,
@@ -3743,11 +3753,24 @@ static const struct snd_soc_dapm_route rt5677_dapm_routes[] = {
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
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
