Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC1660A2C
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Jan 2023 00:17:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 305DB12477;
	Sat,  7 Jan 2023 00:17:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 305DB12477
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673047077;
	bh=JgASkVc5I3/yBQcN0l7OgrF+H1szN210UEEK8rEOvQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FXoKxYBmifHuw374BE1niUMGZWS5ZnJzEw15nDNmY5wv0vdV5dyTOqVkF8HDgNNbF
	 MA9NzTkbwFCfkCzmaZrIYDvAQIgZQR/dS1sjdDCcZVS9Xj4YzRqxlGqus4fgEbe8Mm
	 hU2uXKKCe7o0wxDUSHedZ4ncdUra0Gu0Df3G8Vjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A792F803DC;
	Sat,  7 Jan 2023 00:16:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D30FF804AD; Sat,  7 Jan 2023 00:16:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57646F803DC
 for <alsa-devel@alsa-project.org>; Sat,  7 Jan 2023 00:16:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57646F803DC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b3xVfxnD
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A354CCE1E89;
 Fri,  6 Jan 2023 23:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F43EC433F0;
 Fri,  6 Jan 2023 23:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673046969;
 bh=JgASkVc5I3/yBQcN0l7OgrF+H1szN210UEEK8rEOvQ4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=b3xVfxnDWkTlRtsHY1A99l4mmA/t2WC5mLsi2482SyJ6WIdJkoGvLY0+umrYo0e+7
 fJ9BXwxDzyCc624RrjZh/6EqJWj+t2057+3eZs3oSQvfLke515lb8usSwpnD8hpVor
 9A4wTmxkmjI+2kQO+w8TftuO1fFfT6C4p3mf1JQkBS/hwMKl1y+SOMYfHRQ1whJ/Wr
 DyMG6v2YW5wkyoZikRI7pCBqtD5bl9Xmvzcy3l3zhsc4GirAiXYU1es69PuK0539T1
 d3x0+QvqB7LV/CylmyGb0em3FwqpKyisw+1WRCl2iwVyvWxPWKC9UWEkD0bd5217FY
 TkOxOIvF/Y8rg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Jan 2023 23:15:06 +0000
Subject: [PATCH 1/2] ASoC: fsl_ssi: Rename AC'97 streams to avoid collisions
 with AC'97 CODEC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230106-asoc-udoo-probe-v1-1-a5d7469d4f67@kernel.org>
References: <20230106-asoc-udoo-probe-v1-0-a5d7469d4f67@kernel.org>
In-Reply-To: <20230106-asoc-udoo-probe-v1-0-a5d7469d4f67@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
X-Mailer: b4 0.12-dev-8b3d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2136; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JgASkVc5I3/yBQcN0l7OgrF+H1szN210UEEK8rEOvQ4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjuKu0iBwz+1yeKm+mH85AdLfgQaLAEalxsxvX8I7W
 5UVhe7+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY7irtAAKCRAk1otyXVSH0H29B/
 wIzLXOL3FvIr6Wb+Nazwj/H6jNKK/VYjcGX8KC1O74Xic+WLO/xobMGTRtcvfEEvx+IwcuC/w1OXWf
 pFyCeB3wk4Nrkz+HrWikWIjpiyJskbfpki6Ff6/WK4j5tUmtjqXinn2Oq5yG70Tu+DwI96Lbn8DHgY
 wADU4Sn0NG6t/UZQTAQsDhwOQGvquULM9hA/xyySajq0dWACWjLC2aIhYXU9jTU5R2158lvdqVQvWB
 FYAc7xufjyJ6tyr9HhaPyiGh5AIGlX/2ixK/Ksuqch0bEAXot+QIpBIZuqkxR2QDYtHgrFjha25x93
 vtA0QOxkB33Q4Ks2zjONfb00VQy+4P
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The SSI driver calls the AC'97 playback and transmit streams "AC97 Playback"
and "AC97 Capture" respectively. This is the same name used by the generic
AC'97 CODEC driver in ASoC, creating confusion for the Freescale ASoC card
when it attempts to use these widgets in routing. Add a "CPU" in the name
like the regular DAIs registered by the driver to disambiguate.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl-asoc-card.c | 8 ++++----
 sound/soc/fsl/fsl_ssi.c       | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index c836848ef0a6..1dfd0341e487 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -121,11 +121,11 @@ static const struct snd_soc_dapm_route audio_map[] = {
 
 static const struct snd_soc_dapm_route audio_map_ac97[] = {
 	/* 1st half -- Normal DAPM routes */
-	{"Playback",  NULL, "AC97 Playback"},
-	{"AC97 Capture",  NULL, "Capture"},
+	{"Playback",  NULL, "CPU AC97 Playback"},
+	{"CPU AC97 Capture",  NULL, "Capture"},
 	/* 2nd half -- ASRC DAPM routes */
-	{"AC97 Playback",  NULL, "ASRC-Playback"},
-	{"ASRC-Capture",  NULL, "AC97 Capture"},
+	{"CPU AC97 Playback",  NULL, "ASRC-Playback"},
+	{"ASRC-Capture",  NULL, "CPU AC97 Capture"},
 };
 
 static const struct snd_soc_dapm_route audio_map_tx[] = {
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index c9e0e31d5b34..46a53551b955 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1189,14 +1189,14 @@ static struct snd_soc_dai_driver fsl_ssi_ac97_dai = {
 	.symmetric_channels = 1,
 	.probe = fsl_ssi_dai_probe,
 	.playback = {
-		.stream_name = "AC97 Playback",
+		.stream_name = "CPU AC97 Playback",
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_48000,
 		.formats = SNDRV_PCM_FMTBIT_S16 | SNDRV_PCM_FMTBIT_S20,
 	},
 	.capture = {
-		.stream_name = "AC97 Capture",
+		.stream_name = "CPU AC97 Capture",
 		.channels_min = 2,
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_48000,

-- 
2.30.2
