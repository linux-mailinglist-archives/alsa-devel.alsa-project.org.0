Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D8D840453
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 12:54:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3F35E67;
	Mon, 29 Jan 2024 12:54:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3F35E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706529292;
	bh=oh0sTMif6CnOQLiL5a5MmyT0hcKnwI/jjGqAII0YSDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h6OiaiOmkITZg9w0rtKQIdTmPLAtMuafXNIxFU2J/v3WutXQVxltwiRIWaFQsSmYQ
	 F/YamwLqlTLw+aR+/d/ylZbkR4tG69InoyM5Iw4UJcYvuxpvVs8F3KR5QfmDZofFfY
	 RpBRCFZdYkkm2+QekR39WYZdMinBq64o70lklA80=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81108F80578; Mon, 29 Jan 2024 12:53:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E177F80698;
	Mon, 29 Jan 2024 12:53:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4AD4F805F1; Mon, 29 Jan 2024 12:52:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84C15F8057D
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 12:52:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84C15F8057D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zHb6TweM
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55ee686b5d5so1449771a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Jan 2024 03:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706529155; x=1707133955;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRX88GpgU1fgsZxup3Gn93xc8N0Fj24AFUmctHwLfn4=;
        b=zHb6TweMekYu8DPXa4wZWqCGwRKcGwKzLdL6rleuR12tKYcf4Y09U2+UmdjFKOjaS7
         XA1jxFfltWU+0/U1k77VanqsA3fhHyjOpvTefMBEfW9l91P5cpVsRcEZmD3KiYiahzTW
         6Ajxy6HPDbfFWEJk3JyT7SaAUmNvlnbpPn/5eD9LWdkdN5uRd0qbPl6u084gW39G7pNP
         QzfwZ7ryxbI2EO2WNI4DwX6UH+v0XRdRk9eFFxFRBSH5o4vtxV2LeYOxikDGuy8S48A0
         Hr/R4Jrrod6ygUPBsf7D0elG5GdnSv416ItqkB+hQl2MlJUA+Eco4YYeHeQDTKJsGsFW
         24Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706529155; x=1707133955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRX88GpgU1fgsZxup3Gn93xc8N0Fj24AFUmctHwLfn4=;
        b=TqaoKh5V1397xmeb2XaJUcaVJz3KIMjXIpaT7RtluqHzAkE8Nzey7TnAxhoKlkdHz1
         4Y4oWsP4XjmXrpyR636XMgFSg7SimG2UjNL6NKiiVuPq13EvirHDKTsFCOJtLRLhJcK1
         NKYLx39xv1i72AzZOnYcGQQLF844BWB96EPXa5Pixm9q5P8Q8g0kto162E5r9RwGqO4g
         f1mXX5FER6beSsroMP+TiGN/2QtiNJ2JNzSCYdQ4RtvHJF96Os/4FxjszCLJK/GuTZRI
         i4oTTlgY5nopvs7Lhy2uYuMzVGhvNgwZ2U/7cZqNyXWMreuiNciECKEqqjX6StJVqKAy
         95qA==
X-Gm-Message-State: AOJu0Yw/pjjmlx9F1/5rwr9ZWXxyYabxxc2cmjvFUlwb72OO/TghkUiw
	W6IvDuE7R0Vxg3VO0yz3sB4OPddAgc44ZCMNkRmcay0xAgfhNMz9DWdJsFHFLeQ=
X-Google-Smtp-Source: 
 AGHT+IEdaNoU/u2ZWAjjwYyfTwmF1ZYX/t6iKURfjubU1MuWVDghYTbMVUM9h4+w4ZCmDBHTCFQd+A==
X-Received: by 2002:aa7:d695:0:b0:55f:72f:5caf with SMTP id
 d21-20020aa7d695000000b0055f072f5cafmr1120034edr.11.1706529154944;
        Mon, 29 Jan 2024 03:52:34 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id
 ec19-20020a0564020d5300b0055f29ececeasm19907edb.57.2024.01.29.03.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:52:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v6 6/6] ASoC: codecs: wsa884x: Allow sharing reset GPIO
Date: Mon, 29 Jan 2024 12:52:16 +0100
Message-Id: <20240129115216.96479-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QN63QCU2HORKBQWM7FO5TWZD6ZCAHULO
X-Message-ID-Hash: QN63QCU2HORKBQWM7FO5TWZD6ZCAHULO
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QN63QCU2HORKBQWM7FO5TWZD6ZCAHULO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On some boards with multiple WSA8840/WSA8845 speakers, the reset
(shutdown) GPIO is shared between two speakers.  Use the reset
controller framework and its "reset-gpio" driver to handle this case.
This allows bring-up and proper handling of all WSA884x speakers on
X1E80100-CRD board.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

If previous patches are fine, then this commit is independent and could
be taken via ASoC.
---
 sound/soc/codecs/wsa884x.c | 53 +++++++++++++++++++++++++++++++-------
 1 file changed, 43 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index f2653df84e4a..a9767ef0e39d 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -13,6 +13,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
@@ -699,6 +700,7 @@ struct wsa884x_priv {
 	struct sdw_stream_runtime *sruntime;
 	struct sdw_port_config port_config[WSA884X_MAX_SWR_PORTS];
 	struct gpio_desc *sd_n;
+	struct reset_control *sd_reset;
 	bool port_prepared[WSA884X_MAX_SWR_PORTS];
 	bool port_enable[WSA884X_MAX_SWR_PORTS];
 	unsigned int variant;
@@ -1799,9 +1801,22 @@ static struct snd_soc_dai_driver wsa884x_dais[] = {
 	},
 };
 
-static void wsa884x_gpio_powerdown(void *data)
+static void wsa884x_reset_powerdown(void *data)
 {
-	gpiod_direction_output(data, 1);
+	struct wsa884x_priv *wsa884x = data;
+
+	if (wsa884x->sd_reset)
+		reset_control_assert(wsa884x->sd_reset);
+	else
+		gpiod_direction_output(wsa884x->sd_n, 1);
+}
+
+static void wsa884x_reset_deassert(struct wsa884x_priv *wsa884x)
+{
+	if (wsa884x->sd_reset)
+		reset_control_deassert(wsa884x->sd_reset);
+	else
+		gpiod_direction_output(wsa884x->sd_n, 0);
 }
 
 static void wsa884x_regulator_disable(void *data)
@@ -1809,6 +1824,27 @@ static void wsa884x_regulator_disable(void *data)
 	regulator_bulk_disable(WSA884X_SUPPLIES_NUM, data);
 }
 
+static int wsa884x_get_reset(struct device *dev, struct wsa884x_priv *wsa884x)
+{
+	wsa884x->sd_reset = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(wsa884x->sd_reset))
+		return dev_err_probe(dev, PTR_ERR(wsa884x->sd_reset),
+				     "Failed to get reset\n");
+	else if (wsa884x->sd_reset)
+		return 0;
+	/*
+	 * else: NULL, so use the backwards compatible way for powerdown-gpios,
+	 * which does not handle sharing GPIO properly.
+	 */
+	wsa884x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(wsa884x->sd_n))
+		return dev_err_probe(dev, PTR_ERR(wsa884x->sd_n),
+				     "Shutdown Control GPIO not found\n");
+
+	return 0;
+}
+
 static int wsa884x_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
@@ -1838,11 +1874,9 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	if (ret)
 		return ret;
 
-	wsa884x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_OUT_HIGH);
-	if (IS_ERR(wsa884x->sd_n))
-		return dev_err_probe(dev, PTR_ERR(wsa884x->sd_n),
-				     "Shutdown Control GPIO not found\n");
+	ret = wsa884x_get_reset(dev, wsa884x);
+	if (ret)
+		return ret;
 
 	dev_set_drvdata(dev, wsa884x);
 	wsa884x->slave = pdev;
@@ -1858,9 +1892,8 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 
-	/* Bring out of reset */
-	gpiod_direction_output(wsa884x->sd_n, 0);
-	ret = devm_add_action_or_reset(dev, wsa884x_gpio_powerdown, wsa884x->sd_n);
+	wsa884x_reset_deassert(wsa884x);
+	ret = devm_add_action_or_reset(dev, wsa884x_reset_powerdown, wsa884x);
 	if (ret)
 		return ret;
 
-- 
2.34.1

