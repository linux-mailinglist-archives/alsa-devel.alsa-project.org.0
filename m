Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BA21496A1
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jan 2020 17:31:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95A3E166F;
	Sat, 25 Jan 2020 17:30:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95A3E166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579969879;
	bh=QdzY1nDWvRsD9p1UE+RNGMnPIngT/lnzJbzx0QegU1s=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f4HTqGvlc9otHuN85tCF8FjIZx9J8RlGBWjBCk2cgccGRDohup9HDwUQgO9UtOhxX
	 nPfIWYh1NDKJ1IhCxdEvKtnJaRhoI/6XDDM1qOtjWTM0+UurVA8gwUsfeRyNgAJi3v
	 HVkw5Ko81S244hyc2l9nVbbt2O3LF2aqeW9VSufE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6DE1F801D9;
	Sat, 25 Jan 2020 17:29:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D8E9F801EC; Sat, 25 Jan 2020 17:29:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 536E4F800F5
 for <alsa-devel@alsa-project.org>; Sat, 25 Jan 2020 17:29:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 536E4F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="JvpSxx+9"
Received: by mail-pj1-x1041.google.com with SMTP id m4so1250448pjv.3
 for <alsa-devel@alsa-project.org>; Sat, 25 Jan 2020 08:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fXSQKIL0dD1lYRTOFFY91TxyyI+2c+Y8mAqJiNtHVic=;
 b=JvpSxx+9/xqNSJz/0zgTcvMvolZtJ36685E1qTXtSngk3q8URPaOJgMbUK4wc4RefI
 42SkhywCIKUxSg74BRA6M+NjdT2S+rX5U/ET8beCzYf1XQ/Qw8057ridYk+PUMH0OsLy
 a7+NqmjzrpXp0ZjeLSEhXBcyHxBxhmfEsiBQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fXSQKIL0dD1lYRTOFFY91TxyyI+2c+Y8mAqJiNtHVic=;
 b=Glvv/68HetvcS/T7z8cCyegRXmoECbi+ITkHvJ7peFf13htbCGRzYJ8zhI/a3MdJvI
 Feklo6VqSbw93GciYRQlStytPR4DaR/phWbjc9filXE5OLTCKdqxIy0PY4L02vHP7hai
 MvsZKqw5wEeqLHXrjtWkX3uSibULyiJsV0bp/v559oZL1yK7uDV7lSd+Ix2SXgYH4Z71
 IKaWx3iELsIAXFmfDl9z+uRrTc7FqVRGQ6piK/rqVN7FIHR/xDhUtCNlYQ1MiaXtxo7M
 dwHVactMUnLf3EyP2jSaf/9KolG1lWeNaD5+Ci44OeqOeavgxgqH75a1TKcFqSB+vvOJ
 zaYg==
X-Gm-Message-State: APjAAAWNeZ2Wgoqb4GgVEUCs0CPG3YxegXF8SRCaMXYNd6BTDvTajaIZ
 yMFfyLoyK6MGYgtlZM4Je+6BOQ==
X-Google-Smtp-Source: APXvYqyjV2myEfqJK1IkglNqdu1mwxuHAB6eLXyslJQN4SjW4cncyTdA+1I5fvL709lRy4xbY9cnfA==
X-Received: by 2002:a17:902:b107:: with SMTP id
 q7mr1935912plr.343.1579969764135; 
 Sat, 25 Jan 2020 08:29:24 -0800 (PST)
Received: from localhost ([2401:fa00:1:10:845f:e35d:e30c:4b47])
 by smtp.gmail.com with ESMTPSA id r20sm10487339pgu.89.2020.01.25.08.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Jan 2020 08:29:23 -0800 (PST)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Sun, 26 Jan 2020 00:29:17 +0800
Message-Id: <20200125162917.247485-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, Mark Brown <broonie@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [alsa-devel] [PATCH v2] ASoC: cros_ec_codec: Support setting bclk
	ratio
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

Support setting bclk ratio from machine drivers.

Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
 sound/soc/codecs/cros_ec_codec.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 6a24f570c5e86f..d3dc42aa682565 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -45,6 +45,9 @@ struct cros_ec_codec_priv {
 	/* DMIC */
 	atomic_t dmic_probed;
 
+	/* I2S_RX */
+	uint32_t i2s_rx_bclk_ratio;
+
 	/* WoV */
 	bool wov_enabled;
 	uint8_t *wov_audio_shm_p;
@@ -259,6 +262,7 @@ static int i2s_rx_hw_params(struct snd_pcm_substream *substream,
 		snd_soc_component_get_drvdata(component);
 	struct ec_param_ec_codec_i2s_rx p;
 	enum ec_codec_i2s_rx_sample_depth depth;
+	uint32_t bclk;
 	int ret;
 
 	if (params_rate(params) != 48000)
@@ -284,15 +288,29 @@ static int i2s_rx_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
-	dev_dbg(component->dev, "set bclk to %u\n",
-		snd_soc_params_to_bclk(params));
+	if (priv->i2s_rx_bclk_ratio)
+		bclk = params_rate(params) * priv->i2s_rx_bclk_ratio;
+	else
+		bclk = snd_soc_params_to_bclk(params);
+
+	dev_dbg(component->dev, "set bclk to %u\n", bclk);
 
 	p.cmd = EC_CODEC_I2S_RX_SET_BCLK;
-	p.set_bclk_param.bclk = snd_soc_params_to_bclk(params);
+	p.set_bclk_param.bclk = bclk;
 	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
 				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
 
+static int i2s_rx_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
+{
+	struct snd_soc_component *component = dai->component;
+	struct cros_ec_codec_priv *priv =
+		snd_soc_component_get_drvdata(component);
+
+	priv->i2s_rx_bclk_ratio = ratio;
+	return 0;
+}
+
 static int i2s_rx_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
@@ -340,6 +358,7 @@ static int i2s_rx_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 static const struct snd_soc_dai_ops i2s_rx_dai_ops = {
 	.hw_params = i2s_rx_hw_params,
 	.set_fmt = i2s_rx_set_fmt,
+	.set_bclk_ratio = i2s_rx_set_bclk_ratio,
 };
 
 static int i2s_rx_event(struct snd_soc_dapm_widget *w,
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
