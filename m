Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BC57B8463
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 18:00:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 185C0E7C;
	Wed,  4 Oct 2023 18:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 185C0E7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696435259;
	bh=SZG85+wa6q3Ku3xCwhronAk4Ahky2z2LqsHCsR3+wro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IvPLUI3LKhUbgkRvMVuT5GLg71fSexdj9Ssvog+eoB0t29NGbpxZIXpbaRaGw53Ol
	 7E5D1do/9Wn1QStj4xLjbKCz2Ic/S2FxKy8Se4+c6mhPNzuCgL1Fp2Uiq7UgNMIGs9
	 1kPV4GfgbG0VknzgNBhhCjZAsplhbUXujvtUlWkM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EC74F805B0; Wed,  4 Oct 2023 17:58:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F95F805B0;
	Wed,  4 Oct 2023 17:58:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92D64F805A1; Wed,  4 Oct 2023 17:58:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9726F80557
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 17:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9726F80557
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n4XYD4oF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 14516CE1DAD;
	Wed,  4 Oct 2023 15:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70BBCC433CA;
	Wed,  4 Oct 2023 15:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696435118;
	bh=SZG85+wa6q3Ku3xCwhronAk4Ahky2z2LqsHCsR3+wro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n4XYD4oFJI7QR8EuAzsGRaCjw+LIq9+bJiF2ochblBlORFQTloUxdx5T2ayp+dB0v
	 oyEE9Dg7CZM5tJmXYId1jrc93BgGB/m+dxHR3ZGNxWLAZflWeEyoIyr2pHwyHhXj+L
	 cF9wvbK3vcUzOKahmjEiLqGGpylWOERI1qFenB4AUXjYIh0lRaDzmBKkdCh5HhndJk
	 r4bbSwcDdvqolW7b6oU9Nsiqp/UtD2b7k3mwHupuzpFzxZ9PiEOvmxoFBXl9NdHrmY
	 pdEikkjcFIzaMahbQB1tPvMm/rhWNTxyRzAEuPv+wyVvpzBmeTgXeT0g2QW7D6TUqy
	 rHXdnP0jgdtTw==
Received: (nullmailer pid 3222239 invoked by uid 1000);
	Wed, 04 Oct 2023 15:58:09 -0000
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Peter Rosin <peda@axentia.se>,
 Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>,
 Fabio Estevam <festevam@gmail.com>, Kiseok Jo <kiseok.jo@irondevice.com>,
 Kevin Cernekee <cernekee@chromium.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Ban Tao <fengz
 heng923@gmail.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
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
 linuxppc-dev@lists.ozlabs.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 3/5] ASoC: da7218: Use i2c_get_match_data()
Date: Wed,  4 Oct 2023 10:58:07 -0500
Message-Id: <20231004-dt-asoc-header-cleanups-v2-3-e77765080cbc@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004-dt-asoc-header-cleanups-v2-0-e77765080cbc@kernel.org>
References: <20231004-dt-asoc-header-cleanups-v2-0-e77765080cbc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13-dev
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JOVQTSB4XNA7ERIP5PPAEV4HK6V4BGA7
X-Message-ID-Hash: JOVQTSB4XNA7ERIP5PPAEV4HK6V4BGA7
X-MailFrom: SRS0=zsuR=FS=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JOVQTSB4XNA7ERIP5PPAEV4HK6V4BGA7/>
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

