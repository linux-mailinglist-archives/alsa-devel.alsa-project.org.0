Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D390ECC8E4
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2019 10:58:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAEE6169C;
	Sat,  5 Oct 2019 10:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAEE6169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570265894;
	bh=fPhap3vXycbOM3zqMbUWKI+2R7Tmd6WHa4+XdiVbs5A=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t47HDdmFx8WEmTvMOEU6rvwTzAMVb4ibATJzLNkcTX6MYRYkaz/psrUNReYd/YO9g
	 IybGwXm0DPjHpPXOm2rRHv4QZA8l5tLQtW3R4dN05rPdWbijx1RW4DK39LqIPX6whm
	 w77X9Eq6HMX6j+Vgz/f/ldK7hmQs6MReRB+9+99M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0602CF805FE;
	Sat,  5 Oct 2019 10:55:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C645BF805FD; Sat,  5 Oct 2019 10:55:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24939F800D2
 for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2019 10:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24939F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="LDecR0is"
Received: by mail-qk1-x749.google.com with SMTP id h4so9050277qkd.18
 for <alsa-devel@alsa-project.org>; Sat, 05 Oct 2019 01:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=9/Lb2n2Dl1IjlTZEVCLmP5Zb0tuzyhiYP+9l5REQgPI=;
 b=LDecR0isx2OUdL56z0A0BGq1jSQ1Kz0TZ4UwR4x1WT/HTXysPkZzZyl5EWwMZE4tFh
 VpUSHYh8eSjWXhTFTzTBprM+PJR3rcbCnQsjwASheI750wVrggFxaZ3zjl/GniDSSGaP
 YyDNXY+a+ityElvZkE5KZPwHxmq4Ixj8tuz6Xxpss0JmA8kNBnzi/5fbNa+SJNkJKwlm
 j1wXi76Aii//e2c9C3ay2BeMtXU0iBtX7UI7mAxEKE1lmUqK5oN6M8cjV2+EmxdSM5AR
 C5Xo0jW6T188bFxKSJUWrwh1EMZKLnK3WOp9wibOKf49PgNMNwizvbo2Nt7FoOWqa9Tb
 ffGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=9/Lb2n2Dl1IjlTZEVCLmP5Zb0tuzyhiYP+9l5REQgPI=;
 b=mmzbDFqZgvrTLK7gdijbIKhOmMMi48UIVsIZ23MOoUonGWGS6U46RYmAFXV44lYD8y
 UleEvUhcDcLACRJUrD5mIUMoIbAUrliQ7WEFOGKQVhed1mvjgO31ibUKsiaC/eC1s/hF
 ngCb+3NE7LmzIfN9yj5TiB/mUpTEywUzQxRP13+ANQOrim97BkEv1F/d3Y8aAoZzs5G7
 DLN89RXIOkfgVr4F3PeCQ9lUZWHqehW/a5UotySXocu/psbVkvkcKxH6ax2fbqlVjnwN
 p+4YfVcw50FmK45+fNCaiix9DMYEtTf8+RWpjiwD+C1XsQMypI2Sb1uyord6u6LRRSoU
 1hmw==
X-Gm-Message-State: APjAAAUU9g2SwyVofoMkhY2J/AhLm6nyio8frAj36ygqdvJsPnSVLlHX
 xF7YFKUpq1/XOOuLKQGQdL+fUCtBbBME
X-Google-Smtp-Source: APXvYqwSBLsvA0gjon8I2MTNdl5n+i37RaW1Wp4F9yWGR8SrlJUbQquTzecv5aUDpcVFqhl9WmR5YwhLxLWy
X-Received: by 2002:ac8:7604:: with SMTP id t4mr20431817qtq.34.1570265738719; 
 Sat, 05 Oct 2019 01:55:38 -0700 (PDT)
Date: Sat,  5 Oct 2019 16:55:02 +0800
In-Reply-To: <20191005085509.187179-1-tzungbi@google.com>
Message-Id: <20191005164320.03.I93d9c65964f3c30f85a36d228e31150ff1917706@changeid>
Mime-Version: 1.0
References: <20191005085509.187179-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH v2 03/10] ASoC: cros_ec_codec: extract DMIC EC
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
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
