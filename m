Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBE5DAF17
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 16:04:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED1DF1680;
	Thu, 17 Oct 2019 16:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED1DF1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571321066;
	bh=dLfBVNq9e8JGXhBCnxy2791dTt5qedVagXAOqMl9TUQ=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r2xSPdu/QgWhF/89xSJ159Ps6oqgqQZ72CpaIxVRwQ8j1FOgWriVrgyTyZIc0I3mR
	 lMvI/PMr69kKTDCnD8erozv+M9YPM26R7moQhL+LgThkbH80tyDSUieiUUQbCc1w+v
	 8fK9mtdu8SjacFfobE0BzCK+nx/DiV2jgEgaZHFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0558DF80612;
	Thu, 17 Oct 2019 16:00:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 595E5F80612; Thu, 17 Oct 2019 16:00:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A8A2F80612
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 16:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A8A2F80612
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="iqYVq2L7"
Received: by mail-pg1-x549.google.com with SMTP id e15so1782441pgh.19
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 07:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=25ynQiwVZQ+dy11FxD/YUoUgn2vdDqDuKQnd4i5dR+A=;
 b=iqYVq2L7ewqe+0Ll7mBY5cBCenBbJbwVyZe1SSyeYdosVOAOyN5qBNYpEA3waH3kO+
 dNPka4is79DD8lYB9au4hZ88AMFEsr6dR1myocl4KYi+96Oe+oJ2vS2puMl5qLgwBQPe
 HdYzViVN1OaH5HzLUh6O9WERnJfy7AM2S9VKQskf546xxDV2kOQDt8Z8w2y7crMPZUy2
 b5NW8BmE+qj3s7PhShFKwPgGxJ3vUOcTRZUnlubdoxytM5G3BmkA3YvF5kfNrE5urpTv
 pKOorPQbRMDIFbRrEVXF2nbdnkOoDx8zI+WX0GdumgGInRhgz+lmA271sgbdvUwSJJU0
 diBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=25ynQiwVZQ+dy11FxD/YUoUgn2vdDqDuKQnd4i5dR+A=;
 b=RPNM64pGiwaumIFUlyu1QO/+l18s7RQkCg58/KiIkQ775U8Dx1DO7Z6zyjAJ8kqoyy
 A8/rVPnKCKoCZWN+9C/x3qIsozd2AllmG40jB588aTKxuFLnr10O3wwzo4ytzGRGD8/v
 YInbSzRLbp6A8Eihogk3sARGO+Y4ogDU8ygzQ8DRP98aM/CvwkjJzHQMfxWanAn31mVR
 c/i9G8jA3HzaHbxph1AnyqLNybPmEiGgcA4TefPaGli5aOdtXk6hxELmuHCRR6vXGjgd
 YCHutTKM57S0oHTuOlDk1MPGcHGdPzk2KLR97vJWP9Cdp8Ye3TKesqWgJjVqIn5Kk9ji
 0xnA==
X-Gm-Message-State: APjAAAUPtaHqmc66p3x6E5Bz4Up7wPrx1b2RAz2sdEg4ND4vcrxgT7B0
 U2g0CPjVf3LWYwugu0xqE0L34CJ5Wz5Q
X-Google-Smtp-Source: APXvYqydx344sL9u4U6uQaHfZxOZnHeQvkGOH9bdai+Hgi2uHWf67D1O6STtSjmzDBz7/Kt6o0dJK6V0Q1pe
X-Received: by 2002:a63:7405:: with SMTP id p5mr4398819pgc.264.1571320848295; 
 Thu, 17 Oct 2019 07:00:48 -0700 (PDT)
Date: Thu, 17 Oct 2019 22:00:08 +0800
In-Reply-To: <20191017213539.00-tzungbi@google.com>
Message-Id: <20191017213539.03.I93d9c65964f3c30f85a36d228e31150ff1917706@changeid>
Mime-Version: 1.0
References: <20191017213539.00-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, Benson Leung <bleung@chromium.org>,
 tzungbi@google.com, robh+dt@kernel.org, enric.balletbo@collabora.com,
 bleung@google.com, dgreid@google.com
Subject: [alsa-devel] [PATCH v4 03/10] ASoC: cros_ec_codec: extract DMIC EC
 command from I2S RX
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

Extract DMIC EC command from I2S RX.  Setting and getting
microphone gains is common features.

Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/platform/chrome/cros_ec_trace.c       |  1 +
 .../linux/platform_data/cros_ec_commands.h    | 49 +++++++++++-----
 sound/soc/codecs/cros_ec_codec.c              | 57 ++++++++++---------
 3 files changed, 68 insertions(+), 39 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_trace.c b/drivers/platform/chrome/cros_ec_trace.c
index 901850004b2b..e73bb6a8b00e 100644
--- a/drivers/platform/chrome/cros_ec_trace.c
+++ b/drivers/platform/chrome/cros_ec_trace.c
@@ -98,6 +98,7 @@
 	TRACE_SYMBOL(EC_CMD_SB_READ_BLOCK), \
 	TRACE_SYMBOL(EC_CMD_SB_WRITE_BLOCK), \
 	TRACE_SYMBOL(EC_CMD_BATTERY_VENDOR_PARAM), \
+	TRACE_SYMBOL(EC_CMD_EC_CODEC_DMIC), \
 	TRACE_SYMBOL(EC_CMD_EC_CODEC_I2S_RX), \
 	TRACE_SYMBOL(EC_CMD_REBOOT_EC), \
 	TRACE_SYMBOL(EC_CMD_GET_PANIC_INFO), \
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 261ac83bd007..58e460c015ef 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4466,18 +4466,48 @@ enum mkbp_cec_event {
 
 /*****************************************************************************/
 
+/* Commands for DMIC on audio codec. */
+#define EC_CMD_EC_CODEC_DMIC 0x00BC
+
+enum ec_codec_dmic_subcmd {
+	EC_CODEC_DMIC_SET_GAIN = 0x0,
+	EC_CODEC_DMIC_GET_GAIN = 0x1,
+	EC_CODEC_DMIC_SUBCMD_COUNT,
+};
+
+struct __ec_align1 ec_param_ec_codec_dmic_set_gain {
+	uint8_t left;
+	uint8_t right;
+	uint8_t reserved[2];
+};
+
+struct __ec_align4 ec_param_ec_codec_dmic {
+	uint8_t cmd; /* enum ec_codec_dmic_subcmd */
+	uint8_t reserved[3];
+
+	union {
+		struct ec_param_ec_codec_dmic_set_gain
+				set_gain_param;
+	};
+};
+
+struct __ec_align1 ec_response_ec_codec_dmic_get_gain {
+	uint8_t left;
+	uint8_t right;
+};
+
+/*****************************************************************************/
+
 /* Commands for I2S RX on audio codec. */
 
-#define EC_CMD_EC_CODEC_I2S_RX 0x00BC
+#define EC_CMD_EC_CODEC_I2S_RX 0x00BD
 
 enum ec_codec_i2s_rx_subcmd {
 	EC_CODEC_I2S_RX_ENABLE = 0x0,
 	EC_CODEC_I2S_RX_DISABLE = 0x1,
-	EC_CODEC_I2S_RX_SET_GAIN = 0x2,
-	EC_CODEC_I2S_RX_GET_GAIN = 0x3,
-	EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH = 0x4,
-	EC_CODEC_I2S_RX_SET_DAIFMT = 0x5,
-	EC_CODEC_I2S_RX_SET_BCLK = 0x6,
+	EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH = 0x2,
+	EC_CODEC_I2S_RX_SET_DAIFMT = 0x3,
+	EC_CODEC_I2S_RX_SET_BCLK = 0x4,
 	EC_CODEC_I2S_RX_SUBCMD_COUNT,
 };
 
@@ -4521,8 +4551,6 @@ struct __ec_align4 ec_param_ec_codec_i2s_rx {
 	union {
 		struct ec_param_ec_codec_i2s_rx_set_sample_depth
 				set_sample_depth_param;
-		struct ec_param_ec_codec_i2s_rx_set_gain
-				set_gain_param;
 		struct ec_param_ec_codec_i2s_rx_set_daifmt
 				set_daifmt_param;
 		struct ec_param_ec_codec_i2s_rx_set_bclk
@@ -4530,11 +4558,6 @@ struct __ec_align4 ec_param_ec_codec_i2s_rx {
 	};
 };
 
-struct __ec_align1 ec_response_ec_codec_i2s_rx_get_gain {
-	uint8_t left;
-	uint8_t right;
-};
-
 /*****************************************************************************/
 /* System commands */
 
diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 179fa77291cd..c19c7fe42e2e 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -64,12 +64,12 @@ static int dmic_get_gain(struct snd_kcontrol *kcontrol,
 		snd_soc_kcontrol_component(kcontrol);
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
-	struct ec_param_ec_codec_i2s_rx p;
-	struct ec_response_ec_codec_i2s_rx_get_gain r;
+	struct ec_param_ec_codec_dmic p;
+	struct ec_response_ec_codec_dmic_get_gain r;
 	int ret;
 
-	p.cmd = EC_CODEC_I2S_RX_GET_GAIN;
-	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+	p.cmd = EC_CODEC_DMIC_GET_GAIN;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
 				   (uint8_t *)&p, sizeof(p),
 				   (uint8_t *)&r, sizeof(r));
 	if (ret < 0)
@@ -93,17 +93,17 @@ static int dmic_put_gain(struct snd_kcontrol *kcontrol,
 	int max_dmic_gain = control->max;
 	int left = ucontrol->value.integer.value[0];
 	int right = ucontrol->value.integer.value[1];
-	struct ec_param_ec_codec_i2s_rx p;
+	struct ec_param_ec_codec_dmic p;
 
 	if (left > max_dmic_gain || right > max_dmic_gain)
 		return -EINVAL;
 
 	dev_dbg(component->dev, "set mic gain to %u, %u\n", left, right);
 
-	p.cmd = EC_CODEC_I2S_RX_SET_GAIN;
+	p.cmd = EC_CODEC_DMIC_SET_GAIN;
 	p.set_gain_param.left = left;
 	p.set_gain_param.right = right;
-	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
 				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
 
@@ -120,6 +120,29 @@ static struct snd_kcontrol_new dmic_controls[] = {
 				   dmic_gain_tlv),
 };
 
+static int dmic_probe(struct snd_soc_component *component)
+{
+	struct cros_ec_codec_priv *priv =
+		snd_soc_component_get_drvdata(component);
+	struct device *dev = priv->dev;
+	int ret, val;
+	struct soc_mixer_control *control;
+
+	ret = device_property_read_u32(dev, "max-dmic-gain", &val);
+	if (ret) {
+		dev_err(dev, "Failed to read 'max-dmic-gain'\n");
+		return ret;
+	}
+
+	control = (struct soc_mixer_control *)
+		dmic_controls[DMIC_CTL_GAIN].private_value;
+	control->max = val;
+	control->platform_max = val;
+
+	return snd_soc_add_component_controls(component,
+			&dmic_controls[DMIC_CTL_GAIN], 1);
+}
+
 static int i2s_rx_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params,
 			    struct snd_soc_dai *dai)
@@ -265,25 +288,7 @@ static struct snd_soc_dai_driver i2s_rx_dai_driver = {
 
 static int i2s_rx_probe(struct snd_soc_component *component)
 {
-	struct cros_ec_codec_priv *priv =
-		snd_soc_component_get_drvdata(component);
-	struct device *dev = priv->dev;
-	int ret, val;
-	struct soc_mixer_control *control;
-
-	ret = device_property_read_u32(dev, "max-dmic-gain", &val);
-	if (ret) {
-		dev_err(dev, "Failed to read 'max-dmic-gain'\n");
-		return ret;
-	}
-
-	control = (struct soc_mixer_control *)
-			dmic_controls[DMIC_CTL_GAIN].private_value;
-	control->max = val;
-	control->platform_max = val;
-
-	return snd_soc_add_component_controls(component,
-			&dmic_controls[DMIC_CTL_GAIN], 1);
+	return dmic_probe(component);
 }
 
 static const struct snd_soc_component_driver i2s_rx_component_driver = {
-- 
2.23.0.700.g56cf767bdb-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
