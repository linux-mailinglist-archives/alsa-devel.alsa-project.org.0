Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A669ECC84B
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2019 08:03:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 285961685;
	Sat,  5 Oct 2019 08:02:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 285961685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570255429;
	bh=kichENndD22cxYVD2n/LWXM5lb7z5VmL4wprYlDu7Uw=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kMc+lGeAnM4KLinDeeELWEKFteKTxFLJBAfOXyPwOsUIL03daSJ3tIs6LnimX1SeP
	 mzW4HTm5x/EzmnvhpZ3/lZ3LRdV2p9oqtL/dDMff36eRSPyq3QVb0KT6ULcmnWHOLn
	 ynXoAhyy9wgA65yC+P+HMDsTNTmEO1X0evCar0lM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B6FAF80649;
	Sat,  5 Oct 2019 07:59:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5466BF8063D; Sat,  5 Oct 2019 07:59:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 663BEF8063B
 for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2019 07:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 663BEF8063B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="gFtgMnq8"
Received: by mail-qk1-x74a.google.com with SMTP id v143so8720791qka.21
 for <alsa-devel@alsa-project.org>; Fri, 04 Oct 2019 22:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=HU4cbOuoYFqXlnJcy/p07LmBMaxvgrbFUK/zvntKxPw=;
 b=gFtgMnq80CRltdZD2CtDjfFW9fMAbPsJ6Z6QbQC2WlafGF+ynGDGhWpB5ni5F1N+/n
 55UQcqwE1AUa1ssuqGP1HE6MaaCd/sAQ39iz8V5ZG2iEtS6rkTWVTTqB1eYzb/gbHroj
 6QMGpczoTv+fgvnvGPTT1E41AdH1FKliYhX4JV2o+lSq/B4HNc9quZLrKvZGTxd0wmlU
 qQQKESBNoAxwzF/fmhfj2cbKTNek0hyP4L2QLiAdOxKZMSLxWeOu8Nix5Q5S9qe49B9U
 ZdUEtXi8r4bRVWRp/m3BW+eI5LELMKl7Myl8zPXN/xO+++djQcq7b0tv3uSi+MInBr2Y
 kO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=HU4cbOuoYFqXlnJcy/p07LmBMaxvgrbFUK/zvntKxPw=;
 b=fj5znQ7shxeuJ21vsXLS5uoSlLwgY/48P+bXWSApKjWG2P3HgzsF5/euc3OE53KNUX
 +VnIfTFRSwxfJS2zj+hGZ0Hqv6MvsvvhoBvJJftydNfGTnQO8peWDBZcU5G3roxu0w+h
 ObhTir4rTK4sv3gQTrtjFm7aBbF/VQD1JCuqe47cMRiuyqUI+A1JGGigTii/w+irpUZv
 jJ9gzyQCLAlG2daUrK74LANEA9+Z9BdpDKmpB/onoCKflHU7teKglx3yUc/ptdGdg8gp
 WimNNVwvLUwmcJfSLJC3jX1HDaJihiZnp6f1br9qgGWoKgiWe7Rdb/jydN7tVe40yg47
 uDew==
X-Gm-Message-State: APjAAAX9vXG1B+JCeqFcD6rwhadOBbIN7nK8uuujnc48A3qF+mmygS6h
 v4Rsrl5b3dWAwlSkKZJuyb2V9wh9fT2B
X-Google-Smtp-Source: APXvYqznoY2dXLLJ5jKS927F0PwtjR49ho8ZSS218g4wjclzdI0dpLKMD+GFs6AheYXzq4t30F31HUuOQbKY
X-Received: by 2002:a0c:f68f:: with SMTP id p15mr17620024qvn.31.1570255137813; 
 Fri, 04 Oct 2019 22:58:57 -0700 (PDT)
Date: Sat,  5 Oct 2019 13:58:03 +0800
In-Reply-To: <20191005055808.249089-1-tzungbi@google.com>
Message-Id: <20191005130552.5.Id4657c864d544634f2b5c1c9b34fa8232ecba44d@changeid>
Mime-Version: 1.0
References: <20191005055808.249089-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH 05/10] ASoC: cros_ec_codec: read max DMIC gain
	from EC codec
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

Read max DMIC gain from EC codec instead of DTS.  Also removes the
dt-binding of max-dmic-gain.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/google,cros-ec-codec.txt   |  4 +-
 .../linux/platform_data/cros_ec_commands.h    | 43 +++++++++++----
 sound/soc/codecs/cros_ec_codec.c              | 53 ++++++++++++++-----
 3 files changed, 73 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
index 1084f7f22eea..0ce9fafc78e2 100644
--- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
+++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
@@ -1,4 +1,4 @@
-* Audio codec controlled by ChromeOS EC
+Audio codec controlled by ChromeOS EC
 
 Google's ChromeOS EC codec is a digital mic codec provided by the
 Embedded Controller (EC) and is controlled via a host-command interface.
@@ -9,7 +9,6 @@ Documentation/devicetree/bindings/mfd/cros-ec.txt).
 Required properties:
 - compatible: Must contain "google,cros-ec-codec"
 - #sound-dai-cells: Should be 1. The cell specifies number of DAIs.
-- max-dmic-gain: A number for maximum gain in dB on digital microphone.
 
 Example:
 
@@ -21,6 +20,5 @@ cros-ec@0 {
 	cros_ec_codec: ec-codec {
 		compatible = "google,cros-ec-codec";
 		#sound-dai-cells = <1>;
-		max-dmic-gain = <43>;
 	};
 };
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 3ca0fa9e92a7..21db0d4d4025 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -4530,30 +4530,53 @@ struct __ec_align4 ec_response_ec_codec_get_shm_addr {
 #define EC_CMD_EC_CODEC_DMIC 0x00BD
 
 enum ec_codec_dmic_subcmd {
-	EC_CODEC_DMIC_SET_GAIN = 0x0,
-	EC_CODEC_DMIC_GET_GAIN = 0x1,
+	EC_CODEC_DMIC_GET_MAX_GAIN = 0x0,
+	EC_CODEC_DMIC_SET_GAIN_IDX = 0x1,
+	EC_CODEC_DMIC_GET_GAIN_IDX = 0x2,
 	EC_CODEC_DMIC_SUBCMD_COUNT,
 };
 
-struct __ec_align1 ec_param_ec_codec_dmic_set_gain {
-	uint8_t left;
-	uint8_t right;
+enum ec_codec_dmic_channel {
+	EC_CODEC_DMIC_CHANNEL_0 = 0x0,
+	EC_CODEC_DMIC_CHANNEL_1 = 0x1,
+	EC_CODEC_DMIC_CHANNEL_2 = 0x2,
+	EC_CODEC_DMIC_CHANNEL_3 = 0x3,
+	EC_CODEC_DMIC_CHANNEL_4 = 0x4,
+	EC_CODEC_DMIC_CHANNEL_5 = 0x5,
+	EC_CODEC_DMIC_CHANNEL_6 = 0x6,
+	EC_CODEC_DMIC_CHANNEL_7 = 0x7,
+	EC_CODEC_DMIC_CHANNEL_COUNT,
+};
+
+struct __ec_align1 ec_param_ec_codec_dmic_set_gain_idx {
+	uint8_t channel; /* enum ec_codec_dmic_channel */
+	uint8_t gain;
 	uint8_t reserved[2];
 };
 
+struct __ec_align1 ec_param_ec_codec_dmic_get_gain_idx {
+	uint8_t channel; /* enum ec_codec_dmic_channel */
+	uint8_t reserved[3];
+};
+
 struct __ec_align4 ec_param_ec_codec_dmic {
 	uint8_t cmd; /* enum ec_codec_dmic_subcmd */
 	uint8_t reserved[3];
 
 	union {
-		struct ec_param_ec_codec_dmic_set_gain
-				set_gain_param;
+		struct ec_param_ec_codec_dmic_set_gain_idx
+				set_gain_idx_param;
+		struct ec_param_ec_codec_dmic_get_gain_idx
+				get_gain_idx_param;
 	};
 };
 
-struct __ec_align1 ec_response_ec_codec_dmic_get_gain {
-	uint8_t left;
-	uint8_t right;
+struct __ec_align1 ec_response_ec_codec_dmic_get_max_gain {
+	uint8_t max_gain;
+};
+
+struct __ec_align1 ec_response_ec_codec_dmic_get_gain_idx {
+	uint8_t gain;
 };
 
 /*****************************************************************************/
diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_codec.c
index c19c7fe42e2e..3d4f9e82d6e9 100644
--- a/sound/soc/codecs/cros_ec_codec.c
+++ b/sound/soc/codecs/cros_ec_codec.c
@@ -65,18 +65,26 @@ static int dmic_get_gain(struct snd_kcontrol *kcontrol,
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 	struct ec_param_ec_codec_dmic p;
-	struct ec_response_ec_codec_dmic_get_gain r;
+	struct ec_response_ec_codec_dmic_get_gain_idx r;
 	int ret;
 
-	p.cmd = EC_CODEC_DMIC_GET_GAIN;
+	p.cmd = EC_CODEC_DMIC_GET_GAIN_IDX;
+	p.get_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_0;
 	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
 				   (uint8_t *)&p, sizeof(p),
 				   (uint8_t *)&r, sizeof(r));
 	if (ret < 0)
 		return ret;
+	ucontrol->value.integer.value[0] = r.gain;
 
-	ucontrol->value.integer.value[0] = r.left;
-	ucontrol->value.integer.value[1] = r.right;
+	p.cmd = EC_CODEC_DMIC_GET_GAIN_IDX;
+	p.get_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_1;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
+				   (uint8_t *)&p, sizeof(p),
+				   (uint8_t *)&r, sizeof(r));
+	if (ret < 0)
+		return ret;
+	ucontrol->value.integer.value[1] = r.gain;
 
 	return 0;
 }
@@ -94,15 +102,24 @@ static int dmic_put_gain(struct snd_kcontrol *kcontrol,
 	int left = ucontrol->value.integer.value[0];
 	int right = ucontrol->value.integer.value[1];
 	struct ec_param_ec_codec_dmic p;
+	int ret;
 
 	if (left > max_dmic_gain || right > max_dmic_gain)
 		return -EINVAL;
 
 	dev_dbg(component->dev, "set mic gain to %u, %u\n", left, right);
 
-	p.cmd = EC_CODEC_DMIC_SET_GAIN;
-	p.set_gain_param.left = left;
-	p.set_gain_param.right = right;
+	p.cmd = EC_CODEC_DMIC_SET_GAIN_IDX;
+	p.set_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_0;
+	p.set_gain_idx_param.gain = left;
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
+				   (uint8_t *)&p, sizeof(p), NULL, 0);
+	if (ret < 0)
+		return ret;
+
+	p.cmd = EC_CODEC_DMIC_SET_GAIN_IDX;
+	p.set_gain_idx_param.channel = EC_CODEC_DMIC_CHANNEL_1;
+	p.set_gain_idx_param.gain = right;
 	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
 				    (uint8_t *)&p, sizeof(p), NULL, 0);
 }
@@ -125,19 +142,27 @@ static int dmic_probe(struct snd_soc_component *component)
 	struct cros_ec_codec_priv *priv =
 		snd_soc_component_get_drvdata(component);
 	struct device *dev = priv->dev;
-	int ret, val;
 	struct soc_mixer_control *control;
+	struct ec_param_ec_codec_dmic p;
+	struct ec_response_ec_codec_dmic_get_max_gain r;
+	int ret;
 
-	ret = device_property_read_u32(dev, "max-dmic-gain", &val);
-	if (ret) {
-		dev_err(dev, "Failed to read 'max-dmic-gain'\n");
-		return ret;
+	p.cmd = EC_CODEC_DMIC_GET_MAX_GAIN;
+
+	ret = send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
+				   (uint8_t *)&p, sizeof(p),
+				   (uint8_t *)&r, sizeof(r));
+	if (ret < 0) {
+		dev_warn(dev, "get_max_gain() unsupported\n");
+		return 0;
 	}
 
+	dev_dbg(dev, "max gain = %d\n", r.max_gain);
+
 	control = (struct soc_mixer_control *)
 		dmic_controls[DMIC_CTL_GAIN].private_value;
-	control->max = val;
-	control->platform_max = val;
+	control->max = r.max_gain;
+	control->platform_max = r.max_gain;
 
 	return snd_soc_add_component_controls(component,
 			&dmic_controls[DMIC_CTL_GAIN], 1);
-- 
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
