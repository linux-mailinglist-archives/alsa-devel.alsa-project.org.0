Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CD34C6FC5
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 15:44:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90D671704;
	Mon, 28 Feb 2022 15:43:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90D671704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646059445;
	bh=3Q0TZbbC8yeWdn8U4B/68ATgWZ9Bq4zhFjphdsyoGHs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nqzdFpAwvOhu9c0O2VK8UBBN3Gpwvf8PlYCfKliPNgxsqn9ThwpSu+doC+YiPpRMY
	 LpA7jRYrNt0bm9Ix9q5URaWwiy7t8guwMV0cpvAWv4U3RMmwwuGDz+qvFvphQH1Qh1
	 VL1FHVy3gocOJjQ+sUFJG8WoGotI9iSr6WitssP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5193F800F8;
	Mon, 28 Feb 2022 15:42:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F20F3F8013C; Mon, 28 Feb 2022 15:42:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D1C0F800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 15:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D1C0F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AWcnUSmR"
Received: by mail-wr1-x42e.google.com with SMTP id p9so15783503wra.12
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 06:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JeiJd2ZgJiYLQDAoicuBe5LbDBJMIUmRRu8Fz2FFrrY=;
 b=AWcnUSmR1nyOrs2af4OP9NZKhiPk9OK4hwjMbjIt+eWRCmyQ8LFIHpf+qFIcrnUUgb
 BCqlu/ThO7XS664ZJQqdOdiWx6EaTa8eGO6YHM8Cqqjk/dskiZ+AlQVfQiudj9bXnlif
 czcfbv9E1xGuT3vFGipmbSGOCttiqC+u6Xdnl9wPHTz7uSbyqDpFcmmrGPrVRi6WX+qN
 4d8CGrhAzQQjE94pzgtFObmlx3wE3OkuyKFacs8oFzMBCjrvB6jafvnes1oOpiDXAzRh
 1+si/nRLnsttkoXCmb1j4fntKSYHq4pcHs4l2C2lPy7E5uxQgYUEkBOMx/gWrnOGYPok
 homw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JeiJd2ZgJiYLQDAoicuBe5LbDBJMIUmRRu8Fz2FFrrY=;
 b=kXXIeGViC+8dbIjWgPLr4ma0TL1A9lnxCZFGEdU6+VsoP+470Ctr9/ChUaLzVr3L80
 kQvDKk69adKtk/2tbSWJbhOWp/M0kF1F99RjgkGBn3whfMhq08Y08jhHEunE2saSe7IM
 PjUgrRMkRLPFIGdDSemLE9h96yGMLZli1ri0YcAIVVt+R4oDJ7Nn24j4BhPC3v0rr03g
 RRr4YQ/crqye633n/OMGgi8/9K2MLjALaxVzU9p8tJeqXzVaX2WgwMF2mJLpCtzbDVA7
 CSDVd9n5Yh2mCFBZpw4gowoYQUMGW8Yo5y/GoouSiei9Ehbj/fXzboyKhPBto+0nvbjP
 QgXA==
X-Gm-Message-State: AOAM533SZ0a2XwCVgMeyBJnfNQ6petgZ44RVz/RTP4z/Wkq00F6ONE+T
 bCV5GrhrFpTAqZyjKIUx95BisA==
X-Google-Smtp-Source: ABdhPJwiNyvayuILk4HidnUJ6aXnqMYeqhE/TX7K/qv04vfoCVYAD3RUQk2OEsWQ6V2SrGv27K2iOg==
X-Received: by 2002:adf:eb81:0:b0:1e3:2bf5:132 with SMTP id
 t1-20020adfeb81000000b001e32bf50132mr16412204wrn.246.1646059367227; 
 Mon, 28 Feb 2022 06:42:47 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b00381141f4967sm14643724wmq.35.2022.02.28.06.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 06:42:46 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v4] ASoC: codecs: wsa881x: add runtime pm support
Date: Mon, 28 Feb 2022 14:42:35 +0000
Message-Id: <20220228144235.24208-1-srinivas.kandagatla@linaro.org>
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---

Changes since v3:
	- added missing sign off.
	- no code changes


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

