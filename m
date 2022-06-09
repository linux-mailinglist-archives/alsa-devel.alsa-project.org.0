Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A26544DDC
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 15:39:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7297A1B02;
	Thu,  9 Jun 2022 15:38:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7297A1B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654781953;
	bh=poLrk9IFRHmbL3RulVGopYSkf6CWGhy+nxAHKExBmyo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JeaZKHUzyr9AQd3CHNz+4WfrY5jGD9MjCH6cbQ5P5XETDLgO0QGnX6mNEdTlLHJ34
	 TePoBk3iBhuW0wW97x07/lYUHSE+gr5xiae8hoQ2gAA8NZnFiPyeCBB9dyj/sAdANs
	 4LM/a8+iV1i6whxP29fZkZusUbGzD8tshYapr4Xo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD2B6F8055A;
	Thu,  9 Jun 2022 15:36:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9561F80542; Thu,  9 Jun 2022 15:36:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F408DF8053A
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 15:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F408DF8053A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SaOzQo5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654781758; x=1686317758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=poLrk9IFRHmbL3RulVGopYSkf6CWGhy+nxAHKExBmyo=;
 b=SaOzQo5s+iHOgNBewAe6XSmorhozSc91Xk9DTXiwgcJhp5tnPswINFZm
 YDpwgXik/IlkubknwKCjOmz9rAjYC/dxoWfKDfzSf13Q9QgBWWYZq1Zz4
 fTL5Qv0ElV8FGAhYzOoMvNgLAf0YanChdRqQE6CB0mhUNQ3rqrNf43hb8
 CK7+6qT8qK2wls3qGO1WSKH3JAd94O11NOylkdUodnrc4j6Xdm1j1TUSR
 X/US4V8UbwfVslmdpUck2wbI61ybypy0FbX5niFjgaTh3Sb2/GBRquh25
 3U+jG9uAD4DGWAar94YDcA85T+vm80BPZWolV3p49fpMRt8jwNfhfIXgY Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266061415"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="266061415"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 06:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="683966176"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2022 06:35:54 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 08/11] ASoC: codecs: rt286: Enable irq only when needed
Date: Thu,  9 Jun 2022 15:35:38 +0200
Message-Id: <20220609133541.3984886-9-amadeuszx.slawinski@linux.intel.com>
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
 sound/soc/codecs/rt286.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index 02a41c915776..6384b4cb9eaf 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -16,6 +16,7 @@
 #include <linux/spi/spi.h>
 #include <linux/dmi.h>
 #include <linux/acpi.h>
+#include <linux/irq.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -324,11 +325,14 @@ static int rt286_mic_detect(struct snd_soc_component *component,
 		if (rt286->jack->status & SND_JACK_HEADPHONE)
 			snd_soc_dapm_force_enable_pin(dapm, "LDO1");
 		regmap_update_bits(rt286->regmap, RT286_IRQ_CTRL, 0x2, 0x2);
+		enable_irq(rt286->i2c->irq);
+
 		/* Send an initial empty report */
 		snd_soc_jack_report(rt286->jack, rt286->jack->status,
 			SND_JACK_MICROPHONE | SND_JACK_HEADPHONE);
 	} else {
 		/* disable IRQ */
+		disable_irq(rt286->i2c->irq);
 		regmap_update_bits(rt286->regmap, RT286_IRQ_CTRL, 0x2, 0x0);
 		snd_soc_dapm_disable_pin(dapm, "LDO1");
 	}
@@ -951,6 +955,9 @@ static int rt286_probe(struct snd_soc_component *component)
 	INIT_DELAYED_WORK(&rt286->jack_detect_work, rt286_jack_detect_work);
 
 	if (rt286->i2c->irq) {
+		/* irq will be enabled in rt286_mic_detect */
+		irq_set_status_flags(rt286->i2c->irq, IRQ_NOAUTOEN);
+
 		ret = request_threaded_irq(rt286->i2c->irq, NULL, rt286_irq,
 					   IRQF_TRIGGER_HIGH | IRQF_ONESHOT, "rt286", rt286);
 		if (ret) {
-- 
2.25.1

