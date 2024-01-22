Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA181836F9E
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 19:19:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 393C5846;
	Mon, 22 Jan 2024 19:19:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 393C5846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705947566;
	bh=6XwbyJxxFtTrLcIF9O68ZPB8kPUWDbYsKcVldHRoldY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=InE2tY/CNnmumBTR3bwWQIbq0fI9iqXGD1ylyOv+DfFmb/k9VJLweCR/90MbnbdHa
	 wBs5P2CKv0QROlocsigdj7K7MMgj9vTE8b5fgFYWvqPeN1GCLhDwLoq6nexMzOtcd4
	 UGOxUJ1yFwviwntjLsl0U3YWsx/UkDJBQQJrluJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B4D5F805C5; Mon, 22 Jan 2024 19:18:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE59F805C3;
	Mon, 22 Jan 2024 19:18:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E36FF802E8; Mon, 22 Jan 2024 19:18:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C82AEF8022B
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 19:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C82AEF8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JmR4wQPe
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2FB0061811;
	Mon, 22 Jan 2024 18:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36253C43609;
	Mon, 22 Jan 2024 18:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705947508;
	bh=6XwbyJxxFtTrLcIF9O68ZPB8kPUWDbYsKcVldHRoldY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JmR4wQPe2Qzsh6OpOQa0RHfxFqSZ247JgYaXjYka8c6T7mgGH+CrXX/RTOmOl1AoF
	 sOIXz0ZwirMlQTR09kPZOHtYE5l/WbWStwvIySAO1BmEGl65O6lNn+c+KZEVBKiSLk
	 gA6W+k+ExgxbYrIVgGMIyEVDxhU0XH4OYaPvRyzI4NlACq7YyP/7Zq21GUs9RR6JjO
	 /joGJaQyJIiivyMr8i0hcVWzDCfRgWKjWtlQleL7ZNlejy5corZwHU4C4FJEvFrS55
	 EMaWwmmde+jJOgv6xwl+5m52PN+/6ndY6wxcogBLkKH1wRDcdqCauSwsNUZBwf9poJ
	 Mr3wru/a86blw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rRysa-0000000013Z-2VaM;
	Mon, 22 Jan 2024 19:18:40 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v5 4/4] ASoC: codecs: wcd9335: drop unused gain hack remnant
Date: Mon, 22 Jan 2024 19:18:19 +0100
Message-ID: <20240122181819.4038-5-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122181819.4038-1-johan+linaro@kernel.org>
References: <20240122181819.4038-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VJQ7SPHUQFR6U6IWTPT3CPD3VPPWUQ4L
X-Message-ID-Hash: VJQ7SPHUQFR6U6IWTPT3CPD3VPPWUQ4L
X-MailFrom: johan+linaro@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJQ7SPHUQFR6U6IWTPT3CPD3VPPWUQ4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The vendor driver appears to be modifying the gain settings behind the
back of user space but these hacks never made it upstream except for
some essentially dead code that adds a constant zero to the current gain
setting on DAPM events.

Note that the volume registers still need to be written after enabling
clocks in order for any prior updates to take effect.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 sound/soc/codecs/wcd9335.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 43c648efd0d9..deb15b95992d 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -3033,7 +3033,6 @@ static int wcd9335_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
 	u16 gain_reg;
-	int offset_val = 0;
 	int val = 0;
 
 	switch (w->reg) {
@@ -3073,7 +3072,6 @@ static int wcd9335_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
 		val = snd_soc_component_read(comp, gain_reg);
-		val += offset_val;
 		snd_soc_component_write(comp, gain_reg, val);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
@@ -3294,7 +3292,6 @@ static int wcd9335_codec_enable_interpolator(struct snd_soc_dapm_widget *w,
 	u16 gain_reg;
 	u16 reg;
 	int val;
-	int offset_val = 0;
 
 	if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT0 INTERP"))) {
 		reg = WCD9335_CDC_RX0_RX_PATH_CTL;
@@ -3337,7 +3334,6 @@ static int wcd9335_codec_enable_interpolator(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMU:
 		wcd9335_config_compander(comp, w->shift, event);
 		val = snd_soc_component_read(comp, gain_reg);
-		val += offset_val;
 		snd_soc_component_write(comp, gain_reg, val);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-- 
2.43.0

