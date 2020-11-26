Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 532232C4EE8
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Nov 2020 07:45:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC26B17DC;
	Thu, 26 Nov 2020 07:44:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC26B17DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606373149;
	bh=jnpekrlZBz0KtSBkHkhIcsQFKuTb+yZsQRhhX2lV9R4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RvhOM+8ftpLx+GGrbVvU8pqomZ9uH+FRJOmO8vEhNGtV5GTe+qpeWu8sT0DT0A75C
	 FiNLfHL15E1VHP8VcV+mrKQhQWTZeBY6c/SHHoYhwlt3Bec+QC90v+9oVikmHBP7O8
	 2QK1TeLNz63MLiRGltZjZX6ZWVWDt1RullVgemo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D070DF80164;
	Thu, 26 Nov 2020 07:44:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E58B1F80165; Thu, 26 Nov 2020 07:44:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17D91F80159
 for <alsa-devel@alsa-project.org>; Thu, 26 Nov 2020 07:44:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17D91F80159
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C07C41A0A7A;
 Thu, 26 Nov 2020 07:44:01 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B06021A0A76;
 Thu, 26 Nov 2020 07:43:56 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 74756402EB;
 Thu, 26 Nov 2020 07:43:50 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 cychiang@chromium.org, kuninori.morimoto.gx@renesas.com,
 tzungbi@google.com, shengjiu.wang@nxp.com, grandmaster@al2klimov.de,
 jbrunet@baylibre.com, pankaj.laxminarayan.bharadiya@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: hdmi-codec: Add RX support
Date: Thu, 26 Nov 2020 14:36:48 +0800
Message-Id: <1606372608-2329-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

HDMI interface can also be used as receiver, this patch is to
add such support. The most difference compare with TX is that RX
don't need to get edid information.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/hdmi-codec.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index e8410b2433de..d5fcc4db8284 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -282,6 +282,7 @@ struct hdmi_codec_priv {
 
 static const struct snd_soc_dapm_widget hdmi_widgets[] = {
 	SND_SOC_DAPM_OUTPUT("TX"),
+	SND_SOC_DAPM_OUTPUT("RX"),
 };
 
 enum {
@@ -389,6 +390,7 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	int ret = 0;
 
 	mutex_lock(&hcp->lock);
@@ -404,7 +406,7 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 			goto err;
 	}
 
-	if (hcp->hcd.ops->get_eld) {
+	if (tx && hcp->hcd.ops->get_eld) {
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
 		if (ret)
@@ -660,14 +662,20 @@ static int hdmi_dai_probe(struct snd_soc_dai *dai)
 {
 	struct snd_soc_dapm_context *dapm;
 	struct hdmi_codec_daifmt *daifmt;
-	struct snd_soc_dapm_route route = {
-		.sink = "TX",
-		.source = dai->driver->playback.stream_name,
+	struct snd_soc_dapm_route route[] = {
+		{
+			.sink = "TX",
+			.source = dai->driver->playback.stream_name,
+		},
+		{
+			.sink = dai->driver->capture.stream_name,
+			.source = "RX",
+		},
 	};
 	int ret;
 
 	dapm = snd_soc_component_get_dapm(dai->component);
-	ret = snd_soc_dapm_add_routes(dapm, &route, 1);
+	ret = snd_soc_dapm_add_routes(dapm, route, 2);
 	if (ret)
 		return ret;
 
@@ -757,6 +765,14 @@ static const struct snd_soc_dai_driver hdmi_i2s_dai = {
 		.formats = I2S_FORMATS,
 		.sig_bits = 24,
 	},
+	.capture = {
+		.stream_name = "Capture",
+		.channels_min = 2,
+		.channels_max = 8,
+		.rates = HDMI_RATES,
+		.formats = I2S_FORMATS,
+		.sig_bits = 24,
+	},
 	.ops = &hdmi_codec_i2s_dai_ops,
 	.pcm_new = hdmi_codec_pcm_new,
 };
@@ -773,6 +789,13 @@ static const struct snd_soc_dai_driver hdmi_spdif_dai = {
 		.rates = HDMI_RATES,
 		.formats = SPDIF_FORMATS,
 	},
+	.capture = {
+		.stream_name = "Capture",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = HDMI_RATES,
+		.formats = SPDIF_FORMATS,
+	},
 	.ops = &hdmi_codec_spdif_dai_ops,
 	.pcm_new = hdmi_codec_pcm_new,
 };
-- 
2.27.0

