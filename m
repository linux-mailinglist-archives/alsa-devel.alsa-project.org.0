Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F24ADDAF11
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 16:04:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 957A01681;
	Thu, 17 Oct 2019 16:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 957A01681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571321041;
	bh=Mby53/bkIJFktvt/9MFcVUNQHRgIeH4S3YkLcdNyasY=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UUgA31H4JgboafIX0BsyCNP0K+RkQvxhiGdlw775G8fLpG29eDd9wvcw/JlVHsPyB
	 FELEYfeyxtpaU9Y7F997NZ9BK5hRm3KDgRrzmAQ/LbFPK2iGkEO2YWDQG6FiNpRZTR
	 w28OZ4sdvv4A/pFAt/LoEbPsZTryjsyhVEC+Z4us=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2D02F8060D;
	Thu, 17 Oct 2019 16:00:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91E05F8060F; Thu, 17 Oct 2019 16:00:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 434FFF805FB
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 16:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 434FFF805FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="WEej6Tvp"
Received: by mail-yb1-xb49.google.com with SMTP id 204so1774659yba.23
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 07:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=0CbG2yjXoVD+qjMC6Q7V2iILYHzpAEIeoC1XOh6g5EU=;
 b=WEej6TvpgVRZ4c2c7XuZuAIeDzx5R7Wa1WX3sIxdnnDp4WqT5VznkieInGqy0l92jQ
 weFyuRFZmg7fs+op9fLm0s6dzgJ0kXazt1xQdKgInrDOOGfg9oSas4j4OB2JVuh/A8Kt
 /hSLv9KsrwFs79CLmZt/cfPljcKKP9GkmH4qp/KyE3+nf9SeRiLK+HmBF9PsaQQB6Qt5
 W3y6cUZJHQYRC1KwJB+m/yjsLDO0ByVY87GG/kKTJ0/HMOlOTEOCsQXUQ2kzi+qA5HVu
 YtJwRnvK28gYLTanfcZSDAgMBAoqHFHcnbWFPtTAyBkd1NhzKXuLRGoX9E25hxW70yj1
 rs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=0CbG2yjXoVD+qjMC6Q7V2iILYHzpAEIeoC1XOh6g5EU=;
 b=XjpCogSA3iHncwekz5eMROTZ7ZuNA88s1pLli9wb2enNGLTR5EDT5lxl7wY2jhy8kl
 bbjHp8Ao6x9UXFYGp7CQPpacwEJP9P0AbiR9wJVkUGPjCmECkL4D1egrW8Hg8UotzTSA
 reOXjdHSTig1utxgWJS3vDF/wkS5z/rKwzRXXlF1HdELpO+neOPSPPU0uQYWGoP29/6x
 kc2IV/+VrB4/jSHy1ylvhuMwbje6yNxvTp09mWzuWvNLrbJTc7svDwSCwEgsTKofppHX
 8cbbGl5kVqRB34H+rPyxcxtH80G8MlZPvUH2wTHGbqcWMSMLTI2rcmXZ6Ig+ALIS4F2D
 5p8w==
X-Gm-Message-State: APjAAAWHW8A/PFk4YajE+Uva9iwzQ/sAZLbWVj/+iJJs119aw9Sr02XF
 CMPzGHzo7/s+TSubuULbf6tXOJjikYqB
X-Google-Smtp-Source: APXvYqw+eV3CsAfWRrPxhMryfNg7FUGxQ2EOsmpDAQG8FDLPXakQGGedsK/BLm+NuozvC4k8tYzFNi6Z95/d
X-Received: by 2002:a25:76cd:: with SMTP id r196mr2398196ybc.446.1571320843493; 
 Thu, 17 Oct 2019 07:00:43 -0700 (PDT)
Date: Thu, 17 Oct 2019 22:00:07 +0800
In-Reply-To: <20191017213539.00-tzungbi@google.com>
Message-Id: <20191017213539.02.I43373b9a66dbb70196b3f216b3aa86111c410836@changeid>
Mime-Version: 1.0
References: <20191017213539.00-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, Benson Leung <bleung@chromium.org>,
 tzungbi@google.com, robh+dt@kernel.org, enric.balletbo@collabora.com,
 bleung@google.com, dgreid@google.com
Subject: [alsa-devel] [PATCH v4 02/10] ASoC: cros_ec_codec: refactor I2S RX
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

Refactor by the following items:
- reformat copyright declaration
- use more specific name "i2s rx"
- use verbose symbol names to separate namespaces
- make some short functions inline
- remove unused TDM-related code

Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/platform/chrome/cros_ec_trace.c       |   2 +-
 .../linux/platform_data/cros_ec_commands.h    | 120 ++---
 sound/soc/codecs/cros_ec_codec.c              | 502 +++++++-----------
 3 files changed, 251 insertions(+), 373 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_trace.c b/drivers/platform/chrome/cros_ec_trace.c
index 6f80ff4532ae..901850004b2b 100644
--- a/drivers/platform/chrome/cros_ec_trace.c
+++ b/drivers/platform/chrome/cros_ec_trace.c
@@ -98,7 +98,7 @@
 	TRACE_SYMBOL(EC_CMD_SB_READ_BLOCK), \
 	TRACE_SYMBOL(EC_CMD_SB_WRITE_BLOCK), \
 	TRACE_SYMBOL(EC_CMD_BATTERY_VENDOR_PARAM), \
-	TRACE_SYMBOL(EC_CMD_CODEC_I2S), \
+	TRACE_SYMBOL(EC_CMD_EC_CODEC_I2S_RX), \
 	TRACE_SYMBOL(EC_CMD_REBOOT_EC), \
 	TRACE_SYMBOL(EC_CMD_GET_PANIC_INFO), \
 	TRACE_SYMBOL(EC_CMD_ACPI_READ), \
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 43b8f7dae4cc..261ac83bd007 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4466,92 +4466,74 @@ enum mkbp_cec_event {
 
 /*****************************************************************************/
 
-/* Commands for I2S recording on audio codec. */
-
-#define EC_CMD_CODEC_I2S 0x00BC
-#define EC_WOV_I2S_SAMPLE_RATE 48000
-
-enum ec_codec_i2s_subcmd {
-	EC_CODEC_SET_SAMPLE_DEPTH = 0x0,
-	EC_CODEC_SET_GAIN = 0x1,
-	EC_CODEC_GET_GAIN = 0x2,
-	EC_CODEC_I2S_ENABLE = 0x3,
-	EC_CODEC_I2S_SET_CONFIG = 0x4,
-	EC_CODEC_I2S_SET_TDM_CONFIG = 0x5,
-	EC_CODEC_I2S_SET_BCLK = 0x6,
-	EC_CODEC_I2S_SUBCMD_COUNT = 0x7,
+/* Commands for I2S RX on audio codec. */
+
+#define EC_CMD_EC_CODEC_I2S_RX 0x00BC
+
+enum ec_codec_i2s_rx_subcmd {
+	EC_CODEC_I2S_RX_ENABLE = 0x0,
+	EC_CODEC_I2S_RX_DISABLE = 0x1,
+	EC_CODEC_I2S_RX_SET_GAIN = 0x2,
+	EC_CODEC_I2S_RX_GET_GAIN = 0x3,
+	EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH = 0x4,
+	EC_CODEC_I2S_RX_SET_DAIFMT = 0x5,
+	EC_CODEC_I2S_RX_SET_BCLK = 0x6,
+	EC_CODEC_I2S_RX_SUBCMD_COUNT,
 };
 
-enum ec_sample_depth_value {
-	EC_CODEC_SAMPLE_DEPTH_16 = 0,
-	EC_CODEC_SAMPLE_DEPTH_24 = 1,
+enum ec_codec_i2s_rx_sample_depth {
+	EC_CODEC_I2S_RX_SAMPLE_DEPTH_16 = 0x0,
+	EC_CODEC_I2S_RX_SAMPLE_DEPTH_24 = 0x1,
+	EC_CODEC_I2S_RX_SAMPLE_DEPTH_COUNT,
 };
 
-enum ec_i2s_config {
-	EC_DAI_FMT_I2S = 0,
-	EC_DAI_FMT_RIGHT_J = 1,
-	EC_DAI_FMT_LEFT_J = 2,
-	EC_DAI_FMT_PCM_A = 3,
-	EC_DAI_FMT_PCM_B = 4,
-	EC_DAI_FMT_PCM_TDM = 5,
+enum ec_codec_i2s_rx_daifmt {
+	EC_CODEC_I2S_RX_DAIFMT_I2S = 0x0,
+	EC_CODEC_I2S_RX_DAIFMT_RIGHT_J = 0x1,
+	EC_CODEC_I2S_RX_DAIFMT_LEFT_J = 0x2,
+	EC_CODEC_I2S_RX_DAIFMT_COUNT,
 };
 
-/*
- * For subcommand EC_CODEC_GET_GAIN.
- */
-struct __ec_align1 ec_codec_i2s_gain {
+struct __ec_align1 ec_param_ec_codec_i2s_rx_set_sample_depth {
+	uint8_t depth;
+	uint8_t reserved[3];
+};
+
+struct __ec_align1 ec_param_ec_codec_i2s_rx_set_gain {
 	uint8_t left;
 	uint8_t right;
+	uint8_t reserved[2];
 };
 
-struct __ec_todo_unpacked ec_param_codec_i2s_tdm {
-	int16_t ch0_delay; /* 0 to 496 */
-	int16_t ch1_delay; /* -1 to 496 */
-	uint8_t adjacent_to_ch0;
-	uint8_t adjacent_to_ch1;
+struct __ec_align1 ec_param_ec_codec_i2s_rx_set_daifmt {
+	uint8_t daifmt;
+	uint8_t reserved[3];
 };
 
-struct __ec_todo_packed ec_param_codec_i2s {
-	/* enum ec_codec_i2s_subcmd */
-	uint8_t cmd;
-	union {
-		/*
-		 * EC_CODEC_SET_SAMPLE_DEPTH
-		 * Value should be one of ec_sample_depth_value.
-		 */
-		uint8_t depth;
-
-		/*
-		 * EC_CODEC_SET_GAIN
-		 * Value should be 0~43 for both channels.
-		 */
-		struct ec_codec_i2s_gain gain;
-
-		/*
-		 * EC_CODEC_I2S_ENABLE
-		 * 1 to enable, 0 to disable.
-		 */
-		uint8_t i2s_enable;
-
-		/*
-		 * EC_CODEC_I2S_SET_CONFIG
-		 * Value should be one of ec_i2s_config.
-		 */
-		uint8_t i2s_config;
+struct __ec_align4 ec_param_ec_codec_i2s_rx_set_bclk {
+	uint32_t bclk;
+};
 
-		/*
-		 * EC_CODEC_I2S_SET_TDM_CONFIG
-		 * Value should be one of ec_i2s_config.
-		 */
-		struct ec_param_codec_i2s_tdm tdm_param;
+struct __ec_align4 ec_param_ec_codec_i2s_rx {
+	uint8_t cmd; /* enum ec_codec_i2s_rx_subcmd */
+	uint8_t reserved[3];
 
-		/*
-		 * EC_CODEC_I2S_SET_BCLK
-		 */
-		uint32_t bclk;
+	union {
+		struct ec_param_ec_codec_i2s_rx_set_sample_depth
+				set_sample_depth_param;
+		struct ec_param_ec_codec_i2s_rx_set_gain
+				set_gain_param;
+		struct ec_param_ec_codec_i2s_rx_set_daifmt
+				set_daifmt_param;
+		struct ec_param_ec_codec_i2s_rx_set_bclk
+				set_bclk_param;
 	};
 };
 
+struct __ec_align1 ec_response_ec_codec_i2s_rx_get_gain {
+	uint8_t left;
+	uint8_t right;
+};
 
 /*****************************************************************************/
 /* System commands */
diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 3c1bd24a1057..179fa77291cd 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Driver for ChromeOS Embedded Controller codec.
+ * Copyright 2019 Google, Inc.
+ *
+ * ChromeOS Embedded Controller codec driver.
  *
  * This driver uses the cros-ec interface to communicate with the ChromeOS
  * EC for audio function.
@@ -18,403 +20,297 @@
 #include <sound/soc.h>
 #include <sound/tlv.h>
 
-#define DRV_NAME "cros-ec-codec"
-
-/**
- * struct cros_ec_codec_data - ChromeOS EC codec driver data.
- * @dev:		Device structure used in sysfs.
- * @ec_device:		cros_ec_device structure to talk to the physical device.
- * @component:		Pointer to the component.
- * @max_dmic_gain:	Maximum gain in dB supported by EC codec.
- */
-struct cros_ec_codec_data {
+struct cros_ec_codec_priv {
 	struct device *dev;
 	struct cros_ec_device *ec_device;
-	struct snd_soc_component *component;
-	unsigned int max_dmic_gain;
 };
 
-static const DECLARE_TLV_DB_SCALE(ec_mic_gain_tlv, 0, 100, 0);
-
-static int ec_command_get_gain(struct snd_soc_component *component,
-			       struct ec_param_codec_i2s *param,
-			       struct ec_codec_i2s_gain *resp)
+static int send_ec_host_command(struct cros_ec_device *ec_dev, uint32_t cmd,
+				uint8_t *out, size_t outsize,
+				uint8_t *in, size_t insize)
 {
-	struct cros_ec_codec_data *codec_data =
-		snd_soc_component_get_drvdata(component);
-	struct cros_ec_device *ec_device = codec_data->ec_device;
-	u8 buffer[sizeof(struct cros_ec_command) +
-		  max(sizeof(struct ec_param_codec_i2s),
-		      sizeof(struct ec_codec_i2s_gain))];
-	struct cros_ec_command *msg = (struct cros_ec_command *)&buffer;
 	int ret;
+	struct cros_ec_command *msg;
+
+	msg = kmalloc(sizeof(*msg) + max(outsize, insize), GFP_KERNEL);
+	if (!msg)
+		return -ENOMEM;
 
 	msg->version = 0;
-	msg->command = EC_CMD_CODEC_I2S;
-	msg->outsize = sizeof(struct ec_param_codec_i2s);
-	msg->insize = sizeof(struct ec_codec_i2s_gain);
+	msg->command = cmd;
+	msg->outsize = outsize;
+	msg->insize = insize;
+
+	if (outsize)
+		memcpy(msg->data, out, outsize);
 
-	memcpy(msg->data, param, msg->outsize);
+	ret = cros_ec_cmd_xfer_status(ec_dev, msg);
+	if (ret < 0)
+		goto error;
 
-	ret = cros_ec_cmd_xfer_status(ec_device, msg);
-	if (ret > 0)
-		memcpy(resp, msg->data, msg->insize);
+	if (insize)
+		memcpy(in, msg->data, insize);
 
+	ret = 0;
+error:
+	kfree(msg);
 	return ret;
 }
 
-/*
- * Wrapper for EC command without response.
- */
-static int ec_command_no_resp(struct snd_soc_component *component,
-			      struct ec_param_codec_i2s *param)
+static int dmic_get_gain(struct snd_kcontrol *kcontrol,
+			 struct snd_ctl_elem_value *ucontrol)
 {
-	struct cros_ec_codec_data *codec_data =
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
-	struct cros_ec_device *ec_device = codec_data->ec_device;
-	u8 buffer[sizeof(struct cros_ec_command) +
-		  sizeof(struct ec_param_codec_i2s)];
-	struct cros_ec_command *msg = (struct cros_ec_command *)&buffer;
-
-	msg->version = 0;
-	msg->command = EC_CMD_CODEC_I2S;
-	msg->outsize = sizeof(struct ec_param_codec_i2s);
-	msg->insize = 0;
-
-	memcpy(msg->data, param, msg->outsize);
-
-	return cros_ec_cmd_xfer_status(ec_device, msg);
-}
-
-static int set_i2s_config(struct snd_soc_component *component,
-			  enum ec_i2s_config i2s_config)
-{
-	struct ec_param_codec_i2s param;
+	struct ec_param_ec_codec_i2s_rx p;
+	struct ec_response_ec_codec_i2s_rx_get_gain r;
+	int ret;
 
-	dev_dbg(component->dev, "%s set I2S format to %u\n", __func__,
-		i2s_config);
+	p.cmd = EC_CODEC_I2S_RX_GET_GAIN;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+				   (uint8_t *)&p, sizeof(p),
+				   (uint8_t *)&r, sizeof(r));
+	if (ret < 0)
+		return ret;
 
-	param.cmd = EC_CODEC_I2S_SET_CONFIG;
-	param.i2s_config = i2s_config;
+	ucontrol->value.integer.value[0] = r.left;
+	ucontrol->value.integer.value[1] = r.right;
 
-	return ec_command_no_resp(component, &param);
+	return 0;
 }
 
-static int cros_ec_i2s_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+static int dmic_put_gain(struct snd_kcontrol *kcontrol,
+			 struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = dai->component;
-	enum ec_i2s_config i2s_config;
-
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
-	case SND_SOC_DAIFMT_NB_NF:
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
-	case SND_SOC_DAIFMT_I2S:
-		i2s_config = EC_DAI_FMT_I2S;
-		break;
-
-	case SND_SOC_DAIFMT_RIGHT_J:
-		i2s_config = EC_DAI_FMT_RIGHT_J;
-		break;
-
-	case SND_SOC_DAIFMT_LEFT_J:
-		i2s_config = EC_DAI_FMT_LEFT_J;
-		break;
-
-	case SND_SOC_DAIFMT_DSP_A:
-		i2s_config = EC_DAI_FMT_PCM_A;
-		break;
-
-	case SND_SOC_DAIFMT_DSP_B:
-		i2s_config = EC_DAI_FMT_PCM_B;
-		break;
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct cros_ec_codec_priv *priv =
+		snd_soc_component_get_drvdata(component);
+	struct soc_mixer_control *control =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	int max_dmic_gain = control->max;
+	int left = ucontrol->value.integer.value[0];
+	int right = ucontrol->value.integer.value[1];
+	struct ec_param_ec_codec_i2s_rx p;
 
-	default:
+	if (left > max_dmic_gain || right > max_dmic_gain)
 		return -EINVAL;
-	}
 
-	return set_i2s_config(component, i2s_config);
-}
-
-static int set_i2s_sample_depth(struct snd_soc_component *component,
-				enum ec_sample_depth_value depth)
-{
-	struct ec_param_codec_i2s param;
-
-	dev_dbg(component->dev, "%s set depth to %u\n", __func__, depth);
-
-	param.cmd = EC_CODEC_SET_SAMPLE_DEPTH;
-	param.depth = depth;
+	dev_dbg(component->dev, "set mic gain to %u, %u\n", left, right);
 
-	return ec_command_no_resp(component, &param);
+	p.cmd = EC_CODEC_I2S_RX_SET_GAIN;
+	p.set_gain_param.left = left;
+	p.set_gain_param.right = right;
+	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
 
-static int set_i2s_bclk(struct snd_soc_component *component, uint32_t bclk)
-{
-	struct ec_param_codec_i2s param;
-
-	dev_dbg(component->dev, "%s set i2s bclk to %u\n", __func__, bclk);
+static const DECLARE_TLV_DB_SCALE(dmic_gain_tlv, 0, 100, 0);
 
-	param.cmd = EC_CODEC_I2S_SET_BCLK;
-	param.bclk = bclk;
+enum {
+	DMIC_CTL_GAIN = 0,
+};
 
-	return ec_command_no_resp(component, &param);
-}
+static struct snd_kcontrol_new dmic_controls[] = {
+	[DMIC_CTL_GAIN] =
+		SOC_DOUBLE_EXT_TLV("EC Mic Gain", SND_SOC_NOPM, SND_SOC_NOPM,
+				   0, 0, 0, dmic_get_gain, dmic_put_gain,
+				   dmic_gain_tlv),
+};
 
-static int cros_ec_i2s_hw_params(struct snd_pcm_substream *substream,
-				 struct snd_pcm_hw_params *params,
-				 struct snd_soc_dai *dai)
+static int i2s_rx_hw_params(struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *params,
+			    struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
-	unsigned int rate, bclk;
+	struct cros_ec_codec_priv *priv =
+		snd_soc_component_get_drvdata(component);
+	struct ec_param_ec_codec_i2s_rx p;
+	enum ec_codec_i2s_rx_sample_depth depth;
 	int ret;
 
-	rate = params_rate(params);
-	if (rate != 48000)
+	if (params_rate(params) != 48000)
 		return -EINVAL;
 
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
-		ret = set_i2s_sample_depth(component, EC_CODEC_SAMPLE_DEPTH_16);
+		depth = EC_CODEC_I2S_RX_SAMPLE_DEPTH_16;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
-		ret = set_i2s_sample_depth(component, EC_CODEC_SAMPLE_DEPTH_24);
+		depth = EC_CODEC_I2S_RX_SAMPLE_DEPTH_24;
 		break;
 	default:
 		return -EINVAL;
 	}
-	if (ret < 0)
-		return ret;
-
-	bclk = snd_soc_params_to_bclk(params);
-	return set_i2s_bclk(component, bclk);
-}
 
-static const struct snd_soc_dai_ops cros_ec_i2s_dai_ops = {
-	.hw_params = cros_ec_i2s_hw_params,
-	.set_fmt = cros_ec_i2s_set_dai_fmt,
-};
+	dev_dbg(component->dev, "set depth to %u\n", depth);
 
-static struct snd_soc_dai_driver cros_ec_dai[] = {
-	{
-		.name = "cros_ec_codec I2S",
-		.id = 0,
-		.capture = {
-			.stream_name = "I2S Capture",
-			.channels_min = 2,
-			.channels_max = 2,
-			.rates = SNDRV_PCM_RATE_48000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE |
-				   SNDRV_PCM_FMTBIT_S24_LE,
-		},
-		.ops = &cros_ec_i2s_dai_ops,
-	}
-};
-
-static int get_ec_mic_gain(struct snd_soc_component *component,
-			   u8 *left, u8 *right)
-{
-	struct ec_param_codec_i2s param;
-	struct ec_codec_i2s_gain resp;
-	int ret;
-
-	param.cmd = EC_CODEC_GET_GAIN;
-
-	ret = ec_command_get_gain(component, &param, &resp);
+	p.cmd = EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH;
+	p.set_sample_depth_param.depth = depth;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+				   (uint8_t *)&p, sizeof(p), NULL, 0);
 	if (ret < 0)
 		return ret;
 
-	*left = resp.left;
-	*right = resp.right;
-
-	return 0;
-}
-
-static int mic_gain_get(struct snd_kcontrol *kcontrol,
-			struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	u8 left, right;
-	int ret;
-
-	ret = get_ec_mic_gain(component, &left, &right);
-	if (ret)
-		return ret;
-
-	ucontrol->value.integer.value[0] = left;
-	ucontrol->value.integer.value[1] = right;
-
-	return 0;
-}
-
-static int set_ec_mic_gain(struct snd_soc_component *component,
-			   u8 left, u8 right)
-{
-	struct ec_param_codec_i2s param;
-
-	dev_dbg(component->dev, "%s set mic gain to %u, %u\n",
-		__func__, left, right);
+	dev_dbg(component->dev, "set bclk to %u\n",
+		snd_soc_params_to_bclk(params));
 
-	param.cmd = EC_CODEC_SET_GAIN;
-	param.gain.left = left;
-	param.gain.right = right;
-
-	return ec_command_no_resp(component, &param);
+	p.cmd = EC_CODEC_I2S_RX_SET_BCLK;
+	p.set_bclk_param.bclk = snd_soc_params_to_bclk(params);
+	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
 
-static int mic_gain_put(struct snd_kcontrol *kcontrol,
-			struct snd_ctl_elem_value *ucontrol)
+static int i2s_rx_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
-	struct snd_soc_component *component =
-		snd_soc_kcontrol_component(kcontrol);
-	struct cros_ec_codec_data *codec_data =
+	struct snd_soc_component *component = dai->component;
+	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
-	int left = ucontrol->value.integer.value[0];
-	int right = ucontrol->value.integer.value[1];
-	unsigned int max_dmic_gain = codec_data->max_dmic_gain;
+	struct ec_param_ec_codec_i2s_rx p;
+	enum ec_codec_i2s_rx_daifmt daifmt;
 
-	if (left > max_dmic_gain || right > max_dmic_gain)
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		break;
+	default:
 		return -EINVAL;
+	}
 
-	return set_ec_mic_gain(component, (u8)left, (u8)right);
-}
-
-static struct snd_kcontrol_new mic_gain_control =
-	SOC_DOUBLE_EXT_TLV("EC Mic Gain", SND_SOC_NOPM, SND_SOC_NOPM, 0, 0, 0,
-			   mic_gain_get, mic_gain_put, ec_mic_gain_tlv);
-
-static int enable_i2s(struct snd_soc_component *component, int enable)
-{
-	struct ec_param_codec_i2s param;
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	default:
+		return -EINVAL;
+	}
 
-	dev_dbg(component->dev, "%s set i2s to %u\n", __func__, enable);
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		daifmt = EC_CODEC_I2S_RX_DAIFMT_I2S;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		daifmt = EC_CODEC_I2S_RX_DAIFMT_RIGHT_J;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		daifmt = EC_CODEC_I2S_RX_DAIFMT_LEFT_J;
+		break;
+	default:
+		return -EINVAL;
+	}
 
-	param.cmd = EC_CODEC_I2S_ENABLE;
-	param.i2s_enable = enable;
+	dev_dbg(component->dev, "set format to %u\n", daifmt);
 
-	return ec_command_no_resp(component, &param);
+	p.cmd = EC_CODEC_I2S_RX_SET_DAIFMT;
+	p.set_daifmt_param.daifmt = daifmt;
+	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
 
-static int cros_ec_i2s_enable_event(struct snd_soc_dapm_widget *w,
-				    struct snd_kcontrol *kcontrol, int event)
+static const struct snd_soc_dai_ops i2s_rx_dai_ops = {
+	.hw_params = i2s_rx_hw_params,
+	.set_fmt = i2s_rx_set_fmt,
+};
+
+static int i2s_rx_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
+	struct cros_ec_codec_priv *priv =
+		snd_soc_component_get_drvdata(component);
+	struct ec_param_ec_codec_i2s_rx p;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		dev_dbg(component->dev,
-			"%s got SND_SOC_DAPM_PRE_PMU event\n", __func__);
-		return enable_i2s(component, 1);
-
+		dev_dbg(component->dev, "enable I2S RX\n");
+		p.cmd = EC_CODEC_I2S_RX_ENABLE;
+		break;
 	case SND_SOC_DAPM_PRE_PMD:
-		dev_dbg(component->dev,
-			"%s got SND_SOC_DAPM_PRE_PMD event\n", __func__);
-		return enable_i2s(component, 0);
+		dev_dbg(component->dev, "disable I2S RX\n");
+		p.cmd = EC_CODEC_I2S_RX_DISABLE;
+		break;
+	default:
+		return 0;
 	}
 
-	return 0;
+	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
+				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
 
-/*
- * The goal of this DAPM route is to turn on/off I2S using EC
- * host command when capture stream is started/stopped.
- */
-static const struct snd_soc_dapm_widget cros_ec_codec_dapm_widgets[] = {
+static struct snd_soc_dapm_widget i2s_rx_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("DMIC"),
-
-	/*
-	 * Control EC to enable/disable I2S.
-	 */
-	SND_SOC_DAPM_SUPPLY("I2S Enable", SND_SOC_NOPM,
-			    0, 0, cros_ec_i2s_enable_event,
+	SND_SOC_DAPM_SUPPLY("I2S RX Enable", SND_SOC_NOPM, 0, 0, i2s_rx_event,
 			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_AIF_OUT("I2S RX", "I2S Capture", 0, SND_SOC_NOPM, 0, 0),
+};
 
-	SND_SOC_DAPM_AIF_OUT("I2STX", "I2S Capture", 0, SND_SOC_NOPM, 0, 0),
+static struct snd_soc_dapm_route i2s_rx_dapm_routes[] = {
+	{"I2S RX", NULL, "DMIC"},
+	{"I2S RX", NULL, "I2S RX Enable"},
 };
 
-static const struct snd_soc_dapm_route cros_ec_codec_dapm_routes[] = {
-	{ "I2STX", NULL, "DMIC" },
-	{ "I2STX", NULL, "I2S Enable" },
+static struct snd_soc_dai_driver i2s_rx_dai_driver = {
+	.name = "EC Codec I2S RX",
+	.capture = {
+		.stream_name = "I2S Capture",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_48000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE |
+			SNDRV_PCM_FMTBIT_S24_LE,
+	},
+	.ops = &i2s_rx_dai_ops,
 };
 
-/*
- * Read maximum gain from device property and set it to mixer control.
- */
-static int cros_ec_set_gain_range(struct device *dev)
+static int i2s_rx_probe(struct snd_soc_component *component)
 {
+	struct cros_ec_codec_priv *priv =
+		snd_soc_component_get_drvdata(component);
+	struct device *dev = priv->dev;
+	int ret, val;
 	struct soc_mixer_control *control;
-	struct cros_ec_codec_data *codec_data = dev_get_drvdata(dev);
-	int rc;
 
-	rc = device_property_read_u32(dev, "max-dmic-gain",
-				      &codec_data->max_dmic_gain);
-	if (rc)
-		return rc;
+	ret = device_property_read_u32(dev, "max-dmic-gain", &val);
+	if (ret) {
+		dev_err(dev, "Failed to read 'max-dmic-gain'\n");
+		return ret;
+	}
 
 	control = (struct soc_mixer_control *)
-				mic_gain_control.private_value;
-	control->max = codec_data->max_dmic_gain;
-	control->platform_max = codec_data->max_dmic_gain;
+			dmic_controls[DMIC_CTL_GAIN].private_value;
+	control->max = val;
+	control->platform_max = val;
 
-	return 0;
-}
-
-static int cros_ec_codec_probe(struct snd_soc_component *component)
-{
-	int rc;
-
-	struct cros_ec_codec_data *codec_data =
-		snd_soc_component_get_drvdata(component);
-
-	rc = cros_ec_set_gain_range(codec_data->dev);
-	if (rc)
-		return rc;
-
-	return snd_soc_add_component_controls(component, &mic_gain_control, 1);
+	return snd_soc_add_component_controls(component,
+			&dmic_controls[DMIC_CTL_GAIN], 1);
 }
 
-static const struct snd_soc_component_driver cros_ec_component_driver = {
-	.probe			= cros_ec_codec_probe,
-	.dapm_widgets		= cros_ec_codec_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(cros_ec_codec_dapm_widgets),
-	.dapm_routes		= cros_ec_codec_dapm_routes,
-	.num_dapm_routes	= ARRAY_SIZE(cros_ec_codec_dapm_routes),
+static const struct snd_soc_component_driver i2s_rx_component_driver = {
+	.probe			= i2s_rx_probe,
+	.dapm_widgets		= i2s_rx_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(i2s_rx_dapm_widgets),
+	.dapm_routes		= i2s_rx_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(i2s_rx_dapm_routes),
 };
 
-/*
- * Platform device and platform driver fro cros-ec-codec.
- */
-static int cros_ec_codec_platform_probe(struct platform_device *pd)
+static int cros_ec_codec_platform_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pd->dev;
-	struct cros_ec_device *ec_device = dev_get_drvdata(pd->dev.parent);
-	struct cros_ec_codec_data *codec_data;
+	struct device *dev = &pdev->dev;
+	struct cros_ec_device *ec_device = dev_get_drvdata(pdev->dev.parent);
+	struct cros_ec_codec_priv *priv;
 
-	codec_data = devm_kzalloc(dev, sizeof(struct cros_ec_codec_data),
-				  GFP_KERNEL);
-	if (!codec_data)
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
 		return -ENOMEM;
 
-	codec_data->dev = dev;
-	codec_data->ec_device = ec_device;
+	priv->dev = dev;
+	priv->ec_device = ec_device;
 
-	platform_set_drvdata(pd, codec_data);
+	platform_set_drvdata(pdev, priv);
 
-	return devm_snd_soc_register_component(dev, &cros_ec_component_driver,
-					  cros_ec_dai, ARRAY_SIZE(cros_ec_dai));
+	return devm_snd_soc_register_component(dev, &i2s_rx_component_driver,
+					       &i2s_rx_dai_driver, 1);
 }
 
 #ifdef CONFIG_OF
@@ -427,7 +323,7 @@ MODULE_DEVICE_TABLE(of, cros_ec_codec_of_match);
 
 static struct platform_driver cros_ec_codec_platform_driver = {
 	.driver = {
-		.name = DRV_NAME,
+		.name = "cros-ec-codec",
 		.of_match_table = of_match_ptr(cros_ec_codec_of_match),
 	},
 	.probe = cros_ec_codec_platform_probe,
@@ -438,4 +334,4 @@ module_platform_driver(cros_ec_codec_platform_driver);
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("ChromeOS EC codec driver");
 MODULE_AUTHOR("Cheng-Yi Chiang <cychiang@chromium.org>");
-MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_ALIAS("platform:cros-ec-codec");
-- 
2.23.0.700.g56cf767bdb-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
