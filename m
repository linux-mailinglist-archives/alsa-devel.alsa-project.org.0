Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C61E7BC019
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 22:12:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5924FDEB;
	Fri,  6 Oct 2023 22:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5924FDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696623144;
	bh=SZG85+wa6q3Ku3xCwhronAk4Ahky2z2LqsHCsR3+wro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GvNS4xXNg30wSp8RKD2wPRzJJOYocZzWT3h43HHU8QdXfUZibNuUxqKBwsDMYFKPn
	 P+tXdNQ1db9MOlzaHyaTQkpvMx/Jhmof1CjDj06JX/6yEOVGu8ZwmDFfx+MSOkn1Gu
	 gQ9EHteBKUqr4/7EIfJ156CUsHjfI//hFhMahjxI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B134EF805BB; Fri,  6 Oct 2023 22:10:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69971F805B3;
	Fri,  6 Oct 2023 22:10:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A2A6F805B4; Fri,  6 Oct 2023 22:10:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 047FCF80578
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 22:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 047FCF80578
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-6bd04558784so1697984a34.3
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Oct 2023 13:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696622987; x=1697227787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+OCongk6Hb4BlpU4QfeNnEcgzo8GaBxo0N0PgFWYnw=;
        b=xFdyPhvzp1EybVDIn7T4gKtYLBevFx6XNhhZWA9DAYtQeQ4aNYQ/hx7SG+m8V9UWtG
         k6Ad8TGMaJoMMUqeSOlkCSlIFeJF9D0k7ePk94zMcB5+QMCqqDwchhxLhiEPHj3ci71k
         BobSs6ltkeTspxDmJTJ+wwD9ZFile5OuU9OCeFy4opOSp/XVO20czsf6SmvQCJxG8i3j
         F4zFtD+XoWi9xIb1CRU+iwPdZ2vJtPl2TCYdhjrgMdg7+lZwceoy5Lb7NeBGzz8XR00V
         VviISMC46ZKM8FdzBvrF4fJ0jkad8e15+YDzKe24IQztmS9mGLdmPLvtKo19H8Ndwuyr
         FZjw==
X-Gm-Message-State: AOJu0YymDVszBPfPw6RTPUuYyUYc6+nNJGgMC1J/Dq55RWnZ4HmkvZif
	shKtNsUNPNX+waTYzjVepfH7vV+xvg==
X-Google-Smtp-Source: 
 AGHT+IH7p3RI8WF5mlWccwSKg4dOKG/CNbO8ToEojOS1DN/EOweO0LBTKMQmzqXXejIioJEYMYtiWA==
X-Received: by 2002:a05:6830:1502:b0:6bf:1f5f:ed18 with SMTP id
 k2-20020a056830150200b006bf1f5fed18mr8505526otp.1.1696622987671;
        Fri, 06 Oct 2023 13:09:47 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 v8-20020a9d7d08000000b006c4be829aa8sm679959otn.44.2023.10.06.13.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:09:47 -0700 (PDT)
Received: (nullmailer pid 229129 invoked by uid 1000);
	Fri, 06 Oct 2023 20:09:30 -0000
From: Rob Herring <robh@kernel.org>
Date: Fri, 06 Oct 2023 15:09:12 -0500
Subject: [PATCH v3 3/5] ASoC: da7218: Use i2c_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-dt-asoc-header-cleanups-v3-3-13a4f0f7fee6@kernel.org>
References: <20231006-dt-asoc-header-cleanups-v3-0-13a4f0f7fee6@kernel.org>
In-Reply-To: <20231006-dt-asoc-header-cleanups-v3-0-13a4f0f7fee6@kernel.org>
To: Mark Brown <broonie@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Peter Rosin <peda@axentia.se>,
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com,
	James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>, Fabio Estevam <festevam@gmail.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>, Kevin Cernekee <cernekee@chromium.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Ban Tao <fengzheng923@gmail.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
X-Mailer: b4 0.13-dev
Message-ID-Hash: AVJ7TSUD4VPEUURWBWFAOCRNKLCWLHIB
X-Message-ID-Hash: AVJ7TSUD4VPEUURWBWFAOCRNKLCWLHIB
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVJ7TSUD4VPEUURWBWFAOCRNKLCWLHIB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use preferred i2c_get_match_data() instead of of_match_device() and
i2c_match_id() to get the driver match data. With this, adjust the
includes to explicitly include the correct headers.

Avoid using 0 for enum da7218_dev_id so that no match data can be
distinguished.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 sound/soc/codecs/da7218.c | 29 ++---------------------------
 sound/soc/codecs/da7218.h |  2 +-
 2 files changed, 3 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index 3f456b08b809..8aacd7350798 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -9,7 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/i2c.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/pm.h>
@@ -2285,16 +2285,6 @@ static const struct of_device_id da7218_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, da7218_of_match);
 
-static inline int da7218_of_get_id(struct device *dev)
-{
-	const struct of_device_id *id = of_match_device(da7218_of_match, dev);
-
-	if (id)
-		return (uintptr_t)id->data;
-	else
-		return -EINVAL;
-}
-
 static enum da7218_micbias_voltage
 	da7218_of_micbias_lvl(struct snd_soc_component *component, u32 val)
 {
@@ -3253,18 +3243,6 @@ static const struct regmap_config da7218_regmap_config = {
  * I2C layer
  */
 
-static const struct i2c_device_id da7218_i2c_id[];
-
-static inline int da7218_i2c_get_id(struct i2c_client *i2c)
-{
-	const struct i2c_device_id *id = i2c_match_id(da7218_i2c_id, i2c);
-
-	if (id)
-		return (uintptr_t)id->driver_data;
-	else
-		return -EINVAL;
-}
-
 static int da7218_i2c_probe(struct i2c_client *i2c)
 {
 	struct da7218_priv *da7218;
@@ -3276,10 +3254,7 @@ static int da7218_i2c_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, da7218);
 
-	if (i2c->dev.of_node)
-		da7218->dev_id = da7218_of_get_id(&i2c->dev);
-	else
-		da7218->dev_id = da7218_i2c_get_id(i2c);
+	da7218->dev_id = (uintptr_t)i2c_get_match_data(i2c);
 
 	if ((da7218->dev_id != DA7217_DEV_ID) &&
 	    (da7218->dev_id != DA7218_DEV_ID)) {
diff --git a/sound/soc/codecs/da7218.h b/sound/soc/codecs/da7218.h
index 9ac2892092b5..7f6a4aea2c7a 100644
--- a/sound/soc/codecs/da7218.h
+++ b/sound/soc/codecs/da7218.h
@@ -1369,7 +1369,7 @@ enum da7218_sys_clk {
 };
 
 enum da7218_dev_id {
-	DA7217_DEV_ID = 0,
+	DA7217_DEV_ID = 1,
 	DA7218_DEV_ID,
 };
 

-- 
2.40.1

