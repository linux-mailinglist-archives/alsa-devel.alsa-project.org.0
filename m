Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D29694C40
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 17:18:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F19D83B;
	Mon, 13 Feb 2023 17:17:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F19D83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676305098;
	bh=cZTTeKU937sx7b1HCCuAu24tBsbF1+KVsSvF5ZVAqfw=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hNo8rT83VScDt8Q/B8tbeVo+Qmc7I0PnaVVnRevjf2xHDmIBTLtK0zkzFCJrRRvCP
	 EzvyrsjkR3Ow+Vljla/eNtjNrZXjqtbg4TsOGnOdTwxXLWhv9u2rW+Q+5J6p0/2R7n
	 Y90wkRmM9sfVT6Jl0kWA8QyZLoMcEQl0ruYCbmmM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2788F804B0;
	Mon, 13 Feb 2023 17:17:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8E2AF804B4; Mon, 13 Feb 2023 17:17:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C544F80051
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 17:16:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C544F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=k+5IHq/F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676305038; x=1707841038;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cZTTeKU937sx7b1HCCuAu24tBsbF1+KVsSvF5ZVAqfw=;
  b=k+5IHq/FzkQw/ExFrQdKtJ/Ysx3Dtb8LFRQItggf8JClOMlPRtw6LaC7
   Ez8ZGnGxisGIdKnKmnt7SESgvMG2Pb/rPttuSN/5CEnk6v/EP66jzolEZ
   2RQcYsj87G5PmBPHP858R1uSFESKqVn6HcbCsubu1lWqbiUMNBZNUq33O
   fhpFa5WIiHNzfHX7IwsN9TCBFuM6W3/GOZ23uXpejUE5tEhvw5LEZKTvf
   MnqWh6xxiqkaM89g+LM7StPWzEF99hFUcBkXVV4S+7swEupoiy2wsB1ju
   wqMepOhs8gaWtyUKpP5LbOns3k025BTL1dNoRplccKReKrUfMXuIYwivg
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="310560337"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000";
   d="scan'208";a="310560337"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 08:16:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="670874415"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000";
   d="scan'208";a="670874415"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 08:16:39 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D9BC61A6; Mon, 13 Feb 2023 18:17:18 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] ASoC: soc-ac97: Convert to agnostic GPIO API
Date: Mon, 13 Feb 2023 18:17:13 +0200
Message-Id: <20230213161713.1450-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CPKZUXW7XNCFYX5OVGJVJZS4QTKAINIU
X-Message-ID-Hash: CPKZUXW7XNCFYX5OVGJVJZS4QTKAINIU
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPKZUXW7XNCFYX5OVGJVJZS4QTKAINIU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The of_gpio.h is going to be removed. In preparation of that convert
the driver to the agnostic API.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/soc-ac97.c | 68 ++++++++++++++------------------------------
 1 file changed, 22 insertions(+), 46 deletions(-)

diff --git a/sound/soc/soc-ac97.c b/sound/soc/soc-ac97.c
index 32c5be61e2ec..40051f513c6a 100644
--- a/sound/soc/soc-ac97.c
+++ b/sound/soc/soc-ac97.c
@@ -14,10 +14,9 @@
 #include <linux/ctype.h>
 #include <linux/delay.h>
 #include <linux/export.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/init.h>
-#include <linux/of_gpio.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/slab.h>
@@ -29,9 +28,9 @@ struct snd_ac97_reset_cfg {
 	struct pinctrl_state *pstate_reset;
 	struct pinctrl_state *pstate_warm_reset;
 	struct pinctrl_state *pstate_run;
-	int gpio_sdata;
-	int gpio_sync;
-	int gpio_reset;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *sdata_gpio;
+	struct gpio_desc *sync_gpio;
 };
 
 static struct snd_ac97_bus soc_ac97_bus = {
@@ -268,11 +267,11 @@ static void snd_soc_ac97_warm_reset(struct snd_ac97 *ac97)
 
 	pinctrl_select_state(pctl, snd_ac97_rst_cfg.pstate_warm_reset);
 
-	gpio_direction_output(snd_ac97_rst_cfg.gpio_sync, 1);
+	gpiod_direction_output_raw(snd_ac97_rst_cfg.sync_gpio, 1);
 
 	udelay(10);
 
-	gpio_direction_output(snd_ac97_rst_cfg.gpio_sync, 0);
+	gpiod_direction_output_raw(snd_ac97_rst_cfg.sync_gpio, 0);
 
 	pinctrl_select_state(pctl, snd_ac97_rst_cfg.pstate_run);
 	msleep(2);
@@ -284,13 +283,13 @@ static void snd_soc_ac97_reset(struct snd_ac97 *ac97)
 
 	pinctrl_select_state(pctl, snd_ac97_rst_cfg.pstate_reset);
 
-	gpio_direction_output(snd_ac97_rst_cfg.gpio_sync, 0);
-	gpio_direction_output(snd_ac97_rst_cfg.gpio_sdata, 0);
-	gpio_direction_output(snd_ac97_rst_cfg.gpio_reset, 0);
+	gpiod_direction_output_raw(snd_ac97_rst_cfg.sync_gpio, 0);
+	gpiod_direction_output_raw(snd_ac97_rst_cfg.sdata_gpio, 0);
+	gpiod_direction_output_raw(snd_ac97_rst_cfg.reset_gpio, 0);
 
 	udelay(10);
 
-	gpio_direction_output(snd_ac97_rst_cfg.gpio_reset, 1);
+	gpiod_direction_output_raw(snd_ac97_rst_cfg.reset_gpio, 1);
 
 	pinctrl_select_state(pctl, snd_ac97_rst_cfg.pstate_run);
 	msleep(2);
@@ -301,8 +300,6 @@ static int snd_soc_ac97_parse_pinctl(struct device *dev,
 {
 	struct pinctrl *p;
 	struct pinctrl_state *state;
-	int gpio;
-	int ret;
 
 	p = devm_pinctrl_get(dev);
 	if (IS_ERR(p)) {
@@ -332,41 +329,20 @@ static int snd_soc_ac97_parse_pinctl(struct device *dev,
 	}
 	cfg->pstate_run = state;
 
-	gpio = of_get_named_gpio(dev->of_node, "ac97-gpios", 0);
-	if (gpio < 0) {
-		dev_err(dev, "Can't find ac97-sync gpio\n");
-		return gpio;
-	}
-	ret = devm_gpio_request(dev, gpio, "AC97 link sync");
-	if (ret) {
-		dev_err(dev, "Failed requesting ac97-sync gpio\n");
-		return ret;
-	}
-	cfg->gpio_sync = gpio;
+	cfg->sync_gpio = devm_gpiod_get_index(dev, "ac97", 0, GPIOD_ASIS);
+	if (IS_ERR(cfg->sync_gpio))
+		return dev_err_probe(dev, PTR_ERR(cfg->sync_gpio), "Can't find ac97-sync gpio\n");
+	gpiod_set_consumer_name(cfg->sync_gpio, "AC97 link sync");
 
-	gpio = of_get_named_gpio(dev->of_node, "ac97-gpios", 1);
-	if (gpio < 0) {
-		dev_err(dev, "Can't find ac97-sdata gpio %d\n", gpio);
-		return gpio;
-	}
-	ret = devm_gpio_request(dev, gpio, "AC97 link sdata");
-	if (ret) {
-		dev_err(dev, "Failed requesting ac97-sdata gpio\n");
-		return ret;
-	}
-	cfg->gpio_sdata = gpio;
+	cfg->sdata_gpio = devm_gpiod_get_index(dev, "ac97", 1, GPIOD_ASIS);
+	if (IS_ERR(cfg->sdata_gpio))
+		return dev_err_probe(dev, PTR_ERR(cfg->sync_gpio), "Can't find ac97-sdata gpio\n");
+	gpiod_set_consumer_name(cfg->sdata_gpio, "AC97 link sdata");
 
-	gpio = of_get_named_gpio(dev->of_node, "ac97-gpios", 2);
-	if (gpio < 0) {
-		dev_err(dev, "Can't find ac97-reset gpio\n");
-		return gpio;
-	}
-	ret = devm_gpio_request(dev, gpio, "AC97 link reset");
-	if (ret) {
-		dev_err(dev, "Failed requesting ac97-reset gpio\n");
-		return ret;
-	}
-	cfg->gpio_reset = gpio;
+	cfg->reset_gpio = devm_gpiod_get_index(dev, "ac97", 2, GPIOD_ASIS);
+	if (IS_ERR(cfg->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(cfg->sync_gpio), "Can't find ac97-reset gpio\n");
+	gpiod_set_consumer_name(cfg->reset_gpio, "AC97 link reset");
 
 	return 0;
 }
-- 
2.39.1

