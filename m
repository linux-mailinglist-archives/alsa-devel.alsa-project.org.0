Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48425544DDA
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 15:38:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9AA71AD2;
	Thu,  9 Jun 2022 15:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9AA71AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654781921;
	bh=Hc9vYKiIGg8Ubnaqos4pEjT2Ox9V/D6S5DeOypIXjEk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l6NYdc5P+caIlaUXmTJy61ksOJnZ/RUI86CzOpGcO9637+ldbxO9e09QraEwE7dPk
	 l5PpVvCGe5Lbai2MNgsM9JKcZ68xycjgAsplXRoij7isUaO3QpO+NW2otNV1OQXnZL
	 5k42LN2a0T4FN7Xduz8Gw7OssF0AAn8oQP7wAKjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E98B3F80543;
	Thu,  9 Jun 2022 15:36:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B04BF8053B; Thu,  9 Jun 2022 15:35:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01A4CF80535
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 15:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01A4CF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fd9jJ87M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654781756; x=1686317756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hc9vYKiIGg8Ubnaqos4pEjT2Ox9V/D6S5DeOypIXjEk=;
 b=fd9jJ87MvHNR2pg12HHOalbIZJd29IU3G9YPDWNcbxFCG0+AjhTYwOJ/
 mp0IVBertuvkqhI90f3QNfOTIzWAGAb/vthX6v3ZH/cfu6FMgN4sOTQck
 mMQwGxB+WOGXKpFCOuASLRkaY/ubw+dhanzNi04n238e3HHrew4FnlW1u
 zPDMKi+MN/myuiECbbmHVDlfWi1WjShjOFauKqORtCYU5zODlO/QivODz
 N3thddmvNUGbC15ej0i1vdErU6bMqQ/zqfxHNvWDjcaQAlenCHgQez/MP
 +7/wLwg9J3KSa5FzDWT1owXdsVmyiyj4+3xsp0jQZLtrmXZ1WaACfZUIp A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266061409"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="266061409"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 06:35:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="683966167"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2022 06:35:52 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 07/11] ASoC: codecs: rt274: Enable irq only when needed
Date: Thu,  9 Jun 2022 15:35:37 +0200
Message-Id: <20220609133541.3984886-8-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

Interrupt is only needed when jack detection is enabled, so enable it
then, similarly disable it when jack detection is being disabled.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt274.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index 144a6f775c21..730de9452333 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -16,6 +16,7 @@
 #include <linux/spi/spi.h>
 #include <linux/dmi.h>
 #include <linux/acpi.h>
+#include <linux/irq.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -395,28 +396,42 @@ static void rt274_jack_detect_work(struct work_struct *work)
 		SND_JACK_MICROPHONE | SND_JACK_HEADPHONE);
 }
 
-static irqreturn_t rt274_irq(int irq, void *data);
-
 static int rt274_mic_detect(struct snd_soc_component *component,
 	struct snd_soc_jack *jack,  void *data)
 {
 	struct rt274_priv *rt274 = snd_soc_component_get_drvdata(component);
+	bool mic = false;
+	bool hp = false;
+	int status = 0;
+	int ret;
 
 	rt274->jack = jack;
 
 	if (jack == NULL) {
 		/* Disable jack detection */
+		disable_irq(rt274->i2c->irq);
 		regmap_update_bits(rt274->regmap, RT274_EAPD_GPIO_IRQ_CTRL,
 					RT274_IRQ_EN, RT274_IRQ_DIS);
 
 		return 0;
 	}
 
+	/* Enable jack detection */
 	regmap_update_bits(rt274->regmap, RT274_EAPD_GPIO_IRQ_CTRL,
 				RT274_IRQ_EN, RT274_IRQ_EN);
+	enable_irq(rt274->i2c->irq);
 
 	/* Send an initial report */
-	rt274_irq(0, rt274);
+	ret = rt274_jack_detect(rt274, &hp, &mic);
+	if (!ret) {
+		if (hp)
+			status |= SND_JACK_HEADPHONE;
+
+		if (mic)
+			status |= SND_JACK_MICROPHONE;
+
+		snd_soc_jack_report(rt274->jack, status, SND_JACK_MICROPHONE | SND_JACK_HEADPHONE);
+	}
 
 	return 0;
 }
@@ -984,6 +999,9 @@ static int rt274_probe(struct snd_soc_component *component)
 	INIT_DELAYED_WORK(&rt274->jack_detect_work, rt274_jack_detect_work);
 
 	if (rt274->i2c->irq) {
+		/* irq will be enabled in rt274_mic_detect */
+		irq_set_status_flags(rt274->i2c->irq, IRQ_NOAUTOEN);
+
 		ret = request_threaded_irq(rt274->i2c->irq, NULL, rt274_irq,
 					   IRQF_TRIGGER_HIGH | IRQF_ONESHOT, "rt274", rt274);
 		if (ret) {
-- 
2.25.1

