Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA719194B6
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2019 23:36:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E8AB1B05;
	Thu,  9 May 2019 23:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E8AB1B05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557437799;
	bh=TTZYgvNlnvrM7WYsMxgKrJZdWymDE5ASALDkDWCw2Bk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GP3R48jbXxTLWn7JSCxnrM6n0urywTs6uix+aTUvXMq4omR/JEHOKwSZdkfzrb7PD
	 MGc3tNg+jSdfee3BOLkNJpVqAq6fYnhVwf5KlOyMq1rLW87gtXyWPNfPhMoPxY+vFJ
	 Bqb9QccTA3GG5HIGzUGYGE9NCj2fBdorBPJ0SyK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 347A1F897E7;
	Thu,  9 May 2019 23:15:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 008BAF8979A; Thu,  9 May 2019 23:14:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68A5CF89794
 for <alsa-devel@alsa-project.org>; Thu,  9 May 2019 23:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68A5CF89794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="lO/MV8RW"
Received: by mail-pf1-x441.google.com with SMTP id g3so1960922pfi.4
 for <alsa-devel@alsa-project.org>; Thu, 09 May 2019 14:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GGJmd8+CUN5AU8povUlqCRF8sEgALrbJV2+1l3/0axc=;
 b=lO/MV8RWLUMPBwOg5enIuubQQ+DgGU8w9sO5c5ETVv0uZajAQfTeIaRyHZYXVzoK2B
 1l1Js9K7MlKmhpQyq13ejAfdEkejjW1Of3x1dA2FXnxGfeAJf8kxCky7vIdJ+4tsiOW8
 eLIQj94/xG0s2ID/Wb9fWd9l6VYY/Is/Rm6d4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GGJmd8+CUN5AU8povUlqCRF8sEgALrbJV2+1l3/0axc=;
 b=HgX8R6dU1OMgfW7xLtvv1xk4x8c4dW2arg9osjh6z1xE7Cea9AILfkadZ1pqBLrOLR
 Z8x3jtuhSLwqT5lHKD8XzJOUNrftzkw5bOfj4bQZpr86RsdgLTc/Viu+9HfeulYKRz0b
 EadPqLhIoenOrAvKr9OXvj6L3nb7GlhhoeZl797M8m6QA68uDDFJjADMlwM8Cv1xp94d
 kFYyypGrpxPnFRIYEaAF8pDhRU7irzgUi5V6v8b6KSijDmDCkPtXiExbAJtqWtHD1NCz
 L2s5qNrEph5QhMOaGGYeV+DY8x1R7Vij7AZ9GHtqYacav8SDfpMPDYrkr3kMBmgMkoSW
 EtoQ==
X-Gm-Message-State: APjAAAV0fnYfzk63CTPgds+JsBpBCi76UgirU6bNAROyh5lUno6O7kPv
 KuL2q4rWJ2czwqAj3IDy7eEqHQ==
X-Google-Smtp-Source: APXvYqzLrNMK2JURmUrLJra1QcL7FMkTFa4UqWF/9oUCQF3iQIV5tSvaMMYGZ6qiW5/8VHUSNFvSoQ==
X-Received: by 2002:a63:9214:: with SMTP id o20mr8629485pgd.203.1557436489005; 
 Thu, 09 May 2019 14:14:49 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:3c8f:512b:3522:dfaf])
 by smtp.gmail.com with ESMTPSA id h27sm5632993pfd.53.2019.05.09.14.14.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 14:14:48 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
To: enric.balletbo@collabora.com, bleung@chromium.org, groeck@chromium.org,
 lee.jones@linaro.org, jic23@kernel.org, broonie@kernel.org,
 cychiang@chromium.org, tiwai@suse.com
Date: Thu,  9 May 2019 14:13:53 -0700
Message-Id: <20190509211353.213194-31-gwendal@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190509211353.213194-1-gwendal@chromium.org>
References: <20190509211353.213194-1-gwendal@chromium.org>
MIME-Version: 1.0
Cc: linux-iio@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 30/30] mfd: cros_ec: Update I2S API
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
