Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2379F4C4D54
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 19:08:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE9CE1EF7;
	Fri, 25 Feb 2022 19:07:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE9CE1EF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645812501;
	bh=Wo/zHZ3JjFyq3FJG0I2HPdxddMxrYnP3rLZWGHjhRxc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YNggAg/qsipeS/o428qlF0JNwmd9Nx5IHx9v0sFebxkO0Nl1Ai6oZryzh8JyPVyUG
	 kLXn0a/x0RbUEHhVPczK8puqKDhQvC7tUAunXTVzcdLY3G+3H8oj2SZexlo7c2i+R1
	 zMzaFd2h4MEHke0El+H0mwLno1hpKN+mFXG2t95I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B31FF8020D;
	Fri, 25 Feb 2022 19:07:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48793F80271; Fri, 25 Feb 2022 19:07:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 970C4F80118
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 19:07:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 970C4F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rbitAh5A"
Received: by mail-wr1-x42f.google.com with SMTP id j17so5774522wrc.0
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 10:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3494fabfX+g/TnvTx8UrlMiKRNc/OZTSYfQjqznBH5Q=;
 b=rbitAh5AMmHgf5CrW8Gtn4dCqx1Qx5svPwApsEKod3HnITDN7ArPkxlRqHmJXXFC8y
 6SYaHJ0kgFkCD8iek8fk6w9s0imY6/DOlKIvPa0V/HkBCCQofSRkwH3FZW8nGFib/FqL
 fPmn5tuPAHzKrn7Ps+xkNhh1imezyPHpswFdsQ710P//kdH0I3M0bQB8sQoCaNVw9OMa
 Y66et6ZmtuisAgQO4Vv5pJzAnoEJh4HK5aYhlHkTWkvx1iNwZVpVx8WKnCFcPCSxdCkf
 NNlbtmCcKwGjBYsZ+qMnSGJVz3ZL53PPSZVdWCeGH1dS4XoG/4NN5LvYTZK2KpG1UqAQ
 CvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3494fabfX+g/TnvTx8UrlMiKRNc/OZTSYfQjqznBH5Q=;
 b=NQbBQ6GgYn9r/CAahZtaE3kee+PyMq9wgQoGNUhWTl5QI9ShaSIGag5okaKWxV7vCT
 v1wwYLHSNsrkwHe8pNnU0dOf+aPAY8m2HeLFSo0kKzpcd/+8EFzkeCJ0bsoDeEXZglJT
 4kehEp7dZ7OyVk4OpI10wpgJgSyROgNlV1zGo8HQj4f+Ea/vwEtiOX3LZr44ylzl07rY
 UMymX9u3RvvkWVxD7wjCZ2l7PNuUrODU+3GdXiCxNVtwlZjD2sZ0Zw2USaylIg1RP7fh
 AQ1CvYe1Z3WswxKSMP4sFFC2exzH2DIJxBuRhxnjv8KluiPQlv/zXLaogNjotugZ7qQo
 wKBw==
X-Gm-Message-State: AOAM530ipYFKeFF6H/0jWYkRtufn4v97BXVBDmbYVPECJz6yVT6WXLW6
 uYVpncmBvVJzqU7KHHLyUllSxA==
X-Google-Smtp-Source: ABdhPJxp+5JOa+KdOagd/fb8D8X0qcKGrEhy+KpOnZ5wtgjkuCNMXCg2l1AOZWTTBPN2hkXgkCkThg==
X-Received: by 2002:a05:6000:1788:b0:1e9:e6d5:9e18 with SMTP id
 e8-20020a056000178800b001e9e6d59e18mr6866379wrg.356.1645812439959; 
 Fri, 25 Feb 2022 10:07:19 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 k7-20020adfb347000000b001e595adb6d9sm2986576wrd.79.2022.02.25.10.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 10:07:19 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3] ASoC: codecs: wsa881x: add runtime pm support
Date: Fri, 25 Feb 2022 18:07:16 +0000
Message-Id: <20220225180716.13462-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

WSA SoundWire Controller does not support Clock stop and performs a soft reset
on suspend  resume path. Its recommended that WSA881x codecs connected to this
are also reset using a hard reset during suspend resume.

So this codec driver performs a hard reset during suspend resume cycle.
---
Hi Mark, 
Looks like the runtime pm series was partly applied, so am sending just this
leftover patch with requested changes.

Changes since v2:
  removed setting up simple_clk_stop_capable flag
  update log

srini


 sound/soc/codecs/wsa881x.c | 53 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 0222370ff95d..616b26c70c3b 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -11,6 +11,7 @@
 #include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
+#include <linux/pm_runtime.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw_type.h>
@@ -198,6 +199,7 @@
 #define WSA881X_OCP_CTL_TIMER_SEC 2
 #define WSA881X_OCP_CTL_TEMP_CELSIUS 25
 #define WSA881X_OCP_CTL_POLL_TIMER_SEC 60
+#define WSA881X_PROBE_TIMEOUT 1000
 
 #define WSA881X_PA_GAIN_TLV(xname, reg, shift, max, invert, tlv_array) \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
@@ -747,6 +749,12 @@ static int wsa881x_put_pa_gain(struct snd_kcontrol *kc,
 	unsigned int mask = (1 << fls(max)) - 1;
 	int val, ret, min_gain, max_gain;
 
+	ret = pm_runtime_get_sync(comp->dev);
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(comp->dev);
+		return ret;
+	}
+
 	max_gain = (max - ucontrol->value.integer.value[0]) & mask;
 	/*
 	 * Gain has to set incrementally in 4 steps
@@ -773,6 +781,9 @@ static int wsa881x_put_pa_gain(struct snd_kcontrol *kc,
 		usleep_range(1000, 1010);
 	}
 
+	pm_runtime_mark_last_busy(comp->dev);
+	pm_runtime_put_autosuspend(comp->dev);
+
 	return 1;
 }
 
@@ -1101,6 +1112,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
 	struct wsa881x_priv *wsa881x;
+	struct device *dev = &pdev->dev;
 
 	wsa881x = devm_kzalloc(&pdev->dev, sizeof(*wsa881x), GFP_KERNEL);
 	if (!wsa881x)
@@ -1132,12 +1144,52 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 		return PTR_ERR(wsa881x->regmap);
 	}
 
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
 	return devm_snd_soc_register_component(&pdev->dev,
 					       &wsa881x_component_drv,
 					       wsa881x_dais,
 					       ARRAY_SIZE(wsa881x_dais));
 }
 
+static int __maybe_unused wsa881x_runtime_suspend(struct device *dev)
+{
+	struct regmap *regmap = dev_get_regmap(dev, NULL);
+	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
+
+	gpiod_direction_output(wsa881x->sd_n, 0);
+
+	regcache_cache_only(regmap, true);
+	regcache_mark_dirty(regmap);
+
+	return 0;
+}
+
+static int __maybe_unused wsa881x_runtime_resume(struct device *dev)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct regmap *regmap = dev_get_regmap(dev, NULL);
+	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
+
+	gpiod_direction_output(wsa881x->sd_n, 1);
+
+	wait_for_completion_timeout(&slave->initialization_complete,
+				    msecs_to_jiffies(WSA881X_PROBE_TIMEOUT));
+
+	regcache_cache_only(regmap, false);
+	regcache_sync(regmap);
+
+	return 0;
+}
+
+static const struct dev_pm_ops wsa881x_pm_ops = {
+	SET_RUNTIME_PM_OPS(wsa881x_runtime_suspend, wsa881x_runtime_resume, NULL)
+};
+
 static const struct sdw_device_id wsa881x_slave_id[] = {
 	SDW_SLAVE_ENTRY(0x0217, 0x2010, 0),
 	SDW_SLAVE_ENTRY(0x0217, 0x2110, 0),
@@ -1151,6 +1203,7 @@ static struct sdw_driver wsa881x_codec_driver = {
 	.id_table = wsa881x_slave_id,
 	.driver = {
 		.name	= "wsa881x-codec",
+		.pm = &wsa881x_pm_ops,
 	}
 };
 module_sdw_driver(wsa881x_codec_driver);
-- 
2.21.0

