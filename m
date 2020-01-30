Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0901914E41C
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 21:36:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2961674;
	Thu, 30 Jan 2020 21:35:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2961674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580416605;
	bh=nD8Lpmr8mQnY4M0yG+J1t7gR3Oowbb26S5CWZXzuLSo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rf4Cn+NHQUjRZPgtiNu4zbeZlKDZXi0kleAz8Rk8L+huLFvp4uq2BIxEaTuK6/5RA
	 iR5ny30FlUAxcwTm/XvRsjC42dLjhn77RhuAqdrpSheP24hnFgvWEfyqpDSPHSat5M
	 er421QHmT3dhygWrduF4o0TYLHjR+XhMu+xFMaoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA1FEF801EB;
	Thu, 30 Jan 2020 21:35:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED7D0F80150; Thu, 30 Jan 2020 21:35:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 660E2F800F1
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 21:34:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 660E2F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="IMFrpYrs"
Received: by mail-pl1-x641.google.com with SMTP id ay11so1792648plb.0
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 12:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xIBLIja+ndS5AxMN3F+B+9BHNQrH87Ijr0ahHedqz3M=;
 b=IMFrpYrs7XP1XyZlJnVJbQ6QlHJxE8i0riwPj0dI/NkxkSw44FPxjZZYFGaYXCy66X
 LPXlEwMui8Lu6WvIxbsK2BwxwZTwSVgNBe8nEEoOx9Cx9nklY0Nqs/tPDt3x0xvOUNOT
 jGER95TOVm77tDVo/UO+nhcdg3f9Abmnk4tb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xIBLIja+ndS5AxMN3F+B+9BHNQrH87Ijr0ahHedqz3M=;
 b=ID9pHW7bOkZwtgX/vzs31mt0zKlLnHVVbUpj5+D3a6y5hSJnHQ2vXxILh/FrfUl4L6
 IuSPg9J2d5GM01kGBt+qZShj5jA2JsAhyyViQG1Wnqu7jPwH8eGncFeGfL8Pa7v36hML
 PKEZNjydF5OB3FtlSXlar+zeiZumcRwN+8TR43DzG1M3vAZHDL++5iuzL0a6/S9xBtDj
 uTkTKB84PpW++AWzu79I1TO0E6tq5eOyrU5OClpv6e3v7eIbWP2bbVY5o9AC2Eo4x1n1
 Xgbqi/kka+/2Z1i80emA9RNajfqOCvhVg3l98j0e+JWUQrdTjTkei7/s1ullXsA42Ghx
 CP9A==
X-Gm-Message-State: APjAAAVNcY/G83MBYzisv5R1Y1kWgYmwphoCvyquqcqlJGW6xObxvFXl
 UKNBI89HDMt0cpkM9tsuWIWdNA==
X-Google-Smtp-Source: APXvYqzPJ14sLr/VvKzgKGNecSz8sayW4zofhv8W5rLMSxCXjluwZOiLdwwNvhsjBctsx5JgkIZ6tA==
X-Received: by 2002:a17:902:7449:: with SMTP id
 e9mr6241556plt.139.1580416497238; 
 Thu, 30 Jan 2020 12:34:57 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com
 ([2620:15c:202:201:172e:4646:c089:ce59])
 by smtp.gmail.com with ESMTPSA id q12sm7469321pfh.158.2020.01.30.12.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 12:34:56 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Thu, 30 Jan 2020 12:30:56 -0800
Message-Id: <20200130203106.201894-12-pmalani@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200130203106.201894-1-pmalani@chromium.org>
References: <20200130203106.201894-1-pmalani@chromium.org>
MIME-Version: 1.0
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Mark Brown <broonie@kernel.org>, Prashant Malani <pmalani@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [alsa-devel] [PATCH 11/17] ASoC: cros_ec_codec: Use
	cros_ec_send_cmd_msg()
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

Replace send_ec_host_command() with cros_ec_send_cmd_msg() which does
the same thing, but is defined in a common location in platform/chrome
and exposed for other modules to use. This allows us to remove
send_ec_host_command() entirely.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 sound/soc/codecs/cros_ec_codec.c | 71 ++++++++++----------------------
 1 file changed, 21 insertions(+), 50 deletions(-)

diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 6a24f570c5e86f..49adb07d766963 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -69,38 +69,6 @@ static int ec_codec_capable(struct cros_ec_codec_priv *priv, uint8_t cap)
 	return priv->ec_capabilities & BIT(cap);
 }
 
-static int send_ec_host_command(struct cros_ec_device *ec_dev, uint32_t cmd,
-				uint8_t *out, size_t outsize,
-				uint8_t *in, size_t insize)
-{
-	int ret;
-	struct cros_ec_command *msg;
-
-	msg = kmalloc(sizeof(*msg) + max(outsize, insize), GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
-
-	msg->version = 0;
-	msg->command = cmd;
-	msg->outsize = outsize;
-	msg->insize = insize;
-
-	if (outsize)
-		memcpy(msg->data, out, outsize);
-
-	ret = cros_ec_cmd_xfer_status(ec_dev, msg);
-	if (ret < 0)
-		goto error;
-
-	if (insize)
-		memcpy(in, msg->data, insize);
-
-	ret = 0;
-error:
-	kfree(msg);
-	return ret;
-}
-
 static int calculate_sha256(struct cros_ec_codec_priv *priv,
 			    uint8_t *buf, uint32_t size, uint8_t *digest)
 {
@@ -149,7 +117,7 @@ static int dmic_get_gain(struct snd_kcontrol *kcontrol,
 
 	p.cmd = EC_CODEC_DMIC_GET_GAIN_IDX;
 	p.get_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_0;
-	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
+	ret = cros_ec_send_cmd_msg(priv->ec_device, 0, EC_CMD_EC_CODEC_DMIC,
 				   (uint8_t *)&p, sizeof(p),
 				   (uint8_t *)&r, sizeof(r));
 	if (ret < 0)
@@ -158,7 +126,7 @@ static int dmic_get_gain(struct snd_kcontrol *kcontrol,
 
 	p.cmd = EC_CODEC_DMIC_GET_GAIN_IDX;
 	p.get_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_1;
-	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
+	ret = cros_ec_send_cmd_msg(priv->ec_device, 0, EC_CMD_EC_CODEC_DMIC,
 				   (uint8_t *)&p, sizeof(p),
 				   (uint8_t *)&r, sizeof(r));
 	if (ret < 0)
@@ -191,7 +159,7 @@ static int dmic_put_gain(struct snd_kcontrol *kcontrol,
 	p.cmd = EC_CODEC_DMIC_SET_GAIN_IDX;
 	p.set_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_0;
 	p.set_gain_idx_param.gain = left;
-	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
+	ret = cros_ec_send_cmd_msg(priv->ec_device, 0, EC_CMD_EC_CODEC_DMIC,
 				   (uint8_t *)&p, sizeof(p), NULL, 0);
 	if (ret < 0)
 		return ret;
@@ -199,7 +167,7 @@ static int dmic_put_gain(struct snd_kcontrol *kcontrol,
 	p.cmd = EC_CODEC_DMIC_SET_GAIN_IDX;
 	p.set_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_1;
 	p.set_gain_idx_param.gain = right;
-	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
+	return cros_ec_send_cmd_msg(priv->ec_device, 0, EC_CMD_EC_CODEC_DMIC,
 				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
 
@@ -231,7 +199,7 @@ static int dmic_probe(struct snd_soc_component *component)
 
 	p.cmd = EC_CODEC_DMIC_GET_MAX_GAIN;
 
-	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
+	ret = cros_ec_send_cmd_msg(priv->ec_device, 0, EC_CMD_EC_CODEC_DMIC,
 				   (uint8_t *)&p, sizeof(p),
 				   (uint8_t *)&r, sizeof(r));
 	if (ret < 0) {
@@ -279,7 +247,7 @@ static int i2s_rx_hw_params(struct snd_pcm_substream *substream,
 
 	p.cmd = EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH;
 	p.set_sample_depth_param.depth = depth;
-	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+	ret = cros_ec_send_cmd_msg(priv->ec_device, 0, EC_CMD_EC_CODEC_I2S_RX,
 				   (uint8_t *)&p, sizeof(p), NULL, 0);
 	if (ret < 0)
 		return ret;
@@ -289,7 +257,7 @@ static int i2s_rx_hw_params(struct snd_pcm_substream *substream,
 
 	p.cmd = EC_CODEC_I2S_RX_SET_BCLK;
 	p.set_bclk_param.bclk = snd_soc_params_to_bclk(params);
-	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+	return cros_ec_send_cmd_msg(priv->ec_device, 0, EC_CMD_EC_CODEC_I2S_RX,
 				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
 
@@ -333,7 +301,7 @@ static int i2s_rx_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	p.cmd = EC_CODEC_I2S_RX_SET_DAIFMT;
 	p.set_daifmt_param.daifmt = daifmt;
-	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+	return cros_ec_send_cmd_msg(priv->ec_device, 0, EC_CMD_EC_CODEC_I2S_RX,
 				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
 
@@ -364,7 +332,7 @@ static int i2s_rx_event(struct snd_soc_dapm_widget *w,
 		return 0;
 	}
 
-	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+	return cros_ec_send_cmd_msg(priv->ec_device, 0, EC_CMD_EC_CODEC_I2S_RX,
 				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
 
@@ -415,7 +383,7 @@ static void *wov_map_shm(struct cros_ec_codec_priv *priv,
 
 	p.cmd = EC_CODEC_GET_SHM_ADDR;
 	p.get_shm_addr_param.shm_id = shm_id;
-	if (send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC,
+	if (cros_ec_send_cmd_msg(priv->ec_device, 0, EC_CMD_EC_CODEC,
 				 (uint8_t *)&p, sizeof(p),
 				 (uint8_t *)&r, sizeof(r)) < 0) {
 		dev_err(priv->dev, "failed to EC_CODEC_GET_SHM_ADDR\n");
@@ -453,7 +421,7 @@ static void *wov_map_shm(struct cros_ec_codec_priv *priv,
 		p.set_shm_addr_param.phys_addr = priv->ap_shm_last_alloc;
 		p.set_shm_addr_param.len = req;
 		p.set_shm_addr_param.shm_id = shm_id;
-		if (send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC,
+		if (cros_ec_send_cmd_msg(priv->ec_device, 0, EC_CMD_EC_CODEC,
 					 (uint8_t *)&p, sizeof(p),
 					 NULL, 0) < 0) {
 			dev_err(priv->dev, "failed to EC_CODEC_SET_SHM_ADDR\n");
@@ -571,7 +539,7 @@ static int wov_read_audio_shm(struct cros_ec_codec_priv *priv)
 	int ret;
 
 	p.cmd = EC_CODEC_WOV_READ_AUDIO_SHM;
-	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_WOV,
+	ret = cros_ec_send_cmd_msg(priv->ec_device, 0, EC_CMD_EC_CODEC_WOV,
 				   (uint8_t *)&p, sizeof(p),
 				   (uint8_t *)&r, sizeof(r));
 	if (ret) {
@@ -596,7 +564,8 @@ static int wov_read_audio(struct cros_ec_codec_priv *priv)
 
 	while (remain >= 0) {
 		p.cmd = EC_CODEC_WOV_READ_AUDIO;
-		ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_WOV,
+		ret = cros_ec_send_cmd_msg(priv->ec_device, 0,
+					   EC_CMD_EC_CODEC_WOV,
 					   (uint8_t *)&p, sizeof(p),
 					   (uint8_t *)&r, sizeof(r));
 		if (ret) {
@@ -669,7 +638,8 @@ static int wov_enable_put(struct snd_kcontrol *kcontrol,
 		else
 			p.cmd = EC_CODEC_WOV_DISABLE;
 
-		ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_WOV,
+		ret = cros_ec_send_cmd_msg(priv->ec_device, 0,
+					   EC_CMD_EC_CODEC_WOV,
 					   (uint8_t *)&p, sizeof(p), NULL, 0);
 		if (ret) {
 			dev_err(priv->dev, "failed to %s wov\n",
@@ -716,7 +686,7 @@ static int wov_set_lang_shm(struct cros_ec_codec_priv *priv,
 	p.cmd = EC_CODEC_WOV_SET_LANG_SHM;
 	memcpy(pp->hash, digest, SHA256_DIGEST_SIZE);
 	pp->total_len = size;
-	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_WOV,
+	ret = cros_ec_send_cmd_msg(priv->ec_device, 0, EC_CMD_EC_CODEC_WOV,
 				   (uint8_t *)&p, sizeof(p), NULL, 0);
 	if (ret) {
 		dev_err(priv->dev, "failed to EC_CODEC_WOV_SET_LANG_SHM\n");
@@ -743,7 +713,8 @@ static int wov_set_lang(struct cros_ec_codec_priv *priv,
 		pp->offset = i;
 		memcpy(pp->buf, buf + i, req);
 		pp->len = req;
-		ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_WOV,
+		ret = cros_ec_send_cmd_msg(priv->ec_device, 0,
+					   EC_CMD_EC_CODEC_WOV,
 					   (uint8_t *)&p, sizeof(p), NULL, 0);
 		if (ret) {
 			dev_err(priv->dev, "failed to EC_CODEC_WOV_SET_LANG\n");
@@ -782,7 +753,7 @@ static int wov_hotword_model_put(struct snd_kcontrol *kcontrol,
 		goto leave;
 
 	p.cmd = EC_CODEC_WOV_GET_LANG;
-	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_WOV,
+	ret = cros_ec_send_cmd_msg(priv->ec_device, 0, EC_CMD_EC_CODEC_WOV,
 				   (uint8_t *)&p, sizeof(p),
 				   (uint8_t *)&r, sizeof(r));
 	if (ret)
@@ -1020,7 +991,7 @@ static int cros_ec_codec_platform_probe(struct platform_device *pdev)
 	atomic_set(&priv->dmic_probed, 0);
 
 	p.cmd = EC_CODEC_GET_CAPABILITIES;
-	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC,
+	ret = cros_ec_send_cmd_msg(priv->ec_device, 0, EC_CMD_EC_CODEC,
 				   (uint8_t *)&p, sizeof(p),
 				   (uint8_t *)&r, sizeof(r));
 	if (ret) {
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
