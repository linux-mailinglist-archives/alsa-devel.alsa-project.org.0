Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD21338A3
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:56:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F14F116CA;
	Mon,  3 Jun 2019 20:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F14F116CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559588188;
	bh=t5Jeveue3Eqz8BY/zACLv4NiGDr9CBb5rEGQkRrsiDA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PPsE1QN4t+9ui95Zm79iBm0mmh9Z2L4LSUGpOwP1Bnr0TpGLiGmwmjMO7B253PrEI
	 XWl9dvjRKb2+1UXm/cang9JGbqvkoXNskTR/u8mlU8XAmoLHOTbrmaI06degzSd20J
	 TGdK77g5diXfGyt5o1CN19BurlBhhYP50dQh+dYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E549CF897E9;
	Mon,  3 Jun 2019 20:35:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55924F897AB; Mon,  3 Jun 2019 20:34:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3D66F897A4
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:34:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3D66F897A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="hZJjb2cj"
Received: by mail-pl1-x643.google.com with SMTP id i2so2966651plt.1
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 11:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f7iJhfSxbvGyPbdfrmcAg8sSv8WMS29kN5cUgY35bNE=;
 b=hZJjb2cjBN8UboJnQL/09SGjONAOq1PWgb3KWui9VazwtHPQ4+NS56/5G51CM3jh1X
 1eH2Fo63O6qfWxnI8vOCjxQhhBwM7306sKNN8GaFW+EP1836t0OhyY5B08n5rPgSszdR
 zqJJDmZmK9AmvR0G4yo7dj9pifJ+0NkL9nuBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f7iJhfSxbvGyPbdfrmcAg8sSv8WMS29kN5cUgY35bNE=;
 b=gzgoGq0elWfse4kXhM6g0IwLMkX/CaSFedlpnscbpZr7uVANUZUrFlPA/DXHiiKMRu
 Z5Ufcx4ukprArv9D3eqiIiCN/s0FfTobYbqYwtxx9aiULCg27BOtMv5XFpTxJBktmDrj
 4gy/GhWRfwQffnfnyBFtBHY7ZbE0ljmGzzngQHLN+iMW8vM7kxl1UfHBokMn2uqLf5Hs
 wbakwkEph2h7X4gJ70Sy97zUfxFhQkkT3m5MXcK0L+02chdRx4YM+6qLfQ1XRqIfgYe8
 4kVlZm3J+DEMYJnQ3H1vZo4SpUKcPLuPxqpO15sZEg3eKKkFs/H0sICejjn/KQYFnID3
 5erQ==
X-Gm-Message-State: APjAAAUnU+Ix7Qjnmjw3ATkTGGWGAmePL8jYPxRM3tMbha5cmtYgASjD
 zrKNmQRlLYb/nW01aq9Zo/BtGQ==
X-Google-Smtp-Source: APXvYqx8jFEMmF7hlpd037c6zysXKhYr/YrSXZJeqz6j71siPIMBbQ25Ain08xLw9CPbQpOffhY7LA==
X-Received: by 2002:a17:902:4481:: with SMTP id
 l1mr32255226pld.121.1559586893829; 
 Mon, 03 Jun 2019 11:34:53 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id s24sm2930237pfh.133.2019.06.03.11.34.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 11:34:53 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com, fabien.lahoudere@collabora.com
Date: Mon,  3 Jun 2019 11:34:01 -0700
Message-Id: <20190603183401.151408-31-gwendal@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190603183401.151408-1-gwendal@chromium.org>
References: <20190603183401.151408-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RESEND PATCH v3 30/30] mfd: cros_ec: Update I2S API
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

Improve I2S API.
Rename ec_response_codec_gain into ec_codec_i2s_gain,
update caller accordlingly.

Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
Signed-off-by: Gwendal Grignou <gwendal@chromium.org>
---
 include/linux/mfd/cros_ec_commands.h | 44 +++++++++++++---------------
 sound/soc/codecs/cros_ec_codec.c     |  8 ++---
 2 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index fc8babce1576..fa397722f17e 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -4471,6 +4471,7 @@ enum mkbp_cec_event {
 /* Commands for I2S recording on audio codec. */
 
 #define EC_CMD_CODEC_I2S 0x00BC
+#define EC_WOV_I2S_SAMPLE_RATE 48000
 
 enum ec_codec_i2s_subcmd {
 	EC_CODEC_SET_SAMPLE_DEPTH = 0x0,
@@ -4480,6 +4481,7 @@ enum ec_codec_i2s_subcmd {
 	EC_CODEC_I2S_SET_CONFIG = 0x4,
 	EC_CODEC_I2S_SET_TDM_CONFIG = 0x5,
 	EC_CODEC_I2S_SET_BCLK = 0x6,
+	EC_CODEC_I2S_SUBCMD_COUNT = 0x7,
 };
 
 enum ec_sample_depth_value {
@@ -4496,6 +4498,21 @@ enum ec_i2s_config {
 	EC_DAI_FMT_PCM_TDM = 5,
 };
 
+/*
+ * For subcommand EC_CODEC_GET_GAIN.
+ */
+struct __ec_align1 ec_codec_i2s_gain {
+	uint8_t left;
+	uint8_t right;
+};
+
+struct __ec_todo_unpacked ec_param_codec_i2s_tdm {
+	int16_t ch0_delay; /* 0 to 496 */
+	int16_t ch1_delay; /* -1 to 496 */
+	uint8_t adjacent_to_ch0;
+	uint8_t adjacent_to_ch1;
+};
+
 struct __ec_todo_packed ec_param_codec_i2s {
 	/* enum ec_codec_i2s_subcmd */
 	uint8_t cmd;
@@ -4510,10 +4527,7 @@ struct __ec_todo_packed ec_param_codec_i2s {
 		 * EC_CODEC_SET_GAIN
 		 * Value should be 0~43 for both channels.
 		 */
-		struct __ec_align1 ec_param_codec_i2s_set_gain {
-			uint8_t left;
-			uint8_t right;
-		} gain;
+		struct ec_codec_i2s_gain gain;
 
 		/*
 		 * EC_CODEC_I2S_ENABLE
@@ -4522,7 +4536,7 @@ struct __ec_todo_packed ec_param_codec_i2s {
 		uint8_t i2s_enable;
 
 		/*
-		 * EC_CODEC_I2S_SET_COFNIG
+		 * EC_CODEC_I2S_SET_CONFIG
 		 * Value should be one of ec_i2s_config.
 		 */
 		uint8_t i2s_config;
@@ -4531,18 +4545,7 @@ struct __ec_todo_packed ec_param_codec_i2s {
 		 * EC_CODEC_I2S_SET_TDM_CONFIG
 		 * Value should be one of ec_i2s_config.
 		 */
-		struct __ec_todo_unpacked ec_param_codec_i2s_tdm {
-			/*
-			 * 0 to 496
-			 */
-			int16_t ch0_delay;
-			/*
-			 * -1 to 496
-			 */
-			int16_t ch1_delay;
-			uint8_t adjacent_to_ch0;
-			uint8_t adjacent_to_ch1;
-		} tdm_param;
+		struct ec_param_codec_i2s_tdm tdm_param;
 
 		/*
 		 * EC_CODEC_I2S_SET_BCLK
@@ -4551,13 +4554,6 @@ struct __ec_todo_packed ec_param_codec_i2s {
 	};
 };
 
-/*
- * For subcommand EC_CODEC_GET_GAIN.
- */
-struct ec_response_codec_gain {
-	uint8_t left;
-	uint8_t right;
-} __ec_align1;
 
 /*****************************************************************************/
 /* System commands */
diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index 99a3af8a15ff..87830ed5ebf4 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -38,21 +38,21 @@ static const DECLARE_TLV_DB_SCALE(ec_mic_gain_tlv, 0, 100, 0);
 
 static int ec_command_get_gain(struct snd_soc_component *component,
 			       struct ec_param_codec_i2s *param,
-			       struct ec_response_codec_gain *resp)
+			       struct ec_codec_i2s_gain *resp)
 {
 	struct cros_ec_codec_data *codec_data =
 		snd_soc_component_get_drvdata(component);
 	struct cros_ec_device *ec_device = codec_data->ec_device;
 	u8 buffer[sizeof(struct cros_ec_command) +
 		  max(sizeof(struct ec_param_codec_i2s),
-		      sizeof(struct ec_response_codec_gain))];
+		      sizeof(struct ec_codec_i2s_gain))];
 	struct cros_ec_command *msg = (struct cros_ec_command *)&buffer;
 	int ret;
 
 	msg->version = 0;
 	msg->command = EC_CMD_CODEC_I2S;
 	msg->outsize = sizeof(struct ec_param_codec_i2s);
-	msg->insize = sizeof(struct ec_response_codec_gain);
+	msg->insize = sizeof(struct ec_codec_i2s_gain);
 
 	memcpy(msg->data, param, msg->outsize);
 
@@ -226,7 +226,7 @@ static int get_ec_mic_gain(struct snd_soc_component *component,
 			   u8 *left, u8 *right)
 {
 	struct ec_param_codec_i2s param;
-	struct ec_response_codec_gain resp;
+	struct ec_codec_i2s_gain resp;
 	int ret;
 
 	param.cmd = EC_CODEC_GET_GAIN;
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
