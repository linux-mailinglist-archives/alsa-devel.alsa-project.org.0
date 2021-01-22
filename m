Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 205533008DC
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 17:45:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9F6A1F2B;
	Fri, 22 Jan 2021 17:44:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9F6A1F2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611333938;
	bh=JJFuRu8ETugu5FEyDuVUIORvbbiYmf+aEVBV2CSdhek=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gAZJ3GwQhdyfNij6eWmYssPKUDXIcsWbi0gkUmL2pJH8oxiu1CXaNF8So1q8cXhLd
	 dN4ouzWyLxKG9qZkqgR/3GhfLEHdoajTa2ggmYJyEaTM8lSaPXYpbsTKok2BDnR5mH
	 I0o67CbWrC366xPd6j8o+eLVNr4HFw8TjRYyhrFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87B6BF80516;
	Fri, 22 Jan 2021 17:41:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59844F80516; Fri, 22 Jan 2021 17:41:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51088F80506
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 17:41:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51088F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="VvVrj3SE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611333698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jyaJ7gH/mMzyJf6DI4KyytphyyPYESq3Jh4AVaiFkQs=;
 b=VvVrj3SEOioZxzO0yKaRgcGav2AXhEviHL5GMGoCbOmJVKMnJuTD+nfoxmubs8VXdfSM5I
 L3OtOIdveDvPHE0rsgCXcFELBKP3Yk6PJ4NiYAaqRo/bAIHEHoxjoO/rgh8MhswrkZa0Ow
 bSewGRZgnThn+IpPLeDsMGz3vkptiCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-FAgkbqX2OVqjAyxpKLQGNw-1; Fri, 22 Jan 2021 11:41:34 -0500
X-MC-Unique: FAgkbqX2OVqjAyxpKLQGNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1661B8066E5;
 Fri, 22 Jan 2021 16:41:32 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-174.ams2.redhat.com [10.36.112.174])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D54036EF46;
 Fri, 22 Jan 2021 16:41:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 07/13] ASoC: arizona-jack: Move jack-detect variables to
 struct arizona_priv
Date: Fri, 22 Jan 2021 17:41:01 +0100
Message-Id: <20210122164107.361939-8-hdegoede@redhat.com>
In-Reply-To: <20210122164107.361939-1-hdegoede@redhat.com>
References: <20210122164107.361939-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

Move all the jack-detect variables from struct arizona_extcon_info to
struct arizona_priv.

This is part of a patch series converting the arizona extcon driver into
a helper library for letting the arizona codec-drivers directly report jack
state through the standard sound/soc/soc-jack.c functions.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/codecs/arizona-jack.c | 97 ++++++++++-----------------------
 sound/soc/codecs/arizona.h      | 36 ++++++++++++
 2 files changed, 65 insertions(+), 68 deletions(-)

diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index 56d2ce05de50..5b40316d0d75 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -27,6 +27,8 @@
 #include <linux/mfd/arizona/registers.h>
 #include <dt-bindings/mfd/arizona.h>
 
+#include "arizona.h"
+
 #define ARIZONA_MAX_MICD_RANGE 8
 
 #define ARIZONA_MICD_CLAMP_MODE_JDL      0x4
@@ -61,47 +63,6 @@
 
 #define MICD_LVL_0_TO_8 (MICD_LVL_0_TO_7 | ARIZONA_MICD_LVL_8)
 
-struct arizona_extcon_info {
-	struct device *dev;
-	struct arizona *arizona;
-	struct mutex lock;
-	struct regulator *micvdd;
-	struct input_dev *input;
-
-	u16 last_jackdet;
-
-	int micd_mode;
-	const struct arizona_micd_config *micd_modes;
-	int micd_num_modes;
-
-	const struct arizona_micd_range *micd_ranges;
-	int num_micd_ranges;
-
-	bool micd_reva;
-	bool micd_clamp;
-
-	struct delayed_work hpdet_work;
-	struct delayed_work micd_detect_work;
-	struct delayed_work micd_timeout_work;
-
-	bool hpdet_active;
-	bool hpdet_done;
-	bool hpdet_retried;
-
-	int num_hpdet_res;
-	unsigned int hpdet_res[3];
-
-	bool mic;
-	bool detecting;
-	int jack_flips;
-
-	int hpdet_ip_version;
-
-	struct extcon_dev *edev;
-
-	struct gpio_desc *micd_pol_gpio;
-};
-
 static const struct arizona_micd_config micd_default_modes[] = {
 	{ ARIZONA_ACCDET_SRC, 1, 0 },
 	{ 0,                  2, 1 },
@@ -135,9 +96,9 @@ static const unsigned int arizona_cable[] = {
 	EXTCON_NONE,
 };
 
-static void arizona_start_hpdet_acc_id(struct arizona_extcon_info *info);
+static void arizona_start_hpdet_acc_id(struct arizona_priv *info);
 
-static void arizona_extcon_hp_clamp(struct arizona_extcon_info *info,
+static void arizona_extcon_hp_clamp(struct arizona_priv *info,
 				    bool clamp)
 {
 	struct arizona *arizona = info->arizona;
@@ -222,7 +183,7 @@ static void arizona_extcon_hp_clamp(struct arizona_extcon_info *info,
 	snd_soc_dapm_mutex_unlock(arizona->dapm);
 }
 
-static void arizona_extcon_set_mode(struct arizona_extcon_info *info, int mode)
+static void arizona_extcon_set_mode(struct arizona_priv *info, int mode)
 {
 	struct arizona *arizona = info->arizona;
 
@@ -243,7 +204,7 @@ static void arizona_extcon_set_mode(struct arizona_extcon_info *info, int mode)
 	dev_dbg(arizona->dev, "Set jack polarity to %d\n", mode);
 }
 
-static const char *arizona_extcon_get_micbias(struct arizona_extcon_info *info)
+static const char *arizona_extcon_get_micbias(struct arizona_priv *info)
 {
 	switch (info->micd_modes[0].bias) {
 	case 1:
@@ -257,7 +218,7 @@ static const char *arizona_extcon_get_micbias(struct arizona_extcon_info *info)
 	}
 }
 
-static void arizona_extcon_pulse_micbias(struct arizona_extcon_info *info)
+static void arizona_extcon_pulse_micbias(struct arizona_priv *info)
 {
 	struct arizona *arizona = info->arizona;
 	const char *widget = arizona_extcon_get_micbias(info);
@@ -282,7 +243,7 @@ static void arizona_extcon_pulse_micbias(struct arizona_extcon_info *info)
 	}
 }
 
-static void arizona_start_mic(struct arizona_extcon_info *info)
+static void arizona_start_mic(struct arizona_priv *info)
 {
 	struct arizona *arizona = info->arizona;
 	bool change;
@@ -339,7 +300,7 @@ static void arizona_start_mic(struct arizona_extcon_info *info)
 	}
 }
 
-static void arizona_stop_mic(struct arizona_extcon_info *info)
+static void arizona_stop_mic(struct arizona_priv *info)
 {
 	struct arizona *arizona = info->arizona;
 	const char *widget = arizona_extcon_get_micbias(info);
@@ -407,7 +368,7 @@ static struct {
 	{ 1000, 10000 },
 };
 
-static int arizona_hpdet_read(struct arizona_extcon_info *info)
+static int arizona_hpdet_read(struct arizona_priv *info)
 {
 	struct arizona *arizona = info->arizona;
 	unsigned int val, range;
@@ -527,7 +488,7 @@ static int arizona_hpdet_read(struct arizona_extcon_info *info)
 	return val;
 }
 
-static int arizona_hpdet_do_id(struct arizona_extcon_info *info, int *reading,
+static int arizona_hpdet_do_id(struct arizona_priv *info, int *reading,
 			       bool *mic)
 {
 	struct arizona *arizona = info->arizona;
@@ -597,7 +558,7 @@ static int arizona_hpdet_do_id(struct arizona_extcon_info *info, int *reading,
 
 static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 {
-	struct arizona_extcon_info *info = data;
+	struct arizona_priv *info = data;
 	struct arizona *arizona = info->arizona;
 	int id_gpio = arizona->pdata.hpdet_id_gpio;
 	unsigned int report = EXTCON_JACK_HEADPHONE;
@@ -684,7 +645,7 @@ static irqreturn_t arizona_hpdet_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void arizona_identify_headphone(struct arizona_extcon_info *info)
+static void arizona_identify_headphone(struct arizona_priv *info)
 {
 	struct arizona *arizona = info->arizona;
 	int ret;
@@ -737,7 +698,7 @@ static void arizona_identify_headphone(struct arizona_extcon_info *info)
 	info->hpdet_active = false;
 }
 
-static void arizona_start_hpdet_acc_id(struct arizona_extcon_info *info)
+static void arizona_start_hpdet_acc_id(struct arizona_priv *info)
 {
 	struct arizona *arizona = info->arizona;
 	int hp_reading = 32;
@@ -790,8 +751,8 @@ static void arizona_start_hpdet_acc_id(struct arizona_extcon_info *info)
 
 static void arizona_micd_timeout_work(struct work_struct *work)
 {
-	struct arizona_extcon_info *info = container_of(work,
-						struct arizona_extcon_info,
+	struct arizona_priv *info = container_of(work,
+						struct arizona_priv,
 						micd_timeout_work.work);
 
 	mutex_lock(&info->lock);
@@ -805,7 +766,7 @@ static void arizona_micd_timeout_work(struct work_struct *work)
 	mutex_unlock(&info->lock);
 }
 
-static int arizona_micd_adc_read(struct arizona_extcon_info *info)
+static int arizona_micd_adc_read(struct arizona_priv *info)
 {
 	struct arizona *arizona = info->arizona;
 	unsigned int val;
@@ -842,7 +803,7 @@ static int arizona_micd_adc_read(struct arizona_extcon_info *info)
 	return val;
 }
 
-static int arizona_micd_read(struct arizona_extcon_info *info)
+static int arizona_micd_read(struct arizona_priv *info)
 {
 	struct arizona *arizona = info->arizona;
 	unsigned int val = 0;
@@ -875,7 +836,7 @@ static int arizona_micd_read(struct arizona_extcon_info *info)
 
 static int arizona_micdet_reading(void *priv)
 {
-	struct arizona_extcon_info *info = priv;
+	struct arizona_priv *info = priv;
 	struct arizona *arizona = info->arizona;
 	int ret, val;
 
@@ -969,7 +930,7 @@ static int arizona_micdet_reading(void *priv)
 
 static int arizona_button_reading(void *priv)
 {
-	struct arizona_extcon_info *info = priv;
+	struct arizona_priv *info = priv;
 	struct arizona *arizona = info->arizona;
 	int val, key, lvl, i;
 
@@ -1017,8 +978,8 @@ static int arizona_button_reading(void *priv)
 
 static void arizona_micd_detect(struct work_struct *work)
 {
-	struct arizona_extcon_info *info = container_of(work,
-						struct arizona_extcon_info,
+	struct arizona_priv *info = container_of(work,
+						struct arizona_priv,
 						micd_detect_work.work);
 	struct arizona *arizona = info->arizona;
 	int ret;
@@ -1051,7 +1012,7 @@ static void arizona_micd_detect(struct work_struct *work)
 
 static irqreturn_t arizona_micdet(int irq, void *data)
 {
-	struct arizona_extcon_info *info = data;
+	struct arizona_priv *info = data;
 	struct arizona *arizona = info->arizona;
 	int debounce = arizona->pdata.micd_detect_debounce;
 
@@ -1075,8 +1036,8 @@ static irqreturn_t arizona_micdet(int irq, void *data)
 
 static void arizona_hpdet_work(struct work_struct *work)
 {
-	struct arizona_extcon_info *info = container_of(work,
-						struct arizona_extcon_info,
+	struct arizona_priv *info = container_of(work,
+						struct arizona_priv,
 						hpdet_work.work);
 
 	mutex_lock(&info->lock);
@@ -1084,7 +1045,7 @@ static void arizona_hpdet_work(struct work_struct *work)
 	mutex_unlock(&info->lock);
 }
 
-static int arizona_hpdet_wait(struct arizona_extcon_info *info)
+static int arizona_hpdet_wait(struct arizona_priv *info)
 {
 	struct arizona *arizona = info->arizona;
 	unsigned int val;
@@ -1120,7 +1081,7 @@ static int arizona_hpdet_wait(struct arizona_extcon_info *info)
 
 static irqreturn_t arizona_jackdet(int irq, void *data)
 {
-	struct arizona_extcon_info *info = data;
+	struct arizona_priv *info = data;
 	struct arizona *arizona = info->arizona;
 	unsigned int val, present, mask;
 	bool cancelled_hp, cancelled_mic;
@@ -1380,7 +1341,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 {
 	struct arizona *arizona = dev_get_drvdata(pdev->dev.parent);
 	struct arizona_pdata *pdata = &arizona->pdata;
-	struct arizona_extcon_info *info;
+	struct arizona_priv *info;
 	unsigned int val;
 	unsigned int clamp_mode;
 	int jack_irq_fall, jack_irq_rise;
@@ -1754,7 +1715,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 
 static int arizona_extcon_remove(struct platform_device *pdev)
 {
-	struct arizona_extcon_info *info = platform_get_drvdata(pdev);
+	struct arizona_priv *info = platform_get_drvdata(pdev);
 	struct arizona *arizona = info->arizona;
 	int jack_irq_rise, jack_irq_fall;
 	bool change;
diff --git a/sound/soc/codecs/arizona.h b/sound/soc/codecs/arizona.h
index b893d3e4c97c..d1a263a67bba 100644
--- a/sound/soc/codecs/arizona.h
+++ b/sound/soc/codecs/arizona.h
@@ -91,6 +91,42 @@ struct arizona_priv {
 	unsigned int dvfs_reqs;
 	struct mutex dvfs_lock;
 	bool dvfs_cached;
+
+	/* Variables used by arizona-jack.c code */
+	struct device *dev;
+	struct mutex lock;
+	struct delayed_work hpdet_work;
+	struct delayed_work micd_detect_work;
+	struct delayed_work micd_timeout_work;
+	struct regulator *micvdd;
+	struct input_dev *input;
+	struct extcon_dev *edev;
+	struct gpio_desc *micd_pol_gpio;
+
+	u16 last_jackdet;
+
+	int micd_mode;
+	const struct arizona_micd_config *micd_modes;
+	int micd_num_modes;
+
+	const struct arizona_micd_range *micd_ranges;
+	int num_micd_ranges;
+
+	bool micd_reva;
+	bool micd_clamp;
+
+	bool hpdet_active;
+	bool hpdet_done;
+	bool hpdet_retried;
+
+	bool mic;
+	bool detecting;
+
+	int num_hpdet_res;
+	unsigned int hpdet_res[3];
+
+	int jack_flips;
+	int hpdet_ip_version;
 };
 
 struct arizona_voice_trigger_info {
-- 
2.28.0

